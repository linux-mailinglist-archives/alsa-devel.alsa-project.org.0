Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C64948B276
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jan 2022 17:42:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A48C1A8E;
	Tue, 11 Jan 2022 17:41:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A48C1A8E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641919346;
	bh=CRzlQvOvmImi8W+tsxiOP8IeNnwjl+nTnBIyznlAQ2o=;
	h=From:Date:Subject:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=R1gTAoklG4OBZgrk3F//I8MU7Zp1SFevM4oc+qAgi3Yn4Zx3uaBnTBUKUlz98tFTb
	 B7E7XBiDTA3pfUUh1dcXdd5eFNePabIQ3D8VYUttt8u6sgIC7Zlb8icXoCVl73pSDf
	 0HyOEHutYy2/+fP2a8exq6zlWpTVCuSaR1xg5t7o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F16FF80529;
	Tue, 11 Jan 2022 17:38:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A0DE0F80125; Tue, 11 Jan 2022 01:16:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7A05CF80125
 for <alsa-devel@alsa-project.org>; Tue, 11 Jan 2022 01:16:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A05CF80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=igorinstitute-com.20210112.gappssmtp.com
 header.i=@igorinstitute-com.20210112.gappssmtp.com header.b="hY4dwUsH"
Received: by mail-pl1-x62c.google.com with SMTP id p14so14598070plf.3
 for <alsa-devel@alsa-project.org>; Mon, 10 Jan 2022 16:16:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igorinstitute-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:from:date:subject:to:cc;
 bh=OKxY7uPjxFFlFQlDxYMxuTRCsaMzh8pPcJXmf3kY7ws=;
 b=hY4dwUsHvwrRkYZMn0xRmsott38t8qinCfHVdwHg3VoG4STxrJnvbsJSyfCHz/pEQw
 niCGazakcqMOBGHLHNmqT4LXgfx7CbDf0eGlrhPhIm+77Pxp1/gwNzOwWl3dQLV3+n3e
 6IOJ4ArSXc/Yqfk3+aMay+YCqoUAU0K99rsM18XwdGMPKr8+5b+D71Buy/SGGPDKDRak
 kDuC3TQ9Nt3u2C2utHUkU9QIhvn2086HuxYyJY0p3ndbkCvN+TXUO2w6vX60F/kxNTAi
 64rgLG3zJL+0gXZsz22qzXTqYVn3huJjivdGUDM5LMT1tHueCbJBeK447Fx3GlaQlnXg
 PfBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:from:date:subject:to:cc;
 bh=OKxY7uPjxFFlFQlDxYMxuTRCsaMzh8pPcJXmf3kY7ws=;
 b=KF4EarAwX9R7fIiLY/voA0Ve517APv0zYZuzD7Od3Yl9JeKQA+RvzGRjcP18VIoEyJ
 ngDsvG6wmOiJDrJ7fa52R91O9xwOPxkaPWrx6FutqnLEBOHAK9Q5ayln2nZjAHDNC+3K
 H3JtAgKjwym9n0pl9AiUMl2Vtz+ztsOUwvmlRQV3QiY3Pxe/vF67NkKQyTBAt3Yym1p2
 uOwbS0mPl6lX98q1MXB+HmiN3yeaMcsbFSfH7wneUlXnYm1jZa8B7Vd1vioo3dTtjS7U
 GLprmegX5oJiviUeaXt11CiyqrpRTpBiREmymfcqTT9RAyDr7zQjAa5tVbxBhDNXnkkR
 yUYA==
X-Gm-Message-State: AOAM530YZJ/Qn530efY9UaRsZvTxXXje9iJu11UTc0gyvO0TjQnh5Ej0
 3XtiD9hrMJ42CfXlFHm5Fw5Fd5BwYAsI9Q4T
X-Google-Smtp-Source: ABdhPJxZYag+tChJzGuDNCxkXzKJDJIn9XS0QQrdsSJ3hlk7bhBKwxuYiWEEEsEBqv5Qpk6gUbU1tg==
X-Received: by 2002:a63:a619:: with SMTP id t25mr1907796pge.235.1641860188853; 
 Mon, 10 Jan 2022 16:16:28 -0800 (PST)
