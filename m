Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E2317D24B
	for <lists+alsa-devel@lfdr.de>; Sun,  8 Mar 2020 08:49:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9E271686;
	Sun,  8 Mar 2020 08:48:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9E271686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583653783;
	bh=CDhDSmF/gP9TlFAJRJwhhCX83/75NZAu7/Z3hv8ph+s=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vPR06At9S5zd0OTz2qtdb10eDBErIiz4LMXtKu3vtEEd/aWTdAaAI8eA9J5tHxwGx
	 Xoafq33q4IKmXK2f+MrdExG4Mko1xdzlEQmTcBth3XvRyJRZtqFb/DMl3jNC//wZLx
	 cAx8ny731qxelVCBTBw4LA7ZruKkrD7WzLBoPtQs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 76832F80290;
	Sun,  8 Mar 2020 08:46:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 938C6F801ED; Fri,  6 Mar 2020 23:27:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2FCB7F80126
 for <alsa-devel@alsa-project.org>; Fri,  6 Mar 2020 23:27:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2FCB7F80126
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com
 header.b="OJlbFWUt"
Received: by mail-pg1-x541.google.com with SMTP id m5so1732697pgg.0
 for <alsa-devel@alsa-project.org>; Fri, 06 Mar 2020 14:27:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aeWGyVhSQlBwiMFchxY/x8zvKPyDAht51wdM4LGPaMo=;
 b=OJlbFWUtTlgzus9WEg4N3tRl6P5CYlHkRBNYM3Gldbs2eQTew1H7qa/996L6qmDxXq
 IpUDapzYB+xKEOgMAmL0TaIIScu4BpnVSD6HrJtwNA2y0q9wO5Ta+2Z44/9uxpvdhasR
 oo+euUGZ2J1ZqyZgw1EwVnS54iI2yCbvBl0GY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aeWGyVhSQlBwiMFchxY/x8zvKPyDAht51wdM4LGPaMo=;
 b=NrHu7aopp10fdV4YbFXsPjI+dEwWA6xuoVVzoSm/SeT/nGrK8hAI7u+JPL+WI93D5u
 A7z6wqfMxVsrI5ajQyYz+TDw2gsLaDYWWKPrqhbkbHe6ScApOHmPuYNGQlPna7iwfLdv
 DyyIpNQ2DgLD33vpx2+Qk0mF+ntHQlCVUcMYwb+c9zJYrkdEFvL6l68/mrVhIo9EHrTY
 +0NPKU4qGtMtPfvWowmuPfJm4eTfRz/qcE+eoUAIskVtG0E6RyS9kzmX5QNxNqr4DOLN
 PL0GMI3rfdxrAfyrkZt+UT1pbyv/dLTWJpPYvYPDkKndQ7c7QHLD3uXWYWnFg1riTDee
 R+IQ==
X-Gm-Message-State: ANhLgQ2Ik94JjgyEDDGA1Vrt06cO6R/mqhwduM61Dka5o3w4sClEV0NK
 ShvCFG1AlW1mC8rOImmIzn2NGQ==
X-Google-Smtp-Source: ADFU+vt8dZkS4FIomsYdEorgdQI9ZuLx45WIO/FKY615N0QhD3Iqa3QnSbVOSov43AVKbWzILUMkgg==
X-Received: by 2002:a63:112:: with SMTP id 18mr5258545pgb.116.1583533644783;
 Fri, 06 Mar 2020 14:27:24 -0800 (PST)
Received: from kevin-Precision-Tower-5810.dhcp.broadcom.net ([192.19.228.250])
 by smtp.gmail.com with ESMTPSA id
 v8sm10504805pjr.10.2020.03.06.14.27.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 06 Mar 2020 14:27:24 -0800 (PST)
From: Kevin Li <kevin-ke.li@broadcom.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: brcm: DSL/PON SoC device tree bindings of audio driver
Date: Fri,  6 Mar 2020 14:27:05 -0800
Message-Id: <20200306222705.13309-2-kevin-ke.li@broadcom.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200306222705.13309-1-kevin-ke.li@broadcom.com>
References: <20200306222705.13309-1-kevin-ke.li@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 08 Mar 2020 08:46:09 +0100
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
 create mode 100755 Documentation/devicetree/bindings/sound/brcm,bcm63xx-audio.txt

diff --git a/Documentation/devicetree/bindings/sound/brcm,bcm63xx-audio.txt b/Documentation/devicetree/bindings/sound/brcm,bcm63xx-audio.txt
new file mode 100755
index 000000000000..88e404a8145f
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
+- clock-names:    Should be one of each entry matching the clocks phandles list:
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
\ No newline at end of file
-- 
2.25.1

