Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 295B4672288
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Jan 2023 17:08:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BEB297944;
	Wed, 18 Jan 2023 17:07:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BEB297944
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674058111;
	bh=SCJAx3eH54KTFqildRuRoj2gIH2ZHXw9yE17zLyn9MA=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=DYwoqIup252jcgyAJsEFxu/PQA4lkM/W166P6L52wX+Otjbnw1RoBxbYlTWEIgT0S
	 NZ7kAPy+pbe5p1OtYudaCGTXYBcuaraDLgYF8q2e5u/WvKdZ67P+puzDHvwlaU33cB
	 JHh+KKvDUXSU+fO+0Da48rNLk87wVrIYLYE58m1Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AFA60F80588;
	Wed, 18 Jan 2023 17:05:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9F068F8057C; Wed, 18 Jan 2023 17:05:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 229C1F8024C
 for <alsa-devel@alsa-project.org>; Wed, 18 Jan 2023 17:05:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 229C1F8024C
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=E3JIXvjH
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30IEDgrB022836; Wed, 18 Jan 2023 10:05:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=frUZfxKkTDkW87u5OQbfX6rw2QFXA5a5bNSyUepkgBc=;
 b=E3JIXvjHd/ksH23puwvZaV/38rQ5qDiH5szpk6owT2rX7sNDj9Ok5Ye+6U2MtHL3Vw1T
 FcAzKWiUca/5rPmnUJ76aFd4kIKioPDnav5Xx0i3Fxfj2CJLrmJhd8pAV5P8ymJ0TpPy
 OOucnoUgWROiEZ5UZVg3Dc3R0idqh5o5+qfAWDMvEY7eI6WJPinxMYLmDY0428xoAX1n
 hN1ie6extehDTziAHyqQ9ugPq+ReC7VbOxbSToeg9NvSbuuCJC6ce5ohvRu2EPWSpzG4
 amXYoqKZrIlWKhnUJKxA3USneIhvxASvivpkA0365vG7/CfS3PqlWXkDqeC22HICw7m7 og== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3n3spx6vk9-6
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Jan 2023 10:05:08 -0600
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.21; Wed, 18 Jan
 2023 10:04:58 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.7 via Frontend Transport; Wed, 18 Jan 2023 10:04:58 -0600
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (unknown [198.90.202.160])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id ED30B11CB;
 Wed, 18 Jan 2023 16:04:57 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH v2 7/8] ASoC: cs42l42: Don't set idle_bias_on
Date: Wed, 18 Jan 2023 16:04:51 +0000
Message-ID: <20230118160452.2385494-8-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230118160452.2385494-1-sbinding@opensource.cirrus.com>
References: <20230118160452.2385494-1-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: lo4yHFbhzh4p8Z6_5t_7Dhw_IJrSF4LQ
X-Proofpoint-ORIG-GUID: lo4yHFbhzh4p8Z6_5t_7Dhw_IJrSF4LQ
X-Proofpoint-Spam-Reason: safe
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>, linux-kernel@vger.kernel.org,
 Stefan Binding <sbinding@opensource.cirrus.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Richard Fitzgerald <rf@opensource.cirrus.com>

idle_bias_on was set because cs42l42 has a "VMID" type pseudo-midrail
supply (named FILT+), and these typically take a long time to charge.
But the driver never enabled pm_runtime so it would never have powered-
down the cs42l42 anyway.

In fact, FILT+ can charge to operating voltage within 12.5 milliseconds
of enabling HP or ADC. This time is already covered by the startup
delay of the HP/ADC.

The datasheet warning about FILT+ taking up to 1 second to charge only
applies in the special cases that either the PLL is started or
DETECT_MODE set to non-zero while both HP and ADC are off. The driver
never does either of these.

Removing idle_bias_on allows the Soundwire host controller to suspend
if there isn't a snd_soc_jack handler registered.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l42.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index a92499876ce2a..aa2223bfb885a 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -597,7 +597,6 @@ const struct snd_soc_component_driver cs42l42_soc_component = {
 	.num_dapm_routes	= ARRAY_SIZE(cs42l42_audio_map),
 	.controls		= cs42l42_snd_controls,
 	.num_controls		= ARRAY_SIZE(cs42l42_snd_controls),
-	.idle_bias_on		= 1,
 	.endianness		= 1,
 };
 EXPORT_SYMBOL_NS_GPL(cs42l42_soc_component, SND_SOC_CS42L42_CORE);
-- 
2.34.1

