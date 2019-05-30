Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E18A315D7
	for <lists+alsa-devel@lfdr.de>; Fri, 31 May 2019 22:09:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C120B15E2;
	Fri, 31 May 2019 22:08:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C120B15E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559333386;
	bh=k2lhQb6iRCgT/t4/buLymaGo//ggIP8u38Z/amC82c4=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XR2cGpK5insr1VNfHKTBkOhgedgHGwxzKcB/CkCPIFR3wXU/3jzzrECQcfz6pMFR3
	 IK0XWKhkCvjkysS5jFAw2lfBDhgL4TubzKh2613LO9clTLUpeR5WzGXkqPXAJqcuBZ
	 D5Hr0TG7dAVT8UDTo4cTmUSD0UdRpZAmYd+oGB20=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E7EEF8972D;
	Fri, 31 May 2019 22:06:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 92421F8072E; Thu, 30 May 2019 20:53:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from sender-pp-o92.zoho.eu (sender-pp-o92.zoho.eu [185.20.209.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5A8ECF8072E
 for <alsa-devel@alsa-project.org>; Thu, 30 May 2019 20:52:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A8ECF8072E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=zohomail.eu header.i=kepszlok@zohomail.eu
 header.b="tIuc4oeH"
ARC-Seal: i=1; a=rsa-sha256; t=1559242366; cv=none; d=zohomail.eu; s=zohoarc; 
 b=F3XyQad91INVjaGukESkmsf0+OkzmbmGiUMEceQmWTGT1tKpwgETWHNgDSorL9AdVzvHF1i85iY6mFBobg/b6Od3WP1Yd9rg8FwDc+sz7YRzDGv/BEOKLcX4MDxsaEkZfhpbiSICxaHHAiLhHMtvtK0VtEXioN/vRe38VDyqrAo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu;
 s=zohoarc; t=1559242366;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To:ARC-Authentication-Results;
 bh=Gtjyr1E50y6LOEaIaWFdwzcSXMWWPVwYW29E1qtMVk0=; 
 b=I8E7k9SpchGNQx8I2zSoz8PTJ9tW70NanWpjG1WkyQmRfYb2P9APMi5Y2KSRvQFWGgG5LzajyXY9+UVk1ZnUPq6xm5xDjrsyZPDli+pLTXJ9wreEaE7EfzaYPnxCvntr/UrrQA6zdTG7lEuJPRb3JWqVNpvUN684PikxBDQIuEM=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
 dkim=pass  header.i=zohomail.eu;
 spf=pass  smtp.mailfrom=kepszlok@zohomail.eu;
 dmarc=pass header.from=<kepszlok@zohomail.eu>
 header.from=<kepszlok@zohomail.eu>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1559242366; 
 s=zoho; d=zohomail.eu; i=kepszlok@zohomail.eu;
 h=From:To:Cc:Message-ID:Subject:Date:MIME-Version:Content-Transfer-Encoding:Content-Type;
 l=3134; bh=Gtjyr1E50y6LOEaIaWFdwzcSXMWWPVwYW29E1qtMVk0=;
 b=tIuc4oeHw9xlncGi7RL7slrw7pueUwiexjq2nt8cjjUZgXIIFtS9+lKqvd83OWVQ
 MGmP/1EPMkhffQ9Cy7/g0w0UblYArw+R5uvk4pLgP5ZNt0S0XrIKLbMruz4objn0iUn
 et2d8xitt6x4T4nlJvu00JlLxY+SKU/zHJIrBT8w=
Received: from pop-os.lan (217-197-176-148.pool.digikabel.hu
 [217.197.176.148]) by mx.zoho.eu
 with SMTPS id 1559242365900538.2764194379557;
 Thu, 30 May 2019 20:52:45 +0200 (CEST)
From: =?UTF-8?q?Kov=C3=A1cs=20Tam=C3=A1s?= <kepszlok@zohomail.eu>
To: alsa-devel@alsa-project.org
Message-ID: <20190530185245.10872-1-kepszlok@zohomail.eu>
Date: Thu, 30 May 2019 20:52:45 +0200
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-ZohoMailClient: External
X-Mailman-Approved-At: Fri, 31 May 2019 22:06:35 +0200
Cc: tiwai@suse.de, broonie@kernel.org, pierre-louis.bossart@linux.intel.com
Subject: [alsa-devel] [PATCH V2] ASoC: Intel: Baytrail: add quirk for Aegex
	10 (RU2) tablet
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This tablet has an incorrect acpi identifier just like
Thinkpad10 tablet, which is why it is trying to load the RT5640 driver
instead of the RT5762 driver. The RT5640 driver, on the other hand, checks
the hardware ID, so no driver are loaded during boot. This fix resolves to
load the RT5672 driver on this tablet during boot. It also provides the
correct IO configuration, like the jack detect mode 3, for 1.8V pullup. I
would like to thank Pierre-Louis Bossart for helping with this patch.

---
 sound/soc/codecs/rt5670.c                     | 14 +-------------
 .../intel/common/soc-acpi-intel-byt-match.c   | 19 +------------------
 2 files changed, 2 insertions(+), 31 deletions(-)

diff --git a/sound/soc/codecs/rt5670.c b/sound/soc/codecs/rt5670.c
index 37cce0439568..9a037108b1ae 100644
--- a/sound/soc/codecs/rt5670.c
+++ b/sound/soc/codecs/rt5670.c
@@ -2882,18 +2882,6 @@ static const struct dmi_system_id dmi_platform_intel_quirks[] = {
 						 RT5670_DEV_GPIO |
 						 RT5670_JD_MODE3),
 	},
-	{
-		.callback = rt5670_quirk_cb,
-		.ident = "Aegex 10 tablet (RU2)",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "AEGEX"),
-			DMI_MATCH(DMI_PRODUCT_VERSION, "RU2"),
-		},
-		.driver_data = (unsigned long *)(RT5670_DMIC_EN |
-						 RT5670_DMIC2_INR |
-						 RT5670_DEV_GPIO |
-						 RT5670_JD_MODE3),
-	},
 	{}
 };
 
