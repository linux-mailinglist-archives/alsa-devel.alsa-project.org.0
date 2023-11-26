Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9300A7F9595
	for <lists+alsa-devel@lfdr.de>; Sun, 26 Nov 2023 22:43:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0DF07A4B;
	Sun, 26 Nov 2023 22:43:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0DF07A4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701035016;
	bh=f9bIfmtodZyBNrhMK9WGhnCwbhtaU7A0tWrejetrgkg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=A+mMwMtrMxJg4TMv89LFfJCCXQUWVH26PUKcIOJx4104dKKI9S0E/585h4r4dNAvq
	 3DBIO7Ow2gtDKipNl20BYAJKqG4gELB4T898it2JU7op7OCu+jCPC87n5kJEwcd5CJ
	 5CpzUu5YMGaiqcvkVzgu3tXdx592Pnl7tFKEp/vI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8DFE1F805AD; Sun, 26 Nov 2023 22:43:07 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A58D7F80571;
	Sun, 26 Nov 2023 22:43:06 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A424EF8055A; Sun, 26 Nov 2023 22:43:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=unavailable
	autolearn_force=no version=3.4.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 61CDBF80236
	for <alsa-devel@alsa-project.org>; Sun, 26 Nov 2023 22:40:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61CDBF80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=BdVlcsv/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701034847;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E/1zPXh5r5BteYqi/DiejJLkRlMOmkKGzOmrWyZypG4=;
	b=BdVlcsv/eOVHVnunjUFRkpK6mHo9cO8Z7K7rqUVRelArt4UL1loenCmqG5Ar3KT2Mput6T
	oHLQzZzbF3O7W+CaQmnapIsi2u1743I+r+Nw6NkE9Ky8yKGhB3F7VDLzCssxKkcyk2eOwJ
	6CsU3o4XG0kbi0v+FrEtfSD2ot4u1QU=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-45-PpaWYhhdPFGXQ0gnba0WSQ-1; Sun,
 26 Nov 2023 16:40:40 -0500
X-MC-Unique: PpaWYhhdPFGXQ0gnba0WSQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D38F92806662;
	Sun, 26 Nov 2023 21:40:39 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.41])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C29561C060B0;
	Sun, 26 Nov 2023 21:40:38 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Mark Brown <broonie@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	alsa-devel@alsa-project.org
Subject: [PATCH 4/7] ASoC: rt5645: Add rt5645_get_pdata() helper
Date: Sun, 26 Nov 2023 22:40:21 +0100
Message-ID: <20231126214024.300505-5-hdegoede@redhat.com>
In-Reply-To: <20231126214024.300505-1-hdegoede@redhat.com>
References: <20231126214024.300505-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: LWGRFNNI5QNB6DYQNLGCQKYW4RVLT52X
X-Message-ID-Hash: LWGRFNNI5QNB6DYQNLGCQKYW4RVLT52X
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LWGRFNNI5QNB6DYQNLGCQKYW4RVLT52X/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add a rt5645_get_pdata() helper function which retreives the platform-data
and overrides it with the quirks module parameter if that is set.

This is a preparation patch for adding the rt5645_components() function.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/codecs/rt5645.c | 51 ++++++++++++++++++++-------------------
 1 file changed, 26 insertions(+), 25 deletions(-)

diff --git a/sound/soc/codecs/rt5645.c b/sound/soc/codecs/rt5645.c
index 7d0ad5650b44..f79a447eaffe 100644
--- a/sound/soc/codecs/rt5645.c
+++ b/sound/soc/codecs/rt5645.c
@@ -3877,10 +3877,33 @@ static void rt5645_parse_dt(struct device *dev, struct rt5645_platform_data *pda
 	device_property_read_u32(dev, "realtek,jd-mode", &pdata->jd_mode);
 }
 
+static void rt5645_get_pdata(struct device *codec_dev, struct rt5645_platform_data *pdata)
+{
+	const struct dmi_system_id *dmi_data;
+
+	dmi_data = dmi_first_match(dmi_platform_data);
+	if (dmi_data) {
+		dev_info(codec_dev, "Detected %s platform\n", dmi_data->ident);
+		*pdata = *((struct rt5645_platform_data *)dmi_data->driver_data);
+	} else if (rt5645_check_dp(codec_dev)) {
+		rt5645_parse_dt(codec_dev, pdata);
+	} else {
+		*pdata = jd_mode3_platform_data;
+	}
+
+	if (quirk != -1) {
+		pdata->in2_diff = QUIRK_IN2_DIFF(quirk);
+		pdata->level_trigger_irq = QUIRK_LEVEL_IRQ(quirk);
+		pdata->inv_jd1_1 = QUIRK_INV_JD1_1(quirk);
+		pdata->inv_hp_pol = QUIRK_INV_HP_POL(quirk);
+		pdata->jd_mode = QUIRK_JD_MODE(quirk);
+		pdata->dmic1_data_pin = QUIRK_DMIC1_DATA_PIN(quirk);
+		pdata->dmic2_data_pin = QUIRK_DMIC2_DATA_PIN(quirk);
+	}
+}
+
 static int rt5645_i2c_probe(struct i2c_client *i2c)
 {
-	struct rt5645_platform_data *pdata = NULL;
-	const struct dmi_system_id *dmi_data;
 	struct rt5645_priv *rt5645;
 	int ret, i;
 	unsigned int val;
@@ -3893,29 +3916,7 @@ static int rt5645_i2c_probe(struct i2c_client *i2c)
 
 	rt5645->i2c = i2c;
 	i2c_set_clientdata(i2c, rt5645);
-
-	dmi_data = dmi_first_match(dmi_platform_data);
-	if (dmi_data) {
-		dev_info(&i2c->dev, "Detected %s platform\n", dmi_data->ident);
-		pdata = dmi_data->driver_data;
-	}
-
-	if (pdata)
-		rt5645->pdata = *pdata;
-	else if (rt5645_check_dp(&i2c->dev))
-		rt5645_parse_dt(&i2c->dev, &rt5645->pdata);
-	else
-		rt5645->pdata = jd_mode3_platform_data;
-
-	if (quirk != -1) {
-		rt5645->pdata.in2_diff = QUIRK_IN2_DIFF(quirk);
-		rt5645->pdata.level_trigger_irq = QUIRK_LEVEL_IRQ(quirk);
-		rt5645->pdata.inv_jd1_1 = QUIRK_INV_JD1_1(quirk);
-		rt5645->pdata.inv_hp_pol = QUIRK_INV_HP_POL(quirk);
-		rt5645->pdata.jd_mode = QUIRK_JD_MODE(quirk);
-		rt5645->pdata.dmic1_data_pin = QUIRK_DMIC1_DATA_PIN(quirk);
-		rt5645->pdata.dmic2_data_pin = QUIRK_DMIC2_DATA_PIN(quirk);
-	}
+	rt5645_get_pdata(&i2c->dev, &rt5645->pdata);
 
 	if (has_acpi_companion(&i2c->dev)) {
 		if (cht_rt5645_gpios) {
-- 
2.41.0

