Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3D1329C50
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 12:24:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B2042171F;
	Tue,  2 Mar 2021 12:23:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B2042171F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614684271;
	bh=1ipbjuGPh6R9cUAB1ajC4/cWVS4T2KQQPTo63o7FglE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VX9Zxa8PjUjyizREu6emzTOgKwupw7EcPfeJ60WPnj3WyOx+okYp8JrhyuGuLcWmf
	 fGgAvNr0aU6iDcmxqfaptPuBVpkzC3M9q0UWbYLLeYZ5X2am672wnDW7Y522dRXmoO
	 Q1Lm5SY3OcJBaR9lxPinlbY9yTGjeQ7sTmPfU8jY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E2A63F802E3;
	Tue,  2 Mar 2021 12:22:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7BC71F802E3; Tue,  2 Mar 2021 12:22:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9211BF80227
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 12:22:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9211BF80227
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ij6zyyk2"
Received: by mail-lj1-x232.google.com with SMTP id r25so22448957ljk.11
 for <alsa-devel@alsa-project.org>; Tue, 02 Mar 2021 03:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xg6BAG0aRzJfW3NL7J2fV5y7N6SqjvW9ZuXns5YdGNw=;
 b=ij6zyyk2aNlnnd0XbYbXxR36/zxdJcr9oByFXbsLlM07fBQJN/XPW5dS0umXVs3XrX
 dKb1YQ8a0gVCNKjADTd1RstNMz9rp+XjqXRIUUctar5a9uwwyr+8SKiM/O0yBBhcnGom
 4st8pL5dZxsqRTFfsRm37Hqwsiu2fzBbjPhoJzY+o4MqR9HMilYX6zzPxgy5eAEsoe+F
 ijahXaj6u45ZWQ4YMnguCdwtluvUK8YMzenP0OmgdLwwkqPxsDPuXhnCMxYZuwR364Ok
 QIAwqM0Rjfe52bABrP21DXJol2fqr51UgLU5KHILSvm2ERP8ZQV8b17+8kOD6BoClieG
 A8oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xg6BAG0aRzJfW3NL7J2fV5y7N6SqjvW9ZuXns5YdGNw=;
 b=fWe1zlDhA0OaBBzOOtKqKa4c1Wk9YOc7WiQ+jzTcuT86286TdIOE/WMb2O6NfiZqK+
 jOwSbPwvPGLqrVrnwX0r+H8AfL/QxyngIi4mdPfvwhPhshLS9BWO+W3CpQ+qhui6cfyh
 GGktzuRTrowkZ1iLTbMiFDK/8UvZUlyZ7IOwSZIJc4I1WQSbPfVxsNOuc3TRetLbz/ZQ
 KnpCQuoe3wGwCJ9d9840vr03UfL8upjH/nkQkkbEahtqdylqVdasVPaLna39RO+u4Hkm
 n9y3CDS5nU2wdgX/bhZkhdhCaGlmIO0Waj84nejcjPU5F5KIIf9f8aI/aDNdD26pTlvQ
 uzag==
X-Gm-Message-State: AOAM530RktrzKQwPNmYdUKcAdeYkPKKuktHcKiU/0fTXHvvLruaylUkV
 lX084TajtZIgtGlX5f7iJD0=
X-Google-Smtp-Source: ABdhPJztqfJKjybeaUExw8rEhx/7K9lWQwQ4Fio3EyS4lLaojOGOfgeTNngjfqdTuKrt1x7E4as3tg==
X-Received: by 2002:a2e:9908:: with SMTP id v8mr8601266lji.460.1614684125149; 
 Tue, 02 Mar 2021 03:22:05 -0800 (PST)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru.
 [109.252.193.52])
 by smtp.gmail.com with ESMTPSA id w7sm2691078lft.0.2021.03.02.03.22.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 03:22:04 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Fertser <fercerpav@gmail.com>
Subject: [PATCH v1 1/5] reset: Allow devm_reset_control_array_get() to get
 resets in a released state
