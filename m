Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5E0916EC1
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jun 2024 19:03:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9177BB6A;
	Tue, 25 Jun 2024 19:03:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9177BB6A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719334996;
	bh=y3htqwDN0XseeP3AmeXvMD2+z6ibtcfQIpv1xEtcXxY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=h+YQfYrKpr+whXHjATpsdACfy7RHXRGb+3nh79f3VUq42iV4+JGW5ogojMgjmzxsR
	 uLKJACYcmlru9yzf242w0ryF3JXSWCGPMpIneopij6uVV//3bDtlEmvjYn1s6+BZ5I
	 w+y9uHmuFmUN8gxS5jZpwHfT6bGUK9loMWFTUIgE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 45F13F805A8; Tue, 25 Jun 2024 19:02:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 513B6F805A0;
	Tue, 25 Jun 2024 19:02:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7AEF4F8049C; Tue, 25 Jun 2024 18:59:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 15740F80495
	for <alsa-devel@alsa-project.org>; Tue, 25 Jun 2024 18:59:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15740F80495
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=te4bBZ8c
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-424a3199302so8920025e9.1
        for <alsa-devel@alsa-project.org>;
 Tue, 25 Jun 2024 09:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719334746; x=1719939546;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Feb3wBs1ylh68PPfyazYh/ye8uWe345y7ux2XOxGtQc=;
        b=te4bBZ8cOmqEvn80BF6W4BJthkdrl6F5PzbiswpC4TxCh3bi6z+w3FXt6swmH19qMX
         /Oq/yVBVn3PZqjdZgvC1QS2t8Fx8HX5Sp3wOxN4Mu7uoM2POuVmNthvoY/4LdgHRx3j8
         wA1SUyK3NliLPjAeptPhFIAefXZxlS6rB9zYXG19ZHtU5ckECNF0s3MJWMSchwspdiBM
         7P3WQODRbhUjj91FwhrJ3kFv+WO2NzuJsmudgyXsyay5z+B/+L93QYhys//wit2kIrRq
         qLfwHFOHlbgxRCxkTng0gwgLAFadFGpsAo1VLoJt+pnEt4SKee7mjUEzSNmqRJhq82PQ
         KyAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719334746; x=1719939546;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Feb3wBs1ylh68PPfyazYh/ye8uWe345y7ux2XOxGtQc=;
        b=iLhIdkG74kThbvcOe68m6YNvMhEO7hw0KeLScwvA8OLA1bvoEaOiRhUmPCroVUqkZ5
         V//LjvURb4tqvDNS4i3fiMfOabh1+i8jxfSS4556kpZHyl0cKArfTHLJI3Bx36bzijBR
         TGvuNTxJ1q5hQYFuahQvmzEiyvFGKonAn/coCjaTBNOL816rAE4fV4RmmSJl+FglOD81
         d0Vs7xj7/G0patTrO34HGRFhA+Wx2ItlB9zbybzEkJVAyLW0DaOxKCzU0+Cgml6zmOyJ
         gpR4Z9UHn1gLcOWAxt/aPCh4nwSZYj6ww+FDhYHtBUijtLv1BzUPt74z0gHd/bUusABG
         7ofg==
X-Gm-Message-State: AOJu0YzgkkMMlMrmFMlViQH+EtKHGKXEiZNryoJrKcIbJiRsCq+/bAWN
	hZDKy2hSYn5VdBUvkw0myD4OxLelXve7VicuHwdhWMkx1fmy8mEQgWGxc2d4200=
X-Google-Smtp-Source: 
 AGHT+IF22UzZEXFpOzb2iTYo18q9uFVJ17yVvrzfWKhY5vzcQTEtrJtYbkUY+Dxz7erSrRO6h1E3Uw==
X-Received: by 2002:a05:600c:5692:b0:424:8dba:4a43 with SMTP id
 5b1f17b1804b1-4248dba4d52mr64609925e9.5.1719334745824;
        Tue, 25 Jun 2024 09:59:05 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4247d211881sm217969785e9.46.2024.06.25.09.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 09:59:05 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 25 Jun 2024 18:58:47 +0200
Subject: [PATCH 3/3] ASoC: codecs: lpass-wsa-macro: Correct support for
 newer v2.5 version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20240625-qcom-audio-wsa-second-speaker-v1-3-f65ffdfc368c@linaro.org>
References: 
 <20240625-qcom-audio-wsa-second-speaker-v1-0-f65ffdfc368c@linaro.org>
