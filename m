Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3EB989A795
	for <lists+alsa-devel@lfdr.de>; Sat,  6 Apr 2024 01:21:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C2B92D62;
	Sat,  6 Apr 2024 01:21:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C2B92D62
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712359271;
	bh=WFv3K3AVVst1IxY787Ht1CDI+a4URo9vofeIU0fesY8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qMYD94kcuTBlxOMWiCQQtN+LDEeoN5Q8yXpObrzxiBsUmf+X/ebAck/mlR0HM7ai2
	 +0+ej90z7hBhP+fw7RKgVS46q+w6/ntGBXJlIKWD7nYXU52t+W0Tjtq0RMRMczjtw0
	 2+gC7IXaURxpADizo8TfXVGkzYsgLQHxE+Ivs248=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 880D9F805D9; Sat,  6 Apr 2024 01:20:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7197EF805C9;
	Sat,  6 Apr 2024 01:20:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 51E13F80236; Sat,  6 Apr 2024 01:20:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 983F0F8015B
	for <alsa-devel@alsa-project.org>; Sat,  6 Apr 2024 01:20:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 983F0F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=eqcSDBN2
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id BDA24CE2642;
	Fri,  5 Apr 2024 23:20:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22278C433C7;
	Fri,  5 Apr 2024 23:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712359202;
	bh=WFv3K3AVVst1IxY787Ht1CDI+a4URo9vofeIU0fesY8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=eqcSDBN2EGwvJYBRmeR1UTLWP/yiRWDKTvITpMsEDRQmUph5RAPwenRVWqmh7J0GH
	 3l38jZdTj1CLQiSb97OYOtGYrFcMQZl5uH0vtU+AFsK0TZfZeySPLnaxuDAEnJgf2Z
	 NOKdppWFod0+mzd4Ov3i2nXNvwPuHfVfEWMBE0gwmxXzPPcEjMmp/UPr/ZF+R1j70+
	 uLQwOq/uor3nRpcnqolnlgR4Mg/ck8R5k96H/uWqlvOMwX+czL+/EYJ613qhhnag3N
	 ojoohMOaptHUryR3JIPuXrFxBWyyH1CX9IpAsRyjMej0pPvbcaBbrUQcVG+DVKxTSI
	 yf0w8502F65UA==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de
In-Reply-To: <20240404185448.136157-1-pierre-louis.bossart@linux.intel.com>
References: <20240404185448.136157-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/4] ASoC: SOF: Intel: extend hda-loader for BTP/BRA
 transfers
Message-Id: <171235920085.198289.10612737509087722960.b4-ty@kernel.org>
Date: Sat, 06 Apr 2024 00:20:00 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev
Message-ID-Hash: 5ZQAZ52QTAM7VL6BNL5AIU4CHE5ZPTXU
X-Message-ID-Hash: 5ZQAZ52QTAM7VL6BNL5AIU4CHE5ZPTXU
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5ZQAZ52QTAM7VL6BNL5AIU4CHE5ZPTXU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 04 Apr 2024 13:54:44 -0500, Pierre-Louis Bossart wrote:
> For SoundWire BPT/BRA transfers, we need to reuse the HDaudio DMA
> infrastructure. This patchset extends the code used by the code
> loader. The BPT/BRA functionality will be provided in a follow-up
> contribution.
> 
> Pierre-Louis Bossart (4):
>   ASoC: SOF: Intel: hda-loader: add flag to tag ICCMAX stream
>   ASoC: SOF: Intel: hda-loader: change signature of code loader helpers
>   ASoC: SOF: Intel: don't ignore IOC interrupts for non-audio transfers
>   ASoC: SOF: Intel: hda-stream: clarify comment
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: SOF: Intel: hda-loader: add flag to tag ICCMAX stream
      commit: e9ae5adce99e27ef29ea9ccb01afe260bf1c1408
[2/4] ASoC: SOF: Intel: hda-loader: change signature of code loader helpers
      commit: 6cbf086143cf9674c7f029e1cf435c65a537066a
[3/4] ASoC: SOF: Intel: don't ignore IOC interrupts for non-audio transfers
      commit: d5263dbbd8af026159b16a08a94bedfe51b5f67b
[4/4] ASoC: SOF: Intel: hda-stream: clarify comment
      commit: 716778b3d71fe1c799a4f5cf84faf4979f80b267

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

