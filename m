Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE76193C0CB
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jul 2024 13:28:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51FAEE9F;
	Thu, 25 Jul 2024 13:28:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51FAEE9F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721906892;
	bh=5CQP3ouvzVeAmZXDUgxf/wEYJYDXjNwSjcV+BJjz67M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NwLUi3YwXzO8BlBNFtzMisZxViS08ch8ev4j33dQg21wI94Rm3TKje7HXI2QWP4PM
	 kpabXg5F3odqhw1dlCr9AvxTEdvT67NSXD0+aaomZz1HiMu2VcpMGLZS4ETZ75jJ4g
	 iU1wCOxXzwDj/V9Tpzzg2v0bgjywdxB/bOKykeX8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8D9A8F8061B; Thu, 25 Jul 2024 13:27:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 49D5CF80613;
	Thu, 25 Jul 2024 13:27:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D7184F8007E; Thu, 25 Jul 2024 13:26:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 16CA8F8026D
	for <alsa-devel@alsa-project.org>; Thu, 25 Jul 2024 13:23:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16CA8F8026D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=M2eiHIrF
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-42808baddf9so2149845e9.3
        for <alsa-devel@alsa-project.org>;
 Thu, 25 Jul 2024 04:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721906639; x=1722511439;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6fToOtqS0kKV1Bi4vu3PvCh9iIoxoPkBbmgMcbIcPlE=;
        b=M2eiHIrFCuo1CbPOLQM89mQlQ8zwAOEC/Afx1OgebLrpjXJdUNnl3H8ixoBOgtMxNz
         YZ6pnwcskCuDOrpH82ZTZDgL5AWOiEc2q4DLk3yI2NlcmBzOgPItiTUjnwiKQ/cFfypk
         v1OmOdrMnVvdsBWZn5DjOlA7P5bz1TmYR9AWrDE2G0yCA6W2OD8jkGv8f+I0jE1lGfFz
         dRAzOnQrKSb7Rajx+eEDk5V1nA1JGominw/XfLq5eGkRYWTbKpeS28vnzhixGhRg4DS2
         ZSGJnlsT+JC511/NjTzK9/WwYO65aEkaaxCzTmYxXy+ly1gahJADPPX9TR+cKc644rBr
         S5NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721906639; x=1722511439;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6fToOtqS0kKV1Bi4vu3PvCh9iIoxoPkBbmgMcbIcPlE=;
        b=rA8dwVJG/yO8jwbwSFrMUKLttRtcCt3Nu3hGriP7AMlzyO3qSD7THUtoJ9EjIr+687
         zQVsSXrsY7fVCWjCgcVx2lsKKDTSsKp8lvsuYLtPL8FZCGmqAzM/F0v5rmn7jx+moIPb
         hhpDQGzskDdKS816nQzVqwJNBnitgv1yAr2J1wtKUbFClFzFwlXc8CjwfA3KVmXSed5u
         dtXGbgd52GovUiW4EyuVE5Fq7q1K3y7JrrUgaxbJEWY2r7OfQbKq/9dVdmnCma+69wKH
         4FnlQv+uUjQwUB1bArURdZdNTmolWX7ig2RB9P5oJUkrjJnbFHvzwCAozz75XKiV/50I
         SJ2Q==
X-Gm-Message-State: AOJu0Yz1ZHf8CY5A18pywD4RiPtSDrZLxO7aPhyROh9/EAx/NCvKvwAb
	s7+ihoGGIdM0DVXzpqCw/bMr7BFWRFxf5pSl3pFdd2MQWSqtHHIi9QU3JPc0mnc=
X-Google-Smtp-Source: 
 AGHT+IEuxlhuA47wx7C8GCGxX+LExydeHoLlCtkkUP5qNZTPhq3tlYtBxbrdnheckT8irzJPS6ef+Q==
X-Received: by 2002:adf:f38a:0:b0:368:4def:921a with SMTP id
 ffacd0b85a97d-36b3643cb45mr1498960f8f.48.1721906638645;
        Thu, 25 Jul 2024 04:23:58 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36b367e072asm1823607f8f.42.2024.07.25.04.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jul 2024 04:23:58 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 25 Jul 2024 13:23:45 +0200
Subject: [PATCH 3/7] ASoC: codecs: wsa884x: Use designator array
 initializers for Soundwire ports
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240725-asoc-wsa88xx-port-arrays-v1-3-80a03f440c72@linaro.org>
References: <20240725-asoc-wsa88xx-port-arrays-v1-0-80a03f440c72@linaro.org>
In-Reply-To: <20240725-asoc-wsa88xx-port-arrays-v1-0-80a03f440c72@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3014;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=5CQP3ouvzVeAmZXDUgxf/wEYJYDXjNwSjcV+BJjz67M=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmojXFWrIz3WtjJoBOP8BBCNGDTmV3JawrbHX3x
 ChTfPiw6ASJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZqI1xQAKCRDBN2bmhouD
 10kSD/9V2Bpj7WduD14hnA0+M6g8eql4Si1kTreQJK/xO5Qof4b8A6QvqSF8i0iNaAbhdgNH21G
 /GnyBMV8sQL5iGWX9BlwiA6Hf3Ja6ucNBawP+941K1Q8W0Oqbb1XeDnU8FQsK8UAFCckuzewdn3
 gY/XUmn0mcQiTtjzgI1gaWX7/w8LCXE+z9lq81jyw9Cfyd4tasAGCOahNG/VpkIFdGVGi0KwCZq
 WFk0T6VvJs0j7cXpDKsxneGwtFuepjO/f46GRPgLSnY0D43A50/fgRcStZ655LsammpUi37OT8R
 CyTRcwUdgWtidpv+DfSlr/VzBfLwlwMqUmaPcMhqWBx1cRTHCFWk4SedaF/OWFUSYPvxalW88+1
 6dpGjBYYBUMeAwPpBbhzQkR9GGd/5+ExpVlOrkh4j3ZRWDRMGIP9sMgOKJXIB/OlbGcTJY95BOn
 ttI8OAR9Irn02fatjs/aTdgZblVm5cI8ShzKXouXDOFmFXX2rj8UTVTjYsdiNBFKKk1FQFG6N5B
 DdwHI9HfNpD9g0tJmtKdTLu4FBGD5PNNYNPhVLqkCBGhtNOe5fNlbVIXQUx4Q5Dsuk+q6VVqXz4
 PpKk4cOu9XapWiBZ6l2aEf/JPkPgQ4hsGIO2JkC7j8hS3O9qC4Gcj5kJV0vF7yRtRGYcHuaiehX
 aMmdTKZ2UvSfA4A==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: G6CXQ2OIEKQO47ENSH42PB6QIUPMRVVF
