Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A50080E5A8
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Dec 2023 09:14:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B7FC3857;
	Tue, 12 Dec 2023 09:13:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B7FC3857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702368843;
	bh=YWJTETWYjknlxDQZ6R477l//xiaIfg4p6od8XS8m8RM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uzQ5h+DJ3gyflYMk3F8ikOa1bYgKkpC+LC7hqu3Nr23BX+1PDFt5dTOB/9XUo8fE4
	 qNu38xzZNiI2MJm909uLGraLDyEdegTfgl82rKIHog1xBULqws9EfrQl5LTD+OD4uX
	 2JezQvkS/HphZW4pgshziRuU/SVVO/nFgedNL9A8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AC540F805A0; Tue, 12 Dec 2023 09:13:22 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 459A4F805B6;
	Tue, 12 Dec 2023 09:13:22 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2C71AF8019B; Tue, 12 Dec 2023 09:11:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CEB04F8001F
	for <alsa-devel@alsa-project.org>; Tue, 12 Dec 2023 09:08:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CEB04F8001F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=nx+seFcK
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40c2bb872e2so50176195e9.3
        for <alsa-devel@alsa-project.org>;
 Tue, 12 Dec 2023 00:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702368505; x=1702973305;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SjsUBVi5G85rjw5NZnVt5dU+RrCBs8LjzvSepIHmMNg=;
        b=nx+seFcKEz+P9OLgj9/YMNX3V9KTSzX5hI9NcRPHabsB9J0FsLlfMdLbK6o9Lw0xvN
         KWdUibBqAz+kiCMKtivK0c1eFRiYjaqdpY//Tcfijhdlo+kRBYcRKfwCq0fG12kS2a2F
         Ak8MwM++tYi7WA2ncEvviUxsW37S12yPlDhkBL4CWty2jrvJNgrjKo5FifFEb+iZQw4w
         YrZweFlTjKRYIu72l14Y/vJS3kjujfD2LC7rwKgxdLBJfiw1IDO5/M+KEVZ8b1cT8g2O
         nPraVGGzVlzzkLPI0xIWZXhT8/EMVByr1QnScTw9Rvq/rMB4Ci2c7UUZprTkh058lYAr
         T1dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702368505; x=1702973305;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SjsUBVi5G85rjw5NZnVt5dU+RrCBs8LjzvSepIHmMNg=;
        b=q/bY6NhmC0bh2EazlrKzyVXL0hFDHWnj2dqoWpzKw1GjgP5/J0tB/UBeVJLdY84p3T
         GYLQ1JJwo/f5MYc49hPPFOH77iWj3WmfF2echahDECHzOMJlOsvb/4KmSyXjCsn6veom
         BDP5jsyplos42XEvmH+BiXKnpy5tmDOy29v/INcNzq+BD2LdLPLfuij39UV5fViLmSoh
         JxKhNsP6Imn7fhHb+4rB7FYQJ1uxCLE0B8FK+j8IRmiNGPo/q4CGqLp8zA1k6vHpRYB3
         sW515VvXhfF0JSoJ32UmXywbl9HwEjaUwJTj3y7i2aR86cwOuWuhDD7Ptb8eWcjbuSyi
         SG0A==
X-Gm-Message-State: AOJu0YzG4w91xcMqceT6HHprYNZt/uyorWs2VfJh4OYqgu0Djw1G/d8d
	NkKTftLmGuHEHX70MwCEWpGOAg==
X-Google-Smtp-Source: 
 AGHT+IFfkyqKnzf9B3uP20udjSsmX09jF+/627Q+ZztERDXFFvY7vVxZCsWpO5slEmEBeeU9gP2qxw==
X-Received: by 2002:a05:600c:6022:b0:40c:25c0:4927 with SMTP id
 az34-20020a05600c602200b0040c25c04927mr1539927wmb.302.1702368505751;
        Tue, 12 Dec 2023 00:08:25 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id
 n10-20020a05600c500a00b004094e565e71sm15609355wmr.23.2023.12.12.00.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 00:08:25 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 12 Dec 2023 09:08:19 +0100
Subject: [PATCH 1/2] ASoC: dt-bindings: qcom,sm8250: document SM8650 sound
 card
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20231212-topic-sm8650-upstream-snd-card-v1-1-fbfc38471204@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=801;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=YWJTETWYjknlxDQZ6R477l//xiaIfg4p6od8XS8m8RM=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBleBT2yc6YoUAH2Yn6SHJC6hShZxUVx5XttQcfq+LS
 p6KqGJGJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZXgU9gAKCRB33NvayMhJ0cPdD/
 9ltn3cS4Ik/pOu00+WF+DCyWydbN4iIb8DYdAlHZT9eAx5hnUrzYTLWC6SzJXDu2WpTmm3HbmneVm5
 rGH33RRDcwJUluu0waPT5w9o7mjdhpSe+98t/oBKomnI67GmknXEbCJIkYbPxFEDqyeuy9+1SNbUJt
 ZeGvzitvxcekKYQNpiNUaHKbo8qx1NdPccOTg2QNqhy54wme7hNOLMYSPBYXevWBWaozpIp4dBTOf/
 IeuUSfxx5VIYV3xEWGkA5sF8OxdMdkpSAU4MBhOE/hJ28RtpdKb6sPpAhzrU/HX0VXTjQ8j1fbZVhI
 hOQe+kptCO5LRV2vCQTf5+Opqx8XuiuzVNigJe5/IM+VEhE58PSHYKS+YfdmiCCstIa20LeufBLuJ6
 vGBYQOz7CjqiyyPe4fyxUtD9DEpetrN3JmEp2RsVBMIP5KJv8L9psxsZZEJi/2FOGgLG9N96Lf+H/j
 +ejPqjoJ33jHC82iaSO+02S5vmRvm5oabY+DWSbcQe3KSCUyyBboV1sN/XID06WKefep+ElXWmdl/G
 YjmwHyhDoAYicKK9DThir62fXIoWsqFdlN5yzTVOv8KVsCHtqb1IEv7VjkDtjjtQhBdwO2Sgf4TzLu
 MISS+gzEkgKwCcYQi3KYk5PRbASLI3KrKj5lSqmDPqSULGYBPMHLXm87twAQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
Message-ID-Hash: JSXO6XNGJF36FGW27QVVISGUBGASYSUT
X-Message-ID-Hash: JSXO6XNGJF36FGW27QVVISGUBGASYSUT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JSXO6XNGJF36FGW27QVVISGUBGASYSUT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add sound card for SM8650, which as of now looks fully compatible with
SM8450.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index ec641fa2cd4b..ce6b1242b06b 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -24,6 +24,7 @@ properties:
       - items:
           - enum:
               - qcom,sm8550-sndcard
+              - qcom,sm8650-sndcard
           - const: qcom,sm8450-sndcard
       - enum:
           - qcom,apq8016-sbc-sndcard

-- 
2.34.1

