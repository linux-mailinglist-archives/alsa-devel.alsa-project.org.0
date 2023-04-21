Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B626EAEB6
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Apr 2023 18:09:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 03C07EB4;
	Fri, 21 Apr 2023 18:08:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 03C07EB4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682093354;
	bh=/fqu4LAO0rQXLeKMn7Vx1bIx9OQ+1oaeV/RoLW9avGk=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MoNsNh3K7E5OikHuOgXuvnO6NzwHt+IoK2ahsQ7KG3tIT1Piy6DzYLBOD2C+YM7vK
	 oM932k2csnRWhA68YeALV3LPJjTVOPEegm+aGAm5cYYROA7lEKrLQmiYR4zbabGIhC
	 qFtZ9eVZTshIBnipw55PibtGzPCegsrn+Kz3pqUQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 183D0F8055C;
	Fri, 21 Apr 2023 18:06:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8DAA4F80552; Fri, 21 Apr 2023 18:06:46 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 22A09F80528
	for <alsa-devel@alsa-project.org>; Fri, 21 Apr 2023 18:06:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22A09F80528
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=OXKLQdiq
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C87C1612AB;
	Fri, 21 Apr 2023 16:06:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 386C9C433EF;
	Fri, 21 Apr 2023 16:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682093198;
	bh=/fqu4LAO0rQXLeKMn7Vx1bIx9OQ+1oaeV/RoLW9avGk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=OXKLQdiqyePGt+CuFBe+9QESkM1orGqaE2bDmsvJML8PVaXHr+veF9JVCHe6xvkXK
	 ucaTsGelUQHYa6db1WLu1NXgMoaWwO7+huaFGjwv9m15IKVslIRILDRJ7fMnlMq5H0
	 sbOC0GYuOkRdJ7phgapoyf26Te49jkJM3EkfhwL07O91J8TzH6oQ/ykvsK4Xg3QH9g
	 l17SIY4CgAWjEwYgvsm/5vKGADnhjjUOm9Q21uJvYyWjNrgcpvJV13aJ7wbzifZXJm
	 rzSHBKTGgbxxsh1QBb3On1hOp207JgfEJg0E++vg63xh5ZZmX4lnf+gHvQaAe1heoo
	 O9ziRXudCzndA==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20230420102043.1151830-1-rf@opensource.cirrus.com>
References: <20230420102043.1151830-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs35l56: Remove duplicate mbox log messages
Message-Id: <168209319695.108546.10814021215571192009.b4-ty@kernel.org>
Date: Fri, 21 Apr 2023 17:06:36 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-00e42
Message-ID-Hash: DSWDXJT6CWUXDRE6WF6RQB4EG3DFX76M
X-Message-ID-Hash: DSWDXJT6CWUXDRE6WF6RQB4EG3DFX76M
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com, Simon Trimmer <simont@opensource.cirrus.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DSWDXJT6CWUXDRE6WF6RQB4EG3DFX76M/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 20 Apr 2023 11:20:43 +0100, Richard Fitzgerald wrote:
> cs35l56_mbox_send() logs a warning when sending a mbox command fails so
> the callers can be simplified.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs35l56: Remove duplicate mbox log messages
      commit: a9e42d9e8b4be36a1e0dde0285a9ff36b2e06a46

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

