Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C5ADF75CB7B
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 17:21:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6BB2201;
	Fri, 21 Jul 2023 17:20:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6BB2201
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689952876;
	bh=/g+tEANKRBGu9UzvRhyA5PsvjFsaBBmyfijxJKe5sSo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LsfDYQVFTrKF8VYTatajwr7cMfs1IzgC0CtkpMT7sB3FqF6dSglJX9R97m+/jK+63
	 k6VkPuzR51CQSHCE8wPEGCP9hnO5/i3tEGkvN1qsIgmZSSPUK21SX5Sk9e8h9ZJEpa
	 VNwC+kx+atZ6ktM0G/nQqhlvXHTzH4Zv3XdoJOJI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F2342F805B4; Fri, 21 Jul 2023 17:19:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1BEA6F805B3;
	Fri, 21 Jul 2023 17:19:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2C213F80571; Fri, 21 Jul 2023 17:18:48 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 0851DF8053B
	for <alsa-devel@alsa-project.org>; Fri, 21 Jul 2023 17:18:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0851DF8053B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=dc6SJ2FN
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 36LDls9i007648;
	Fri, 21 Jul 2023 10:18:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=+qN9Ba/zcDYNDAt+9zFzeFPD1ff0RraaH+W+sIKImwQ=; b=
	dc6SJ2FNsOsplhrRCQK5mo1yVlloyi/xd9hLI1NZBJgVoWb/q6RMMrqvJnoigRVD
	JycnpUXvOHJhX4q18xI5E/1fEqREDB4szx3XJH5IM1ha82PPIp1201u+Lzd/QhBL
	01RnyybVNvU9vTQ382SPJPPiZr6pEZF1HDXrXzCQDcvgdUB4fzz8c84NdRbBVywZ
	5nGztQkraLJlw+4AufS1xHjM2j4faOlrZ7nx/96yhSA0d5rJZg+FPsFj9GoglC1A
	WfKqHXAaJjz0kp31mbOA1iUhBX8HSG9zxj0WYDoM8sPs4pxh+8Q4KDPKYsOvQueC
	c3Civ8DTIFLqEP8D832QQw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3rus62y8g9-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Jul 2023 10:18:31 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Fri, 21 Jul
 2023 16:18:28 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.30 via Frontend
 Transport; Fri, 21 Jul 2023 16:18:28 +0100
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (unknown [198.90.238.219])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 07EFD356D;
	Fri, 21 Jul 2023 15:18:28 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi
 Iwai <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Stefan Binding
	<sbinding@opensource.cirrus.com>
Subject: [PATCH v2 10/11] ALSA: hda: cs35l41: Add device_link between HDA and
 cs35l41_hda
Date: Fri, 21 Jul 2023 16:18:15 +0100
Message-ID: <20230721151816.2080453-11-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230721151816.2080453-1-sbinding@opensource.cirrus.com>
References: <20230721151816.2080453-1-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 2dsoBclobFEZFRn5mXdmJz0zok46XmqN
X-Proofpoint-ORIG-GUID: 2dsoBclobFEZFRn5mXdmJz0zok46XmqN
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: N2XA2WL5HGCWNFPU46IKDZFPPFVC7AWR
X-Message-ID-Hash: N2XA2WL5HGCWNFPU46IKDZFPPFVC7AWR
X-MailFrom: prvs=2566513517=sbinding@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/N2XA2WL5HGCWNFPU46IKDZFPPFVC7AWR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

To ensure consistency between the HDA core and the CS35L41 HDA
driver, add a device_link between them. This ensures that the
HDA core will suspend first, and resume second, meaning the
amp driver will not miss any events from the playback hook from
the HDA core during system suspend and resume.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/pci/hda/cs35l41_hda.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index 70aa819cfbd64..175378cdf9dfa 100644
--- a/sound/pci/hda/cs35l41_hda.c
+++ b/sound/pci/hda/cs35l41_hda.c
@@ -1063,6 +1063,7 @@ static int cs35l41_hda_bind(struct device *dev, struct device *master, void *mas
 {
 	struct cs35l41_hda *cs35l41 = dev_get_drvdata(dev);
 	struct hda_component *comps = master_data;
+	unsigned int sleep_flags;
 	int ret = 0;
 
 	if (!comps || cs35l41->index < 0 || cs35l41->index >= HDA_MAX_COMPONENTS)
@@ -1102,6 +1103,11 @@ static int cs35l41_hda_bind(struct device *dev, struct device *master, void *mas
 
 	mutex_unlock(&cs35l41->fw_mutex);
 
+	sleep_flags = lock_system_sleep();
+	if (!device_link_add(&comps->codec->core.dev, cs35l41->dev, DL_FLAG_STATELESS))
+		dev_warn(dev, "Unable to create device link\n");
+	unlock_system_sleep(sleep_flags);
+
 	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 
@@ -1112,9 +1118,14 @@ static void cs35l41_hda_unbind(struct device *dev, struct device *master, void *
 {
 	struct cs35l41_hda *cs35l41 = dev_get_drvdata(dev);
 	struct hda_component *comps = master_data;
+	unsigned int sleep_flags;
 
-	if (comps[cs35l41->index].dev == dev)
+	if (comps[cs35l41->index].dev == dev) {
 		memset(&comps[cs35l41->index], 0, sizeof(*comps));
+		sleep_flags = lock_system_sleep();
+		device_link_remove(&comps->codec->core.dev, cs35l41->dev);
+		unlock_system_sleep(sleep_flags);
+	}
 }
 
 static const struct component_ops cs35l41_hda_comp_ops = {
-- 
2.34.1

