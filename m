Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4449783A368
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jan 2024 08:46:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA8E4844;
	Wed, 24 Jan 2024 08:46:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA8E4844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706082390;
	bh=05A1V42ISzk91H47v/1k8F5cOUyqcqx459Ycs2uRiyQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FIiCdAXYD/5SVZjFCvZCORE8Ara7hyVJaQtyg6K/ksX2gthDQ+HuCqeYabZWJq2/G
	 9ybeJnL4a/hJBotltdvVZENloD8xhvE+KpuQA229qpf67VjBiyUmGAvnv/mIZxDf1L
	 0eMqC19dvqiv+zXFdjngKaBDkmfwxvh8dJzNvRS8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EE87FF8059F; Wed, 24 Jan 2024 08:45:58 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A0605F8055B;
	Wed, 24 Jan 2024 08:45:57 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6C43BF80520; Wed, 24 Jan 2024 08:45:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9B990F8003A
	for <alsa-devel@alsa-project.org>; Wed, 24 Jan 2024 08:45:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B990F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=vkMSMmy4
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-557dcb0f870so6179745a12.2
        for <alsa-devel@alsa-project.org>;
 Tue, 23 Jan 2024 23:45:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706082334; x=1706687134;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rvG442LOHG+Ot3BClfANwtHkjvhl+RcGyuBNzT4bkhE=;
        b=vkMSMmy4MZvxVtL5o+APQHiTTWYjxpsW146BkbsDCyECMYapcqkaYMN/Co1Kg0rtc+
         Rd8lAxjDLCF7LsRczVbZg+8gh8yOUrwznn+7L9PuWOot7k8nUGxu2f3dw05izCLFzgt9
         vRpSkvCvYJU3Eim7F+1bgkfx60rn3J4L+3vu7njuJMUULTBNXfqngn6O5Bi2AK4EcF9m
         2DXaM7J5/awGbu/ehiCaZSYy33Z/vF+8RSLBCPwIy226CnyAccyxWtfkcFqJEyLf8PZE
         4WYQ62OPs1HT3neH2MDOm6KeoFl53JMV31YDgXCLrnLvA498ocRE8Y2Cbgl9xuDS9BPx
         mPfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706082334; x=1706687134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rvG442LOHG+Ot3BClfANwtHkjvhl+RcGyuBNzT4bkhE=;
        b=k2k6AsQxSpGAILX7EsM8TzJCoEOx+pPP9xmJDs+CYX5tpLx+x5AxroxPxqnc6qbdvX
         J4YlmHBvvAVfEJEPzuMfcL2XigsbFoYorKthewlyWv7n121dUeA6YO/nUpgV0+ChWS2Q
         aERhg3d0ay1l2MZeBYGHaLy3ZgbFimM7OYEXGMBBLuaUrUWQlX3bMDQ+andDaRLS28i/
         RFBPzHkzZfxXetBEQai2f2XLs96HKQ7ibS2qgW2Noz1KWXnjt09EGaQrdfpeDN4+cvpR
         22MFD/wSIWeVLv8nHh3B2lgHA+x/iDueu9iihIIy+hkb+tLDgyPPaPn6oGhTvrYYX0NJ
         8ttw==
X-Gm-Message-State: AOJu0YzUF1JyOsMum7etze55r3dcOcOClU4d+C/v/gVeRD3LRuOrwl0S
	Ln/SMXvBHtDSBocmuX4inBmCL+5jxoDyz/43H0EOy86/s2yD/+iLHyl91FfPWFYm7TqKtuIxyCd
	q5mk=
X-Google-Smtp-Source: 
 AGHT+IFKJ5JzIQYT07scGs0jeluh6Z6hoVdJotYx/+32TFQ6MXa9NX+X/ooKaL8xLirc0Yw4l/nAzg==
X-Received: by 2002:aa7:c40b:0:b0:559:ca4e:d817 with SMTP id
 j11-20020aa7c40b000000b00559ca4ed817mr1564880edq.73.1706082334623;
        Tue, 23 Jan 2024 23:45:34 -0800 (PST)
Received: from krzk-bin.. ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id
 c4-20020a056402100400b0055c8a30152bsm1306951edu.83.2024.01.23.23.45.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 23:45:34 -0800 (PST)
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 1/6] of: Add of_phandle_args_equal() helper
Date: Wed, 24 Jan 2024 08:45:22 +0100
Message-Id: <20240124074527.48869-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240124074527.48869-1-krzysztof.kozlowski@linaro.org>
References: <20240124074527.48869-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: U7YAS56HYLLB5QAYCZDHFP7ZWPRCYO3B
X-Message-ID-Hash: U7YAS56HYLLB5QAYCZDHFP7ZWPRCYO3B
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U7YAS56HYLLB5QAYCZDHFP7ZWPRCYO3B/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add a helper comparing two "struct of_phandle_args" to avoid
reinventing the wheel.

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
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

