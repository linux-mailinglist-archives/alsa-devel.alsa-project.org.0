Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DABC26D2561
	for <lists+alsa-devel@lfdr.de>; Fri, 31 Mar 2023 18:24:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 166401F7;
	Fri, 31 Mar 2023 18:23:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 166401F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680279873;
	bh=Y6HRe1rEjwFKPE33dhXyiInpjsKoaEWewGYXgBOccfY=;
	h=To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From:Reply-To:Cc:From;
	b=Gm8bcR69KM1GoGKo3YGnkzLU29ipRlfLSomV3+I1QLkw6aOysIvKergaHk9lDynP0
	 RT/93GgpIxZ5dbD2MUnX/9thE2AaTJ0ZR3/lc8lOyXqLwhE9GvF454kXId3rmrM9cF
	 dT5qGQQBieyuKaq4yVX/4JVF4GHJ7NNqVjZsHnZM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F49EF8024E;
	Fri, 31 Mar 2023 18:23:42 +0200 (CEST)
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda/realtek: Add quirk for Clevo X370SNW
Date: Fri, 31 Mar 2023 10:23:17 -0600
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JYTMISTDTE4FBFAJOLT3QHKJDLRU2TVW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168027982192.26.4976456597628389483@mailman-core.alsa-project.org>
From: Tim Crawford via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Tim Crawford <tcrawford@system76.com>
Cc: tiwai@suse.de, productdev@system76.com,
 Jeremy Soller <jeremy@system76.com>, Tim Crawford <tcrawford@system76.com>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1732FF80272; Fri, 31 Mar 2023 18:23:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 30220F8021D
	for <alsa-devel@alsa-project.org>; Fri, 31 Mar 2023 18:23:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30220F8021D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=system76.com header.i=@system76.com header.a=rsa-sha256
 header.s=fm2 header.b=IlUnm0eq;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=Igg2Emnx
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 5538A32004E7;
	Fri, 31 Mar 2023 12:23:30 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Fri, 31 Mar 2023 12:23:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=system76.com; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1680279809; x=1680366209; bh=KwTvPZobnO
	jxLjvLVeO6gbnAkx89DfUDC9PXxRuabuA=; b=IlUnm0eqyahfKi8gToqmqLr+CG
	3W3/06iyPQj63484qY0KliE40fV576/i1b+gsCQPMe2aQFEVHxItltHogFh3g22x
	5FB+xnSRB9CqX0ZfZA6eDINKvHyTUXX/UmIZC7bFrKBk7u8K4YUZ2sFcg2kpCY5i
	KrQSaqg++wlI3inR+BKq/fIziE6ejKfWagMWad8KpnxsfNL8kNtBNrIXCZ8/b3bx
	S+zgsCo3qwUeCZi3UNJdldZUO/Ws6zNZEDbj0TdmgY4xBcPg/8lqqbi5KrNvofPe
	ApItKhyz3t4f8Vjri2shhJW27yy5+NkhCPPMncq7IBSRIcALzjuEhzMLVYLg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1680279809; x=1680366209; bh=KwTvPZobnOjxL
	jvLVeO6gbnAkx89DfUDC9PXxRuabuA=; b=Igg2Emnx0aft/6JeUIx8wQKfMdvMa
	c7VkDHCIT61sDCKoOMrI2A+06kfV0W9gGzqeSHSigXB1g2pSpVWCNKh02U8d/92E
	K5ROwK/zOho4thQ6M2Ph48WgiS7M/BMc/Fbr5VseLW/HBCG9atF2B3wopaMaw+zF
	vjllpWEjyskgvSKnUmOoJRNC/bZP3e2biM8qkziRsl6ifcPii8LA68j/7uMrEvkb
	d8HQ9uId7nw4wk/VfGKXXbSeXau7iSgVqgbz6u2rPfC4HN7jJaRzblKVq3e5gt3+
	nEroxN3xMpXyBt1fliRvD8jKgy1N+9a6rRiGc4SM+cW5fMwCoqS+kTTAQ==