Date: Tue,  2 Mar 2021 14:21:19 +0300
Message-Id: <20210302112123.24161-2-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210302112123.24161-1-digetx@gmail.com>
References: <20210302112123.24161-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Allow devm_reset_control_array_get() to get resets in a released state
in order to make it possible to extend reset-API with resource-managed
variants of retrieving resets array in a released state. In particular
this is needed by NVIDIA Tegra drivers.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/reset/core.c  |  8 ++++++--
 include/linux/reset.h | 14 ++++++++------
 2 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/reset/core.c b/drivers/reset/core.c
index dbf881b586d9..f36de3d3849b 100644
--- a/drivers/reset/core.c
+++ b/drivers/reset/core.c
@@ -985,6 +985,8 @@ EXPORT_SYMBOL_GPL(of_reset_control_array_get);
  * @dev: device that requests the list of reset controls
  * @shared: whether reset controls are shared or not
  * @optional: whether it is optional to get the reset controls
+ * @acquired: only one reset control may be acquired for a given controller
+ *            and ID
  *
  * The reset control array APIs are intended for a list of resets
  * that just have to be asserted or deasserted, without any
@@ -993,7 +995,8 @@ EXPORT_SYMBOL_GPL(of_reset_control_array_get);
  * Returns pointer to allocated reset_control on success or error on failure
  */
 struct reset_control *
-devm_reset_control_array_get(struct device *dev, bool shared, bool optional)
+devm_reset_control_array_get(struct device *dev, bool shared, bool optional,
+			     bool acquired)
 {
 	struct reset_control **ptr, *rstc;
 
@@ -1002,7 +1005,8 @@ devm_reset_control_array_get(struct device *dev, bool shared, bool optional)
 	if (!ptr)
 		return ERR_PTR(-ENOMEM);
 
-	rstc = of_reset_control_array_get(dev->of_node, shared, optional, true);
+	rstc = of_reset_control_array_get(dev->of_node, shared, optional,
+					  acquired);
 	if (IS_ERR_OR_NULL(rstc)) {
 		devres_free(ptr);
 		return rstc;
diff --git a/include/linux/reset.h b/include/linux/reset.h
index b9109efa2a5c..3bee086f1f06 100644
--- a/include/linux/reset.h
+++ b/include/linux/reset.h
@@ -33,7 +33,8 @@ struct reset_control *__devm_reset_control_get(struct device *dev,
 				     bool optional, bool acquired);
 
 struct reset_control *devm_reset_control_array_get(struct device *dev,
-						   bool shared, bool optional);
+						   bool shared, bool optional,
+						   bool acquired);
 struct reset_control *of_reset_control_array_get(struct device_node *np,
 						 bool shared, bool optional,
 						 bool acquired);
@@ -105,7 +106,8 @@ static inline struct reset_control *__devm_reset_control_get(
 }
 
 static inline struct reset_control *
-devm_reset_control_array_get(struct device *dev, bool shared, bool optional)
+devm_reset_control_array_get(struct device *dev, bool shared, bool optional,
+			     bool acquired)
 {
 	return optional ? NULL : ERR_PTR(-ENOTSUPP);
 }
@@ -511,25 +513,25 @@ static inline struct reset_control *devm_reset_control_get_by_index(
 static inline struct reset_control *
 devm_reset_control_array_get_exclusive(struct device *dev)
 {
-	return devm_reset_control_array_get(dev, false, false);
+	return devm_reset_control_array_get(dev, false, false, true);
 }
 
 static inline struct reset_control *
 devm_reset_control_array_get_shared(struct device *dev)
 {
-	return devm_reset_control_array_get(dev, true, false);
+	return devm_reset_control_array_get(dev, true, false, true);
 }
 
 static inline struct reset_control *
 devm_reset_control_array_get_optional_exclusive(struct device *dev)
 {
-	return devm_reset_control_array_get(dev, false, true);
+	return devm_reset_control_array_get(dev, false, true, true);
 }
 
 static inline struct reset_control *
 devm_reset_control_array_get_optional_shared(struct device *dev)
 {
-	return devm_reset_control_array_get(dev, true, true);
+	return devm_reset_control_array_get(dev, true, true, true);
 }
 
 static inline struct reset_control *
-- 
2.29.2

