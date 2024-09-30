Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D792989D12
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Sep 2024 10:42:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 756041667;
	Mon, 30 Sep 2024 10:42:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 756041667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727685755;
	bh=y9huMzB6rOuONUGS4ISS/X7ZtTl4WwWDd3IJzHW0Q28=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=lOlyEBgyhuwmHCzAWgf+5H0waDsCyBe8+IUXuWBLWtuCpG0fIxs24ItANGH6AaRt6
	 aEW/mj5DVBIcE5vBrem2fczah6gH4Pod2+pc9Pu4BykAecl9I3qf6V+Jo0TVAX2Ocd
	 qKdYWC7PRgA8wFjEwGhTcXYDxH9CqoB2rEVWUY3Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 18355F805A8; Mon, 30 Sep 2024 10:42:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C8D6F805B2;
	Mon, 30 Sep 2024 10:42:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7F9DCF80517; Mon, 30 Sep 2024 10:42:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com
 [136.143.188.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F41EDF800FA
	for <alsa-devel@alsa-project.org>; Mon, 30 Sep 2024 10:42:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F41EDF800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=oldherl.one header.i=me@oldherl.one header.a=rsa-sha256
 header.s=default header.b=dSzWHyCX
ARC-Seal: i=1; a=rsa-sha256; t=1727685714; cv=none;
	d=zohomail.com; s=zohoarc;
	b=hS7eN2ENGchPfMaP82XV6YRSK4KqWPxA2OPcPaq//IKgmmg+e46UUNgH2QW5HzeIg0AYuATHIBmVdwCS5FwHtOYSNuxWiZMbG1MURLiDq+gvkYaweumGxGU4wWBtEg045pjhzvQ5YtUailxtN0dTUMiWyX+gi03UCvPPxhZQHDc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc;
	t=1727685714;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
	bh=FS70sCLpEmOtHtY7NOLJOBz5dg5XntphmD7A644mQ3o=;
	b=fQBjaPa+KyVF/flBctxyJKZJwpuJJJmdQIjPqouzjwuroLbqhmsNTbz7Qb78PUAeH3NyNxkrOtAJopiqSmVYTdFyKxfmBAWmafp1FKJvked/SGyt0SscxxUD4DDPlY8s5akjOq7r7K4sQ/+SN2iLndKta6DqAbqRY9SCaux9oKs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=oldherl.one;
	spf=pass  smtp.mailfrom=me@oldherl.one;
	dmarc=pass header.from=<me@oldherl.one>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1727685714;
	s=default; d=oldherl.one; i=me@oldherl.one;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=FS70sCLpEmOtHtY7NOLJOBz5dg5XntphmD7A644mQ3o=;
	b=dSzWHyCXGLH1ApYyqIO+8wrV8RkXROZuiN9x8bAW8ei7B9q/2EuPEPgRV7cV77LC
	W5d5BKT4FZ0CatrIjyw6xu6WIg8hhzBC5bJ4zmjb99blPZjVRZzrpQrUQb/meDYlXug
	QjI3daG9c2sWOflGsHqFRwZ6gtCnOC1WIuGsP8SM=
Received: by mx.zohomail.com with SMTPS id 1727685712981584.5204059476857;
	Mon, 30 Sep 2024 01:41:52 -0700 (PDT)
From: Oldherl Oh <me@oldherl.one>
To: alsa-devel@alsa-project.org
Cc: bo.liu@senarytech.com,
	tiwai@suse.de,
	Oldherl Oh <me@oldherl.one>
Subject: [PATCH v2] ALSA: hda/conexant: fix some typos
Date: Mon, 30 Sep 2024 16:41:32 +0800
Message-ID: <20240930084132.3373750-1-me@oldherl.one>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
Message-ID-Hash: KUU6PWB2GFFSCWIL5CZ4EESTKM6XWPPV
X-Message-ID-Hash: KUU6PWB2GFFSCWIL5CZ4EESTKM6XWPPV
X-MailFrom: me@oldherl.one
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KUU6PWB2GFFSCWIL5CZ4EESTKM6XWPPV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Fix some typos in patch_conexant.c

Signed-off-by: Oldherl Oh <me@oldherl.one>
---
 sound/pci/hda/patch_conexant.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/pci/hda/patch_conexant.c b/sound/pci/hda/patch_conexant.c
index e851785ff058..ade42a8209c2 100644
--- a/sound/pci/hda/patch_conexant.c
+++ b/sound/pci/hda/patch_conexant.c
@@ -166,18 +166,18 @@ static void cxt_init_gpio_led(struct hda_codec *codec)
 
 static void cx_fixup_headset_recog(struct hda_codec *codec)
 {
-	unsigned int mic_persent;
+	unsigned int mic_present;
 
 	/* fix some headset type recognize fail issue, such as EDIFIER headset */
-	/* set micbiasd output current comparator threshold from 66% to 55%. */
+	/* set micbias output current comparator threshold from 66% to 55%. */
 	snd_hda_codec_write(codec, 0x1c, 0, 0x320, 0x010);
-	/* set OFF voltage for DFET from -1.2V to -0.8V, set headset micbias registor
+	/* set OFF voltage for DFET from -1.2V to -0.8V, set headset micbias register
 	 * value adjustment trim from 2.2K ohms to 2.0K ohms.
 	 */
 	snd_hda_codec_write(codec, 0x1c, 0, 0x3b0, 0xe10);
 	/* fix reboot headset type recognize fail issue */
-	mic_persent = snd_hda_codec_read(codec, 0x19, 0, AC_VERB_GET_PIN_SENSE, 0x0);
-	if (mic_persent & AC_PINSENSE_PRESENCE)
+	mic_present = snd_hda_codec_read(codec, 0x19, 0, AC_VERB_GET_PIN_SENSE, 0x0);
+	if (mic_present & AC_PINSENSE_PRESENCE)
 		/* enable headset mic VREF */
 		snd_hda_codec_write(codec, 0x19, 0, AC_VERB_SET_PIN_WIDGET_CONTROL, 0x24);
 	else
@@ -249,9 +249,9 @@ static void cx_update_headset_mic_vref(struct hda_codec *codec, struct hda_jack_
 {
 	unsigned int mic_present;
 
-	/* In cx8070 and sn6140, the node 16 can only be config to headphone or disabled,
-	 * the node 19 can only be config to microphone or disabled.
-	 * Check hp&mic tag to process headset pulgin&plugout.
+	/* In cx8070 and sn6140, the node 16 can only be configured to headphone or disabled,
+	 * the node 19 can only be configured to microphone or disabled.
+	 * Check hp&mic tag to process headset plugin & plugout.
 	 */
 	mic_present = snd_hda_codec_read(codec, 0x19, 0, AC_VERB_GET_PIN_SENSE, 0x0);
 	if (!(mic_present & AC_PINSENSE_PRESENCE)) /* mic plugout */
-- 
2.46.2

