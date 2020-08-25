Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8DC252493
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Aug 2020 02:01:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8411716F8;
	Wed, 26 Aug 2020 02:01:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8411716F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598400113;
	bh=4Y1j689QgzdbOGnyFYssL2GyGI1DoDVb0jbh03ESaxA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jQ476vviFUyGJkDkQ3FnjNgHMrwHCd8zEa7nfrtQNovPNvjNcGh2qkaZgcYMUKkDe
	 rNmaDg119rRCEFYt+P4OQsgnwNIahKmyXCVK0WWDr+b3qXPL7bpdz1bqjaZYLckHcZ
	 cUE6469RU4dWX8F9kgxe1+cUEpYFFJ2LJmRZGzl4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E6FC5F80260;
	Wed, 26 Aug 2020 01:59:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ABD64F802C2; Wed, 26 Aug 2020 01:59:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 19C9DF80143
 for <alsa-devel@alsa-project.org>; Wed, 26 Aug 2020 01:59:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19C9DF80143
IronPort-SDR: v0Oc+k9A8/6tRnNJq1cFEuPCsDhbs4D6pDYDLyWP6W59mQKEMxJY64qg6x22ix+afz9hOd3dMx
 t+m6ZMoJjIzw==
X-IronPort-AV: E=McAfee;i="6000,8403,9724"; a="135764551"
X-IronPort-AV: E=Sophos;i="5.76,354,1592895600"; d="scan'208";a="135764551"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2020 16:59:04 -0700
IronPort-SDR: 18SvDN6Qir/t8wxDQlKudvcW6F0Um6rWJmjbxMYGDmju7jVAfQYJiiQ0fL9WQsiAwPgZjE+jAv
 8fijXQRKFojg==
X-IronPort-AV: E=Sophos;i="5.76,354,1592895600"; d="scan'208";a="474558907"
Received: from cdurvasu-mobl2.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.209.42.42])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2020 16:59:03 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/4] ASoC: SOF: loader: fix memory leak in get_ext_windows
Date: Tue, 25 Aug 2020 16:58:52 -0700
Message-Id: <20200825235854.1588034-3-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200825235854.1588034-1-ranjani.sridharan@linux.intel.com>
References: <20200825235854.1588034-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Daniel Baluta <daniel.baluta@gmail.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 Karol Trzcinski <karolx.trzcinski@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

sdev->info_window is allocated with kmemdup and never freed, use devm_
version since this is only used for first boot.

Fixes: 8d809c15acf23 ('ASoC: SOF: ext_manifest: parse windows')
Cc: Karol Trzcinski <karolx.trzcinski@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@gmail.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/loader.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/loader.c b/sound/soc/sof/loader.c
index 25dc28ebafb7..42e0e3e58869 100644
--- a/sound/soc/sof/loader.c
+++ b/sound/soc/sof/loader.c
@@ -33,7 +33,8 @@ static int get_ext_windows(struct snd_sof_dev *sdev,
 	}
 
 	/* keep a local copy of the data */
-	sdev->info_window = kmemdup(w, ext_hdr->hdr.size, GFP_KERNEL);
+	sdev->info_window = devm_kmemdup(sdev->dev, w, ext_hdr->hdr.size,
+					 GFP_KERNEL);
 	if (!sdev->info_window)
 		return -ENOMEM;
 
-- 
2.25.1

