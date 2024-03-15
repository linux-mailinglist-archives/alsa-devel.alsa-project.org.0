Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CE887CA35
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Mar 2024 09:46:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FE3A7F4;
	Fri, 15 Mar 2024 09:46:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FE3A7F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710492405;
	bh=YO2Lw/70OHLUA6P+Wt7ionnMIRIkXQXi0auO7poeLh4=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=STqC/jB906LY0QJaHmh5nsuCCwFB8zlK19fZs8GxFB2/fUhvzHYIsSuXsK0VoxvrH
	 aL6VgrQamMoz0EEOKuUvsTV/TW5KzUDlWTN4Jhnp06a+yR0ht+xH5CEUY1dBa+X+DW
	 qdp9JyOHhbO1WhTqRjU8Gaf9L5+47ZK+tFVlGE7g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CF198F8085A; Fri, 15 Mar 2024 09:41:49 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 54AE2F8971C;
	Fri, 15 Mar 2024 09:41:49 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 077FAF8028D; Fri, 15 Mar 2024 09:21:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 050D0F80093
	for <alsa-devel@alsa-project.org>; Fri, 15 Mar 2024 09:21:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 050D0F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=jichi.ca header.i=@jichi.ca header.a=rsa-sha256
 header.s=fm3 header.b=VilPOjha;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=JdrRq/dJ
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id E28643200564;
	Fri, 15 Mar 2024 04:21:12 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Fri, 15 Mar 2024 04:21:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jichi.ca; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm3; t=1710490872; x=1710577272; bh=Rc9NjdCjkI77CoTN8FsCu
	R5vFmaUncDapWwCpfstAQg=; b=VilPOjhalrwQJG6fZZ8eN3tMjhXAuPID+qQ4j
	QLRcerzBfbGinwjROQ09/I3vzY4GAvrFoduXC5ShQMebjozD8FsCjr3Sysrm7yp1
	HzdD1emoEAYlIORzvhN/NuP16wtIF0PW247RAOvFZNKzK1Kskb2B7VuuFj6CB8nW
	857upVVTq4bkP07fWP114uj1hAyzUQd8dbEVypj++a3bAN7CPetdFO1slGq/waNC
	P2vmUsttvFaK/6DiPt20wyLVlxtrFuHiC4A1rB91RVAG5S4aXC+2Dq4OchbwWnZG
	eJndI2I1NbNw/tRMFzTDHLfLmwDC7uaHPoYMCuAUIJOgVIC1A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1710490872; x=1710577272; bh=Rc9NjdCjkI77CoTN8FsCuR5vFmaU
	ncDapWwCpfstAQg=; b=JdrRq/dJz1y711lPnMvSXwEoO1pqP+YMQPSwKczje//Y
	HtN6qE/oXLYwUbXNV77ThvvKw+Y81xl7V6fb1MXh2g561VXy5KDzTtGURmHifsDk
	QeArz4pjRuIlMIQsR8fMoVz2MBIoE3eMQTj2NJHwqDVaMmlKB84PDjwMMxoGEthJ
	IKsOUIi/UiTASS5hv2k8ipuXUf2lxqvDMjfPXGhVciQYgolSdC+n4qKBWLoeL8mV
	loOFLnvxwjfgn9gIpqIm7Sj5U5/Ubz6PrjvR6+SycGjsCvqVFV0bgRzoa0tZEl09
	64oNmWCAuvoI6S9gqPH/Le2xr+e2nnLcoaJe/6QnBQ==
X-ME-Sender: <xms:-AT0Zbdp9Xh9phVfmwL5LZ9ZiwECwgPyxllENDxi9_ZMR7NFiOhidA>
    <xme:-AT0ZROJImxiF671BL8NsyEmcjqPx3QZc-DjT6n2C4U2G8bgYQ5z-soKjiaDsnS-O
    5V1ZDu3myt7V-ie0MI>
X-ME-Received: 
 <xmr:-AT0ZUjHv-Cy9SxoJm5XkzHS06r-7QW8vmmcDFcfr8OsIxpg2c4d00fHdFuSezvYKVMNTsKu9bO4rG-ep8Aiud7-zY2Vo5q68BuD6w5CpFu7pmHLEpPHIg>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvledrjeekgdduudejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpehisehjihgthhhirdgtrgenucggtffrrghtthgvrhhnpeduledt
    jeelleeikeevgeeiudehvdfgheelfedttefhuedvuedtvdevgeeujefgvdenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehisehjihgthhhirdgt
    rg
