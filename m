Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA6989BCDF
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Apr 2024 12:18:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0565422CE;
	Mon,  8 Apr 2024 12:18:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0565422CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712571531;
	bh=Jk5AfXpYJl/Ul0uWQBPecZhjRr/Z7t8CO1bBtCb5+qA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=s+//wcQr9SXo7H5e8QwRRctM+DtGLMC3NJS1VIsaAU019X092n1Q7r6xRiz0qse54
	 ZIk05v2v0bpKrwT8yW/sA8n9lZJ2O72cWgRZ5amf8qWjCXgkLlVcwoUTpw8i3fI8X1
	 B14lWJeywkoe1dECszFk5hsF3mxHvuFHEwduzctk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2D892F805A0; Mon,  8 Apr 2024 12:18:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B7C1F805A0;
	Mon,  8 Apr 2024 12:18:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E4483F8028B; Mon,  8 Apr 2024 12:18:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 587CDF800C9
	for <alsa-devel@alsa-project.org>; Mon,  8 Apr 2024 12:18:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 587CDF800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=qT3I7ohe
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 43850rVA005178;
	Mon, 8 Apr 2024 05:18:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=U6m2cDC0lG4V+OJfs4nMI2Z6AhEq3DduAGPDmmbhl9U=; b=
	qT3I7oheSuZKbXg4rSLcHWQsxyUGPavhCJwPShLxQVPLJt+hEicygncqgnLaIu0x
	kKiBhbC01AB0pqaMd8e4BTbQ7vXCZqnG3nzGvfKWXUnTLS+nD1BpKKwXirAsYXZj
	0bw0tpecsh1K1GXfMV3neAjadBtkN4seGHT0svMZPGcOgWcCsXINCbdKFEeCnYsM
	YN3Oosi22Hm0jZs/9tcNfmLtFh4v56mY/4mU1lEl8iDTkeOr6UF/efG1pQWXnMtU
	qhjM4HP4TinWzamCerpKzviCgvR9zOU3XaF+GX2Gtt4vQ/EnFg4R74egIXuRA2Pc
	PBhrsjihm/sHbFym9sQTqw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3xb3sxhbbq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Apr 2024 05:18:05 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 8 Apr 2024
 11:18:03 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9
 via Frontend Transport; Mon, 8 Apr 2024 11:18:03 +0100
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com
 [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 36BE582024B;
	Mon,  8 Apr 2024 10:18:03 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <tiwai@suse.com>
CC: <linux-sound@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Richard
 Fitzgerald" <rf@opensource.cirrus.com>
Subject: [PATCH 2/4] ALSA: hda: cs35l56: Exit cache-only after
 cs35l56_wait_for_firmware_boot()
Date: Mon, 8 Apr 2024 11:18:01 +0100
Message-ID: <20240408101803.43183-3-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240408101803.43183-1-rf@opensource.cirrus.com>
References: <20240408101803.43183-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 50B025tE5E7-lELiV888TYU8ZXrSmWhG
X-Proofpoint-GUID: 50B025tE5E7-lELiV888TYU8ZXrSmWhG
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: FP5C7CSFJRS5ZKU7VU3GFVXHRDJD6RWL
X-Message-ID-Hash: FP5C7CSFJRS5ZKU7VU3GFVXHRDJD6RWL
X-MailFrom: prvs=182810dd8d=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FP5C7CSFJRS5ZKU7VU3GFVXHRDJD6RWL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Adds calls to disable regmap cache-only after a successful return from
cs35l56_wait_for_firmware_boot().

This is to prepare for a change in the shared ASoC module that will
leave regmap in cache-only mode after cs35l56_system_reset(). This is
to prevent register accesses going to the hardware while it is
rebooting.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
This will have to go through Mark's tree because it's necessary
to make this change to the HDA driver before applying patch #3 in
this series.
---
 sound/pci/hda/cs35l56_hda.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/pci/hda/cs35l56_hda.c b/sound/pci/hda/cs35l56_hda.c
index 1a3f84599cb5..558c1f38fe97 100644
--- a/sound/pci/hda/cs35l56_hda.c
+++ b/sound/pci/hda/cs35l56_hda.c
@@ -644,6 +644,8 @@ static int cs35l56_hda_fw_load(struct cs35l56_hda *cs35l56)
 		ret = cs35l56_wait_for_firmware_boot(&cs35l56->base);
 		if (ret)
 			goto err_powered_up;
+
+		regcache_cache_only(cs35l56->base.regmap, false);
 	}
 
 	/* Disable auto-hibernate so that runtime_pm has control */
@@ -1002,6 +1004,8 @@ int cs35l56_hda_common_probe(struct cs35l56_hda *cs35l56, int hid, int id)
 	if (ret)
 		goto err;
 
+	regcache_cache_only(cs35l56->base.regmap, false);
+
 	ret = cs35l56_set_patch(&cs35l56->base);
 	if (ret)
 		goto err;
-- 
2.39.2