X-ME-Sender: <xms:AQknZA5cK-Qk-0gVXj-p84X6ophHOsWoID_Kd1u-_ON_W-tMZ6LtJA>
    <xme:AQknZB7iCGRugiTG9UvyOPErPgzuos8H-uDrWy-SpjdHxjq-uuq_u3OWUByBV4Rjf
    6x2PAE67nu10U2PIg>
X-ME-Received: 
 <xmr:AQknZPeS9wEeECvuSrI409zJbz0u3CR79828KRViqXtYxk9PJujGX9Gn2S6QtHo9K8_g8jIzYwv3VbkJDE3ml-ej1PEClwcfkAZJySBq8Q>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiuddgleejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepvfhimhcuvehr
    rgiffhhorhguuceothgtrhgrfihfohhrugesshihshhtvghmjeeirdgtohhmqeenucggtf
    frrghtthgvrhhnpeekgfetfedviedvhffftdffgfeifffhteeguddukeeifeeuuedtleef
    tdevueehfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehttghrrgiffhhorhgusehshihsthgvmhejiedrtghomh
X-ME-Proxy: <xmx:AQknZFLpCjcGSL8j44AGt5ORpCpNZPFx1rdb8Wab6wJX_6h6XijvwQ>
    <xmx:AQknZELIIK2JFNzavoBR02PdDB3_6QAQR64GpCOF5PL4mqBHKfO0Ww>
    <xmx:AQknZGwsn4QUNwuQqgNd6CzOk0GT4AYQIggRyVY8-Z_252aP8vtSUQ>
    <xmx:AQknZI0zYFrCrcZjfGg3POQj1MjSunr-fZVQzFsfAdSTZLGzqHHyVw>
Feedback-ID: i1761444e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 31 Mar 2023 12:23:29 -0400 (EDT)
From: Tim Crawford <tcrawford@system76.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda/realtek: Add quirk for Clevo X370SNW
Date: Fri, 31 Mar 2023 10:23:17 -0600
Message-Id: <20230331162317.14992-1-tcrawford@system76.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: JYTMISTDTE4FBFAJOLT3QHKJDLRU2TVW
X-Message-ID-Hash: JYTMISTDTE4FBFAJOLT3QHKJDLRU2TVW
X-MailFrom: tcrawford@system76.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: tiwai@suse.de, productdev@system76.com,
 Jeremy Soller <jeremy@system76.com>, Tim Crawford <tcrawford@system76.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JYTMISTDTE4FBFAJOLT3QHKJDLRU2TVW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Jeremy Soller <jeremy@system76.com>

Fixes speaker output and headset detection on Clevo X370SNW.

Signed-off-by: Jeremy Soller <jeremy@system76.com>
Signed-off-by: Tim Crawford <tcrawford@system76.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index b501f9489fc1..028d8bd1e2c8 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -2624,6 +2624,7 @@ static const struct snd_pci_quirk alc882_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1462, 0xda57, "MSI Z270-Gaming", ALC1220_FIXUP_GB_DUAL_CODECS),
 	SND_PCI_QUIRK_VENDOR(0x1462, "MSI", ALC882_FIXUP_GPIO3),
 	SND_PCI_QUIRK(0x147b, 0x107a, "Abit AW9D-MAX", ALC882_FIXUP_ABIT_AW9D_MAX),
+	SND_PCI_QUIRK(0x1558, 0x3702, "Clevo X370SN[VW]", ALC1220_FIXUP_CLEVO_PB51ED_PINS),
 	SND_PCI_QUIRK(0x1558, 0x50d3, "Clevo PC50[ER][CDF]", ALC1220_FIXUP_CLEVO_PB51ED_PINS),
 	SND_PCI_QUIRK(0x1558, 0x65d1, "Clevo PB51[ER][CDF]", ALC1220_FIXUP_CLEVO_PB51ED_PINS),
 	SND_PCI_QUIRK(0x1558, 0x65d2, "Clevo PB51R[CDF]", ALC1220_FIXUP_CLEVO_PB51ED_PINS),
-- 
2.39.2

