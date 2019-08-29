Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE12DA1EA3
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Aug 2019 17:14:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78E891720;
	Thu, 29 Aug 2019 17:14:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78E891720
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567091690;
	bh=q5brZDA4HHIEe78ZE+seyFIs/UC0rg++EXSdaGtCnpw=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hk0pslMLyY6g/QVVdnuSGCO11H7ZK5DUZu5xyWQA9d7HA+YtiF62YHMs9XT5p2OQ4
	 Tztc6DI+6jFqK9miihSMvMCzO2nW/vQG4t0GSxcClVu8vcdh5C/9h+okIiOJ+9PeVu
	 ys5n5Hxxr1DRFKcETIiboGMJb2NvT86R4nc3Lk4w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE6DAF898A1;
	Thu, 29 Aug 2019 15:54:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0686BF8989D; Thu, 29 Aug 2019 15:54:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1937DF89893
 for <alsa-devel@alsa-project.org>; Thu, 29 Aug 2019 15:54:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1937DF89893
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Aug 2019 06:54:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,443,1559545200"; d="scan'208";a="182349410"
Received: from zeliteleevi.tm.intel.com ([10.237.55.130])
 by fmsmga007.fm.intel.com with ESMTP; 29 Aug 2019 06:54:22 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de
Date: Thu, 29 Aug 2019 16:53:47 +0300
Message-Id: <20190829135348.23569-7-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190829135348.23569-1-kai.vehmanen@linux.intel.com>
References: <20190829135348.23569-1-kai.vehmanen@linux.intel.com>
Cc: libin.yang@intel.com, pierre-louis.bossart@linux.intel.com,
 kai.vehmanen@linux.intel.com
Subject: [alsa-devel] [RFC PATCH 6/7] ALSA: hda/hdmi - complete
	pcm_setup_pin without snd_pcm link
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

When used with e.g. SOF, the PCM entity is handled by ASoC and
there is no direct link from the HDA codec to the snd_pcm_t
object. Remaining configuration steps of hdmi_pcm_setup_pin()
should still be done in this case.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/pci/hda/patch_hdmi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index 4372c87c48f0..65afb833c125 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -1386,8 +1386,6 @@ static void hdmi_pcm_setup_pin(struct hdmi_spec *spec,
 		pcm = get_pcm_rec(spec, per_pin->pcm_idx);
 	else
 		return;
-	if (!pcm->pcm)
-		return;
 	if (!test_bit(per_pin->pcm_idx, &spec->pcm_in_use))
 		return;
 
@@ -1408,8 +1406,10 @@ static void hdmi_pcm_setup_pin(struct hdmi_spec *spec,
 	snd_hda_spdif_ctls_assign(codec, per_pin->pcm_idx, hinfo->nid);
 
 	non_pcm = check_non_pcm_per_cvt(codec, hinfo->nid);
-	if (substream->runtime)
-		per_pin->channels = substream->runtime->channels;
+	if (pcm->pcm) {
+		if (substream->runtime)
+			per_pin->channels = substream->runtime->channels;
+	}
 	per_pin->setup = true;
 	per_pin->mux_idx = mux_idx;
 
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