In-Reply-To: 
 <20240625-qcom-audio-wsa-second-speaker-v1-0-f65ffdfc368c@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=17313;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=y3htqwDN0XseeP3AmeXvMD2+z6ibtcfQIpv1xEtcXxY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmevdTrYCdl0xpneRexSl2DMx1gUNiw1OaG/46W
 Wv43wh7eYCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZnr3UwAKCRDBN2bmhouD
 15ZzD/0QyjS8pm+NZhuquJtxoPqTkvHKXJooFqpHPE9I30J1LxK12yQ/k2Qc0GTVFlSUfcacA0k
 CoF7Jj9Lm2Kq0nC9VR65L0/0luuI3zItFWmRY+XrNKwVm1SqdlODVdQ6G2+xmTlHO9hNjBYXv2y
 6Dhc+d2jfrdjcaPSu+AE56LvU4vltSHpLlOSbLWUT3i6rtoEWnEnYVBKboENXFtoYUN8829mqMa
 LEMsw6HZlyT+hRIn8hgYukKTFasW0bElwPpO9/b1r+xoBkCJes0rj9oXZZm2f6BOoI/VQDYpJOc
 vU+vutYstpNEHL/kD9qJG5hD09q5C6TJiRRZdgEhs3yoL6JMjeyFV9crtJRINqOSphWxtku+HjL
 fKHxvURtttOP4G5me2Jvjz2W7/OAePl92m0eotEELRklVcKUQO89CjqX1r1rY5G4QNOGiHTjq9W
 01OrCx0lD+/fo1bd+F+NtNuYbHelbeJZNc9EWcCgOSdN5pdpBCMZcRP/q3wEb93JgeJs5faje6S
 d8UXXvHHtYrr5JLCJE9zyhHvYCcprfr+YVDrTN+9IwlRsuO5LEC65GU18SuDhOqdG4lSqgf6IQz
 jn13QLkUoQRJVrxUt9n1/uVmXaanjeeWXnOu9p/dlDmETW2UTREwTR9ga0UwQePU5wclp82gmAx
 jlHuL7hjXRTAp9A==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: KCZQHICTTL24V42U5A45LKDPHHHHMXCJ
X-Message-ID-Hash: KCZQHICTTL24V42U5A45LKDPHHHHMXCJ
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KCZQHICTTL24V42U5A45LKDPHHHHMXCJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Starting with v2.5 of Qualcomm LPASS Codec, few registers in the WSA
macro block change.  Bring proper support for this v2.5 and newer
versions, to fix second speaker playback (speaker was silent).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/lpass-wsa-macro.c | 309 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 306 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index 7888bc6c7dbb..10900c6bca7d 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -216,6 +216,47 @@
 #define CDC_WSA_SOFTCLIP1_CRC			(0x0640)
 #define CDC_WSA_SOFTCLIP1_SOFTCLIP_CTRL		(0x0644)
 
