Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E13789B3C8
	for <lists+alsa-devel@lfdr.de>; Sun,  7 Apr 2024 21:16:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 700C522A9;
	Sun,  7 Apr 2024 21:16:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 700C522A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712517418;
	bh=6bKAAaR7jFFzSP7Y4Fon17Txm1Te3K5K3l4MYTlPk80=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=JaYyu/VBwBEqwMwsCeXCMZfc+bVJIgAiNK1hSSdFv6i3lYDaz2mCyZDwQ1MYEKT3q
	 dW168oLhlqWcoTXxbc1ITjwqjngO5wAs308PGndfdAQMy/G/AtYSrI+juBn528OTGz
	 ImhnBabPPa/5YaOhvasNiOQ2NqdoNRSzP5WpJC38=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2FC81F8057C; Sun,  7 Apr 2024 21:16:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6DA08F8026D;
	Sun,  7 Apr 2024 21:16:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C2C80F8026D; Sun,  7 Apr 2024 21:16:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ADF11F80130
	for <alsa-devel@alsa-project.org>; Sun,  7 Apr 2024 21:16:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ADF11F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=JwuegihM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712517371;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QTDHqainzvNPMBV5LUdVRn1KPSwgHeCdFDZZO+P7J58=;
	b=JwuegihMqaCrfD/UKf2wMiEwRRTP5tijCHcVhcZpRlkpUuXi8FSSX2w7S3ocnNvxxGP2Zv
	pDTs0jtVakbqvaBO9WPJc59G73HDGhE6fVD5JDO3QMX0iJUax+JxTTIK4Rh2FWDVleBmK/
	z9ZBDPZ6UMkfsxV+6IPj7keA/K06J7Y=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-269-dh-xbKSpNBW2NXwxvY8GPQ-1; Sun,
 07 Apr 2024 15:16:07 -0400
X-MC-Unique: dh-xbKSpNBW2NXwxvY8GPQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A1BEB1C03148;
	Sun,  7 Apr 2024 19:16:06 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.9])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 343A0C26A4A;
	Sun,  7 Apr 2024 19:16:04 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Mark Brown <broonie@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH] ASoC: Intel: bytcr_rt5640: Apply Asus T100TA quirk to Asus
 T100TAM too
Date: Sun,  7 Apr 2024 21:15:59 +0200
Message-ID: <20240407191559.21596-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: MAOGSMWAHUYCU5NIZHSZ5ISF7WLYKQAH
X-Message-ID-Hash: MAOGSMWAHUYCU5NIZHSZ5ISF7WLYKQAH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MAOGSMWAHUYCU5NIZHSZ5ISF7WLYKQAH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The Asus T100TA quirk has been using an exact match on a product-name of
"T100TA" but there are also T100TAM variants with a slightly higher
clocked CPU and a metal backside which need the same quirk.

Sort the existing T100TA (stereo speakers) below the more specific
T100TAF (mono speaker) quirk and switch from exact matching to
substring matching so that the T100TA quirk will also match on
the T100TAM models.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/intel/boards/bytcr_rt5640.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index 05f38d1f7d82..b41a1147f1c3 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -636,17 +636,7 @@ static const struct dmi_system_id byt_rt5640_quirk_table[] = {
 					BYT_RT5640_USE_AMCR0F28),
 	},
 	{
-		.matches = {
-			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
-			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "T100TA"),
-		},
-		.driver_data = (void *)(BYT_RT5640_IN1_MAP |
-					BYT_RT5640_JD_SRC_JD2_IN4N |
-					BYT_RT5640_OVCD_TH_2000UA |
-					BYT_RT5640_OVCD_SF_0P75 |
-					BYT_RT5640_MCLK_EN),
-	},
-	{
+		/* Asus T100TAF, unlike other T100TA* models this one has a mono speaker */
 		.matches = {
 			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
 			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "T100TAF"),
@@ -660,6 +650,18 @@ static const struct dmi_system_id byt_rt5640_quirk_table[] = {
 					BYT_RT5640_SSP0_AIF2 |
 					BYT_RT5640_MCLK_EN),
 	},
+	{
+		/* Asus T100TA and T100TAM, must come after T100TAF (mono spk) match */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "T100TA"),
+		},
+		.driver_data = (void *)(BYT_RT5640_IN1_MAP |
+					BYT_RT5640_JD_SRC_JD2_IN4N |
+					BYT_RT5640_OVCD_TH_2000UA |
+					BYT_RT5640_OVCD_SF_0P75 |
+					BYT_RT5640_MCLK_EN),
+	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
-- 
2.44.0

