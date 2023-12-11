Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 167AB80C838
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Dec 2023 12:41:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 683FD843;
	Mon, 11 Dec 2023 12:41:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 683FD843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702294901;
	bh=O686kNPfhDqyBc+yvwfM+enx5jWXb5MAlOqcdwFA5+M=;
	h=From:Date:Subject:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=iqmETUQWJIQPdtqMNSelofHROi66OoaU89HLaw0126rsiK3Pj8FlSsollU76Ic87P
	 6CCeR+31PmnfEOmDCOT9gxlwqWzYRnGOPwYKmN/H5j9QnOARy9LAwIlP4gXhjrP1xN
	 BJX1ZzVsSqYx02JGqtmGxoz7emDJt/NiEXnaF2m8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4529BF80578; Mon, 11 Dec 2023 12:41:20 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AB191F80166;
	Mon, 11 Dec 2023 12:41:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7D329F80166; Mon, 11 Dec 2023 12:41:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 84948F8001F
	for <alsa-devel@alsa-project.org>; Mon, 11 Dec 2023 12:41:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84948F8001F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=G0UnHEq2
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40c41df5577so13257305e9.0
        for <alsa-devel@alsa-project.org>;
 Mon, 11 Dec 2023 03:41:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702294859; x=1702899659;
 darn=alsa-project.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cMvA/ANtahW+hb9oH+xQ7G9xSFgd/krQcWaU1bteuv4=;
        b=G0UnHEq2blnviXLhDNJik00P7edJnzf8kLUndP/eManG1WRhZVv1WDAudinbgQVigN
         ZGu4WqmMuiE3oK6D9CZ+FD1B1nXuJErECd2zKUDNhOIpfdCy3kQHMtR2+jkNHwvOjrgK
         xeYSXaByFZpKt29/tcOdjfmScVvmKdI/zMtR8IxuihVx0y80LKH9aMoCgf6s/fkWITmz
         +c+1MBSvUO1HbMafS+9++dQ+WYxBZb/FnK6jDYbN5Z/xP4cY3tbFBorY3E9JJG5wVPww
         OqZrX6AJTlnHmvplxqI8HyPdeld9vbOr6npPFmhGB+sHB2zP4dDS2JuNo5bjI/aCsNXR
         CMQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702294859; x=1702899659;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cMvA/ANtahW+hb9oH+xQ7G9xSFgd/krQcWaU1bteuv4=;
        b=HkNYcDTD8IAIOV++5fbnLqz0S2ot8WDSYN3sdCHkgaSf0mGH6MmtCubaPauKTcOKSn
         zmJyrSTLHu2xBWkFYaH013HYF0lIqonLD9O+j2b9F5djEzCKYgpXB89TnFhmWoXaujI3
         ALRIdZfn7w8/V83f0jT5ZjVz7W6Pdo/cGlUDwvB7fUIJEapbT3CQ+Um7LpmbVRHMfX6G
         27e3DVBIVuXPjVsYf2ycLLG0Z1WiLdDymhM9DBej9KZW/i6XDE7JVJXPNxvd8KutEmtd
         3zLgNotVfiNHXdKGJA256ErQq3q8wK7iJ7PEUKFK+vh2oSSY2tPAYO8mrE+SJNUFh2Fo
         L4JQ==
X-Gm-Message-State: AOJu0Yyb8PfVyMFWMwh34WGOVy64HZ9Y+Jhvhi2lReR0ztgzz3WrbyfV
	XVelyhkJqhqy4sMXN5b/USs9ZA==
X-Google-Smtp-Source: 
 AGHT+IGEjB1saOzLbqjUnbbOLBg/lh3L6Ga+lymW3L4n04g9lWLUrFnJl2hsCTDEre3MRludqgGqdw==
X-Received: by 2002:a7b:ce8b:0:b0:40c:3270:ec9a with SMTP id
 q11-20020a7bce8b000000b0040c3270ec9amr1089805wmj.349.1702294859472;
        Mon, 11 Dec 2023 03:40:59 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id
 p7-20020a05600c468700b0040c420eda48sm6178883wmo.22.2023.12.11.03.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 03:40:59 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 11 Dec 2023 12:40:57 +0100
