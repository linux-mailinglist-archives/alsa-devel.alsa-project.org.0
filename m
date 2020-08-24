Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 180E22509D2
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Aug 2020 22:13:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A0621654;
	Mon, 24 Aug 2020 22:12:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A0621654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598299979;
	bh=7ZVRQU6bpyOOIj6mlavtVpe8E1zmnbpIe7PH/MtpUfU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u+spoNw8i0HOP51i3ZmHagA5NDu0L4RdJQGBiNn6tL1zfq5xZHob5yn61s70qcijz
	 t25aeJRMsd+pwu+pMLP+XRvjugUealHayeelk21X8wFnZI6IEzueP5V7xRaVVYLfxu
	 VjHRYGwfAQgyI0ayt0XYUWwaKOuVM+tadyn/u+HE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A8A38F800EB;
	Mon, 24 Aug 2020 22:09:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 11DC6F8025E; Mon, 24 Aug 2020 22:09:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 19CEAF801F2
 for <alsa-devel@alsa-project.org>; Mon, 24 Aug 2020 22:09:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19CEAF801F2
IronPort-SDR: iO9H3vvGPj+36mfEYRlPWV+Oe8HpnAGG0Nv/lbrVk9xSnayLt1xVq/H52W3qmvX8ee1TMdY84I
 uplJYKKAnKgA==
X-IronPort-AV: E=McAfee;i="6000,8403,9723"; a="157033730"
X-IronPort-AV: E=Sophos;i="5.76,349,1592895600"; d="scan'208";a="157033730"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2020 13:09:24 -0700
IronPort-SDR: gmt1pzLGC0f/6ATBoCJwQvwq2XwjIKrY9PJB4i6G7bbA2SoQJm/FVxCo8uXxErUy74wyuVII6D
 /p4e3NOp/C6g==
X-IronPort-AV: E=Sophos;i="5.76,349,1592895600"; d="scan'208";a="443351195"
Received: from dentoneb-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.223.13])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2020 13:09:24 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 4/8] ASoC: SOF: topology: reduce the log level for unhandled
 widgets
Date: Mon, 24 Aug 2020 15:09:08 -0500
Message-Id: <20200824200912.46852-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200824200912.46852-1-pierre-louis.bossart@linux.intel.com>
References: <20200824200912.46852-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 broonie@kernel.org, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Virtual widgets are added to topology to be compatible with legacy
machine drivers. Reduce the log level for messages printed when
such widgets are ignored by the SOF driver.

Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/topology.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 36dc87514dce..707fbac3e64f 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -2374,8 +2374,7 @@ static int sof_widget_ready(struct snd_soc_component *scomp, int index,
 	case snd_soc_dapm_dai_link:
 	case snd_soc_dapm_kcontrol:
 	default:
-		dev_warn(scomp->dev, "warning: widget type %d name %s not handled\n",
-			 swidget->id, tw->name);
+		dev_dbg(scomp->dev, "widget type %d name %s not handled\n", swidget->id, tw->name);
 		break;
 	}
 
-- 
2.25.1

