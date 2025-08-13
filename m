Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C0BB25CC9
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Aug 2025 09:12:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3599B60275;
	Thu, 14 Aug 2025 09:12:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3599B60275
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1755155539;
	bh=ida2CXCr2fFRDvW1t1sPtcOWlT9NS9aCbl0kJ8wWOBg=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=LCfgYUmZTKzRvaxeMiBu9lQBCyueh3Z6F03d0f2HV9XrF1vUhnlCuHhxnPdY8FDk/
	 WzgO9X2StEwCljAq/jqB1Nf4hRZrsd9hgiOajqDnxNbDEAykV42SuIEvUlkn/jxK8G
	 m1YjYwXVgqlJH+x2y8GcxE3p1gLIhO5TyYJEbZPc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 476B0F8060E; Thu, 14 Aug 2025 09:11:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A124CF80610;
	Thu, 14 Aug 2025 09:11:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 06175F8021D; Wed, 13 Aug 2025 12:09:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A1440F8012A
	for <alsa-devel@alsa-project.org>; Wed, 13 Aug 2025 12:09:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1440F8012A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=oUHvL28J
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DA9Cxw1676987;
	Wed, 13 Aug 2025 05:09:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755079752;
	bh=qwJfbD6uTwKoAGtFS7NyqUcPD5IlHQBF9hptV0GBnZE=;
	h=From:To:CC:Subject:Date;
	b=oUHvL28J65CnxAE0NfzPqsqcT3YK9Q2gzo8RaIOH608g84ORnD1SGoa1CQDVb6bW7
	 ABTo6b8vFbfsxZ4f10eVK7JIzDZvbe/AAVhuzbrg7iOlybxPGTm0JUI+wckuWxfcX7
	 alQ1ErEXmsiX2MGKtkZ0xvgF9Sd2y0M5HeP7T3BE=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DA9C6q317487
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 13 Aug 2025 05:09:12 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 05:09:11 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 05:09:11 -0500
Received: from lelvem-mr05.itg.ti.com ([10.250.165.138])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DA97ZN1839683;
	Wed, 13 Aug 2025 05:09:08 -0500
From: Baojun Xu <baojun.xu@ti.com>
To: <tiwai@suse.de>
CC: <broonie@kernel.org>, <andriy.shevchenko@linux.intel.com>,
        <alsa-devel@alsa-project.org>, <shenghao-ding@ti.com>,
        <13916275206@139.com>, <linux-sound@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <baojun.xu@ti.com>
Subject: [PATCH v1] ALSA: hda/tas2781: Normalize the volume kcontrol name
Date: Wed, 13 Aug 2025 18:08:42 +0800
Message-ID: <20250813100842.12224-1-baojun.xu@ti.com>
X-Mailer: git-send-email 2.43.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-MailFrom: baojun.xu@ti.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: CB5HTTHOOTLGYHXMZCSEB4Y25IPWNQBF
X-Message-ID-Hash: CB5HTTHOOTLGYHXMZCSEB4Y25IPWNQBF
X-Mailman-Approved-At: Thu, 14 Aug 2025 07:11:27 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CB5HTTHOOTLGYHXMZCSEB4Y25IPWNQBF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Change the name of the kcontrol from "Gain" to "Volume".

Signed-off-by: Baojun Xu <baojun.xu@ti.com>
---
 sound/hda/codecs/side-codecs/tas2781_hda_i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c b/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
index 92aae19cfc8f..e4bc3bc756b0 100644
--- a/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
+++ b/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
@@ -256,7 +256,7 @@ static const struct snd_kcontrol_new tas2770_snd_controls[] = {
 };
 
 static const struct snd_kcontrol_new tas2781_snd_controls[] = {
-	ACARD_SINGLE_RANGE_EXT_TLV("Speaker Analog Gain", TAS2781_AMP_LEVEL,
+	ACARD_SINGLE_RANGE_EXT_TLV("Speaker Analog Volume", TAS2781_AMP_LEVEL,
 		1, 0, 20, 0, tas2781_amp_getvol,
 		tas2781_amp_putvol, amp_vol_tlv),
 	ACARD_SINGLE_BOOL_EXT("Speaker Force Firmware Load", 0,
-- 
2.43.0

