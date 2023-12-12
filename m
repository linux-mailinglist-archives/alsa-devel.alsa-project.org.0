Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7761280E5A7
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Dec 2023 09:13:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09A6ED8;
	Tue, 12 Dec 2023 09:13:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09A6ED8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702368825;
	bh=l7XyXt1fVLon65HN4wKj5YMCqYBmKvyCyW+bCEtblb0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CSj3p0/fxMdRdtsRSa6Z0m1JJOm3kr0TgTXDBXDEBVadofNdpbo0ZmUll6bDn1qPM
	 bNt1qzL1cd2szG2Nfj91IQX+CfBfHd8u7EucSUWD7cHQ3gFQqCgZeq9RGvPjGji1EU
	 Ng6W7JjoUqUbSVPP3lIKKjCHMHLk13CRz6VFY+Bo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 63258F8016E; Tue, 12 Dec 2023 09:13:21 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 41DC3F80571;
	Tue, 12 Dec 2023 09:13:20 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 72F58F8016E; Tue, 12 Dec 2023 09:09:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D1E5AF80124
	for <alsa-devel@alsa-project.org>; Tue, 12 Dec 2023 09:08:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1E5AF80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=sHsKkZEB
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3333074512bso3366403f8f.1
        for <alsa-devel@alsa-project.org>;
 Tue, 12 Dec 2023 00:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702368507; x=1702973307;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cZhyn0SzD0LcNzzKrk+BOSL06IGkQV09rjNYI+C4fE8=;
        b=sHsKkZEB2chnOifxsnQxuZMK7LuSN4yVIQhXuNmt0PHBxvT35/EDN/WqDcgTUl9rUI
         SLOU1afvSsL21wvICTAGjbLRng8SvrtYDnnqeTVb61YOSRNGCSpXgS0D49yJgNBaL913
         E0Z5whpq37jADk2tOxYLyI03zbnXSSBlakNBolTz7jhNE9FxxbhKnz2pFEMRsGruNCKi
         jR0eUWm581DG5JrqA8+tHgQq+HMZIses9LZVF/xBrcThFTxbijsmdXH5xbh0MAFKQJz5
         3QMEr3NBlJjxOIVNLoIj18wpFVYftJypH/ZfmLDrdWB8Rn8saFB1f5KoUpDYjpTp7ZtH
         Ns1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702368507; x=1702973307;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cZhyn0SzD0LcNzzKrk+BOSL06IGkQV09rjNYI+C4fE8=;
        b=lp7HM2D3JC3RRfyBtY9vpVcvaW0HGi25v597CQC3BxKvtAuIlhl/Hc2RLqtoJ+gzH2
         jPfNL9N+f0wqUmN6QvikrlMnlFN7ILiPP4J5s3lPcAe2RsudEjeElqDt4i+7rHFSxeVI
         j6uWENHZKPhyi/Biey1tKvyHQFSw2yHEnlJZKU1boeRGxc4PTuAEwQlJupCNX22KEWv+
         YNHj3PeIL/xnwLeaRKU88O2/UkG+P5FFygQtI9260DyclStYiRZpaAQ5y3dkJzuVwKX7
         v7TvHI35is8bdhkDVd2UXSkoVgaywooDMOxq9yTzYdCci4e8Psh907K2njif49YyfSa/
         f/qQ==
X-Gm-Message-State: AOJu0YzjLfCcGFsscLa2f/Scj8A+EpO5M+gVDNaiczVRAeNB6qfp5DRN
	ubZEHcTwImNdYP1FpyxWS6DHcQ==
X-Google-Smtp-Source: 
 AGHT+IGz12J2/2+iCyl2jRF/v/VIA+qJML+76a5pagXs43wcMh0WbIU9hT456iIyx3bddFwB0UyUxQ==
X-Received: by 2002:a05:600c:22ce:b0:40b:5e4a:235e with SMTP id
 14-20020a05600c22ce00b0040b5e4a235emr2833546wmg.96.1702368506789;
        Tue, 12 Dec 2023 00:08:26 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id
 n10-20020a05600c500a00b004094e565e71sm15609355wmr.23.2023.12.12.00.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 00:08:26 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 12 Dec 2023 09:08:20 +0100
Subject: [PATCH 2/2] ASoC: qcom: sc8280xp: Add support for SM8650
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20231212-topic-sm8650-upstream-snd-card-v1-2-fbfc38471204@linaro.org>
References: 
 <20231212-topic-sm8650-upstream-snd-card-v1-0-fbfc38471204@linaro.org>
In-Reply-To: 
 <20231212-topic-sm8650-upstream-snd-card-v1-0-fbfc38471204@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=692;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=l7XyXt1fVLon65HN4wKj5YMCqYBmKvyCyW+bCEtblb0=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBleBT3ET/ZnxriBIRSuvP6q36fZX+QOaiXY0dLH3wf
 U9meb3iJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZXgU9wAKCRB33NvayMhJ0Z78D/
 9ox3qcrRO0/cavRBNM1SPlK1ldKE6CflPnmNaO7iYNBtjmYea+3SmSA8oAzgL+jeWa55DvPM3Xknhx
 wcDT6XaGPv6FPHk68s4uibKINVsNbw3vejyudOlG2PRWgRRXRgtirEIiUCjmG5KEFwLHnGDG2ogzOj
 b4wsgIe+U+GfMyieOn9cWVHgQocuRmAaW171eJO6prYbJk4FkwNdS94ZFCxQ+OhjobkxIZMYVOynmZ
 +8Pc2hgtIZsfJdUHO2EWmxXpwoegsf0sc5x5MeGo06jF45LUIm8LWVaLWjUwhxqwA2T8A/NOlVhIWv
 W8W5bVW/f+0s1mjh1K4wnvbP80LoTbrwPZmM6CkEbPeD7Tb+YdSXRL8bVFXNCO9/umB1MIRBYGCpUV
 ISPSdrparuPJw3cLVrErFuwx4BwTA5zxkypBAnmQpKyrOv+Yp1vb1ZiOwT1bltmAuTtiCrFpJjL/RW
 FCX2bd9EdQ7Ca66gy5ys5MYmbqj3eogNutZnKJXkn+gg6bxi8PGy8o6aOcQr9a2vLPEe53jQ04KKTp
 Jog5Z0XIAL+mC+A4s4dpD96IM8F/kDJDHYojbP9CuLSLLEdEyEl9WNfseM+2uP6+FlCA6r6THzxix7
 yd0zI1a0yci7dheMpsgEZojCFOz/+HgI5fZmxqHKC7XhwWX7TJZ2XdnQ4Aew==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
Message-ID-Hash: ODGEE4VDVF5RIBF2PRYZDENZ6TGK3YEV
X-Message-ID-Hash: ODGEE4VDVF5RIBF2PRYZDENZ6TGK3YEV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ODGEE4VDVF5RIBF2PRYZDENZ6TGK3YEV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add compatibles for sound card on Qualcomm SM8650 boards.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 sound/soc/qcom/sc8280xp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index 1e8f9452cd28..494f284875d2 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -170,6 +170,7 @@ static const struct of_device_id snd_sc8280xp_dt_match[] = {
 	{.compatible = "qcom,sc8280xp-sndcard", "sc8280xp"},
 	{.compatible = "qcom,sm8450-sndcard", "sm8450"},
 	{.compatible = "qcom,sm8550-sndcard", "sm8550"},
+	{.compatible = "qcom,sm8650-sndcard", "sm8650"},
 	{}
 };
 

-- 
2.34.1

