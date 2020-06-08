Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 695CF1F2108
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Jun 2020 22:48:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B4CCF166C;
	Mon,  8 Jun 2020 22:47:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B4CCF166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591649310;
	bh=1TFB3vGexPf/YjzFKVjO035+6mIM/cluNkxn0ae6yCQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p4DczQ9pnFAacPwfsKD3b1fIckB00oEcfgWv2kTVUAsLt9EipGpJAPfIOSLl86Lst
	 qA+d8y20kfcBJ4dDojGFMi+lBNKPZ6xOtLDxhJABiW+XExfxXx4H1H6BFJbuFdi20U
	 f3bNbnXnjSxFtJhbfX7Bht/+8ElsCQ6NsLs6kGPQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B9AC8F8021C;
	Mon,  8 Jun 2020 22:46:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 42423F8024A; Mon,  8 Jun 2020 22:46:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 42A05F801F7
 for <alsa-devel@alsa-project.org>; Mon,  8 Jun 2020 22:46:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42A05F801F7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="M+Beu92c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591649202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XQ6RX0j4jlVRBzLYjdtsZqtLxy9oKJOtOLqO9B6IaAg=;
 b=M+Beu92cNiF1gpxb0xV9JiMkKJLy31HKFXXO1fmGxfKbHEtUIV/sF9zh6Zbv7D3H9BBxYB
 8sDy+sfrjLJKLV/eAaCPqGSlJvp92MpRm5eSd0YauOG7kMWD9XOWCs/kW1JKXQjalXBEm+
 oTsqxFlYuxeS+49ZPBqgSZ3R6etyFI4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-148-3tcmhgOoMxOfZH44rfOJ5A-1; Mon, 08 Jun 2020 16:46:40 -0400
X-MC-Unique: 3tcmhgOoMxOfZH44rfOJ5A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 436F37BAC;
 Mon,  8 Jun 2020 20:46:39 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-114-122.ams2.redhat.com
 [10.36.114.122])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D82A979C40;
 Mon,  8 Jun 2020 20:46:37 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH 2/2] ASoC: rt5645: Add platform-data for Asus T101HA
Date: Mon,  8 Jun 2020 22:46:34 +0200
Message-Id: <20200608204634.93407-2-hdegoede@redhat.com>
In-Reply-To: <20200608204634.93407-1-hdegoede@redhat.com>
References: <20200608204634.93407-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
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

The Asus T101HA uses the default jack-detect mode 3, but instead of
using an analog microphone it is using a DMIC on dmic-data-pin 1,
like the Asus T100HA. Note unlike the T100HA its jack-detect is not
inverted.

Add a DMI quirk with the correct settings for this model.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/codecs/rt5645.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/sound/soc/codecs/rt5645.c b/sound/soc/codecs/rt5645.c
index 6ba1849a77b0..e2e1d5b03b38 100644
--- a/sound/soc/codecs/rt5645.c
+++ b/sound/soc/codecs/rt5645.c
@@ -3625,6 +3625,12 @@ static const struct rt5645_platform_data asus_t100ha_platform_data = {
 	.inv_jd1_1 = true,
 };
 
+static const struct rt5645_platform_data asus_t101ha_platform_data = {
+	.dmic1_data_pin = RT5645_DMIC_DATA_IN2N,
+	.dmic2_data_pin = RT5645_DMIC2_DISABLE,
+	.jd_mode = 3,
+};
+
 static const struct rt5645_platform_data lenovo_ideapad_miix_310_pdata = {
 	.jd_mode = 3,
 	.in2_diff = true,
@@ -3708,6 +3714,14 @@ static const struct dmi_system_id dmi_platform_data[] = {
 		},
 		.driver_data = (void *)&asus_t100ha_platform_data,
 	},
+	{
+		.ident = "ASUS T101HA",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "T101HA"),
+		},
+		.driver_data = (void *)&asus_t101ha_platform_data,
+	},
 	{
 		.ident = "MINIX Z83-4",
 		.matches = {
-- 
2.26.2

