Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 888BF769D78
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 18:59:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C86D885D;
	Mon, 31 Jul 2023 18:59:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C86D885D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690822797;
	bh=DuMMA4WT1tv4Jl18z/UfV1EBLNhUtnYsMQ9eAdW9cP8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZmUFN8PIQPDgHi/tJguZ3DxzI3ekRvzBNJP4XT8/UjL67suSRFhpKiOVwjsJH/c58
	 mq0Iymem24++li0i+LYHy7/Oin0oCJJLH8P00ZbNg9wgtDVLQPl9rKMXL4e6iW8MmA
	 WTdFIGz0PMjiZ4xfQsIlZzemSbPzyToSgYH5+0OI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3B340F805AF; Mon, 31 Jul 2023 18:57:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 880E2F805A9;
	Mon, 31 Jul 2023 18:57:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 401EEF8025A; Mon, 31 Jul 2023 18:57:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 34633F80163
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 18:57:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34633F80163
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=A9dafwKH
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 36V5lNJK017071;
	Mon, 31 Jul 2023 11:57:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=COsUQaN/ErqOVMioTgwxTBAOGWPa/9gsBLSsEI2cT2A=; b=
	A9dafwKHWVwmWHxQyv/TdC6e8R+dzdJDt49STc7fSw2q/XQXVO0ECaFOx4SKySmm
	M1yozutFbDSUsLi9XxSsTGBvnctBmNoS9i3aBGhjjRsGQ3BSxDqtE6ixaZ37cBAN
	lk5Rdy+kXQVor6332GqARJiJ0fVEoWs8oxoDmYcG+t9GnvP9Yw3R3n9DICqS5cIZ
	H2NY3jgc5JRe89waXHeUuEWjbvpkqBelva0rC2bw2AtQqnKURdsyZnDg0PCz4Z4l
	fyPgn3AbVSYFgzIH11p7ew+bnrCKEsGFyNGLUvptymCEFjAqebh+pTcqD9G6d+cr
	OQ95okiKLwocbSmCvdLisQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3s5gk1sg45-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 31 Jul 2023 11:57:33 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Mon, 31 Jul
 2023 17:57:30 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.30 via Frontend
 Transport; Mon, 31 Jul 2023 17:57:30 +0100
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com
 [198.61.64.107])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 55A3D45D;
	Mon, 31 Jul 2023 16:57:30 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <tiwai@suse.com>
CC: <perex@perex.cz>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        Richard
 Fitzgerald <rf@opensource.cirrus.com>
Subject: [PATCH 2/9] ALSA: hda/cs35l56: Do not mark cache dirty after REINIT
Date: Mon, 31 Jul 2023 17:57:19 +0100
Message-ID: <20230731165726.7940-3-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230731165726.7940-1-rf@opensource.cirrus.com>
References: <20230731165726.7940-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: kFB1f_oNiNMpBEAsCAcGXST23BTvhCOS
X-Proofpoint-ORIG-GUID: kFB1f_oNiNMpBEAsCAcGXST23BTvhCOS
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: HLVNFMRTQ2AB744M6FAFK4FES7NBRTUN
X-Message-ID-Hash: HLVNFMRTQ2AB744M6FAFK4FES7NBRTUN
X-MailFrom: prvs=3576b45159=rf@opensource.cirrus.com
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
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Only call regcache_mark_dirty() in cs35l56_hda_fw_load() if
the CS35L56 was SYSTEM_RESET.

recache_mark_dirty() changes the behaviour of regcache_sync()
to write out cache values that are not the default value, and
skip cache values that are the default.

AUDIO_REINIT does not reset the registers. regcache_mark_dirty()
after AUDIO_REINIT could cause the regcache_sync() to sync
registers incorrectly because it will assume that all registers
have reset to default.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/pci/hda/cs35l56_hda.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/hda/cs35l56_hda.c b/sound/pci/hda/cs35l56_hda.c
index c3acda2daeeb..fda716e0db09 100644
--- a/sound/pci/hda/cs35l56_hda.c
+++ b/sound/pci/hda/cs35l56_hda.c
@@ -569,6 +569,7 @@ static int cs35l56_hda_fw_load(struct cs35l56_hda *cs35l56)
 	} else {
 		/* Reset the device and wait for it to boot */
 		cs35l56_system_reset(&cs35l56->base, false);
+		regcache_mark_dirty(cs35l56->base.regmap);
 		ret = cs35l56_wait_for_firmware_boot(&cs35l56->base);
 		if (ret)
 			goto err;
@@ -579,7 +580,6 @@ static int cs35l56_hda_fw_load(struct cs35l56_hda *cs35l56)
 	if (ret)
 		goto err;
 
-	regcache_mark_dirty(cs35l56->base.regmap);
 	regcache_sync(cs35l56->base.regmap);
 
 	regmap_clear_bits(cs35l56->base.regmap, CS35L56_PROTECTION_STATUS,
-- 
2.30.2

