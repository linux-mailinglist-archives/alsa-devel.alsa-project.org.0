Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA8D3DCDDA
	for <lists+alsa-devel@lfdr.de>; Sun,  1 Aug 2021 23:06:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B58F17F7;
	Sun,  1 Aug 2021 23:05:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B58F17F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627851990;
	bh=QKKZq2ogKXBC/4Pb5BEwgvVlRCjSgEtd+FCFK5rnXvo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UZi2PgMSk5C8777popx+xb8/Kl1NfWUbe3oYhEjvobaA/gyDuxy789q2Q7uOnxJ8e
	 R3wAwWyhsnWcVmt2E9Mn6LgJDS1f1ITr8y0mu5NYxUcarGcZyrmERLiKBT3Kjx0A8v
	 9YtIN85dX5/JeeNYC5mC8jrMyZ++gK4LB/5gur1A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C770F804AC;
	Sun,  1 Aug 2021 23:04:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0280F8049E; Sun,  1 Aug 2021 23:04:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B9A2F8016D
 for <alsa-devel@alsa-project.org>; Sun,  1 Aug 2021 23:04:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B9A2F8016D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="HrDsxEHX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627851880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jk+e98v5mgCka446oopQKIUEhIpWscn7RCYMBIMFH6g=;
 b=HrDsxEHX3fgtTrivEyFWblmDmFJjNpSxgVDmeIKPydvAf4fctKIIIqPj2hC9ic5keU1ecJ
 jVlavZ5SHvwSnM6ORZhttYxYmIGirohtzS4Osvcm1bM9FluQxa4n3qFNJuS/JpsSbS3kzW
 4vKUsCrvsv3AQWTy/WO48dpTYDQ5Kd8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-7-KqmSQ76MNzCngUtItPqB-A-1; Sun, 01 Aug 2021 17:04:38 -0400
X-MC-Unique: KqmSQ76MNzCngUtItPqB-A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 272B734830;
 Sun,  1 Aug 2021 21:04:37 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.192.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2F43360C5A;
 Sun,  1 Aug 2021 21:04:35 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH 1/6] ASoC: Intel: bytcr_rt5640: Move "Platform Clock" routes
 to the maps for the matching in-/output
Date: Sun,  1 Aug 2021 23:04:26 +0200
Message-Id: <20210801210431.161775-2-hdegoede@redhat.com>
In-Reply-To: <20210801210431.161775-1-hdegoede@redhat.com>
References: <20210801210431.161775-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org,
 Bard Liao <bard.liao@intel.com>
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

Move the "Platform Clock" routes for the "Internal Mic" and "Speaker"
routes to the intmic_*_map[] / *_spk_map[] arrays.

This ensures that these "Platform Clock" routes do not get added when the
BYT_RT5640_NO_INTERNAL_MIC_MAP / BYT_RT5640_NO_SPEAKERS quirks are used.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/intel/boards/bytcr_rt5640.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index 91a6d712eb58..c403fb672594 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -290,9 +290,6 @@ static const struct snd_soc_dapm_widget byt_rt5640_widgets[] = {
 static const struct snd_soc_dapm_route byt_rt5640_audio_map[] = {
 	{"Headphone", NULL, "Platform Clock"},
 	{"Headset Mic", NULL, "Platform Clock"},
-	{"Internal Mic", NULL, "Platform Clock"},
-	{"Speaker", NULL, "Platform Clock"},
-
 	{"Headset Mic", NULL, "MICBIAS1"},
 	{"IN2P", NULL, "Headset Mic"},
 	{"Headphone", NULL, "HPOL"},
@@ -300,19 +297,23 @@ static const struct snd_soc_dapm_route byt_rt5640_audio_map[] = {
 };
 
 static const struct snd_soc_dapm_route byt_rt5640_intmic_dmic1_map[] = {
+	{"Internal Mic", NULL, "Platform Clock"},
 	{"DMIC1", NULL, "Internal Mic"},
 };
 
 static const struct snd_soc_dapm_route byt_rt5640_intmic_dmic2_map[] = {
+	{"Internal Mic", NULL, "Platform Clock"},
 	{"DMIC2", NULL, "Internal Mic"},
 };
 
 static const struct snd_soc_dapm_route byt_rt5640_intmic_in1_map[] = {
+	{"Internal Mic", NULL, "Platform Clock"},
 	{"Internal Mic", NULL, "MICBIAS1"},
 	{"IN1P", NULL, "Internal Mic"},
 };
 
 static const struct snd_soc_dapm_route byt_rt5640_intmic_in3_map[] = {
+	{"Internal Mic", NULL, "Platform Clock"},
 	{"Internal Mic", NULL, "MICBIAS1"},
 	{"IN3P", NULL, "Internal Mic"},
 };
@@ -354,6 +355,7 @@ static const struct snd_soc_dapm_route byt_rt5640_ssp0_aif2_map[] = {
 };
 
 static const struct snd_soc_dapm_route byt_rt5640_stereo_spk_map[] = {
+	{"Speaker", NULL, "Platform Clock"},
 	{"Speaker", NULL, "SPOLP"},
 	{"Speaker", NULL, "SPOLN"},
 	{"Speaker", NULL, "SPORP"},
@@ -361,6 +363,7 @@ static const struct snd_soc_dapm_route byt_rt5640_stereo_spk_map[] = {
 };
 
 static const struct snd_soc_dapm_route byt_rt5640_mono_spk_map[] = {
+	{"Speaker", NULL, "Platform Clock"},
 	{"Speaker", NULL, "SPOLP"},
 	{"Speaker", NULL, "SPOLN"},
 };
-- 
2.31.1

