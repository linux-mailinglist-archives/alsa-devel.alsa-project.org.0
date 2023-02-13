Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 019F1694C58
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Feb 2023 17:21:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 544FC852;
	Mon, 13 Feb 2023 17:20:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 544FC852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676305283;
	bh=rHZQyYd1q7ceVtb87uSYWZwLEeTojaFPZF1v1Y82AuE=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=q+aK8a2t4DZfS+e0mXGfFtkqzMT4pOh2SZYjjUQC9C1/SWUCDMFqv8I1JG4bFPNpW
	 qjCBkv6ugJsk4YA+ek5FENrtie43cV2atFzvYC+4HTpC9ivrcEHuFiW96GcCPVNv7J
	 viI2PDmSJ7wo8/S2ZOPYx++o0IkBFG+IpreqB+PQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F071F80553;
	Mon, 13 Feb 2023 17:19:02 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 65603F8052D; Mon, 13 Feb 2023 17:18:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 51372F80051
	for <alsa-devel@alsa-project.org>; Mon, 13 Feb 2023 17:18:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51372F80051
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=HK+PgD/Y
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EE839611D5;
	Mon, 13 Feb 2023 16:18:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1348CC4339B;
	Mon, 13 Feb 2023 16:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676305132;
	bh=rHZQyYd1q7ceVtb87uSYWZwLEeTojaFPZF1v1Y82AuE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=HK+PgD/YFlXDOJYpXWJPIisORcZGdoyG9M+YD+7Ucgb377TyVp39+xTMZ8EdrHnNb
	 slWkiqkjKU+oFfmGBtX/vYsAmGyXCSt1ZbVMB4vBPNg89sX+9Myr+o2XXstyS68x6Z
	 D+nm4Yde0P40wUt4MTPYSitCpUGGSsAklFRatwmoUlssVKyYqBPbbxtri+8nPesLId
	 WA2HsUpeLsElJb5jGzKT8iGg2SIpnBI++Dwosy9kXB6BbHtv/7cC4mWSy1MAuDgYe4
	 4/ZnVbHyah5oM9smiczAhIqUy754Q1SRQerG3vqUnOjWi+SrAvgFxjB9nuSri/gxHV
	 nA3JIYcr6bfrw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 krzysztof.kozlowski@linaro.org, rf@opensource.cirrus.com,
 pierre-louis.bossart@linux.intel.com, ckeepax@opensource.cirrus.com,
 shumingf@realtek.com, herve.codina@bootlin.com, james.schulman@cirrus.com,
 doug@schmorgal.com, yang.lee@linux.alibaba.com, trix@redhat.com,
 colin.i.king@gmail.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, wangweidong.a@awinic.com
In-Reply-To: <20230213093649.22928-1-wangweidong.a@awinic.com>
References: <20230213093649.22928-1-wangweidong.a@awinic.com>
Subject: Re: [PATCH 0/3][next] ASoC: codecs: Modify error implicit
 declaration of function and misspelling
Message-Id: <167630512772.2770751.214951401916390841.b4-ty@kernel.org>
Date: Mon, 13 Feb 2023 16:18:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.0
Message-ID-Hash: HDKFZ4B5W3DNJPNS5TKWMCQMDN2BX7VT
X-Message-ID-Hash: HDKFZ4B5W3DNJPNS5TKWMCQMDN2BX7VT
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: liweilei@awinic.com, zhaolei@awinic.com, yijiangtao@awinic.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HDKFZ4B5W3DNJPNS5TKWMCQMDN2BX7VT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 13 Feb 2023 17:36:46 +0800, wangweidong.a@awinic.com wrote:
> Change the function name aw88395_plack_event to aw88395_playback_event
> Change hdrlen to hdr_len
> Add select GPIOLIB to the sound/soc/codecs/Kconfig file
> 
> Weidong Wang (3):
>   ASoC: codecs: Fixed a spelling error in the function name
>   ASoC: codecs: Modify the log print statement
>   ASoC: codecs: Modify error: implicit declaration of  function
>     'gpiod_set_value_cansleep'
> 
> [...]

Applied to

   broonie/sound.git for-next

Thanks!

[1/3] ASoC: codecs: Fixed a spelling error in the function name
      commit: 27db41a1f73ad18ed6540e1f8a7083422e5b53d6
[2/3] ASoC: codecs: Modify the log print statement
      commit: 14d5d454547adae64a76731c90c37fe33f7d1d44
[3/3] ASoC: codecs: Modify error implicit declaration of function 'gpiod_set_value_cansleep'
      commit: 4680716d6a33f50c96eb7ce6ae9cb868baa04438

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

