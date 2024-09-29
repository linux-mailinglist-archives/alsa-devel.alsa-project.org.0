Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE7B989629
	for <lists+alsa-devel@lfdr.de>; Sun, 29 Sep 2024 17:43:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 745E4EDB;
	Sun, 29 Sep 2024 17:43:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 745E4EDB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727624625;
	bh=5cgMJIPoJnH+nqL6SlA94twY3wXwncI6wpQHIa6225c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=s6cDgJu0qcddTsVJgsfJiTXcSAsgxHB58rQOiIQaHzmgu72nughTJ95UlSFtrW/IH
	 rJSxqu3kRBNR6ew1m/FcWhXHAAV2I91HStMUU/L884sdyN+pd0Nrho1WSolunB3OO+
	 AEoqwTVzywvwUsqKe/Au8wRNsYb9B0wXMP0Hp1vw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6AD62F805D8; Sun, 29 Sep 2024 17:43:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E6CCAF805CB;
	Sun, 29 Sep 2024 17:43:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 622D2F805B1; Sun, 29 Sep 2024 17:43:05 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 18935F805B5
	for <alsa-devel@alsa-project.org>; Sun, 29 Sep 2024 17:43:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18935F805B5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=oldherl.one header.i=me@oldherl.one header.a=rsa-sha256
 header.s=default header.b=KdoGMQ7x
ARC-Seal: i=1; a=rsa-sha256; t=1727624573; cv=none;
	d=zohomail.com; s=zohoarc;
	b=Zw/Wz8SKj7pCowEMjpPA0yCuJqrmauytcXRfBNNAXL7BSTcJO7uLCYNtJaGHEeJTB4aVuggXA32e/hlCWcAPaXhXUC9pHaZdnfDNbfuyfeXtXt1A8x+KKBn3TPHzsg3QhfWUa7PSgWor6RvL2w8g8KbIT3Wgu4q1FuoQZ2zro4A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc;
	t=1727624573;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
	bh=OWpDz5+H7edUVGFMnZF/6D838QrH+gRt/pugX+NjcWU=;
	b=HBaXWqHENfazCj3GQyF7q0xyoYk5gj7pZuq71YbkwGj7DoN383BlOq7zS2GMolRieTAqR+5uuAHp6nWIolzpj6R1pS3GPkpMikUSIzYxAVMphyfLn3M8ZcBgIaELBvOvbkYJpbXQi/xbNueEd5Bk0Q0U2fZ/cpAofnxBoLzh9BA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=oldherl.one;
	spf=pass  smtp.mailfrom=me@oldherl.one;
	dmarc=pass header.from=<me@oldherl.one>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1727624573;
	s=default; d=oldherl.one; i=me@oldherl.one;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=OWpDz5+H7edUVGFMnZF/6D838QrH+gRt/pugX+NjcWU=;
	b=KdoGMQ7xBjS5ex9/HdbeAcbRo73zy9DMJ6X6Fkn8UmVZaYQAgWXj8+eehm0jE7SV
	8UJzdCXHVtpcelAchz6a0IuuyojLJPsGV7xjBnOSM2s20730mB8ONMaLW36i+d6eIrX
	2JYTY5N2LbHfF4wiePiyCM/m02GvTVi//3BQC7co=
Received: by mx.zohomail.com with SMTPS id 1727624572918409.08377131521456;
	Sun, 29 Sep 2024 08:42:52 -0700 (PDT)
From: Oldherl Oh <me@oldherl.one>
To: alsa-devel@alsa-project.org
Cc: bo.liu@senarytech.com,
	tiwai@suse.de,
	Oldherl Oh <me@oldherl.one>
Subject: [PATCH] ALSA: hda/conexant: fix some typos
Date: Sun, 29 Sep 2024 23:41:00 +0800
Message-ID: <20240929154223.1869717-2-me@oldherl.one>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20240929154223.1869717-1-me@oldherl.one>
References: <20240929154223.1869717-1-me@oldherl.one>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
Message-ID-Hash: 5XHJHYFOM4TASWPBERW3EX5MRHFR7DYB
X-Message-ID-Hash: 5XHJHYFOM4TASWPBERW3EX5MRHFR7DYB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5XHJHYFOM4TASWPBERW3EX5MRHFR7DYB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Fix some typos in patch_conexant.c
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