+/* LPASS codec version >=2.5 register offsets */
+#define CDC_WSA_TOP_FS_UNGATE			(0x00AC)
+#define CDC_WSA_TOP_GRP_SEL			(0x00B0)
+#define CDC_WSA_TOP_FS_UNGATE2			(0x00DC)
+#define CDC_2_5_WSA_COMPANDER0_CTL8		(0x05A0)
+#define CDC_2_5_WSA_COMPANDER0_CTL9		(0x05A4)
+#define CDC_2_5_WSA_COMPANDER0_CTL10		(0x05A8)
+#define CDC_2_5_WSA_COMPANDER0_CTL11		(0x05AC)
+#define CDC_2_5_WSA_COMPANDER0_CTL12		(0x05B0)
+#define CDC_2_5_WSA_COMPANDER0_CTL13		(0x05B4)
+#define CDC_2_5_WSA_COMPANDER0_CTL14		(0x05B8)
+#define CDC_2_5_WSA_COMPANDER0_CTL15		(0x05BC)
+#define CDC_2_5_WSA_COMPANDER0_CTL16		(0x05C0)
+#define CDC_2_5_WSA_COMPANDER0_CTL17		(0x05C4)
+#define CDC_2_5_WSA_COMPANDER0_CTL18		(0x05C8)
+#define CDC_2_5_WSA_COMPANDER0_CTL19		(0x05CC)
+#define CDC_2_5_WSA_COMPANDER1_CTL0		(0x05E0)
+#define CDC_2_5_WSA_COMPANDER1_CTL1		(0x05E4)
+#define CDC_2_5_WSA_COMPANDER1_CTL2		(0x05E8)
+#define CDC_2_5_WSA_COMPANDER1_CTL3		(0x05EC)
+#define CDC_2_5_WSA_COMPANDER1_CTL4		(0x05F0)
+#define CDC_2_5_WSA_COMPANDER1_CTL5		(0x05F4)
+#define CDC_2_5_WSA_COMPANDER1_CTL6		(0x05F8)
+#define CDC_2_5_WSA_COMPANDER1_CTL7		(0x05FC)
+#define CDC_2_5_WSA_COMPANDER1_CTL8		(0x0600)
+#define CDC_2_5_WSA_COMPANDER1_CTL9		(0x0604)
+#define CDC_2_5_WSA_COMPANDER1_CTL10		(0x0608)
+#define CDC_2_5_WSA_COMPANDER1_CTL11		(0x060C)
+#define CDC_2_5_WSA_COMPANDER1_CTL12		(0x0610)
+#define CDC_2_5_WSA_COMPANDER1_CTL13		(0x0614)
+#define CDC_2_5_WSA_COMPANDER1_CTL14		(0x0618)
+#define CDC_2_5_WSA_COMPANDER1_CTL15		(0x061C)
+#define CDC_2_5_WSA_COMPANDER1_CTL16		(0x0620)
+#define CDC_2_5_WSA_COMPANDER1_CTL17		(0x0624)
+#define CDC_2_5_WSA_COMPANDER1_CTL18		(0x0628)
+#define CDC_2_5_WSA_COMPANDER1_CTL19		(0x062C)
+#define CDC_2_5_WSA_SOFTCLIP0_CRC		(0x0640)
+#define CDC_2_5_WSA_SOFTCLIP0_SOFTCLIP_CTRL	(0x0644)
+#define CDC_2_5_WSA_SOFTCLIP1_CRC		(0x0660)
+#define CDC_2_5_WSA_SOFTCLIP1_SOFTCLIP_CTRL	(0x0664)
+
 #define WSA_MACRO_RX_RATES (SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |\
 			SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_48000 |\
 			SNDRV_PCM_RATE_96000 | SNDRV_PCM_RATE_192000)
@@ -387,16 +428,34 @@ static const struct wsa_reg_layout wsa_codec_v2_1 = {
 	.softclip1_reg_offset			= 0x40,
 };
 
+static const struct wsa_reg_layout wsa_codec_v2_5 = {
+	.rx_intx_1_mix_inp0_sel_mask		= GENMASK(3, 0),
+	.rx_intx_1_mix_inp1_sel_mask		= GENMASK(7, 4),
+	.rx_intx_1_mix_inp2_sel_mask		= GENMASK(7, 4),
+	.rx_intx_2_sel_mask			= GENMASK(3, 0),
+	.compander1_reg_offset			= 0x60,
+	.softclip0_reg_base			= 0x640,
+	.softclip1_reg_offset			= 0x20,
+};
+
 static const DECLARE_TLV_DB_SCALE(digital_gain, -8400, 100, -8400);
 
 static const char *const rx_text_v2_1[] = {
 	"ZERO", "RX0", "RX1", "RX_MIX0", "RX_MIX1", "DEC0", "DEC1"
 };
 
+static const char *const rx_text_v2_5[] = {
+	"ZERO", "RX0", "RX1", "RX_MIX0", "RX_MIX1", "RX4", "RX5", "RX6", "RX7", "RX8", "DEC0", "DEC1"
+};
+
 static const char *const rx_mix_text_v2_1[] = {
 	"ZERO", "RX0", "RX1", "RX_MIX0", "RX_MIX1"
 };
 
+static const char *const rx_mix_text_v2_5[] = {
+	"ZERO", "RX0", "RX1", "RX_MIX0", "RX_MIX1", "RX4", "RX5", "RX6", "RX7", "RX8"
+};
+
 static const char *const rx_mix_ec_text[] = {
 	"ZERO", "RX_MIX_TX0", "RX_MIX_TX1"
 };
@@ -434,6 +493,22 @@ static const struct soc_enum rx0_mix_chain_enum_v2_1 =
 	SOC_ENUM_SINGLE(CDC_WSA_RX_INP_MUX_RX_INT0_CFG1,
 		0, 5, rx_mix_text_v2_1);
 