X-ME-Proxy: <xmx:-AT0Zc_19WnEWT9I3Ajdke_t54wGN_cybLI18Hvrvd7wTx2Cp3uvLg>
    <xmx:-AT0ZXtnqXHP4iN4ePFbFsug95rtGcjTaToFaGzInpxsq5SKsvulLQ>
    <xmx:-AT0ZbEtZChmNWynvHwmXlc59MeXz8jYxquUEmRXpaF3EJ6uCMthbg>
    <xmx:-AT0ZeMLfkNj_5pAnFp6AAyK0TzJIpykoEJ0eABSLaVYqWEF-BQ8yQ>
    <xmx:-AT0ZXI4iNwOrnaCj44CzYDOc95jf9tOuNIaEJkFMj2Blz_j7iIDmw>
Feedback-ID: ie629468a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 15 Mar 2024 04:21:09 -0400 (EDT)
From: i@jichi.ca
To: tiwai@suse.com
Cc: alsa-devel@alsa-project.org,
	Jichi Zhang <i@jichi.ca>
Subject: [PATCH] ALSA: hda/realtek: Add quirk for Lenovo Yoga 9 14IMH9
Date: Fri, 15 Mar 2024 01:19:56 -0700
Message-ID: <20240315081954.45470-3-i@jichi.ca>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: i@jichi.ca
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: S5A62N6LSWTPZ4SKG6LQE5BUOXDIITFD
X-Message-ID-Hash: S5A62N6LSWTPZ4SKG6LQE5BUOXDIITFD
X-Mailman-Approved-At: Fri, 15 Mar 2024 08:36:52 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/S5A62N6LSWTPZ4SKG6LQE5BUOXDIITFD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Jichi Zhang <i@jichi.ca>

The speakers on the Lenovo Yoga 9 14IMH9 are similar to previous generations
such as the 14IAP7, and the bass speakers can be fixed using similar methods
with one caveat: 14IMH9 uses CS35L41 amplifiers which need to be activated
seperately.

Signed-off-by: Jichi Zhang <i@jichi.ca>
---
 sound/pci/hda/patch_realtek.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index b6cd13b17..6288d837a 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -7360,6 +7384,7 @@ enum {
 	ALC287_FIXUP_LEGION_16ITHG6,
 	ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK,
 	ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN,
+	ALC287_FIXUP_YOGA9_14IMH9_BASS_SPK_PIN,
 	ALC295_FIXUP_DELL_INSPIRON_TOP_SPEAKERS,
 	ALC236_FIXUP_DELL_DUAL_CODECS,
 	ALC287_FIXUP_CS35L41_I2C_2_THINKPAD_ACPI,
@@ -9490,6 +9515,12 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK,
 	},
+	[ALC287_FIXUP_YOGA9_14IMH9_BASS_SPK_PIN] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc287_fixup_yoga9_14iap7_bass_spk_pin,
+		.chained = true,
+		.chain_id = ALC287_FIXUP_CS35L41_I2C_2,
+	},
 	[ALC295_FIXUP_DELL_INSPIRON_TOP_SPEAKERS] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc295_fixup_dell_inspiron_top_speakers,
@@ -10270,6 +10301,8 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x38c3, "Y980 DUAL", ALC287_FIXUP_TAS2781_I2C),
 	SND_PCI_QUIRK(0x17aa, 0x38cb, "Y790 YG DUAL", ALC287_FIXUP_TAS2781_I2C),
 	SND_PCI_QUIRK(0x17aa, 0x38cd, "Y790 VECO DUAL", ALC287_FIXUP_TAS2781_I2C),
+	SND_PCI_QUIRK(0x17aa, 0x38d2, "Lenovo Yoga 9 14IMH9", ALC287_FIXUP_YOGA9_14IMH9_BASS_SPK_PIN),
+	SND_PCI_QUIRK(0x17aa, 0x38d7, "Lenovo Yoga 9 14IMH9", ALC287_FIXUP_YOGA9_14IMH9_BASS_SPK_PIN),
 	SND_PCI_QUIRK(0x17aa, 0x3902, "Lenovo E50-80", ALC269_FIXUP_DMIC_THINKPAD_ACPI),
 	SND_PCI_QUIRK(0x17aa, 0x3977, "IdeaPad S210", ALC283_FIXUP_INT_MIC),
 	SND_PCI_QUIRK(0x17aa, 0x3978, "Lenovo B50-70", ALC269_FIXUP_DMIC_THINKPAD_ACPI),
-- 
2.44.0

