Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 891B8352B3C
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Apr 2021 16:09:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C6AF16C0;
	Fri,  2 Apr 2021 16:08:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C6AF16C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617372588;
	bh=/o6FCBsm6dLZctVAuB61ncDUNMEpNDgIl46VQEmdSdc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Yj9uEtO6jZ+sNIeDskIqpDodNlq3abtJGhIcO8v1sfN8cuYWYGKPDyZcJKXy1zNRw
	 spv4lbx7NVsU8HfVgLN80aRn7WZ0451tT8tn8MPPmNRyYpRgrgW2K2ZfaH3d35SezY
	 j+0IxmPiUdoCQrl+Nk+9Z/SnGZW19FO6dllGzGWc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B6A86F801DB;
	Fri,  2 Apr 2021 16:08:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F5DDF80254; Fri,  2 Apr 2021 16:08:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4FAA1F80166
 for <alsa-devel@alsa-project.org>; Fri,  2 Apr 2021 16:07:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4FAA1F80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="JV0TWJ26"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617372476;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+r6dprQaNFKXXZm9OtqxoiuVb+akwSVfbsMDg1EgoAg=;
 b=JV0TWJ26UcC5GZX+N8yQ05t8ZcubIk+KG0q8mmsxsPbHOB+y8RbKey50NQRWS8QQ8e5Uh3
 b2s7N+csPBAviGzMhVyGGOdzuH+9iKZX6Je52CdFOJIQyqJuICYkZu9ZNZh1nBOx4UuBRv
 KqPmqt4D+ONUbjiaQUxYmVFtSGsy3is=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-170-W1_l808jPP2kiEVdkg8GWA-1; Fri, 02 Apr 2021 10:07:54 -0400
X-MC-Unique: W1_l808jPP2kiEVdkg8GWA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 838BD1005D57;
 Fri,  2 Apr 2021 14:07:52 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-163.ams2.redhat.com
 [10.36.112.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CF15510023B2;
 Fri,  2 Apr 2021 14:07:50 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jie Yang <yang.jie@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
Subject: [PATCH 1/6] ASoC: Intel: Unify the thinkpad10 and aegex10 byt-match
 quirks
Date: Fri,  2 Apr 2021 16:07:42 +0200
Message-Id: <20210402140747.174716-2-hdegoede@redhat.com>
In-Reply-To: <20210402140747.174716-1-hdegoede@redhat.com>
References: <20210402140747.174716-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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

There is no reason to have separate quirk-handlers / byt_machine_id-s
for these.

These are both cases of BYT devices with a 10EC5640 ACPI HID while using
a rt5672 codec.

The Dell Venue 10 Pro 5055 is another example of such a device, instead
of adding a third byt_machine_id definition for this Dell model, make
change the 2 existing cases into a generic BYT_RT5672 byt_machine_id
in preparation for adding a quirk for the Dell Venue 10 Pro 5055.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../intel/common/soc-acpi-intel-byt-match.c   | 32 +++++++------------
 1 file changed, 12 insertions(+), 20 deletions(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-byt-match.c b/sound/soc/intel/common/soc-acpi-intel-byt-match.c
index d1febbb53b70..4596d128fff5 100644
--- a/sound/soc/intel/common/soc-acpi-intel-byt-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-byt-match.c
@@ -11,13 +11,12 @@
 
 static unsigned long byt_machine_id;
 
-#define BYT_THINKPAD_10  1
+#define BYT_RT5672       1
 #define BYT_POV_P1006W   2
-#define BYT_AEGEX_10     3
 
-static int byt_thinkpad10_quirk_cb(const struct dmi_system_id *id)
+static int byt_rt5672_quirk_cb(const struct dmi_system_id *id)
 {
-	byt_machine_id = BYT_THINKPAD_10;
+	byt_machine_id = BYT_RT5672;
 	return 1;
 }
 
@@ -27,36 +26,30 @@ static int byt_pov_p1006w_quirk_cb(const struct dmi_system_id *id)
 	return 1;
 }
 
-static int byt_aegex10_quirk_cb(const struct dmi_system_id *id)
-{
-	byt_machine_id = BYT_AEGEX_10;
-	return 1;
-}
-
 static const struct dmi_system_id byt_table[] = {
 	{
-		.callback = byt_thinkpad10_quirk_cb,
+		.callback = byt_rt5672_quirk_cb,
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
 			DMI_MATCH(DMI_PRODUCT_VERSION, "ThinkPad 8"),
 		},
 	},
 	{
-		.callback = byt_thinkpad10_quirk_cb,
+		.callback = byt_rt5672_quirk_cb,
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
 			DMI_MATCH(DMI_PRODUCT_VERSION, "ThinkPad 10"),
 		},
 	},
 	{
-		.callback = byt_thinkpad10_quirk_cb,
+		.callback = byt_rt5672_quirk_cb,
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
 			DMI_MATCH(DMI_PRODUCT_VERSION, "ThinkPad Tablet B"),
 		},
 	},
 	{
-		.callback = byt_thinkpad10_quirk_cb,
+		.callback = byt_rt5672_quirk_cb,
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
 			DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo Miix 2 10"),
@@ -75,7 +68,7 @@ static const struct dmi_system_id byt_table[] = {
 	},
 	{
 		/* Aegex 10 tablet (RU2) */
-		.callback = byt_aegex10_quirk_cb,
+		.callback = byt_rt5672_quirk_cb,
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "AEGEX"),
 			DMI_MATCH(DMI_PRODUCT_VERSION, "RU2"),
@@ -84,8 +77,8 @@ static const struct dmi_system_id byt_table[] = {
 	{ }
 };
 
-/* The Thinkapd 10 and Aegex 10 tablets have the same ID problem */
-static struct snd_soc_acpi_mach byt_thinkpad_10 = {
+/* Various devices use an ACPI id of 10EC5640 while using a rt5672 codec */
+static struct snd_soc_acpi_mach byt_rt5672 = {
 	.id = "10EC5640",
 	.drv_name = "cht-bsw-rt5672",
 	.fw_filename = "intel/fw_sst_0f28.bin",
@@ -110,9 +103,8 @@ static struct snd_soc_acpi_mach *byt_quirk(void *arg)
 	dmi_check_system(byt_table);
 
 	switch (byt_machine_id) {
-	case BYT_THINKPAD_10:
-	case BYT_AEGEX_10:
-		return &byt_thinkpad_10;
+	case BYT_RT5672:
+		return &byt_rt5672;
 	case BYT_POV_P1006W:
 		return &byt_pov_p1006w;
 	default:
-- 
2.30.2

