Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A19A51ECDB9
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jun 2020 12:39:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51D52165F;
	Wed,  3 Jun 2020 12:38:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51D52165F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591180764;
	bh=SH8Qhc/YbmlK/T9vpodXazLR5M2/xD9795u+G+TCKXI=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=i3slBl/MHzoxgQThhk+P4d7PKYXtbYf6I2r8bo2v/3RmuIGTL1oXuM/Sc+yE6XZcu
	 CV5XUBfU1GAbK33sjIkUKjVzZWr5fVnUwsS5Wa4i0OU9MhanXNgoboGmr5j1+ImFVv
	 p7rx8pBqEdggWvbZZycnU4xKR7zs+pPQDnKdIvqo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 57AFCF80212;
	Wed,  3 Jun 2020 12:37:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6ACB8F80212; Wed,  3 Jun 2020 12:37:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 10B54F800D0
 for <alsa-devel@alsa-project.org>; Wed,  3 Jun 2020 12:37:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10B54F800D0
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 40D181A0101;
 Wed,  3 Jun 2020 12:37:33 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 0588A1A00FE;
 Wed,  3 Jun 2020 12:37:28 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 408FA40299;
 Wed,  3 Jun 2020 18:37:21 +0800 (SGT)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com, broonie@kernel.org,
 ckeepax@opensource.cirrus.com, allison@lohutok.net, info@metux.net,
 tglx@linutronix.de, patches@opensource.cirrus.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 1/2] ASoC: bindings: wm8960: Add property for headphone
 detection
Date: Wed,  3 Jun 2020 18:26:52 +0800
Message-Id: <1591180013-12416-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
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

Add two properties for headphone detection.

wlf,hp-cfg: A list of headphone jack detect configuration register values
wlf,gpio-cfg: A list of GPIO configuration register values

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 Documentation/devicetree/bindings/sound/wm8960.txt | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/wm8960.txt b/Documentation/devicetree/bindings/sound/wm8960.txt
index 6d29ac3750ee..85d3b287108c 100644
--- a/Documentation/devicetree/bindings/sound/wm8960.txt
+++ b/Documentation/devicetree/bindings/sound/wm8960.txt
@@ -21,6 +21,17 @@ Optional properties:
 	enabled and disabled together with HP_L and HP_R pins in response to jack
 	detect events.
 
+  - wlf,hp-cfg: A list of headphone jack detect configuration register values.
+		The list must be 3 entries long.
+		hp-cfg[0]: HPSEL[1:0] of R48 (Additional Control 4).
+		hp-cfg[1]: {HPSWEN:HPSWPOL} of R24 (Additional Control 2).
+		hp-cfg[2]: {TOCLKSEL:TOEN} of R23 (Additional Control 1).
+
+  - wlf,gpio-cfg: A list of GPIO configuration register values.
+		  The list must be 2 entries long.
+		  gpio-cfg[0]: ALRCGPIO of R9 (Audio interface)
+		  gpio-cfg[1]: {GPIOPOL:GPIOSEL[2:0]} of R48 (Additional Control 4).
+
 Example:
 
 wm8960: codec@1a {
-- 
2.21.0

