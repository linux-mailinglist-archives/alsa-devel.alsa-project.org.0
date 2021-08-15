Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 190C73ECA17
	for <lists+alsa-devel@lfdr.de>; Sun, 15 Aug 2021 17:53:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6AE75171C;
	Sun, 15 Aug 2021 17:52:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6AE75171C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629042785;
	bh=GpdLcfrRiH/UBUQ2fRuaSa+77EiudcUZHMkHMu1baH0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZU5I0uROtHtZsRCpC/0P0Nqo5BAaltJzYTucPxABJPEX3MROe1MfychwkhS06YKST
	 YtgGM59jQNm6spWgboqVEMNqT2rPQfETm9IqmholyO0hMlfgr8nTjk0UZ97Sd+MwaS
	 dIc2LK8Vn5iyqnJx02oCHseEC4cuoEDXgS6nWKmU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D9802F80302;
	Sun, 15 Aug 2021 17:51:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 660E0F800F8; Sun, 15 Aug 2021 17:51:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C8BA9F800B8
 for <alsa-devel@alsa-project.org>; Sun, 15 Aug 2021 17:49:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8BA9F800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="hthpUA5B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629042586;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G8gWBayQbaBUxm2xvcA4iD9a5Bry93qCw281ALu6TQc=;
 b=hthpUA5Bfg9+FxZohYhsRuABD2+MdHALMA8JG3P9Tmx5ABDdLiNxPvowo89EI5S51MUeyc
 G3Z4L6V4Q/UmZ4LMz/6v3TfZrbUb9sqFbq4AKhbjbz5sirBvmie6uJHULEejJYCT6P0sYX
 Yw4Co0xeQbOzOS8aFwWz+Od+4snd+1o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-482--70J5OlCP8ug9lhukSiK6Q-1; Sun, 15 Aug 2021 11:49:43 -0400
X-MC-Unique: -70J5OlCP8ug9lhukSiK6Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A8C1E801AEB;
 Sun, 15 Aug 2021 15:49:41 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.192.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CEF7860871;
 Sun, 15 Aug 2021 15:49:39 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH 1/5] ASoC: rt5640: Move rt5640_disable_jack_detect() up in the
 rt5640.c file
Date: Sun, 15 Aug 2021 17:49:31 +0200
Message-Id: <20210815154935.101178-2-hdegoede@redhat.com>
In-Reply-To: <20210815154935.101178-1-hdegoede@redhat.com>
References: <20210815154935.101178-1-hdegoede@redhat.com>
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

Move rt5640_disable_jack_detect() to above rt5640_enable_jack_detect().
This is a preparation patch for reworking how the IRQ gets requested.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/codecs/rt5640.c | 46 +++++++++++++++++++--------------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/sound/soc/codecs/rt5640.c b/sound/soc/codecs/rt5640.c
index 9523f4b5c800..a425e6b1687d 100644
--- a/sound/soc/codecs/rt5640.c
+++ b/sound/soc/codecs/rt5640.c
@@ -2362,6 +2362,29 @@ static void rt5640_cancel_work(void *data)
 	cancel_delayed_work_sync(&rt5640->bp_work);
 }
 
+static void rt5640_disable_jack_detect(struct snd_soc_component *component)
+{
+	struct rt5640_priv *rt5640 = snd_soc_component_get_drvdata(component);
+
+	/*
+	 * soc_remove_component() force-disables jack and thus rt5640->jack
+	 * could be NULL at the time of driver's module unloading.
+	 */
+	if (!rt5640->jack)
+		return;
+
+	disable_irq(rt5640->irq);
+	rt5640_cancel_work(rt5640);
+
+	if (rt5640->jack->status & SND_JACK_MICROPHONE) {
+		rt5640_disable_micbias1_ovcd_irq(component);
+		rt5640_disable_micbias1_for_ovcd(component);
+		snd_soc_jack_report(rt5640->jack, 0, SND_JACK_BTN_0);
+	}
+
+	rt5640->jack = NULL;
+}
+
 static void rt5640_enable_jack_detect(struct snd_soc_component *component,
 				      struct snd_soc_jack *jack)
 {
@@ -2428,29 +2451,6 @@ static void rt5640_enable_jack_detect(struct snd_soc_component *component,
 	queue_work(system_long_wq, &rt5640->jack_work);
 }
 
-static void rt5640_disable_jack_detect(struct snd_soc_component *component)
-{
-	struct rt5640_priv *rt5640 = snd_soc_component_get_drvdata(component);
-
-	/*
-	 * soc_remove_component() force-disables jack and thus rt5640->jack
-	 * could be NULL at the time of driver's module unloading.
-	 */
-	if (!rt5640->jack)
-		return;
-
-	disable_irq(rt5640->irq);
-	rt5640_cancel_work(rt5640);
-
-	if (rt5640->jack->status & SND_JACK_MICROPHONE) {
-		rt5640_disable_micbias1_ovcd_irq(component);
-		rt5640_disable_micbias1_for_ovcd(component);
-		snd_soc_jack_report(rt5640->jack, 0, SND_JACK_BTN_0);
-	}
-
-	rt5640->jack = NULL;
-}
-
 static int rt5640_set_jack(struct snd_soc_component *component,
 			   struct snd_soc_jack *jack, void *data)
 {
-- 
2.31.1

