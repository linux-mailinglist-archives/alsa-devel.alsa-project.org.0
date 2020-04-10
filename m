Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1C41A436F
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Apr 2020 10:16:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2AAD516AB;
	Fri, 10 Apr 2020 10:15:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2AAD516AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586506564;
	bh=JEx8yawejMufLu7maq5+pnznJm+MEbkmXj46mo/wfgc=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pwkOb50XPFfFJdw2m8wX86KbHqS9Ijdfi5sHZdDaic4x8VQu93mS0mNSVTUKuFiKZ
	 HTP3LBebFEz62CHtRM56URRMaFON2XUAzOdfq8tJVkD/+iivwug5dJR2oeRQPzsFGg
	 WzOTD3zxd61cv+xmhT6MWN6e+Gk9Ts15k3Zca/A0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 304D7F8015D;
	Fri, 10 Apr 2020 10:13:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D1F63F80143; Fri, 10 Apr 2020 10:13:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AEC3FF800CB
 for <alsa-devel@alsa-project.org>; Fri, 10 Apr 2020 10:13:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AEC3FF800CB
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 883BBF5DE01656036ADB;
 Fri, 10 Apr 2020 16:12:58 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.487.0; Fri, 10 Apr 2020
 16:12:48 +0800
From: Jason Yan <yanaijie@huawei.com>
To: <cezary.rojewski@intel.com>, <pierre-louis.bossart@linux.intel.com>,
 <liam.r.girdwood@linux.intel.com>, <yang.jie@linux.intel.com>,
 <broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <yung-chuan.liao@linux.intel.com>, <ranjani.sridharan@linux.intel.com>,
 <rander.wang@intel.com>, <christophe.jaillet@wanadoo.fr>,
 <yanaijie@huawei.com>, <alsa-devel@alsa-project.org>
Subject: [PATCH 2/2] ASoC: Intel: soc-acpi-intel-cml-match: remove useless
 'rt1308_2_adr'
Date: Fri, 10 Apr 2020 16:11:17 +0800
Message-ID: <20200410081117.21319-2-yanaijie@huawei.com>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20200410081117.21319-1-yanaijie@huawei.com>
References: <20200410081117.21319-1-yanaijie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.124.28]
X-CFilter-Loop: Reflected
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

Fix the following gcc warning:

sound/soc/intel/common/soc-acpi-intel-cml-match.c:116:45: warning:
‘rt1308_2_adr’ defined but not used [-Wunused-const-variable=]
 static const struct snd_soc_acpi_adr_device rt1308_2_adr[] = {
                                             ^~~~~~~~~~~~

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Jason Yan <yanaijie@huawei.com>
---
 sound/soc/intel/common/soc-acpi-intel-cml-match.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-cml-match.c b/sound/soc/intel/common/soc-acpi-intel-cml-match.c
index bcedec6c6117..7d85bd5aff9f 100644
--- a/sound/soc/intel/common/soc-acpi-intel-cml-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-cml-match.c
@@ -113,14 +113,6 @@ static const struct snd_soc_acpi_adr_device rt1308_1_adr[] = {
 	}
 };
 
-static const struct snd_soc_acpi_adr_device rt1308_2_adr[] = {
-	{
-		.adr = 0x000210025D130800,
-		.num_endpoints = 1,
-		.endpoints = &single_endpoint,
-	}
-};
-
 static const struct snd_soc_acpi_adr_device rt1308_1_group1_adr[] = {
 	{
 		.adr = 0x000110025D130800,
-- 
2.17.2

