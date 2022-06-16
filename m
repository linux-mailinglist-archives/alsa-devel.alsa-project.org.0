Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B9E54ED20
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jun 2022 00:09:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9EB891B2D;
	Fri, 17 Jun 2022 00:08:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9EB891B2D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655417341;
	bh=EB2/ghYX0CjgXaTRz9Ew0BwzZE1/EU2YhFYqdXMaUyA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XzhXtxnn43iLIpo6PIT4W3EqfQ5nKRjcAJUtapGLEyBg6ulPBZUTgOS0pQl57NLRZ
	 oueZ6coJmmau6I997NIWvBiuBptCP5J69YBmI4A2cZWldu9DwCUQU2xRD1iP/9TAEC
	 vezFEzY93yPjW1liz1XkmqwgE4hEjQbP0N4juAws=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A27CBF80587;
	Fri, 17 Jun 2022 00:05:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 22D7FF80548; Fri, 17 Jun 2022 00:04:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3EE3AF800F0
 for <alsa-devel@alsa-project.org>; Fri, 17 Jun 2022 00:04:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3EE3AF800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="CWco0UfK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655417084; x=1686953084;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EB2/ghYX0CjgXaTRz9Ew0BwzZE1/EU2YhFYqdXMaUyA=;
 b=CWco0UfKS1h6ZAjZk26Wp5QsbC4es9EfZzWh8izwhhgnEWurx06jZJhM
 hvaJ/GjLTvLolPqBdTnhNoajyows+ahXZzixoawcfpIO2scsXsorPRRR1
 6pndfn2IEwlZTCPqSQda2wMAu141/NPVwfSBdFFl8xeZFUwJ9oMs1zF4F
 0qT8INkILyufUt1YdeIoZnjaiJHvqQRv/JHEbqEiqOWKaixoA15smeOb6
 0uB3l85DUulZRQ+gEOxUYIFRPQn4zax8BbPO9jehgZdpiDuRSTrwSJaT1
 IjW8OhkaulBRJdXxd23nMOeM5cedLohozWt0/J8B2g8+1DuIqQx3cDPAO Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="304810920"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="304810920"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 15:04:41 -0700
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="728084980"
Received: from buckkenx-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.52.70])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 15:04:40 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 03/11] ASoC: soc-component: use pm_runtime_resume_and_get()
Date: Thu, 16 Jun 2022 17:04:19 -0500
Message-Id: <20220616220427.136036-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220616220427.136036-1-pierre-louis.bossart@linux.intel.com>
References: <20220616220427.136036-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, tiwai@suse.de,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
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

simplify the flow. No functionality change, except that on -EACCESS
the reference count will be decreased.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/soc-component.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index e12f8244242b9..cb92e002c38bc 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -1213,11 +1213,11 @@ int snd_soc_pcm_component_pm_runtime_get(struct snd_soc_pcm_runtime *rtd,
 	int i;
 
 	for_each_rtd_components(rtd, i, component) {
-		int ret = pm_runtime_get_sync(component->dev);
-		if (ret < 0 && ret != -EACCES) {
-			pm_runtime_put_noidle(component->dev);
+		int ret = pm_runtime_resume_and_get(component->dev);
+
+		if (ret < 0 && ret != -EACCES)
 			return soc_component_ret(component, ret);
-		}
+
 		/* mark stream if succeeded */
 		soc_component_mark_push(component, stream, pm);
 	}
-- 
2.34.1

