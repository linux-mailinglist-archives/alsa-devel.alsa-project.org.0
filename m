Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1013D627C26
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Nov 2022 12:22:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E2C21686;
	Mon, 14 Nov 2022 12:21:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E2C21686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668424948;
	bh=STHsnurNCeZ4coLDpSrI00qVwfgQXzk+lwQOM8qU86g=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QIiGjiA0HeeJsAqUiY11GonRuEhFVdXkDGszaYhKu+gwCRgJNf3Yu0RhWE/bj/E5T
	 pnKTZpPm5Sp3RJd4S0qlYjPNOhZA/ZdrWIHJtwlEB4OQWgzwIE/X2bTHM/BMA0CqzX
	 vMJ1aEkq3CjQa8a5aVNFJqEnBkMNM/rkqIPXkKvo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 980A2F80558;
	Mon, 14 Nov 2022 12:20:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 578E3F80448; Mon, 14 Nov 2022 12:20:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS,
 URIBL_ZEN_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1201FF80245
 for <alsa-devel@alsa-project.org>; Mon, 14 Nov 2022 12:20:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1201FF80245
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="X5RtVu/4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668424845; x=1699960845;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=STHsnurNCeZ4coLDpSrI00qVwfgQXzk+lwQOM8qU86g=;
 b=X5RtVu/4nCyR9rdjV/RguFIDLIM+YslycJeYfuRwsPr3W/I4BX3186+q
 sGon7LoIxlfZiObTRKqkgGRorrcJYyIVFZ1AW/Vo3nnK1BQX2sYVu/IX5
 2R3FLNa8dvlIp1Kb2NnZHdR96caQ6UlFKU16BCQoslK7HQXkDHv4PSdNR
 9DxLxzGFgxRexpLsS/uttMFD44/ysT+tVKT7DR2C7R8cnfc2XYAtfa5Kg
 aIEat7WqQ352U3v/VIKDWsBePPkKMzo20ALES25/seeNZE/FKwl3yyzfG
 ZdH5nwt0JY0BUjTZYldiVEA+rMnO/tFimhU95vq/EseqWeQ1lNCBFie0O w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10530"; a="313748203"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; d="scan'208";a="313748203"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2022 03:20:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10530"; a="744102996"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; d="scan'208";a="744102996"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga002.fm.intel.com with ESMTP; 14 Nov 2022 03:20:38 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v2 1/2] ASoC: Intel: avs: Lock substream before snd_pcm_stop()
Date: Mon, 14 Nov 2022 12:37:28 +0100
Message-Id: <20221114113729.1022905-2-cezary.rojewski@intel.com>
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

snd_pcm_stop() shall be called with stream lock held to prevent any
races between nonatomic streaming operations.

Fixes: 2f1f570cd730 ("ASoC: Intel: avs: Coredump and recovery flow")
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/ipc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/intel/avs/ipc.c b/sound/soc/intel/avs/ipc.c
index 152f8d0bdf8e..07655298b6c7 100644
--- a/sound/soc/intel/avs/ipc.c
+++ b/sound/soc/intel/avs/ipc.c
@@ -123,7 +123,9 @@ static void avs_dsp_recovery(struct avs_dev *adev)
 				if (!substream || !substream->runtime)
 					continue;
 
+				snd_pcm_stream_lock(substream);
 				snd_pcm_stop(substream, SNDRV_PCM_STATE_DISCONNECTED);
+				snd_pcm_stream_unlock(substream);
 			}
 		}
 	}
-- 
2.25.1

