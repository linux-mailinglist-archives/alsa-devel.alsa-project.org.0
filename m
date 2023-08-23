Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3111778531F
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Aug 2023 10:54:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E19282C;
	Wed, 23 Aug 2023 10:53:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E19282C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692780859;
	bh=Fo7t/TRmjbtCBZH+7mxmLse9ztXo1zhyKK8eiyfZ504=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=vTVlIOMfNq+DP7OHqo5+obfQVvwWpagb0GD4iXStSFDcrBB4GfaLH17eF+EozOcWy
	 ptLwGh3sX4XeuyIlYhdPwwNbf3OUAkfPY/+G6dcWXZIdk+/ucMSIXUUinkH/nEQiSh
	 yt2xdPd1T2cH1hauXyJy5FRdOkwHce432sPskQi4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 411ACF8023B; Wed, 23 Aug 2023 10:53:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A6248F800F5;
	Wed, 23 Aug 2023 10:53:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 97A88F80158; Wed, 23 Aug 2023 10:53:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1EBEBF80022
	for <alsa-devel@alsa-project.org>; Wed, 23 Aug 2023 10:53:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1EBEBF80022
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=Ye31TV5Z
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 37N8Qsbx001504;
	Wed, 23 Aug 2023 03:53:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=B
	OvG/l63pMB93HNJ7FxG0/rsRmy7caQWIZXiu6L/A+k=; b=Ye31TV5ZFAAWZKIOH
	bx+otxTSrb0sMKpsj2LPfKfvxIxhi5n+xVcNa9QdMO++FxHBjCvL84Ree2DT9J36
	VBfvESAabQ8Ry+HViFdKKTN/Vq+W6cnh7uORC1NTFrzxyv3K4gKRwZ4tLLNt3eEC
	6SmbKHsTBQrYyAQCiTwP297tyrM4dk50bPTF3I5MfE7BK7ISucbK5YTMFekRF1fg
	sXcVwwg2rpgPdx/xWzo6NkReDRA4IEtr+jqseIAFvsv40lCs7+LmQsbArnEYmklL
	aOMlcFSGQSvTO7js95Z+oH8pTiUAhi/f8VLpCCZusa4DVXgDRnNZa08XwUxCIdEp
	o3StA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3sn1y1gkpr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Aug 2023 03:53:10 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Wed, 23 Aug
 2023 09:53:08 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.30 via Frontend Transport; Wed, 23 Aug 2023 09:53:08 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 7A5222A9;
	Wed, 23 Aug 2023 08:53:08 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <david.rhodes@cirrus.com>, <vkarpovi@opensource.cirrus.com>,
        <lgirdwood@gmail.com>, <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>
Subject: [PATCH] ASoC: cs35l41: Correct amp_gain_tlv values
Date: Wed, 23 Aug 2023 09:53:08 +0100
Message-ID: <20230823085308.753572-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: dGnktznGnPxoqiLw4JkQ7ihvX90M9P_w
X-Proofpoint-ORIG-GUID: dGnktznGnPxoqiLw4JkQ7ihvX90M9P_w
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 63PX427JB5L4WB6BSPJESC46LBSN6HY7
X-Message-ID-Hash: 63PX427JB5L4WB6BSPJESC46LBSN6HY7
X-MailFrom: prvs=3599de430b=ckeepax@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/63PX427JB5L4WB6BSPJESC46LBSN6HY7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The current analog gain TLV seems to have completely incorrect values in
it. The gain starts at 0.5dB, proceeds in 1dB steps, and has no mute
value, correct the control to match.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l41.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs35l41.c b/sound/soc/codecs/cs35l41.c
index 6ac501f008eca..8a879b6f48290 100644
--- a/sound/soc/codecs/cs35l41.c
+++ b/sound/soc/codecs/cs35l41.c
@@ -168,7 +168,7 @@ static int cs35l41_get_fs_mon_config_index(int freq)
 static const DECLARE_TLV_DB_RANGE(dig_vol_tlv,
 		0, 0, TLV_DB_SCALE_ITEM(TLV_DB_GAIN_MUTE, 0, 1),
 		1, 913, TLV_DB_MINMAX_ITEM(-10200, 1200));
-static DECLARE_TLV_DB_SCALE(amp_gain_tlv, 0, 1, 1);
+static DECLARE_TLV_DB_SCALE(amp_gain_tlv, 50, 100, 0);
 
 static const struct snd_kcontrol_new dre_ctrl =
 	SOC_DAPM_SINGLE("Switch", CS35L41_PWR_CTRL3, 20, 1, 0);
-- 
2.30.2

