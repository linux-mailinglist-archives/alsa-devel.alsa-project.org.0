Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8524532FDF2
	for <lists+alsa-devel@lfdr.de>; Sun,  7 Mar 2021 00:04:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0DE361F9C;
	Sun,  7 Mar 2021 00:03:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0DE361F9C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615071850;
	bh=lJyK83QJM/M0ualrncJrMaBtTSkQAWGJ1gl3LtwKzGs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=shbqczRubOMwdUdLYK8cTPaSoAlWCszEssxtmxlsG2obXut+U5PJuv48LBCtICOjf
	 bpuekm2R4QuVweWMsVX9DuEbY3bUwDpcg/mu+5equd6moEvrla08C3WAGcmc6t8YIr
	 YrIAMIHnJdpx9LAwItMNYwHHQZsOf2xfaPEEudwU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 634B0F800ED;
	Sun,  7 Mar 2021 00:02:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8D4ABF80269; Sun,  7 Mar 2021 00:02:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6DF22F800ED
 for <alsa-devel@alsa-project.org>; Sun,  7 Mar 2021 00:02:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6DF22F800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="hfqb41hQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615071751;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LKmFE8VCObEH5jkmou56BqpgYKBCBH123BgXWnIAKto=;
 b=hfqb41hQPpuclD1NvWjID14GH202y+fIElZLeH9j6e0tJrSQfg9cn//da2aZMkWNcarTk7
 1LZLhzxbpxajhwAan5L6HCAklpsYiZdSXbdwDCxTQdtk4tSvUm8zivgtkLk9Hp2lUwJcJf
 mm+qsXo97MZGj5qZbLNDXlGVdZ7xkbo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-AR6e2DM5OvmJMzsvtpn7hg-1; Sat, 06 Mar 2021 18:02:28 -0500
X-MC-Unique: AR6e2DM5OvmJMzsvtpn7hg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A6BB4800D53;
 Sat,  6 Mar 2021 23:02:26 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-60.ams2.redhat.com [10.36.112.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 62F1950AC6;
 Sat,  6 Mar 2021 23:02:24 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH 1/2] ASoC: rt5645: Move rt5645_platform_data to
 sound/soc/codecs/rt5645.c
Date: Sun,  7 Mar 2021 00:02:22 +0100
Message-Id: <20210306230223.516566-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Cc: Oder Chiou <oder_chiou@realtek.com>, Hans de Goede <hdegoede@redhat.com>,
 alsa-devel@alsa-project.org, Bard Liao <bard.liao@intel.com>
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

sound/soc/codecs/rt5645.c is the only user of the rt5645_platform_data,
move its definition to sound/soc/codecs/rt5645.c and remove the now
empty include/sound/rt5645.h file.

Note since the DMI quirk mechanism uses pointers to the
rt5645_platform_data struct we can NOT simply add its members to
the rt5645_priv struct and completely remove the struct.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 include/sound/rt5645.h    | 32 --------------------------------
 sound/soc/codecs/rt5645.c | 23 ++++++++++++++++++++++-
 sound/soc/codecs/rt5645.h |  2 --
 3 files changed, 22 insertions(+), 35 deletions(-)
 delete mode 100644 include/sound/rt5645.h

diff --git a/include/sound/rt5645.h b/include/sound/rt5645.h
deleted file mode 100644
index 710c95be5509..000000000000
--- a/include/sound/rt5645.h
+++ /dev/null
@@ -1,32 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * linux/sound/rt5645.h -- Platform data for RT5645
- *
- * Copyright 2013 Realtek Microelectronics
- */
-
-#ifndef __LINUX_SND_RT5645_H
-#define __LINUX_SND_RT5645_H
-
-struct rt5645_platform_data {
-	/* IN2 can optionally be differential */
-	bool in2_diff;
-
-	unsigned int dmic1_data_pin;
-	/* 0 = IN2N; 1 = GPIO5; 2 = GPIO11 */
-	unsigned int dmic2_data_pin;
-	/* 0 = IN2P; 1 = GPIO6; 2 = GPIO10; 3 = GPIO12 */
-
-	unsigned int jd_mode;
-	/* Use level triggered irq */
-	bool level_trigger_irq;
-	/* Invert JD1_1 status polarity */
-	bool inv_jd1_1;
-	/* Invert HP detect status polarity */
-	bool inv_hp_pol;
-
-	/* Value to asign to snd_soc_card.long_name */
-	const char *long_name;
-};
-
-#endif
diff --git a/sound/soc/codecs/rt5645.c b/sound/soc/codecs/rt5645.c
index 63a7e052eaa0..06ea6fce427c 100644
--- a/sound/soc/codecs/rt5645.c
+++ b/sound/soc/codecs/rt5645.c
@@ -411,6 +411,27 @@ static const char *const rt5645_supply_names[] = {
 	"cpvdd",
 };
 
+struct rt5645_platform_data {
+	/* IN2 can optionally be differential */
+	bool in2_diff;
+
+	unsigned int dmic1_data_pin;
+	/* 0 = IN2N; 1 = GPIO5; 2 = GPIO11 */
+	unsigned int dmic2_data_pin;
+	/* 0 = IN2P; 1 = GPIO6; 2 = GPIO10; 3 = GPIO12 */
+
+	unsigned int jd_mode;
+	/* Use level triggered irq */
+	bool level_trigger_irq;
+	/* Invert JD1_1 status polarity */
+	bool inv_jd1_1;
+	/* Invert HP detect status polarity */
+	bool inv_hp_pol;
+
+	/* Value to assign to snd_soc_card.long_name */
+	const char *long_name;
+};
+
 struct rt5645_priv {
 	struct snd_soc_component *component;
 	struct rt5645_platform_data pdata;
@@ -3834,7 +3855,7 @@ static int rt5645_parse_dt(struct rt5645_priv *rt5645, struct device *dev)
 static int rt5645_i2c_probe(struct i2c_client *i2c,
 		    const struct i2c_device_id *id)
 {
-	struct rt5645_platform_data *pdata = dev_get_platdata(&i2c->dev);
+	struct rt5645_platform_data *pdata = NULL;
 	const struct dmi_system_id *dmi_data;
 	struct rt5645_priv *rt5645;
 	int ret, i;
diff --git a/sound/soc/codecs/rt5645.h b/sound/soc/codecs/rt5645.h
index e2d72ae17484..ac3de6f3bc2f 100644
--- a/sound/soc/codecs/rt5645.h
+++ b/sound/soc/codecs/rt5645.h
@@ -9,8 +9,6 @@
 #ifndef __RT5645_H__
 #define __RT5645_H__
 
-#include <sound/rt5645.h>
-
 /* Info */
 #define RT5645_RESET				0x00
 #define RT5645_VENDOR_ID			0xfd
-- 
2.30.1

