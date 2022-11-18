Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB25062F36A
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Nov 2022 12:14:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2663F169E;
	Fri, 18 Nov 2022 12:13:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2663F169E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668770087;
	bh=wbHztzX0LrdaYj26nPlHE91DnOkKJAH9TpN51U6CzwU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=flXuXFOiBGeg95fR+Zl0u8pJoAlUctYh36oQTAwEiK/iAMMKji/O0lFphh1qmKqXC
	 feqVqo6nWT5oyTLVfYIn5STCD2+G44iNBpBiPuIzE//pKRpCuZ9N6Us/95RvK0Ih6N
	 JIXqngpiTcHVewq248pEcnHOfg2sO/iSpXpczoMg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A270EF8020D;
	Fri, 18 Nov 2022 12:13:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0E320F801D8; Fri, 18 Nov 2022 12:13:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8581CF800FD
 for <alsa-devel@alsa-project.org>; Fri, 18 Nov 2022 12:13:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8581CF800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="nm34agzV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668770025; x=1700306025;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wbHztzX0LrdaYj26nPlHE91DnOkKJAH9TpN51U6CzwU=;
 b=nm34agzVEVLpyY2yZJ5bIsGun/jdf/dxelkZg6tyZ585oS4RIfKgzikE
 yrHE5GJbslh+7399cBro0YvGA7gVnrOiZcmps5q9uOa2FR+Co3kcw0YMb
 x+Kih4iuSkkoVwg9JKkKnsD25WuusSBeqS6+gjmohWLz3/v+IoGFdl+bE
 ogCv1Ck35ivh61UU9niWtMKibQrJ9ly6O9vZxNuQ1xbFHokKf2xvX9Dxk
 tma91TI6ycqoiK4fsgo+yImdO1L0GezKWgX5uGNIZsTWf3u9qGCo6Irg3
 eAgkdGDodYbifgGzDkwf0ui20F50ZQXgP7vZ6PrR/v3EjYRPvG8bpVm9k Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="311817962"
X-IronPort-AV: E=Sophos;i="5.96,174,1665471600"; d="scan'208";a="311817962"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2022 03:13:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="703710704"
X-IronPort-AV: E=Sophos;i="5.96,174,1665471600"; d="scan'208";a="703710704"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga008.fm.intel.com with ESMTP; 18 Nov 2022 03:13:39 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH] ASoC: Intel: avs: Initialize private data for subsequent HDA
 FEs
Date: Fri, 18 Nov 2022 12:30:52 +0100
Message-Id: <20221118113052.1340593-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com
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

HDAudio implementation found in sound/pci/hda expects a valid stream
pointer in substream->runtime->private_data location. For ASoC users,
that should point to a valid link stream which is assigned when BE
opens.

As BE borrows its runtime from FE, the information may be lost when
reparenting comes into picture - see dpcm_be_reparent(). To support the
DPCM reparenting functionality for HDAudio scenarios while still
fulfilling expectations of HDAudio common code, have all FEs point to
the same private data.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---

This is a tough one and spawned a range of patches. Some of the
discussion is present at thesofproject/linux [1]. In the end decided to
drop any soc-core/pcm.c modifications for now, instead addressing the
problem directly in the avs-driver. Long term - perhaps BE should have a
separate runtime so there is no ambiguity between FE and BE.

[1]: https://github.com/thesofproject/linux/pull/3987

 sound/soc/intel/avs/pcm.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index e237ab23fef9..41030aaae02d 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -1507,9 +1507,29 @@ static int avs_component_hda_open(struct snd_soc_component *component,
 
 	if (!rtd->dai_link->no_pcm) {
 		struct snd_pcm_hardware hwparams = avs_pcm_hardware;
+		struct snd_soc_pcm_runtime *be;
+		struct snd_soc_dpcm *dpcm;
+		int dir = substream->stream;
+
+		/*
+		 * Support the DPCM reparenting while still fulfilling expectations of HDAudio
+		 * common code - a valid stream pointer at substream->runtime->private_data -
+		 * by having all FEs point to the same private data.
+		 */
+		for_each_dpcm_be(rtd, dir, dpcm) {
+			struct snd_pcm_substream *be_substream;
+
+			be = dpcm->be;
+			if (be->dpcm[dir].users == 1)
+				break;
+
+			be_substream = snd_soc_dpcm_get_substream(be, dir);
+			substream->runtime->private_data = be_substream->runtime->private_data;
+			break;
+		}
 
 		/* RESUME unsupported for de-coupled HD-Audio capture. */
-		if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+		if (dir == SNDRV_PCM_STREAM_CAPTURE)
 			hwparams.info &= ~SNDRV_PCM_INFO_RESUME;
 
 		return snd_soc_set_runtime_hwparams(substream, &hwparams);
-- 
2.25.1

