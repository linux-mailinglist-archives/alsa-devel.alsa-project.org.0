Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5416A85048A
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Feb 2024 14:44:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C65C0950;
	Sat, 10 Feb 2024 14:44:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C65C0950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707572698;
	bh=q+3I7JL6xymgeWGNmO96Zf6DFrL8mskL5/lKRc0EW8c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tyHz+i+APh+GgQV+uH4aKuWMJd9rHVWObyUh9WUooywBCBvyeR9SVhd16T8niVZkO
	 P/fNphlUfwAZLcQ4f7myRZxwCNXqihNdZV/DgqOq02gxWfodFLfjKms4TNiTDEH7wQ
	 RfeegECjnjDWa7TdrNR0k0wh9UeYzwtzwiuqjJa0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2741FF805A1; Sat, 10 Feb 2024 14:44:25 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 45263F8057C;
	Sat, 10 Feb 2024 14:44:25 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4741AF80548; Sat, 10 Feb 2024 14:44:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EB788F8016E
	for <alsa-devel@alsa-project.org>; Sat, 10 Feb 2024 14:44:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB788F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=Zozt2yxI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707572646;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jmGE/9tI09rWo4NVLVxZ5r2vdCrPHXjaWtS/C34Vjb4=;
	b=Zozt2yxIgRtjVi9pyLUSouyiwkgPtdTypoobQrKEeaT8JnaxgLEtcSrQeS96RdQFSqMWft
	c4zHua15ej3jk++cpGGqyo48gycAlsfNQ0kzupfkSgo//AuFHphxnP4zA7M2ukwWXA28VK
	2LZk2YrXBNISXSCVIshhLpxKexRURlA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-557-PHF3jQy7MGCb9oLWabgQTA-1; Sat, 10 Feb 2024 08:44:04 -0500
X-MC-Unique: PHF3jQy7MGCb9oLWabgQTA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5E3C0185A781;
	Sat, 10 Feb 2024 13:44:04 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.79])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 08EF940C9444;
	Sat, 10 Feb 2024 13:44:02 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Mark Brown <broonie@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	alsa-devel@alsa-project.org,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 6.8 regression fix 1/2] ASoC: Intel: Boards: Fix NULL pointer
 deref in BYT/CHT boards
