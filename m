Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 462F6816276
	for <lists+alsa-devel@lfdr.de>; Sun, 17 Dec 2023 22:34:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C6B2E72;
	Sun, 17 Dec 2023 22:34:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C6B2E72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702848883;
	bh=1SmFbVPoevmpQxkwkkL6VWfcw0KlXc7pKXNdXnfM2ao=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=O91hPJqt96IB4YAu6TjZ/SnsW74lS3j44zyKeP7dejMt9P+xNWfPt1j4EYvbEgLAJ
	 4XV8YBojDSdu4g69NMEKLZlhxL3m0temHol8nhTif7bIjMuFM0t2HGpoXHOYl60Rmn
	 Vq4Nss1zbX7ofDO2TqcUqAl0OmSdDHhVZcqBaCAg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8AB27F8057C; Sun, 17 Dec 2023 22:34:11 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5045BF8057C;
	Sun, 17 Dec 2023 22:34:10 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 231AAF80431; Sun, 17 Dec 2023 22:32:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 549E3F8016E
	for <alsa-devel@alsa-project.org>; Sun, 17 Dec 2023 22:32:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 549E3F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=R9lhaypq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702848749;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=boZv8rr8BEp7iPXnCbUwAHacbqncLxKRM2vsVZ1vGPw=;
	b=R9lhaypqfIn7Jp+6Rjb2LRQeFIKlasq62lu8vViSlrhXfhe+EvLFUpWVhtkksWullJ+eHq
	9smhSSSQhcAC9CN2mJVeS2ST8OngfXjBNqsB5NkrpipW1HrC8RxXywlIMyeC9UDDfWwXe2
	60ET+iC3jfvNXjqm3Q7AQR8Z2Tif3m4=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-338-BFjcL7FePma95r7-c79l-g-1; Sun,
 17 Dec 2023 16:32:25 -0500
X-MC-Unique: BFjcL7FePma95r7-c79l-g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 384A91C0514C;
	Sun, 17 Dec 2023 21:32:25 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.105])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 40F6151D5;
	Sun, 17 Dec 2023 21:32:24 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Mark Brown <broonie@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	alsa-devel@alsa-project.org
Subject: [PATCH 2/2] ASoC: Intel: bytcr_rt5640: Add new swapped-speakers quirk
Date: Sun, 17 Dec 2023 22:32:21 +0100
Message-ID: <20231217213221.49424-2-hdegoede@redhat.com>
In-Reply-To: <20231217213221.49424-1-hdegoede@redhat.com>
References: <20231217213221.49424-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: Q76SC43WNXME7ZBPWNTBWTUVG4GZIVJV
X-Message-ID-Hash: Q76SC43WNXME7ZBPWNTBWTUVG4GZIVJV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q76SC43WNXME7ZBPWNTBWTUVG4GZIVJV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Some BYTCR x86 tablets with a rt5640 codec have the left and right channels
of their speakers swapped.

Add a new BYT_RT5640_SWAPPED_SPEAKERS quirk for this which sets
cfg-spk:swapped in the components string to let userspace know
about the swapping so that the UCM profile can configure the mixer
to correct this.

Enable this new quirk on the Medion Lifetab S10346 which has its
speakers swapped.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/intel/boards/bytcr_rt5640.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index ea9e562358b7..42466b4b1ca4 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -83,6 +83,7 @@ enum {
 #define BYT_RT5640_HSMIC2_ON_IN1	BIT(27)
 #define BYT_RT5640_JD_HP_ELITEP_1000G2	BIT(28)
 #define BYT_RT5640_USE_AMCR0F28		BIT(29)
+#define BYT_RT5640_SWAPPED_SPEAKERS	BIT(30)
 
 #define BYTCR_INPUT_DEFAULTS				\
 	(BYT_RT5640_IN3_MAP |				\
@@ -157,6 +158,8 @@ static void log_quirks(struct device *dev)
 		dev_info(dev, "quirk MONO_SPEAKER enabled\n");
 	if (byt_rt5640_quirk & BYT_RT5640_NO_SPEAKERS)
 		dev_info(dev, "quirk NO_SPEAKERS enabled\n");
+	if (byt_rt5640_quirk & BYT_RT5640_SWAPPED_SPEAKERS)
+		dev_info(dev, "quirk SWAPPED_SPEAKERS enabled\n");
 	if (byt_rt5640_quirk & BYT_RT5640_LINEOUT)
 		dev_info(dev, "quirk LINEOUT enabled\n");
 	if (byt_rt5640_quirk & BYT_RT5640_LINEOUT_AS_HP2)
@@ -903,6 +906,7 @@ static const struct dmi_system_id byt_rt5640_quirk_table[] = {
 			DMI_MATCH(DMI_BIOS_DATE, "10/22/2015"),
 		},
 		.driver_data = (void *)(BYTCR_INPUT_DEFAULTS |
+					BYT_RT5640_SWAPPED_SPEAKERS |
 					BYT_RT5640_SSP0_AIF1 |
 					BYT_RT5640_MCLK_EN),
 	},
@@ -1631,11 +1635,11 @@ static int snd_byt_rt5640_mc_probe(struct platform_device *pdev)
 	const char *platform_name;
 	struct acpi_device *adev;
 	struct device *codec_dev;
+	const char *cfg_spk;
 	bool sof_parent;
 	int ret_val = 0;
 	int dai_index = 0;
-	int i, cfg_spk;
-	int aif;
+	int i, aif;
 
 	is_bytcr = false;
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
@@ -1795,13 +1799,16 @@ static int snd_byt_rt5640_mc_probe(struct platform_device *pdev)
 	}
 
 	if (byt_rt5640_quirk & BYT_RT5640_NO_SPEAKERS) {
-		cfg_spk = 0;
+		cfg_spk = "0";
 		spk_type = "none";
 	} else if (byt_rt5640_quirk & BYT_RT5640_MONO_SPEAKER) {
-		cfg_spk = 1;
+		cfg_spk = "1";
 		spk_type = "mono";
+	} else if (byt_rt5640_quirk & BYT_RT5640_SWAPPED_SPEAKERS) {
+		cfg_spk = "swapped";
+		spk_type = "swapped";
 	} else {
-		cfg_spk = 2;
+		cfg_spk = "2";
 		spk_type = "stereo";
 	}
 
@@ -1816,7 +1823,7 @@ static int snd_byt_rt5640_mc_probe(struct platform_device *pdev)
 		headset2_string = " cfg-hs2:in1";
 
 	snprintf(byt_rt5640_components, sizeof(byt_rt5640_components),
-		 "cfg-spk:%d cfg-mic:%s aif:%d%s%s", cfg_spk,
+		 "cfg-spk:%s cfg-mic:%s aif:%d%s%s", cfg_spk,
 		 map_name[BYT_RT5640_MAP(byt_rt5640_quirk)], aif,
 		 lineout_string, headset2_string);
 	byt_rt5640_card.components = byt_rt5640_components;
-- 
2.41.0

