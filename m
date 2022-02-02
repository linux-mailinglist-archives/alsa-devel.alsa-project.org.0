Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F1DE04A78AD
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Feb 2022 20:26:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 914271793;
	Wed,  2 Feb 2022 20:25:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 914271793
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643829987;
	bh=tLgv79jNdeUYFtmFVtlmDEJNuaksR0QH6/raff/c9+I=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AzRn8tE4jaobIC5bLsR4EKqDfkhGdF/MhQhlJj4yw8vDRSXDk/KDDNISOGGJzxd7/
	 +rycsY6nlYjJsBLUC3xr9pajnI7XRAaWceZz4cJ+ZmBFBTN6QKRwZsIc193dWUWUlx
	 2GFOghWF81ElO/O1H+v/ROKUtfHUXtzmen6BekvI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5CDD2F80524;
	Wed,  2 Feb 2022 20:24:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C3A7F80518; Wed,  2 Feb 2022 20:23:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1DD54F804FF
 for <alsa-devel@alsa-project.org>; Wed,  2 Feb 2022 20:23:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1DD54F804FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="bcpCt27j"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DE805B82A30;
 Wed,  2 Feb 2022 19:23:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F24DC340E4;
 Wed,  2 Feb 2022 19:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643829835;
 bh=tLgv79jNdeUYFtmFVtlmDEJNuaksR0QH6/raff/c9+I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bcpCt27jm3dRpaCZuulEhyp2FA2D7YQ0C04/hDKF8lBQ2STJ6vXGrszdGtUoAtVgB
 Oj76R0N2JafFlivPH9rYHJpuitXfs8ETnBcGHw0rXPwNnfh2XUZvz+YU82+uGRtkCX
 +utJ2db+5GUkqNv7mBSUOBElCyURkl8NwouQ6ajnr4I1BCFZSuYGmp3AbyXqsuGcC6
 v6CMCfUlwpGdhXlUWpXlAY8ckF+4fyyhiRy02/O6OWEZPJsEwRnJOm6/x1rCx7veux
 jvxZMk3rC/d5dpEzuFSD90Z+7+S3nHgn0jjutEwPXRb4zNUr6U+cmqrPaA8W/6Lj+h
 5KtVPTZpWszvQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Oder Chiou <oder_chiou@realtek.com>
Subject: [PATCH v1 6/6] ASoC: simple-mux: Depend on gpiolib rather than
 selecting it
Date: Wed,  2 Feb 2022 19:23:33 +0000
Message-Id: <20220202192333.3655269-7-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220202192333.3655269-1-broonie@kernel.org>
References: <20220202192333.3655269-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=817; h=from:subject;
 bh=tLgv79jNdeUYFtmFVtlmDEJNuaksR0QH6/raff/c9+I=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBh+tozctafQLiIXEbT3iOEm1vrtd9otLBlU24zw0z3
 tXc2LzeJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYfraMwAKCRAk1otyXVSH0PYmB/
 9zEgLb2nw5bLynnGZ2bQwUC3JZ1X3ON3uuwyOyt06bkkf/M5p4sDSnVrETRYiJn5UKVtt5NRtz4x4c
 vSlbpyd+mv2XDEWAdXnIG6yFDKASHOBsT2x/zrJ8u0x+g/E2k0KscyjJLAPvYgvwm7KpujOSw9n//8
 ttGcG6FLqLyZPMTwEt2elbEWWPXBP9KXEzbxZXxvr+PKjH9Gm0oLCsW2YkXt9XR2HKat1Qjn9Y0TDH
 tI49Uc5dPg8wOSe0XsYKTENs9ofBpwsKG0DPID/KY8HcgLiDGaBxpq+sGnVXYXs9KtEWgoiisNhYnL
 /89GfSU0sXjjeOQAgGunaqx6IGlBG0
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The simple-mux driver requires gpiolib. Currently it selects GPIOLIB but
since the use of select can lead to issues with randconfig let's instead
depend on GPIOLIB, select is more idiomatically used for Kconfig symbols
that are not user selectable but GPIOLIB is user selectable.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 8a2e1c61f616..0ef2cfe40723 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -1394,7 +1394,7 @@ config SND_SOC_SIMPLE_AMPLIFIER
 
 config SND_SOC_SIMPLE_MUX
 	tristate "Simple Audio Mux"
-	select GPIOLIB
+	depends on GPIOLIB
 
 config SND_SOC_SPDIF
 	tristate "S/PDIF CODEC"
-- 
2.30.2

