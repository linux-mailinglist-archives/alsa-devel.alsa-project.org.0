Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B921572CA
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Feb 2020 11:25:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AEAC116A6;
	Mon, 10 Feb 2020 11:24:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AEAC116A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581330313;
	bh=WmndlAwzPgNeTgUH8/VHBpAeP4bG9IoRkNCoEThaL0A=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fg3tU1Vi3k93VP1m2oKxOGxJ5GPjE0vaFDDvGQcQag+hK0S3w1J1gqY7RXJ/eOLo7
	 KV7AMIyS77vH6rzAE1Paol6ZIZCEfWdUHibO5BcXpeDhEzWQ15lK9b13jx55LSk1qe
	 7y32hJJTjRxHPXx2DNBGHywTY9neT6ShIovYhMOw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C037F80290;
	Mon, 10 Feb 2020 11:20:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D95FAF80148; Fri,  7 Feb 2020 21:51:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.serbinski.com (mail.serbinski.com [162.218.126.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A17ECF80142
 for <alsa-devel@alsa-project.org>; Fri,  7 Feb 2020 21:50:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A17ECF80142
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=serbinski.com header.i=@serbinski.com
 header.b="pnJapL0n"
Received: from localhost (unknown [127.0.0.1])
 by mail.serbinski.com (Postfix) with ESMTP id 4D8AAD0072F;
 Fri,  7 Feb 2020 20:50:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at serbinski.com
Received: from mail.serbinski.com ([127.0.0.1])
 by localhost (mail.serbinski.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7OH4Fn6roD_i; Fri,  7 Feb 2020 15:50:48 -0500 (EST)
Received: from anet
 (ipagstaticip-7ac5353e-e7de-3a0d-ff65-4540e9bc137f.sdsl.bell.ca
 [142.112.15.192]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mail.serbinski.com (Postfix) with ESMTPSA id 80A6FD0071A;
 Fri,  7 Feb 2020 15:50:29 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.serbinski.com 80A6FD0071A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=serbinski.com;
 s=default; t=1581108629;
 bh=RK5IpRYsxcPRYlaYj86ZYdu7gWBdBOr0c1FyuH6bqVI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pnJapL0nbYR4JbCUWxS4auCjvytY3NrnsR4Iki0y9nEhVNABk+YEE6wc6rcVLUJbg
 +xceFnUUFDGk1GiTaOqu0oZU8QyekmRzkylDkdTbok2sF/3ilTYaPiq2kX+fNgprca
 CictpRsbeW3YPswoPqXJ2pzFFSGQdpudmGnOjOxM=
From: Adam Serbinski <adam@serbinski.com>
To: Mark Brown <broonie@kernel.org>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Date: Fri,  7 Feb 2020 15:50:12 -0500
Message-Id: <20200207205013.12274-8-adam@serbinski.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200207205013.12274-1-adam@serbinski.com>
References: <20200207205013.12274-1-adam@serbinski.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 10 Feb 2020 11:20:06 +0100
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, Patrick Lai <plai@codeaurora.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Andy Gross <agross@kernel.org>, Adam Serbinski <adam@serbinski.com>,
 linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH 7/8] dts: msm8996/db820c: enable primary pcm
	and quaternary i2s
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This patch adds support to primary pcm and quaternary i2s ports.

Signed-off-by: Adam Serbinski <adam@serbinski.com>
CC: Andy Gross <agross@kernel.org>
CC: Mark Rutland <mark.rutland@arm.com>
CC: Liam Girdwood <lgirdwood@gmail.com>
CC: Patrick Lai <plai@codeaurora.org>
CC: Banajit Goswami <bgoswami@codeaurora.org>
CC: Jaroslav Kysela <perex@perex.cz>
CC: Takashi Iwai <tiwai@suse.com>
CC: alsa-devel@alsa-project.org
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
---
 arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi | 113 +++++++++++++
 arch/arm64/boot/dts/qcom/msm8996-pins.dtsi   | 162 +++++++++++++++++++
 2 files changed, 275 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
index dba3488492f1..4149ac4147a0 100644
--- a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
@@ -683,8 +683,31 @@
 	};
 };
 
+/* PRI I2S on QCA6174 and QUAT I2S on LS each uses 2 I2S SD Lines for audio */
+&q6afedai {
+	pi2s@16 {
+		reg = <16>;
+		qcom,sd-lines = <1>;
+	};
+	pi2s@17 {
+		reg = <17>;
+		qcom,sd-lines = <0>;
+	};
+	qi2s@22 {
+		reg = <22>;
+		qcom,sd-lines = <0>;
+	};
+	qi2s@23 {
+		reg = <23>;
+		qcom,sd-lines = <1>;
+	};
+};
+
 &sound {
 	compatible = "qcom,apq8096-sndcard";
+	pinctrl-0 = <&quat_mi2s_active &quat_mi2s_sd0_active &quat_mi2s_sd1_active &pri_mi2s_active &pri_mi2s_sd0_active &pri_mi2s_sd1_active>;
+	pinctrl-names = "default";
+
 	model = "DB820c";
 	audio-routing =	"RX_BIAS", "MCLK";
 
@@ -709,6 +732,41 @@
 		};
 	};
 
