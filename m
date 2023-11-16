Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0A57EE563
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Nov 2023 17:45:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F0E074C;
	Thu, 16 Nov 2023 17:44:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F0E074C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700153130;
	bh=4dAw4vqYtyZ3uH1NpDIOG5tDL7gWy8TiV101k/eDcNg=;
	h=From:Date:Subject:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Z9864WlTAR/SpPehtMVyOHJG1pygFrXT4Bb87EFBoNhPOBj/KO/HGurRfM6f/xN6m
	 /h8WLRSNUKiEYgW5By/pjZU9RZCXSwzd6Oku8v4iXk1niVEyn2QBOPhFD2qFC4T95P
	 0G1Zk9VkPn774Mzb3sPVMx+sIbR62PwC6cYM+AYg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 116B1F80152; Thu, 16 Nov 2023 17:44:40 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 92F59F8016E;
	Thu, 16 Nov 2023 17:44:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E5004F801D5; Thu, 16 Nov 2023 17:44:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4A253F800ED
	for <alsa-devel@alsa-project.org>; Thu, 16 Nov 2023 17:44:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A253F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=eC70r9h5
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-32d9effe314so768916f8f.3
        for <alsa-devel@alsa-project.org>;
 Thu, 16 Nov 2023 08:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700153063; x=1700757863;
 darn=alsa-project.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sDzOfYCdfGdhIwsTkT/XnXRFMX5EnP+LI41FMa/BEgU=;
        b=eC70r9h5w0cM9kJQPnlLJcPz2g2aIsAmWpVMn0qXNMLFl9OdMg6OV105255CUjspPf
         O8IqB7nRG4SUqs9ypZLiYvw6lN9rvHrbROwYlKUuBZNzNfBBxReVzJ09WHA//t8Vn7uR
         +uo6+vrZXD1uGism1fqkf3QVRbOYnGc6CangiVRQn9Fbnxk1160BYPmzrf26lM4wtE20
         TbOr71kLoc11HQAXulTjlMfb/gIlcRT+O8dgSYsJyHZPZqzueq0EUdeuNHfs4tNQJdpf
         6UBMl7P9lT3pp7c/IWfcv8OWyiuL4261jbJyASa514f0Pk9tW5H5QZk8ldlSPGVuVJjE
         x4Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700153063; x=1700757863;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sDzOfYCdfGdhIwsTkT/XnXRFMX5EnP+LI41FMa/BEgU=;
        b=QXa45vnoEroOBxeCBY+4cAJ2ikf1zSVhTDpGcN5Xfw1rHaNk2UDcBhClafHC8Kd2Fc
         J4v8kjYRUqZw8ik7f1u134v3fB5ebmEMMhzvYwbulg2e6kdyP5/d1IZ3qNg5SSO0+0LV
         L+D17KVKmScnJx57G03Y2g+8AqVlZzvh8FQivgD5wYcH7d2OpX41/zl7LtLSM4rXRyCF
         SYvawapuFxK6eVCycChyxGXxNQ4yCX8e4X7h4a5jhP8fsfdngZEBdYHZeOMBHTUvjqZ1
         LUghACK3C6EG+Eig8wZJ9SPH6TYA99dFddFOs8yLLEZY5PD7udfFZgjJFjLhVrS0DMv8
         sEsw==
X-Gm-Message-State: AOJu0YxJUxE6vmMRV00Ai+RbwwzrWcAtAz5t7YGwfQxrldmT+L9jn6rj
	cTn0LdT+x26RbUHFuXKPPWpspQ==
X-Google-Smtp-Source: 
 AGHT+IHn7OB0r9MkxAhFTonw+6qeVUoxgahqxWdmltXDSS2WfR4eRPqtvUnCGmh3o2tZVLIEgCLqMQ==
X-Received: by 2002:adf:f28e:0:b0:32f:7cea:2ea1 with SMTP id
 k14-20020adff28e000000b0032f7cea2ea1mr11101444wro.18.1700153063188;
        Thu, 16 Nov 2023 08:44:23 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id
 z8-20020a5d6548000000b0032da75af3easm14025882wrv.80.2023.11.16.08.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 08:44:22 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 16 Nov 2023 17:44:21 +0100
