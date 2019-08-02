Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D6A7ECF6
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Aug 2019 08:56:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 38C5216D9;
	Fri,  2 Aug 2019 08:55:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 38C5216D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564728990;
	bh=KkRX/7L3WHh9tirYKQp+pwP950OoAL2iJ74uMGoDQhw=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Vxp7SViyB0t45KOvLJAwi3u2fXH9cjzGAR33k/CjowlM2Ocxayba5bqtrzoMQh3Nr
	 1pfIpT7yIAfX0Zs4SWil+ALkKqThGUVsbSiPa1HRxqCgnJgIdqESIgysitMmpxj9bh
	 8ppuR6+Pb9UoUYtZ/7f8c4u2n3iZu+pbx0JCjpeo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CB56BF805AF;
	Fri,  2 Aug 2019 08:52:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 41C76F8048F; Fri,  2 Aug 2019 05:04:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from ZXSHCAS2.zhaoxin.com (unknown [203.148.12.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 49195F80114
 for <alsa-devel@alsa-project.org>; Fri,  2 Aug 2019 05:04:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49195F80114
Received: from zxbjmbx3.zhaoxin.com (10.29.252.165) by ZXSHCAS2.zhaoxin.com
 (10.28.252.162) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1261.35; Fri, 2 Aug
 2019 11:04:09 +0800
Received: from zxbjmbx1.zhaoxin.com (10.29.252.163) by zxbjmbx3.zhaoxin.com
 (10.29.252.165) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1261.35; Fri, 2 Aug
 2019 11:04:08 +0800
Received: from zxbjmbx1.zhaoxin.com ([fe80::b41a:737:a784:b70d]) by
 zxbjmbx1.zhaoxin.com ([fe80::b41a:737:a784:b70d%16]) with mapi id
 15.01.1261.035; Fri, 2 Aug 2019 11:04:08 +0800
From: Tony W Wang-oc <TonyWWang-oc@zhaoxin.com>
To: "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
 "pierre-louis.bossart@linux.intel.com"
 <pierre-louis.bossart@linux.intel.com>, "yung-chuan.liao@linux.intel.com"
 <yung-chuan.liao@linux.intel.com>, "broonie@kernel.org" <broonie@kernel.org>, 
 "hui.wang@canonical.com" <hui.wang@canonical.com>, "hdegoede@redhat.com"
 <hdegoede@redhat.com>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Thread-Topic: [PATCH] ALSA: hda: Add support of Zhaoxin controller
Thread-Index: AdVI3pD9kHR9FMHOSZOhS2qnXMRigQ==
Date: Fri, 2 Aug 2019 03:04:08 +0000
Message-ID: <6a423679a72a4acb88233559fae0507b@zhaoxin.com>
Accept-Language: en-US, zh-CN
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.32.64.75]
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 02 Aug 2019 08:52:03 +0200
Cc: "Cooper Yan\(BJ-RD\)" <CooperYan@zhaoxin.com>,
 "Herry Yang\(BJ-RD\)" <HerryYang@zhaoxin.com>,
 David Wang <DavidWang@zhaoxin.com>,
 "Qiyuan Wang\(BJ-RD\)" <QiyuanWang@zhaoxin.com>
Subject: [alsa-devel] [PATCH] ALSA: hda: Add support of Zhaoxin controller
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

Add the new PCI ID 0x1d17 0x3288 Zhaoxin controller support

Signed-off-by: Tony W Wang-oc <TonyWWang-oc@zhaoxin.com>
---
 sound/pci/hda/hda_intel.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 324a4b2..d08da0e 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -266,6 +266,7 @@ enum {
 	AZX_DRIVER_CTX,
 	AZX_DRIVER_CTHDA,
 	AZX_DRIVER_CMEDIA,
+	AZX_DRIVER_ZHAOXIN,
 	AZX_DRIVER_GENERIC,
 	AZX_NUM_DRIVERS, /* keep this as last entry */
 };
@@ -379,6 +380,7 @@ static char *driver_short_names[] = {
 	[AZX_DRIVER_CTX] = "HDA Creative", 
 	[AZX_DRIVER_CTHDA] = "HDA Creative",
 	[AZX_DRIVER_CMEDIA] = "HDA C-Media",
+	[AZX_DRIVER_ZHAOXIN] = "HDA Zhaoxin",
 	[AZX_DRIVER_GENERIC] = "HD-Audio Generic",
 };
 
@@ -2589,6 +2591,8 @@ static const struct pci_device_id azx_ids[] = {
 	  .class = PCI_CLASS_MULTIMEDIA_HD_AUDIO << 8,
 	  .class_mask = 0xffffff,
 	  .driver_data = AZX_DRIVER_GENERIC | AZX_DCAPS_PRESET_ATI_HDMI },
+	/* Zhaoxin */
+	{ PCI_DEVICE(0x1d17, 0x3288), .driver_data = AZX_DRIVER_ZHAOXIN },
 	{ 0, }
 };
 MODULE_DEVICE_TABLE(pci, azx_ids);
-- 
2.7.4
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