Received: from localhost ([121.99.145.49])
 by smtp.gmail.com with ESMTPSA id w4sm169662pjq.7.2022.01.10.16.16.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 16:16:28 -0800 (PST)
Message-ID: <61dccc5c.1c69fb81.9af91.0df6@mx.google.com>
From: Daniel Beer <daniel.beer@igorinstitute.com>
Date: Tue, 11 Jan 2022 13:00:09 +1300
Subject: [PATCH 2/2] ASoC: dt-bindings: add bindings for TI TAS5805M.
To: alsa-devel@alsa-project.org, devicetree@vger.kernel.org
X-Mailman-Approved-At: Tue, 11 Jan 2022 17:38:43 +0100
Cc: Daniel Beer <daniel.beer@igorinstitute.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Andy Liu <andy-liu@ti.com>, Mark Brown <broonie@kernel.org>,
 Derek Simkowiak <derek.simkowiak@igorinstitute.com>
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

The TAS5805M is a class D speaker amplifier with integrated DSP. The
example here includes a tested flat configuration for mono (PBTL)
output.

Signed-off-by: Daniel Beer <daniel.beer@igorinstitute.com>
---
 .../devicetree/bindings/sound/tas5805m.yaml   | 201 ++++++++++++++++++
 1 file changed, 201 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/tas5805m.yaml

