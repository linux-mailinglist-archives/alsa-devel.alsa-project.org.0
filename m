Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 883187B8C35
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Oct 2023 21:02:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E423FE0F;
	Wed,  4 Oct 2023 21:01:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E423FE0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696446169;
	bh=KXhIAxC3cWPvbaUSJOIWxCpwDiHLL34grSKs/NFG5xI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=edhqWHnwF3s2vZyL6lrRiIZBdcU5ey5jz8nmu0S5yFnR/+0fPKAS8tVx4iCTPI/SM
	 4ArB7VTuUSqm7X13fcDxmQMHukZ53mZJVwAJ0wY5UVY1Teol+U1lNht80ZZ/2yDL+d
	 m/UTcm5uLOep6SsQySWxilR9LFPyIZ7htQMrt/hw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C945AF80567; Wed,  4 Oct 2023 21:01:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E3F2F80553;
	Wed,  4 Oct 2023 21:01:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8E559F80558; Wed,  4 Oct 2023 21:01:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BC531F80130
	for <alsa-devel@alsa-project.org>; Wed,  4 Oct 2023 21:01:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC531F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=b/gXRsyU
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id EC4B4B81F96;
	Wed,  4 Oct 2023 19:01:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00D2CC433C7;
	Wed,  4 Oct 2023 19:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696446060;
	bh=KXhIAxC3cWPvbaUSJOIWxCpwDiHLL34grSKs/NFG5xI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=b/gXRsyUcekMcDB06jK/mb8y8hObNsAlthUhKOoBFbCB2jzeegRgfyGBaMi5a2Lxa
	 qLuJ8QCxct1r6sgg9/iHWuaMOZZySerQVqhazIgU+Eb9DQR1KOZwnrG0Vh0C9wqH5K
	 qfJhp2Pc4iDdsMOjDqxvSW4n7FNCixufWFR2ZnSGm5mSZ7+iA5zXg5MkD/Xw8LR1EP
	 q6UqDcyjDd8iEykydiaBcip1SIbb1bhdryGHxGYKZ/XQTFdOYuwYSZXZoIZb1LqFEf
	 73sg06oV6RdwIMibkGf6futHDBhbOZE2PsyUkHBsoyRPmXPAiPq4yoDXHjhHPCow3r
	 DbjaW2IUuKkEQ==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, Simon Trimmer <simont@opensource.cirrus.com>
In-Reply-To: <20231004144203.151775-1-rf@opensource.cirrus.com>
References: <20231004144203.151775-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs35l56: Initialise a variable to silence
 possible static analysis error
Message-Id: <169644605631.49424.12854334653954573178.b4-ty@kernel.org>
Date: Wed, 04 Oct 2023 20:00:56 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: MMDYML52XB6UE7EVB3F3HULWQPY3TKJT
X-Message-ID-Hash: MMDYML52XB6UE7EVB3F3HULWQPY3TKJT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MMDYML52XB6UE7EVB3F3HULWQPY3TKJT/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 04 Oct 2023 15:42:03 +0100, Richard Fitzgerald wrote:
> read_poll_timeout() is a macro and val will be populated before use,
> however some static analysis tools treat it as a function and warn of
> uninitialised variable usage.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs35l56: Initialise a variable to silence possible static analysis error
      commit: c98a0a83dccd19283da34a298876d26c7f06750f

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

