Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4DCA54B211
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jun 2022 15:11:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D4EC1695;
	Tue, 14 Jun 2022 15:10:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D4EC1695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655212293;
	bh=7FycEHfTzKBwgZpJkj/ag8+juwwjabNOKC8iC8BVIec=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZDKphmTB2scDrZwCUhJBRf4WWTDEefsot6FLA49dPcEdqf+3QIRkLWvUOwjBjI8Xr
	 X81lmm3NnXv1S42rkCmG5732NH7gmkMf29B1rq9JYFIR7sGD/dn2MnFOGp4ujgxfo/
	 CpxXdeG/VJRFagwOVWSXuwklTQPQagY2o05ivrY4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1BC5F800D8;
	Tue, 14 Jun 2022 15:10:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2224EF80139; Tue, 14 Jun 2022 15:10:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1AC00F800D8
 for <alsa-devel@alsa-project.org>; Tue, 14 Jun 2022 15:10:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1AC00F800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="OM+u0In+"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25E7D18Y023629;
 Tue, 14 Jun 2022 08:10:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=YcUpMK2AczftXCxzQom7s5cbS6jwX5ZCnN31VDB+YXM=;
 b=OM+u0In+DWSJNpSoAeCGjcBQM2oyBYb1RpCvka5UL+zWpyCSr2bdJLyrt3L5JY+Bbpom
 KDVh06+qEyKceN5O5pQfTnL97gd41swPIys5yjgfadGZLu7IKslMKXE07i0m0VmBAvE1
 Qj7sNOqmQERXv+/Krt61UQ2Fu8KWIDJI/Sp/GTfOptUKHfcAusC2txe/jqMpvM6Zb4rD
 KWueGH6k7p3087TFleh0VkOUNLKtAKkoXQNJiq4s5S3VdiJ4U5jNiyX4DGvtXL2MTKlB
 BaUQULHZK6lAiBsjbeR4/Ys36VOCb8meU5RIXVKHWEIMMkPZJTAyTPt0tZVwOShT5dC3 gw== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3gmqfq357n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 14 Jun 2022 08:10:24 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 14 Jun
 2022 14:10:22 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Tue, 14 Jun 2022 14:10:22 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id A1A09458;
 Tue, 14 Jun 2022 13:10:22 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH] ASoC: cs35l45: Add endianness flag in snd_soc_component_driver
Date: Tue, 14 Jun 2022 14:10:22 +0100
Message-ID: <20220614131022.778057-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: aitggsH-mFGMuIZWhiIx_LPwba7ZFrJ5
X-Proofpoint-GUID: aitggsH-mFGMuIZWhiIx_LPwba7ZFrJ5
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

The endianness flag is used on the CODEC side to specify an
ambivalence to endian, typically because it is lost over the hardware
link. This device receives audio over an I2S DAI and as such should
have endianness applied.

Fixes: 0d463d016000 ("ASoC: cs35l45: Add driver for Cirrus Logic CS35L45 Smart Amp")
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l45.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/cs35l45.c b/sound/soc/codecs/cs35l45.c
index c94edfce4b720..d15b3b77c7eb0 100644
--- a/sound/soc/codecs/cs35l45.c
+++ b/sound/soc/codecs/cs35l45.c
@@ -500,6 +500,8 @@ static const struct snd_soc_component_driver cs35l45_component = {
 	.num_controls = ARRAY_SIZE(cs35l45_controls),
 
 	.name = "cs35l45",
+
+	.endianness = 1,
 };
 
 static int __maybe_unused cs35l45_runtime_suspend(struct device *dev)
-- 
2.30.2

