Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1A42F304E
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Jan 2021 14:09:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7402916EB;
	Tue, 12 Jan 2021 14:08:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7402916EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610456953;
	bh=dDj5Z1s1/9jsV+DmB64XkeaQFLCeC6OYpJjBJp/fjLo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eYBhUdyiO9XVzz63yYqZbMgK6mSIQn/ZFQXGHgXNBOCvqWbFXBTtFpGZOmTnlKv/5
	 XnDBmFVDNHYIbee+XyKimsg2I+V46TgQ5/nvKm/vACMr9LV2yqy7zLJCdG4WhXPlgq
	 lG/TSJMTRUwGXhVtNnx2iwV6qWYYfbjwMtHQVRSE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ACC29F800EB;
	Tue, 12 Jan 2021 14:07:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C14C2F8025E; Tue, 12 Jan 2021 14:07:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 64FEEF80249;
 Tue, 12 Jan 2021 14:07:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64FEEF80249
Received: from 36-229-236-11.dynamic-ip.hinet.net ([36.229.236.11]
 helo=localhost) by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>)
 id 1kzJOF-0008RO-83; Tue, 12 Jan 2021 13:07:16 +0000
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
To: tiwai@suse.com, pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 daniel.baluta@nxp.com
Subject: [PATCH v3 2/4] ASoC: SOF: Intel: hda: Resume codec to do jack
 detection
Date: Tue, 12 Jan 2021 21:07:00 +0800
Message-Id: <20210112130704.1201406-2-kai.heng.feng@canonical.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112130704.1201406-1-kai.heng.feng@canonical.com>
References: <20210112130704.1201406-1-kai.heng.feng@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, broonie@kernel.org,
 open list <linux-kernel@vger.kernel.org>, Rander Wang <rander.wang@intel.com>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Payal Kshirsagar <payalskshirsagar1234@gmail.com>,
 "moderated list:SOUND - SOUND OPEN FIRMWARE SOF DRIVERS"
 <sound-open-firmware@alsa-project.org>
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

Instead of queueing jackpoll_work, runtime resume the codec to let it
use different jack detection methods based on jackpoll_interval.

This partially matches SOF driver's behavior with commit a6e7d0a4bdb0
("ALSA: hda: fix jack detection with Realtek codecs when in D3"), the
difference is SOF unconditionally resumes the codec.
---
v3: 
 Remove wrong assumption that only Realtek codec is used by SOF.
v2:
 No change.

 sound/soc/sof/intel/hda-codec.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/sof/intel/hda-codec.c b/sound/soc/sof/intel/hda-codec.c
index 6875fa570c2c..df59c79cfdfc 100644
--- a/sound/soc/sof/intel/hda-codec.c
+++ b/sound/soc/sof/intel/hda-codec.c
@@ -93,8 +93,7 @@ void hda_codec_jack_check(struct snd_sof_dev *sdev)
 		 * has been recorded in STATESTS
 		 */
 		if (codec->jacktbl.used)
-			schedule_delayed_work(&codec->jackpoll_work,
-					      codec->jackpoll_interval);
+			pm_request_resume(&codec->core.dev);
 }
 #else
 void hda_codec_jack_wake_enable(struct snd_sof_dev *sdev) {}
-- 
2.29.2

