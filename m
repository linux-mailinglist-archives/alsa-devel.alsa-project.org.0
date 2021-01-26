Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 039873044ED
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Jan 2021 18:19:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7CACF17A9;
	Tue, 26 Jan 2021 18:19:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7CACF17A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611681590;
	bh=fmxClVeVaR1akR/RDTs5f3lIIYaiPV+fZkPIVpJlLUI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=c3+CDGz1f7ym+3dQKL51aomwLXXI5JgmzxF9uFvkO2pb2Syb7zIktZt7KEQE23IAr
	 4KBfwTW91T0uJcJwXAAlRqfcEEft5OwKGupif+aZlKKws7ztWupA+6GQ5qV6quRXvJ
	 tEeD7wxO+r2+joN4Kw612McD1F+KCtkHVA2+/uDs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4EA79F80217;
	Tue, 26 Jan 2021 18:18:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE945F801ED; Tue, 26 Jan 2021 18:18:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B92FAF8011C
 for <alsa-devel@alsa-project.org>; Tue, 26 Jan 2021 18:17:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B92FAF8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Cp91oKUP"
Received: by mail-wm1-x32b.google.com with SMTP id u14so3430424wmq.4
 for <alsa-devel@alsa-project.org>; Tue, 26 Jan 2021 09:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5oZwAs5jCwM5rUFoGrWthIvQJwNmDYK0KvJ2Ndn+HsM=;
 b=Cp91oKUP1tX+yAlvX9OrtyrtPje0Wobzs4UtSdUeNxDmEB9Ex9kKbG5v+lVbzUhmqI
 Nu47q1PRX5EQW1VKSsk2C3jHPAhSNGxn1CF/ahi9dGS2V2/m8DQ6vJ8jbL3elSfnFmvH
 TFeuoGf+jOcpaK2WUWXBXLijUWchUmqJKPSFxiu7V+Q/XHR6afbTooh+yOjRgUkIN9hB
 MgtcDR9UfKN4O7aVi1elNxLKY4ZKe1VsVs4mJgzaGP6TbG81tuSsWBggeHR/2haUyTLu
 eQb7J56zv+kY8D52EZYOyiDDgElfZ40wXkGSETJ6FDxktUb8QTPxWQ4oRrGtZZ+jesFq
 6uZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5oZwAs5jCwM5rUFoGrWthIvQJwNmDYK0KvJ2Ndn+HsM=;
 b=fKuxacHcaqj8qckGI7RwD5LlUDGARJlDquLJL7Zoi5IIp4xGLqXbV1sBQ+UoO0znFw
 99/i5MeTIbFsb11sVc7eCVkO+r7Tg+QJ/4DB6VxNLkHP1uJRx6b4Y8kRt+eY/dV0LVHb
 MGebTjc8vGWj228redu4opEyklwVMwdq/+Pg9RkTXfPOEuyQXeQARa/12BTT6AXEiweF
 W2g1Xr/MPznONZvww3c8wO0GwGcXLDOOHsNTwlj7RY9gJ5XgvR+QczvITBi7nK7+u3tI
 NLEYeeV2Si2r0agUDDByVDrc0995UL4jItztthyDfYrWgzLiSjZL3oKTcH9hKcjqhs1Q
 DgpQ==
X-Gm-Message-State: AOAM533IAZvwWAgEoInz5EyZCrzr8yNt6YkiXWDIVnAfJVaelzNQPq+n
 WArLbUGP2BclXaT2ZJFSvG0TAA==
X-Google-Smtp-Source: ABdhPJxjzhd4m765kvrf9puMDcTM4rkJyWs9c9NmoD0a9K9WDqvgpZ7n0ROVbkrEXHlC0OppmlqlPQ==
X-Received: by 2002:a1c:25c2:: with SMTP id l185mr695835wml.62.1611681473362; 
 Tue, 26 Jan 2021 09:17:53 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id d85sm5059157wmd.2.2021.01.26.09.17.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jan 2021 09:17:52 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v2 1/2] ASoC: soc-component: add
 snd_soc_component_read/write_field()
