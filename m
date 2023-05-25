Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D24710EE0
	for <lists+alsa-devel@lfdr.de>; Thu, 25 May 2023 16:59:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 818AF820;
	Thu, 25 May 2023 16:58:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 818AF820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685026742;
	bh=ROx+7YJWKbVUrs5gnrHp1c+HnwHD4TIAX3RQotXIbUo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=O7Qih+4tE8M0ujrj88gr1PUmar/g4UnE4MerNmR90bG9DN3wAFwOwNAK7PFgoV6CP
	 Wp2TaGW3ia7Gna5sGbMSTBvKg802mA59ChNruRxbmOv3+ZBSqhmG7qKpJCjLmqDl4b
	 AB8X8BFU72zueSLtPOjwVyzleaAdb0e9lwGLXEAQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EB936F80551; Thu, 25 May 2023 16:57:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5EEEBF8053D;
	Thu, 25 May 2023 16:57:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 45E59F80249; Thu, 25 May 2023 16:57:16 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 81828F80053
	for <alsa-devel@alsa-project.org>; Thu, 25 May 2023 16:57:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81828F80053
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=iYdXNG7p
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 149B46467A;
	Thu, 25 May 2023 14:57:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 632B6C4339C;
	Thu, 25 May 2023 14:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685026626;
	bh=ROx+7YJWKbVUrs5gnrHp1c+HnwHD4TIAX3RQotXIbUo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=iYdXNG7p26QZWg9Dc6Nxxv98b14768LgwY2xZ/WKgXzCvS2rRaNmWPXyze7HIL36a
	 R+FpYliwFfetlNKIvoL5GS7jSSgEayMl4fCZXZ7K3sYlPzZNz6aH4bG54zm4Xn9ZzL
	 rw9ql+R1JJpj92WsqijebjKxIMShKaTpNxni0zphTZ9AN0HrvlRD4E29+4iTT+P3+T
	 hP5hpdO0+ET0cUPV7yv+aK67yBNhHiAWkO8cvAEv5jbeGzo9ibJC55qJWHer7XsW9z
	 0z/zuhWENWMskh+la/slQTmH3pCgjCovvmeGo7N9jwX4IlV/JGsbSkmtGGnXQ8IIeE
	 EnyKaDOnFltnQ==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: pierre-louis.bossart@linux.intel.com, u.kleine-koenig@pengutronix.de,
 james.schulman@cirrus.com, rf@opensource.cirrus.com,
 vkarpovi@opensource.cirrus.com, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com
In-Reply-To: <20230510092534.3919120-1-ckeepax@opensource.cirrus.com>
References: <20230510092534.3919120-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs35l45: Relicense to GPL only
Message-Id: <168502662408.304042.12072838074715727711.b4-ty@kernel.org>
Date: Thu, 25 May 2023 15:57:04 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: EQN7EOYEWFQ7LJXNYLZQN76IZ5IMMLOG
X-Message-ID-Hash: EQN7EOYEWFQ7LJXNYLZQN76IZ5IMMLOG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EQN7EOYEWFQ7LJXNYLZQN76IZ5IMMLOG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 10 May 2023 10:25:34 +0100, Charles Keepax wrote:
> Cirrus never intended to upstream dual licensed code, convert to
> GPL only.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs35l45: Relicense to GPL only
      commit: f9f46d05003ea6120fa27e01628770a2dac0fa75

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

