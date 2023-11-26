Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B83C57F9592
	for <lists+alsa-devel@lfdr.de>; Sun, 26 Nov 2023 22:42:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 651401DA;
	Sun, 26 Nov 2023 22:42:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 651401DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701034963;
	bh=5a6UxLMkYCoRY/ZTZcy5zqr6MzMx1Ku3LncH2NU6oDI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fjZD6fFOc0l2Y8Wp1oK9U9zfiNu2pVQOG6mcJmbNN2ftmV0KQdPnrqsROyHjt4tVu
	 PxDvcB8nHTMQlMc1dIuqTN5Rny7G1vlDT/6je0gIUOEMSjSMi467BnYCPEOUzCmSDu
	 OdzI0kUm4COsUb/VVphagrYJi3ylPR4bPM52z46s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EC917F80631; Sun, 26 Nov 2023 22:41:16 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A0715F80630;
	Sun, 26 Nov 2023 22:41:15 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2E1C5F80254; Sun, 26 Nov 2023 22:40:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 92451F801D5
	for <alsa-devel@alsa-project.org>; Sun, 26 Nov 2023 22:40:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92451F801D5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=U6rtb8cZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701034846;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ll37FvkGmiQH7qd7Vw3fClsZcW9BQMgeej3D6lTCy7E=;
	b=U6rtb8cZ6s91SOIPPcGMGtl64Su/ukOykGGg0yL7aAki4m2a3tTOCmtC2uYnFIvfhRV/W6
	/Mr1YK2TN1XsBbRp4uA5hOe9EVJ1GWIuT38GtGfUigrlRpugeAsW6TCfOhcpFXX+27/ChA
	zj4Td2u5TsRJcqacqNUg34E+qL8SCz8=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-85-CiutLTdKPlqXdhyKc-c50g-1; Sun,
 26 Nov 2023 16:40:42 -0500
X-MC-Unique: CiutLTdKPlqXdhyKc-c50g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 684433C02792;
	Sun, 26 Nov 2023 21:40:42 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.41])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 538881C060B0;
	Sun, 26 Nov 2023 21:40:41 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Mark Brown <broonie@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	alsa-devel@alsa-project.org
Subject: [PATCH 6/7] ASoC: rt5645: Add mono speaker information to the
 components string
Date: Sun, 26 Nov 2023 22:40:23 +0100
Message-ID: <20231126214024.300505-7-hdegoede@redhat.com>
In-Reply-To: <20231126214024.300505-1-hdegoede@redhat.com>
References: <20231126214024.300505-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: QZ62KD5OK5ZPRKGTOBF3BUJLDTQEKPOC
X-Message-ID-Hash: QZ62KD5OK5ZPRKGTOBF3BUJLDTQEKPOC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QZ62KD5OK5ZPRKGTOBF3BUJLDTQEKPOC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The GPD Win and Teclast X80 Pro both only have 1 speaker add information
about this to the components string.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/codecs/rt5645.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt5645.c b/sound/soc/codecs/rt5645.c
index 4f3ef004f555..e109ee2e321c 100644
--- a/sound/soc/codecs/rt5645.c
+++ b/sound/soc/codecs/rt5645.c
@@ -428,6 +428,9 @@ struct rt5645_platform_data {
 	/* Invert HP detect status polarity */
 	bool inv_hp_pol;
 
+	/* Only 1 speaker connected */
+	bool mono_speaker;
+
 	/* Value to assign to snd_soc_card.long_name */
 	const char *long_name;
 
@@ -3653,6 +3656,7 @@ static const struct rt5645_platform_data buddy_platform_data = {
 static const struct rt5645_platform_data gpd_win_platform_data = {
 	.jd_mode = 3,
 	.inv_jd1_1 = true,
+	.mono_speaker = true,
 	.long_name = "gpd-win-pocket-rt5645",
 	/* The GPD pocket has a diff. mic, for the win this does not matter. */
 	.in2_diff = true,
@@ -3676,6 +3680,11 @@ static const struct rt5645_platform_data lenovo_ideapad_miix_310_pdata = {
 	.in2_diff = true,
 };
 
+static const struct rt5645_platform_data jd_mode3_monospk_platform_data = {
+	.jd_mode = 3,
+	.mono_speaker = true,
+};
+
 static const struct rt5645_platform_data jd_mode3_platform_data = {
 	.jd_mode = 3,
 };
@@ -3795,7 +3804,7 @@ static const struct dmi_system_id dmi_platform_data[] = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TECLAST"),
 			DMI_MATCH(DMI_PRODUCT_NAME, "X80 Pro"),
 		},
-		.driver_data = (void *)&jd_mode3_platform_data,
+		.driver_data = (void *)&jd_mode3_monospk_platform_data,
 	},
 	{
 		.ident = "Lenovo Ideapad Miix 310",
@@ -3911,6 +3920,9 @@ const char *rt5645_components(struct device *codec_dev)
 
 	rt5645_get_pdata(codec_dev, &pdata);
 
+	if (pdata.mono_speaker)
+		spk = 1;
+
 	if (pdata.dmic1_data_pin && pdata.dmic2_data_pin)
 		mic = "dmics12";
 	else if (pdata.dmic1_data_pin)
-- 
2.41.0