+	mm4-dai-link {
+		link-name = "MultiMedia4";
+		cpu {
+			sound-dai = <&q6asmdai  MSM_FRONTEND_DAI_MULTIMEDIA4>;
+		};
+	};
+
+	mm5-dai-link {
+		link-name = "MultiMedia5";
+		cpu {
+			sound-dai = <&q6asmdai  MSM_FRONTEND_DAI_MULTIMEDIA5>;
+		};
+	};
+
+	mm6-dai-link {
+		link-name = "MultiMedia6";
+		cpu {
+			sound-dai = <&q6asmdai  MSM_FRONTEND_DAI_MULTIMEDIA6>;
+		};
+	};
+
+	mm7-dai-link {
+		link-name = "MultiMedia7";
+		cpu {
+			sound-dai = <&q6asmdai  MSM_FRONTEND_DAI_MULTIMEDIA7>;
+		};
+	};
+
+	mm8-dai-link {
+		link-name = "MultiMedia8";
+		cpu {
+			sound-dai = <&q6asmdai  MSM_FRONTEND_DAI_MULTIMEDIA8>;
+		};
+	};
+
 	hdmi-dai-link {
 		link-name = "HDMI";
 		cpu {
@@ -753,4 +811,59 @@
 			sound-dai = <&wcd9335 1>;
 		};
 	};
+
+	scoplay-dai-link {
+		link-name = "SCO-PCM-Playback";
+		cpu {
+			sound-dai = <&q6afedai PRIMARY_PCM_RX>;
+		};
+
+		platform {
+			sound-dai = <&q6routing>;
+		};
+	};
+
+	scocap-dai-link {
+		link-name = "SCO-PCM-Capture";
+		cpu {
+			sound-dai = <&q6afedai PRIMARY_PCM_TX>;
+		};
+
+		platform {
+			sound-dai = <&q6routing>;
+		};
+	};
+
+	mi2splay-dai-link {
+		link-name = "QUAT-MI2S-Playback";
+		cpu {
+			sound-dai = <&q6afedai QUATERNARY_MI2S_RX>;
+		};
+
+		platform {
+			sound-dai = <&q6routing>;
+		};
+
+//		EXAMPLE: For adding real codecs
+//		codec {
+//			sound-dai = <&pcm5142_4c>, <&pcm5142_4d>;
+//		};
+
+	};
+
+	mi2scap-dai-link {
+		link-name = "QUAT-MI2S-Capture";
+		cpu {
+			sound-dai = <&q6afedai QUATERNARY_MI2S_TX>;
+		};
+
+		platform {
+			sound-dai = <&q6routing>;
+		};
+
+//		EXAMPLE: For adding real codecs
+//		codec {
+//			sound-dai = <&pcm1865>;
+//		};
+	};
 };
diff --git a/arch/arm64/boot/dts/qcom/msm8996-pins.dtsi b/arch/arm64/boot/dts/qcom/msm8996-pins.dtsi
index ac1ede579361..e8221c4d05f7 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-pins.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996-pins.dtsi
@@ -288,6 +288,168 @@
 		};
 	};
 
