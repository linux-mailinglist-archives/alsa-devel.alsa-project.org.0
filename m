Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F9938FD7B
	for <lists+alsa-devel@lfdr.de>; Tue, 25 May 2021 11:10:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E979C16BD;
	Tue, 25 May 2021 11:10:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E979C16BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621933856;
	bh=dw+ughsl1RkRrxv74UoSUGnQatCfxP+Ny5VT+F3Mt38=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OcqzO6pc6z05G1kS6UXw0FZ2a3OXIrVQ0tA9rvIlZvH5Y80BM/DUZOZMGyFGDogva
	 Xqcopvr1xcVuRcRDhyM8UHfbnzGCwhoOerKHfU6NSLvW+I7QZKRjAWxuaZBHImACRX
	 2TfADLQfMP3fM6Fm89clS8Qr4qa5/sqgmI46fE/Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97F07F8049C;
	Tue, 25 May 2021 11:08:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2F75FF80274; Tue, 25 May 2021 11:08:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 16C7BF8011B
 for <alsa-devel@alsa-project.org>; Tue, 25 May 2021 11:08:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16C7BF8011B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="qqJI3L+Q"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14P97Uaa008722; Tue, 25 May 2021 04:08:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=d7UhS+W2FOwndxvIAkxfbMukXOAC9IY6MJrDQH8KHJg=;
 b=qqJI3L+QLRAkoDp3A06eki9kyouKaSqGQbuC2EvIbxE7AvBDIRZSGCz3i3KIYY69pmIz
 bGGF02gdYedb73zCF3K3QqvdIuArLTUwTdM7pH5Jw6tnABMVVuiCIZ8KBc3XrfIpSW2K
 MyLx46QK/386toNdP8kG5gIWSC84JJrCpwQKMevSGlJC7/YctRNBn8yvvC/nQfZTWJVh
 VSOwTMqSh4x+Nbxk6yvk34uVC228k2uh3lFv4L81CxF8RpfR5E7rQK0jtSEVmhdNsIjY
 Rck5jK5ZmETaWkug7b72/n72vvH8tyICpVOTnlNGAQ8b0llTx2Za9kP8hZisshYM7zr3 tw== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 38r28v1khv-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 25 May 2021 04:08:26 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 25 May
 2021 10:08:25 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Tue, 25 May 2021 10:08:25 +0100
Received: from aryzen.ad.cirrus.com (unknown [198.61.64.177])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id B044711D6;
 Tue, 25 May 2021 09:08:24 +0000 (UTC)
From: Lucas Tanure <tanureal@opensource.cirrus.com>
To: James Schulman <james.schulman@cirrus.com>, David Rhodes
 <david.rhodes@cirrus.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>
Subject: [PATCH 2/4] ASoC: cs42l42: Add support for 2304000 Bit clock
Date: Tue, 25 May 2021 10:08:20 +0100
Message-ID: <20210525090822.64577-2-tanureal@opensource.cirrus.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210525090822.64577-1-tanureal@opensource.cirrus.com>
References: <20210525090822.64577-1-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: P-lrBFySrlD0Nq47y6Oneh72fiFUVmsw
X-Proofpoint-GUID: P-lrBFySrlD0Nq47y6Oneh72fiFUVmsw
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 suspectscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 mlxscore=0
 lowpriorityscore=0 mlxlogscore=999 bulkscore=0 impostorscore=0
 adultscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105250061
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Lucas Tanure <tanureal@opensource.cirrus.com>
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

Add support for 24bits, 2 channels, 48k Sample rate bit clock

Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l42.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index 94788a55fa3b..07223b5fb2d6 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -598,6 +598,7 @@ struct cs42l42_pll_params {
  */
 static const struct cs42l42_pll_params pll_ratio_table[] = {
 	{ 1536000, 0, 1, 0x00, 0x7D, 0x000000, 0x03, 0x10, 12000000, 125, 2},
+	{ 2304000, 0, 1, 0x00, 0x55, 0xC00000, 0x02, 0x10, 12288000,  85, 2},
 	{ 2822400, 0, 1, 0x00, 0x40, 0x000000, 0x03, 0x10, 11289600, 128, 1},
 	{ 3000000, 0, 1, 0x00, 0x40, 0x000000, 0x03, 0x10, 12000000, 128, 1},
 	{ 3072000, 0, 1, 0x00, 0x3E, 0x800000, 0x03, 0x10, 12000000, 125, 1},
-- 
2.31.1

