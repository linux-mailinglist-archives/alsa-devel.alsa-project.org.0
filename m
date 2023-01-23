Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F485677A86
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Jan 2023 13:05:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2CEB841FE;
	Mon, 23 Jan 2023 13:04:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2CEB841FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674475537;
	bh=gr6Yuo3I6+ldp2z56tMGOkQzM3vS3O1j0msUR4Kdo6U=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=Z0Qo6yrVKrcPH+r7YJslmekOrS48KMP6drMUm8G09w/965RcW6VFKUadKTDaA25Nc
	 0wDKpo6C9+k0afKpFmNHsn0v06Ew6wXN9qbkviQlWqEBOhS3NzvZUUg/Q4sFIhnTwA
	 1L0zJMPv1QbCiiAIdJ1ScnScDnkTlusPQLHFZXuk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 02BAAF80132;
	Mon, 23 Jan 2023 13:04:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C366CF804C2; Mon, 23 Jan 2023 13:04:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8BCF2F80132
 for <alsa-devel@alsa-project.org>; Mon, 23 Jan 2023 13:04:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8BCF2F80132
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=NZaA2JBd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674475473; x=1706011473;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gr6Yuo3I6+ldp2z56tMGOkQzM3vS3O1j0msUR4Kdo6U=;
 b=NZaA2JBdW7yPYLrCoGjjaIzU2NlyGdc9wiXzb2ec35smGcKDpCSbY0NC
 srJdOhROnZHMI4mT7PvnCNCDYoKUq7HzazH/A5hwi9FPb55MrBgqwKfNe
 TwyUC5ZGHl1h9vjLJyN1/yXP67t2tYPZdq5qHi9h53vGGerFqGQcCvcJG
 zwbazaJEgk0QD27NtxiKXA2WiUChpU4y/s456jRgc5r1tP6NUpJMFC+4s
 XSAz7IhD/dlFIhFMfq00gNT+pqjK/eY05t8snZr5BYWK7Vua/1GC3fzpB
 GNQDoEZ1Y3c6zSlj6V3YG794r4hm/oKn1DruW/Z4uUIJDF63X9WuRd2n3 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="353285699"
X-IronPort-AV: E=Sophos;i="5.97,239,1669104000"; d="scan'208";a="353285699"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2023 04:04:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="769779486"
X-IronPort-AV: E=Sophos;i="5.97,239,1669104000"; d="scan'208";a="769779486"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga002.fm.intel.com with ESMTP; 23 Jan 2023 04:04:28 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH] ASoC: Intel: avs: Simplify probe-component implementation
Date: Mon, 23 Jan 2023 13:21:44 +0100
Message-Id: <20230123122144.1356890-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

There is no need for the probe-component to be part of the PCM component
list as it does not make use of ASoC-topology and does not participate
in creating any PCM streams.

To achieve that, remove probe() and remove() functions.

Fixes: ed914a2a45a4 ("ASoC: Intel: avs: Data probing soc-component")
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---

This change should be part of the initial series [1] from the get-go,
differences between the internal tree and the external one caused me to
miss the change when upstreaming. And thus the "fixes" tag.


[1]: https://lore.kernel.org/all/20221202152841.672536-1-cezary.rojewski@intel.com/

 sound/soc/intel/avs/probes.c | 23 -----------------------
 1 file changed, 23 deletions(-)

diff --git a/sound/soc/intel/avs/probes.c b/sound/soc/intel/avs/probes.c
index 29d63f2a9616..b04f2d1a4c07 100644
--- a/sound/soc/intel/avs/probes.c
+++ b/sound/soc/intel/avs/probes.c
@@ -277,31 +277,8 @@ static struct snd_soc_dai_driver probe_cpu_dais[] = {
 },
 };
 
-static int avs_probe_component_probe(struct snd_soc_component *component)
-{
-	struct avs_soc_component *acomp = to_avs_soc_component(component);
-	struct avs_dev *adev = to_avs_dev(component->dev);
-
-	mutex_lock(&adev->comp_list_mutex);
-	list_add_tail(&acomp->node, &adev->comp_list);
-	mutex_unlock(&adev->comp_list_mutex);
-	return 0;
-}
-
-static void avs_probe_component_remove(struct snd_soc_component *component)
-{
-	struct avs_soc_component *acomp = to_avs_soc_component(component);
-	struct avs_dev *adev = to_avs_dev(component->dev);
-
-	mutex_lock(&adev->comp_list_mutex);
-	list_del(&acomp->node);
-	mutex_unlock(&adev->comp_list_mutex);
-}
-
 static const struct snd_soc_component_driver avs_probe_component_driver = {
 	.name			= "avs-probe-compr",
-	.probe			= avs_probe_component_probe,
-	.remove			= avs_probe_component_remove,
 	.compress_ops		= &avs_probe_compress_ops,
 	.module_get_upon_open	= 1, /* increment refcount when a stream is opened */
 };
-- 
2.25.1

