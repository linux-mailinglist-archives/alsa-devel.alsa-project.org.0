Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 697B8818896
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Dec 2023 14:24:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 42232E11;
	Tue, 19 Dec 2023 14:24:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 42232E11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702992267;
	bh=jX/VQsyuPIyHVsUjFUCTRKQIEp2WX+Su12Xn85ZrU+8=;
	h=From:Date:Subject:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=FTbxFFnd1CUSaK7x5Bj70y56PU+1+J4wppAhLOLqeBe8YpsetnFti6KTfA9+sV0fz
	 TKaPxZriiv0MKqp5WAalPK96idgHb19IFGIB2E3F2S1EuF0bAJCo+Qc7kmpoozinvR
	 LtDQkGbp/fMYTDalJehTr0c7fUjzZpvy5+6XLnxw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DFD2CF805A1; Tue, 19 Dec 2023 14:23:55 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 36A12F8055A;
	Tue, 19 Dec 2023 14:23:55 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 81A3DF80425; Tue, 19 Dec 2023 14:23:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 87DA5F80124
	for <alsa-devel@alsa-project.org>; Tue, 19 Dec 2023 14:23:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87DA5F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=jb6RfkJ6
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-33664b4e038so2483108f8f.3
        for <alsa-devel@alsa-project.org>;
 Tue, 19 Dec 2023 05:23:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702992220; x=1703597020;
 darn=alsa-project.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p3LPY/wP+4u8xv3gDTbgceni72i0f7dLsgXss15/0/U=;
        b=jb6RfkJ6EcUE5zKy37N6WneDqHUHrtwGGiUXQTyYXq/U4tQpeJoIgycyZNFTRRcFGf
         m0wQmQ5+WpOnrCvSxSH2ZqdxrEaAr7HQVJEnNypK8PG8MquiG9O38FTXp6D2E8Bp4wd4
         BFKtbyEJHZwEByJTURRpRCDuLCJJlBujBtnigf/cPccfHg05jdydLtrrvDHjwNlPrTjg
         I8/cXMDULSsvH8iO2z09udAafBYp6i6oQhKYL99eIunrrG/n37XDuTLfv2H1IwDYOzsp
         D/c4L94Q304Dv630gfaJ8vXC/qAtyDnStCI21rYmailMozaA3pNTJZnkbW/+ibFQuVHB
         Ar3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702992220; x=1703597020;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p3LPY/wP+4u8xv3gDTbgceni72i0f7dLsgXss15/0/U=;
        b=EXtZxaxmSdVaLsV/TFyqVntEXy3aAsD+IXMM1FVYx3e1/Pg/DWb+8nWKB47t3ibEsC
         EKqRai81MfWCN/f25DsveAtsF3PL5a+4wSwnJ+VR0wb8eTgRCxydDmso04dZe+RIr4mS
         7kZlvUQMkWpPROoPh/C6qKX7u1Hcl2oa82q2MS9DTMRP6kiJkjPEGREg4oaXL8nQevN0
         +fdABhXTfPaXMadybu0ArpgJu+km8dMYnofSRVOsUouc0henW5P8kA6XHHC920BlU1n+
         oCVLYmniQ6AwFDTXVDH9T097QH7Db/GvKviU22rtKaOgzM0R4/KttJabZ1Fu5IA58OaN
         qbvQ==
X-Gm-Message-State: AOJu0YwyBBhCjPlBHKVTaPtTR8Qw42H+EhghinQB5U1zldLi/tSeKNgI
	z1VSmqlviIT2b0QXW/pDK+f8Ug==
X-Google-Smtp-Source: 
 AGHT+IFHYzvyDi0corcqB0NWZOjE5iHCoZWBmG8HzPdskcKE9UWUerE1vnbScokBVmD2OSU8t9HD/g==
X-Received: by 2002:a5d:45cf:0:b0:336:578e:2bd1 with SMTP id
 b15-20020a5d45cf000000b00336578e2bd1mr3224416wrs.108.1702992219991;
        Tue, 19 Dec 2023 05:23:39 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id
 j4-20020adfea44000000b00336471bc7ffsm15010151wrn.109.2023.12.19.05.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 05:23:39 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 19 Dec 2023 14:23:37 +0100
