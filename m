Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA287627C25
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Nov 2022 12:22:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F5551674;
	Mon, 14 Nov 2022 12:21:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F5551674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668424927;
	bh=Yr/0qBmCgbdb7d38WF85pkRxdBnyu9qE35POEXUdPMk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ui2Z3xrDbx2QEVB8YTLJBQuSbmZJBaA+lASNFxsXqle8srHNaJlQvdSolwl5vZwvc
	 k7lAeMmuYvf+3/KItJArarvX2QL75P21QdFqNBETuyR5DbBjLurzNww3+/i9lXiNMJ
	 V+mhGFkpwdBv1TmZS2CjjDVOIDaxV5iXjDl3TNMA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0DDF2F804E7;
	Mon, 14 Nov 2022 12:20:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4E5DFF804E7; Mon, 14 Nov 2022 12:20:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2AAE9F800B8
 for <alsa-devel@alsa-project.org>; Mon, 14 Nov 2022 12:20:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2AAE9F800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="hWjY+WaE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668424845; x=1699960845;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Yr/0qBmCgbdb7d38WF85pkRxdBnyu9qE35POEXUdPMk=;
 b=hWjY+WaEilWlh5So3Enyrnvr2PGsWMpY+S/xzWJKkf8xFSvLlvNJlRNN
 hfDInu7wDAeCYgDdk3bwaZkJcTqHY0udu8U41DwMrzirOXnhwXwt8WVHo
 PHxoOi04yQ7v9Gss/KAYQso8WLl6F4O7A+efvAkTN2M7gqOsbyXKCY8mC
 cb7BoWra4tJKFhUH0JSH3cO0GDi8I65/djsJE5mxnnS21FdsF9HMsKvfd
 Kj2S5wweupxk2JBe7hhTGhhNElI5gLo8eghxX8X+HVpRuJqLSjSzBcRw2
 dYWERbiip44mYUBOaojgpTiaOU77X+rVwElqiGFTP9XzlIOwFtS7UbZUt g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10530"; a="313748209"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; d="scan'208";a="313748209"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2022 03:20:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10530"; a="744103006"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; d="scan'208";a="744103006"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga002.fm.intel.com with ESMTP; 14 Nov 2022 03:20:40 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v2 2/2] ASoC: Intel: avs: Disconnect substream if suspend or
 resume fails
Date: Mon, 14 Nov 2022 12:37:29 +0100
Message-Id: <20221114113729.1022905-3-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221114113729.1022905-1-cezary.rojewski@intel.com>
References: <20221114113729.1022905-1-cezary.rojewski@intel.com>
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

To improve performance and overall system stability, suspend/resume
operations for ASoC cards always return success status and defer the
actual work.

Because of that, if a substream fails to resume, userspace may still
attempt to invoke commands on it as from their perspective the operation
completed successfully. Set substream's state to DISCONNECTED to ensure
no further commands are attempted.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---

Changes in v2:
- __snd_pcm_set_state() replaced direct assignments of PCM state

 sound/soc/intel/avs/pcm.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index ca624fbb5c0d..70442b5212c2 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -934,8 +934,11 @@ static int avs_component_pm_op(struct snd_soc_component *component, bool be,
 			rtd = snd_pcm_substream_chip(data->substream);
 			if (rtd->dai_link->no_pcm == be && !rtd->dai_link->ignore_suspend) {
 				ret = op(dai, data);
-				if (ret < 0)
+				if (ret < 0) {
+					__snd_pcm_set_state(data->substream->runtime,
+							    SNDRV_PCM_STATE_DISCONNECTED);
 					return ret;
+				}
 			}
 		}
 
@@ -944,8 +947,11 @@ static int avs_component_pm_op(struct snd_soc_component *component, bool be,
 			rtd = snd_pcm_substream_chip(data->substream);
 			if (rtd->dai_link->no_pcm == be && !rtd->dai_link->ignore_suspend) {
 				ret = op(dai, data);
-				if (ret < 0)
+				if (ret < 0) {
+					__snd_pcm_set_state(data->substream->runtime,
+							    SNDRV_PCM_STATE_DISCONNECTED);
 					return ret;
+				}
 			}
 		}
 	}
-- 
2.25.1

