Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE226E2466
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Apr 2023 15:39:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2BE23E78;
	Fri, 14 Apr 2023 15:38:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2BE23E78
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681479543;
	bh=81WLbt+6ttebhGbh5NmyPUqzc0x0jqc/4rcL+SfFCLg=;
	h=To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=bKAcJcIfHUt3qkg2nyqUut9PzCnWj/zZIn7L5KOm0C8/2lGuZiNH/Q/GgG7DigOod
	 Luc/NR/YUK1uwcI9kuTYjos/S4TlmH+Yj6wjv6LZrtRsRzdZ7fNPzpP1PmASqKskRr
	 YVedjx5c2lRHvNMLj60Ic6tPAfz/6Q9vXJvjfDzs=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5DB67F80448;
	Fri, 14 Apr 2023 15:38:12 +0200 (CEST)
To: <broonie@kernel.org>
Subject: [PATCH 3/5] ASoC: cs35l56: Wait for init_complete in
 cs35l56_component_probe()
Date: Fri, 14 Apr 2023 14:37:51 +0100
In-Reply-To: <20230414133753.653139-1-rf@opensource.cirrus.com>
References: <20230414133753.653139-1-rf@opensource.cirrus.com>
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DUYFEWYC7STGY5HFHFTGMI5BPBTOJWSP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168147949141.26.8211552563604001158@mailman-core.alsa-project.org>
From: Richard Fitzgerald via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com, Simon Trimmer <simont@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 445F1F80524; Fri, 14 Apr 2023 15:38:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 83F1BF8025E
	for <alsa-devel@alsa-project.org>; Fri, 14 Apr 2023 15:37:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83F1BF8025E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=hwflGKFo
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33EDVEAN030487;
	Fri, 14 Apr 2023 08:37:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=7gWw1wI279l2ZxLB9kgWhkWGYVSRpnbe3cKYUZSpoXU=;
 b=hwflGKFoKgBBQnGgM9Prz1091tFcItqpYJNYZ+ZgbE8EjI5XSBB4sXlk/H71nE8a6XbU
 fdSLLXBzM+SH9Vn5+QNqEUIM9sYFo38kWyuKacjb5uKCVtZOrLNoDlAwOWxLAAQyO2KZ
 u+VUBsHsqyAituB49wtvkSyvnPC6nM7Jk+98bfvyOPZqE6vk1QoV/x3OpyjrOg/gg3wO
 kxwciLPb3doRKPbMlC73x3I+b2QHqVGS5sa/0q5d+k0N5lgBzSjwcJQ0aaC8oU/srojh
 IZwJRC6q1PvQ0TOvSin8SXJemRZycwST3uaffT9ZsPa+sycAn4OoUOz3RJVp+VaEFdaW rw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3pu5p3sey0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Apr 2023 08:37:56 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Fri, 14 Apr
 2023 08:37:54 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Fri, 14 Apr 2023 08:37:54 -0500
Received: from edi-sw-dsktp-006.ad.cirrus.com (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.127])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 2351215B7;
	Fri, 14 Apr 2023 13:37:54 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 3/5] ASoC: cs35l56: Wait for init_complete in
 cs35l56_component_probe()
Date: Fri, 14 Apr 2023 14:37:51 +0100
Message-ID: <20230414133753.653139-4-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230414133753.653139-1-rf@opensource.cirrus.com>
References: <20230414133753.653139-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 00VgaRfa195lReYP9EswcAtyWOtyZPYG
X-Proofpoint-GUID: 00VgaRfa195lReYP9EswcAtyWOtyZPYG
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: DUYFEWYC7STGY5HFHFTGMI5BPBTOJWSP
X-Message-ID-Hash: DUYFEWYC7STGY5HFHFTGMI5BPBTOJWSP
X-MailFrom: prvs=94685c4d78=rf@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com, Simon Trimmer <simont@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DUYFEWYC7STGY5HFHFTGMI5BPBTOJWSP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Simon Trimmer <simont@opensource.cirrus.com>

Moving the wait from the beginning of the cs35l56_dsp_work() into
cs35l56_component_probe() will prevent the limbo situation that is an
artifact of the two stage SoundWire driver probe and initialisation
where the card is all registered and shows in ALSA but doesn't actually
work because the hardware didn't enumerate.

The other bus drivers perform the probe and init sequentially and are
not susceptible to this issue.

Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l56.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index d60095162bfa..ab2e663af6c2 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -875,13 +875,6 @@ static void cs35l56_dsp_work(struct work_struct *work)
 	unsigned int val;
 	int ret = 0;
 
-	if (!cs35l56->init_done &&
-	    !wait_for_completion_timeout(&cs35l56->init_completion,
-					 msecs_to_jiffies(5000))) {
-		dev_err(cs35l56->dev, "%s: init_completion timed out\n", __func__);
-		goto complete;
-	}
-
 	if (!cs35l56->init_done)
 		goto complete;
 
@@ -980,6 +973,12 @@ static int cs35l56_component_probe(struct snd_soc_component *component)
 
 	BUILD_BUG_ON(ARRAY_SIZE(cs35l56_tx_input_texts) != ARRAY_SIZE(cs35l56_tx_input_values));
 
+	if (!wait_for_completion_timeout(&cs35l56->init_completion,
+					 msecs_to_jiffies(5000))) {
+		dev_err(cs35l56->dev, "%s: init_completion timed out\n", __func__);
+		return -ENODEV;
+	}
+
 	cs35l56->component = component;
 	wm_adsp2_component_probe(&cs35l56->dsp, component);
 
-- 
2.30.2