Date: Sat, 10 Feb 2024 14:43:59 +0100
Message-ID: <20240210134400.24913-2-hdegoede@redhat.com>
In-Reply-To: <20240210134400.24913-1-hdegoede@redhat.com>
References: <20240210134400.24913-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: ZH3DGFAITHFDNTTEVYAVNBFSTPNLT7AY
X-Message-ID-Hash: ZH3DGFAITHFDNTTEVYAVNBFSTPNLT7AY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZH3DGFAITHFDNTTEVYAVNBFSTPNLT7AY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Since commit 13f58267cda3 ("ASoC: soc.h: don't create dummy Component
via COMP_DUMMY()") dummy snd_soc_dai_link.codecs entries no longer
have a name set.

This means that when looking for the codec dai_link the machine
driver can no longer unconditionally run strcmp() on
snd_soc_dai_link.codecs[0].name since this may now be NULL.

Add a check for snd_soc_dai_link.codecs[0].name being NULL to all
BYT/CHT machine drivers to avoid NULL pointer dereferences in
their probe() methods.

Fixes: 13f58267cda3 ("ASoC: soc.h: don't create dummy Component via COMP_DUMMY()")
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/intel/boards/bytcht_cx2072x.c | 3 ++-
 sound/soc/intel/boards/bytcht_da7213.c  | 3 ++-
 sound/soc/intel/boards/bytcht_es8316.c  | 3 ++-
 sound/soc/intel/boards/bytcr_rt5640.c   | 3 ++-
 sound/soc/intel/boards/bytcr_rt5651.c   | 3 ++-
 sound/soc/intel/boards/bytcr_wm5102.c   | 3 ++-
 sound/soc/intel/boards/cht_bsw_rt5645.c | 3 ++-
 sound/soc/intel/boards/cht_bsw_rt5672.c | 3 ++-
 8 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/sound/soc/intel/boards/bytcht_cx2072x.c b/sound/soc/intel/boards/bytcht_cx2072x.c
index 10a84a2c1036..c014d85a08b2 100644
--- a/sound/soc/intel/boards/bytcht_cx2072x.c
+++ b/sound/soc/intel/boards/bytcht_cx2072x.c
@@ -241,7 +241,8 @@ static int snd_byt_cht_cx2072x_probe(struct platform_device *pdev)
 
 	/* fix index of codec dai */
 	for (i = 0; i < ARRAY_SIZE(byt_cht_cx2072x_dais); i++) {
-		if (!strcmp(byt_cht_cx2072x_dais[i].codecs->name,
+		if (byt_cht_cx2072x_dais[i].codecs->name &&
+		    !strcmp(byt_cht_cx2072x_dais[i].codecs->name,
 			    "i2c-14F10720:00")) {
 			dai_index = i;
 			break;
diff --git a/sound/soc/intel/boards/bytcht_da7213.c b/sound/soc/intel/boards/bytcht_da7213.c
index 7e5eea690023..f4ac3ddd148b 100644
--- a/sound/soc/intel/boards/bytcht_da7213.c
+++ b/sound/soc/intel/boards/bytcht_da7213.c
@@ -245,7 +245,8 @@ static int bytcht_da7213_probe(struct platform_device *pdev)
 
 	/* fix index of codec dai */
 	for (i = 0; i < ARRAY_SIZE(dailink); i++) {
-		if (!strcmp(dailink[i].codecs->name, "i2c-DLGS7213:00")) {
+		if (dailink[i].codecs->name &&
+		    !strcmp(dailink[i].codecs->name, "i2c-DLGS7213:00")) {
 			dai_index = i;
 			break;
 		}
diff --git a/sound/soc/intel/boards/bytcht_es8316.c b/sound/soc/intel/boards/bytcht_es8316.c
index 1564a88a885e..2fcec2e02bb5 100644
--- a/sound/soc/intel/boards/bytcht_es8316.c
+++ b/sound/soc/intel/boards/bytcht_es8316.c
@@ -546,7 +546,8 @@ static int snd_byt_cht_es8316_mc_probe(struct platform_device *pdev)
 
 	/* fix index of codec dai */
 	for (i = 0; i < ARRAY_SIZE(byt_cht_es8316_dais); i++) {
-		if (!strcmp(byt_cht_es8316_dais[i].codecs->name,
+		if (byt_cht_es8316_dais[i].codecs->name &&
+		    !strcmp(byt_cht_es8316_dais[i].codecs->name,
 			    "i2c-ESSX8316:00")) {
 			dai_index = i;
 			break;
diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index 42466b4b1ca4..03be5e26ec4a 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -1652,7 +1652,8 @@ static int snd_byt_rt5640_mc_probe(struct platform_device *pdev)
 
 	/* fix index of codec dai */
 	for (i = 0; i < ARRAY_SIZE(byt_rt5640_dais); i++) {
-		if (!strcmp(byt_rt5640_dais[i].codecs->name,
+		if (byt_rt5640_dais[i].codecs->name &&
+		    !strcmp(byt_rt5640_dais[i].codecs->name,
 			    "i2c-10EC5640:00")) {
 			dai_index = i;
 			break;
diff --git a/sound/soc/intel/boards/bytcr_rt5651.c b/sound/soc/intel/boards/bytcr_rt5651.c
index f9fe8414f454..80c841b000a3 100644
--- a/sound/soc/intel/boards/bytcr_rt5651.c
+++ b/sound/soc/intel/boards/bytcr_rt5651.c
@@ -910,7 +910,8 @@ static int snd_byt_rt5651_mc_probe(struct platform_device *pdev)
 
 	/* fix index of codec dai */
 	for (i = 0; i < ARRAY_SIZE(byt_rt5651_dais); i++) {
-		if (!strcmp(byt_rt5651_dais[i].codecs->name,
+		if (byt_rt5651_dais[i].codecs->name &&
+		    !strcmp(byt_rt5651_dais[i].codecs->name,
 			    "i2c-10EC5651:00")) {
 			dai_index = i;
 			break;
diff --git a/sound/soc/intel/boards/bytcr_wm5102.c b/sound/soc/intel/boards/bytcr_wm5102.c
index 6978ebde6693..cccb5e90c0fe 100644
--- a/sound/soc/intel/boards/bytcr_wm5102.c
+++ b/sound/soc/intel/boards/bytcr_wm5102.c
@@ -605,7 +605,8 @@ static int snd_byt_wm5102_mc_probe(struct platform_device *pdev)
 
 	/* find index of codec dai */
 	for (i = 0; i < ARRAY_SIZE(byt_wm5102_dais); i++) {
-		if (!strcmp(byt_wm5102_dais[i].codecs->name,
+		if (byt_wm5102_dais[i].codecs->name &&
+		    !strcmp(byt_wm5102_dais[i].codecs->name,
 			    "wm5102-codec")) {
 			dai_index = i;
 			break;
diff --git a/sound/soc/intel/boards/cht_bsw_rt5645.c b/sound/soc/intel/boards/cht_bsw_rt5645.c
index c952a96cde7e..7773f61064f4 100644
--- a/sound/soc/intel/boards/cht_bsw_rt5645.c
+++ b/sound/soc/intel/boards/cht_bsw_rt5645.c
@@ -571,7 +571,8 @@ static int snd_cht_mc_probe(struct platform_device *pdev)
 
 	/* set correct codec name */
 	for (i = 0; i < ARRAY_SIZE(cht_dailink); i++)
-		if (!strcmp(card->dai_link[i].codecs->name,
+		if (card->dai_link[i].codecs->name &&
+		    !strcmp(card->dai_link[i].codecs->name,
 			    "i2c-10EC5645:00")) {
 			card->dai_link[i].codecs->name = drv->codec_name;
 			dai_index = i;
diff --git a/sound/soc/intel/boards/cht_bsw_rt5672.c b/sound/soc/intel/boards/cht_bsw_rt5672.c
index 8cf0b33cc02e..be2d1a8dbca8 100644
--- a/sound/soc/intel/boards/cht_bsw_rt5672.c
+++ b/sound/soc/intel/boards/cht_bsw_rt5672.c
@@ -466,7 +466,8 @@ static int snd_cht_mc_probe(struct platform_device *pdev)
 
 	/* find index of codec dai */
 	for (i = 0; i < ARRAY_SIZE(cht_dailink); i++) {
-		if (!strcmp(cht_dailink[i].codecs->name, RT5672_I2C_DEFAULT)) {
+		if (cht_dailink[i].codecs->name &&
+		    !strcmp(cht_dailink[i].codecs->name, RT5672_I2C_DEFAULT)) {
 			dai_index = i;
 			break;
 		}
-- 
2.43.0

