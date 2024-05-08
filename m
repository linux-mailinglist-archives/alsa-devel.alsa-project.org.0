Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C81A58BFA7C
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2024 12:09:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E37FA3E7;
	Wed,  8 May 2024 12:09:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E37FA3E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715162955;
	bh=TPptcfmWefb6Dwpc7wioI/LAUBpw0qGUXV0LNVjXWEM=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=EK7A1ePpWXI18xLTBNPvKDWfBZsEQIVJk1LiNen7ZbVB4+DEglUicgz9Apf42aAXM
	 gd0avVMhnQ4VDi+LIBVpQOLf4TJ+4BF0rcY6UW06qWePdtcgLRJ2bOQJOsbAeO4P1F
	 FEJcSGWpBuGaA1kqKNBwnvq1yLEBK0BTQPdYbfJI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 20A12F80571; Wed,  8 May 2024 12:08:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A6906F8059F;
	Wed,  8 May 2024 12:08:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 223B1F8049C; Wed,  8 May 2024 12:08:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5051DF8003A
	for <alsa-devel@alsa-project.org>; Wed,  8 May 2024 12:08:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5051DF8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=KPtJyn8K
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 44870QlG029375;
	Wed, 8 May 2024 05:08:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=N
	J7EXhSoGpVKvEWs1UdcCOfYFkLfSO0USCWaoNX8CHA=; b=KPtJyn8KFqYdCPlvZ
	1SYaEXdrErwCc3x1yxlFtMHcrTAsf8ZD/24p+Mx+uVkmtqmfhXjwcOAsBCMbvcFN
	QtSxF+ovD2auZtD89uYft7HO57N25L4NpogRDpMhV0VmJ1y97Iq25fcifiug2IB6
	IvYiZ0LUX/ljzDK71M10Oc8hGCHtgWK245b/YHT8FjWwuWN9RIDfnFGYp1FWkH8m
	L9hbyqhHslqKhdplza8g2Hww8pGj4b3Gwru0Sazm5+vAUfEeoR4S8H5O+CMxb2kw
	BUkrV5zmj34qM/B1xBYDUZI58/ALEfhf9vKaBxPH1U7dk+Xmfr7ujU1U8WGI0Fys
	+VPTg==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3xysherp5x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 May 2024 05:08:14 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 8 May 2024
 11:08:12 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9
 via Frontend Transport; Wed, 8 May 2024 11:08:12 +0100
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com
 [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id E47BF820244;
	Wed,  8 May 2024 10:08:11 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <tiwai@suse.com>
CC: <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>
Subject: [PATCH] ALSA: hda: cs35l56: Fix lifetime of cs_dsp instance
Date: Wed, 8 May 2024 11:08:11 +0100
Message-ID: <20240508100811.49514-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: ClisYTMZ6HFqvrv3HKI_oxKb6ovp3v7g
X-Proofpoint-ORIG-GUID: ClisYTMZ6HFqvrv3HKI_oxKb6ovp3v7g
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: WVMAAKOWYWRCC2I5YJJVXR56GWH4A77G
X-Message-ID-Hash: WVMAAKOWYWRCC2I5YJJVXR56GWH4A77G
X-MailFrom: prvs=2858927d68=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WVMAAKOWYWRCC2I5YJJVXR56GWH4A77G/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The cs_dsp instance is initialized in the driver probe() so it
should be freed in the driver remove(). Also fix a missing call
to cs_dsp_remove() in the error path of cs35l56_hda_common_probe().

The call to cs_dsp_remove() was being done in the component unbind
callback cs35l56_hda_unbind(). This meant that if the driver was
unbound and then re-bound it would be using an uninitialized cs_dsp
instance.

It is best to initialize the cs_dsp instance in probe() so that it
can return an error if it fails. The component binding API doesn't
have any error handling so there's no way to handle a failure if
cs_dsp was initialized in the bind.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Fixes: 73cfbfa9caea ("ALSA: hda/cs35l56: Add driver for Cirrus Logic CS35L56 amplifier")
---
 sound/pci/hda/cs35l56_hda.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/pci/hda/cs35l56_hda.c b/sound/pci/hda/cs35l56_hda.c
index 558c1f38fe97..11b0570ff56d 100644
--- a/sound/pci/hda/cs35l56_hda.c
+++ b/sound/pci/hda/cs35l56_hda.c
@@ -732,8 +732,6 @@ static void cs35l56_hda_unbind(struct device *dev, struct device *master, void *
 	if (cs35l56->base.fw_patched)
 		cs_dsp_power_down(&cs35l56->cs_dsp);
 
-	cs_dsp_remove(&cs35l56->cs_dsp);
-
 	if (comps[cs35l56->index].dev == dev)
 		memset(&comps[cs35l56->index], 0, sizeof(*comps));
 
@@ -1035,7 +1033,7 @@ int cs35l56_hda_common_probe(struct cs35l56_hda *cs35l56, int hid, int id)
 			       ARRAY_SIZE(cs35l56_hda_dai_config));
 	ret = cs35l56_force_sync_asp1_registers_from_cache(&cs35l56->base);
 	if (ret)
-		goto err;
+		goto dsp_err;
 
 	/*
 	 * By default only enable one ASP1TXn, where n=amplifier index,
@@ -1061,6 +1059,8 @@ int cs35l56_hda_common_probe(struct cs35l56_hda *cs35l56, int hid, int id)
 
 pm_err:
 	pm_runtime_disable(cs35l56->base.dev);
+dsp_err:
+	cs_dsp_remove(&cs35l56->cs_dsp);
 err:
 	gpiod_set_value_cansleep(cs35l56->base.reset_gpio, 0);
 
@@ -1078,6 +1078,8 @@ void cs35l56_hda_remove(struct device *dev)
 
 	component_del(cs35l56->base.dev, &cs35l56_hda_comp_ops);
 
+	cs_dsp_remove(&cs35l56->cs_dsp);
+
 	kfree(cs35l56->system_name);
 	pm_runtime_put_noidle(cs35l56->base.dev);
 
-- 
2.39.2