+static const struct soc_enum rx0_prim_inp0_chain_enum_v2_5 =
+	SOC_ENUM_SINGLE(CDC_WSA_RX_INP_MUX_RX_INT0_CFG0,
+		0, 12, rx_text_v2_5);
+
+static const struct soc_enum rx0_prim_inp1_chain_enum_v2_5 =
+	SOC_ENUM_SINGLE(CDC_WSA_RX_INP_MUX_RX_INT0_CFG0,
+		4, 12, rx_text_v2_5);
+
+static const struct soc_enum rx0_prim_inp2_chain_enum_v2_5 =
+	SOC_ENUM_SINGLE(CDC_WSA_RX_INP_MUX_RX_INT0_CFG1,
+		4, 12, rx_text_v2_5);
+
+static const struct soc_enum rx0_mix_chain_enum_v2_5 =
+	SOC_ENUM_SINGLE(CDC_WSA_RX_INP_MUX_RX_INT0_CFG1,
+		0, 10, rx_mix_text_v2_5);
+
 static const struct soc_enum rx0_sidetone_mix_enum =
 	SOC_ENUM_SINGLE(SND_SOC_NOPM, 0, 2, rx_sidetone_mix_text);
 
@@ -449,6 +524,18 @@ static const struct snd_kcontrol_new rx0_prim_inp2_mux_v2_1 =
 static const struct snd_kcontrol_new rx0_mix_mux_v2_1 =
 	SOC_DAPM_ENUM("WSA_RX0 MIX Mux", rx0_mix_chain_enum_v2_1);
 
+static const struct snd_kcontrol_new rx0_prim_inp0_mux_v2_5 =
+	SOC_DAPM_ENUM("WSA_RX0 INP0 Mux", rx0_prim_inp0_chain_enum_v2_5);
+
+static const struct snd_kcontrol_new rx0_prim_inp1_mux_v2_5 =
+	SOC_DAPM_ENUM("WSA_RX0 INP1 Mux", rx0_prim_inp1_chain_enum_v2_5);
+
+static const struct snd_kcontrol_new rx0_prim_inp2_mux_v2_5 =
+	SOC_DAPM_ENUM("WSA_RX0 INP2 Mux", rx0_prim_inp2_chain_enum_v2_5);
+
+static const struct snd_kcontrol_new rx0_mix_mux_v2_5 =
+	SOC_DAPM_ENUM("WSA_RX0 MIX Mux", rx0_mix_chain_enum_v2_5);
+
 static const struct snd_kcontrol_new rx0_sidetone_mix_mux =
 	SOC_DAPM_ENUM("WSA_RX0 SIDETONE MIX Mux", rx0_sidetone_mix_enum);
 
@@ -469,6 +556,22 @@ static const struct soc_enum rx1_mix_chain_enum_v2_1 =
 	SOC_ENUM_SINGLE(CDC_WSA_RX_INP_MUX_RX_INT1_CFG1,
 		0, 5, rx_mix_text_v2_1);
 
+static const struct soc_enum rx1_prim_inp0_chain_enum_v2_5 =
+	SOC_ENUM_SINGLE(CDC_WSA_RX_INP_MUX_RX_INT1_CFG0,
+		0, 12, rx_text_v2_5);
+
+static const struct soc_enum rx1_prim_inp1_chain_enum_v2_5 =
+	SOC_ENUM_SINGLE(CDC_WSA_RX_INP_MUX_RX_INT1_CFG0,
+		4, 12, rx_text_v2_5);
+
+static const struct soc_enum rx1_prim_inp2_chain_enum_v2_5 =
+	SOC_ENUM_SINGLE(CDC_WSA_RX_INP_MUX_RX_INT1_CFG1,
+		4, 12, rx_text_v2_5);
+
+static const struct soc_enum rx1_mix_chain_enum_v2_5 =
+	SOC_ENUM_SINGLE(CDC_WSA_RX_INP_MUX_RX_INT1_CFG1,
+		0, 10, rx_mix_text_v2_5);
+
 static const struct snd_kcontrol_new rx1_prim_inp0_mux_v2_1 =
 	SOC_DAPM_ENUM("WSA_RX1 INP0 Mux", rx1_prim_inp0_chain_enum_v2_1);
 
@@ -481,6 +584,18 @@ static const struct snd_kcontrol_new rx1_prim_inp2_mux_v2_1 =
 static const struct snd_kcontrol_new rx1_mix_mux_v2_1 =
 	SOC_DAPM_ENUM("WSA_RX1 MIX Mux", rx1_mix_chain_enum_v2_1);
 
