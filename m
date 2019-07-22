Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 947D16FA53
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2019 09:25:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0793E174B;
	Mon, 22 Jul 2019 09:25:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0793E174B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563780358;
	bh=7lRSvtlxWR5rLsMocMYvuTZu+hfFtRhkX8Em6cNozAg=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kLluKsPi1WC84DoOy/3lIuCZwGp/MHxOoNDjUfrqh7OtCUxkptBvDSvyfbgHSO/6G
	 4PKX2sYoLFplxvfmyTz7QJ+4FMC/7Mzj+r32gf6f1nbvlrUE4FWBDr9zZajIvk4eFF
	 NilZm/sAARayVpBtERjWry7zpO/ebfPYD67tdr3k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 28C1FF803D7;
	Mon, 22 Jul 2019 09:24:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D633AF803D7; Mon, 22 Jul 2019 09:24:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 08CC2F803D1
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 09:24:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08CC2F803D1
Received: from svr-orw-mbx-03.mgc.mentorg.com ([147.34.90.203])
 by relay1.mentorg.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-SHA384:256)
 id 1hpSfy-0002G4-5N from Jiada_Wang@mentor.com ;
 Mon, 22 Jul 2019 00:24:02 -0700
Received: from jiwang-OptiPlex-980.tokyo.mentorg.com (147.34.91.1) by
 svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203) with Microsoft SMTP Server
 (TLS) id 15.0.1320.4; Mon, 22 Jul 2019 00:23:58 -0700
From: Jiada Wang <jiada_wang@mentor.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <kuninori.morimoto.gx@renesas.com>
Date: Mon, 22 Jul 2019 16:24:00 +0900
Message-ID: <20190722072403.11008-1-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
X-ClientProxiedBy: svr-orw-mbx-08.mgc.mentorg.com (147.34.90.208) To
 svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203)
Cc: jiada_wang@mentor.com, twischer@de.adit-jv.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH v1 0/3] Allow reconfiguration of clock rate
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

There is use case in Gstreamer ALSA sink, in case of changed caps
Gsreatmer reconfigs and it calls snd_pcm_hw_free() before snd_pcm_prepre().
See gstreamer1.0-plugins-base/
gst-libs/gst/audio/gstaudiobasesink.c: gst_audio_base_sink_setcaps():
- gst_audio_ring_buffer_release()
- gst_audio_sink_ring_buffer_release()
- gst_alsasink_unprepare()
- snd_pcm_hw_free()
is called before
- gst_audio_ring_buffer_acquire()
- gst_audio_sink_ring_buffer_acquire()
- gst_alsasink_prepare()
- set_hwparams()
- snd_pcm_hw_params()
- snd_pcm_prepare()

But with current implementation after clock rate is started in .prepare
reconfiguration of clock rate is not allowed, unless the stream is stopped.

This patch set by move stop of clock to .hw_free callback,
to allow reconfiguration of clock rate.

Jiada Wang (1):
  ASoC: rsnd: call .hw_{params,free} in pair for same stream

Timo Wischer (2):
  ASoC: rsnd: Support hw_free() callback at DAI level
  ASoC: rsnd: Allow reconfiguration of clock rate

 sound/soc/sh/rcar/core.c | 22 +++++++++++++--
 sound/soc/sh/rcar/rsnd.h | 36 ++++++++++++++++++++----
 sound/soc/sh/rcar/ssi.c  | 61 +++++++++++++++++++++++++++++-----------
 sound/soc/sh/rcar/ssiu.c |  3 +-
 4 files changed, 96 insertions(+), 26 deletions(-)

-- 
2.19.2

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
