Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A77495EDA
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jan 2022 13:06:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 039EE2BC9;
	Fri, 21 Jan 2022 13:05:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 039EE2BC9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642766797;
	bh=o1w3m8udOKoJ3CiYVJRSuvIA6fio505Gb8fULpRe2lI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q4e1RN8xQcwNvOaImaL5cZTunb0bF+ueM5s+wJ+Q/bLKeCBHKC5CJVxYSO9ygxvJ+
	 phtFgU/2/fpIOQHJ+h+ekW0tTlmOJbfBsse3Zu393MxXs+w7kQgvC+to2brQxiAU3D
	 WRLwvaePRO5jDMUp8F61CyfBYZTD+zjKc/rM66Uc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 574ABF80516;
	Fri, 21 Jan 2022 13:04:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6056EF804AC; Fri, 21 Jan 2022 13:04:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7AE5AF800F8
 for <alsa-devel@alsa-project.org>; Fri, 21 Jan 2022 13:04:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7AE5AF800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="jFuPLgzH"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20L6W2RK017662;
 Fri, 21 Jan 2022 06:04:17 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=/5EEVxedqyc4lS3w9/oKz7sNBu3Ep8/TONL9EDmsebU=;
 b=jFuPLgzH0D8YDfL+NZAykCuPJ4QZu1grLVvZS5PWYR3jwhVP+TvFacR/6Cf/rjrbLigW
 WJcOKWHSv3QogtorJHc6z0NvRc7U8mIOWHfIzSsopeJ6pgcG7pNpnHA1cvmRZUOERuWi
 IDamZR/MsA0/rCtXvv08lYOQtWFMo2pWRdFPLUGHa1j4Pnxnzx9HG6q/dFkbuIbGjhfH
 EuZrlpf+Yz/FgNtyZZcxBVYZw3fj/HvnkV1/UD9KGWhdii1dCpWnj3pi3jxA5VCz8mfj
 XcU89/8JjwQJsL3NRDIskek6J0I2fzbgXU8N1BgwbUvJY2ENlmA5SzJvkODsKhBFJddv EQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3dqhyq0nwc-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 21 Jan 2022 06:04:17 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 21 Jan
 2022 12:04:15 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Fri, 21 Jan 2022 12:04:15 +0000
Received: from AUSNPC0LSNW1-debian.cirrus.com (AUSNPC0LSNW1.ad.cirrus.com
 [198.61.65.33])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 07D7346D;
 Fri, 21 Jan 2022 12:04:14 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH v2 1/3] ASoC: cs42l42: Report full jack status when plug is
 detected
Date: Fri, 21 Jan 2022 12:04:10 +0000
Message-ID: <20220121120412.672284-2-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220121120412.672284-1-rf@opensource.cirrus.com>
References: <20220121120412.672284-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: JnDjrwlJwd9kkfhT0hsB5Ro-Q5fHUQ19
X-Proofpoint-ORIG-GUID: JnDjrwlJwd9kkfhT0hsB5Ro-Q5fHUQ19
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>, linux-kernel@vger.kernel.org
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

When a plug event is detect report the full state of all status
bits, don't assume that there will have been a previous unplug
event to clear all the bits. Report the state of both HEADPHONE
and MICROPHONE bits according to detected type, and clear all the
button status bits. The current button status is already checked
and reported at the end of the function.

During a system suspend the jack could be unplugged and plugged,
possibly changing the jack type. On resume the interrupt status will
indicate a plug event - there will not be an unplug event to clear
the bits.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l42.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index 43d98bdb5b5b..2c294868008e 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -1637,7 +1637,11 @@ static irqreturn_t cs42l42_irq_thread(int irq, void *data)
 
 	mutex_lock(&cs42l42->jack_detect_mutex);
 
-	/* Check auto-detect status */
+	/*
+	 * Check auto-detect status. Don't assume a previous unplug event has
+	 * cleared the flags. If the jack is unplugged and plugged during
+	 * system suspend there won't have been an unplug event.
+	 */
 	if ((~masks[5]) & irq_params_table[5].mask) {
 		if (stickies[5] & CS42L42_HSDET_AUTO_DONE_MASK) {
 			cs42l42_process_hs_type_detect(cs42l42);
@@ -1645,11 +1649,15 @@ static irqreturn_t cs42l42_irq_thread(int irq, void *data)
 			case CS42L42_PLUG_CTIA:
 			case CS42L42_PLUG_OMTP:
 				snd_soc_jack_report(cs42l42->jack, SND_JACK_HEADSET,
-						    SND_JACK_HEADSET);
+						    SND_JACK_HEADSET |
+						    SND_JACK_BTN_0 | SND_JACK_BTN_1 |
+						    SND_JACK_BTN_2 | SND_JACK_BTN_3);
 				break;
 			case CS42L42_PLUG_HEADPHONE:
 				snd_soc_jack_report(cs42l42->jack, SND_JACK_HEADPHONE,
-						    SND_JACK_HEADPHONE);
+						    SND_JACK_HEADSET |
+						    SND_JACK_BTN_0 | SND_JACK_BTN_1 |
+						    SND_JACK_BTN_2 | SND_JACK_BTN_3);
 				break;
 			default:
 				break;
-- 
2.11.0

