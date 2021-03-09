Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 949CD332370
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Mar 2021 11:57:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30DA117D9;
	Tue,  9 Mar 2021 11:56:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30DA117D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615287445;
	bh=cqRsqBDHJMgJB4/YUlDSsGA4nYMwUr5e3nk8IHOjRWE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Lwe8FalPzSaObwF/jtsAqHJvvKexL6h8m6xhdrgi8n4p12ksJkj6dHqm5ZIxvNnsY
	 UXmMWDrt11kFkb6GaHDNjROtnfANlQ/NK5k9TnnGYAxL/zUoycu16Q2M4U62XAEcEh
	 ihOCamN/w27pfodnTwtebdGeITmP1Tk40VLs7sTk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 06CBCF80276;
	Tue,  9 Mar 2021 11:55:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BCFD4F8014E; Tue,  9 Mar 2021 11:55:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E9CCAF8014E
 for <alsa-devel@alsa-project.org>; Tue,  9 Mar 2021 11:55:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9CCAF8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="e1P3dMIs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615287336;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=igGpDVPOk/k+jGdogKjW4xIG1vuaITeT4xXr4ZX6k0w=;
 b=e1P3dMIs2QUEyY6MLKd3DOXne162uQ5hMDUY0FpZ/dUBbeJL3JhThjqPHIt0cuEIs2Jfay
 JNFxpQ1fRK+LSg98F+Kb9ZraQSRWuchv2VkiPIknoxCCroRIWKzP9zETV/mJz/vRq7XNvh
 AuDOKjEAkD2YVf5VGMWhoOI+eIDlfJY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-249-oVdI6PnrMImLglztRGZhgw-1; Tue, 09 Mar 2021 05:55:26 -0500
X-MC-Unique: oVdI6PnrMImLglztRGZhgw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 652EF83DD27;
 Tue,  9 Mar 2021 10:55:24 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-201.ams2.redhat.com
 [10.36.112.201])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9E7FC5C701;
 Tue,  9 Mar 2021 10:55:21 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jie Yang <yang.jie@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
Subject: [PATCH 1/2] ASoC: intel: atom: Stop advertising non working S24LE
 support
Date: Tue,  9 Mar 2021 11:55:19 +0100
Message-Id: <20210309105520.9185-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org,
 stable@vger.kernel.org
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

The SST firmware's media and deep-buffer inputs are hardcoded to
S16LE, the corresponding DAIs don't have a hw_params callback and
their prepare callback also does not take the format into account.

So far the advertising of non working S24LE support has not caused
issues because pulseaudio defaults to S16LE, but changing pulse-audio's
config to use S24LE will result in broken sound.

Pipewire is replacing pulse now and pipewire prefers S24LE over S16LE
when available, causing the problem of the broken S24LE support to
come to the surface now.

Cc: stable@vger.kernel.org
BugLink: https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/866
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/intel/atom/sst-mfld-platform-pcm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/atom/sst-mfld-platform-pcm.c b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
index 9e9b05883557..aa5dd590ddd5 100644
--- a/sound/soc/intel/atom/sst-mfld-platform-pcm.c
+++ b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
@@ -488,14 +488,14 @@ static struct snd_soc_dai_driver sst_platform_dai[] = {
 		.channels_min = SST_STEREO,
 		.channels_max = SST_STEREO,
 		.rates = SNDRV_PCM_RATE_44100|SNDRV_PCM_RATE_48000,
-		.formats = SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE,
+		.formats = SNDRV_PCM_FMTBIT_S16_LE,
 	},
 	.capture = {
 		.stream_name = "Headset Capture",
 		.channels_min = 1,
 		.channels_max = 2,
 		.rates = SNDRV_PCM_RATE_44100|SNDRV_PCM_RATE_48000,
-		.formats = SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE,
+		.formats = SNDRV_PCM_FMTBIT_S16_LE,
 	},
 },
 {
@@ -506,7 +506,7 @@ static struct snd_soc_dai_driver sst_platform_dai[] = {
 		.channels_min = SST_STEREO,
 		.channels_max = SST_STEREO,
 		.rates = SNDRV_PCM_RATE_44100|SNDRV_PCM_RATE_48000,
-		.formats = SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE,
+		.formats = SNDRV_PCM_FMTBIT_S16_LE,
 	},
 },
 {
-- 
2.30.1