diff --git a/sound/soc/intel/common/soc-acpi-intel-byt-match.c b/sound/soc/intel/common/soc-acpi-intel-byt-match.c
index cfed58c23e0b..fe812a909db4 100644
--- a/sound/soc/intel/common/soc-acpi-intel-byt-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-byt-match.c
@@ -22,7 +22,6 @@ static unsigned long byt_machine_id;
 
 #define BYT_THINKPAD_10  1
 #define BYT_POV_P1006W   2
-#define BYT_AEGEX_10     3
 
 static int byt_thinkpad10_quirk_cb(const struct dmi_system_id *id)
 {
@@ -36,12 +35,6 @@ static int byt_pov_p1006w_quirk_cb(const struct dmi_system_id *id)
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
 		.callback = byt_thinkpad10_quirk_cb,
@@ -82,18 +75,9 @@ static const struct dmi_system_id byt_table[] = {
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "0E57"),
 		},
 	},
-	{
-		/* Aegex 10 tablet (RU2) */
-		.callback = byt_aegex10_quirk_cb,
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "AEGEX"),
-			DMI_MATCH(DMI_PRODUCT_VERSION, "RU2"),
-		},
-	},
 	{ }
 };
 
-/* The Thinkapd 10 and Aegex 10 tablets have the same ID problem */
 static struct snd_soc_acpi_mach byt_thinkpad_10 = {
 	.id = "10EC5640",
 	.drv_name = "cht-bsw-rt5672",
@@ -120,7 +104,6 @@ static struct snd_soc_acpi_mach *byt_quirk(void *arg)
 
 	switch (byt_machine_id) {
 	case BYT_THINKPAD_10:
-	case BYT_AEGEX_10:
 		return &byt_thinkpad_10;
 	case BYT_POV_P1006W:
 		return &byt_pov_p1006w;


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
