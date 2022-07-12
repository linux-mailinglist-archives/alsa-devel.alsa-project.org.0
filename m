Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C368A571AFA
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Jul 2022 15:17:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 752B316A1;
	Tue, 12 Jul 2022 15:16:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 752B316A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657631837;
	bh=E8FgT82F1bdKqowLGwPaaq/9POqi+DBva6OzdITWGJQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GKooajTwYs0qblVsnev6QgZsT7tjDMDE9G/ax1REBiOmiXOSYbbnGDiK+gqdcOPsv
	 NWozYJ4phh6LGt+ayfJRkPVekuupqDxAvrSrXzT8ybj3J8NtHsh9FCTnHGVmeS+fLX
	 TF46InKPQjBaRMrpBVGgJO/6cQsQi1LHFNybStaw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 28598F80246;
	Tue, 12 Jul 2022 15:15:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EE6C2F80506; Tue, 12 Jul 2022 15:15:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 72675F8023B
 for <alsa-devel@alsa-project.org>; Tue, 12 Jul 2022 15:15:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72675F8023B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="f8uFx2Ig"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657631743; x=1689167743;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=E8FgT82F1bdKqowLGwPaaq/9POqi+DBva6OzdITWGJQ=;
 b=f8uFx2Ig0lLbW0PVv23Q6efs2+iQMIG5LVuDbqkliaxZs89NV0uccXAN
 Egm7QG+44fW2FvZz63nFL68XsIy8Oyukg7SgFxIUnIeJTmqCdRT8MnjhD
 aOurwGIx6UEAp8Uid/FdIP0Jp0uMXlgKt+qGHeSuv5YXBiL4vPdL14xNt
 mrs95zW21NaC4jwKLPrztn3NBiVMk83aLOzNxrpN+YZlu+7lLAwSwNGc9
 TFmmw5gS0qwp1PbC09Potkn0jn9yFFZuqsriXQ5e85FNGj1Wb7jwdRYdC
 QoShBJvo2nUP6XKLwuBSpWsgdoKaaRc7A34WKIvpeJeZHXXkLRXp2lWc3 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10405"; a="285671100"
X-IronPort-AV: E=Sophos;i="5.92,265,1650956400"; d="scan'208";a="285671100"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2022 06:15:41 -0700
X-IronPort-AV: E=Sophos;i="5.92,265,1650956400"; d="scan'208";a="545421070"
Received: from ahedstro-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.254.175])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2022 06:15:38 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [PATCH 2/2] ASoC: SOF: Intel: hda-dai: Do
 snd_hdac_ext_stream_decouple() only once
Date: Tue, 12 Jul 2022 16:16:20 +0300
Message-Id: <20220712131620.13365-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220712131620.13365-1-peter.ujfalusi@linux.intel.com>
References: <20220712131620.13365-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com, rander.wang@intel.com
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

Call snd_hdac_ext_stream_decouple_locked() unconditionally in
hda_link_stream_assign(), the snd_hdac_ext_stream_decouple_locked() have
internal checks to avoid re-configuring.

There is no need to call snd_hdac_ext_stream_decouple() via
hda_link_dma_params() as the stream must have been set to decoupled when
it got assigned (even if it used local condition to call
snd_hdac_ext_stream_decouple_locked()).

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/hda-dai.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index 9015ca2024bc..c5b65e4a06be 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -126,12 +126,8 @@ hda_link_stream_assign(struct hdac_bus *bus,
 	}
 
 	if (res) {
-		/*
-		 * Decouple host and link DMA. The decoupled flag
-		 * is updated in snd_hdac_ext_stream_decouple().
-		 */
-		if (!res->decoupled)
-			snd_hdac_ext_stream_decouple_locked(bus, res, true);
+		/* Make sure that host and link DMA is decoupled. */
+		snd_hdac_ext_stream_decouple_locked(bus, res, true);
 
 		res->link_locked = 1;
 		res->link_substream = substream;
@@ -184,7 +180,6 @@ static int hda_link_dma_params(struct hdac_ext_stream *hext_stream,
 	struct hdac_ext_link *link;
 	unsigned int format_val;
 
-	snd_hdac_ext_stream_decouple(bus, hext_stream, true);
 	snd_hdac_ext_link_stream_reset(hext_stream);
 
 	format_val = snd_hdac_calc_stream_format(params->s_freq, params->ch,
-- 
2.37.0

