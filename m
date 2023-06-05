Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B8085722CD7
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Jun 2023 18:40:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 676381D6;
	Mon,  5 Jun 2023 18:39:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 676381D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685983199;
	bh=uQ5eYBMv1+0hFlNUMUHgxCuvIvdPblAYGABAdLDPGOg=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Toh5Uw7kqZ+TUX9BsEeqq3SyAMsImDEKXCl6/c7isA4JFqOlox6yzzv051NOasbG9
	 czlstb5m/EtEUDfJ8zvAPwMz1phXBFb2fcAqQcDVJ2nedqm7JfYUe7HnxO4FXKXOj1
	 3yrzz0CrImy9I6SWCbn/DsmE1IQ/gK4a+i6pSrFQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CAA04F80520; Mon,  5 Jun 2023 18:39:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 766FCF8016C;
	Mon,  5 Jun 2023 18:39:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66C04F80199; Mon,  5 Jun 2023 18:39:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 93777F80130
	for <alsa-devel@alsa-project.org>; Mon,  5 Jun 2023 18:38:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93777F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=system76.com header.i=@system76.com header.a=rsa-sha256
 header.s=fm1 header.b=eagZALtl;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=yfo0UPOF
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id 1E05F320097D;
	Mon,  5 Jun 2023 12:38:53 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Mon, 05 Jun 2023 12:38:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=system76.com; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1685983132; x=1686069532; bh=t9dA6/jsfw
	zH+WIvoFyzqiB8dF+kJEOAWD1dNT3qGfI=; b=eagZALtlnh7Pnh3y5exe95lxjr
	ECNTXbqqhd+PRzY5Hbkm9rW0gf10TdcwsB/d2c+xhTe5pzMUvereupKoZzosk0HH
	RC4Rhzi9akwdpemW8rkAoTtd4wY3g8+zc91qHGngisiaQircNErwI8VExnHr/XDL
	p4SNJFDVXoA8MZmpV3Vf5ACf4OwnDNTzJPIxBPAAmcnG4DvO4shvRcqXSeE2h9Ky
	bCWNhifhN5fMm11we9ostOS4cklzvybxty/JvqR9Ykbzf7jAEf0UJPTehVzxfDRR
	zsKeTJhUUmBZSlOfjIxVS+4xv9FGfHdT5+t2SzYXtvewD6OZf1LHKrcnZbaA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1685983132; x=1686069532; bh=t9dA6/jsfwzH+
	WIvoFyzqiB8dF+kJEOAWD1dNT3qGfI=; b=yfo0UPOFhvZg0+s7AxwnoEcHXfIr9
	mOn8qpbGw9Kygydd8/uqHrSZ/BNLerYHdz1JbwAoFzBgrQBtvUXfovQOnxpACqLX
	5XIwG9evoXOs+yNgd8KcUa1mzX+saeAfA0l6kQKo+T7dY6KAIEHyd9CPaLwRHRiG
	T4VD5VrDEBKV47X9EucrSiTo/k5NN53qOAD2ZaYPGJR/ekEVf1TTSTI1zlmZPo3W
	F/2CY86lV3ZlbtQLY7DVz24BSjsT8Cy9upm0oABOnsok/L749LvZpL2njmVqCcn+
	V8z7i8cEl8dbUxXiM2apxQi8GISHAJOnJ9w9Bp8v7Ib2Q0CjX+9/+Iq3g==
X-ME-Sender: <xms:nA9-ZFfd5lQrDz0xq4f3UQbA6r2QKwfx8B4ssKC3Tcztx5LpP8qPHg>
    <xme:nA9-ZDOEUle2Yjn-RjyvvjuoY7b283lKNobK7uS43wGj6XSSlrwPek3PDk6uDLDSi
    pegmaa5Zkg5hXgkkA>
X-ME-Received: 
 <xmr:nA9-ZOhzTGFXepm6HE5CHzrKc9CfrNH8aqDSbgGDtgr1X6UZXAC8BRIXRKQWcEy6AQ0O0JCdSKNl3MgoCjYhRMeCSWqs0zc_d-_XnieMrg>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvhedrfeelledguddtgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgggfestdekre
    dtredttdenucfhrhhomhepvfhimhcuvehrrgiffhhorhguuceothgtrhgrfihfohhruges
    shihshhtvghmjeeirdgtohhmqeenucggtffrrghtthgvrhhnpeekgfetfedviedvhffftd
    ffgfeifffhteeguddukeeifeeuuedtleeftdevueehfeenucevlhhushhtvghrufhiiigv
    pedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehttghrrgiffhhorhgusehshihsthgvmh
    ejiedrtghomh
X-ME-Proxy: <xmx:nA9-ZO81c2w8YyeAKiZcLQAeA4d1YtmSg71_gxtjIUKl84Mc87cFHw>
    <xmx:nA9-ZBt1GuYUZ1JAWpcWqIYPfiLjz7uaIJORdDAFfp9fySMJMNkrLg>
    <xmx:nA9-ZNG6RJ5MIFNYktpqWIAsGuF4JNTRbz1-R2Q1OzMab1mT2JqysQ>
    <xmx:nA9-ZK7q1oZUXdtf0uAJIqYIKNTPeiGznGjzDvlTbCyOcITVlvd4Fg>
Feedback-ID: i1761444e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 5 Jun 2023 12:38:51 -0400 (EDT)
From: Tim Crawford <tcrawford@system76.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	productdev@system76.com,
	Tim Crawford <tcrawford@system76.com>
Subject: [PATCH] ALSA: hda/realtek: Add quirk for Clevo NS50AU
Date: Mon,  5 Jun 2023 10:38:34 -0600
Message-Id: <20230605163834.24653-1-tcrawford@system76.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 6CY6V2XLOKKO6CA6RP2H5OMO7BTELZXA
X-Message-ID-Hash: 6CY6V2XLOKKO6CA6RP2H5OMO7BTELZXA
X-MailFrom: tcrawford@system76.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6CY6V2XLOKKO6CA6RP2H5OMO7BTELZXA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Fixes headset detection on Clevo NS50AU.

Signed-off-by: Tim Crawford <tcrawford@system76.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 172ffc2c332b..345847ef8350 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9608,6 +9608,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1558, 0x5101, "Clevo S510WU", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x5157, "Clevo W517GU1", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x51a1, "Clevo NS50MU", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
+	SND_PCI_QUIRK(0x1558, 0x51b1, "Clevo NS50AU", ALC256_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x5630, "Clevo NP50RNJS", ALC256_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x70a1, "Clevo NB70T[HJK]", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x70b3, "Clevo NK70SB", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
-- 
2.40.1

