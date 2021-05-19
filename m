Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB48388BA3
	for <lists+alsa-devel@lfdr.de>; Wed, 19 May 2021 12:27:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4938B167E;
	Wed, 19 May 2021 12:26:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4938B167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621420032;
	bh=jzVhF2ZeGV51cFxOvkO27cyAjOGqOeVt9V66MBoXsyI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ghUBKAeeO3ug2sw2L83E3+DD3fTkTXwF+EqJ1vDcfw32ovW+AmRYmoZrMFjuxtBj8
	 ZWF8tsZyOxtp9bnLut1qyjuLXGfzmTze+oRlofMvADgRBfpWx9zpuGJR/7SZZIC1a0
	 e5g5qb3mUMq+6TYkrOKE/Ru1ettQaDd86mbXkPuk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B93E5F8014C;
	Wed, 19 May 2021 12:25:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 67C48F8016E; Wed, 19 May 2021 12:25:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 98148F80148
 for <alsa-devel@alsa-project.org>; Wed, 19 May 2021 12:25:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98148F80148
IronPort-SDR: D8H5kEW6XWN1e1xgwlHvzA82K0GuavDYkt1VMfodX6wzsfhozN9qUdcJ2bPdvc9vTmh8NeNGbd
 eG8BBQ6wxYIg==
X-IronPort-AV: E=McAfee;i="6200,9189,9988"; a="200992459"
X-IronPort-AV: E=Sophos;i="5.82,312,1613462400"; d="scan'208";a="200992459"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2021 03:25:22 -0700
IronPort-SDR: ITzkztDDC63PUaqJxyfrOmOUaH+lfdNOrPjfioaI6txqA6diZAMJTvYYRfjzfu/miMmHxePc3S
 kyAyAiQdZFOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,312,1613462400"; d="scan'208";a="439650270"
Received: from kekkonen.fi.intel.com ([10.237.72.68])
 by fmsmga008.fm.intel.com with ESMTP; 19 May 2021 03:25:20 -0700
From: Jaska Uimonen <jaska.uimonen@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: topology: Fix using uninitialized pointer
Date: Wed, 19 May 2021 13:07:13 +0300
Message-Id: <20210519100713.879958-1-jaska.uimonen@linux.intel.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>
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

The original patch changed kcontrol_type to a pointer. In some goto
cases the pointer is assigned into a struct member as uninitialized and
this will cause a runtime error with UBSan even if it isn't a real bug.
So initialize the pointer to NULL.

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Fixes: d29d41e28eea ("ASoC: topology: Add support for multiple kcontrol types to a widget")
Signed-off-by: Jaska Uimonen <jaska.uimonen@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/soc-topology.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index e71d98d7b116..5e65b72910e9 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -1422,7 +1422,7 @@ static int soc_tplg_dapm_widget_create(struct soc_tplg *tplg,
 	struct snd_soc_dapm_widget template, *widget;
 	struct snd_soc_tplg_ctl_hdr *control_hdr;
 	struct snd_soc_card *card = tplg->comp->card;
-	unsigned int *kcontrol_type;
+	unsigned int *kcontrol_type = NULL;
 	struct snd_kcontrol_new *kc;
 	int mixer_count = 0;
 	int bytes_count = 0;
-- 
2.24.1