+static const struct snd_kcontrol_new rx1_prim_inp0_mux_v2_5 =
+	SOC_DAPM_ENUM("WSA_RX1 INP0 Mux", rx1_prim_inp0_chain_enum_v2_5);
+
+static const struct snd_kcontrol_new rx1_prim_inp1_mux_v2_5 =
+	SOC_DAPM_ENUM("WSA_RX1 INP1 Mux", rx1_prim_inp1_chain_enum_v2_5);
+
+static const struct snd_kcontrol_new rx1_prim_inp2_mux_v2_5 =
+	SOC_DAPM_ENUM("WSA_RX1 INP2 Mux", rx1_prim_inp2_chain_enum_v2_5);
+
+static const struct snd_kcontrol_new rx1_mix_mux_v2_5 =
+	SOC_DAPM_ENUM("WSA_RX1 MIX Mux", rx1_mix_chain_enum_v2_5);
+
 static const struct soc_enum rx_mix_ec0_enum =
 	SOC_ENUM_SINGLE(CDC_WSA_RX_INP_MUX_RX_MIX_CFG0,
 		0, 3, rx_mix_ec_text);
@@ -629,6 +744,56 @@ static const struct reg_default wsa_defaults_v2_1[] = {
 	{ CDC_WSA_SOFTCLIP1_SOFTCLIP_CTRL, 0x38},
 };
 
+static const struct reg_default wsa_defaults_v2_5[] = {
+	{ CDC_WSA_TOP_FS_UNGATE, 0xFF},
+	{ CDC_WSA_TOP_GRP_SEL, 0x08},
+	{ CDC_WSA_TOP_FS_UNGATE2, 0x1F},
+	{ CDC_WSA_TX0_SPKR_PROT_PATH_CTL, 0x04},
+	{ CDC_WSA_TX0_SPKR_PROT_PATH_CFG0, 0x02},
+	{ CDC_WSA_TX1_SPKR_PROT_PATH_CTL, 0x04},
+	{ CDC_WSA_TX1_SPKR_PROT_PATH_CFG0, 0x02},
+	{ CDC_WSA_TX2_SPKR_PROT_PATH_CTL, 0x04},
+	{ CDC_WSA_TX2_SPKR_PROT_PATH_CFG0, 0x02},
+	{ CDC_WSA_TX3_SPKR_PROT_PATH_CTL, 0x04},
+	{ CDC_WSA_TX3_SPKR_PROT_PATH_CFG0, 0x02},
+	{ CDC_2_5_WSA_COMPANDER0_CTL8, 0x00},
+	{ CDC_2_5_WSA_COMPANDER0_CTL9, 0x00},
+	{ CDC_2_5_WSA_COMPANDER0_CTL10, 0x06},
+	{ CDC_2_5_WSA_COMPANDER0_CTL11, 0x12},
+	{ CDC_2_5_WSA_COMPANDER0_CTL12, 0x1E},
+	{ CDC_2_5_WSA_COMPANDER0_CTL13, 0x24},
+	{ CDC_2_5_WSA_COMPANDER0_CTL14, 0x24},
+	{ CDC_2_5_WSA_COMPANDER0_CTL15, 0x24},
+	{ CDC_2_5_WSA_COMPANDER0_CTL16, 0x00},
+	{ CDC_2_5_WSA_COMPANDER0_CTL17, 0x24},
+	{ CDC_2_5_WSA_COMPANDER0_CTL18, 0x2A},
+	{ CDC_2_5_WSA_COMPANDER0_CTL19, 0x16},
+	{ CDC_2_5_WSA_COMPANDER1_CTL0, 0x60},
+	{ CDC_2_5_WSA_COMPANDER1_CTL1, 0xDB},
+	{ CDC_2_5_WSA_COMPANDER1_CTL2, 0xFF},
+	{ CDC_2_5_WSA_COMPANDER1_CTL3, 0x35},
+	{ CDC_2_5_WSA_COMPANDER1_CTL4, 0xFF},
+	{ CDC_2_5_WSA_COMPANDER1_CTL5, 0x00},
+	{ CDC_2_5_WSA_COMPANDER1_CTL6, 0x01},
+	{ CDC_2_5_WSA_COMPANDER1_CTL7, 0x28},
+	{ CDC_2_5_WSA_COMPANDER1_CTL8, 0x00},
+	{ CDC_2_5_WSA_COMPANDER1_CTL9, 0x00},
+	{ CDC_2_5_WSA_COMPANDER1_CTL10, 0x06},
+	{ CDC_2_5_WSA_COMPANDER1_CTL11, 0x12},
+	{ CDC_2_5_WSA_COMPANDER1_CTL12, 0x1E},
+	{ CDC_2_5_WSA_COMPANDER1_CTL13, 0x24},
+	{ CDC_2_5_WSA_COMPANDER1_CTL14, 0x24},
+	{ CDC_2_5_WSA_COMPANDER1_CTL15, 0x24},
+	{ CDC_2_5_WSA_COMPANDER1_CTL16, 0x00},
+	{ CDC_2_5_WSA_COMPANDER1_CTL17, 0x24},
+	{ CDC_2_5_WSA_COMPANDER1_CTL18, 0x2A},
+	{ CDC_2_5_WSA_COMPANDER1_CTL19, 0x16},
+	{ CDC_2_5_WSA_SOFTCLIP0_CRC, 0x00},
+	{ CDC_2_5_WSA_SOFTCLIP0_SOFTCLIP_CTRL, 0x38},
+	{ CDC_2_5_WSA_SOFTCLIP1_CRC, 0x00},
+	{ CDC_2_5_WSA_SOFTCLIP1_SOFTCLIP_CTRL, 0x38},
+};
+
 static bool wsa_is_wronly_register(struct device *dev,
 					unsigned int reg)
 {
@@ -662,8 +827,57 @@ static bool wsa_is_rw_register_v2_1(struct device *dev, unsigned int reg)
 	return false;
 }
 