+	pri_mi2s_active: pri_mi2s_active {
+		mux {
+			pins = "gpio65", "gpio66";
+			function = "pri_mi2s";
+		};
+		config {
+			pins = "gpio65", "gpio66";
+			drive-strength = <8>;   /* 8 mA */
+			bias-disable;           /* NO PULL */
+			output-high;
+		};
+	};
+
+	pri_mi2s_sleep: pri_mi2s_sleep {
+		mux {
+			pins = "gpio65", "gpio66";
+			function = "gpio";
+		};
+
+		config {
+			pins = "gpio65", "gpio66";
+			drive-strength = <2>;   /* 2 mA */
+			bias-pull-down;         /* PULL DOWN */
+			input-enable;
+		};
+	};
+
+	pri_mi2s_sd0_sleep: pri_mi2s_sd0_sleep {
+		mux {
+			pins = "gpio67";
+			function = "gpio";
+		};
+
+		config {
+			pins = "gpio67";
+			drive-strength = <2>;   /* 2 mA */
+			bias-pull-down;         /* PULL DOWN */
+			input-enable;
+		};
+	};
+
+	pri_mi2s_sd0_active: pri_mi2s_sd0_active {
+		mux {
+			pins = "gpio67";
+			function = "pri_mi2s";
+		};
+
+		config {
+			pins = "gpio67";
+			drive-strength = <8>;   /* 8 mA */
+			bias-disable;           /* NO PULL */
+		};
+	};
+
+	pri_mi2s_sd1_sleep: pri_mi2s_sd1_sleep {
+		mux {
+			pins = "gpio68";
+			function = "gpio";
+		};
+
+		config {
+			pins = "gpio68";
+			drive-strength = <2>;   /* 2 mA */
+			bias-pull-down;         /* PULL DOWN */
+			input-enable;
+		};
+	};
+
+	pri_mi2s_sd1_active: pri_mi2s_sd1_active {
+		mux {
+			pins = "gpio68";
+			function = "pri_mi2s";
+		};
+
+		config {
+			pins = "gpio68";
+			drive-strength = <8>;   /* 8 mA */
+			bias-disable;           /* NO PULL */
+		};
+	};
+
+	quat_mi2s_active: quat_mi2s_active {
+		mux {
+			pins = "gpio58", "gpio59";
+			function = "qua_mi2s";
+		};
+		config {
+			pins = "gpio58", "gpio59";
+			drive-strength = <8>;   /* 8 mA */
+			bias-disable;           /* NO PULL */
+			output-high;
+		};
+	};
+
+	quat_mi2s_sleep: quat_mi2s_sleep {
+		mux {
+			pins = "gpio58", "gpio59";
+			function = "gpio";
+		};
+
+		config {
+			pins = "gpio58", "gpio59";
+			drive-strength = <2>;   /* 2 mA */
+			bias-pull-down;         /* PULL DOWN */
+			input-enable;
+		};
+	};
+
+	quat_mi2s_sd0_sleep: quat_mi2s_sd0_sleep {
+		mux {
+			pins = "gpio60";
+			function = "gpio";
+		};
+
+		config {
+			pins = "gpio60";
+			drive-strength = <2>;   /* 2 mA */
+			bias-pull-down;         /* PULL DOWN */
+			input-enable;
+		};
+	};
+
+	quat_mi2s_sd0_active: quat_mi2s_sd0_active {
+		mux {
+			pins = "gpio60";
+			function = "qua_mi2s";
+		};
+
+		config {
+			pins = "gpio60";
+			drive-strength = <8>;   /* 8 mA */
+			bias-disable;           /* NO PULL */
+		};
+	};
+
+	quat_mi2s_sd1_sleep: quat_mi2s_sd1_sleep {
+		mux {
+			pins = "gpio61";
+			function = "gpio";
+		};
+
+		config {
+			pins = "gpio61";
+			drive-strength = <2>;   /* 2 mA */
+			bias-pull-down;         /* PULL DOWN */
+			input-enable;
+		};
+	};
+
+	quat_mi2s_sd1_active: quat_mi2s_sd1_active {
+		mux {
+			pins = "gpio61";
+			function = "qua_mi2s";
+		};
+
+		config {
+			pins = "gpio61";
+			drive-strength = <8>;   /* 8 mA */
+			bias-disable;           /* NO PULL */
+		};
+	};
+
 	sdc2_clk_on: sdc2_clk_on {
 		config {
 			pins = "sdc2_clk";
-- 
2.21.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
