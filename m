Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58676380EC5
	for <lists+alsa-devel@lfdr.de>; Fri, 14 May 2021 19:23:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E075D179A;
	Fri, 14 May 2021 19:22:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E075D179A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621012985;
	bh=zSUDuneYPwT8BBtlL7wod6h5Sdbl25Im9VRK8WhFkfs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BxBZcVSaNda2zmm9SPbvdWvYZyKqR0C7Jlk4fwCLez7KNhBLRpKqH3GL+tw4MeADu
	 U7DXbsBBJNjm8yO+yaRYZ4w1IyqiHQ4+o1UCOJ0S+LuoRZqXZO3NNxr21/re0wvh9m
	 W6UsT3hHZzd50WRilT4ZxlUrMY7IjLiGlXjp+f+Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A5004F804B0;
	Fri, 14 May 2021 19:20:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 51E79F80272; Fri, 14 May 2021 19:20:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 04F0EF8026B
 for <alsa-devel@alsa-project.org>; Fri, 14 May 2021 19:20:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04F0EF8026B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="pYqHTTux"
Received: by mail-oi1-x22e.google.com with SMTP id x15so116174oic.13
 for <alsa-devel@alsa-project.org>; Fri, 14 May 2021 10:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XImWdEYC3gDQdFM+D/yVM45WqAeLrw/TsyXb3e1uXWE=;
 b=pYqHTTuxdGSEP9E4YGxU1o/AuIx8kIVyQcdFUPBpnp6pp4ZEObg2iQfOEHjGyzfTVX
 x9sjsK6uX8ry7n6s3RB/sgqbXx83W3owc4VpWBTepSMNkQ5RmaCIfIZ4/WL+RoDfK9vl
 DlrroWVzEZjDNIzXdaIMu1AY3gO3HRTPSyDlsWBnJmhIcEL2XTV2/+oBYn8Ndl40e+xB
 zmysYtZBOJNR4cnX8g7JuhUs74LimbklGkRDTx782cPSPtoEKwVlIY6WUiyneiKqkyWd
 Ki4YW/NtmQNWpMEBEhOIEOgTWmhSIgfjsP5OvGAc63IMq386UCZe16SrUwCZ1OXflC/C
 a8Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XImWdEYC3gDQdFM+D/yVM45WqAeLrw/TsyXb3e1uXWE=;
 b=ZDlC7TfCHT2z9W6bbYYEUBSB+KsvyclAiOlvE6CxW9jvfSxlp5E/KqGQjme4YfK6tn
 gMEhpVkOWfDvW+CBpDfx6CBirL8CYeT21FrnrdBFRrV0e21wZZGWOzRWpGoiwdelCIgF
 6TUt7Ayf5KpOXiOJKFsrDffnh3lBT+IGaKaTT7G7o3ysucuITU5Doy8/IrViEv+L9NIy
 6VxM6l+04cCNT8q3Ee8hPVjFj2PpeZHzYYUhD5JsBV1kl1puOvyXrALVHOXtqPiQc+Z+
 +4TliOB7Cf7AOhZS85ttwA6L4Locg+ydPSYXi4z5Ae2MRhiXEA5T15aUggefkVgR16w+
 zdpA==
X-Gm-Message-State: AOAM5338UdnZiiUJM+bwkqRiZtzNAT5I9xeniaPRDGK5qDze1iaA7Ec+
 sbGCBgPwJq/+k8k8iKf2BdCHIuGUePk=
X-Google-Smtp-Source: ABdhPJyVvlmz5ONd0vvjUhfdgkH8DXQm7uJ/noA95b1cQMV54bqY4SzZCdeOWf0Pbx5Q67mHUW/SQQ==
X-Received: by 2002:aca:6505:: with SMTP id m5mr33381113oim.93.1621012799713; 
 Fri, 14 May 2021 10:19:59 -0700 (PDT)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com.
 [76.183.134.35])
 by smtp.gmail.com with ESMTPSA id x14sm1302547oic.3.2021.05.14.10.19.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 10:19:59 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v10 3/4] dt-bindings: Add Rockchip rk817 audio CODEC support
Date: Fri, 14 May 2021 12:19:39 -0500
Message-Id: <20210514171940.20831-4-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210514171940.20831-1-macroalpha82@gmail.com>
References: <20210514171940.20831-1-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com, heiko@sntech.de,
 devicetree@vger.kernel.org, tiwai@suse.com, robh+dt@kernel.org,
 lgirdwood@gmail.com, linux-rockchip@lists.infradead.org, broonie@kernel.org,
 Chris Morgan <macromorgan@hotmail.com>, jbx6244@gmail.com,
 lee.jones@linaro.org, Rob Herring <robh@kernel.org>, maccraft123mc@gmail.com
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

From: Chris Morgan <macromorgan@hotmail.com>

Create dt-binding documentation to document rk817 codec.
New property name of rockchip,mic-in-differential added to control if
the microphone is in differential mode or not.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Tested-by: Maciej Matuszczyk <maccraft123mc@gmail.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/mfd/rk808.txt         | 186 ++++++++++++++++++
 1 file changed, 186 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/rk808.txt b/Documentation/devicetree/bindings/mfd/rk808.txt
