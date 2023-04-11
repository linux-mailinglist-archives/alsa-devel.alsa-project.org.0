Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D6E6DDF9F
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Apr 2023 17:27:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B7008F0F;
	Tue, 11 Apr 2023 17:26:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B7008F0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681226846;
	bh=pBwFGn9ELKVEU+Rvm8MJHDCKQ1Ly3rABzADXMPiimPw=;
	h=To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=C4WEToxWUR++CbDGAqTS4rCe8l9x/A599jistaHk9Fn6Mdp836Oiy1jBvHkqSqIz5
	 8Lk18qMk7ujMNfxwGTCA2XWGXc8a61P7rDi6rEKN6Gp/DqwM2Mu0GbCv2xyHMyRRWN
	 JqnibZBTLB6xzCLC76hQvHiLc7APd9LhVwsLag9E=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 52713F80533;
	Tue, 11 Apr 2023 17:25:48 +0200 (CEST)
To: <broonie@kernel.org>
Subject: [PATCH 1/6] ASoC: cs35l56: Remove quick-cancelling of dsp_work()
Date: Tue, 11 Apr 2023 16:25:23 +0100
In-Reply-To: <20230411152528.329803-1-rf@opensource.cirrus.com>
References: <20230411152528.329803-1-rf@opensource.cirrus.com>
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LGCRLWR74BYGKA5PG5OYZBX352ZBGTAY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168122674746.26.16881587647873355224@mailman-core.alsa-project.org>
From: Richard Fitzgerald via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com, Richard Fitzgerald <rf@opensource.cirrus.com>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D181AF8052E; Tue, 11 Apr 2023 17:25:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 739D1F8025E
	for <alsa-devel@alsa-project.org>; Tue, 11 Apr 2023 17:25:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 739D1F8025E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=BJ/NG0t5
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33B5cuXG012801;
	Tue, 11 Apr 2023 10:25:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=T8BVSKckGSd2SY73ZmiypxT7jbER0HYHV1vJLiq4DUI=;
 b=BJ/NG0t538sx9JwGhvu/pnvZPy+x6C55fwIg+Fq2rh+riD50LfFcThKKgMLnxfaH5FY1
 IFPOaie4njQDVVJUwrw6TxRztS20fOQ0Eycdn5UhjXLF6aN9IcbsT5Z3yXpurtw/DsQ1
 z4+5utB0tllIZGmjmLCLy0qjpUhTtfM3rz8AZeHt23zYW2B5RUkg32ogLJ+0P7HwdxV0
 T1bFmUhAFFN7kmD/xj+hrmzK+h5yRFeLCgU1ahZB5cWLDn9u0FhYTZVJpwhj/QPw4Nez
 iEHU8ER3Mr8wJUzH6iCe9HzOp60nvAHdD57woCKPieKHeqtoapVoQT0bfXhpFGwA5WtW Gg==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3pu4pq54a3-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Apr 2023 10:25:30 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Tue, 11 Apr
 2023 10:25:28 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 11 Apr 2023 10:25:28 -0500
Received: from edi-sw-dsktp-006.ad.cirrus.com (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.127])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 4FDCA11D4;
	Tue, 11 Apr 2023 15:25:28 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 1/6] ASoC: cs35l56: Remove quick-cancelling of dsp_work()
Date: Tue, 11 Apr 2023 16:25:23 +0100
Message-ID: <20230411152528.329803-2-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230411152528.329803-1-rf@opensource.cirrus.com>
References: <20230411152528.329803-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 6S6RnWsp7emdfxw5wLA202O-f7qRP2uu
X-Proofpoint-ORIG-GUID: 6S6RnWsp7emdfxw5wLA202O-f7qRP2uu
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: LGCRLWR74BYGKA5PG5OYZBX352ZBGTAY
X-Message-ID-Hash: LGCRLWR74BYGKA5PG5OYZBX352ZBGTAY
X-MailFrom: prvs=9465f6ee37=rf@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com, Richard Fitzgerald <rf@opensource.cirrus.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LGCRLWR74BYGKA5PG5OYZBX352ZBGTAY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Delete the 'removing' flag and don't kick init_completion to make a
quick cancel of dsp_work(). Just let it timeout on the wait for the
completion.

Simplify the code to standard cancelling or flushing of the work.
This avoids introducing corner cases from a layer of custom signalling.
It also avoids potential race conditions when system-suspend handling
is added.

Unless the hardware is broken, the dsp_work() will already have started
and passed the completion before the driver would want to cancel it.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l56.c | 8 +-------
 sound/soc/codecs/cs35l56.h | 1 -
 2 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index d97b465f0d3c..675aad8e909f 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -867,7 +867,7 @@ static void cs35l56_dsp_work(struct work_struct *work)
 		goto complete;
 	}
 
-	if (!cs35l56->init_done || cs35l56->removing)
+	if (!cs35l56->init_done)
 		goto complete;
 
 	cs35l56->dsp.part = devm_kasprintf(cs35l56->dev, GFP_KERNEL, "cs35l56%s-%02x",
@@ -917,9 +917,6 @@ static void cs35l56_dsp_work(struct work_struct *work)
 		goto err;
 	}
 
-	if (cs35l56->removing)
-		goto err;
-
 	mutex_lock(&cs35l56->irq_lock);
 
 	init_completion(&cs35l56->init_completion);
@@ -967,7 +964,6 @@ static int cs35l56_component_probe(struct snd_soc_component *component)
 
 	BUILD_BUG_ON(ARRAY_SIZE(cs35l56_tx_input_texts) != ARRAY_SIZE(cs35l56_tx_input_values));
 
-	cs35l56->removing = false;
 	cs35l56->component = component;
 	wm_adsp2_component_probe(&cs35l56->dsp, component);
 
@@ -984,8 +980,6 @@ static void cs35l56_component_remove(struct snd_soc_component *component)
 {
 	struct cs35l56_private *cs35l56 = snd_soc_component_get_drvdata(component);
 
-	cs35l56->removing = true;
-	complete(&cs35l56->init_completion);
 	cancel_work_sync(&cs35l56->dsp_work);
 }
 
diff --git a/sound/soc/codecs/cs35l56.h b/sound/soc/codecs/cs35l56.h
index efc4b99180f9..dc91cd7d877f 100644
--- a/sound/soc/codecs/cs35l56.h
+++ b/sound/soc/codecs/cs35l56.h
@@ -49,7 +49,6 @@ struct cs35l56_private {
 	bool soft_resetting;
 	bool init_done;
 	bool sdw_attached;
-	bool removing;
 	bool fw_patched;
 	bool can_hibernate;
 	struct completion init_completion;
-- 
2.30.2

