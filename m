Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1DC7433A1
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Jun 2023 06:34:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59B417F4;
	Fri, 30 Jun 2023 06:33:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59B417F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688099648;
	bh=4w6ZNfYuVXxvcjeY6b+mD0IdvyHD5XYoVIi3S78qW9I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iwwbmQ8UnADkXB+Rw1/iPVkI95bNAXUA+5E0WIBeSf+0dEdC/Pg6oXMc7+tT88ZKd
	 5UZwRztGU2zR+6ySKc125SFJbvrcdm9bdzXGQv9H2p5RVq9TvYtDXuis/79+js2e/f
	 jgtL2Z8IdIryJGQo3YxTHWBOVk3akGdmN+KhKOVU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8FF3EF80548; Fri, 30 Jun 2023 06:32:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 01AF0F80544;
	Fri, 30 Jun 2023 06:32:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3565EF8027B; Fri, 30 Jun 2023 06:31:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 683DCF80212
	for <alsa-devel@alsa-project.org>; Fri, 30 Jun 2023 06:31:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 683DCF80212
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=ljones.dev header.i=@ljones.dev header.a=rsa-sha256
 header.s=fm3 header.b=bDxnBbak;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=fAxpZtIA
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id E6CF632007F9;
	Fri, 30 Jun 2023 00:31:29 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Fri, 30 Jun 2023 00:31:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1688099489; x=
	1688185889; bh=Q64xPEy+iwbg0p9qPUFnYa3X3kv5WuO+YEFt9NA2p98=; b=b
	DxnBbak+dDSQpYUvRE6BUGvW9Qv1/y0gufEzS7Ik0XxaeBImMbux6KqHdTsycYnG
	iOlhPK6F2iuH7tTm+j8trUnhgOTH2rqsbcTAuGhPtRxkgvm5FPd+T3BZa9JHyHIf
	7YSmjU5/6P7mK5RCA99ytLqyuYLu4zZdXGFndeQBQfGVJPhpwKa9f/HQydD9hFEU
	sa+/ek25PCnYVVTZ/cVZEOORd8w39oznoPwkQKj0a0LoKg7IlxC5ZwIsSZZVjOuN
	xCFy+1/coahs4BuGtFLo9XGlzAkuzgaOFBhQmjZEyShLx+jxDk3TJFtilTeWnzzu
	v0xfadTruu0RrrYaQ01kg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1688099489; x=
	1688185889; bh=Q64xPEy+iwbg0p9qPUFnYa3X3kv5WuO+YEFt9NA2p98=; b=f
	AxpZtIApHcQdJ1RmxDNHBOKp3mGS0GvfidjX7wVwpWc+P0Of6eUYxtpiAWRoOWLz
	QMn5odcBjqVryXjgs840Z5uvZldJA1imIEl/k83Wqh7xf3iiliEteBNgqAPLfbe9
	KWd02q8K+anDdzTEbSjYAleJDhBRVEim6XLvo4l4tj1HghqYcafSyo/tD4iscmji
	D/P9gK4uzGsdmoo3Fr6khSc4Tzsv8WG73c3KiipxkLb6XYMwZX6SBNcH8QLJji7a
	9WaDCUI1RCZxqri4LDNP184LqPf/6L5sS7EAX1FJWd8HKbZvMQCxyuoma8tKWrgK
	2BxmeuGgDrKXAp+Zl0UhA==
X-ME-Sender: <xms:oFqeZAJKyWZU10V_KTj88t8MnFrbS0Q4TeqdnxEsXfQ0JIh6ABPEew>
    <xme:oFqeZAJrANoLjI6ZNHaWZZPussedeQ05lRFBzuzsVMEhCQWSyEZuyDrQ1O-kFMC1Y
    TLl37TH_yYucOyfMhE>
X-ME-Received: 
 <xmr:oFqeZAu0iYtsOrIoxlc-WskOBooiQZgroCKiYJxiozE2x_Sl65Mv8VRwMzX4>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedviedrtdehgdekjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomhepfdfnuhhkvgcuffdrucflohhnvghsfdcuoehluhhkvgeslhhj
    ohhnvghsrdguvghvqeenucggtffrrghtthgvrhhnpefgteefudfgteduueehteejhfeugf
    fgleeltedvveethfeuueejfedvgeelveehgfenucevlhhushhtvghrufhiiigvpedtnecu
    rfgrrhgrmhepmhgrihhlfhhrohhmpehluhhkvgeslhhjohhnvghsrdguvghv
X-ME-Proxy: <xmx:oVqeZNb2aupFgglUdH14aQpuvSA-Z5CcZQyHD498Cfab_fv6gRadRg>
    <xmx:oVqeZHYh20ZY7MSmRJVFsCHZFM5gAAv0pZyOmj-93R5lDXjNk2xYgA>
    <xmx:oVqeZJDfC7mVrmJttlSrd2Pi3f889BRKGsw-mWV9k3UVESDbMvi3gQ>
    <xmx:oVqeZCyQbo94Svc8sC7PGxyJN_ar9rusu1BF0wk-SydbcfxR66T21w>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 30 Jun 2023 00:31:26 -0400 (EDT)
From: "Luke D. Jones" <luke@ljones.dev>
To: tiwai@suse.com
Cc: perex@perex.cz,
	sbinding@opensource.cirrus.com,
	andy.chi@canonical.com,
	tangmeng@uniontech.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	"Luke D. Jones" <luke@ljones.dev>
Subject: [PATCH 2/2] ALSA: hda/realtek: Add quirk for ASUS ROG GA402X
Date: Fri, 30 Jun 2023 16:31:06 +1200
Message-ID: <20230630043106.914724-3-luke@ljones.dev>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230630043106.914724-1-luke@ljones.dev>
References: <20230630043106.914724-1-luke@ljones.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 2SMB53WBVQORMAUIXZWUUWIKVI6JUPDX
X-Message-ID-Hash: 2SMB53WBVQORMAUIXZWUUWIKVI6JUPDX
X-MailFrom: luke@ljones.dev
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2SMB53WBVQORMAUIXZWUUWIKVI6JUPDX/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Adds the required quirk to enable the Cirrus amp and correct pins
on the ASUS ROG GV601V series.

While this works if the related _DSD properties are made available, these
aren't included in the ACPI of these laptops (yet).

Signed-off-by: Luke D. Jones <luke@ljones.dev>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 1c26f24b1246..5b7df324e8b4 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9544,6 +9544,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x13b0, "ASUS Z550SA", ALC256_FIXUP_ASUS_MIC),
 	SND_PCI_QUIRK(0x1043, 0x1427, "Asus Zenbook UX31E", ALC269VB_FIXUP_ASUS_ZENBOOK),
 	SND_PCI_QUIRK(0x1043, 0x1433, "ASUS GX650P", ALC285_FIXUP_ASUS_I2C_HEADSET_MIC),
+	SND_PCI_QUIRK(0x1043, 0x1463, "Asus GA402X", ALC285_FIXUP_ASUS_I2C_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1043, 0x1473, "ASUS GU604V", ALC285_FIXUP_ASUS_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1043, 0x1483, "ASUS GU603V", ALC285_FIXUP_ASUS_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1043, 0x1493, "ASUS GV601V", ALC285_FIXUP_ASUS_HEADSET_MIC),
-- 
2.41.0