Subject: [PATCH] ASoC: codec: wsa884x: make use of new
 mute_unmute_on_trigger flag
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20231211-topic-sm8x50-upstream-wsa884x-fix-plop-v1-1-0dc630a19172@linaro.org>
X-B4-Tracking: v=1; b=H4sIAEj1dmUC/x2N0QrCMAwAf2Xk2cBSlRZ/RXwIMWrAraXZtDD27
 xYfj4O7DVyrqcNl2KDqx9zy3IEOA8iL56ei3TtDGMORAhEuuZigT6mdR1yLL1V5wq9zSqeGD2t
 Y3rkgR47CUSWQQI+Vqt39R9fbvv8AkBnT3HgAAAA=
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1958;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=O686kNPfhDqyBc+yvwfM+enx5jWXb5MAlOqcdwFA5+M=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBldvVKCbZAQnrutsDlCbNPOPYiveBzyrvr8dCS2rbw
 arXbjQ+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZXb1SgAKCRB33NvayMhJ0YCuD/
 4iq4pN/CJwoFmazc6CD98pcr/TlK3oH4npma/Gs2B+MZTt+bseIgVjy7pKgNTjE5vrvEw3+bq+MRJ2
 Cp4uZw2wpfsoKXt+BCvBbJvYc9O51e+8ffKK1N7dviP5eGURT6e3y/lfftkg508YRt9n+tfKV17FMt
 2UsrqH4vi7QSxaDs2a0ucGSeMY6oGIMLeeNTdLxOE6Uz+Cbm79efoq4AcFRI4Rva8fAn7AbvGpKFVj
 ts4dpZNYV+baK1SHjl5/t6+JjVQCitZlZ5PzMdKRVtjLDIBvT1NG4Rv0W9Q6ww4xF90o9BZaNL4vla
 xlShjZLc6AH/UtbGt3J37/yI1nwiA6ueJbVd9Gq9O92uUiyysiIfwz4pelB4sBCKJv9n4Zdmct0t+v
 CnrpMcB9wbJe1ftEXAOeD52qjAQA56HcmtIMK5cbJveK063an5mP5Hdlay1jWE3FSIikfRZHa9agV+
 +kqkQZ4WeqA6P1rNmkZZCsbKJ2XyfRpOU8uwPT6xdphNGLBmwLPQ90U+nO1G8larZowOHxqqncpcdD
 D4yDelhqVet0n8HyvlL8nWTsNATliDsDuM1HtcwXhOVIN0oqvtxXNSiXoteSyYdcA9nQHbPTUHryUT
 RAFidOJ9l8TCF1wXxCjQNzJb3LtXXeaZrLMX96ICC51k4smRFJOCddjRq90A==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
Message-ID-Hash: GVSTPKSMLAJ7OIMUUBPATCE6H3PFILZG
X-Message-ID-Hash: GVSTPKSMLAJ7OIMUUBPATCE6H3PFILZG
X-MailFrom: neil.armstrong@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GVSTPKSMLAJ7OIMUUBPATCE6H3PFILZG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This fix is based on commit [1] fixing click and pop sounds during
SoundWire port start because PA is left unmuted.

making use of new mute_unmute_on_trigger flag and removing unmute
at PA setup, removes the Click/Pop issue at SoundWire enable.

[1] 805ce81826c8 ("ASoC: codecs: wsa883x: make use of new mute_unmute_on_trigger flag")

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Fixes: aa21a7d4f68a ("ASoC: codecs: wsa884x: Add WSA884x family of speakers")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 sound/soc/codecs/wsa884x.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/sound/soc/codecs/wsa884x.c b/sound/soc/codecs/wsa884x.c
index 993d76b18b53..f2653df84e4a 100644
--- a/sound/soc/codecs/wsa884x.c
+++ b/sound/soc/codecs/wsa884x.c
@@ -1654,15 +1654,9 @@ static int wsa884x_spkr_event(struct snd_soc_dapm_widget *w,
 		snd_soc_component_write_field(component, WSA884X_PDM_WD_CTL,
 					      WSA884X_PDM_WD_CTL_PDM_WD_EN_MASK,
 					      0x1);
-		snd_soc_component_write_field(component, WSA884X_PA_FSM_EN,
-					      WSA884X_PA_FSM_EN_GLOBAL_PA_EN_MASK,
-					      0x1);
 
 		break;
 	case SND_SOC_DAPM_PRE_PMD:
-		snd_soc_component_write_field(component, WSA884X_PA_FSM_EN,
-					      WSA884X_PA_FSM_EN_GLOBAL_PA_EN_MASK,
-					      0x0);
 		snd_soc_component_write_field(component, WSA884X_PDM_WD_CTL,
 					      WSA884X_PDM_WD_CTL_PDM_WD_EN_MASK,
 					      0x0);
@@ -1786,6 +1780,7 @@ static const struct snd_soc_dai_ops wsa884x_dai_ops = {
 	.hw_free = wsa884x_hw_free,
 	.mute_stream = wsa884x_mute_stream,
 	.set_stream = wsa884x_set_stream,
+	.mute_unmute_on_trigger = true,
 };
 
 static struct snd_soc_dai_driver wsa884x_dais[] = {

---
base-commit: bbd220ce4e29ed55ab079007cff0b550895258eb
change-id: 20231211-topic-sm8x50-upstream-wsa884x-fix-plop-a7a7ca7ec21c

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