diff --git a/Documentation/devicetree/bindings/sound/tas5805m.yaml b/Documentation/devicetree/bindings/sound/tas5805m.yaml
new file mode 100644
index 000000000000..162008e6a1ed
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/tas5805m.yaml
@@ -0,0 +1,201 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/tas5805m.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TAS5805M audio amplifier
+
+maintainers:
+  - Daniel Beer <daniel.beer@igorinstitute.com>
+
+description: |
+  The TAS5805M is a class D audio amplifier with a built-in DSP.
+
+properties:
+  compatible:
+    enum:
+      - ti,tas5805m
+
+  reg:
+    maxItems: 1
+    description: |
+      I2C address of the amplifier. See the datasheet for possible values.
+
+  pvdd-supply:
+    description: |
+      Regulator for audio power supply (PVDD in the datasheet).
+
+  pdn-gpio:
+    description: |
+      Power-down control GPIO (PDN pin in the datasheet).
+
+  ti,dsp-config: |
+    description: |
+      A byte sequence giving DSP configuration. Each pair of bytes, in
+      sequence, gives a register address and a value to write. If you
+      are taking this data from TI's PPC3 tool, this should contain only
+      the register writes following the 5ms delay.
+
+examples:
+  - |
+    i2c0 {
+    	#address-cells = <1>;
+	#size-cells = <0>;
+	tas5805m: tas5805m@2c {
+		reg = <0x2c>;
+		compatible = "ti,tas5805m";
+		status = "ok";
+
+		pvdd-supply = <&audiopwr>;
+		pdn-gpio = <&tlmm 160 0>;
+
+		// Mono PBTL DSP configuration
+		ti,dsp-config = [
+			00 00 7f 00 03 00 00 00 7f 00 46 01 00 00 7f 00
+			03 02 00 00 7f 00 78 80 00 00 7f 00 61 0b 60 01
+			7d 11 7e ff 00 01 51 05 00 00 02 04 53 00 54 00
+			00 00 00 00 00 00 00 00 00 00 7f 00 66 87 7f 8c
+			00 29 18 00 19 40 1a 26 1b e7 1c 00 1d 40 1e 26
+			1f e7 20 00 21 00 22 00 23 00 24 00 25 00 26 00
+			27 00 00 2a 24 00 25 80 26 00 27 00 28 00 29 80
+			2a 00 2b 00 30 00 31 71 32 94 33 9a 00 2c 0c 00
+			0d 00 0e 00 0f 00 10 00 11 00 12 00 13 00 14 00
+			15 80 16 00 17 00 18 00 19 00 1a 00 1b 00 1c 00
+			1d 80 1e 00 1f 00 20 00 21 00 22 00 23 00 28 00
+			29 80 2a 00 2b 00 2c 00 2d 00 2e 00 2f 00 34 00
+			35 80 36 00 37 00 38 00 39 00 3a 00 3b 00 48 00
+			49 80 4a 00 4b 00 4c 00 4d 00 4e 00 4f 00 5c 00
+			5d 00 5e 57 5f 62 60 00 61 89 62 37 63 4c 64 08
+			65 13 66 85 67 62 68 40 69 00 6a 00 6b 00 6c 02
+			6d 66 6e c4 6f 1b 74 00 75 80 76 00 77 00 00 2d
+			18 7d 19 99 1a 3b 1b e5 1c 00 1d 00 1e 57 1f 62
+			20 00 21 00 22 00 23 00 24 00 25 00 26 00 27 00
+			28 00 29 00 2a 00 2b 00 2c 00 2d 80 2e 00 2f 00
+			00 2e 24 11 25 3d 26 c3 27 1a 00 00 7f aa 00 24
+			18 08 19 00 1a 00 1b 00 1c 00 1d 00 1e 00 1f 00
+			20 00 21 00 22 00 23 00 24 00 25 00 26 00 27 00
+			28 00 29 00 2a 00 2b 00 2c 08 2d 00 2e 00 2f 00
+			30 00 31 00 32 00 33 00 34 00 35 00 36 00 37 00
+			38 00 39 00 3a 00 3b 00 3c 00 3d 00 3e 00 3f 00
+			40 08 41 00 42 00 43 00 44 00 45 00 46 00 47 00
+			48 00 49 00 4a 00 4b 00 4c 00 4d 00 4e 00 4f 00
+			50 00 51 00 52 00 53 00 54 08 55 00 56 00 57 00
+			58 00 59 00 5a 00 5b 00 5c 00 5d 00 5e 00 5f 00
+			60 00 61 00 62 00 63 00 64 00 65 00 66 00 67 00
+			68 08 69 00 6a 00 6b 00 6c 00 6d 00 6e 00 6f 00
+			70 00 71 00 72 00 73 00 74 00 75 00 76 00 77 00
+			78 00 79 00 7a 00 7b 00 7c 08 7d 00 7e 00 7f 00
+			00 25 08 00 09 00 0a 00 0b 00 0c 00 0d 00 0e 00
+			0f 00 10 00 11 00 12 00 13 00 14 00 15 00 16 00
+			17 00 18 08 19 00 1a 00 1b 00 1c 00 1d 00 1e 00
+			1f 00 20 00 21 00 22 00 23 00 24 00 25 00 26 00
+			27 00 28 00 29 00 2a 00 2b 00 2c 08 2d 00 2e 00
+			2f 00 30 00 31 00 32 00 33 00 34 00 35 00 36 00
+			37 00 38 00 39 00 3a 00 3b 00 3c 00 3d 00 3e 00
+			3f 00 40 08 41 00 42 00 43 00 44 00 45 00 46 00
+			47 00 48 00 49 00 4a 00 4b 00 4c 00 4d 00 4e 00
+			4f 00 50 00 51 00 52 00 53 00 54 08 55 00 56 00
+			57 00 58 00 59 00 5a 00 5b 00 5c 00 5d 00 5e 00
+			5f 00 60 00 61 00 62 00 63 00 64 00 65 00 66 00
+			67 00 68 08 69 00 6a 00 6b 00 6c 00 6d 00 6e 00
+			6f 00 70 00 71 00 72 00 73 00 74 00 75 00 76 00
+			77 00 78 00 79 00 7a 00 7b 00 7c 08 7d 00 7e 00
+			7f 00 00 26 08 00 09 00 0a 00 0b 00 0c 00 0d 00
+			0e 00 0f 00 10 00 11 00 12 00 13 00 14 00 15 00
+			16 00 17 00 18 08 19 00 1a 00 1b 00 1c 00 1d 00
+			1e 00 1f 00 20 00 21 00 22 00 23 00 24 00 25 00
+			26 00 27 00 28 00 29 00 2a 00 2b 00 2c 08 2d 00
+			2e 00 2f 00 30 00 31 00 32 00 33 00 34 00 35 00
+			36 00 37 00 38 00 39 00 3a 00 3b 00 3c 00 3d 00
+			3e 00 3f 00 40 08 41 00 42 00 43 00 44 00 45 00
+			46 00 47 00 48 00 49 00 4a 00 4b 00 4c 00 4d 00
+			4e 00 4f 00 50 00 51 00 52 00 53 00 54 08 55 00
+			56 00 57 00 58 00 59 00 5a 00 5b 00 5c 00 5d 00
+			5e 00 5f 00 60 00 61 00 62 00 63 00 64 00 65 00
+			66 00 67 00 68 08 69 00 6a 00 6b 00 6c 00 6d 00
+			6e 00 6f 00 70 00 71 00 72 00 73 00 74 00 75 00
+			76 00 77 00 78 00 79 00 7a 00 7b 00 7c 08 7d 00
+			7e 00 7f 00 00 27 08 00 09 00 0a 00 0b 00 0c 00
+			0d 00 0e 00 0f 00 10 00 11 00 12 00 13 00 14 00
+			15 00 16 00 17 00 18 08 19 00 1a 00 1b 00 1c 00
+			1d 00 1e 00 1f 00 20 00 21 00 22 00 23 00 24 00
+			25 00 26 00 27 00 28 00 29 00 2a 00 2b 00 2c 08
+			2d 00 2e 00 2f 00 30 00 31 00 32 00 33 00 34 00
+			35 00 36 00 37 00 38 00 39 00 3a 00 3b 00 3c 00
+			3d 00 3e 00 3f 00 40 08 41 00 42 00 43 00 44 00
+			45 00 46 00 47 00 48 00 49 00 4a 00 4b 00 4c 00
+			4d 00 4e 00 4f 00 50 00 51 00 52 00 53 00 54 08
+			55 00 56 00 57 00 58 00 59 00 5a 00 5b 00 5c 00
+			5d 00 5e 00 5f 00 60 00 61 00 62 00 63 00 64 00
+			65 00 66 00 67 00 68 08 69 00 6a 00 6b 00 6c 00
+			6d 00 6e 00 6f 00 70 00 71 00 72 00 73 00 74 00
+			75 00 76 00 77 00 78 00 79 00 7a 00 7b 00 7c 08
+			7d 00 7e 00 7f 00 00 28 08 00 09 00 0a 00 0b 00
+			0c 00 0d 00 0e 00 0f 00 10 00 11 00 12 00 13 00
+			14 00 15 00 16 00 17 00 18 08 19 00 1a 00 1b 00
+			1c 00 1d 00 1e 00 1f 00 20 00 21 00 22 00 23 00
+			24 00 25 00 26 00 27 00 28 00 29 00 2a 00 2b 00
+			2c 08 2d 00 2e 00 2f 00 30 00 31 00 32 00 33 00
+			34 00 35 00 36 00 37 00 38 00 39 00 3a 00 3b 00
+			3c 00 3d 00 3e 00 3f 00 40 08 41 00 42 00 43 00
+			44 00 45 00 46 00 47 00 48 00 49 00 4a 00 4b 00
+			4c 00 4d 00 4e 00 4f 00 50 00 51 00 52 00 53 00
+			54 08 55 00 56 00 57 00 58 00 59 00 5a 00 5b 00
+			5c 00 5d 00 5e 00 5f 00 60 00 61 00 62 00 63 00
+			64 00 65 00 66 00 67 00 68 08 69 00 6a 00 6b 00
+			6c 00 6d 00 6e 00 6f 00 70 00 71 00 72 00 73 00
+			74 00 75 00 76 00 77 00 78 00 79 00 7a 00 7b 00
+			7c 08 7d 00 7e 00 7f 00 00 29 08 00 09 00 0a 00
+			0b 00 0c 00 0d 00 0e 00 0f 00 10 00 11 00 12 00
+			13 00 14 00 15 00 16 00 17 00 00 2e 7c 08 7d 00
+			7e 00 7f 00 00 2f 08 00 09 00 0a 00 0b 00 0c 00
+			0d 00 0e 00 0f 00 10 00 11 00 12 00 13 00 14 00
+			15 00 16 00 17 00 1c 08 1d 00 1e 00 1f 00 20 00
+			21 00 22 00 23 00 24 00 25 00 26 00 27 00 28 00
+			29 00 2a 00 2b 00 2c 00 2d 00 2e 00 2f 00 00 2a
+			48 00 49 01 4a 64 4b 0a 4c 00 4d 01 4e 64 4f 0a
+			50 00 51 01 52 64 53 0a 54 7e 55 d0 56 b5 57 2d
+			58 82 59 59 5a 05 5b 7b 00 00 7f 8c 00 2b 34 00
+			35 0d 36 a6 37 86 38 00 39 0d 3a a6 3b 86 3c 00
+			3d 06 3e d3 3f 72 40 00 41 00 42 00 43 00 44 00
+			45 00 46 00 47 00 48 ff 49 81 4a 47 4b ae 4c f9
+			4d 06 4e 21 4f a9 50 fe 51 01 52 c0 53 79 54 00
+			55 00 56 00 57 00 58 00 59 00 5a 00 5b 00 00 2d
+			58 01 59 53 5a 8f 5b cc 5c 01 5d 53 5e 8f 5f cc
+			60 00 61 22 62 1d 63 95 64 00 65 00 66 00 67 00
+			68 00 69 00 6a 00 6b 00 6c ff 6d 81 6e 47 6f ae
+			70 f9 71 06 72 21 73 a9 74 fe 75 01 76 c0 77 79
+			78 00 79 00 7a 00 7b 00 7c 00 7d 00 7e 00 7f 00
+			00 00 7f aa 00 2e 40 01 41 d7 42 e8 43 0a 44 01
+			45 d7 46 e8 47 0a 48 01 49 d7 4a e8 4b 0a 4c 68
+			4d 82 4e f5 4f bf 50 a7 51 9a 52 74 53 5a 00 2b
+			20 6a 21 5a 22 dd 23 c9 24 95 25 a5 26 22 27 37
+			28 6a 29 5a 2a dd 2b c9 2c 68 2d 82 2e f5 2f bf
+			30 a7 31 9a 32 74 33 5a 0c 6a 0d 5a 0e dd 0f c9
+			10 95 11 a5 12 22 13 37 14 6a 15 5a 16 dd 17 c9
+			18 68 19 82 1a f5 1b bf 1c a7 1d 9a 1e 74 1f 5a
+			00 2a 34 00 35 01 36 64 37 0a 38 00 39 01 3a 64
+			3b 0a 3c 00 3d 01 3e 64 3f 0a 40 7e 41 d0 42 b5
+			43 2d 44 82 45 59 46 05 47 7b 00 00 7f 8c 00 2d
+			30 01 31 53 32 8f 33 cc 34 01 35 53 36 8f 37 cc
+			38 00 39 03 3a 69 3b c5 3c 00 3d 00 3e 00 3f 00
+			40 00 41 00 42 00 43 00 44 ff 45 81 46 47 47 ae
+			48 f9 49 06 4a 21 4b a9 4c fe 4d 01 4e c0 4f 79
+			50 00 51 00 52 00 53 00 54 00 55 00 56 00 57 00
+			00 00 7f aa 00 2a 5c 7e 5d d2 5e 19 5f 37 60 81
+			61 2d 62 e6 63 c9 64 7e 65 d2 66 19 67 37 68 7e
+			69 d0 6a b5 6b 2d 6c 82 6d 59 6e 05 6f 7b 70 7e
+			71 d2 72 19 73 37 74 81 75 2d 76 e6 77 c9 78 7e
+			79 d2 7a 19 7b 37 7c 7e 7d d0 7e b5 7f 2d 00 2b
+			08 82 09 59 0a 05 0b 7b 00 2e 54 01 55 d7 56 e8
+			57 0a 58 01 59 d7 5a e8 5b 0a 5c 01 5d d7 5e e8
+			5f 0a 60 68 61 82 62 f5 63 bf 64 a7 65 9a 66 74
+			67 5a 00 00 7f 8c 00 2e 10 00 11 80 12 00 13 00
+			0c 00 0d 80 0e 00 0f 00 08 00 09 80 0a 00 0b 00
+			18 00 19 80 1a 00 1b 00 1c 40 1d 00 1e 00 1f 00
+			20 40 21 00 22 00 23 00 00 00 7f 00 30 00 4c 30
+			03 03 00 00 7f 00 78 80
+		];
+	};
+    };
-- 
2.30.2

