Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD06638DAB
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Nov 2022 16:49:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D65F5172E;
	Fri, 25 Nov 2022 16:48:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D65F5172E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669391384;
	bh=jhyI7Tti8iFccb1SBBidKLV74lIRKqerjW3LSv0ReWk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ES5gTeBG4N1xb7ecOwZUoc1WodgSDwfWWzgNO+gTXU68OpDVDfps3PTrr+SYo9aHV
	 HnuQwGsdvFJj9dkRv6tfzYwWjtXkqcMEYS0o2nmHT2Em0YOfqkwkv0a+rcKj5g/Gwl
	 MilV899itNfLfFG/uzJDNfn8unMpY2D2vht5AXI0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 532AFF804C2;
	Fri, 25 Nov 2022 16:48:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69FBAF804C2; Fri, 25 Nov 2022 16:48:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7BFF7F8014E
 for <alsa-devel@alsa-project.org>; Fri, 25 Nov 2022 16:48:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7BFF7F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="L4RulWX0"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2APAeIZH029176; Fri, 25 Nov 2022 09:48:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=uW/WpNmmC7tC7iQ8OZIjE3xzDFP6uUHt4byQTyCpPoI=;
 b=L4RulWX03DXmAp7H8eghaaI2AZB3dR3EX7n7j1iKIIgJ+5SzKChDqnlKCG/KWsNdJC06
 oXS/0dbjBdipymOkWPrs9OF58BxTo8AUsoZdR8T0FMudqUknYzYVgu91rqZz9QPYE/Yf
 oc1z1DjaNUxOlJNwo7r4vFB1+0kU/HsXrI3UrwqhDqkHzHLGIiC7cQP3hQVzz1OrNDIp
 /9/5VauuUbi/vFjDQndBIBqkj5CMIxLX3TxFNk2vKJhKPgv3NR3kQRLP6C+sDF4dJrKr
 ph/cNrTsZXz18isdhpW0Np4YGToS0vmf8Syl5akaDjNrG3Kr/FG92sGxRY4ZQwytEHxt KQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3kxvet7f2v-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Nov 2022 09:48:39 -0600
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.20; Fri, 25 Nov
 2022 09:48:37 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.20 via
 Frontend Transport; Fri, 25 Nov 2022 09:48:37 -0600
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id C4C4E2BA;
 Fri, 25 Nov 2022 15:48:37 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 2/2] ASoC: ops: Check bounds for second channel in
 snd_soc_put_volsw_sx()
Date: Fri, 25 Nov 2022 15:48:37 +0000
Message-ID: <20221125154837.1270501-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221125154837.1270501-1-ckeepax@opensource.cirrus.com>
References: <20221125154837.1270501-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: DoyPQfFDUzIbyFo8XgGVz_FFqTZV9Wj5
X-Proofpoint-GUID: DoyPQfFDUzIbyFo8XgGVz_FFqTZV9Wj5
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 guille.rodriguez@gmail.com, lgirdwood@gmail.com
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

From: Mark Brown <broonie@kernel.org>

The bounds checks in snd_soc_put_volsw_sx() are only being applied to the
first channel, meaning it is possible to write out of bounds values to the
second channel in stereo controls. Add appropriate checks.

Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Slight fixup was made over your original version to make the check of
val2 > max be without the min and mask applied.

Thanks,
Charles

 sound/soc/soc-ops.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index 47691119306fb..55b009d3c6815 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -464,10 +464,15 @@ int snd_soc_put_volsw_sx(struct snd_kcontrol *kcontrol,
 	ret = err;
 
 	if (snd_soc_volsw_is_stereo(mc)) {
-		unsigned int val2;
+		unsigned int val2 = ucontrol->value.integer.value[1];
+
+		if (mc->platform_max && val2 > mc->platform_max)
+			return -EINVAL;
+		if (val2 > max)
+			return -EINVAL;
 
 		val_mask = mask << rshift;
-		val2 = (ucontrol->value.integer.value[1] + min) & mask;
+		val2 = (val2 + min) & mask;
 		val2 = val2 << rshift;
 
 		err = snd_soc_component_update_bits(component, reg2, val_mask,
-- 
2.30.2

