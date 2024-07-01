Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0FE91DCF7
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2024 12:46:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E4C2233F;
	Mon,  1 Jul 2024 12:45:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E4C2233F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719830765;
	bh=ppEZyCTx1x2jsfAV7x0LVq3kr0YNd/emoX6Wqo/kXEA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VClks9ficWeu0533O6tiudsadMDWifxjRxjlrRqnSAVr2Nc4VR6AO0fyJK83iO9K/
	 IGSEBaCV0ThrYywpwPvwohnypMTLNoqnczJdnVs1dZP+5H6is4nc8HNxi0mn3T8txz
	 mFPLRZ1491kPhxadc1Xys1vFPIOfXd4dk0TQacJ4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6AF4FF8013D; Mon,  1 Jul 2024 12:45:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D03EDF805F9;
	Mon,  1 Jul 2024 12:45:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A7445F805EA; Mon,  1 Jul 2024 12:45:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 296C2F8013D
	for <alsa-devel@alsa-project.org>; Mon,  1 Jul 2024 12:44:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 296C2F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=XnjaO90D
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 4617Qrbw017780;
	Mon, 1 Jul 2024 05:44:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=C+UjOWKJZYKMEfALDrZ+CB3Ep15T+UKAiEh3PiEiuPE=; b=
	XnjaO90DzsozqsnbdHdj2veq7GbDsxn4wl8zFHf87kAXTd4dqTuVv2W2UW5fiLNY
	52LnxgCKIZH4OgYDef/uJD8RhHZJKyJvihuMy0Ea/JO9T/ktxDAgkmPc0sNdjS+6
	qwK2O1J2Q125r0daOw2cT9UnkrJ5OzGk45ydI9DacFc4jtgw8StUpO81MRd3CRf+
	Lcdmeww/odxH358wrTjfGLQJCFNLa4XswhyKGbt87qarZoWmvhNWwOs2j95hovYu
	eJn2Yxu2MLkhBzjwp+tgBWflRnFyhWW5GKflN3qrR/zr9J16TRVAdItgKngkZlpq
	cCDoZ0JKazzDg9wBQXPdpg==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 402fnxa3x0-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Jul 2024 05:44:47 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 1 Jul 2024
 11:44:44 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Mon, 1 Jul 2024 11:44:44 +0100
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com
 [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id B0ADA820258;
	Mon,  1 Jul 2024 10:44:44 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>
Subject: [PATCH 3/3] ASoC: cs35l56: Remove redundant clearing of
 clk_stop_mode1
Date: Mon, 1 Jul 2024 11:44:44 +0100
Message-ID: <20240701104444.172556-4-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240701104444.172556-1-rf@opensource.cirrus.com>
References: <20240701104444.172556-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: OMfk5AMUV-k6fHEnPsjv3Rw03SaLFLGM
X-Proofpoint-ORIG-GUID: OMfk5AMUV-k6fHEnPsjv3Rw03SaLFLGM
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: XUAZKRMBACNVATJ4QYUNOHUIQNDOX6K2
X-Message-ID-Hash: XUAZKRMBACNVATJ4QYUNOHUIQNDOX6K2
X-MailFrom: prvs=4912873e61=rf@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XUAZKRMBACNVATJ4QYUNOHUIQNDOX6K2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

struct sdw_slave_prop is zero-initialized by the SoundWire core so there
is no need to clear clk_stop_mode1 to false. Removing this also avoids
having an unnecessary build dependency on a struct member.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l56-sdw.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/cs35l56-sdw.c b/sound/soc/codecs/cs35l56-sdw.c
index 8862107105ae..fc03bb7ecae1 100644
--- a/sound/soc/codecs/cs35l56-sdw.c
+++ b/sound/soc/codecs/cs35l56-sdw.c
@@ -271,7 +271,6 @@ static int cs35l56_sdw_read_prop(struct sdw_slave *peripheral)
 	prop->source_ports = BIT(CS35L56_SDW1_CAPTURE_PORT);
 	prop->sink_ports = BIT(CS35L56_SDW1_PLAYBACK_PORT);
 	prop->paging_support = true;
-	prop->clk_stop_mode1 = false;
 	prop->quirks = SDW_SLAVE_QUIRKS_INVALID_INITIAL_PARITY;
 	prop->scp_int1_mask = SDW_SCP_INT1_BUS_CLASH | SDW_SCP_INT1_PARITY | SDW_SCP_INT1_IMPL_DEF;
 
-- 
2.39.2

