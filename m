Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 67990557837
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Jun 2022 12:53:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D617B1DE6;
	Thu, 23 Jun 2022 12:52:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D617B1DE6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655981594;
	bh=qJPLICOKzNIHWhYyEC+YlaNIvQIabPVWMU1K/nAM88M=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f7qLeLN+lWb5dNeeSzLp0Mpoys3THR5ey6+5CHM+ut53F3rRpZIa9YGnyad3KELW0
	 V3nGCY6q1qEJbD1F64zZwcPhsQjKzDioaKQ8MBtnApb7VxCft/osREJv1sL1GyFjUf
	 CoT6g/55vLtbmw7Y0tK3RRf8DnkUOGNrM6ceMHrw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D121F8053A;
	Thu, 23 Jun 2022 12:51:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8426EF804C1; Thu, 23 Jun 2022 12:51:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8AD21F804CC
 for <alsa-devel@alsa-project.org>; Thu, 23 Jun 2022 12:51:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8AD21F804CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="CC4DhLjG"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25NAKUqG006859;
 Thu, 23 Jun 2022 05:51:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=gnR7w+xhQnUz2IzY+3pJ9LD3q/+bn9s6586/PYF46uI=;
 b=CC4DhLjGuG18pDR69UrqDTra0WyvNH/8GEQBU3698nQ9OcKhe0EnY6ek8+nTEd05BsCU
 8dGMiPVyxNr2H4FzwplJh2DC8qYWsFTVyra2Vp4KFAmtjdxPQYb9zINcq8+4EuDCZD/z
 zw4hAemyVRh/UqrMmwxfDd6EvETPQwfi9frUNivm7HK2HW6fKVCWMilp/wSK3pz8r3Ok
 8QF3MrlEjqC6KI/pKYQjlqSiiYLKE7P35b28tagHFPwxap/2tzTaoWwW6fEwA030N0GD
 Rwwhe2vZDvZlgy5yM3YLpBIfuiZDFC/bJoM5QcLYFzUBiRENcaQAeiihIFkzxnawyj7I wQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3gsc41f17q-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 23 Jun 2022 05:51:24 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 23 Jun
 2022 11:51:20 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Thu, 23 Jun 2022 11:51:20 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 53DA211D1;
 Thu, 23 Jun 2022 10:51:20 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 5/6] ASoC: madera: Fix event generation for rate controls
Date: Thu, 23 Jun 2022 11:51:19 +0100
Message-ID: <20220623105120.1981154-5-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220623105120.1981154-1-ckeepax@opensource.cirrus.com>
References: <20220623105120.1981154-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: VfJmx8Ne3oalbA4FandZ-5A4pL9HGWLL
X-Proofpoint-ORIG-GUID: VfJmx8Ne3oalbA4FandZ-5A4pL9HGWLL
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 lgirdwood@gmail.com, david.rhodes@cirrus.com, james.schulman@cirrus.com,
 linux-kernel@vger.kernel.org
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

madera_adsp_rate_put always returns zero regardless of if the control
value was updated. This results in missing notifications to user-space
of the control change. Update the handling to return 1 when the
value is changed.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/madera.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/madera.c b/sound/soc/codecs/madera.c
index 8095a87117cf8..b9f19fbd29114 100644
--- a/sound/soc/codecs/madera.c
+++ b/sound/soc/codecs/madera.c
@@ -899,7 +899,7 @@ static int madera_adsp_rate_put(struct snd_kcontrol *kcontrol,
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	const int adsp_num = e->shift_l;
 	const unsigned int item = ucontrol->value.enumerated.item[0];
-	int ret;
+	int ret = 0;
 
 	if (item >= e->items)
 		return -EINVAL;
@@ -916,10 +916,10 @@ static int madera_adsp_rate_put(struct snd_kcontrol *kcontrol,
 			 "Cannot change '%s' while in use by active audio paths\n",
 			 kcontrol->id.name);
 		ret = -EBUSY;
-	} else {
+	} else if (priv->adsp_rate_cache[adsp_num] != e->values[item]) {
 		/* Volatile register so defer until the codec is powered up */
 		priv->adsp_rate_cache[adsp_num] = e->values[item];
-		ret = 0;
+		ret = 1;
 	}
 
 	mutex_unlock(&priv->rate_lock);
-- 
2.30.2

