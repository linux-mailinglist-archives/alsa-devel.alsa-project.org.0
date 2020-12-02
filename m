Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F39E2CC6C2
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Dec 2020 20:35:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A107E17CD;
	Wed,  2 Dec 2020 20:34:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A107E17CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606937741;
	bh=TZnsTmHi5IFcCU6Ky6WBEdNl1oN50y6Ely/z3gWEcc4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=luE1fHPVkeOOBPIqoRDy/JkDM/uMbhSMIFv1PvGnoN5IByjbIvniJkqwNaMjo93JG
	 Lm69sHcKOLa7/wMOs4h0Azsmb38AwLH0dlhLCmOyr2KFn5kasMW5ppqr+HhjHizxtA
	 u7iIhH/ctfcuBKnhsT71dqk/NfcbdB6k7gG1jHq8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A7C9FF8049C;
	Wed,  2 Dec 2020 20:34:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1D7E4F8026B; Wed,  2 Dec 2020 20:34:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H4,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E4441F80168
 for <alsa-devel@alsa-project.org>; Wed,  2 Dec 2020 20:33:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4441F80168
IronPort-SDR: f5fsmEGWLwjXugXYNiCzr1jvXglsic/DK9qCXDWOYuqfg8RCvBeK8vNHwlATu1P733iI6iWaxJ
 xk7QhHB0knrQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9823"; a="172293920"
X-IronPort-AV: E=Sophos;i="5.78,387,1599548400"; d="scan'208";a="172293920"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2020 11:33:50 -0800
IronPort-SDR: gnoVE8NeXxQYw4LIyhNUuFQn6kMGfD9kXO0dceEFW47MEGb+jDYQuxaBXptDdLLJqf4oQGt9N0
 IylW2OzhVOOg==
X-IronPort-AV: E=Sophos;i="5.78,387,1599548400"; d="scan'208";a="405630851"
Received: from emohamma-mobl.amr.corp.intel.com (HELO
 rsridh-mobl1.localdomain) ([10.212.9.30])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2020 11:33:50 -0800
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: pcm: send DAPM_STREAM_STOP event in dpcm_fe_dai_shutdown
Date: Wed,  2 Dec 2020 11:33:43 -0800
Message-Id: <20201202193343.912942-1-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, hdegoede@redhat.com, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
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

A recent change removed the call to send the DAPM_STREAM_STOP
event in dpcm_fe_dai_shutdown. But this causes a regression
when a PCM prepare is not paired with a hw_free. So, add
the DAPM_STREAM_STOP event back to dpcm_fe_dai_shutdown()
to fix this.

The new sequence would be:
soc_pcm_prepare()
    -> SND_SOC_DAPM_STREAM_START

soc_pcm_hw_free()
    -> soc_pcm_hw_free()
	-> SND_SOC_DAPM_STREAM_STOP

dpcm_fe_dai_shutdown()
    -> SND_SOC_DAPM_STREAM_STOP

Note that the DAPM_STREAM_STOP will be called twice but it seems
harmless.

Fixes: a27b421f1d04 ('ASoC: pcm: call snd_soc_dapm_stream_stop() in soc_pcm_hw_clean')

Reported-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/soc-pcm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 5250124dc8f5..ae062e4d1ce8 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -1860,6 +1860,9 @@ static int dpcm_fe_dai_shutdown(struct snd_pcm_substream *substream)
 	/* now shutdown the frontend */
 	soc_pcm_close(substream);
 
+	/* run the stream stop event */
+	dpcm_dapm_stream_event(fe, stream, SND_SOC_DAPM_STREAM_STOP);
+
 	fe->dpcm[stream].state = SND_SOC_DPCM_STATE_CLOSE;
 	dpcm_set_fe_update_state(fe, stream, SND_SOC_DPCM_UPDATE_NO);
 	return 0;
-- 
2.25.1

