Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B622B44D2
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Nov 2020 14:36:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B91A1752;
	Mon, 16 Nov 2020 14:35:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B91A1752
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605533800;
	bh=Iq9SF2donij1w6J5e1Z90jeUAE+OVsaBiyCnJybshkk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jvIZc5P7mW32ipkaYDePDumsLs5yAFRFhLyGlbjP1xcH1LguwH3JI5eMk9ESsKNgZ
	 vGULE7O07CDin/twHFv6mXUI0YKBTNXtwA0Qzjg5LifAuvFfXvxTrMwUxLssocRySh
	 CLQ0JWGxszQWvDqG/OX18wNvTCnkaeXSvyMDP4+k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0F32F804C3;
	Mon, 16 Nov 2020 14:34:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E6AD5F80168; Mon, 16 Nov 2020 14:34:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 00FA7F8016C
 for <alsa-devel@alsa-project.org>; Mon, 16 Nov 2020 14:33:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00FA7F8016C
IronPort-SDR: hLNNhNq4FaqYvr6wygCoKkfzZyBQXb1efNYcxfuDfGjOP/gkRweDZi0TvQDA7TT/EAdFQuZhTv
 wLHJ7CLlD7Bg==
X-IronPort-AV: E=McAfee;i="6000,8403,9806"; a="158520538"
X-IronPort-AV: E=Sophos;i="5.77,482,1596524400"; d="scan'208";a="158520538"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2020 05:33:49 -0800
IronPort-SDR: /wTyS+BBd0fApIngLzKQ9pMPwrJUah6CmBV+tCGGP/YDsCb6gd+NF3qexdvvyssJKBYKENna6t
 bkH7f7Rh9pfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,482,1596524400"; d="scan'208";a="475525017"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga004.jf.intel.com with ESMTP; 16 Nov 2020 05:33:46 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/5] ASoC: Intel: catpt: Skip position update for unprepared
 streams
Date: Mon, 16 Nov 2020 14:33:28 +0100
Message-Id: <20201116133332.8530-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201116133332.8530-1-cezary.rojewski@intel.com>
References: <20201116133332.8530-1-cezary.rojewski@intel.com>
Cc: pierre-louis.bossart@linux.intel.com,
 Cezary Rojewski <cezary.rojewski@intel.com>, tiwai@suse.com,
 lgirdwood@gmail.com, hdegoede@redhat.com, broonie@kernel.org
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

Playing with very low period sizes may lead to timeouts when awaiting
RESET_STREAM reply for offload streams. This is caused by NOTIFY_POSITION
appearing in the middle of trigger(stop).

Stream is unprepared during trigger(stop) where PAUSE_STREAM IPC gets
invoked. However, all data that is already mixed in DSP firmware's mixer
stream will still be played regardless of the pause. For offload streams,
this means possibility for another NOTIFY_POSITION to process. Keep these
notifications in check by only handling them when stream is in prepared
state.

Fixes: a126750fc865 ("ASoC: Intel: catpt: PCM operations")
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/catpt/pcm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/intel/catpt/pcm.c b/sound/soc/intel/catpt/pcm.c
index ba653ebea7d1..afdf6be605aa 100644
--- a/sound/soc/intel/catpt/pcm.c
+++ b/sound/soc/intel/catpt/pcm.c
@@ -534,6 +534,8 @@ void catpt_stream_update_position(struct catpt_dev *cdev,
 
 	dsppos = bytes_to_frames(r, pos->stream_position);
 
+	if (!stream->prepared)
+		goto exit;
 	/* only offload is set_write_pos driven */
 	if (stream->template->type != CATPT_STRM_TYPE_RENDER)
 		goto exit;
-- 
2.17.1

