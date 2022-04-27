Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F969511BAB
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Apr 2022 17:11:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B1CA16CA;
	Wed, 27 Apr 2022 17:10:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B1CA16CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651072291;
	bh=fTfmH5eYao07qEVNThdiAsEvRAC7ymWqbh6POrK7Ccg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sdXlCPQrtzGRWCj+qQaaYG2anG+X8EeUnYO8ptNQuejshrVxCOUyNNdaQfy9egJbl
	 pS9GZGLAU9fZptjvcTLGPk6nlScAkAvkzwTsdiREYuoR62XKVnq+qrX6yExyDBw60U
	 IhSp8hShjF8s1ZuKDrQv7FkTGb9qhWMul28cO+Aw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 39A1FF80553;
	Wed, 27 Apr 2022 17:08:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ECE93F80542; Wed, 27 Apr 2022 17:07:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 706FEF80152
 for <alsa-devel@alsa-project.org>; Wed, 27 Apr 2022 17:07:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 706FEF80152
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="d1N/G6Aj"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23R6M8vo014103;
 Wed, 27 Apr 2022 10:07:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=rC1I/YxoZvpUioOZX42tJOCa5yR61WbSa3yvtsC5Zdw=;
 b=d1N/G6AjNnIRThXsbxyZL1lav5XGbbiOn9e3b4AqECLkWKRhPY6HWgR3NnzhLhuZqFCl
 rUmm+pK8CJTTucPvkp5qDboBfmeKqTaRsSuNiyEcsVhay8mxl4PI4PX3/S/J2sshGy+Y
 Dg3NZv5Waq06RYSB8tgeX6sS8ssEw09WgWPxCBPR73PGFfi64A0wuyrdpH7NMdurVBsD
 bgcTMeZc1MBtCAnfhKhEPWswq0achlpTsnAAXQt1sNxEE9OjdXMty9/RDxCyFQ3pcsHf
 2VPCDXea4udQxNehTp8esRkrcpM43q6Wew8lheSIh8qvhfECgD9RAnZbYe23yUR1wzWs UQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3fprt60xth-8
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 27 Apr 2022 10:07:36 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 27 Apr
 2022 16:07:30 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Wed, 27 Apr 2022 16:07:30 +0100
Received: from vitaly-Legion-7-16ACHg6.ad.cirrus.com (unknown [198.90.238.170])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 6565446C;
 Wed, 27 Apr 2022 15:07:30 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Mark
 Brown <broonie@kernel.org>
Subject: [PATCH 19/26] ALSA: cs35l41: Do not print error when waking from
 hibernation
Date: Wed, 27 Apr 2022 16:07:13 +0100
Message-ID: <20220427150720.9194-20-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220427150720.9194-1-vitalyr@opensource.cirrus.com>
References: <20220427150720.9194-1-vitalyr@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: spaYy79zCg5QNdFGXUjmWboqJAd8xoK3
X-Proofpoint-ORIG-GUID: spaYy79zCg5QNdFGXUjmWboqJAd8xoK3
X-Proofpoint-Spam-Reason: safe
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

When waking from hibernation, it is possible for the function
which sends the wake command to fail initially, but after a
retry it will succeed. There is no need to print an error if
the initial attempts fail.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l41-lib.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs35l41-lib.c b/sound/soc/codecs/cs35l41-lib.c
index dc4654f43157..8a796dbe0718 100644
--- a/sound/soc/codecs/cs35l41-lib.c
+++ b/sound/soc/codecs/cs35l41-lib.c
@@ -1300,7 +1300,8 @@ int cs35l41_set_cspl_mbox_cmd(struct device *dev, struct regmap *regmap,
 			return 0;
 	}
 
-	dev_err(dev, "Failed to set mailbox cmd %u (status %u)\n", cmd, sts);
+	if (cmd != CSPL_MBOX_CMD_OUT_OF_HIBERNATE)
+		dev_err(dev, "Failed to set mailbox cmd %u (status %u)\n", cmd, sts);
 
 	return -ENOMSG;
 }
-- 
2.32.0

