Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03CE56E6760
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Apr 2023 16:45:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7E68E84;
	Tue, 18 Apr 2023 16:44:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7E68E84
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681829105;
	bh=M/oCp47Id9dPM9H/bCwLWCn6/jBWsb2dNz4a/etpDTc=;
	h=To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=lacuufXGiTyBRTXKO42jR75pXWbKcUjq9gwIeiJTBdy39InklVD4eJipjNuvmszX/
	 zNbydQZMh9fsn/7S0Rj49IhkcBoHKqB6fzMR7EtAQUnAbaCU7VIKwnH42jaFBViWVK
	 vUnhUS62kMDjYiGgfw5xmF9t98FRwLze2UM0x5NU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D879DF80529;
	Tue, 18 Apr 2023 16:43:25 +0200 (CEST)
To: <broonie@kernel.org>
Subject: [PATCH 1/4] ASoC: cs35l56: Update comment on masking of EINT20
 interrupts
Date: Tue, 18 Apr 2023 15:43:06 +0100
In-Reply-To: <20230418144309.1100721-1-rf@opensource.cirrus.com>
References: <20230418144309.1100721-1-rf@opensource.cirrus.com>
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4OXU3H7C4TU6SNDTJ67YVQBPDBYG6QGP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168182900547.26.16204288527828240984@mailman-core.alsa-project.org>
From: Richard Fitzgerald via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com, Richard Fitzgerald <rf@opensource.cirrus.com>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D5257F804FC; Tue, 18 Apr 2023 16:43:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9CFA3F8019B
	for <alsa-devel@alsa-project.org>; Tue, 18 Apr 2023 16:43:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9CFA3F8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=G+9nT64n
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33I523hv019087;
	Tue, 18 Apr 2023 09:43:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=poQt733VgDpa+DABEm8TM7onc2muLJKkyj5gMLuS0QU=;
 b=G+9nT64nssv5Flyyshw8y/xQUVvp8YZowW2IlTY+eaY+WddoiMTdvbs0l05trDxRqofS
 AO8HmSo2lJaU3XEH/rd1uQMt7oC32bHUn9/oOm7BNefzKhsRjOmnaXUnGPUQf9jKYFJQ
 izLQqy7M3b7xRF1Wi53ls8qFVoQsuuLfN4lHrkuvsxHj6Kjwv1tKEcuvMXigxlrEEVj5
 9MKwkWRtG9ngF3Z4sDT078P87jhG7K3l7YmBApbSJjObNqv/SCMt7gyQHmjO7hS+2RMP
 DEMB/vZTO3lh/AO3ofH5RYOOjCAux1q1rdtXNexXXvWyYHNSqFr9g4kr6HCKtEwFbcnm tw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3pyrbpxftd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Apr 2023 09:43:11 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Tue, 18 Apr
 2023 09:43:10 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 18 Apr 2023 09:43:10 -0500
Received: from edi-sw-dsktp-006.ad.cirrus.com (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.127])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id EEDE311DC;
	Tue, 18 Apr 2023 14:43:09 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 1/4] ASoC: cs35l56: Update comment on masking of EINT20
 interrupts
Date: Tue, 18 Apr 2023 15:43:06 +0100
Message-ID: <20230418144309.1100721-2-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230418144309.1100721-1-rf@opensource.cirrus.com>
References: <20230418144309.1100721-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: IyCQfYhAggD8HspKoxcMxnuSBZjfqaeu
X-Proofpoint-ORIG-GUID: IyCQfYhAggD8HspKoxcMxnuSBZjfqaeu
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 4OXU3H7C4TU6SNDTJ67YVQBPDBYG6QGP
X-Message-ID-Hash: 4OXU3H7C4TU6SNDTJ67YVQBPDBYG6QGP
X-MailFrom: prvs=9472792d81=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4OXU3H7C4TU6SNDTJ67YVQBPDBYG6QGP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

EINT20 contains wake-source interrupts and also interface-blocked
interrupts, which all default to unmasked after reset or wake.

The comment in cs35l56_init() only mentioned the wake interrupts.
Update the comment so it's clear that it's intentional to also
mask the *_BLOCKED interrupts.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l56.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index 0f4a94b02ef8..1b80cae5026e 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -1537,7 +1537,7 @@ int cs35l56_init(struct cs35l56_private *cs35l56)
 
 	cs35l56_patch(cs35l56->dev, cs35l56->regmap, cs35l56->rev);
 
-	/* Wake source interrupts default to unmasked, so mask them */
+	/* Wake source and *_BLOCKED interrupts default to unmasked, so mask them */
 	regmap_write(cs35l56->regmap, CS35L56_IRQ1_MASK_20, 0xffffffff);
 	regmap_update_bits(cs35l56->regmap, CS35L56_IRQ1_MASK_1,
 			   CS35L56_AMP_SHORT_ERR_EINT1_MASK,
-- 
2.30.2

