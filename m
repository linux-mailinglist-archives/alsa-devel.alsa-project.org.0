Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB0C73BB1B
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Jun 2023 17:08:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D43B74C;
	Fri, 23 Jun 2023 17:08:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D43B74C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687532935;
	bh=zEV2RKDHizUuqsg/GKSamDV5J/oB9i1p+vG1rVTtzt8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gmyN52hRA8XnK7P1ed/Oyyg4s0RoCwkWaKDj3GLX0ioljksho7uJM3Vl/wE7sWPvd
	 Hz1z6Ci6TIE+J1nx9172bLtmSP4EI5WbnTd3fTCpt1lHPzssn5anYJ7xiH5chk6YnR
	 ONZPhdC7b7iosxSCgybkEU8ky0POYdoa9qMb1XFA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E015DF80535; Fri, 23 Jun 2023 17:08:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A28FDF80132;
	Fri, 23 Jun 2023 17:08:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0FC87F80141; Fri, 23 Jun 2023 17:08:01 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 90481F80130
	for <alsa-devel@alsa-project.org>; Fri, 23 Jun 2023 17:07:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90481F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=IchY5XGx
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5F60461A8E;
	Fri, 23 Jun 2023 15:07:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2349C433CA;
	Fri, 23 Jun 2023 15:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687532872;
	bh=zEV2RKDHizUuqsg/GKSamDV5J/oB9i1p+vG1rVTtzt8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=IchY5XGxI/2DQEDIkFjGD5WpWJK1obsXG6/iTyEfyBLwuuKkEQeeGfdfb8wnj5bmL
	 SAn0fRhmzBpXa7qMK8oUX44vM05Xai2FKeI5e9eW36qR4aXG6Nh0iWyYsTc9kIMolf
	 4ffVLS4VMFwlgQJK46uEhpTLTt1KimvOhbUMTLWPdmgEqr3NakWZlAs3XDF4mLfp4L
	 zh7n0zozS2UdBDp8YwYL7pZRhwExrDjJkbBIEOJbmdyadK07kPSGjpBXdx1DjYqSTE
	 eCohysBtUFbOi4yrqWd0LpySMMUL/wjkbRzIR7mRyCi/mcqP7R3BcninozTcvN0fYo
	 JFCGdVTkVO+/g==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Arun Gopal Kondaveeti <arungopal.kondaveeti@amd.com>
Cc: Vijendar.Mukunda@amd.com, Basavaraj.Hiregoudar@amd.com,
 sunil-kumar.dommati@amd.com, venkataprasad.potturu@amd.com,
 syed.sabakareem@amd.com, mario.limonciello@amd.com,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Syed Saba Kareem <Syed.SabaKareem@amd.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 open list <linux-kernel@vger.kernel.org>
In-Reply-To: <20230623214150.4058721-1-arungopal.kondaveeti@amd.com>
References: <20230623214150.4058721-1-arungopal.kondaveeti@amd.com>
Subject: Re: [PATCH v2] ASoC: amd: update pm_runtime enable sequence
Message-Id: <168753286853.678414.15580009562650782179.b4-ty@kernel.org>
Date: Fri, 23 Jun 2023 16:07:48 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-c6835
Message-ID-Hash: 6ZCIMOSFQTSTUYIT5FCZJW3DKDHIDAZN
X-Message-ID-Hash: 6ZCIMOSFQTSTUYIT5FCZJW3DKDHIDAZN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6ZCIMOSFQTSTUYIT5FCZJW3DKDHIDAZN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, 24 Jun 2023 03:11:40 +0530, Arun Gopal Kondaveeti wrote:
> pm_runtime_allow() is not needed for ACP child platform devices.
> Replace pm_runtime_allow() with pm_runtime_mark_last_busy()
> & pm_runtime_set_active() in pm_runtime enable sequence for
> ACP child platform drivers.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: update pm_runtime enable sequence
      commit: 154756319cc6f8b8b86241da02da6a8fcc6abd1f

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

