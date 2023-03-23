Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03AC46C69F2
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Mar 2023 14:51:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86F63ED5;
	Thu, 23 Mar 2023 14:50:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86F63ED5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679579506;
	bh=T4lJix39AUgNhUucqrDmDhh1MHwVpu3ucBlsDSHRGiI=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KpxTevTAtH3huCVkTPJhaG3O+YmzEJsS6WJCeI/TAF/OPn6AV2pdX1r2Srlv11vbW
	 iOnFvNk8TquGkGKLgU1Aq1X10RSTlMmgQuMoj0vNL8CFUQ7efraGG+Uv7RH4FBwrB5
	 cmuzPO5z6FoeDH6b/+3mX+KKayYjR3hKAlGMtRbw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D7FBF80520;
	Thu, 23 Mar 2023 14:50:09 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3C3BAF802E8; Thu, 23 Mar 2023 14:50:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F0430F8027B
	for <alsa-devel@alsa-project.org>; Thu, 23 Mar 2023 14:49:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0430F8027B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=fDoTgyYT
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 60E286270A;
	Thu, 23 Mar 2023 13:49:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E45CC4339B;
	Thu, 23 Mar 2023 13:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679579393;
	bh=T4lJix39AUgNhUucqrDmDhh1MHwVpu3ucBlsDSHRGiI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=fDoTgyYTQn9i2Ae2EVZfJnRUuebxlkf+/7sKrO1wmSXZT4m+E4XkSu+NQubANarjx
	 +sxXYTz7hW5YpQPNXskSsSYBTaqVvK4jy3QwUMgabWxDB3dE3uYdKteapEeNQDeZco
	 GLW3nPbQtMmCMC7ExGSF3wI09YoOYEIY8glOv2N89j8GJREt7XwUpKGJ7h6tJnUd3N
	 /RBclVFy9cyCJkTSdrEtPwkqNgHBLwVcWXJDn+cHQTNZVOfwb4tTHYr7fwoLFRzp3V
	 21CHMyLr6sM5f2odTa8pE96tKSb8bvEn1txo1vEZLAAR6czX6sLuS3C6oeSOt2PP0Y
	 2x7GFow78hD8g==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20230321134919.25844-1-peter.ujfalusi@linux.intel.com>
References: <20230321134919.25844-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: ipc4-control: Return on error in
 sof_ipc4_widget_kcontrol_setup()
Message-Id: <167957939191.26985.13455051100847092987.b4-ty@kernel.org>
Date: Thu, 23 Mar 2023 13:49:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bd1bf
Message-ID-Hash: N7UBMFZ4QMVDFAGPUDVQGKP4LDZCZKTW
X-Message-ID-Hash: N7UBMFZ4QMVDFAGPUDVQGKP4LDZCZKTW
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 error27@gmail.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/N7UBMFZ4QMVDFAGPUDVQGKP4LDZCZKTW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 21 Mar 2023 15:49:19 +0200, Peter Ujfalusi wrote:
> The patch adding the bytes control support moved the error check outside
> of the list_for_each_entry() which will cause issues when we will have
> support for multiple controls per widgets.
> 
> Restore the original logic and return on the first error with the error
> code.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: ipc4-control: Return on error in sof_ipc4_widget_kcontrol_setup()
      commit: 1c12e032cc43256d75fdd22e60a7df85e8df4549

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

