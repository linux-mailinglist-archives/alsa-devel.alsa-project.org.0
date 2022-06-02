Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7358C53BC63
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jun 2022 18:23:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 154741786;
	Thu,  2 Jun 2022 18:22:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 154741786
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654186982;
	bh=wjHD4XP+nxQeFFK/SkybLfCWmVHCTJIOlxd5rtRLehg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ss1UhySJMjLFJ4RqS5BHvY8aEqqCiBHeeFarNd0RihSZqiou+Hz7j8yJwHCa/h/+3
	 5KteLcIZmiuWFWPIObjIW0dWEWb2IBzosutqPD1qv1kbdW8Z/I8ryuwUjtM1L1Q92r
	 xfuGFWIoQaPEUOwKG9FxneUEqq8PBYNrc7JS5VqU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C8905F80149;
	Thu,  2 Jun 2022 18:21:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 718D9F80525; Thu,  2 Jun 2022 18:21:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 39EE0F80089
 for <alsa-devel@alsa-project.org>; Thu,  2 Jun 2022 18:21:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39EE0F80089
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="qQwQrL8x"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 252BrAOn027248;
 Thu, 2 Jun 2022 11:21:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=LLkRrjsu8/hYo9odlMpO0R406tjaPOUvBzHXbM0tbgM=;
 b=qQwQrL8x5R9LbcILhBgTnqXRyTkGnUPYDhJ1V27HcDJWOuJN1QAUu75PP/uY1bWGqXWv
 UoTaLQr0p7PTGKKEkEy3XwrmGTn3gzq9tN+5BOxRvGKG7LtTLI2vRScFc9GBU8B3c78Y
 qjiqGVhRfb3XTBh4Qsg293eVnSFUv7ZhPHodU+uIVWUGLu9+PF96yqKJianos5Yek6Zl
 3zzXbDwFXBk3/cNcq1hdA1kDLojty9PajIfX7oSMMANlsOj7Rjz3D7tn8ESEFFRzuHIR
 WeD6nfi+NucKxRykfrYuF365PcRvZLldKg98Tkvb8RgEd7XO2vanPHcLY8Ww6G8Kuxtt 9A== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3gbg5nnqyj-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 02 Jun 2022 11:21:21 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 2 Jun
 2022 17:21:19 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Thu, 2 Jun 2022 17:21:19 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 2D1C62A1;
 Thu,  2 Jun 2022 16:21:19 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 2/6] ASoC: cs35l36: Update digital volume TLV
Date: Thu, 2 Jun 2022 17:21:15 +0100
Message-ID: <20220602162119.3393857-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220602162119.3393857-1-ckeepax@opensource.cirrus.com>
References: <20220602162119.3393857-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 0OPw23O0cNPlvGHZ86tdDgnaLidcIRfq
X-Proofpoint-GUID: 0OPw23O0cNPlvGHZ86tdDgnaLidcIRfq
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

The digital volume TLV specifies the step as 0.25dB but the actual step
of the control is 0.125dB. Update the TLV to correct this.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l36.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs35l36.c b/sound/soc/codecs/cs35l36.c
index 920190daa4d1b..dfe85dc2cd20f 100644
--- a/sound/soc/codecs/cs35l36.c
+++ b/sound/soc/codecs/cs35l36.c
@@ -444,7 +444,8 @@ static bool cs35l36_volatile_reg(struct device *dev, unsigned int reg)
 	}
 }
 
-static DECLARE_TLV_DB_SCALE(dig_vol_tlv, -10200, 25, 0);
+static const DECLARE_TLV_DB_RANGE(dig_vol_tlv, 0, 912,
+				  TLV_DB_MINMAX_ITEM(-10200, 1200));
 static DECLARE_TLV_DB_SCALE(amp_gain_tlv, 0, 1, 1);
 
 static const char * const cs35l36_pcm_sftramp_text[] =  {
-- 
2.30.2

