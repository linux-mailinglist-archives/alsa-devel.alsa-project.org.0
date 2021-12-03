Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F534678D9
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Dec 2021 14:51:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7079B22C2;
	Fri,  3 Dec 2021 14:50:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7079B22C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638539499;
	bh=5SXMGCa+TfmP8fr/3psu4C9pvK27zE6v9AXpJcy4HAw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KoTuSbwQTjNCIY8QhFLEdDc2UfdZ2XE3SnHS63LzLhCJ4FkB1Rf/HWtlFESiSny2p
	 XGaJokQ9IWzudyAu9JfQU02xyLxOephiIMfL49o3C8EM2LKyLer91ZNFiyi2K2Me9U
	 xGHi0OtYcYb9YYIFImAszPqc9qQjtdoIzLakhGEA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A36EF8028D;
	Fri,  3 Dec 2021 14:50:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE563F8028D; Fri,  3 Dec 2021 14:50:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6E255F80249
 for <alsa-devel@alsa-project.org>; Fri,  3 Dec 2021 14:49:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E255F80249
Authentication-Results: alsa1.perex.cz;
 dkim=fail reason="signature verification failed" (2048-bit key)
 header.d=collabora.com header.i=@collabora.com header.b="l7tDyt+Q"
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: adalessandro) with ESMTPSA id 37B2C1F46E6C
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1638539395; bh=5SXMGCa+TfmP8fr/3psu4C9pvK27zE6v9AXpJcy4HAw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=l7tDyt+QZN8S7COxB5kxfE1gUulzvmNZFa2WwVLlyw02KzjTvZ7+EXgiuiunFVk6o
 heR6wOtkzrNXbrsjts0S5swFRKFzVF5R5EIg2Uz+7cLkMvLSDtNQlx2nMjC2dGF+Il
 usxTnCFi4YkEGYrdjs7JBKLw+7R1vfp8bbN0n6/7eitzmEnl68adC1iynenLkk+21R
 KJ5qTELBneiYl0/e93rCLabcQa/eRvYpyA7L/eMoBgpUUEZzMleMxxOC+UIg9Je5ld
 XmkFqQ/hesQeecPA2FFgYRMeLJ7E25kfddEi5NmkjK+VQvudXgy6pAsSVOC+v4Gpj9
 LDywwtjoFr1kQ==
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
To: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/4] dt-bindings: sound: Rename tlv320aic31xx-micbias as
 tlv320aic31xx
Date: Fri,  3 Dec 2021 10:49:27 -0300
Message-Id: <20211203134930.128703-2-ariel.dalessandro@collabora.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211203134930.128703-1-ariel.dalessandro@collabora.com>
References: <20211203134930.128703-1-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: ariel.dalessandro@collabora.com, kuninori.morimoto.gx@renesas.com,
 Xiubo.Lee@gmail.com, tony@atomide.com, shengjiu.wang@gmail.com, tiwai@suse.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, nicoleotsuka@gmail.com,
 broonie@kernel.org, bcousson@baylibre.com, michael@amarulasolutions.com,
 festevam@gmail.com
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

Let's use a more generic name, so other definitions for tlv320aic31xx
can be included.

Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
---
 .../devicetree/bindings/sound/tlv320aic31xx.txt          | 2 +-
 arch/arm/boot/dts/am43x-epos-evm.dts                     | 2 +-
 include/dt-bindings/sound/tlv320aic31xx-micbias.h        | 9 ---------
 include/dt-bindings/sound/tlv320aic31xx.h                | 9 +++++++++
 sound/soc/codecs/tlv320aic31xx.c                         | 2 +-
 5 files changed, 12 insertions(+), 12 deletions(-)
 delete mode 100644 include/dt-bindings/sound/tlv320aic31xx-micbias.h
 create mode 100644 include/dt-bindings/sound/tlv320aic31xx.h

diff --git a/Documentation/devicetree/bindings/sound/tlv320aic31xx.txt b/Documentation/devicetree/bindings/sound/tlv320aic31xx.txt
index e372303697dc..bbad98d5b986 100644
--- a/Documentation/devicetree/bindings/sound/tlv320aic31xx.txt
+++ b/Documentation/devicetree/bindings/sound/tlv320aic31xx.txt
@@ -58,7 +58,7 @@ The pins can be used in referring sound node's audio-routing property.
 
 Example:
 #include <dt-bindings/gpio/gpio.h>
-#include <dt-bindings/sound/tlv320aic31xx-micbias.h>
+#include <dt-bindings/sound/tlv320aic31xx.h>
 
 tlv320aic31xx: tlv320aic31xx@18 {
 	compatible = "ti,tlv320aic311x";
diff --git a/arch/arm/boot/dts/am43x-epos-evm.dts b/arch/arm/boot/dts/am43x-epos-evm.dts
index 2f4d2e4e9b3e..4f9a7251a107 100644
--- a/arch/arm/boot/dts/am43x-epos-evm.dts
+++ b/arch/arm/boot/dts/am43x-epos-evm.dts
@@ -11,7 +11,7 @@
 #include <dt-bindings/pinctrl/am43xx.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/pwm/pwm.h>
-#include <dt-bindings/sound/tlv320aic31xx-micbias.h>
+#include <dt-bindings/sound/tlv320aic31xx.h>
 
 / {
 	model = "TI AM43x EPOS EVM";
diff --git a/include/dt-bindings/sound/tlv320aic31xx-micbias.h b/include/dt-bindings/sound/tlv320aic31xx-micbias.h
deleted file mode 100644
index c6895a18a455..000000000000
--- a/include/dt-bindings/sound/tlv320aic31xx-micbias.h
+++ /dev/null
@@ -1,9 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __DT_TLV320AIC31XX_MICBIAS_H
-#define __DT_TLV320AIC31XX_MICBIAS_H
-
-#define MICBIAS_2_0V		1
-#define MICBIAS_2_5V		2
-#define MICBIAS_AVDDV		3
-
-#endif /* __DT_TLV320AIC31XX_MICBIAS_H */
diff --git a/include/dt-bindings/sound/tlv320aic31xx.h b/include/dt-bindings/sound/tlv320aic31xx.h
new file mode 100644
index 000000000000..3a845fbba992
--- /dev/null
+++ b/include/dt-bindings/sound/tlv320aic31xx.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __DT_TLV320AIC31XX_H
+#define __DT_TLV320AIC31XX_H
+
+#define MICBIAS_2_0V		1
+#define MICBIAS_2_5V		2
+#define MICBIAS_AVDDV		3
+
+#endif /* __DT_TLV320AIC31XX_H */
diff --git a/sound/soc/codecs/tlv320aic31xx.c b/sound/soc/codecs/tlv320aic31xx.c
index 4224b4b3cae6..f2222c37913e 100644
--- a/sound/soc/codecs/tlv320aic31xx.c
+++ b/sound/soc/codecs/tlv320aic31xx.c
@@ -32,7 +32,7 @@
 #include <sound/soc.h>
 #include <sound/initval.h>
 #include <sound/tlv.h>
-#include <dt-bindings/sound/tlv320aic31xx-micbias.h>
+#include <dt-bindings/sound/tlv320aic31xx.h>
 
 #include "tlv320aic31xx.h"
 
-- 
2.30.2

