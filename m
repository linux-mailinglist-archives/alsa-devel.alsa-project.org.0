Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E419384719D
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Feb 2024 15:07:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9DA5986F;
	Fri,  2 Feb 2024 15:07:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9DA5986F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706882841;
	bh=DK96AZtqKXcd7E3ueqD8K0+F1hQ+KVXSY7KqXeQShHQ=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=U5VJF0z7PBGJIdOg1c0wQ0XW6FoZhudxN7HjbvduvKjbiRj9QEs8KWLIMjaYJRoCb
	 Q7uwGRURPpMjkyWD1uJZvjBD2qdZEwz3Pl9Tf8o0F7xORBWbLDZXYLruHl27j/Ua0x
	 2rpDNen7ZeW4PNoWKVBf8aP2zd9xUGCIpotAf2ZI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 731AAF805B4; Fri,  2 Feb 2024 15:06:49 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D9F91F80568;
	Fri,  2 Feb 2024 15:06:48 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EEF81F80564; Fri,  2 Feb 2024 15:06:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A49A1F8055B
	for <alsa-devel@alsa-project.org>; Fri,  2 Feb 2024 15:06:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A49A1F8055B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=H+QWqvzT
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 412D1imu023527;
	Fri, 2 Feb 2024 08:06:22 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=y
	MERiJ6dlvpjH7y1c/au/WKWXcDB1zu+AWyPNqt71iI=; b=H+QWqvzTA/vRbc2vV
	Kim+gIe0k96TphPlHOllmEEvu37dfV/JoFoeQMMxgFkEz5fvN/Ga+7AUEAJmLI0j
	sYLtPOZNw1E4OVXRsTHxeXSU4LJWeN/NGVThAqUxRB/r2Zl2+nU6nRjvK7yGWC0A
	LM4IUi7dKeJemRDOs2FgK9cwT7a520rPPXD1HJjsbGXL5Ajf/wYzfiyYc2n3lPM5
	j4wHt4KlehJRSfOTecZFCAQdhu0ychop04NoRd4dlWAG86w692oIDPh5QoRT32+u
	Bop2QwWpjZzcFn/39gtJ4sCuajosgcBDTCznT41G2+FdCUJwvLYBg5rl6aBBfCXR
	TIJsg==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3w0puwgjvy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Feb 2024 08:06:22 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 2 Feb
 2024 14:06:19 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Fri, 2 Feb 2024 14:06:19 +0000
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com
 [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 90F21820241;
	Fri,  2 Feb 2024 14:06:19 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>, <linux-sound@vger.kernel.org>
Subject: [PATCH 1/3] ASoC: cs42l43: Add clear of stashed pointer on component
 remove
Date: Fri, 2 Feb 2024 14:06:17 +0000
Message-ID: <20240202140619.1068560-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: x26BZXqQrZSalNTgKJr50zjQA-d1uWXv
X-Proofpoint-GUID: x26BZXqQrZSalNTgKJr50zjQA-d1uWXv
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 5TLKBHIBQOHE4USZAICE3ZOWUGJMLVU6
X-Message-ID-Hash: 5TLKBHIBQOHE4USZAICE3ZOWUGJMLVU6
X-MailFrom: prvs=9762917273=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5TLKBHIBQOHE4USZAICE3ZOWUGJMLVU6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

If the component is removed the stashed component pointer in the
CODECs private struct should also be cleared to prevent use of a stale
pointer.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l43.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/codecs/cs42l43.c b/sound/soc/codecs/cs42l43.c
index 2c402086924d..9e1deb3242cb 100644
--- a/sound/soc/codecs/cs42l43.c
+++ b/sound/soc/codecs/cs42l43.c
@@ -2111,10 +2111,18 @@ static int cs42l43_component_probe(struct snd_soc_component *component)
 	return 0;
 }
 
+static void cs42l43_component_remove(struct snd_soc_component *component)
+{
+	struct cs42l43_codec *priv = snd_soc_component_get_drvdata(component);
+
+	priv->component = NULL;
+}
+
 static const struct snd_soc_component_driver cs42l43_component_drv = {
 	.name			= "cs42l43-codec",
 
 	.probe			= cs42l43_component_probe,
+	.remove			= cs42l43_component_remove,
 	.set_sysclk		= cs42l43_set_sysclk,
 	.set_jack		= cs42l43_set_jack,
 
-- 
2.30.2