+static bool wsa_is_rw_register_v2_5(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case CDC_WSA_TOP_FS_UNGATE:
+	case CDC_WSA_TOP_GRP_SEL:
+	case CDC_WSA_TOP_FS_UNGATE2:
+	case CDC_2_5_WSA_COMPANDER0_CTL8:
+	case CDC_2_5_WSA_COMPANDER0_CTL9:
+	case CDC_2_5_WSA_COMPANDER0_CTL10:
+	case CDC_2_5_WSA_COMPANDER0_CTL11:
+	case CDC_2_5_WSA_COMPANDER0_CTL12:
+	case CDC_2_5_WSA_COMPANDER0_CTL13:
+	case CDC_2_5_WSA_COMPANDER0_CTL14:
+	case CDC_2_5_WSA_COMPANDER0_CTL15:
+	case CDC_2_5_WSA_COMPANDER0_CTL16:
+	case CDC_2_5_WSA_COMPANDER0_CTL17:
+	case CDC_2_5_WSA_COMPANDER0_CTL18:
+	case CDC_2_5_WSA_COMPANDER0_CTL19:
+	case CDC_2_5_WSA_COMPANDER1_CTL0:
+	case CDC_2_5_WSA_COMPANDER1_CTL1:
+	case CDC_2_5_WSA_COMPANDER1_CTL2:
+	case CDC_2_5_WSA_COMPANDER1_CTL3:
+	case CDC_2_5_WSA_COMPANDER1_CTL4:
+	case CDC_2_5_WSA_COMPANDER1_CTL5:
+	case CDC_2_5_WSA_COMPANDER1_CTL7:
+	case CDC_2_5_WSA_COMPANDER1_CTL8:
+	case CDC_2_5_WSA_COMPANDER1_CTL9:
+	case CDC_2_5_WSA_COMPANDER1_CTL10:
+	case CDC_2_5_WSA_COMPANDER1_CTL11:
+	case CDC_2_5_WSA_COMPANDER1_CTL12:
+	case CDC_2_5_WSA_COMPANDER1_CTL13:
+	case CDC_2_5_WSA_COMPANDER1_CTL14:
+	case CDC_2_5_WSA_COMPANDER1_CTL15:
+	case CDC_2_5_WSA_COMPANDER1_CTL16:
+	case CDC_2_5_WSA_COMPANDER1_CTL17:
+	case CDC_2_5_WSA_COMPANDER1_CTL18:
+	case CDC_2_5_WSA_COMPANDER1_CTL19:
+	case CDC_2_5_WSA_SOFTCLIP0_CRC:
+	case CDC_2_5_WSA_SOFTCLIP0_SOFTCLIP_CTRL:
+	case CDC_2_5_WSA_SOFTCLIP1_CRC:
+	case CDC_2_5_WSA_SOFTCLIP1_SOFTCLIP_CTRL:
+		return true;
+	}
+
+	return false;
+}
+
 static bool wsa_is_rw_register(struct device *dev, unsigned int reg)
 {
+	struct wsa_macro *wsa = dev_get_drvdata(dev);
+
 	switch (reg) {
 	case CDC_WSA_CLK_RST_CTRL_MCLK_CONTROL:
 	case CDC_WSA_CLK_RST_CTRL_FS_CNT_CONTROL:
@@ -768,6 +982,9 @@ static bool wsa_is_rw_register(struct device *dev, unsigned int reg)
 		return true;
 	}
 
+	if (wsa->codec_version >= LPASS_CODEC_VERSION_2_5)
+		return wsa_is_rw_register_v2_5(dev, reg);
+
 	return wsa_is_rw_register_v2_1(dev, reg);
 }
 
