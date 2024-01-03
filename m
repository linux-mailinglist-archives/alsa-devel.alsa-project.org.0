Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E68823496
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jan 2024 19:36:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4810E9A;
	Wed,  3 Jan 2024 19:36:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4810E9A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704306989;
	bh=19xiBjnOuBFzrb7XkNEoHVBbObJYxv6N5hhdXATD5LU=;
	h=From:Subject:Date:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=UiUKyRFspN1paQHo3vwM/+h4dQyoPyC5Q5R6StdwYboeN5yHFu0KiZ5smaLZ0Gyti
	 zWzTjJQ4vfNaXh0VAuqUftQvLljNqjdV3O4MdaJWKu2MMoGwvccNBFYC+Liv6P724p
	 QNdEdkxpXmYaosY3lR3+i/BB3oNGBRplrr9T6bDQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ADC3BF80579; Wed,  3 Jan 2024 19:35:58 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D4970F80551;
	Wed,  3 Jan 2024 19:35:57 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D0757F80549; Wed,  3 Jan 2024 19:34:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EC975F80533
	for <alsa-devel@alsa-project.org>; Wed,  3 Jan 2024 19:34:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC975F80533
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=vQsLBdo8
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 8C916B8149C;
	Wed,  3 Jan 2024 18:34:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 681D9C433C8;
	Wed,  3 Jan 2024 18:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704306859;
	bh=19xiBjnOuBFzrb7XkNEoHVBbObJYxv6N5hhdXATD5LU=;
	h=From:Subject:Date:To:Cc:From;
	b=vQsLBdo8BtAsq1n5IX+yib8qFGJuLIFgTus6TNIWgj4tyZAbfvEIhpoqS4vdDGre1
	 dKuygPY8gUiJm4AQufwvDU1XJJGTJG9WtT/X985ykOPMy6bC+CgJjmvegKIhjx07j1
	 ANugczvuZShC3ng3SY9Aa/1Qnv6ewAZsG+TmnOoOK4oFzeIAPIM3qLhQcf3Z8xMVxD
	 XIDwYs4kuc232r4N03YyLk4VSuATLlWK0DTaX1SzBx+JqzxilQIE0vksLanvVP1sIm
	 7MRDUScdHREVi0Ly8DF9oD/I1NBMhPs1y0wDk9LAT/UuG9rHxt10kOwUBzOWr/dckO
	 MTb2IfxIyh/Tg==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 0/4] ASoC: meson: Fix issues with LibreTech Saphire
Date: Wed, 03 Jan 2024 18:34:00 +0000
Message-Id: <20240103-meson-enum-val-v1-0-424af7a8fb91@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJiolWUC/x2MQQqAMAzAvjJ6tjCnoPgV8TC1asFVWVEE2d8dH
 kNIXlCKTAqdeSHSzcqHZCgLA9PmZSXkOTM462pb2goD6SFIcgW8/Y5TS/XolqyaBnJ0Rlr4+Yf
 9kNIHj/SYs2AAAAA=
To: Jerome Brunet <jbrunet@baylibre.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-0438c
X-Developer-Signature: v=1; a=openpgp-sha256; l=742; i=broonie@kernel.org;
 h=from:subject:message-id; bh=19xiBjnOuBFzrb7XkNEoHVBbObJYxv6N5hhdXATD5LU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBllailFWG6K0996ZkK+zsEgZm8WQikj/dXR+gw2
 ektleLtk7eJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZZWopQAKCRAk1otyXVSH
 0GTPB/9hsdHS+SkXa8zW3gUdRI2CV4zmlUtRxP5/jDP12prISMr7i0w9Pjjvxphlj4Z3ogk80lC
 B8sujoQpPNgUNDDB4xutZQuVH7QSuGbVIUVAgc1plOJLW4vHh9HXsarzcKVPRBNWq3l/+/N7wlG
 Ml+E0Z1jKt/ZXyUbJu3lQ3kkDp2KtOFCOvAeNZtC+NoxCta264AkTr9DHRKjJg4hI84lOz6WdCL
 mER8E98+5OEBPcdcXEjUxdutKLbUzmFkW71NrlL3Cq56FiM4Ne/4HgII0NroukIkTJCvKt0ftLP
 vo1C+T5sfTHGOJwgNBSGYuj+EtX2hDsav0NjOAorYoh/DjrI
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: T53CAZDUUHNDACFAVTUUAZKP6RAMBUNS
X-Message-ID-Hash: T53CAZDUUHNDACFAVTUUAZKP6RAMBUNS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T53CAZDUUHNDACFAVTUUAZKP6RAMBUNS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This fixes a few issues I identified when integrating a LibreTech
Saphire (based on S905D3) into my CI.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
Mark Brown (4):
      ASoC: meson: g12a-toacodec: Validate written enum values
      ASoC: meson: g12a-tohdmitx: Validate written enum values
      ASoC: meson: g12a-toacodec: Fix event generation
      ASoC: meson: g12a-tohdmitx: Fix event generation for S/PDIF mux

 sound/soc/meson/g12a-toacodec.c | 5 ++++-
 sound/soc/meson/g12a-tohdmitx.c | 8 +++++++-
 2 files changed, 11 insertions(+), 2 deletions(-)
---
base-commit: 610a9b8f49fbcf1100716370d3b5f6f884a2835a
change-id: 20240103-meson-enum-val-c8e4b2f01077

Best regards,
-- 
Mark Brown <broonie@kernel.org>

