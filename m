Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 144CE7F958F
	for <lists+alsa-devel@lfdr.de>; Sun, 26 Nov 2023 22:42:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6BE0882A;
	Sun, 26 Nov 2023 22:42:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6BE0882A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701034935;
	bh=3TL/XEoBgbW+X9Z3caqaQhyVQCk8XD4rYbra1pY0RkU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eAU7gCEvzPWqixAWjE7wbM+4iHxTommq0j14ifqPTFk6FHApSyg5+EGzbJAWJqyOM
	 LJQxqf50cJ1PsEvIEIv0eP47jeePqmx64fsx9vit3z9pw9hMdG59wE/AAexc2uznZ3
	 cNsMC7V0WZ5PvD56QQ4C4kZ4LJIS+Bo/dZHfN+88=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 579D8F805EE; Sun, 26 Nov 2023 22:41:13 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F2B12F8060A;
	Sun, 26 Nov 2023 22:41:12 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C289EF8025A; Sun, 26 Nov 2023 22:40:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6600BF80166
	for <alsa-devel@alsa-project.org>; Sun, 26 Nov 2023 22:40:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6600BF80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=CXD+WYom
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701034844;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k8vaeKbIokCJaoEpA5JjoegesgAqlMBbhrMU0KbG7z8=;
	b=CXD+WYomW9LSj8B7gCA+0xDdM8AjpPgQeFcT6e2YnTOJ+GvtmYYtsuGbjRRgBbTw7xN9FS
	ySIjOVv6rZ8d32dLsYA7937udrEp/djHyN3XQumCXov1b00qN17OxmB4kkC9BECerSaQt/
	HkGpCbWu2Sja7Y5EKVXN3OfZavMkPX8=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-460-K_lAPbVZO-eM1HrBysCP2g-1; Sun,
 26 Nov 2023 16:40:41 -0500
X-MC-Unique: K_lAPbVZO-eM1HrBysCP2g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 216323C02796;
	Sun, 26 Nov 2023 21:40:41 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.41])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 107F71C060B0;
	Sun, 26 Nov 2023 21:40:39 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Mark Brown <broonie@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	alsa-devel@alsa-project.org
Subject: [PATCH 5/7] ASoC: rt5645: Add a rt5645_components() helper
Date: Sun, 26 Nov 2023 22:40:22 +0100
Message-ID: <20231126214024.300505-6-hdegoede@redhat.com>
In-Reply-To: <20231126214024.300505-1-hdegoede@redhat.com>
References: <20231126214024.300505-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: EGYEJSFJON43NXHHEO7JCZRVYVBBCY4Y
X-Message-ID-Hash: EGYEJSFJON43NXHHEO7JCZRVYVBBCY4Y
X-MailFrom: hdegoede@redhat.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EGYEJSFJON43NXHHEO7JCZRVYVBBCY4Y/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The rt5645 codec driver uses DMI quirks to configure the DMIC data-pins,
which means that it knows which DMIC interface is used on a specific
device.

ATM we duplicate this DMI matching inside the UCM profiles to select
the right DMIC interface. Add a rt5645_components() helper which the
machine-driver can use to set the components string of the card so
that UCM can get the info from the components string.

This way we only need to add new DMI quirks in one place.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/codecs/rt5645.c | 24 ++++++++++++++++++++++++
 sound/soc/codecs/rt5645.h |  3 +++
 2 files changed, 27 insertions(+)

diff --git a/sound/soc/codecs/rt5645.c b/sound/soc/codecs/rt5645.c
index f79a447eaffe..4f3ef004f555 100644
--- a/sound/soc/codecs/rt5645.c
+++ b/sound/soc/codecs/rt5645.c
@@ -3902,6 +3902,30 @@ static void rt5645_get_pdata(struct device *codec_dev, struct rt5645_platform_da
 	}
 }
 
+const char *rt5645_components(struct device *codec_dev)
+{
+	struct rt5645_platform_data pdata = { };
+	static char buf[32];
+	const char *mic;
+	int spk = 2;
+
+	rt5645_get_pdata(codec_dev, &pdata);
+
+	if (pdata.dmic1_data_pin && pdata.dmic2_data_pin)
+		mic = "dmics12";
+	else if (pdata.dmic1_data_pin)
+		mic = "dmic1";
+	else if (pdata.dmic2_data_pin)
+		mic = "dmic2";
+	else
+		mic = "in2";
+
+	snprintf(buf, sizeof(buf), "cfg-spk:%d cfg-mic:%s", spk, mic);
+
+	return buf;
+}
+EXPORT_SYMBOL_GPL(rt5645_components);
+
 static int rt5645_i2c_probe(struct i2c_client *i2c)
 {
 	struct rt5645_priv *rt5645;
diff --git a/sound/soc/codecs/rt5645.h b/sound/soc/codecs/rt5645.h
index ac3de6f3bc2f..90816b2c5489 100644
--- a/sound/soc/codecs/rt5645.h
+++ b/sound/soc/codecs/rt5645.h
@@ -2201,4 +2201,7 @@ int rt5645_sel_asrc_clk_src(struct snd_soc_component *component,
 int rt5645_set_jack_detect(struct snd_soc_component *component,
 	struct snd_soc_jack *hp_jack, struct snd_soc_jack *mic_jack,
 	struct snd_soc_jack *btn_jack);
+
+const char *rt5645_components(struct device *codec_dev);
+
 #endif /* __RT5645_H__ */
-- 
2.41.0