Subject: [PATCH] ASoC: codecs: lpass-tx-macro: set active_decimator correct
 default value
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20231116-topic-sm8x50-upstream-tx-macro-fix-active-decimator-set-v1-1-6edf402f4b6f@linaro.org>
X-B4-Tracking: v=1; b=H4sIAORGVmUC/x2NQQrDIBAAvxL23IUYqTT9SunB6Kbdg1F2TRBC/
 l7pcWCYOUFJmBSewwlCByvnrYO5DRC+fvsQcuwM0zhZY4zDmgsH1PRo9xH3olXIJ6wNkw+SceW
 GPlQ+CCMFTr5mQaWKs43W2WVdrJuh14tQd//n1/u6fkmbvraJAAAA
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: krzysztof.kozlowski@linaro.org, linux-arm-msm-owner@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1388;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=4dAw4vqYtyZ3uH1NpDIOG5tDL7gWy8TiV101k/eDcNg=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlVkbljrU4sS5DvYQUP+pgNOPnplVSf7WYMq9uttCK
 11awh6yJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZVZG5QAKCRB33NvayMhJ0TDpD/
 9r0Lt00io9LJH6n4fXgDoMEXeJBY8FYP+myiaoUUrYb3dqkBDWtdRWG1LV6jEeqMHd4T8F/Hp23wxc
 2Q/POMxLme9nsAtsOOrjyjLU7tyAnEb6/2roYm1uPobovuOrVyHg2RgZLP+dkG2v1PCwSVgHkOVl69
 zo14f8NIyWs+2hwU+9QjTD3gYHIX+RDhr8nVIZrpvwLaZ5GBozOeINNPURb1pTqyT5SwDdtZH+o0Zq
 zXFDkUP36NRbHeQDYGSTDgxlos+EuHQ7CeQSpKzVHZhAlIKkv5v9zkodLBSt2lBSXYQ2buwOGY3rQ1
 Tssp2A5+G+Fhu5PyzHqblyiRBUbJXwS9Ozp76mMN5HJdpw5XHWXz07QO9GrQhpHmRFLDkHy7aUvfYO
 Eh1WhZY1/dlhsu/czwEKpZArDf1v8AA2xo/5U3dkMOHo2NKXc/mep7B8wjOBVMJ0a0uPR/coB+n8V5
 IUYeZ3YFm00Z+u2sD5J1hVY8IghVUwk/bCehKQeEySg9JGRRfh+DwHrHVVjZNx6VcH39F2Cxw/MJGK
 J2YRkHwO0E/5LnNwRs4d4CBAZbAjlzFizr1cUAvdKcdZMYRh1y0G/dZkZr0pWh6DkxgwdlXpWpc2mv
 sk7vxggEojUHkvW6JwJ5NsDd4vAwNi1w3PoKSLZRN1qsKfuKeM0iCLk4u4OA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
Message-ID-Hash: 36W2BH3J3U3WSEOV7WJGRMOY3754X6IZ
X-Message-ID-Hash: 36W2BH3J3U3WSEOV7WJGRMOY3754X6IZ
X-MailFrom: neil.armstrong@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/36W2BH3J3U3WSEOV7WJGRMOY3754X6IZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The -1 value for active_decimator[dai_id] is considered as "not set",
but at probe the table is initialized a 0, this prevents enabling the
DEC0 Mixer since it will be considered as already set.

Initialize the table entries as -1 to fix tx_macro_tx_mixer_put().

Fixes: 1c6a7f5250ce ("ASoC: codecs: tx-macro: fix active_decimator array")
Fixes: c1057a08af43 ("ASoC: codecs: tx-macro: fix kcontrol put")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 sound/soc/codecs/lpass-tx-macro.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
index 82f9873ffada..124c2e144f33 100644
--- a/sound/soc/codecs/lpass-tx-macro.c
+++ b/sound/soc/codecs/lpass-tx-macro.c
@@ -2021,6 +2021,11 @@ static int tx_macro_probe(struct platform_device *pdev)
 
 	tx->dev = dev;
 
+	/* Set active_decimator default value */
+	tx->active_decimator[TX_MACRO_AIF1_CAP] = -1;
+	tx->active_decimator[TX_MACRO_AIF2_CAP] = -1;
+	tx->active_decimator[TX_MACRO_AIF3_CAP] = -1;
+
 	/* set MCLK and NPL rates */
 	clk_set_rate(tx->mclk, MCLK_FREQ);
 	clk_set_rate(tx->npl, MCLK_FREQ);

---
base-commit: 5ba73bec5e7b0494da7fdca3e003d8b97fa932cd
change-id: 20231116-topic-sm8x50-upstream-tx-macro-fix-active-decimator-set-93d363bfb369

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

