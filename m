Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC8E42446E
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Oct 2021 19:37:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 71B501685;
	Wed,  6 Oct 2021 19:37:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 71B501685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633541879;
	bh=mpQmWubCNcAfh0LGt+EhT8Z7yCH00Z8EXqdCSRToRPU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lNS0o3d2rBjl1G8aXjigwlXpo4cg5sf2Zrp7n14J/q9JcgCT0cnjTT56C8Etrbwu3
	 feB456xW7G6qPkHZk81+NbU/XKQwSk3zrNoVLYaucIvh6U1OJekDtMsijq2UqLLs1c
	 6BnlkYJZ1sFPaTPsq/MZBX8jFY5yvJjqO52kO9aU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0654EF804F3;
	Wed,  6 Oct 2021 19:35:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4E0B4F804EB; Wed,  6 Oct 2021 19:35:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F9ECF804E6
 for <alsa-devel@alsa-project.org>; Wed,  6 Oct 2021 19:35:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F9ECF804E6
X-IronPort-AV: E=McAfee;i="6200,9189,10129"; a="213182025"
X-IronPort-AV: E=Sophos;i="5.85,352,1624345200"; d="scan'208";a="213182025"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 10:35:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,352,1624345200"; d="scan'208";a="657073962"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga005.jf.intel.com with ESMTP; 06 Oct 2021 10:35:09 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id A8DDB56; Wed,  6 Oct 2021 20:35:15 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/4] ASoC: Intel: bytcht_es8316: Get platform data via
 dev_get_platdata()
Date: Wed,  6 Oct 2021 20:33:46 +0300
Message-Id: <20211006173349.84684-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211006173349.84684-1-andriy.shevchenko@linux.intel.com>
References: <20211006173349.84684-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.com>,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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

Access to platform data via dev_get_platdata() getter to make code cleaner.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.com>
---
 sound/soc/intel/boards/bytcht_es8316.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/boards/bytcht_es8316.c b/sound/soc/intel/boards/bytcht_es8316.c
index 1bb9b8e7bcc7..4360519fbb0c 100644
--- a/sound/soc/intel/boards/bytcht_es8316.c
+++ b/sound/soc/intel/boards/bytcht_es8316.c
@@ -456,12 +456,12 @@ static const struct dmi_system_id byt_cht_es8316_quirk_table[] = {
 
 static int snd_byt_cht_es8316_mc_probe(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
 	static const char * const mic_name[] = { "in1", "in2" };
+	struct snd_soc_acpi_mach *mach = dev_get_platdata(dev);
 	struct property_entry props[MAX_NO_PROPS] = {};
 	struct byt_cht_es8316_private *priv;
 	const struct dmi_system_id *dmi_id;
-	struct device *dev = &pdev->dev;
-	struct snd_soc_acpi_mach *mach;
 	struct fwnode_handle *fwnode;
 	const char *platform_name;
 	struct acpi_device *adev;
@@ -476,7 +476,6 @@ static int snd_byt_cht_es8316_mc_probe(struct platform_device *pdev)
 	if (!priv)
 		return -ENOMEM;
 
-	mach = dev->platform_data;
 	/* fix index of codec dai */
 	for (i = 0; i < ARRAY_SIZE(byt_cht_es8316_dais); i++) {
 		if (!strcmp(byt_cht_es8316_dais[i].codecs->name,
-- 
2.33.0

