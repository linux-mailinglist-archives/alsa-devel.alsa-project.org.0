Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E56220A5A9
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jun 2020 21:21:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44FB81ACB;
	Thu, 25 Jun 2020 21:20:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44FB81ACB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593112898;
	bh=1ZK9pWXYsSrDzDAcXnKPogR5dLErUuefvlHwJP3peak=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=unTvRG+9hQISFLlXOKSgcmI6vGw0nF9WdL93b36boayZ69Vh124SwRRjHfIv7+OPQ
	 yZ2CSeSBa9FKwDG1dJgs+Mpomtk5MvIc/AdAXvmMk+AO9tH0U9toRwr8jQQLxkqV0B
	 jr5GtmEb8a89ymOCE7AiaJQlpAR2Tz67IPiG+eNM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1BA36F80332;
	Thu, 25 Jun 2020 21:14:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5EFE9F802C4; Thu, 25 Jun 2020 21:14:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C6869F802C4
 for <alsa-devel@alsa-project.org>; Thu, 25 Jun 2020 21:13:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6869F802C4
IronPort-SDR: Z2oc9zBw29sEbxII/Ryhc5X2X52n3sZgGKLAG4RcUj4eJr6ZpTFH1tCvSlEXKsHfvovIa26TQQ
 s/IS7VePs9xQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9663"; a="144120827"
X-IronPort-AV: E=Sophos;i="5.75,280,1589266800"; d="scan'208";a="144120827"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2020 12:13:40 -0700
IronPort-SDR: l+4J65UvcGG4MbDycU1f0B6WORH5jTW4CLZQJiNrJL3r6TGnCLKIHVKLmztG5Ky7Q6WgfZLpmR
 4SUlpqF6Nsog==
X-IronPort-AV: E=Sophos;i="5.75,280,1589266800"; d="scan'208";a="354559524"
Received: from zeqimao-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.109.39])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2020 12:13:39 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 10/17] ASoC: Intel: Boards: cml_rt1011_rt5682: reduce log
 level for printing quirk
Date: Thu, 25 Jun 2020 14:13:01 -0500
Message-Id: <20200625191308.3322-11-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200625191308.3322-1-pierre-louis.bossart@linux.intel.com>
References: <20200625191308.3322-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Fred Oh <fred.oh@linux.intel.com>, broonie@kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

From: Fred Oh <fred.oh@linux.intel.com>

Change dev_info to dev_dbg to reduce noise during multiple deferred
probes.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Fred Oh <fred.oh@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/cml_rt1011_rt5682.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/cml_rt1011_rt5682.c b/sound/soc/intel/boards/cml_rt1011_rt5682.c
index 6e8934f348ef..4ad6a3acf887 100644
--- a/sound/soc/intel/boards/cml_rt1011_rt5682.c
+++ b/sound/soc/intel/boards/cml_rt1011_rt5682.c
@@ -536,7 +536,7 @@ static int snd_cml_rt1011_probe(struct platform_device *pdev)
 
 	dmi_check_system(sof_rt1011_quirk_table);
 
-	dev_info(&pdev->dev, "sof_rt1011_quirk = %lx\n", sof_rt1011_quirk);
+	dev_dbg(&pdev->dev, "sof_rt1011_quirk = %lx\n", sof_rt1011_quirk);
 
 	if (sof_rt1011_quirk & (SOF_RT1011_SPEAKER_TL |
 				SOF_RT1011_SPEAKER_TR)) {
-- 
2.20.1

