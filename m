Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DBD769BAF
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 18:02:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31B0684A;
	Mon, 31 Jul 2023 18:01:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31B0684A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690819344;
	bh=/dCet8XmUJipf8WggPxSXVgBhmmfgN+TAydOUhSvMGQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tweSZGLZDC68WKfcEXVd6/hNhji1Prkl6evuM4eSl8nk3dqRA8Mk4jm46DZVGWCzj
	 DiWLFTWZ3Ga3e7izHmKsFcUn8On1wmiqEnX/R5ZYvOz84O2j6VyPGSkx+BTPB/ufX3
	 D4RZDCc8Gkw/mtryrrs3L7psWvYVjJJgCPHYLFs4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A7557F8053B; Mon, 31 Jul 2023 18:01:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E3D2F80163;
	Mon, 31 Jul 2023 18:01:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 09994F8016D; Mon, 31 Jul 2023 18:01:08 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id DC464F80153
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 18:00:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC464F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=d1zxR5Mk
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 59BA4611FA;
	Mon, 31 Jul 2023 16:00:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6E6EC433C8;
	Mon, 31 Jul 2023 16:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690819254;
	bh=/dCet8XmUJipf8WggPxSXVgBhmmfgN+TAydOUhSvMGQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=d1zxR5Mk+D5JLrut+8x9jS2F0dxofTZYmGLjEVxMUxurvldI48m3ju9cwhR2ztJiA
	 OT98uB6vyNPpc0+qwEErShKAu49ggw9FqFqYMbDWf1CNXOEJGIflB9dadlzHJ8huI8
	 tidJgVGkVuT1kh23OaO3aCQsXM4M9JFZ7wI3wbYbGL2Zw+B90CV4cwFT2r/rFELzzq
	 KtLzXv+1ZJUIcLfg4QqRXyBiXIavJAwjD7nOGafJRoy+DQ3rHtFTv/hSynSr51cilc
	 ejVha9g2kcDonh0+4tRkQZDNa+8aDVZl26nS2VSE1I8HFAmYWgbpSyQW/VVu/QkhaD
	 ufbxqt6tGMqOw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, - <kernel@puri.sm>,
 David Heidelberg <david@ixit.cz>
Cc: =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20230730191742.117013-1-david@ixit.cz>
References: <20230730191742.117013-1-david@ixit.cz>
Subject: Re: [PATCH v4] dt-bindings: sound: gtm601: convert to YAML
Message-Id: <169081925251.69703.15494857199278505179.b4-ty@kernel.org>
Date: Mon, 31 Jul 2023 17:00:52 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: CKVRCS5BA56HEEQTNCCMP4JGLT56WJWJ
X-Message-ID-Hash: CKVRCS5BA56HEEQTNCCMP4JGLT56WJWJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CKVRCS5BA56HEEQTNCCMP4JGLT56WJWJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, 30 Jul 2023 22:17:42 +0300, David Heidelberg wrote:
> Convert GTM601 binding to the YAML format.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] dt-bindings: sound: gtm601: convert to YAML
      commit: cd8ee8aba1f3b5dd4118dc8cea05b73734983288

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