X-Message-ID-Hash: G6CXQ2OIEKQO47ENSH42PB6QIUPMRVVF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/G6CXQ2OIEKQO47ENSH42PB6QIUPMRVVF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Two arrays (with 'struct sdw_dpn_prop' and 'struct sdw_port_config')
store configuration of Soundwire ports, thus each of their element is
indexed according to the port number (enum wsa884x_port_ids, e.g.
WSA884X_PORT_DAC).  Except the indexing, they also store port number
offset by one in member 'num'.

Entire code depends on that correlation between array index and port
number, thus make it explicit by using designators.  The code is
functionally the same, but more obvious for reading.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wsa884x.c | 34 ++++++++++++++++++++++------------
 1 file changed, 22 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/wsa884x.c b/sound/soc/codecs/wsa884x.c
index d17ae17b2938..d3d09c3bab2d 100644
--- a/sound/soc/codecs/wsa884x.c
+++ b/sound/soc/codecs/wsa884x.c
@@ -782,42 +782,47 @@ static const struct soc_enum wsa884x_dev_mode_enum =
 	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(wsa884x_dev_mode_text), wsa884x_dev_mode_text);
 
 static struct sdw_dpn_prop wsa884x_sink_dpn_prop[WSA884X_MAX_SWR_PORTS] = {
-	{
+	[WSA884X_PORT_DAC] = {
 		.num = WSA884X_PORT_DAC + 1,
 		.type = SDW_DPN_SIMPLE,
 		.min_ch = 1,
 		.max_ch = 1,
 		.simple_ch_prep_sm = true,
 		.read_only_wordlength = true,
-	}, {
+	},
+	[WSA884X_PORT_COMP] = {
 		.num = WSA884X_PORT_COMP + 1,
 		.type = SDW_DPN_SIMPLE,
 		.min_ch = 1,
 		.max_ch = 1,
 		.simple_ch_prep_sm = true,
 		.read_only_wordlength = true,
-	}, {
+	},
+	[WSA884X_PORT_BOOST] = {
 		.num = WSA884X_PORT_BOOST + 1,
 		.type = SDW_DPN_SIMPLE,
 		.min_ch = 1,
 		.max_ch = 1,
 		.simple_ch_prep_sm = true,
 		.read_only_wordlength = true,
-	}, {
+	},
+	[WSA884X_PORT_PBR] = {
 		.num = WSA884X_PORT_PBR + 1,
 		.type = SDW_DPN_SIMPLE,
 		.min_ch = 1,
 		.max_ch = 1,
 		.simple_ch_prep_sm = true,
 		.read_only_wordlength = true,
-	}, {
+	},
+	[WSA884X_PORT_VISENSE] = {
 		.num = WSA884X_PORT_VISENSE + 1,
 		.type = SDW_DPN_SIMPLE,
 		.min_ch = 1,
 		.max_ch = 1,
 		.simple_ch_prep_sm = true,
 		.read_only_wordlength = true,
-	}, {
+	},
+	[WSA884X_PORT_CPS] = {
 		.num = WSA884X_PORT_CPS + 1,
 		.type = SDW_DPN_SIMPLE,
 		.min_ch = 1,
@@ -828,22 +833,27 @@ static struct sdw_dpn_prop wsa884x_sink_dpn_prop[WSA884X_MAX_SWR_PORTS] = {
 };
 
 static const struct sdw_port_config wsa884x_pconfig[WSA884X_MAX_SWR_PORTS] = {
-	{
+	[WSA884X_PORT_DAC] = {
 		.num = WSA884X_PORT_DAC + 1,
 		.ch_mask = 0x1,
-	}, {
+	},
+	[WSA884X_PORT_COMP] = {
 		.num = WSA884X_PORT_COMP + 1,
 		.ch_mask = 0xf,
-	}, {
+	},
+	[WSA884X_PORT_BOOST] = {
 		.num = WSA884X_PORT_BOOST + 1,
 		.ch_mask = 0x3,
-	}, {
+	},
+	[WSA884X_PORT_PBR] = {
 		.num = WSA884X_PORT_PBR + 1,
 		.ch_mask = 0x1,
-	}, {
+	},
+	[WSA884X_PORT_VISENSE] = {
 		.num = WSA884X_PORT_VISENSE + 1,
 		.ch_mask = 0x3,
-	}, {
+	},
+	[WSA884X_PORT_CPS] = {
 		.num = WSA884X_PORT_CPS + 1,
 		.ch_mask = 0x3,
 	},

-- 
2.43.0

