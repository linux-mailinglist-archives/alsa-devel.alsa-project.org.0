Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CCB7440E1
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Jun 2023 19:08:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E0BE826;
	Fri, 30 Jun 2023 19:08:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E0BE826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688144930;
	bh=U1TJ5FLNUaKTvdst4pVsT+ci60Uh+zUzDQUuUW43oHs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GGcvvMGl0k+KLGhuEQ0rRHJeUfl/9zdtWqApx5kKvfeq86GBbEmyrdCgCeEW9oMfk
	 37QDU24grOORAtg4yDiVJGu535HU892BoeNhfKQ76+RFNWj6MnUyluSsup/YNrFrCf
	 +RbKB1ByWzbtIKYJxf7RUhC9BRNYElPxzrWd3xvg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A3BABF80212; Fri, 30 Jun 2023 19:07:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F0235F800E3;
	Fri, 30 Jun 2023 19:07:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E45CEF80431; Fri, 30 Jun 2023 19:07:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 903DEF80124;
	Fri, 30 Jun 2023 19:07:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 903DEF80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=de8bYXYi
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2E451617BA;
	Fri, 30 Jun 2023 17:07:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20506C433C8;
	Fri, 30 Jun 2023 17:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688144863;
	bh=U1TJ5FLNUaKTvdst4pVsT+ci60Uh+zUzDQUuUW43oHs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=de8bYXYiV5/q10RfBenKwLSVpc2wDUzUCQRKL5F0fh+iAZMdnRBCPOMvlpZ4t6nZw
	 T3VOg5Owc1VSpYSW7fI/EIFCmUoJWGmKLybsgn4QxhLP9ORPHIAbXiuTKFEQA/h/O0
	 mCNaYFPdI1vEzji1c634qyCtxckD/o9zIalBYfGeHO1wVLf3WQlVlaF1VKGdPLFyTn
	 vhlJWDnTsDU++yzThy3B42JMKofvULXaH3mGJ0whwtazKZsyEHvErCiNxey8Gt+WQK
	 JK19q0rafqYOdTBa939MgK9OZOS7Yt0nTpFCR4eTZH+wAue+t91xQycjb3G/5UQk/M
	 saZ5kIbbeQ7Tg==
From: Mark Brown <broonie@kernel.org>
To: Mastan Katragadda <Mastan.Katragadda@amd.com>
Cc: alsa-devel@alsa-project.org, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, vijendar.mukunda@amd.com,
 Arungopal.kondaveeti@amd.com, vsujithkumar.reddy@amd.com,
 venkataprasad.potturu@amd.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
 "moderated list:SOUND - SOUND OPEN FIRMWARE (SOF) DRIVERS"
 <sound-open-firmware@alsa-project.org>,
 open list <linux-kernel@vger.kernel.org>
In-Reply-To: <20230630070544.2167421-1-Mastan.Katragadda@amd.com>
References: <20230630070544.2167421-1-Mastan.Katragadda@amd.com>
Subject: Re: (subset) [PATCH 1/2] ASoC: SOF: amd: add revision check for
 sending sha dma completion command
Message-Id: <168814485881.50974.4096249135530047142.b4-ty@kernel.org>
Date: Fri, 30 Jun 2023 18:07:38 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-c6835
Message-ID-Hash: 7W7KZTTUBFQPJDTEM36THUG2M2BISIHF
X-Message-ID-Hash: 7W7KZTTUBFQPJDTEM36THUG2M2BISIHF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7W7KZTTUBFQPJDTEM36THUG2M2BISIHF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 30 Jun 2023 12:35:42 +0530, Mastan Katragadda wrote:
> ACP driver should send SHA DMA completion command to PSP module for RN
> platform only.
> Add a revision check for RN platform.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: SOF: amd: add revision check for sending sha dma completion command
      commit: b1db244c716fe300e36428aeb0874913d2e0a91d

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

