Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C1045C936
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Nov 2021 16:52:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 19A01179F;
	Wed, 24 Nov 2021 16:52:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 19A01179F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637769175;
	bh=KpprApMQuU1uh4J5NOgqdFbhex0M8TylTTMidZEjVf8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jDEr1aVjEU5dhnS5cli5ayL2JKdohwvMwWXjk+XjAlfP4HGDUmKpds//u9x6yE2Rx
	 ZgrK0/L5mFysu7jDtuHQlKL0mfJBJJQHfnaYHLOSBWV7wGRVsvCDjPieb95Pk7lCwa
	 qmH7LYI0zTYH2RI3j4+4YR8rMP4waGieyNSztPUc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B87EF8011F;
	Wed, 24 Nov 2021 16:51:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2B973F801F7; Wed, 24 Nov 2021 16:51:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from ixit.cz (ixit.cz [94.230.151.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 62FE8F8013A
 for <alsa-devel@alsa-project.org>; Wed, 24 Nov 2021 16:51:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62FE8F8013A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz
 header.b="MIAJzKFX"
Received: from localhost.localdomain (ip-89-176-96-70.net.upcbroadband.cz
 [89.176.96.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by ixit.cz (Postfix) with ESMTPSA id 4C34A20064;
 Wed, 24 Nov 2021 16:51:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
 t=1637769083;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=IU5q06TQT1C9vzgb5Uz3GHm36Avlp6WLGrtHyJxiET4=;
 b=MIAJzKFXWT+bddlCrj3j5q0t8K83XBjdckPE/hJOBahw4KDwUAiZHmISMLgX32ZqTXSPsA
 M83GTfm7Sqad5USsi9YjW3fet+mXohuIDqTMJmsmyXOS9nOhO/sewovr/QngCLH/ZsIyjg
 jJ1K4T57qYNJBHrK2ry1Z1vfK8el6sc=
From: David Heidelberg <david@ixit.cz>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, - <patches@opensource.cirrus.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ASoC: dt-bindings: wlf, wm8962: add missing interrupt property
Date: Wed, 24 Nov 2021 16:51:01 +0100
Message-Id: <20211124155101.59694-1-david@ixit.cz>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Rob Herring <robh@kernel.org>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
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

Both, hardware and drivers does support interrupts.

Fix warnings as:
arch/arm/boot/dts/tegra30-microsoft-surface-rt-efi.dt.yaml: audio-codec@1a: 'interrupt-parent', 'interrupts' do not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: /home/runner/work/linux/linux/Documentation/devicetree/bindings/sound/wlf,wm8962.yaml

Fixes: cd51b942f344 ("ASoC: dt-bindings: wlf,wm8962: Convert to json-schema")

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 Documentation/devicetree/bindings/sound/wlf,wm8962.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/wlf,wm8962.yaml b/Documentation/devicetree/bindings/sound/wlf,wm8962.yaml
index 0e6249d7c133..5e172e9462b9 100644
--- a/Documentation/devicetree/bindings/sound/wlf,wm8962.yaml
+++ b/Documentation/devicetree/bindings/sound/wlf,wm8962.yaml
@@ -19,6 +19,9 @@ properties:
   clocks:
     maxItems: 1
 
+  interrupts:
+    maxItems: 1
+
   "#sound-dai-cells":
     const: 0
 
-- 
2.33.0

