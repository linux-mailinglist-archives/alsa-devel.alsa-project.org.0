Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 60BD633236E
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Mar 2021 11:57:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED64D17CA;
	Tue,  9 Mar 2021 11:56:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED64D17CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615287433;
	bh=G9ciPs/Fvtk4MHj4mH20dqCwF0y5VTarPOId5Uf8cUQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VrRDABwW9aKwImVTyy0L6KTn/Oxlusw9VN+CugxmnU/jaXsTMHstm1Kc/ntmyKCSv
	 uu5CQeAvy20LXvJzGs2rPiem2FtnEIL3yttATDmdtSwpVhs9givQKdevn+yesGhg3o
	 h+OvrLPwpWQQMHS5mVEh6q5mU0RosnQ4+A/KC/BA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52494F80227;
	Tue,  9 Mar 2021 11:55:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EB76AF80256; Tue,  9 Mar 2021 11:55:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 717DFF80166
 for <alsa-devel@alsa-project.org>; Tue,  9 Mar 2021 11:55:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 717DFF80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="B/9piOwD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615287330;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qXtQKgIGCfZ9zBltozu9luumN+mvOGZeMn1rnLSEzCs=;
 b=B/9piOwDfqf4Fvdw0U7lTwUTuZ98WZLvQp3+9LWYiq4dEYW/Qs2EH9uzWVqsKtoRGCfVtV
 jmhMshMb9QzdHt8hGXwHqYhEjhkY551nSF6wcd/vslb889be/a8yYNNUzpeAolcXAKxQBi
 chT6HHeXwo7DZmOBb3bpDn/0RMBEFxI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-283-JM9XxSv_PTWlgFuzGcS8KA-1; Tue, 09 Mar 2021 05:55:28 -0500
X-MC-Unique: JM9XxSv_PTWlgFuzGcS8KA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 496786973B;
 Tue,  9 Mar 2021 10:55:27 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-201.ams2.redhat.com
 [10.36.112.201])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ABA3B5C266;
 Tue,  9 Mar 2021 10:55:24 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jie Yang <yang.jie@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
Subject: [PATCH 2/2] ASoC: intel: atom: Remove 44100 sample-rate from the
 media and deep-buffer DAI descriptions
Date: Tue,  9 Mar 2021 11:55:20 +0100
Message-Id: <20210309105520.9185-2-hdegoede@redhat.com>
In-Reply-To: <20210309105520.9185-1-hdegoede@redhat.com>
References: <20210309105520.9185-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org
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

The media and deep-buffer DAIs only support 48000 Hz samplerate,
remove the 44100 sample-rate from their descriptions.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/intel/atom/sst-mfld-platform-pcm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/atom/sst-mfld-platform-pcm.c b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
index aa5dd590ddd5..4124aa2fc247 100644
--- a/sound/soc/intel/atom/sst-mfld-platform-pcm.c
+++ b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
@@ -487,14 +487,14 @@ static struct snd_soc_dai_driver sst_platform_dai[] = {
 		.stream_name = "Headset Playback",
 		.channels_min = SST_STEREO,
 		.channels_max = SST_STEREO,
-		.rates = SNDRV_PCM_RATE_44100|SNDRV_PCM_RATE_48000,
+		.rates = SNDRV_PCM_RATE_48000,
 		.formats = SNDRV_PCM_FMTBIT_S16_LE,
 	},
 	.capture = {
 		.stream_name = "Headset Capture",
 		.channels_min = 1,
 		.channels_max = 2,
-		.rates = SNDRV_PCM_RATE_44100|SNDRV_PCM_RATE_48000,
+		.rates = SNDRV_PCM_RATE_48000,
 		.formats = SNDRV_PCM_FMTBIT_S16_LE,
 	},
 },
@@ -505,7 +505,7 @@ static struct snd_soc_dai_driver sst_platform_dai[] = {
 		.stream_name = "Deepbuffer Playback",
 		.channels_min = SST_STEREO,
 		.channels_max = SST_STEREO,
-		.rates = SNDRV_PCM_RATE_44100|SNDRV_PCM_RATE_48000,
+		.rates = SNDRV_PCM_RATE_48000,
 		.formats = SNDRV_PCM_FMTBIT_S16_LE,
 	},
 },
-- 
2.30.1

