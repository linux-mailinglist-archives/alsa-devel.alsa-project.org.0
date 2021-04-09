Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD14C35A895
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Apr 2021 00:04:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F462168C;
	Sat, 10 Apr 2021 00:03:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F462168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618005876;
	bh=KDCGOo5AqndK0Ik4SnhT0ZpHAcLlPT5jH7aJ2r770ek=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EWsKo99OWP6DT1b7lAN5CHXXOB2rdoveiT1Ii+OwsQKkwXIgr59yhcxR/Eot8NQs3
	 S1IzQwyrNv7F2GotVqEml7XiJV7yTBcMxVB0Yd7BVfrybWwzF2tmjeCZ3ISBnGpCu8
	 u5hHCSf/nULGPdNWm2j71k98LZX73Qkkq+Dre+AE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67EFBF80482;
	Sat, 10 Apr 2021 00:01:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E1EFBF8042F; Sat, 10 Apr 2021 00:01:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DB276F80260
 for <alsa-devel@alsa-project.org>; Sat, 10 Apr 2021 00:01:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB276F80260
IronPort-SDR: MQodrjbAEdTxceAXESrfWXzMbv9a9Dlf/yIPRge/Cla5Oe5Wzsr5CG7Xdu2XIS5VaxrrOxKnHL
 Ntnro1O+6hqQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9949"; a="214284734"
X-IronPort-AV: E=Sophos;i="5.82,210,1613462400"; d="scan'208";a="214284734"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2021 15:01:39 -0700
IronPort-SDR: ev2Xmty/kfStGth8MxbM83LPaZyAm7G+hYnpeoerKK/SEsOoKPVTYE7VY/d0HVjMhyxXKM5cac
 1lIEx8L17tmg==
X-IronPort-AV: E=Sophos;i="5.82,210,1613462400"; d="scan'208";a="599290644"
Received: from ukorat-mobl2.amr.corp.intel.com (HELO rsridh-mobl1.localdomain)
 ([10.212.104.152])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2021 15:01:38 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 5/6] ASoC: SOF: pcm: export snd_pcm_dai_link_fixup
Date: Fri,  9 Apr 2021 15:01:20 -0700
Message-Id: <20210409220121.1542362-6-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210409220121.1542362-1-ranjani.sridharan@linux.intel.com>
References: <20210409220121.1542362-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Daniel Baluta <daniel.baluta@gmail.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org
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

In preparation of the nocodec refactoring, export the dai-link
fixup. This will also be required when we have more clients and
platform drivers.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@gmail.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/pcm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index d6b1c8b7bdfb..9893b182da43 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -775,6 +775,7 @@ int sof_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd, struct snd_pcm_hw_pa
 
 	return 0;
 }
+EXPORT_SYMBOL(sof_pcm_dai_link_fixup);
 
 static int sof_pcm_probe(struct snd_soc_component *component)
 {
-- 
2.25.1

