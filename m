Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D74A3DBC59
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Jul 2021 17:30:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 186E8210E;
	Fri, 30 Jul 2021 17:30:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 186E8210E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627659053;
	bh=dPyeS64dHbEeOcT1TF++Q7vl9x+qwc3KMBRZHPmKUUU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FAdGZOrvYlcmJVGMrzoz+doIMml/ZI7gj+Gh2/iN9JQ3Jwxs2YZR0WOqwsOe/PUNP
	 jnZTwKpTzxG2WYEye7gGkgMOv9TsSj6GfC1GwLcgi47cOzR4YVQa9KzI8r9JN7KZZ4
	 dT3dzRWmOTTg4K4HWKiSuKLMOli8CkNsnrnwucZA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9084F804FE;
	Fri, 30 Jul 2021 17:20:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 08E30F80589; Fri, 30 Jul 2021 17:20:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 24DC6F804FC
 for <alsa-devel@alsa-project.org>; Fri, 30 Jul 2021 17:19:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24DC6F804FC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="O1X8JGrb"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 16UEL0dm003614; 
 Fri, 30 Jul 2021 10:19:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=iJGWgZ1yqdx9RaXMcDbcc/ICPIOOJeAeaCEft2wV0Mw=;
 b=O1X8JGrbQvENNfw5V95C9oSmtziIMAmtmh+cvwyZjGMblhtzuSnQxNUiqtGUnEuU7eqP
 KZk6MSPsTPDQHT7C13t8fqN+Q/fuvvZGkSyPcIPEop+qP5zz41Iz4Pt5aIrCE09MK8v7
 hoth5XRJ/iv/3VKDA+v6LCOK+tEPc3p2tFOUk5ZAXXjp//RtGbJubAM+BootjCidf0Tj
 n54yeztOKFvzB+bUkGGOhfUWpFpU6u9l3gXK3HY3+ZblYJvLbT1yJv3YkOsUFU9p/I7z
 ySy33c8JXOtrVlsvVyPH7krOehvkciN3gN7ArShzNZe9ep1UfSf9mUPXdq1Cltk3doya 7Q== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 3a41wd181n-13
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 30 Jul 2021 10:19:23 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Fri, 30 Jul
 2021 16:19:12 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Fri, 30 Jul 2021 16:19:12 +0100
Received: from vitaly-Inspiron-5415.ad.cirrus.com (unknown [198.90.238.32])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 7E43146E;
 Fri, 30 Jul 2021 15:19:12 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v3 24/27] ALSA: hda/cs8409: Use timeout rather than retries
 for I2C transaction waits
Date: Fri, 30 Jul 2021 16:18:41 +0100
Message-ID: <20210730151844.7873-25-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210730151844.7873-1-vitalyr@opensource.cirrus.com>
References: <20210730151844.7873-1-vitalyr@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: g2E6px2xx8VCJX5M10O9Jj-EMNcz6Bri
X-Proofpoint-ORIG-GUID: g2E6px2xx8VCJX5M10O9Jj-EMNcz6Bri
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 impostorscore=0
 spamscore=0 clxscore=1015 mlxscore=0 mlxlogscore=999 lowpriorityscore=0
 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2107300102
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Stefan Binding <sbinding@opensource.cirrus.com>
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

From: Stefan Binding <sbinding@opensource.cirrus.com>

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
---

Changes in v2:
- No changes

Changes in v3:
- No changes

 sound/pci/hda/patch_cs8409.c | 16 +++-------------
 sound/pci/hda/patch_cs8409.h |  2 ++
 2 files changed, 5 insertions(+), 13 deletions(-)

diff --git a/sound/pci/hda/patch_cs8409.c b/sound/pci/hda/patch_cs8409.c
index 08e991a33344..b53653ef73cb 100644
--- a/sound/pci/hda/patch_cs8409.c
+++ b/sound/pci/hda/patch_cs8409.c
@@ -127,24 +127,14 @@ static void cs8409_enable_i2c_clock(struct hda_codec *codec)
  * @codec: the codec instance
  *
  * Wait for I2C transaction to complete.
- * Return -1 if transaction wait times out.
+ * Return -ETIMEDOUT if transaction wait times out.
  */
 static int cs8409_i2c_wait_complete(struct hda_codec *codec)
 {
-	int repeat = 5;
 	unsigned int retval;
 
-	do {
-		retval = cs8409_vendor_coef_get(codec, CS8409_I2C_STS);
-		if ((retval & 0x18) != 0x18) {
-			usleep_range(2000, 4000);
-			--repeat;
-		} else
-			return 0;
-
-	} while (repeat);
-
-	return -1;
+	return read_poll_timeout(cs8409_vendor_coef_get, retval, retval & 0x18,
+		CS42L42_I2C_SLEEP_US, CS42L42_I2C_TIMEOUT_US, false, codec, CS8409_I2C_STS);
 }
 
 /**
diff --git a/sound/pci/hda/patch_cs8409.h b/sound/pci/hda/patch_cs8409.h
index 2208be2ffad1..71dbbd8e2f3b 100644
--- a/sound/pci/hda/patch_cs8409.h
+++ b/sound/pci/hda/patch_cs8409.h
@@ -231,6 +231,8 @@ enum cs8409_coefficient_index_registers {
 #define CS42L42_HSTYPE_MASK			(0x03)
 #define CS42L42_JACK_INSERTED			(0x0C)
 #define CS42L42_JACK_REMOVED			(0x00)
+#define CS42L42_I2C_TIMEOUT_US			(20000)
+#define CS42L42_I2C_SLEEP_US			(2000)
 
 /* Dell BULLSEYE / WARLOCK / CYBORG Specific Definitions */
 
-- 
2.25.1

