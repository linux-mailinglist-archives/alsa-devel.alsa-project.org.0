Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D8142F7FB
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Oct 2021 18:18:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 47BF3182D;
	Fri, 15 Oct 2021 18:17:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 47BF3182D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634314724;
	bh=ILHZJYRigU931UgIfc50nrd5ZO2J9FTaHfMBAEbawYk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m94nReN3xwqYx9RwH8WSvHMlJ7aCsJKtqtg34yWgD9qZhR3poieKTj7YeCE4kJ398
	 hL8y7fl2nWIx52qluNHX4dKMTywWdEoNJl3C8ufu0xZSF/Ek2giD4M4OzJLEdixqF4
	 WrpIIDx4fiGgdJP286rs0ersp4iV0NZTL3pT58Qc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DDF0DF804FD;
	Fri, 15 Oct 2021 18:16:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5B9A1F80269; Fri, 15 Oct 2021 18:15:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E48F1F8012E
 for <alsa-devel@alsa-project.org>; Fri, 15 Oct 2021 18:15:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E48F1F8012E
X-IronPort-AV: E=McAfee;i="6200,9189,10138"; a="225404684"
X-IronPort-AV: E=Sophos;i="5.85,376,1624345200"; d="scan'208";a="225404684"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2021 09:11:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,376,1624345200"; d="scan'208";a="564375298"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by FMSMGA003.fm.intel.com with ESMTP; 15 Oct 2021 09:11:18 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 5/6] ASoC: topology: Change topology device to card device
Date: Fri, 15 Oct 2021 18:12:56 +0200
Message-Id: <20211015161257.27052-6-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015161257.27052-1-cezary.rojewski@intel.com>
References: <20211015161257.27052-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com,
 Cezary Rojewski <cezary.rojewski@intel.com>, tiwai@suse.com,
 hdegoede@redhat.com, broonie@kernel.org,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
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

From: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>

Topology needs device for prints and resource allocation. So far,
component->dev is used. However, this may lead to high memory use in
model where card is an independent driver which can be reloaded and
topology is loaded from component's probe() method. Every time machine
driver is reloaded topology is being loaded anew, each time allocating
new memory. Said memory will only be freed when component itself is
being freed.

Address the problem by tying topology to component->card->dev instead,
so memory occupied by the topology is freed whenever related machine
device gets removed.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/soc-topology.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 712b706af677..53b8f88998e7 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -2668,17 +2668,17 @@ int snd_soc_tplg_component_load(struct snd_soc_component *comp,
 	/*
 	 * check if we have sane parameters:
 	 * comp - needs to exist to keep and reference data while parsing
-	 * comp->dev - used for resource management and prints
 	 * comp->card - used for setting card related parameters
+	 * comp->card->dev - used for resource management and prints
 	 * fw - we need it, as it is the very thing we parse
 	 */
-	if (!comp || !comp->dev || !comp->card || !fw)
+	if (!comp || !comp->card || !comp->card->dev || !fw)
 		return -EINVAL;
 
 	/* setup parsing context */
 	memset(&tplg, 0, sizeof(tplg));
 	tplg.fw = fw;
-	tplg.dev = comp->dev;
+	tplg.dev = comp->card->dev;
 	tplg.comp = comp;
 	if (ops) {
 		tplg.ops = ops;
-- 
2.25.1

