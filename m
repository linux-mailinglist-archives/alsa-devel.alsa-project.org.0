Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B18684043A
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jan 2024 12:53:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09E50112;
	Mon, 29 Jan 2024 12:53:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09E50112
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706529193;
	bh=pEaaZzWd53CrhjsWjih79Gm0lLf84UYwD3xSD5zEQj4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IHmkbNw2WAXkaSsc0+rupIgF3JAAnLhButM5heye1v5ejo3Ka0NmDVoo6/ynye3ie
	 RTK9MPa0DRxbMwiz6osDIsn3WXEOrq+04DykJxwgFFVvDG+iHrr9rH2+97lMVurmWd
	 ZnijavS1AKuKauur8qg1yJU0M5xNRKzWaDXIqsaY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C4BBBF80579; Mon, 29 Jan 2024 12:52:36 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A4411F80548;
	Mon, 29 Jan 2024 12:52:35 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E88CAF80431; Mon, 29 Jan 2024 12:52:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7F2E1F800FB
	for <alsa-devel@alsa-project.org>; Mon, 29 Jan 2024 12:52:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F2E1F800FB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Yp7foaPz
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-55ee686b5d5so1449484a12.0
        for <alsa-devel@alsa-project.org>;
 Mon, 29 Jan 2024 03:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706529142; x=1707133942;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7u11vGwKEs3fH7gtNpJv3ew33Q7fXCEnCXNY0GONseQ=;
        b=Yp7foaPzOwY+SaEy8Zk9LPuWWhV8z+MsmNsS73LehDOkoknsqrCnC2XxMZ6ILqQ30H
         UHmO7d3piZnuK+HjvPqJAx9fh5/ehDL6qRrvRIzEqY/LX6QQxZdBZ8kVpcp2FXA7QV1x
         t8LRTeDE9M2beueK8Oxppe5ezqy8/Xi8gQd7dngDflkBF/8qqn3Yl+c1cZ5rN0xRD9PM
         CtGV1VR2dXb4I/G90GZMS7BbOcyNCMFAp2DeaVfoBbfeW6u37SfNrCsqifzkrX9ADDrN
         RNhBFppI+SpMkiZ7dkijJogW1SqNRvG8BKP+piDJ3eoO74gGsmNlSOWlgYTPS+Z0YpWd
         iG2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706529142; x=1707133942;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7u11vGwKEs3fH7gtNpJv3ew33Q7fXCEnCXNY0GONseQ=;
        b=FaGKzJgKrIICczzHz/EWlDJV/6iqpblim4G5H6zJPJxwrOUmn+3JT670iBP1pDFMPx
         nGj7XoXcJsKEw2JVod9vEBrROEQ1tahp75gwT9NhJe0T9k5+Ahh4idQrzFqsql/36M7c
         W3VSJBSesEeWxuAzGH0UjiKtmvsvilak8iG4uE0f5oXUO6/EzsQFJ+jbxJ9oRwPF9f2v
         DOClemULCO6V2GwL0TrfleQw3DzJ5AxqYocGzZ8lSzmyK+UrQlD1ykwvu7dFbuhXcEG9
         Ev4ya42Vqy77qJBYuVjLbW82CzeQddN5IUQTT7fqNQkqmyRr/dkvViVkLCDPgDWOqb8T
         E4uQ==
X-Gm-Message-State: AOJu0YyrVCmjAWaJ5RVdPCVJyQKdJCK4XijHMfTKkhO7FhU82A8/Y3eV
	iI2XU4t3bS0uUDzjUFse50gTQQzHqhugasAdKsW7+M8NsPVYp/yA01gRcGeUZNM=
X-Google-Smtp-Source: 
 AGHT+IFmy3sCvOF6JNQB/p5p+/mn9vblRl4lD4OGfVKlB3WcdWBRMAzyMpmnKg1BqnvigRA+MvIHwg==
X-Received: by 2002:a05:6402:274b:b0:55e:f866:30dd with SMTP id
 z11-20020a056402274b00b0055ef86630ddmr2119525edd.12.1706529142419;
        Mon, 29 Jan 2024 03:52:22 -0800 (PST)
Received: from krzk-bin.. ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id
 ec19-20020a0564020d5300b0055f29ececeasm19907edb.57.2024.01.29.03.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 03:52:21 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v6 1/6] of: Add of_phandle_args_equal() helper
Date: Mon, 29 Jan 2024 12:52:11 +0100
Message-Id: <20240129115216.96479-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240129115216.96479-1-krzysztof.kozlowski@linaro.org>
References: <20240129115216.96479-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: RASNW7R2XJKYQWT4C44UPXYYTDKKX2BM
X-Message-ID-Hash: RASNW7R2XJKYQWT4C44UPXYYTDKKX2BM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RASNW7R2XJKYQWT4C44UPXYYTDKKX2BM/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add a helper comparing two "struct of_phandle_args" to avoid
reinventing the wheel.

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Dependency of cpufreq and reset change.
---
 include/linux/of.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/include/linux/of.h b/include/linux/of.h
index 6a9ddf20e79a..85bcc05b278d 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -1065,6 +1065,22 @@ static inline int of_parse_phandle_with_optional_args(const struct device_node *
 					    0, index, out_args);
 }
 
+/**
+ * of_phandle_args_equal() - Compare two of_phandle_args
+ * @a1:		First of_phandle_args to compare
+ * @a2:		Second of_phandle_args to compare
+ *
+ * Return: True if a1 and a2 are the same (same node pointer, same phandle
+ * args), false otherwise.
+ */
+static inline bool of_phandle_args_equal(const struct of_phandle_args *a1,
+					 const struct of_phandle_args *a2)
+{
+	return a1->np == a2->np &&
+	       a1->args_count == a2->args_count &&
+	       !memcmp(a1->args, a2->args, sizeof(a1->args[0]) * a1->args_count);
+}
+
 /**
  * of_property_count_u8_elems - Count the number of u8 elements in a property
  *
-- 
2.34.1