@@ -792,8 +1009,20 @@ static bool wsa_is_readable_register_v2_1(struct device *dev, unsigned int reg)
 	return wsa_is_rw_register(dev, reg);
 }
 
+static bool wsa_is_readable_register_v2_5(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case CDC_2_5_WSA_COMPANDER1_CTL6:
+		return true;
+	}
+
+	return wsa_is_rw_register(dev, reg);
+}
+
 static bool wsa_is_readable_register(struct device *dev, unsigned int reg)
 {
+	struct wsa_macro *wsa = dev_get_drvdata(dev);
+
 	switch (reg) {
 	case CDC_WSA_INTR_CTRL_CLR_COMMIT:
 	case CDC_WSA_INTR_CTRL_PIN1_CLEAR0:
@@ -814,6 +1043,9 @@ static bool wsa_is_readable_register(struct device *dev, unsigned int reg)
 		return true;
 	}
 
+	if (wsa->codec_version >= LPASS_CODEC_VERSION_2_5)
+		return wsa_is_readable_register_v2_5(dev, reg);
+
 	return wsa_is_readable_register_v2_1(dev, reg);
 }
 
@@ -827,8 +1059,20 @@ static bool wsa_is_volatile_register_v2_1(struct device *dev, unsigned int reg)
 	return false;
 }
 
+static bool wsa_is_volatile_register_v2_5(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case CDC_2_5_WSA_COMPANDER1_CTL6:
+		return true;
+	}
+
+	return false;
+}
+
 static bool wsa_is_volatile_register(struct device *dev, unsigned int reg)
 {
+	struct wsa_macro *wsa = dev_get_drvdata(dev);
+
 	/* Update volatile list for rx/tx macros */
 	switch (reg) {
 	case CDC_WSA_INTR_CTRL_PIN1_STATUS0:
@@ -847,6 +1091,9 @@ static bool wsa_is_volatile_register(struct device *dev, unsigned int reg)
 		return true;
 	}
 
+	if (wsa->codec_version >= LPASS_CODEC_VERSION_2_5)
+		return wsa_is_volatile_register_v2_5(dev, reg);
+
 	return wsa_is_volatile_register_v2_1(dev, reg);
 }
 
@@ -2198,6 +2445,21 @@ static const struct snd_soc_dapm_widget wsa_macro_dapm_widgets_v2_1[] = {
 			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
 };
 
