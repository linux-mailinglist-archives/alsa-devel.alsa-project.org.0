Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 474AB2B7D7A
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Nov 2020 13:17:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB3181732;
	Wed, 18 Nov 2020 13:16:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB3181732
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605701833;
	bh=o//lXD6q8BAHfGcUIoWjMMjYn12c529u/EW5mfAWu0Q=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BIvq2Uu1NAkgFdU9CFqpv1K1JE6cICy2kPjZVrVzctfdsERgNoJycNzeRrg7j8cg3
	 q9NOez+e2xZ9zhFZOskYqmU4hXr9jqpr481nw8b+ShApRHV7DAj1ooI+LBBNDv37gr
	 5/skPDM29DCvo0MMr0Hdk1/78OssXBPdQKWTSebU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F3708F8016D;
	Wed, 18 Nov 2020 13:15:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A6207F8016C; Wed, 18 Nov 2020 13:15:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3C5B5F800EE
 for <alsa-devel@alsa-project.org>; Wed, 18 Nov 2020 13:15:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C5B5F800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="IQWF2lYU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605701722;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ZEpJ31Y71Yes0bbjE9kJwKRdmu2pKNp1yzGTmwT4DJk=;
 b=IQWF2lYUMrowGqlRamu2qaPK4HVNNc3j6V8IWMLepwe1YDCF/H7byHq9oTf1DE2a5mt0xI
 xPBVNf5YSok4jY9B8o0hHWOe0XWsYP23tRl3LGjff8Q3OHDwegJtDQo+7qWGrO3guL0ZI5
 2XLYTSyP4ktVcFruuqP74Xa7VWe+oKE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-3NXhoE7WNlC0SrAOoYO0RQ-1; Wed, 18 Nov 2020 07:15:20 -0500
X-MC-Unique: 3NXhoE7WNlC0SrAOoYO0RQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 67C388030C8;
 Wed, 18 Nov 2020 12:15:18 +0000 (UTC)
Received: from x1.localdomain (ovpn-114-94.ams2.redhat.com [10.36.114.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B8FED6EF49;
 Wed, 18 Nov 2020 12:15:16 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: Intel: bytcr_rt5640: Fix HP Pavilion x2 Detachable
 quirks
Date: Wed, 18 Nov 2020 13:15:15 +0100
Message-Id: <20201118121515.11441-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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

The HP Pavilion x2 Detachable line comes in many variants:

1. Bay Trail SoC + AXP288 PMIC, Micro-USB charging (10-k010nz, ...)
   DMI_SYS_VENDOR: "Hewlett-Packard"
   DMI_PRODUCT_NAME: "HP Pavilion x2 Detachable PC 10"
   DMI_BOARD_NAME: "8021"

2. Bay Trail SoC + AXP288 PMIC, Type-C charging (10-n000nd, 10-n010nl, ...)
   DMI_SYS_VENDOR: "Hewlett-Packard"
   DMI_PRODUCT_NAME: "HP Pavilion x2 Detachable"
   DMI_BOARD_NAME: "815D"

3. Cherry Trail SoC + AXP288 PMIC, Type-C charging (10-n101ng, ...)
   DMI_SYS_VENDOR: "HP"
   DMI_PRODUCT_NAME: "HP Pavilion x2 Detachable"
   DMI_BOARD_NAME: "813E"

4. Cherry Trail SoC + TI PMIC, Type-C charging (10-p002nd, 10-p018wm, ...)
   DMI_SYS_VENDOR: "HP"
   DMI_PRODUCT_NAME: "HP x2 Detachable 10-p0XX"
   DMI_BOARD_NAME: "827C"

5. Cherry Trail SoC + TI PMIC, Type-C charging (x2-210-g2, ...)
   DMI_SYS_VENDOR: "HP"
   DMI_PRODUCT_NAME: "HP x2 210 G2"
   DMI_BOARD_NAME: "82F4"

Variant 1 needs the exact same quirk as variant 2, so relax the DMI check
for the existing quirk a bit so that it matches both variant 1 and 2
(note the other variants will still not match).

Variant 2 already has an existing quirk (which now also matches variant 1)

Variant 3 uses a cx2072x codec, so is not applicable here.

Variant 4 almost works with the defaults, but it also needs a quirk to
fix jack-detection, add a new quirk for this.

Variant 5 does use a RT5640 codec (based on old dmesg output), but was
otherwise not tested, keep using the defaults for this variant.

BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1896924
Fixes: ec8e8418ff7d ("ASoC: Intel: bytcr_rt5640: Add quirks for various devices")
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/intel/boards/bytcr_rt5640.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index 9dadf6561444..f790514a147d 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -520,10 +520,10 @@ static const struct dmi_system_id byt_rt5640_quirk_table[] = {
 		.driver_data = (void *)(BYT_RT5640_IN1_MAP |
 					BYT_RT5640_MCLK_EN),
 	},
-	{	/* HP Pavilion x2 10-n000nd */
+	{	/* HP Pavilion x2 10-k0XX, 10-n0XX */
 		.matches = {
-			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Hewlett-Packard"),
-			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "HP Pavilion x2 Detachable"),
+			DMI_MATCH(DMI_SYS_VENDOR, "Hewlett-Packard"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "HP Pavilion x2 Detachable"),
 		},
 		.driver_data = (void *)(BYT_RT5640_DMIC1_MAP |
 					BYT_RT5640_JD_SRC_JD2_IN4N |
@@ -532,6 +532,17 @@ static const struct dmi_system_id byt_rt5640_quirk_table[] = {
 					BYT_RT5640_SSP0_AIF1 |
 					BYT_RT5640_MCLK_EN),
 	},
+	{	/* HP Pavilion x2 10-p0XX */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "HP"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "HP x2 Detachable 10-p0XX"),
+		},
+		.driver_data = (void *)(BYT_RT5640_DMIC1_MAP |
+					BYT_RT5640_JD_SRC_JD1_IN4P |
+					BYT_RT5640_OVCD_TH_1500UA |
+					BYT_RT5640_OVCD_SF_0P75 |
+					BYT_RT5640_MCLK_EN),
+	},
 	{	/* HP Stream 7 */
 		.matches = {
 			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Hewlett-Packard"),
-- 
2.28.0