Subject: [PATCH] ASoC: dt-bindings: qcom,lpass-va-macro: remove spurious
 contains in if statement
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20231219-topic-sm8x50-upstream-va-macro-bindings-fix-v1-1-ae133886f70e@linaro.org>
X-B4-Tracking: v=1; b=H4sIAFiZgWUC/x2NOw6DQAwFr4JcxxK7JFHIVSIKsxjiYj+yASEh7
 p5Vppsp3jvBWIUN3s0JyruY5FTF3RoIX0oLo0zVwbe+c971uOYiAS2+jkeLW7FVmSLuhJGCZhw
 lTZIWw1kO7P19rjyJOwd1sSjX/H/7DNf1A26qMf59AAAA
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1689;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=jX/VQsyuPIyHVsUjFUCTRKQIEp2WX+Su12Xn85ZrU+8=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlgZlaDrfW46D5usNUF+97Tkj84cNtskNX0ajIjSB4
 c2y3rGGJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZYGZWgAKCRB33NvayMhJ0YOND/
 46yLraBMW6CnFYt7o5AHOdDFaYq3RCOhhkv53wUrp2UT+9o0dkTo/hdaKGwJlfGVtpIjkR1G/W1n0l
 p0DAmni76jmRO2lXdxtWY9XfPqYXaFDdgo6OOkaA4Y6CJwJvQqDsRo+wpXftMOvHtgjwbmum8DzLZW
 70LxmqtfBXdA/5cxUDQecXMUtJt1RKpCDd84m1OsigYHQ0xVld+pem0MZRY1IHBZ8+e7NmeXKqwhJA
 4pbEKd7WeekEhtE8IouZbs1TptF1VnkgL7tKBloFGy/6bh0fQj+nvKZG520uXczqi8u3kuDnJNn2dd
 Z7e/+jsEOq39jgYM8at/AGCksKx81laJRZ26/eXExBzOrtdCWQYrjq1rJI9/FeUK2MUSeESB6CS00J
 uGFsd0iaGjIU8mMWI6Swqf23/kR2ci/zLrdpPMsq97gyNbHQ8xq6zrAv5N5/TNMPA39cQ+cu+xDxjq
 zhODVdvJ2NDNBaMmRab4ZyGjH0WrzZgNeSXLuLU9DWtblMAJc/WjZFfq097FZhl0DkGiD1e3zZ31ej
 1xr936utWiaifj2KSeILxMgX0zVAc+gO/BBC4tsvQZnSTOj0x0qzVmWh3dDsUBXG6eeCzsOs49NraC
 176n4KxcOQHDA7kWYlN1tFI0aJFqGUNUfZh60WteKpzmVEaensgmrZU/UuDw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
Message-ID-Hash: TWB44HFK6QDKV6JSZGOQ5Y7SM3EQHTV6
X-Message-ID-Hash: TWB44HFK6QDKV6JSZGOQ5Y7SM3EQHTV6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TWB44HFK6QDKV6JSZGOQ5Y7SM3EQHTV6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Remove this spurious "contains" which causes the bindings check of
qcom,sm8450-lpass-va-macro compatible to fail with:
codec@33f0000: clocks: [[156, 57, 1], [156, 102, 1], [156, 103, 1], [156, 70, 1]] is too long
        from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-va-macro.yaml#
codec@33f0000: clock-names: ['mclk', 'macro', 'dcodec', 'npl'] is too long
        from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-va-macro.yaml#

Seems the double "contains" was considered as valid by the tool but broke
the entire if statements.

Fixes: f243ef746d0a ("ASoC: dt-bindings: qcom,lpass-va-macro: Add SM8650 LPASS VA")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
index c03ff9472a85..6b483fa3c428 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
@@ -121,9 +121,8 @@ allOf:
       properties:
         compatible:
           contains:
-            contains:
-              enum:
-                - qcom,sm8550-lpass-va-macro
+            enum:
+              - qcom,sm8550-lpass-va-macro
     then:
       properties:
         clocks:

---
base-commit: aa4db8324c4d0e67aa4670356df4e9fae14b4d37
change-id: 20231219-topic-sm8x50-upstream-va-macro-bindings-fix-924ffff6ae31

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

