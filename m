Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE5F68656F
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Feb 2023 12:30:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9DDAC868;
	Wed,  1 Feb 2023 12:29:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9DDAC868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675251038;
	bh=f/IuMQXWQgsvip32dGWCsB0+gTrfk/NU8TOVayzClK0=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=IVv9csld/1Gr+oW12Pd3NbcAZcYAw+ozVaPVBlJHUuYH15bMHeM2H6ry0K0Tgui2h
	 Izo1qkVnOsXZ1cwsds+IboAJqJCZ9FbLvQQI278of5QJJcdqnLFCt8rCrYpCUUGMgV
	 nCLd3cUqvEwZmZT2wpuT9mkEYzLkIRR8sl0pAm3E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B138FF80528;
	Wed,  1 Feb 2023 12:28:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4DA2DF80423; Wed,  1 Feb 2023 12:28:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B48C3F80155
 for <alsa-devel@alsa-project.org>; Wed,  1 Feb 2023 12:28:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B48C3F80155
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=VrDBZeU2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675250925; x=1706786925;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=f/IuMQXWQgsvip32dGWCsB0+gTrfk/NU8TOVayzClK0=;
 b=VrDBZeU2EeUqqhMhP6sdblFqSbGoHESPp4KxYQTzhz2Lf4huLhQlCm0l
 HG03Ka+vYQwNoK2svBEz++G6fNB8WFuYv0EHbqfngVkjjNVwZOzBNJp9l
 n821bYcyjCM7+11TBS3dtl1+c1Ol2MWTaaSIHM6GhxGZ3grrfXtFZ6YP2
 BmsUpH2u4vcIl8Gwc7FR42kk3Z+x2kWYLRnnNhg1l97NFKWY6lQX1hedW
 eoP21b4LrQdzGPMTMO3k268GiN6+EtQPUccjr7UdFlZKEMh0ar3fhczs2
 Qpsl5c9r954oHKZWFxAjkQqVxmFn94RhwPa93gflr6H4l/8iW7+nremLH A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="329409377"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; d="scan'208";a="329409377"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2023 03:28:42 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="642374223"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; d="scan'208";a="642374223"
Received: from jehdildi-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.31.67])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2023 03:28:39 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org, kuninori.morimoto.gx@renesas.com,
 amadeuszx.slawinski@linux.intel.com
Subject: [PATCH 1/2] ASoC: SOF: topology: Add missed "else" in
 sof_connect_dai_widget
Date: Wed,  1 Feb 2023 13:28:45 +0200
Message-Id: <20230201112846.27707-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230201112846.27707-1-peter.ujfalusi@linux.intel.com>
References: <20230201112846.27707-1-peter.ujfalusi@linux.intel.com>
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
Cc: pierre-louis.bossart@linux.intel.com, cezary.rojewski@intel.com,
 kai.vehmanen@linux.intel.com, alsa-devel@alsa-project.org, tiwai@suse.com,
 ranjani.sridharan@linux.intel.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The conversion to use generic helpers missed the else for the dai
direction check which leads to failure when loading playback widgets

Fixes: 323f09a61d43 ("ASoC: sof: use helper function")
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/topology.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 3cfdf782afca..4a62ccc71fcb 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -1065,7 +1065,7 @@ static int sof_connect_dai_widget(struct snd_soc_component *scomp,
 
 	if (w->id == snd_soc_dapm_dai_out)
 		stream = SNDRV_PCM_STREAM_CAPTURE;
-	if (w->id == snd_soc_dapm_dai_in)
+	else if (w->id == snd_soc_dapm_dai_in)
 		stream = SNDRV_PCM_STREAM_PLAYBACK;
 	else
 		goto end;
-- 
2.39.1

