Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7FB303CDA
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Jan 2021 13:22:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C6F717A9;
	Tue, 26 Jan 2021 13:21:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C6F717A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611663761;
	bh=Hfktci+wQiCWrx5GmUeS5H66RNpngb9jgi6ys2ZxCus=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZMRuXPAwiFx7/TWMgiYGvhCMZ4VqSVpCnSu9kAZWHVdfvIWzqcfFt/J04tk+6ksQr
	 ral2RLuPHuZql99rpSAIf9mHdGuPJzKI39iz1DFN8ELjvowrvYSkZYLG9jfrqRRUDk
	 pUcfZZfvJG+op1WNNDq/+Nd3CkbvApBErj69JOqs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E179FF80158;
	Tue, 26 Jan 2021 13:21:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E371AF801D8; Tue, 26 Jan 2021 13:21:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 65D3EF8011C
 for <alsa-devel@alsa-project.org>; Tue, 26 Jan 2021 13:21:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65D3EF8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Kpx6+TDB"
Received: by mail-wr1-x431.google.com with SMTP id v15so16218435wrx.4
 for <alsa-devel@alsa-project.org>; Tue, 26 Jan 2021 04:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PGay3cWIFfTGXVJgJYEz2HA9Nfskw8Lpr3d/5Y01BQU=;
 b=Kpx6+TDBpZzINbQVksCtDf0edv2+6ZBEuae37HH5PL1YKkPF3mQB7mjA4USFVymwI0
 1WGoNA9amxJB5Ky+p6RMrPsOp4azcGY8T20WkQDoZJiekOWl95IcAU6ouaPQZCv2UvoU
 O511ccJ+jt3UaTfWSfz/jU14m2zlLErH32Aki/sGSdam1WPFaFrp9tCJsInJruPHaiLI
 rUtK4G08vKSV1UP3oIp21ccrVcqap1x9XWz88akff5f1rZrI5u19eo2AinJ5Cia16Wd8
 hZtvQMdr3W1Ina2LkpIg6smf7yW6M9D1yDWSqTfS1a37OGS+cFrkiTX3imlgm6GeItvG
 IS5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PGay3cWIFfTGXVJgJYEz2HA9Nfskw8Lpr3d/5Y01BQU=;
 b=aNOvwH+G+CLYQFhmtjGqO81WhuDQjuzSveJRfzYGnBVLCrBil/xbX/+keRSHh22bfI
 T5/0NOMBUBe3aoi3GnQnU0t4dmwtWBYV57aiGRE8wLlXdzLGo8WtS6SwWNkkvh/D0kSV
 hbMyvOT5C/O24eupb9NZLyaSN9pzaOppNKrMwUVbiQ7q16k3N8WVrH9CdEP5PHcqJaJ9
 9pZVL5vJZjDJsuVxbRF6RDvbkEyqpAIfuU1brUP2baGWSPgMec02pVmS7v1+k7i5JkgV
 Q4oQgTUhryoPMNCeYx52vVLM9n6UVIVDA90xe3h7OHKTIzXwisT2L/pfS4FNgXKZXaWN
 jtdg==
X-Gm-Message-State: AOAM532VPJf3v/Xb/fKkbkVBmqiW0aLTankgeaCncydgaG1dGzUyhsXT
 LrYrszLVE7zHcvZtPPzKcx5fGQ==
X-Google-Smtp-Source: ABdhPJzWuBSc18W8U//lbfGPeHuIY8wsRVGuX5eWxpbwLQ/2vTe2Y4EuBN6eZ3iPZmuNxCp5glRInw==
X-Received: by 2002:adf:dd81:: with SMTP id x1mr5841474wrl.249.1611663659997; 
 Tue, 26 Jan 2021 04:20:59 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id o124sm3218908wmb.5.2021.01.26.04.20.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jan 2021 04:20:59 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [RFC PATCH 1/2] ASoC: soc-component: add
 snd_soc_component_read/write_field()
Date: Tue, 26 Jan 2021 12:20:19 +0000
Message-Id: <20210126122020.19735-1-srinivas.kandagatla@linaro.org>
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
 include/sound/soc-component.h |  6 ++++
 sound/soc/soc-component.c     | 62 +++++++++++++++++++++++++++++++++++
 2 files changed, 68 insertions(+)

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
index 760523382f3c..6bdfc6f61ed6 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -12,6 +12,7 @@
 #include <linux/pm_runtime.h>
 #include <sound/soc.h>
 
+#define __soc_component_field_shift(x) (__builtin_ffs(x) - 1)
 #define soc_component_ret(dai, ret) _soc_component_ret(dai, __func__, ret)
 static inline int _soc_component_ret(struct snd_soc_component *component,
 				     const char *func, int ret)
@@ -839,6 +840,67 @@ int snd_soc_component_update_bits_async(struct snd_soc_component *component,
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
+	mutex_lock(&component->io_mutex);
+	val = soc_component_read_no_lock(component, reg);
+	if (mask)
+		val = (val & mask) >> __soc_component_field_shift(mask);
+	mutex_unlock(&component->io_mutex);
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
+	unsigned int old, new;
+	int ret = 0;
+	bool change;
+
+	if (!mask)
+		return false;
+
+	mutex_lock(&component->io_mutex);
+
+	old = soc_component_read_no_lock(component, reg);
+
+	val = val << __soc_component_field_shift(mask);
+
+	new = (old & ~mask) | (val & mask);
+
+	change = old != new;
+	if (change)
+		ret = soc_component_write_no_lock(component, reg, new);
+
+	mutex_unlock(&component->io_mutex);
+
+	return change;
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_write_field);
+
 /**
  * snd_soc_component_async_complete() - Ensure asynchronous I/O has completed
  * @component: Component for which to wait
-- 
2.21.0

