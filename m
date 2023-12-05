Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1926B8068EF
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Dec 2023 08:49:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D02C820;
	Wed,  6 Dec 2023 08:49:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D02C820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701848987;
	bh=sveebmIP/A5PQ0/J1NvNbkPj2GKd7PobFCkYntoPgrI=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=bt206j+ajVdVSzUBNkzqOt9hiL4EqtPSEqKTrP9aBxp4lEAlqWtguPQIinBGDRnbC
	 7DU6pJYNu06GlZypN1iyPItBCPrL7JgJNS1iaIfX396f9IOlgDW/2UTBQh+ssjaSHm
	 DMaOySBuBZlpEIA9qcxdRJ8fDlRFjAdWCU8aD4TE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 566B0F8057D; Wed,  6 Dec 2023 08:49:00 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F85FF80570;
	Wed,  6 Dec 2023 08:48:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D1FEBF8024E; Tue,  5 Dec 2023 18:10:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H5,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CB91CF800AC
	for <alsa-devel@alsa-project.org>; Tue,  5 Dec 2023 18:10:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB91CF800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=timbos.se header.i=@timbos.se header.a=rsa-sha256
 header.s=fm1 header.b=q6DuZJ4F;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=yvEDMlqz
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 3D7D65C023F;
	Tue,  5 Dec 2023 12:10:16 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Tue, 05 Dec 2023 12:10:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=timbos.se; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1701796216; x=1701882616; bh=wR0aUc71JJ
	dl7lVlq3tJ9JTylgTrldMTIORN/gVs1NQ=; b=q6DuZJ4FwkBZXN5gX1qGvM7tpU
	QkEx2q1EmXctbjNHOye1ZOYxwchv9PFabh0u5qH9zDw4RjxMowD0aeXDjYJI/cvu
	WipwZyBJ3klMjhUGT86+jt+uHKiFKuIjAAFo3CJbS9702i3mhktBt3LM1Mj02rt0
	2qDuHPVlZuz2MI4D7JnUsg6KwUfhiAmAnkn0+CgxuAtQil993k4HmGecgrWdJG5n
	FOYUKJF33LkTwRFpZRZ+px0YyoVMcK304TRz50NIBTRYQWrnBhVBePv8uSw+a773
	/oBeW48z5FkhA6E7a4uj4w0KGxjDVfPxK20KjMd78pgkLznDUjbURcLZDfmg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1701796216; x=1701882616; bh=wR0aUc71JJdl7
	lVlq3tJ9JTylgTrldMTIORN/gVs1NQ=; b=yvEDMlqzHlY1ws3fhZ6TCyYvGQGnF
	XJ2LdpkG8SgbjLV2SEP4aoxNRPqISP0Zzizl5bp1ZOpESd1+Xwf7U2odfdCxI6M3
	pCxCPeSCT80aG31idWpWnUdojiNKbz0CxvrKRvGwO4wt4BWDpo11femlLvJ/+c0Z
	7YRtQ2zEgKrVD9DztMe8f1C1GsCKQvVcrsVRwZZ0WCvr5aADxuv2Yh+SMVXSs5pz
	NdEHVCXee9JpFfrZ2D0l7UM+OSNE5W7Qpye1sWjsdLjIWwkaRGegq6HCXj1QJ39P
	GR41K688TeihiOHRuT9FfEO/ebIez/Ay2HIbJz9P+/kEKLV4a0/jvHqtQ==
X-ME-Sender: <xms:d1lvZR_yWIwFAOvhJJVzuyqbLxyTTLUExd6lHXO8JsZ5OXHSlcpWSA>
    <xme:d1lvZVsN8Qm43W4hYqWkyqnvCYYynfNi4PHrIB3-vXwoZoUqGlk6d-nHblhbw_6CF
    Q2HYxuR0itm5F40MZs>
X-ME-Received: 
 <xmr:d1lvZfDJ5v5UlFKlbdb3MGmXul__sJsOC8dRk0PoRzP6aFbO0AmZV53-S1KEy_FCjaZcbD0YspOgUBeUV_9ZHvZDLPDoPTFll93daYdBt9nVt7dde6R50Jw>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvkedrudejkedgleejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpefvihhmuceuohhsshgvuceofhhlihhnnhesthhimhgsohhsrdhs
    vgeqnecuggftrfgrthhtvghrnhepffffveelfeffveelledtueevieehieevtdeljeetfe
    ekfeffvedtleevvdevfeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehm
    rghilhhfrhhomhepfhhlihhnnhesthhimhgsohhsrdhsvg
X-ME-Proxy: <xmx:d1lvZVcH1W8oucWv7VxXTkmPI7mKjOv2iXY7Bl1WuVFXkYXaHglbiA>
    <xmx:d1lvZWMOxHR85HaxxuD354kG4MEcJxRr_A1C3_GYxxtgCBMki0draw>
    <xmx:d1lvZXmukXpGThu45yD4W3asj8znEaHkPmw-kO4r5Oknz34mRbxC9Q>
    <xmx:eFlvZQU1KZsPWG5cO8sslsPujjwwJ3PBJOYYcxNkC0Ti3dq3W8ogcw>
Feedback-ID: ideb94765:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 5 Dec 2023 12:10:15 -0500 (EST)
From: Tim Bosse <flinn@timbos.se>
To: alsa-devel@alsa-project.org
Cc: Tim Bosse <flinn@timbos.se>
Subject: [PATCH] ALSA: hda/realtek: add new framework to quirk chain
Date: Tue,  5 Dec 2023 12:10:00 -0500
Message-ID: <20231205171000.226539-1-flinn@timbos.se>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: flinn@timbos.se
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: JNQDNAYKXVKE62XIS4GT7TPPZ6GJ3J4Q
X-Message-ID-Hash: JNQDNAYKXVKE62XIS4GT7TPPZ6GJ3J4Q
X-Mailman-Approved-At: Wed, 06 Dec 2023 07:36:57 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JNQDNAYKXVKE62XIS4GT7TPPZ6GJ3J4Q/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The Framework Laptop 13 (AMD Ryzen 7040Series) has an ALC 295 with
a disconnected or faulty headset mic presence detect and works with the
same quirk chain as 309d7363ca3d9fcdb92ff2d958be14d7e8707f68. This model
has a VID:PID of f111:0006.

Signed-off-by: Tim Bosse <flinn@timbos.se>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index f9ddacfd920e..59f2578839ed 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -10271,6 +10271,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x8086, 0x2081, "Intel NUC 10", ALC256_FIXUP_INTEL_NUC10),
 	SND_PCI_QUIRK(0x8086, 0x3038, "Intel NUC 13", ALC295_FIXUP_CHROME_BOOK),
 	SND_PCI_QUIRK(0xf111, 0x0001, "Framework Laptop", ALC295_FIXUP_FRAMEWORK_LAPTOP_MIC_NO_PRESENCE),
+	SND_PCI_QUIRK(0xf111, 0x0006, "Framework Laptop", ALC295_FIXUP_FRAMEWORK_LAPTOP_MIC_NO_PRESENCE),
 
 #if 0
 	/* Below is a quirk table taken from the old code.
-- 
2.43.0

