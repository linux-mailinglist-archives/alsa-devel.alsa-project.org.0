Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BEBFC951ABC
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Aug 2024 14:21:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC5322BAB;
	Wed, 14 Aug 2024 14:21:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC5322BAB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723638106;
	bh=oc7pCqgTDJhaq2i36boZtpB4yaoA7PKtJV+APNsDq0s=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Xek+w/tqKnc2SgwPDIaJNiIC+Wq51THX5kVT0gfiy1eEdr+6EwK4eovwE66wZug50
	 aAgO0ja8cE5KOKWnC6imRzq/qDMvjtw1WdoFfOuoj+Vzh3rqPnXutkjOvXXH8WtmZg
	 mUIvSw9cR1unb3WlnOOT7YPtPMuvC6t3v5VktdbM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D4C16F805B0; Wed, 14 Aug 2024 14:21:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 446F7F805AD;
	Wed, 14 Aug 2024 14:21:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 003AFF80423; Wed, 14 Aug 2024 14:21:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 45333F8016E
	for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2024 14:20:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45333F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=PpQ1vpEy
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 47ECKrOt096773;
	Wed, 14 Aug 2024 07:20:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1723638053;
	bh=EqkHqqKAoc8Djpm1ZElzO9BtZimR5uXL+u0mCRMQBbU=;
	h=From:To:CC:Subject:Date;
	b=PpQ1vpEyIo586XmYMoCfXjUUPEYiiYtnvGO889Pf3vinjOp+boBKNGL1n+Ec55jnf
	 6kuWLF5y/RpCIc0wsEdkAIMYy8Fsd1x/NxnVEEumiR0dkXFAM65YwSkYE3Yb2aH/ML
	 SfXR8JYyibjUydB7RtbY2l5WuuzX4J9ETp+xfnhs=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 47ECKr29030477
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 14 Aug 2024 07:20:53 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 14
 Aug 2024 07:20:53 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 14 Aug 2024 07:20:53 -0500
Received: from LT5CG31242FY.dhcp.ti.com ([10.250.160.152])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 47ECKlf7049558;
	Wed, 14 Aug 2024 07:20:48 -0500
From: Shenghao Ding <shenghao-ding@ti.com>
To: <broonie@kernel.org>
CC: <andriy.shevchenko@linux.intel.com>, <lgirdwood@gmail.com>,
        <perex@perex.cz>, <pierre-louis.bossart@linux.intel.com>,
        <13564923607@139.com>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <liam.r.girdwood@intel.com>,
        <cameron.berkenpas@gmail.com>, <tiwai@suse.de>, <baojun.xu@ti.com>,
        <soyer@irl.hu>, <Baojun.Xu@fpt.com>, <robinchen@ti.com>,
        Shenghao Ding
	<shenghao-ding@ti.com>
Subject: [PATCH v1] ALSA: hda: tas2563: mark const variables as __maybe_unused
Date: Wed, 14 Aug 2024 20:20:42 +0800
Message-ID: <20240814122043.1731-1-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Message-ID-Hash: T43LQK254WQHRCANLRCAG6EIH7ZM3S4Y
X-Message-ID-Hash: T43LQK254WQHRCANLRCAG6EIH7ZM3S4Y
X-MailFrom: shenghao-ding@ti.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T43LQK254WQHRCANLRCAG6EIH7ZM3S4Y/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Baojun Xu <baojun.xu@ti.com>

An earlier patch changed the DECLARE_TLV_DB_SCALE declaration, but
now there are additional static const variables that cause
the same build warnings:

In file included from sound/pci/hda/tas2781_hda_i2c.c:23:
include/sound/tas2563-tlv.h:21:28: error: 'tas2563_dvc_table' defined but not used [-Werror=unused-const-variable=]
   21 | static const unsigned char tas2563_dvc_table[][4] = {
      |                            ^~~~~~~~~~~~~~~~~                                 ^~~~~~~~~~~~~~~

Mark it as unused as well.

Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>

---
v1:
---
 include/sound/tas2563-tlv.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/sound/tas2563-tlv.h b/include/sound/tas2563-tlv.h
index faa3e194f73b..bb269b21f460 100644
--- a/include/sound/tas2563-tlv.h
+++ b/include/sound/tas2563-tlv.h
@@ -18,7 +18,7 @@
 static const __maybe_unused DECLARE_TLV_DB_SCALE(tas2563_dvc_tlv, -12150, 50, 1);
 
 /* pow(10, db/20) * pow(2,30) */
-static const unsigned char tas2563_dvc_table[][4] = {
+static const __maybe_unused unsigned char tas2563_dvc_table[][4] = {
 	{ 0X00, 0X00, 0X00, 0X00 }, /* -121.5db */
 	{ 0X00, 0X00, 0X03, 0XBC }, /* -121.0db */
 	{ 0X00, 0X00, 0X03, 0XF5 }, /* -120.5db */
-- 
2.43.0

