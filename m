Return-Path: <alsa-devel-bounces@alsa-project.org>
Delivered-To: lists+alsa-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qELdHjtdqGmZtgAAu9opvQ
	(envelope-from <alsa-devel-bounces@alsa-project.org>)
	for <lists+alsa-devel@lfdr.de>; Wed, 04 Mar 2026 17:26:35 +0100
X-Original-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30427204386
	for <lists+alsa-devel@lfdr.de>; Wed, 04 Mar 2026 17:26:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9DCBA602B7;
	Wed,  4 Mar 2026 17:26:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9DCBA602B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1772641594;
	bh=Ufx2LQuVsPemONElURIztMjbQMMbf+4gtqztqAWWexA=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ON7HorqvcwGtf3EFiahxIKx5vK+UWdlr2nt7X3KUQAsTcq4Mi5EF/hEdM8HoH57rj
	 OcfL/UYNIR5cfnEt4DoC3VB3j6oTRyL8b1160ozzRTrLcRCYPSe+QsUHjOzo9bzWKX
	 NnbQenww3AZClo5T6Lou8J07gzFf8zdjJqAh+K2o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1FA9CF80698; Wed,  4 Mar 2026 17:25:13 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 92D46F80692;
	Wed,  4 Mar 2026 17:25:13 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D7010F80224; Fri, 13 Feb 2026 15:13:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-0.8 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FROM,NML_ADSP_CUSTOM_MED,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E9598F800D0
	for <alsa-devel@alsa-project.org>; Fri, 13 Feb 2026 15:13:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9598F800D0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=RhGz/iT/
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-2a929245b6aso10395905ad.0
        for <alsa-devel@alsa-project.org>;
 Fri, 13 Feb 2026 06:13:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770991994; x=1771596794;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BUN5m9KdWt5VPnYVJOX/YZHFeP0Re4SEll9bpIlXeb0=;
        b=RhGz/iT/la563anebBcAImwxh0MN8UT3rqt9TwH+K3zG9OBSfvOT/mw7kaFKDF3U0V
         Ce4pjaSpbn0jX787XBoLayEDfb5119uF2WAkLy5R9BFUE/o6OGKJ8bflhLGHTAvVc5W8
         ltBcEiva+0Evk+dj3Z2zNW/kUWU3ql+yLqVKoJbdhDsKwDcTlezQ4BJ/8O//W9POdb7A
         3roSOxUOvhsxHNTaGNUl9oFUQUjaqxWKSBzG/dY+/NSClqujA6si4AYSADYFHwMlfqbT
         IewT0XmH+6RU0jnCE33du/SwiZeQKn3IMclJ/RUPJdD+IuOF6LmYgL6zBTOdKfFtKai5
         wm2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770991994; x=1771596794;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BUN5m9KdWt5VPnYVJOX/YZHFeP0Re4SEll9bpIlXeb0=;
        b=X1k5KOCqMgc2O1ViVxy50zWViMlk8Sm0zlk5KlZp5IaEgJoEzBnat3+LXmz14JziSS
         X/cqzm4x+utbjxcOqX6eyJX/vRPVHKz5MVDadCklrybm8HZbBTE64sj6C/i5XOw4pMFW
         FTQWXCI1la02tbaQiu634bKehQz48PNVMijLDDzzvJwIDtTSI92eThEZXpdNk2N+jc4w
         ZxymV10yoKCk0uA5YX1Dy7nfOymhnBfO1cmKvEC0YvsM+AS25XSTtY9j9g/jSk46vU/v
         8JAqtqT9WNgwXNs3R/4OpQcK3cMZMkI5ddk2kMK9aYhwEYTYLOOZpZd6mv04zgkGlbVf
         NHQg==
X-Gm-Message-State: AOJu0Yx9fh7HE/aNY9CR83GxHYwt3otzVCVFTqkiQbv5p1PFek8c6XKi
	GYXwmCu7bpdPC7Flbb+dCrNReODjnEZGHZ4q8jwb7Ky8PeenMQUGDN4irurRzCCQ
X-Gm-Gg: AZuq6aKEdxpgy25qIFo49VuXhcmjCb4kFnA5vOL2cifIvwn4ACatT1807urGk5OgInx
	ZFRTEsM7X59YueaWxOUcYpnK8pJRRdQOQ2ZdcIxn8pt/oVXvgHA1pvKYpm0PTtSBvz0XIpJ/8/p
	VnwCfBI4U2rgT7o2ABx26L5PGQYAV2o4lWw2vZ7YQNZYTs/JBEgHctfDOfiMhEyVG4ReJyfJrWs
	AiBgkYAavkEEzmsTmrPWIblTrU6rCmoN6Lh7g9SkKIMzlOuND+Z2zxmGzUKWVZpqsV5OqKrSV38
	Aw8mmM8T16wzJ6xicyL5QVEZgSO+ZbkCFXSc7swWu7TzMcRI3nY2aTvOcSa0fnZQcHhkDz8Knb8
	95llaeHSLwn6cB1mGmIpOKS122yqtPwDenQqfZS/u1a5ZbSlrL+CbUktvVcEAhJMZTEV2CcIIoZ
	f8jMfowhGkPwBVHEIzZVhsbIahXdlKoeTQekyTpPuAbB+bKOmEJycKFKx+hi8peaFDaL7aBxU5C
	G4QYuzjoZd2yhfoHdIlfItHx23CSb0cpoDA8EI=