+static const struct snd_soc_dapm_widget wsa_macro_dapm_widgets_v2_5[] = {
+	SND_SOC_DAPM_MUX("WSA_RX0 INP0", SND_SOC_NOPM, 0, 0, &rx0_prim_inp0_mux_v2_5),
+	SND_SOC_DAPM_MUX("WSA_RX0 INP1", SND_SOC_NOPM, 0, 0, &rx0_prim_inp1_mux_v2_5),
+	SND_SOC_DAPM_MUX("WSA_RX0 INP2", SND_SOC_NOPM, 0, 0, &rx0_prim_inp2_mux_v2_5),
+	SND_SOC_DAPM_MUX_E("WSA_RX0 MIX INP", SND_SOC_NOPM, WSA_MACRO_RX_MIX0,
+			   0, &rx0_mix_mux_v2_5, wsa_macro_enable_mix_path,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MUX("WSA_RX1 INP0", SND_SOC_NOPM, 0, 0, &rx1_prim_inp0_mux_v2_5),
+	SND_SOC_DAPM_MUX("WSA_RX1 INP1", SND_SOC_NOPM, 0, 0, &rx1_prim_inp1_mux_v2_5),
+	SND_SOC_DAPM_MUX("WSA_RX1 INP2", SND_SOC_NOPM, 0, 0, &rx1_prim_inp2_mux_v2_5),
+	SND_SOC_DAPM_MUX_E("WSA_RX1 MIX INP", SND_SOC_NOPM, WSA_MACRO_RX_MIX1,
+			   0, &rx1_mix_mux_v2_5, wsa_macro_enable_mix_path,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+};
+
 static const struct snd_soc_dapm_route wsa_audio_map[] = {
 	/* VI Feedback */
 	{"WSA_AIF_VI Mixer", "WSA_SPKR_VI_1", "VIINPUT_WSA"},
@@ -2363,8 +2625,25 @@ static int wsa_macro_component_probe(struct snd_soc_component *comp)
 
 	wsa_macro_set_spkr_mode(comp, WSA_MACRO_SPKR_MODE_1);
 
-	widgets = wsa_macro_dapm_widgets_v2_1;
-	num_widgets = ARRAY_SIZE(wsa_macro_dapm_widgets_v2_1);
+	switch (wsa->codec_version) {
+	case LPASS_CODEC_VERSION_1_0:
+	case LPASS_CODEC_VERSION_1_1:
+	case LPASS_CODEC_VERSION_1_2:
+	case LPASS_CODEC_VERSION_2_0:
+	case LPASS_CODEC_VERSION_2_1:
+		widgets = wsa_macro_dapm_widgets_v2_1;
+		num_widgets = ARRAY_SIZE(wsa_macro_dapm_widgets_v2_1);
+		break;
+	case LPASS_CODEC_VERSION_2_5:
+	case LPASS_CODEC_VERSION_2_6:
+	case LPASS_CODEC_VERSION_2_7:
+	case LPASS_CODEC_VERSION_2_8:
+		widgets = wsa_macro_dapm_widgets_v2_5;
+		num_widgets = ARRAY_SIZE(wsa_macro_dapm_widgets_v2_5);
+		break;
+	default:
+		return -EINVAL;
+	}
 
 	return snd_soc_dapm_new_controls(dapm, widgets, num_widgets);
 }
@@ -2487,7 +2766,11 @@ static int wsa_macro_probe(struct platform_device *pdev)
 
 	wsa->codec_version = lpass_macro_get_codec_version();
 	switch (wsa->codec_version) {
-	default:
+	case LPASS_CODEC_VERSION_1_0:
+	case LPASS_CODEC_VERSION_1_1:
+	case LPASS_CODEC_VERSION_1_2:
+	case LPASS_CODEC_VERSION_2_0:
+	case LPASS_CODEC_VERSION_2_1:
 		wsa->reg_layout = &wsa_codec_v2_1;
 		def_count = ARRAY_SIZE(wsa_defaults) + ARRAY_SIZE(wsa_defaults_v2_1);
 		reg_defaults = devm_kmalloc_array(dev, def_count,
@@ -2499,6 +2782,26 @@ static int wsa_macro_probe(struct platform_device *pdev)
 		memcpy(&reg_defaults[ARRAY_SIZE(wsa_defaults)],
 		       wsa_defaults_v2_1, sizeof(wsa_defaults_v2_1));
 		break;
+
+	case LPASS_CODEC_VERSION_2_5:
+	case LPASS_CODEC_VERSION_2_6:
+	case LPASS_CODEC_VERSION_2_7:
+	case LPASS_CODEC_VERSION_2_8:
+		wsa->reg_layout = &wsa_codec_v2_5;
+		def_count = ARRAY_SIZE(wsa_defaults) + ARRAY_SIZE(wsa_defaults_v2_5);
+		reg_defaults = devm_kmalloc_array(dev, def_count,
+						  sizeof(*reg_defaults),
+						  GFP_KERNEL);
+		if (!reg_defaults)
+			return -ENOMEM;
+		memcpy(&reg_defaults[0], wsa_defaults, sizeof(wsa_defaults));
+		memcpy(&reg_defaults[ARRAY_SIZE(wsa_defaults)],
+		       wsa_defaults_v2_5, sizeof(wsa_defaults_v2_5));
+		break;
+
+	default:
+		dev_err(wsa->dev, "Unsupported Codec version (%d)\n", wsa->codec_version);
+		return -EINVAL;
 	}
 
 	reg_config = devm_kmemdup(dev, &wsa_regmap_config,

-- 
2.43.0

