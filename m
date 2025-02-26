Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA1EA4FA3A
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Mar 2025 10:36:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 150466035A;
	Wed,  5 Mar 2025 10:36:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 150466035A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1741167378;
	bh=+FNZDPJJFiAJ9t2iAERYG9oZjAiS0JZDwNejk2fx/lk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UN9ry0EqZ7ZbWrzm46/vkwUZ+LSQE8WJAGbn/xWCo2iEIHTb4QBpQNTBb8HxZKyZQ
	 SUACeVHWoZsD46AZWUAGjxXJH8DdC/2SFrSlSzjqZm0FCXqM8oOrYYMjOgp32S9Cst
	 vi1fqHMOxElGPC6b6yIDCvHUv1CxFOEYlq0Ni6b4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5EEC7F805BE; Wed,  5 Mar 2025 10:35:45 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A259F805B5;
	Wed,  5 Mar 2025 10:35:45 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AEE10F8027B; Wed, 26 Feb 2025 11:50:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp134-86.sina.com.cn (smtp134-86.sina.com.cn
 [180.149.134.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3E749F8016E
	for <alsa-devel@alsa-project.org>; Wed, 26 Feb 2025 11:49:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E749F8016E
Received: from unknown (HELO
 zy-virtual-machine.localdomain)([180.159.108.137])
	by sina.net (10.185.250.30) with ESMTP
	id 67BEF1CF00003A73; Wed, 26 Feb 2025 18:49:55 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 8E84643D83234D9A98BABE86AB6658B3
X-SMAIL-UIID: 8E84643D83234D9A98BABE86AB6658B3-20250226-184955
From: Zhang Yi <zhangyi@everest-semi.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org,
	devicetree@vger.kernel.org
Cc: tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com,
	yangxiaohua@everest-semi.com,
	zhuning@everest-semi.com,
	zhangyi@everest-semi.com
Subject: [PATCH 2/2] ASoC: dt-bindings: Add Everest ES8389 audio CODEC
Date: Wed, 26 Feb 2025 18:49:49 +0800
Message-Id: <20250226104949.16303-3-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250226104949.16303-1-zhangyi@everest-semi.com>
References: <20250226104949.16303-1-zhangyi@everest-semi.com>
X-MailFrom: zhangyi@everest-semi.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: FIDWIIUY26LGY2DREKYF4DZY2OMXLYFE
X-Message-ID-Hash: FIDWIIUY26LGY2DREKYF4DZY2OMXLYFE
X-Mailman-Approved-At: Wed, 05 Mar 2025 09:35:41 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FIDWIIUY26LGY2DREKYF4DZY2OMXLYFE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add device tree binding documentation for Everest ES8389

Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
---
 .../bindings/sound/everest,es8389.txt         | 68 +++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100755 Documentation/devicetree/bindings/sound/everest,es8389.txt

diff --git a/Documentation/devicetree/bindings/sound/everest,es8389.txt b/Documentation/devicetree/bindings/sound/everest,es8389.txt
new file mode 100755
index 000000000000..a65222f984da
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/everest,es8389.txt
@@ -0,0 +1,68 @@
+ES8389 audio CODEC
+
+This device supports I2C only.
+
+Required properties:
+
+- compatible : "everest,es8389"
+
+- reg : The I2C address of the device.
+ It depends on The Voltage level on Chip Address Pin(AD1 = PIN11,AD0 = PIN1)
+
+- "#sound-dai-cells"
+
+Optional properties:
+
+- everest,adc-slot:
+ This property is used to set the slots of recording data when multiple codecs
+ are connected in PTDM mode. please do not set this property if you are setting
+ STDM mode.
+ minimum: 0x00
+ maximum: 0x07
+ default: 0x00
+
+- everest,dac-slot:
+ This property is used to set the slots of playing data when multiple codecs
+ are connected in TDM mode.
+ minimum: 0x00
+ maximum: 0x07
+ default: 0x00
+
+- prefix_name:
+ To set the prefix_name of kcontorls and dapm.
+
+- everest,dmic-enabled
+ The property selects the PDM interface of ES8389
+
+Example for single codec:
+
+ es8389: es8389@10 {
+                compatible = "everest,es8389";
+                status = "okay";
+                reg = <0x10>;
+                everest,adc-slot = [00];
+                everest,dac-slot = [00];
+                prefix_name = "es8389_0";
+                #sound-dai-cells = <0>;
+        };
+
+Example for multiple codecs:
+ es8389_0: es8389@10 {
+                compatible = "everest,es8389";
+                status = "okay";
+                reg = <0x10>;
+                everest,adc-slot = [00];
+                everest,dac-slot = [00];
+                prefix_name = "es8389_0";
+                #sound-dai-cells = <0>;
+        };
+es8389_1: es8389@11 {
+                compatible = "everest,es8389";
+                status = "okay";
+                reg = <0x11>;
+                everest,adc-slot = [01];
+                everest,dac-slot = [01];
+                prefix_name = "es8389_1";
+                clock-names = "mclk";
+                #sound-dai-cells = <0>;
+        };
-- 
2.17.1

