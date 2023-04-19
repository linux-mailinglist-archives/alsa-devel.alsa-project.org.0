Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 474DD6E7C79
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Apr 2023 16:25:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA4CCEC4;
	Wed, 19 Apr 2023 16:24:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA4CCEC4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681914315;
	bh=Y7NtdRvmYffAP0FrGkf+Pv8B5hj7E6uae/PQvl6MaS0=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZaJbP52VYAjWTmiTSg4scxbh22l0aH0GoNDYC3a5hxVzDbowu5Il1W9ceJif9jcTA
	 RViu2McNCxMu2wdISKp8ul6WbQjG1zpVY59sRrsi/dtXayyxtD9kNb/AN9mNGTCpJO
	 c+otfyn270MZvT0GJ3wSQra/wQu+pQ/3nETboMqY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7843BF804FC;
	Wed, 19 Apr 2023 16:23:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A013F80155; Wed, 19 Apr 2023 16:23:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8B828F800F8
	for <alsa-devel@alsa-project.org>; Wed, 19 Apr 2023 16:23:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B828F800F8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=WZkty0bQ
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7454F63FC1;
	Wed, 19 Apr 2023 14:23:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ADC8C4339C;
	Wed, 19 Apr 2023 14:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681914203;
	bh=Y7NtdRvmYffAP0FrGkf+Pv8B5hj7E6uae/PQvl6MaS0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=WZkty0bQqzMKfoyrRccbSKpbRiEzNS5m3vNdN9kjx4OK+ujf8Dr7zDBRIDEJX7l+A
	 /oaqUG6MTOm2Cb3rB6COeQ69GRfdloleSwXfcmCkf5mLvVTqyXGlK0PoJLGmR9UayM
	 R/TStqm3LXaUJoQ9NHiSPsVlhvt09qBj1cC/v6SEAirutEftAoikqibiLJPm/aO3Ph
	 OCpz5Yt0apuLBnaqx2riz2GDI2PWh1rJvxYYR7QZuBBnecaJtS9HuDDdpCOGF9zyXk
	 ZotnIDTRuRHkHr7lcJJPZl4fvZI49fsnsqA1KBKvAZdJOBaSdwYH6iCC0hBoydNMoY
	 /zxpAsncbTrbQ==
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
 Nikita Zhandarovich <n.zhandarovich@fintech.ru>
In-Reply-To: <20230417133242.53339-1-n.zhandarovich@fintech.ru>
References: <20230417133242.53339-1-n.zhandarovich@fintech.ru>
Subject: Re: [PATCH] ASoC: fsl_asrc_dma: fix potential null-ptr-deref
Message-Id: <168191420102.83860.17076301173895914430.b4-ty@kernel.org>
Date: Wed, 19 Apr 2023 15:23:21 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-00303
Message-ID-Hash: GHZWZTI5AHCFMZTZEBCAJ5EN56GFBXI5
X-Message-ID-Hash: GHZWZTI5AHCFMZTZEBCAJ5EN56GFBXI5
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 lvc-project@linuxtesting.org, Natalia Petrova <n.petrova@fintech.ru>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GHZWZTI5AHCFMZTZEBCAJ5EN56GFBXI5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 17 Apr 2023 06:32:42 -0700, Nikita Zhandarovich wrote:
> dma_request_slave_channel() may return NULL which will lead to
> NULL pointer dereference error in 'tmp_chan->private'.
> 
> Correct this behaviour by, first, switching from deprecated function
> dma_request_slave_channel() to dma_request_chan(). Secondly, enable
> sanity check for the resuling value of dma_request_chan().
> Also, fix description that follows the enacted changes and that
> concerns the use of dma_request_slave_channel().
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_asrc_dma: fix potential null-ptr-deref
      commit: 86a24e99c97234f87d9f70b528a691150e145197

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

