Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D2AAB2F6300
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Jan 2021 15:23:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C77316BD;
	Thu, 14 Jan 2021 15:22:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C77316BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610634229;
	bh=WYkDQFcOisI01Y2kvy0bGM+km/h9TQOjXmA1xDI99bc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D/MV9osb1JLcm52eAJ482xm+WYeBz7wcDRTP36BY2DOPRKrLfJvsBM3qbj1xfqgYz
	 B+K6tQNPe089tzKZwKEq28OzkzOo6CWMeA/HI153gmRMHkis/GMi9kRTq+Q+2xmKMA
	 nSXKZa+wiWORwHvA6ypVevaG2hW/j1vSsLDrvcvc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E557F804CC;
	Thu, 14 Jan 2021 15:21:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7AC3F804C2; Thu, 14 Jan 2021 15:21:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8FC74F80249
 for <alsa-devel@alsa-project.org>; Thu, 14 Jan 2021 15:21:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8FC74F80249
IronPort-SDR: c8b8GWjLk7hf9dHL76fcqjFEnmFSDIWuxFm3Y/DF3/l0JlD3BxCTaAVEiag2DtVDvRSglYXKkT
 ljHzRsB7Qaow==
X-IronPort-AV: E=McAfee;i="6000,8403,9863"; a="175792529"
X-IronPort-AV: E=Sophos;i="5.79,347,1602572400"; d="scan'208";a="175792529"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2021 06:21:21 -0800
IronPort-SDR: +cXAz4qe1OFDauS8UhH2wNX39r08PLUAbOrnmx2raamEVciBq78ANrgy0l43knT+vf+jdfVrg0
 V/IbFshcVPjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,347,1602572400"; d="scan'208";a="400912808"
Received: from pi-desktop.igk.intel.com ([10.237.148.102])
 by fmsmga002.fm.intel.com with ESMTP; 14 Jan 2021 06:21:18 -0800
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 2/2] ASoC: topology: Check if ops is set before dereference
Date: Thu, 14 Jan 2021 11:36:02 -0500
Message-Id: <20210114163602.911205-3-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210114163602.911205-1-amadeuszx.slawinski@linux.intel.com>
References: <20210114163602.911205-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
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

Topology can be created without ops overrides, in that case trying to
assign any value would lead to dereferencing NULL pointer.

Other places in code have either checks for tplg->ops or loop using
*_count variables, hence they can't dereference NULL pointer and there
is no need to add more checks.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/soc-topology.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 0d182a190c98..5476854c12b0 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -2674,11 +2674,13 @@ int snd_soc_tplg_component_load(struct snd_soc_component *comp,
 	tplg.fw = fw;
 	tplg.dev = comp->dev;
 	tplg.comp = comp;
-	tplg.ops = ops;
-	tplg.io_ops = ops->io_ops;
-	tplg.io_ops_count = ops->io_ops_count;
-	tplg.bytes_ext_ops = ops->bytes_ext_ops;
-	tplg.bytes_ext_ops_count = ops->bytes_ext_ops_count;
+	if (ops) {
+		tplg.ops = ops;
+		tplg.io_ops = ops->io_ops;
+		tplg.io_ops_count = ops->io_ops_count;
+		tplg.bytes_ext_ops = ops->bytes_ext_ops;
+		tplg.bytes_ext_ops_count = ops->bytes_ext_ops_count;
+	}
 
 	ret = soc_tplg_load(&tplg);
 	/* free the created components if fail to load topology */
-- 
2.25.1