Date: Tue, 26 Jan 2021 17:17:48 +0000
Message-Id: <20210126171749.1863-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, vkoul@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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

It's often the case that we would write or read a particular field
in register. With the current soc_component apis, reading a particular
field in register would involve first read the register and then
perform shift operations.

Ex:
to read from a field mask of 0xf0

	val = snd_soc_component_read(component, reg);
	field = ((val & 0xf0) >> 0x4);

This is sometimes prone to errors and code become less readable!

With this new api we could just do
	field = snd_soc_component_read_field(component, reg, 0xf0);

this makes it bit simple, easy to write and less error prone!

This also applies to writing!

There are various places in kernel which provides such field interfaces
however soc_component seems to be missing this.

This patch is inspired by FIELD_GET/FIELD_PREP macros in include/linux/bitfield.h

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---

Changes since v1:
	- removed open coding and call read and update_bits
	- made soc_component_field_shift an inline function

 include/sound/soc-component.h |  6 ++++
 sound/soc/soc-component.c     | 53 +++++++++++++++++++++++++++++++++++
 2 files changed, 59 insertions(+)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 0bce41fefd30..5b47768222b7 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -353,6 +353,12 @@ int snd_soc_component_test_bits(struct snd_soc_component *component,
 				unsigned int reg, unsigned int mask,
 				unsigned int value);
 
+unsigned int snd_soc_component_read_field(struct snd_soc_component *component,
+					  unsigned int reg, unsigned int mask);
+int snd_soc_component_write_field(struct snd_soc_component *component,
+				  unsigned int reg, unsigned int mask,
+				  unsigned int val);
+
 /* component wide operations */
 int snd_soc_component_set_sysclk(struct snd_soc_component *component,
 				 int clk_id, int source,
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 760523382f3c..361a79d655e3 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -34,6 +34,18 @@ static inline int _soc_component_ret(struct snd_soc_component *component,
 	return ret;
 }
 
+static inline int soc_component_field_shift(struct snd_soc_component *component,
+					    unsigned int mask)
+{
+	if (!mask) {
+		dev_err(component->dev,	"ASoC: error field mask is zero for %s\n",
+			component->name);
+		return 0;
+	}
+
+	return (__builtin_ffs(mask) - 1);
+}
+
 /*
  * We might want to check substream by using list.
  * In such case, we can update these macros.
@@ -839,6 +851,47 @@ int snd_soc_component_update_bits_async(struct snd_soc_component *component,
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_update_bits_async);
 
+/**
+ * snd_soc_component_read_field() - Read register field value
+ * @component: Component to read from
+ * @reg: Register to read
+ * @mask: mask of the register field
+ *
+ * Return: read value of register field.
+ */
+unsigned int snd_soc_component_read_field(struct snd_soc_component *component,
+					  unsigned int reg, unsigned int mask)
+{
+	unsigned int val;
+
+	val = snd_soc_component_read(component, reg);
+
+	val = (val & mask) >> soc_component_field_shift(component, mask);
+
+	return val;
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_read_field);
+
+/**
+ * snd_soc_component_write_field() - write to register field
+ * @component: Component to write to
+ * @reg: Register to write
+ * @mask: mask of the register field to update
+ * @val: value of the field to write
+ *
+ * Return: 1 for change, otherwise 0.
+ */
+int snd_soc_component_write_field(struct snd_soc_component *component,
+				  unsigned int reg, unsigned int mask,
+				  unsigned int val)
+{
+
+	val = (val << soc_component_field_shift(component, mask)) & mask;
+
+	return snd_soc_component_update_bits(component, reg, mask, val);
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_write_field);
+
 /**
  * snd_soc_component_async_complete() - Ensure asynchronous I/O has completed
  * @component: Component for which to wait
-- 
2.21.0

