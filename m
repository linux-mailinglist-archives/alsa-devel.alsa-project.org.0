Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6447655E5B4
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jun 2022 17:35:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C08AF857;
	Tue, 28 Jun 2022 17:34:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C08AF857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656430520;
	bh=z4BMrQIfeR5ED7IepoWbXrI8waTsgS4gFgrQN1N+yu4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RicS7pHU8hKdF0dsp9YCnHCkpGqHPU/fmaaovCO+VctexkS7W4ebxPcGQX0+9Z8EH
	 Gcne4TC0WukgF8X940F4jcZd7PpkN9fI8SH9rf/WMWpAoaiqEtTbfEjoU7PUHxUtrJ
	 BUb56J5ZympgEW3TdhVoMK8ZXcayu3Qo9sgJyDhA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 22CFEF80115;
	Tue, 28 Jun 2022 17:34:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2E10CF8028B; Tue, 28 Jun 2022 17:34:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9974CF80115
 for <alsa-devel@alsa-project.org>; Tue, 28 Jun 2022 17:34:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9974CF80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="UJqV8ldO"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25SAsNkX030341;
 Tue, 28 Jun 2022 10:34:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=qyhaVfHovcvNFUdPfDSz8auM/k6b9qsac5a7Z/E95V4=;
 b=UJqV8ldOTGgfeQEjFYWJ47AqgEe9XvT33xyITVNJSRFRa4C90Ys1AGdMG0thCDuacLRo
 h+BcUhP6rv6/zhNS6hFqZSinFFUDDWNY665PtwBUam505dgSufanKawtUfZ3yy61k/3A
 mZNHS/C0AIjjNaHSMB0afmjcgf2yunMy+PPq4/ykY+0CR/08jLvELDpWJcfaySaJbj+Q
 D1EY0UF1nXk/ANbSk9t4j/XriHJvTr49fBLUMv3Ur6EByM4ywaOZr/rq6KH57Pfk3ev2
 MTO49/olZpCpJ9LP6wguenitfcD32AwBaYSokVuSJ6pHqYs11KW+CAvqxf+Kwa8VXfNc aQ== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3gwxsq437w-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 28 Jun 2022 10:34:11 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 28 Jun
 2022 16:34:09 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Tue, 28 Jun 2022 16:34:09 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 4F36A11D1;
 Tue, 28 Jun 2022 15:34:09 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 3/4] ASoC: cs47l92: Fix event generation for OUT1 demux
Date: Tue, 28 Jun 2022 16:34:08 +0100
Message-ID: <20220628153409.3266932-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220628153409.3266932-1-ckeepax@opensource.cirrus.com>
References: <20220628153409.3266932-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: BDhhhikloElbRkz4LhSBnEMk8uGmNTpk
X-Proofpoint-ORIG-GUID: BDhhhikloElbRkz4LhSBnEMk8uGmNTpk
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org
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

cs47l92_put_demux returns the value of snd_soc_dapm_mux_update_power,
which returns a 1 if a path was found for the kcontrol. This is
obviously different to the expected return a 1 if the control
was updated value. This results in spurious notifications to
user-space. Update the handling to only return a 1 when the value is
changed.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/cs47l92.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs47l92.c b/sound/soc/codecs/cs47l92.c
index a1b8dcdb9f7b7..444026b7d54b3 100644
--- a/sound/soc/codecs/cs47l92.c
+++ b/sound/soc/codecs/cs47l92.c
@@ -119,7 +119,13 @@ static int cs47l92_put_demux(struct snd_kcontrol *kcontrol,
 end:
 	snd_soc_dapm_mutex_unlock(dapm);
 
-	return snd_soc_dapm_mux_update_power(dapm, kcontrol, mux, e, NULL);
+	ret = snd_soc_dapm_mux_update_power(dapm, kcontrol, mux, e, NULL);
+	if (ret < 0) {
+		dev_err(madera->dev, "Failed to update demux power state: %d\n", ret);
+		return ret;
+	}
+
+	return change;
 }
 
 static SOC_ENUM_SINGLE_DECL(cs47l92_outdemux_enum,
-- 
2.30.2

