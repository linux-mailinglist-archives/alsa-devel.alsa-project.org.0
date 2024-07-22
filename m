Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75186938D74
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2024 12:26:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 10D2DEBE;
	Mon, 22 Jul 2024 12:26:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 10D2DEBE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721644018;
	bh=0l8O3M4kP3eoaMG4z05pJZgheO9kWmWMulcubFD+vNo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=t8H/rmLnrcg9qKZuc7eKjipY5eJ0NFW7owOrnTi0Mx1znggClICsHRoTeMUrxp99v
	 vTFy82wNxc4PHUlfMYyigXyMUVfGNGHayl3sopqU0tdX8yw5fvzAY3dC+/3kUpNqiQ
	 KoFIk9J34DRQXFpAuaR8Nj593yqcHnvoNt/1+lHM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BF9F2F805C3; Mon, 22 Jul 2024 12:26:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E4ECF805DF;
	Mon, 22 Jul 2024 12:26:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D7B81F8026D; Mon, 22 Jul 2024 12:26:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4E895F8019B
	for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2024 12:26:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E895F8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=XjjwGUsn
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 46M6AUpP030632;
	Mon, 22 Jul 2024 05:26:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=ra314kbOhsrM/Q5p+Z/Ul8wHRE5K03gY7xfgRvtL9kc=; b=
	XjjwGUsnxx0rOWFXcKmS5wCgyGAO6oKBBT0+x5TOVsPmaOwdYO/liBdQB2/ws1Zv
	BiM4niZ75dcfRhkCxAHw7vj8fnlsAwj9AJsz3YdwD8aph134JbKLoMUK40SxybFN
	Dy723X1GJ0BBnxztv588wDt01S/RBkUstJTMcazoK5KPhCl3bofPLfP/Vamlzjoh
	2QFuNtmc45cJu2l+qgwr54hiv9YHlzX635JnZBnUZPrrxJOaKWSGi5xaYCWvTcYz
	G0lGPwf20qLoJHOL4EuMAf0KzQt7GW46VK5f2MrfAoPFb3XsakV7eVQ2KJZk+eCj
	FqJSPQ8ocF0ZQBku8xcU4Q==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 40gamx1mh7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Jul 2024 05:26:02 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 22 Jul
 2024 11:26:00 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Mon, 22 Jul 2024 11:26:00 +0100
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com
 [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 6F4A8820247;
	Mon, 22 Jul 2024 10:26:00 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <stable@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-sound@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>
Subject: [PATCH for-6.10 1/2] ASoC: cs35l56: Use header defines for Speaker
 Volume control definition
Date: Mon, 22 Jul 2024 11:25:59 +0100
Message-ID: <20240722102600.37931-2-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240722102600.37931-1-rf@opensource.cirrus.com>
References: <20240722102600.37931-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 0RrkAHuE1XvBnW674rwWaFzKEJiRlDxV
X-Proofpoint-ORIG-GUID: 0RrkAHuE1XvBnW674rwWaFzKEJiRlDxV
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: RUKH4B7GAV4KBAH3B7SEIZSQTZ3LGJWB
X-Message-ID-Hash: RUKH4B7GAV4KBAH3B7SEIZSQTZ3LGJWB
X-MailFrom: prvs=493343e571=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RUKH4B7GAV4KBAH3B7SEIZSQTZ3LGJWB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

[ Upstream commit c66995ae403073212f5ba60d2079003866c6e130 ]
Please apply to 6.10

The "Speaker Volume" control was being defined using four hardcoded magic
numbers. There are #defines in the cs35l56.h header for these numbers, so
change the code to use the defined constants.

Backport Note:
Identical to upstream commit. This was originally thought to be only a
cosmetic issue (the user can simply reduce the volume) but for some complex
audio topologies with SOF Audio DSP + CS42L43 + multiple CS35L56 it has
turned out to be not obvious to the user what the problem actually is and
what to do to fix it. As support for these topologies went into 6.10 we
would like this commit to be backported into 6.10.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Link: https://patch.msgid.link/20240703095517.208077-2-rf@opensource.cirrus.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/cs35l56.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index 758dfdf9d3ea..7f2f2f8c13fa 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -196,7 +196,11 @@ static const struct snd_kcontrol_new cs35l56_controls[] = {
 		       cs35l56_dspwait_get_volsw, cs35l56_dspwait_put_volsw),
 	SOC_SINGLE_S_EXT_TLV("Speaker Volume",
 			     CS35L56_MAIN_RENDER_USER_VOLUME,
-			     6, -400, 400, 9, 0,
+			     CS35L56_MAIN_RENDER_USER_VOLUME_SHIFT,
+			     CS35L56_MAIN_RENDER_USER_VOLUME_MIN,
+			     CS35L56_MAIN_RENDER_USER_VOLUME_MAX,
+			     CS35L56_MAIN_RENDER_USER_VOLUME_SIGNBIT,
+			     0,
 			     cs35l56_dspwait_get_volsw,
 			     cs35l56_dspwait_put_volsw,
 			     vol_tlv),
-- 
2.39.2

