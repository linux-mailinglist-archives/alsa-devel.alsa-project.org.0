Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 065D8722DAE
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Jun 2023 19:31:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B84A823;
	Mon,  5 Jun 2023 19:30:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B84A823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685986301;
	bh=8fr3qa00GOsjuxbEPlfwIPeLmLPQt+VVpRdMD/o6eMU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eiz/ehH4bbmuxa1X9mCakAfK5gusBVUJYXXN4zw5Js2qP/i3eblpv4lVcyy2Q9Bnk
	 PTSFrEgSx4O4lNrz+Kqgep0sYL597uj3gyfwQ/MC1hRx7zaRIVqHUozhuW4wDR0VQx
	 iJu/0UqOKz9SlPvUxf4GJBapytJwtZFwQrjzRNo4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CF1CEF800ED; Mon,  5 Jun 2023 19:30:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D5DFF8016C;
	Mon,  5 Jun 2023 19:30:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B5B94F80254; Mon,  5 Jun 2023 19:30:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 84ADBF80155
	for <alsa-devel@alsa-project.org>; Mon,  5 Jun 2023 19:30:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84ADBF80155
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Vy8+4BMf
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B0366628AD;
	Mon,  5 Jun 2023 17:30:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43892C4339E;
	Mon,  5 Jun 2023 17:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685986236;
	bh=8fr3qa00GOsjuxbEPlfwIPeLmLPQt+VVpRdMD/o6eMU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Vy8+4BMfOOj+OV52fa+lSrWTOXgIEk/glYR1lDcY2DLiFW9MoFCgHYayxRI2tcuCA
	 0m7Sy/p7MzdZddxtcbPsYTQspxY9mIsxeubXxDtRQ0PCvVoRpqqNVeCO9rTfw7YZXk
	 ZzbGL9IvJOGKGX+7XpRKo+1XICg7nDYSign/cAhtyz0KPt5b7ctjKXSp9rdA105LYX
	 lM+jPN98cC9qwcONxNQ5m79drMCyVGIPO9II7XmznC6HJAMjW8mHAa4TYgQvOI8d4g
	 QWg3qr7uFXrNseiMJpw/2resHDEC+pnqR/WGhFLBhd57q/Ks5u1xb4ZGzXizbqoAHE
	 +lP+Eq7azEkFw==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: tiwai@suse.de, Vinod Koul <vkoul@kernel.org>
In-Reply-To: <20230602205620.310879-1-pierre-louis.bossart@linux.intel.com>
References: <20230602205620.310879-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/9] ASoC: SOF: Intel: LunarLake preparation patches
Message-Id: <168598623499.103672.2858781216173017006.b4-ty@kernel.org>
Date: Mon, 05 Jun 2023 18:30:34 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: RMBA3RGACCG2JDKLUHFRCVKDWZ5WPF7J
X-Message-ID-Hash: RMBA3RGACCG2JDKLUHFRCVKDWZ5WPF7J
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RMBA3RGACCG2JDKLUHFRCVKDWZ5WPF7J/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 02 Jun 2023 15:56:11 -0500, Pierre-Louis Bossart wrote:
> This patchset adds the changes required for the hda-dai extension to
> deal with SSSP/DMIC/SoundWire starting with LunarLake, as well as the
> new TLV IPC to provide the DMA stream_tag to the DSP firmware.
> 
> LunarLake support for SSP/DMIC is ready but is gated by the patch
> "ASoC: SOF: Intel: shim: add enum for ACE 2.0 IP used in LunarLake"
> currently only present in the SoundWire tree.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/9] ASoC: SOF: Intel: hda-dai: add error checks to prevent static analysis warnings
      commit: c4be6024d51d3930459a61d4c91990f20264c60b
[2/9] ASoC: SOF: Intel: hda-dai: add codec_dai_set_stream callback
      commit: 2205c63d8d216b44127560cc564b2098843553e2
[3/9] ASoC: SOF: Intel: hda-dai: add calc_stream_format callback
      commit: 767cda3fdac0faec84dc3fd654bd9d09b55eef40
[4/9] ASoC: SOF: Intel: hda-dai: add get_hlink callback
      commit: d1bf58474d17a77a26bc27ff85a4e5c4fefc0934
[5/9] ASoC: SOF: ipc4-topology: extend ALH-specific data structure
      commit: e186e1f237c1e2447a83059d48439ffcefbf5a93
[6/9] ASoC: SOF: ipc4-topology: introduce DMA config TLV
      commit: 116bc1503652c72541d63f67c74b2ff1e4532f03
[7/9] ASoC: SOF: ipc4-topology: add DMA config TLV to IPC data
      commit: a0659f81c348946383526b764ad66d9900ea2cb9
[8/9] ASoC: SOF: Intel: mtl: prepare for code reuse
      commit: 730025cffedc6b8887d72031795796ac6d9947c3
[9/9] ASoC: SOF: Intel: hda: add helper to extract SoundWire link count
      commit: d3e7c32b7d5c7132edca6d84499ec8ac2f060aa7

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

