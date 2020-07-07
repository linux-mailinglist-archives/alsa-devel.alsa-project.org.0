Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB3B217997
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 22:41:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA0011681;
	Tue,  7 Jul 2020 22:40:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA0011681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594154474;
	bh=eYf2e8DitMezGRJLFMi+uGmPotdYr7k/Kp/Gv8MNR/o=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MkeYsdqKM/08AwCh+IfNbisT0n2TEFTF0dmccF3SVScFjHdgZJ5DsWEZ6AfcRJu5d
	 P8+IPrz9Kcovijnvy4J+cwo8092jTBg1ebeJ8PyVekGBR+rppLBO3qtTQro6Tgksdr
	 CIKhZutizLuc3CZOx4mH8K4DShQDgCIJCk5JrqNE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DA013F8027C;
	Tue,  7 Jul 2020 22:38:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 909C9F802A9; Tue,  7 Jul 2020 22:38:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7DCC4F80216
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 22:38:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7DCC4F80216
IronPort-SDR: MmgBVF39DqY0vNiXsjlLSoe3EtpXkMU5cZm7unO8QY8W4ZM7EYf0eUbfbcUkJd0svPpt5Xqf9Q
 SaebQtapd9ng==
X-IronPort-AV: E=McAfee;i="6000,8403,9675"; a="147700569"
X-IronPort-AV: E=Sophos;i="5.75,325,1589266800"; d="scan'208";a="147700569"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 13:38:23 -0700
IronPort-SDR: O9ONgSKI6G9va4EmmGPNrQrRxAI42gB+xvEB4N32NHvvsCEj8q5pyeN+TeRvT/IBdADkvSwhCv
 yJFGJU6t03gg==
X-IronPort-AV: E=Sophos;i="5.75,325,1589266800"; d="scan'208";a="483640808"
Received: from colvinch-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.229.3])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 13:38:22 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/5] ASoC: topology: fix tlvs in error handling for
 widget_dmixer
Date: Tue,  7 Jul 2020 15:37:46 -0500
Message-Id: <20200707203749.113883-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200707203749.113883-1-pierre-louis.bossart@linux.intel.com>
References: <20200707203749.113883-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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

we need to free all allocated tlvs, not just the one allocated in
the loop before releasing kcontrols - other the tlvs references will
leak.

Fixes: 9f90af3a995298 ('ASoC: topology: Consolidate and fix asoc_tplg_dapm_widget_*_create flow')
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/soc-topology.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index f336a9cfc16f..6eaa00c21011 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -1371,7 +1371,6 @@ static struct snd_kcontrol_new *soc_tplg_dapm_widget_dmixer_create(
 		if (err < 0) {
 			dev_err(tplg->dev, "ASoC: failed to init %s\n",
 				mc->hdr.name);
-			soc_tplg_free_tlv(tplg, &kc[i]);
 			goto err_sm;
 		}
 	}
@@ -1379,6 +1378,7 @@ static struct snd_kcontrol_new *soc_tplg_dapm_widget_dmixer_create(
 
 err_sm:
 	for (; i >= 0; i--) {
+		soc_tplg_free_tlv(tplg, &kc[i]);
 		sm = (struct soc_mixer_control *)kc[i].private_value;
 		kfree(sm);
 		kfree(kc[i].name);
-- 
2.25.1

