Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFFD486363
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jan 2022 12:03:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2DB731897;
	Thu,  6 Jan 2022 12:02:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2DB731897
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641467014;
	bh=/2NclrnSx3vNMJoVMxoZP6JWRr7CeTWmbHMQWJ1mDvM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Gm1YL4lu8wexERlfLA0ZpSkFKG08RCXwRUObQpApr7FJ3Ke6e3TbsVniZoc78vE5U
	 XzRcfvGH+BffZftydNGQ/Ziegd38YsAOMgaR1m9ERzV8QN9l3BgKMvbc16iHid3uCd
	 Tv1bALN2CZ3CB3VbM7Qt9M7Bx/q6nSc4U08z6RQg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34C67F804FB;
	Thu,  6 Jan 2022 12:01:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D2C50F804FB; Thu,  6 Jan 2022 12:01:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8EC64F800AE
 for <alsa-devel@alsa-project.org>; Thu,  6 Jan 2022 12:01:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8EC64F800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="JQn1h20x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641466901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=42w/s9O/nqUs4E2rlffJtHqBwOZtwao3P+fRO2kMP/Q=;
 b=JQn1h20x2dFySNRenKwmAC64O8eBxA1vrISR467cH1HuN+tauUF6JbqJG2NY+VNMoUMKir
 bAbFUaWY+nlkB743RFmDmOyNioBZAIvMM4l0TawYdMNiSVxnSBJqNvU473lBi0PAn8nzCR
 ivUGTbhL79C9tRQzfl4BQVfo7PXFmpg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-14-rE-Q-Xx7NCWuXQNcFE57HA-1; Thu, 06 Jan 2022 06:01:40 -0500
X-MC-Unique: rE-Q-Xx7NCWuXQNcFE57HA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AD0E78042E0;
 Thu,  6 Jan 2022 11:01:38 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EB3537E12C;
 Thu,  6 Jan 2022 11:01:36 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jie Yang <yang.jie@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 3/6] ASoC: rt5640: Allow snd_soc_component_set_jack() to
 override the codec IRQ
Date: Thu,  6 Jan 2022 12:01:25 +0100
Message-Id: <20220106110128.66049-4-hdegoede@redhat.com>
In-Reply-To: <20220106110128.66049-1-hdegoede@redhat.com>
References: <20220106110128.66049-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org,
 Stephan Gerhold <stephan@gerhold.net>, Bard Liao <bard.liao@intel.com>
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

On some boards where the firmware/fwnode information is in essence
read-only (x86 + ACPI boards) the i2c_client for the codec may contain
the wrong IRQ or no IRQ at all.

Since we only request the IRQ once snd_soc_component_set_jack() gets
called, allow machine drivers to override the IRQ with the proper one
through the data parameter to snd_soc_component_set_jack().

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/codecs/rt5640.c | 8 ++++++--
 sound/soc/codecs/rt5640.h | 4 ++++
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt5640.c b/sound/soc/codecs/rt5640.c
index a1e4e3ac99f1..fabc6e44b4a6 100644
--- a/sound/soc/codecs/rt5640.c
+++ b/sound/soc/codecs/rt5640.c
@@ -2452,7 +2452,8 @@ static void rt5640_disable_jack_detect(struct snd_soc_component *component)
 }
 
 static void rt5640_enable_jack_detect(struct snd_soc_component *component,
-				      struct snd_soc_jack *jack)
+				      struct snd_soc_jack *jack,
+				      struct rt5640_set_jack_data *jack_data)
 {
 	struct rt5640_priv *rt5640 = snd_soc_component_get_drvdata(component);
 	int ret;
@@ -2496,6 +2497,9 @@ static void rt5640_enable_jack_detect(struct snd_soc_component *component,
 		rt5640_enable_micbias1_ovcd_irq(component);
 	}
 
+	if (jack_data && jack_data->codec_irq_override)
+		rt5640->irq = jack_data->codec_irq_override;
+
 	ret = request_irq(rt5640->irq, rt5640_irq,
 			  IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
 			  "rt5640", rt5640);
@@ -2558,7 +2562,7 @@ static int rt5640_set_jack(struct snd_soc_component *component,
 		if (rt5640->jd_src == RT5640_JD_SRC_HDA_HEADER)
 			rt5640_enable_hda_jack_detect(component, jack);
 		else
-			rt5640_enable_jack_detect(component, jack);
+			rt5640_enable_jack_detect(component, jack, data);
 	} else {
 		rt5640_disable_jack_detect(component);
 	}
diff --git a/sound/soc/codecs/rt5640.h b/sound/soc/codecs/rt5640.h
index 7ab930def8dd..2f4da5a8ecb2 100644
--- a/sound/soc/codecs/rt5640.h
+++ b/sound/soc/codecs/rt5640.h
@@ -2153,6 +2153,10 @@ struct rt5640_priv {
 	unsigned int ovcd_sf;
 };
 
+struct rt5640_set_jack_data {
+	int codec_irq_override;
+};
+
 int rt5640_dmic_enable(struct snd_soc_component *component,
 		       bool dmic1_data_pin, bool dmic2_data_pin);
 int rt5640_sel_asrc_clk_src(struct snd_soc_component *component,
-- 
2.33.1