index 04df07f6f793..56121039154f 100644
--- a/Documentation/devicetree/bindings/mfd/rk808.txt
+++ b/Documentation/devicetree/bindings/mfd/rk808.txt
@@ -23,6 +23,7 @@ Optional properties:
   default output clock name
 - rockchip,system-power-controller: Telling whether or not this pmic is controlling
   the system power.
+- wakeup-source: Device can be used as a wakeup source.
 
 Optional RK805 properties:
 - vcc1-supply:  The input supply for DCDC_REG1
@@ -63,8 +64,16 @@ Optional RK809 properties:
 - vcc9-supply:  The input supply for DCDC_REG5, SWITCH_REG2
 
 Optional RK817 properties:
+- clocks:	The input clock for the audio codec
+- clock-names:	The clock name for the codec clock. Should be "mclk".
+- #sound-dai-cells: Needed for the interpretation of sound dais. Should be 0.
+
 - vcc8-supply:  The input supply for BOOST
 - vcc9-supply:  The input supply for OTG_SWITCH
+- codec:	The child node for the codec to hold additional properties.
+
+- rockchip,mic-in-differential: Telling if the microphone uses differential
+				mode. Should be under the codec child node.
 
 Optional RK818 properties:
 - vcc1-supply:  The input supply for DCDC_REG1
@@ -275,3 +284,180 @@ Example:
 			};
 		};
 	};
+
+	rk817: pmic@20 {
+		compatible = "rockchip,rk817";
+		reg = <0x20>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PB2 IRQ_TYPE_LEVEL_LOW>;
+		clock-output-names = "rk808-clkout1", "xin32k";
+		clock-names = "mclk";
+		clocks = <&cru SCLK_I2S1_OUT>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pmic_int>, <&i2s1_2ch_mclk>;
+		wakeup-source;
+		#clock-cells = <1>;
+		#sound-dai-cells = <0>;
+
+		vcc1-supply = <&vccsys>;
+		vcc2-supply = <&vccsys>;
+		vcc3-supply = <&vccsys>;
+		vcc4-supply = <&vccsys>;
+		vcc5-supply = <&vccsys>;
+		vcc6-supply = <&vccsys>;
+		vcc7-supply = <&vccsys>;
+
+		regulators {
+			vdd_logic: DCDC_REG1 {
+				regulator-name = "vdd_logic";
+				regulator-min-microvolt = <950000>;
+				regulator-max-microvolt = <1150000>;
+				regulator-ramp-delay = <6001>;
+				regulator-always-on;
+				regulator-boot-on;
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <950000>;
+				};
+			};
+
+			vdd_arm: DCDC_REG2 {
+				regulator-name = "vdd_arm";
+				regulator-min-microvolt = <950000>;
+				regulator-max-microvolt = <1350000>;
+				regulator-ramp-delay = <6001>;
+				regulator-always-on;
+				regulator-boot-on;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+					regulator-suspend-microvolt = <950000>;
+				};
+			};
+
+			vcc_ddr: DCDC_REG3 {
+				regulator-name = "vcc_ddr";
+				regulator-always-on;
+				regulator-boot-on;
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+				};
+			};
+
+			vcc_3v3: DCDC_REG4 {
+				regulator-name = "vcc_3v3";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+				regulator-boot-on;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+					regulator-suspend-microvolt = <3300000>;
+				};
+			};
+
+			vcc_1v8: LDO_REG2 {
+				regulator-name = "vcc_1v8";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+				regulator-boot-on;
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <1800000>;
+				};
+			};
+
+			vdd_1v0: LDO_REG3 {
+				regulator-name = "vdd_1v0";
+				regulator-min-microvolt = <1000000>;
+				regulator-max-microvolt = <1000000>;
+				regulator-always-on;
+				regulator-boot-on;
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <1000000>;
+				};
+			};
+
+			vcc3v3_pmu: LDO_REG4 {
+				regulator-name = "vcc3v3_pmu";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+				regulator-boot-on;
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <3300000>;
+				};
+			};
+
+			vccio_sd: LDO_REG5 {
+				regulator-name = "vccio_sd";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+				regulator-boot-on;
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <3300000>;
+				};
+			};
+
+			vcc_sd: LDO_REG6 {
+				regulator-name = "vcc_sd";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <3300000>;
+				};
+			};
+
+			vcc_bl: LDO_REG7 {
+				regulator-name = "vcc_bl";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+					regulator-suspend-microvolt = <3300000>;
+				};
+			};
+
+			vcc_lcd: LDO_REG8 {
+				regulator-name = "vcc_lcd";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+					regulator-suspend-microvolt = <2800000>;
+				};
+			};
+
+			vcc_cam: LDO_REG9 {
+				regulator-name = "vcc_cam";
+				regulator-min-microvolt = <3000000>;
+				regulator-max-microvolt = <3000000>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+					regulator-suspend-microvolt = <3000000>;
+				};
+			};
+		};
+
+		rk817_codec: codec {
+			rockchip,mic-in-differential;
+		};
+	};
-- 
2.25.1

