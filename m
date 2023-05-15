Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF63703180
	for <lists+alsa-devel@lfdr.de>; Mon, 15 May 2023 17:24:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB0A9839;
	Mon, 15 May 2023 17:23:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB0A9839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684164286;
	bh=TcN2AL+qmk0h6JhI01YspCssMQyo/hwhkvTNLA8FnAs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Kz7VNXc1GOoqgyZUITUbLjkvW/bIksZZVNcWShuhNCIg6E/qwJa42qQf02h3eGKcd
	 kmzF7uaEEDu6MzcaLWcPMQSbtaqrX09RzZhV6oTRMf9SkWMip+cqA6EbxkrZ0AQCsu
	 lbJn+ZqwrjoqvtTsQdiz2zVC4KjuWqXTXUWjPJIQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2C039F805BF; Mon, 15 May 2023 17:22:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 80FD6F805BA;
	Mon, 15 May 2023 17:22:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E153BF80571; Mon, 15 May 2023 17:22:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0345CF8016D
	for <alsa-devel@alsa-project.org>; Mon, 15 May 2023 17:22:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0345CF8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=m1ePoWjQ
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4C5B76261F;
	Mon, 15 May 2023 15:22:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03184C433EF;
	Mon, 15 May 2023 15:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684164122;
	bh=TcN2AL+qmk0h6JhI01YspCssMQyo/hwhkvTNLA8FnAs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=m1ePoWjQzShxP09Nhse3EcTzb/Nk7SMtJstOwKXNNG3hZVrSlcWSDR24Y43Y6unLI
	 BpKf5NkR6XS2Ll8l2uLqytjK5dlso8bapZriTJk77GBy+Zbb89q0KAJ7TG4rJe36rF
	 YnHQgLKYvaoj2lCdjIyoyGMNwS8LGOGRuiyyNOsywzjR5IGX8dvKbwJ0Q5KHL9rJTL
	 6muNssSViFcbN7t+N5/y8VAk2vMcBhFahVawRf2S7cu+T55KGoEfVkVr5HIQVsgtYB
	 YkmcyVghVemoYCB6iStASm8e6+nTzlNqMLO7ncoUjm03UobrP5YYToCgKwt4EhF/m0
	 Sz61eW4Op0Qvw==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: tiwai@suse.de, vkoul@kernel.org
In-Reply-To: <20230512181702.117483-1-pierre-louis.bossart@linux.intel.com>
References: <20230512181702.117483-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/9] ASoC: SOF: Intel: hda-dai: prepare LNL support
Message-Id: <168416412179.413889.18112422384482260181.b4-ty@kernel.org>
Date: Tue, 16 May 2023 00:22:01 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: GI64CPM5CFRCJCPR3YPKI4QRMXCBURGK
X-Message-ID-Hash: GI64CPM5CFRCJCPR3YPKI4QRMXCBURGK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GI64CPM5CFRCJCPR3YPKI4QRMXCBURGK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 12 May 2023 13:16:53 -0500, Pierre-Louis Bossart wrote:
> The HDAudio support has not changed much since CometLake/2019: the
> code was reshuffled for IPC4 support and we used hdac_hda for external
> and Display Audio codec, but the hda-dai code was only used for
> HDAudio codecs.
> 
> In the LunarLake architecture, all endpoints (HDaudio, SSP, DMIC,
> SoundWire) are handled with the HDaudio DMA, which requires us to
> revisit the definitions of HDA_LINK, and remove the mutual exclusion
> between NOCODEC and HDA_LINK: we do want the ability to test SSP/DMIC
> in NOCODEC mode even with an HDA DMA.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/9] ASoC: SOF: Intel: hda-dai: simplify .prepare callback
      commit: 3886518fdb6d4c3f5a84648474a857d63749af78
[2/9] ASoC: SOF: Intel: hda-dai: remove use of cpu_dai->component drvdata
      commit: de8e2d5d8024670eaa35ae4c9b9efb76ca6cc8de
[3/9] ASoC: SOF: Intel: fix DAI number mismatch
      commit: 45f3c2f83a089a1f21ea089e07e3118b87116cab
[4/9] ASoC: SOF: Intel: clarify initialization when HDA_AUDIO_CODEC is not used
      commit: fb0bdfe2a056a73cd221a9a415ccafc71d814dc2
[5/9] ASoC: SOF: Intel: Kconfig: move selection of PROBE_WORK_QUEUE
      commit: 2dddff71e9ae973e46287c4e5a7d9206faa6c5e8
[6/9] ASoC: SOF: Intel: hda-dai: move hda_dai_prepare() code
      commit: caf7ad845e90f8ac29d7342bea6d9f1fc392c953
[7/9] ASoC: SOF: Intel: hda-dai: mark functions as __maybe_unused
      commit: b7b71b8cbd48b435e7e70a27f96b43a8270ec675
[8/9] ASoC: SOF: Intel: hda-dai: use HDA_LINK instead of HDA_AUDIO_CODEC
      commit: 746a78c2864ca90e4a8783838adf6d765f6282da
[9/9] ASoC: SOF: Intel: remove mutual exclusion between NOCODEC and HDA_LINK
      commit: fdecd4aaf80af23f946ad97f6fb90c1f553fcdcc

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