X-Received: by 2002:a17:902:d48d:b0:2a7:9592:210a with SMTP id
 d9443c01a7336-2ab505b1c60mr18630785ad.33.1770991994090;
        Fri, 13 Feb 2026 06:13:14 -0800 (PST)
Received: from localhost.localdomain
 (wnpgmb016qw-ds01-160-103-199.dynamic.bellmts.net. [142.160.103.199])
        by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ab29998b2esm85046215ad.83.2026.02.13.06.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 06:13:13 -0800 (PST)
From: Rob Hermann <supgeek@gmail.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	kailang@realtek.com,
	supgeek@gmail.com
Subject: [PATCH] ALSA: hda/realtek: Fix speaker output on ASUS ROG Strix G512
Date: Fri, 13 Feb 2026 08:13:11 -0600
Message-ID: <20260213141311.29199-1-supgeek@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: supgeek@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: XHRGDBUSZ6TOWXUFBJ3KTMS4UIS7HXXH
X-Message-ID-Hash: XHRGDBUSZ6TOWXUFBJ3KTMS4UIS7HXXH
X-Mailman-Approved-At: Wed, 04 Mar 2026 16:24:48 +0000
X-Mailman-Version: 3.3.10
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XHRGDBUSZ6TOWXUFBJ3KTMS4UIS7HXXH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
X-Rspamd-Queue-Id: 30427204386
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.89 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DATE_IN_PAST(1.00)[458];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	R_DKIM_ALLOW(-0.20)[alsa-project.org:s=default];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[suse.de,realtek.com,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[alsa-project.org:+];
	ASN(0.00)[asn:16019, ipnet:77.48.128.0/17, country:CZ];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[supgeek@gmail.com,alsa-devel-bounces@alsa-project.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[alsa-devel@alsa-project.org];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fedoraproject.org:url,alsa0.perex.cz:rdns,alsa0.perex.cz:helo,alsa-project.org:dkim,endeavouros.com:url];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[alsa-devel];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The ASUS ROG Strix G512LW (subsystem ID 0x10431f21) with ALC294 codec
has no speaker output on Linux. The internal speaker amplifier requires
specific codec coefficient writes that differ from the existing
ALC294_FIXUP_ASUS_SPK quirk values.

The required coefficients were identified by comparing codec register
dumps with and without working speaker output:
  - Coefficient index 0x0f needs value 0x7778 (vs 0x7774 in existing quirk)
  - Coefficient index 0x40 needs value 0x0800 (vs 0x8800 in existing quirk)

Without this patch, speakers are completely silent. Headphones and HDMI
audio work correctly.

This affects at least the following models:
  - ASUS ROG Strix G512LW (i7-10750H, RTX 2070)
  - ASUS ROG Strix G512LV (reported on Fedora forums)

Link: https://discussion.fedoraproject.org/t/asus-rog-strix-g512lv-speakers-do-not-work-headset-works-fine/74918
Link: https://forum.endeavouros.com/t/asus-rog-strix-g15-g512lw-no-audio-through-the-speakers-alc294/72857
Signed-off-by: Rob Hermann <supgeek@gmail.com>
---
 sound/pci/hda/patch_realtek.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index XXXXXXX..XXXXXXX 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -7859,6 +7859,7 @@ enum {
 	ALC294_FIXUP_ASUS_MIC,
 	ALC294_FIXUP_ASUS_HEADSET_MIC,
 	ALC294_FIXUP_ASUS_SPK,
+	ALC294_FIXUP_ASUS_G512_SPK,
 	ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE,
 	ALC285_FIXUP_LENOVO_PC_BEEP_IN_NOISE,
 	ALC255_FIXUP_ACER_HEADSET_MIC,
@@ -9166,6 +9167,19 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC294_FIXUP_ASUS_HEADSET_MIC
 	},
+	[ALC294_FIXUP_ASUS_G512_SPK] = {
+		.type = HDA_FIXUP_VERBS,
+		.v.verbs = (const struct hda_verb[]) {
+			/* Enable speaker amp on ASUS ROG Strix G512 */
+			{ 0x20, AC_VERB_SET_COEF_INDEX, 0x0f },
+			{ 0x20, AC_VERB_SET_PROC_COEF, 0x7778 },
+			{ 0x20, AC_VERB_SET_COEF_INDEX, 0x40 },
+			{ 0x20, AC_VERB_SET_PROC_COEF, 0x0800 },
+			{ }
+		},
+		.chained = true,
+		.chain_id = ALC294_FIXUP_ASUS_HEADSET_MIC
+	},
 	[ALC295_FIXUP_CHROME_BOOK] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc295_fixup_chromebook,
@@ -10977,6 +10991,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x1f11, "ASUS Zephyrus G14", ALC289_FIXUP_ASUS_GA401),
 	SND_PCI_QUIRK(0x1043, 0x1f12, "ASUS UM5302", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x1043, 0x1f1f, "ASUS H7604JI/JV/J3D", ALC245_FIXUP_CS35L41_SPI_2),
+	SND_PCI_QUIRK(0x1043, 0x1f21, "ASUS ROG Strix G512", ALC294_FIXUP_ASUS_G512_SPK),
 	SND_PCI_QUIRK(0x1043, 0x1f62, "ASUS UX7602ZM", ALC245_FIXUP_CS35L41_SPI_2),
 	SND_PCI_QUIRK(0x1043, 0x1f92, "ASUS ROG Flow X16", ALC289_FIXUP_ASUS_GA401),
 	SND_PCI_QUIRK(0x1043, 0x3030, "ASUS ZN270IE", ALC256_FIXUP_ASUS_AIO_GPIO2),
--
2.47.0
