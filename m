Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D50841FE3D
	for <lists+alsa-devel@lfdr.de>; Sat,  2 Oct 2021 23:17:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C1B7167F;
	Sat,  2 Oct 2021 23:16:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C1B7167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633209463;
	bh=HKd06WKb+phTGsxu50B8UVQiI9QmsswkY6G5CHbKk4I=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Jms3nz6G38bWmfxSPikqfsyzsMVI9fhLvArE3OvKyKSH8Ihpf+jbdyH7RXuXVgtFK
	 DdbIpf61t6Zf3Z4n8X1AQ5ur2Uk0vVv+LGRum4rBI9Uxo2kUsOYncdBfp9U6KrzQ84
	 GEGUNLFr9ynxIq3BxKdPNTYqNUcNesOLMP3+j034=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25325F804EC;
	Sat,  2 Oct 2021 23:15:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BEC2BF804E2; Sat,  2 Oct 2021 23:15:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B9EA5F804D1
 for <alsa-devel@alsa-project.org>; Sat,  2 Oct 2021 23:15:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9EA5F804D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="EAuwM/uz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633209321;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8H4RGbc1PY/o5AbH/UlLmwvrMCppTL+3VeAA3V/3jzo=;
 b=EAuwM/uzmmRcESW+5So39+9ueghxcTNbdQGO6A63DpJUm1fcxKYOr6xzeEvztYbaDb3p3W
 c8ZT4MFUYc+N/S+JdGXqP5yvSp7PhWv9/X7WDpsBoWOa8ZX9gwDCq1aD3QOpIcJjSlB5vz
 5EPuEbrF3zfjM0IuircWGpUJX7Ll2+s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-553-TKpMGoBKO4GSTYjIIIs5Qg-1; Sat, 02 Oct 2021 17:15:20 -0400
X-MC-Unique: TKpMGoBKO4GSTYjIIIs5Qg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A6AD8362F8;
 Sat,  2 Oct 2021 21:15:19 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.192.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 524535C1CF;
 Sat,  2 Oct 2021 21:15:18 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jie Yang <yang.jie@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
Subject: [PATCH 3/4] ASoC: nau8824: Add a nau8824_components() helper
Date: Sat,  2 Oct 2021 23:14:58 +0200
Message-Id: <20211002211459.110124-3-hdegoede@redhat.com>
In-Reply-To: <20211002211459.110124-1-hdegoede@redhat.com>
References: <20211002211459.110124-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org
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

Some devices using the NAU8824 have only one speaker. To still have things
working properly this requires the left + right channels to both be mixed
to the left speaker output.

This mixer setup is done by userspace based on UCM profiles. But this
requires userspace to know that there is a mono-speaker. Add a helper
function (for the machine driver) to get a components string providing
this info.

This is done inside the codec driver because the codec driver already
has a DMI quirk table.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/codecs/nau8824.c | 32 +++++++++++++++++++++++++++++++-
 sound/soc/codecs/nau8824.h |  1 +
 2 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/nau8824.c b/sound/soc/codecs/nau8824.c
index f7018f2dd21f..d0dd1542f78a 100644
--- a/sound/soc/codecs/nau8824.c
+++ b/sound/soc/codecs/nau8824.c
@@ -29,6 +29,7 @@
 #include "nau8824.h"
 
 #define NAU8824_JD_ACTIVE_HIGH			BIT(0)
+#define NAU8824_MONO_SPEAKER			BIT(1)
 
 static int nau8824_quirk;
 static int quirk_override = -1;
@@ -1861,7 +1862,25 @@ static const struct dmi_system_id nau8824_quirk_table[] = {
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "Cherry Trail CR"),
 			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "20170531"),
 		},
-		.driver_data = (void *)(NAU8824_JD_ACTIVE_HIGH),
+		.driver_data = (void *)(NAU8824_JD_ACTIVE_HIGH |
+					NAU8824_MONO_SPEAKER),
+	},
+	{
+		/* CUBE iwork8 Air */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "cube"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "i1-TF"),
+			DMI_MATCH(DMI_BOARD_NAME, "Cherry Trail CR"),
+		},
+		.driver_data = (void *)(NAU8824_MONO_SPEAKER),
+	},
+	{
+		/* Pipo W2S */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "PIPO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "W2S"),
+		},
+		.driver_data = (void *)(NAU8824_MONO_SPEAKER),
 	},
 	{}
 };
@@ -1880,6 +1899,17 @@ static void nau8824_check_quirks(void)
 		nau8824_quirk = (unsigned long)dmi_id->driver_data;
 }
 
+const char *nau8824_components(void)
+{
+	nau8824_check_quirks();
+
+	if (nau8824_quirk & NAU8824_MONO_SPEAKER)
+		return "cfg-spk:1";
+	else
+		return "cfg-spk:2";
+}
+EXPORT_SYMBOL_GPL(nau8824_components);
+
 static int nau8824_i2c_probe(struct i2c_client *i2c,
 	const struct i2c_device_id *id)
 {
diff --git a/sound/soc/codecs/nau8824.h b/sound/soc/codecs/nau8824.h
index 6e61405f623b..de4bae8281d0 100644
--- a/sound/soc/codecs/nau8824.h
+++ b/sound/soc/codecs/nau8824.h
@@ -470,6 +470,7 @@ struct nau8824_osr_attr {
 
 int nau8824_enable_jack_detect(struct snd_soc_component *component,
 	struct snd_soc_jack *jack);
+const char *nau8824_components(void);
 
 #endif				/* _NAU8824_H */
 
-- 
2.31.1

