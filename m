Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3936B56FD49
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Jul 2022 11:53:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93645823;
	Mon, 11 Jul 2022 11:52:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93645823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657533215;
	bh=SGu3Iez0MNumhaZ/Y5N82y7aeHKR+TFgV9GmQXULqtk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TR+Cfpfs7YMB/LD2buFOWAcKkzDJIXlXmh7QbXuvsAIyFYNNlDPXQBL+qwHASLuj6
	 sEfcbylPSO1yPF66a1UPCLqrkALkqeDNmTnFpHCNFcwoCzZ/vRDiJ8CS+jI4WKfEyj
	 BS0KVZ14Fdk+xilbo3mEV36ERF63IqjjS/tUoTA0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E3340F804D6;
	Mon, 11 Jul 2022 11:52:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24F9FF804D6; Mon, 11 Jul 2022 11:52:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 45CB4F800E8
 for <alsa-devel@alsa-project.org>; Mon, 11 Jul 2022 11:52:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45CB4F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="OgzJyXa5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657533147; x=1689069147;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SGu3Iez0MNumhaZ/Y5N82y7aeHKR+TFgV9GmQXULqtk=;
 b=OgzJyXa5zVH5/gsKXxYIgJVQ4q2C/2QyiVmBka4UzoN0z64NKRnF/lU2
 cGG5uFauR8mE7rUvqN6YtQjjn3MDKtw+OrUg57DgaKhmpoJ+eQaMh/GJo
 SromcaoYXZKLEqU/ILZW7iG43UE8kd6SlFWcpUfOw3zf/dhjTX8HEK7r6
 LOblCtNKrzQ0cDR96CQ9yUhZ/sdyRgY9CdzojmtWd3106J4rNRoU8fwn5
 bPJAlt8sQ096QEiPDEIId1XSmr2mm63EG5inGL1NnyIcs4bdkMOBBAo4Z
 E7Cm77jAauow05XmJILSrHeRB5tNLlj61zKYkFkFu/T9Nc8RDGMhTzASo w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10404"; a="264398003"
X-IronPort-AV: E=Sophos;i="5.92,262,1650956400"; d="scan'208";a="264398003"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2022 02:52:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,262,1650956400"; d="scan'208";a="662485655"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga004.fm.intel.com with ESMTP; 11 Jul 2022 02:52:18 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 6AEBE1A0; Mon, 11 Jul 2022 12:52:26 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Takashi Iwai <tiwai@suse.de>,
 Lucas Tanure <tanureal@opensource.cirrus.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
Subject: [PATCH v1 1/4] ALSA: hda: cs35l41: Improve dev_err_probe() messaging
Date: Mon, 11 Jul 2022 12:52:16 +0300
Message-Id: <20220711095219.36915-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>,
 James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>, Takashi Iwai <tiwai@suse.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Drop duplicate print of returned value in the messages and use pattern
return dev_err_probe(...) where it's possible.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 sound/pci/hda/cs35l41_hda.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index cce27a86267f..23a97ada7272 100644
--- a/sound/pci/hda/cs35l41_hda.c
+++ b/sound/pci/hda/cs35l41_hda.c
@@ -460,10 +460,8 @@ int cs35l41_hda_probe(struct device *dev, const char *device_name, int id, int i
 	dev_set_drvdata(dev, cs35l41);
 
 	ret = cs35l41_hda_read_acpi(cs35l41, device_name, id);
-	if (ret) {
-		dev_err_probe(cs35l41->dev, ret, "Platform not supported %d\n", ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(cs35l41->dev, ret, "Platform not supported\n");
 
 	if (IS_ERR(cs35l41->reset_gpio)) {
 		ret = PTR_ERR(cs35l41->reset_gpio);
@@ -471,7 +469,7 @@ int cs35l41_hda_probe(struct device *dev, const char *device_name, int id, int i
 		if (ret == -EBUSY) {
 			dev_info(cs35l41->dev, "Reset line busy, assuming shared reset\n");
 		} else {
-			dev_err_probe(cs35l41->dev, ret, "Failed to get reset GPIO: %d\n", ret);
+			dev_err_probe(cs35l41->dev, ret, "Failed to get reset GPIO\n");
 			goto err;
 		}
 	}
-- 
2.35.1

