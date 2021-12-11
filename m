Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4216B4716E7
	for <lists+alsa-devel@lfdr.de>; Sat, 11 Dec 2021 22:55:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B774E1ADA;
	Sat, 11 Dec 2021 22:54:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B774E1ADA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639259739;
	bh=z8FHSnB2YzFGXMbKL+ZxOZ5smUjWXPIHe6FDTgs1Y0A=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QWyomy893r69tFVs8MjzITEcToyPZlC4uPDl9/2bWBw2uTd08NDDix1IlBQhN7EXI
	 hi4Egw/rgKXlnk54gn6u1CZvXsXssymGn38GDE6m0AknuzSg26orPiRyvsR2WiNeG9
	 cegiuTcWS5yPeqHmQbX3qJ5dO8Tj7pPFB+sSbuJ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D9EEF80083;
	Sat, 11 Dec 2021 22:54:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC3C6F804CC; Sat, 11 Dec 2021 22:54:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from ixit.cz (ixit.cz [94.230.151.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9706BF804AE
 for <alsa-devel@alsa-project.org>; Sat, 11 Dec 2021 22:54:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9706BF804AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz
 header.b="nmOyzjJY"
Received: from localhost.localdomain (ip-89-176-96-70.net.upcbroadband.cz
 [89.176.96.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by ixit.cz (Postfix) with ESMTPSA id 0E71721F5E;
 Sat, 11 Dec 2021 22:54:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
 t=1639259657;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=zSpqLPn7P+S+3UQTwr7zSIFu2ADotQIHst4N/Z4gL4k=;
 b=nmOyzjJY8oReV6w6eiprkNmXME0kKkv0YoRZy3sL7d/G22zD+UJRAf0OrV9koPO5dpD+9j
 kbrj6Ubo9kYzMnZNoFXNLbnU7Eu8kvejuqFgZ16GQxQt7wX3SNH55tJQ/0lHooGXQJz9oF
 Ke31daEMl/EFBy9hSK4iLPUWRqBPtSo=
From: David Heidelberg <david@ixit.cz>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Oder Chiou <oder_chiou@realtek.com>
Subject: [PATCH] ASoC: dt-bindings: add missing pins
Date: Sat, 11 Dec 2021 22:51:19 +0100
Message-Id: <20211211215120.70966-1-david@ixit.cz>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Mark Brown <broonie@linaro.org>, linux-kernel@vger.kernel.org,
 David Heidelberg <david@ixit.cz>, ~okias/devicetree@lists.sr.ht
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

Add pins missing in documentation, but present in the hardware.

Fixes: 0e826e867264 ("ASoC: add RT5677 CODEC driver")

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 Documentation/devicetree/bindings/sound/rt5677.txt | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/rt5677.txt b/Documentation/devicetree/bindings/sound/rt5677.txt
index da2430099181..74b6359b802d 100644
--- a/Documentation/devicetree/bindings/sound/rt5677.txt
+++ b/Documentation/devicetree/bindings/sound/rt5677.txt
@@ -54,9 +54,21 @@ Pins on the device (for linking into audio routes):
   * DMIC2
   * DMIC3
   * DMIC4
+  * DMIC L1
+  * DMIC L2
+  * DMIC L3
+  * DMIC L4
+  * DMIC R1
+  * DMIC R2
+  * DMIC R3
+  * DMIC R4
   * LOUT1
   * LOUT2
   * LOUT3
+  * PDM1L
+  * PDM1R
+  * PDM2L
+  * PDM2R
 
 Example:
 
-- 
2.33.0

