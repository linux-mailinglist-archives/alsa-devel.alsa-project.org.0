Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5DAD87556F
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Mar 2024 18:44:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 294769F6;
	Thu,  7 Mar 2024 18:44:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 294769F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709833457;
	bh=FxTN8wmTOOtkcRhR+GPUgI7j4Kh31mD0hBGQBSjSMwo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WfOf6kHbAl4sdfIh55dQL6oZeTUQfZhdgOW2VtPchgFj/uLiWWJW2Z2ML25rt/dVy
	 JHYBR6NnYj66/gQZ7bSwzrC3F6BYwNx70MiM7YDZVKCImUc6eUdE4uyqYfToU5FFJD
	 9S/kN3lvgt9TUbfo1CqAXMSxZoB1KodSkts1ziFY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BEC74F805D2; Thu,  7 Mar 2024 18:43:27 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 27FE7F805B2;
	Thu,  7 Mar 2024 18:43:27 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 38060F8024E; Thu,  7 Mar 2024 18:43:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 072F7F801F5
	for <alsa-devel@alsa-project.org>; Thu,  7 Mar 2024 18:43:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 072F7F801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=YzVGMf8r
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C46FECE259A;
	Thu,  7 Mar 2024 17:43:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 119E0C43390;
	Thu,  7 Mar 2024 17:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709833390;
	bh=FxTN8wmTOOtkcRhR+GPUgI7j4Kh31mD0hBGQBSjSMwo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=YzVGMf8rd3vB3hJ2jU7a3m5TXdZpMFZlgd9Ht/oLnYSkbxw4QUUBfw0t0fs8xs5ha
	 FdPBK9BVprmfdnEM3DOaPLzDutl0qNUZAF1WKRCCHC8mCQ3krO8ZfjDrOOI89Mn72J
	 i3A0v1Dvs4Wg0/WX7uPORJI5ZGuUMMLxPFITOtALC/m48gF4sLagvWSEnois8scp94
	 Ol7lNmwroRlZ3vlCUtvI9JVOWdU4aMPaX0Cfo/1y3xjzFbVJhuOhOqmm1zvbFGkp2m
	 +nEOvIhID8bjPDzE3HCvBKL/xNbL1PN+7vaJyHB8SK/YxpBEkA6ajTeIluVd21gVj9
	 jd2J41PPLo3bQ==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
In-Reply-To: <20240307110227.41421-1-rf@opensource.cirrus.com>
References: <20240307110227.41421-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: wm_adsp: Fix missing mutex_lock in
 wm_adsp_write_ctl()
Message-Id: <170983338880.97308.14001370070298134572.b4-ty@kernel.org>
Date: Thu, 07 Mar 2024 17:43:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-a684c
Message-ID-Hash: TQFOOAM63PCKZKBFXYRLSODQBAKQV4AC
X-Message-ID-Hash: TQFOOAM63PCKZKBFXYRLSODQBAKQV4AC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TQFOOAM63PCKZKBFXYRLSODQBAKQV4AC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 07 Mar 2024 11:02:27 +0000, Richard Fitzgerald wrote:
> wm_adsp_write_ctl() must hold the pwr_lock mutex when calling
> cs_dsp_get_ctl().
> 
> This was previously partially fixed by commit 781118bc2fc1
> ("ASoC: wm_adsp: Fix missing locking in wm_adsp_[read|write]_ctl()")
> but this only put locking around the call to cs_dsp_coeff_write_ctrl(),
> missing the call to cs_dsp_get_ctl().
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: wm_adsp: Fix missing mutex_lock in wm_adsp_write_ctl()
      commit: f193957b0fbbba397c8bddedf158b3bf7e4850fc

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

