Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D6F183C91
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Mar 2020 23:34:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 622041778;
	Thu, 12 Mar 2020 23:34:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 622041778
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584052492;
	bh=1x3bxwaN+7L9DYt1iIjiq0ZVA1YHbO+0+tOIgJXJD3A=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Nmd4qtEVeUmgEg19INMBBwfF4/G8D/tQQ1PQWINl+/6pZqjK0HKf3d4iye9MrWSh4
	 lIrAl1Doza1lltwVvUke3RCh17+4ODfos1UT+/QUH4Wnhwlbg1T9RE2wQh5GNQIaCv
	 MZIlWrps6D6RfLE/jFCYtUPF5vjkjVN8GOR7ST5E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 62B5BF8013E;
	Thu, 12 Mar 2020 23:33:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19CBDF8020C; Thu, 12 Mar 2020 23:33:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89218F8013E
 for <alsa-devel@alsa-project.org>; Thu, 12 Mar 2020 23:33:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89218F8013E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com
 header.b="F8GXxd/U"
Received: by mail-wr1-x442.google.com with SMTP id s14so9658575wrt.8
 for <alsa-devel@alsa-project.org>; Thu, 12 Mar 2020 15:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cDWsgDLGuZCMn9GDO0QtBYwdt4yNCxsID/A8c6spG+w=;
 b=F8GXxd/Up9QSlBTh8YYTrd18ZkncJ/tcs2fUV2pLzyVB9dQnU5tXHAqsvFSZpS37DF
 /RP8bFO35uANJ9prIV3av3xnZJ+YXjM41536qUknZrD+kVPSkjQZjTet7qzzEd82FfCj
 50Xu0bVXaJ/pLJshtDXNTrWU0nyssx9Q7z2jE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cDWsgDLGuZCMn9GDO0QtBYwdt4yNCxsID/A8c6spG+w=;
 b=MN6m0n2+Ec/aMGE1pmRVjR+cfn5lkFPQHMd9OSjVM/YOhQCl55Y3MEMl05o8Wr1IIb
 PW5Im2kV8H9U5Bj1idDkNbIlpWe3SPyGjdG93VcShIBf+QNvax33v2zpPkK8sKVaTtQE
 3S89YyQD7BHgxM57LEzm6X31x7TXVfCp91sD56CPZjW7TANEn4TFT8UAPic7ZWhrR9vQ
 n5II+YBY5ln3pIRwpiqRRWPrpbOyKeeImtw/FYYkte1ZRupwlPHjaaioqUG8tRmcZast
 DdIWvg8a0wS3SwTT4thQHMKPTpuBycVJEDnKtoe9EeMJxfkajsuD6XH2/SyNPlL7z4TV
 pOKQ==
X-Gm-Message-State: ANhLgQ3af0s6oahP4WDiU4AWqwKgMc0C9fdBQ8QaVTey9HiN1FrYYx8k
 m3iZNMlRmxz+Sxdm75eSTKbeaQ==
X-Google-Smtp-Source: ADFU+vtnUqNpWBj7jS/ZVk56MTaBujLMSdSyvo4Y3ZV8FcL31mlYMjdAQ/fuQ5f+5qNnmf/72hXOZw==
X-Received: by 2002:a5d:6a4a:: with SMTP id t10mr13392404wrw.356.1584052378564; 
 Thu, 12 Mar 2020 15:32:58 -0700 (PDT)
Received: from kevin-Precision-Tower-5810.dhcp.broadcom.net ([192.19.228.250])
 by smtp.gmail.com with ESMTPSA id
 o10sm2964144wrs.65.2020.03.12.15.32.54
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 12 Mar 2020 15:32:58 -0700 (PDT)
From: Kevin Li <kevin-ke.li@broadcom.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 2/2] ASoC: brcm: DSL/PON SoC device tree bindings of audio
 driver
Date: Thu, 12 Mar 2020 15:32:40 -0700
Message-Id: <20200312223242.2843-1-kevin-ke.li@broadcom.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Scott Branden <sbranden@broadcom.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Ray Jui <rjui@broadcom.com>, Takashi Iwai <tiwai@suse.com>,
 Kevin Li <kevin-ke.li@broadcom.com>, bcm-kernel-feedback-list@broadcom.com,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-kernel@lists.infradead.org
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

Signed-off-by: Kevin Li <kevin-ke.li@broadcom.com>
---
 .../bindings/sound/brcm,bcm63xx-audio.txt     | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/brcm,bcm63xx-audio.txt

diff --git a/Documentation/devicetree/bindings/sound/brcm,bcm63xx-audio.txt b/Documentation/devicetree/bindings/sound/brcm,bcm63xx-audio.txt
new file mode 100644
index 000000000000..007f524b4d15
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/brcm,bcm63xx-audio.txt
@@ -0,0 +1,29 @@
+Broadcom DSL/PON BCM63xx Audio I2S controller
+
+Required properties:
+- compatible:     Should be "brcm,bcm63xx-i2s".
+- #address-cells: 32bit valued, 1 cell.
+- #size-cells:    32bit valued, 0 cell.
+- reg:            Should contain audio registers location and length
+- interrupts:     Should contain the interrupt for the controller.
+- clocks:         Must contain an entry for each entry in clock-names.
+                  Please refer to clock-bindings.txt.
+- clock-names:    One of each entry matching the clocks phandles list:
+                  - "i2sclk" (generated clock) Required.
+                  - "i2sosc" (fixed 200MHz clock) Required.
+
+(1) : The generated clock is required only when any of TX and RX
+      works on Master Mode.
+(2) : The fixed 200MHz clock is from internal chip and always on
+
+Example:
+
+		i2s: bcm63xx-i2s {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "brcm,bcm63xx-i2s";
+			reg = <0xFF802080 0xFF>;
+			interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&i2sclk>, <&osc>;
+			clock-names = "i2sclk","i2sosc";
+		};
-- 
2.25.1

