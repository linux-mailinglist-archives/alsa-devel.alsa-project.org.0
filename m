Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DFAA7F9594
	for <lists+alsa-devel@lfdr.de>; Sun, 26 Nov 2023 22:43:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B3E47DF2;
	Sun, 26 Nov 2023 22:43:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B3E47DF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701034994;
	bh=gonBSy9Xg5wlmFnRmeVElL8+MhsIxmltTOyvUzu9r8s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=u6GXRZRt2oNCx7NvyuEKqD0Rvy+dbn7NFTU2dY842sa4K70oWfqqeajZMyCjGljxG
	 fohLbx1S96Bd5fNECcmhKt6gL1lxQd5GKWh/iloQCgaL4CBfrOCd6uvCK1mXUdDVYj
	 8T7Rwpj6ig/TklFRykDGKq0KHgqWdATtqHmDgiPk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 05325F80683; Sun, 26 Nov 2023 22:41:22 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8FC68F80690;
	Sun, 26 Nov 2023 22:41:21 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1AD99F805F1; Sun, 26 Nov 2023 22:41:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D13F2F80104
	for <alsa-devel@alsa-project.org>; Sun, 26 Nov 2023 22:40:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D13F2F80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=h0vWDNYY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701034840;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GiE4r3R8JssMvHs8pdyG22csL1lTSfHha8i7v4Ce2Co=;
	b=h0vWDNYYDXKjYJY9q1NYMmf7wqmraSrL7rg5o68j30lmiDl0wSTqUyGYMgJAoy3xkKaaHH
	IohPfnTYFkD1blEXUwthuEAXcbx40w0R9Bli2tO0meHAdTHcAAsCtzeBsi+p7PiwLuCx+f
	OuhAvURSfsAfT1iCo2I+grlo5shSbzE=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-671-4dC4cHo7MlOxe-tZsMYiWA-1; Sun,
 26 Nov 2023 16:40:39 -0500
X-MC-Unique: 4dC4cHo7MlOxe-tZsMYiWA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 916A32806663;
	Sun, 26 Nov 2023 21:40:38 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.41])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7FD631C060B0;
	Sun, 26 Nov 2023 21:40:37 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Mark Brown <broonie@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	alsa-devel@alsa-project.org
Subject: [PATCH 3/7] ASoC: rt5645: Refactor rt5645_parse_dt()
Date: Sun, 26 Nov 2023 22:40:20 +0100
Message-ID: <20231126214024.300505-4-hdegoede@redhat.com>
In-Reply-To: <20231126214024.300505-1-hdegoede@redhat.com>
References: <20231126214024.300505-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: RH2ACNNZNSQJGH7P77NOXTUTIA2CRBFX
X-Message-ID-Hash: RH2ACNNZNSQJGH7P77NOXTUTIA2CRBFX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RH2ACNNZNSQJGH7P77NOXTUTIA2CRBFX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Refactor rt5645_parse_dt(), make it take a pointer to
struct rt5645_platform_data as argument instead of passing in
the complete rt5645_priv struct.

While at it also make it void since it always succeeds.

This is a preparation patch for factoring the code to get
the platform-data out into a separate helper function.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/codecs/rt5645.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/rt5645.c b/sound/soc/codecs/rt5645.c
index 20bbdf76ffd7..7d0ad5650b44 100644
--- a/sound/soc/codecs/rt5645.c
+++ b/sound/soc/codecs/rt5645.c
@@ -3869,18 +3869,12 @@ static bool rt5645_check_dp(struct device *dev)
 	return false;
 }
 
-static int rt5645_parse_dt(struct rt5645_priv *rt5645, struct device *dev)
+static void rt5645_parse_dt(struct device *dev, struct rt5645_platform_data *pdata)
 {
-	rt5645->pdata.in2_diff = device_property_read_bool(dev,
-		"realtek,in2-differential");
-	device_property_read_u32(dev,
-		"realtek,dmic1-data-pin", &rt5645->pdata.dmic1_data_pin);
-	device_property_read_u32(dev,
-		"realtek,dmic2-data-pin", &rt5645->pdata.dmic2_data_pin);
-	device_property_read_u32(dev,
-		"realtek,jd-mode", &rt5645->pdata.jd_mode);
-
-	return 0;
+	pdata->in2_diff = device_property_read_bool(dev, "realtek,in2-differential");
+	device_property_read_u32(dev, "realtek,dmic1-data-pin", &pdata->dmic1_data_pin);
+	device_property_read_u32(dev, "realtek,dmic2-data-pin", &pdata->dmic2_data_pin);
+	device_property_read_u32(dev, "realtek,jd-mode", &pdata->jd_mode);
 }
 
 static int rt5645_i2c_probe(struct i2c_client *i2c)
@@ -3909,7 +3903,7 @@ static int rt5645_i2c_probe(struct i2c_client *i2c)
 	if (pdata)
 		rt5645->pdata = *pdata;
 	else if (rt5645_check_dp(&i2c->dev))
-		rt5645_parse_dt(rt5645, &i2c->dev);
+		rt5645_parse_dt(&i2c->dev, &rt5645->pdata);
 	else
 		rt5645->pdata = jd_mode3_platform_data;
 
-- 
2.41.0

