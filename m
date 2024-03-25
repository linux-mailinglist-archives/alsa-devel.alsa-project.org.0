Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDCE88A485
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Mar 2024 15:30:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B711AE8;
	Mon, 25 Mar 2024 15:30:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B711AE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711377030;
	bh=3/aO5OuorLl8UcRWmY0nPxQX+riWkFHW9LJcFrhK7kM=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=rox69G4KeXM4VDcNsfT0u9BT6lTynNcaWRQo8KpbmIQAg9r2PrbHGjpjGAvFLZO03
	 AcmH21PIRKajDSZ5loX6YOuc2J+dpYBTqQLI00KqrZxhB66Iot9no9DvLv7xHB7CK9
	 cjAlyy/2UdM3PtqF6ewUV23dM+aaoZcIiJGkZWvU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F3032F8057B; Mon, 25 Mar 2024 15:29:57 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 42EADF805A0;
	Mon, 25 Mar 2024 15:29:57 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 45EC4F80236; Mon, 25 Mar 2024 15:29:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 849CEF80074
	for <alsa-devel@alsa-project.org>; Mon, 25 Mar 2024 15:29:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 849CEF80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=NQWMKPA+
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42P7Rwds032111;
	Mon, 25 Mar 2024 09:29:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=i
	U76he4wuuKu7dLL8rq067nWSEgF6XzN74dcE1qsi3A=; b=NQWMKPA+RgfKWOSta
	6uadNyMBZwf6Qe3LyFQ2oNgl9h0rzCgAdmUVuwKDlgUDEDEV1+YD+Gq46nopihkP
	B03zu4c/9JavRcXzTVO0EbOZWXkjIVnoXKKLja/ZZaANLhDgB/PARL9TSZruVF9D
	ompvSlJhTZlAFakVeDZ3E1Gr0+kNgZPLrCaeoJtnFojbSOyHxCNphbdFWE3eAiYB
	i6M/1GaKuuxtEIRV9QvSQdDAynSoqnfNXNLyE0Y6SUeKEH88kWC3qijed06xTQB9
	4GLYTSYTZMc8jEemjV4Z9617TJ0CTT+iMBkdYE3pAtHoMH2tS5XI7ZGpqvl+8nR0
	x2v5w==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3x1ugm3hym-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Mar 2024 09:29:40 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 25 Mar
 2024 14:29:38 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.4 via Frontend Transport; Mon, 25 Mar 2024 14:29:38 +0000
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com
 [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 06853820244;
	Mon, 25 Mar 2024 14:29:38 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <tiwai@suse.com>
CC: <linux-sound@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Simon
 Trimmer" <simont@opensource.cirrus.com>,
        Richard Fitzgerald
	<rf@opensource.cirrus.com>
Subject: [PATCH] ALSA: hda: cs35l56: Raise device name message log level
Date: Mon, 25 Mar 2024 14:29:37 +0000
Message-ID: <20240325142937.257869-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: -l-o5qGsO2wpx8pyk7r5-ks3XXWjmyvJ
X-Proofpoint-GUID: -l-o5qGsO2wpx8pyk7r5-ks3XXWjmyvJ
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 6UX46KNI7FUZAKL7SA2AVLPNETOXDFWQ
X-Message-ID-Hash: 6UX46KNI7FUZAKL7SA2AVLPNETOXDFWQ
X-MailFrom: prvs=081491209a=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6UX46KNI7FUZAKL7SA2AVLPNETOXDFWQ/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Simon Trimmer <simont@opensource.cirrus.com>

The system and amplifier names influence which firmware and tuning files
are downloaded to the device; log these values to aid end-user system
support.

Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/pci/hda/cs35l56_hda.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/hda/cs35l56_hda.c b/sound/pci/hda/cs35l56_hda.c
index 41974b3897a7..f3c5715f5e02 100644
--- a/sound/pci/hda/cs35l56_hda.c
+++ b/sound/pci/hda/cs35l56_hda.c
@@ -1024,8 +1024,8 @@ int cs35l56_hda_common_probe(struct cs35l56_hda *cs35l56, int hid, int id)
 		goto err;
 	}
 
-	dev_dbg(cs35l56->base.dev, "DSP system name: '%s', amp name: '%s'\n",
-		cs35l56->system_name, cs35l56->amp_name);
+	dev_info(cs35l56->base.dev, "DSP system name: '%s', amp name: '%s'\n",
+		 cs35l56->system_name, cs35l56->amp_name);
 
 	regmap_multi_reg_write(cs35l56->base.regmap, cs35l56_hda_dai_config,
 			       ARRAY_SIZE(cs35l56_hda_dai_config));
-- 
2.39.2

