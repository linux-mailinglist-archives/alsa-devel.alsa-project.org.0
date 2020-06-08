Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C79861F210A
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Jun 2020 22:49:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C8031676;
	Mon,  8 Jun 2020 22:48:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C8031676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591649358;
	bh=L44KBQe3qwhbWMgY3OeIJseT76zPOxy+QbZoM+xDW6o=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ilAb7JHrOljfYBKyvQGQFf4Ojb/UMpLO3MXZYO0vhWnVOadsIzTzlTdrvJsw/kqJG
	 CVC5+9uWtoQKUZKgJi4WoZDTPmEivd1psV3KedFfOr8NWIx3ua8w6zuRCtGv3n+6Ud
	 m2kPbCLPQlbR52sd5jtRbyL4rmJXWcTvgGwz5XYE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 10F98F8028A;
	Mon,  8 Jun 2020 22:46:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4DB5FF80124; Mon,  8 Jun 2020 22:46:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3EEF6F80124
 for <alsa-devel@alsa-project.org>; Mon,  8 Jun 2020 22:46:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3EEF6F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="R1PWUq+9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591649202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=KihLF+6DVboKXdRUDmSeWNrprJYHf2rp8NZE8Sos/zU=;
 b=R1PWUq+915fMSNsWGWQsf1uAtactT8EB7q8wyeHYfsg4OUjDdb2UyWx+ejqbf1kgNen6k5
 maupnv7CSzpaKwpn9EgtggRcardP6plyqfUKCVUmKaGpEkq7/5oVmO7zU0Wy2V4bKbOWbP
 rH/eaNOx1Ua1YhaBpIISH2bR+W82ZUA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-10-pwcCImRiMky3XeSx3xoFFw-1; Mon, 08 Jun 2020 16:46:39 -0400
X-MC-Unique: pwcCImRiMky3XeSx3xoFFw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 91CCE835B42;
 Mon,  8 Jun 2020 20:46:37 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-114-122.ams2.redhat.com
 [10.36.114.122])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9354D79C40;
 Mon,  8 Jun 2020 20:46:35 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH 1/2] ASoC: Intel: bytcr_rt5640: Add quirk for Toshiba Encore
 WT10-A tablet
Date: Mon,  8 Jun 2020 22:46:33 +0200
Message-Id: <20200608204634.93407-1-hdegoede@redhat.com>
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

The Toshiba Encore WT10-A tablet almost fully works with the default
settings for Bay Trail CR devices. The only issue is that it uses a
digital mic. connected the the DMIC1 input instead of an analog mic.

Add a quirk for this model using the default settings with the input-map
replaced with BYT_RT5640_DMIC1_MAP.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/intel/boards/bytcr_rt5640.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index fbfd53874b47..5c1a5e2aff6f 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -754,6 +754,18 @@ static const struct dmi_system_id byt_rt5640_quirk_table[] = {
 					BYT_RT5640_JD_NOT_INV |
 					BYT_RT5640_MCLK_EN),
 	},
+	{	/* Toshiba Encore WT10-A */
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "TOSHIBA"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "TOSHIBA WT10-A-103"),
+		},
+		.driver_data = (void *)(BYT_RT5640_DMIC1_MAP |
+					BYT_RT5640_JD_SRC_JD1_IN4P |
+					BYT_RT5640_OVCD_TH_2000UA |
+					BYT_RT5640_OVCD_SF_0P75 |
+					BYT_RT5640_SSP0_AIF2 |
+					BYT_RT5640_MCLK_EN),
+	},
 	{	/* Catch-all for generic Insyde tablets, must be last */
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Insyde"),
-- 
2.26.2

