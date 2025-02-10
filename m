Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC992A37F73
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Feb 2025 11:10:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9275D602B6;
	Mon, 17 Feb 2025 11:10:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9275D602B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1739787034;
	bh=QjLXHAfBHgqMMLoqvmDzU43q0td/4AF/YvSN4cg1PXg=;
	h=Date:From:Subject:To:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Aae7qTWZ9RRU+GaBf7lNCkoOEg53KcxyEciNlEIutOa0I1TxUZxXrsFid6P7tPsmA
	 SL7+bjI6CyXNm4BsrVE/TcsgAaPIHHtE2e8LZtPEuSCEpfxWQHdCZGkO9ffPFk3u1A
	 72fejXA4meF28am0fCUsFzbCsX73XTyzHwnVts0M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2E108F805C2; Mon, 17 Feb 2025 11:09:09 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 133B5F8025A;
	Mon, 17 Feb 2025 11:09:09 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9C76EF80424; Mon, 10 Feb 2025 16:50:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx2.mythic-beasts.com (mx2.mythic-beasts.com
 [IPv6:2a00:1098:0:82:1000:0:2:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ED608F8016B
	for <alsa-devel@alsa-project.org>; Mon, 10 Feb 2025 16:50:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED608F8016B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=pelago.org.uk header.i=@pelago.org.uk
 header.a=rsa-sha256 header.s=mythic-beasts-k1 header.b=mrTJKzqN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=pelago.org.uk; s=mythic-beasts-k1; h=To:Subject:From:Date;
	bh=tVRO1BvbdTeWESOQK11vMGPiTVrWm2LWxssQD5+Luis=; b=mrTJKzqNkUaaD+WYtX9Scpksai
	pL0uGiv4oNwcDuaScqZre6nSy0ARNqmvy/94lhTzG5PBuLs8FWZn/DnazOx6B6ucJQtFevKeF5+6z
	MugwePwry3rqRIrCCMx+cVgY+0ISMzcwubfOmXsy43KkUGwKWjhlbHqDzy6gmHMma/TrCbghldfDY
	8gXYPaUs8wl5O/FZ+uQmGwPOLuB/J7s/1Kz6yid9XyHGSxhFyBWRSPPf95tp8A3aC8rpJwv8CSBH6
	8MX/nC6ejWajSr8VopIWyJDIUtP3kO3Qrn0WfnIi0p4wKTPfHl2bx7trRZa9O+LVlA79eI0IsroXv
	zZ4R4wDQ==;
Received: by mailhub-hex-d.mythic-beasts.com with esmtpsa  (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <john-linux@pelago.org.uk>)
	id 1thW3O-006b92-SU
	for alsa-devel@alsa-project.org; Mon, 10 Feb 2025 15:50:35 +0000
Message-ID: <be43f24e-b931-4f0e-8fa5-b7697127106b@pelago.org.uk>
Date: Mon, 10 Feb 2025 15:50:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: John Veness <john-linux@pelago.org.uk>
Subject: [PATCH] ALSA: hda/conexant: Add quirk for HP ProBook 450 G4 mute LED
To: alsa-devel@alsa-project.org
Content-Language: en-GB
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BlackCat-Spam-Score: 0
X-MailFrom: john-linux@pelago.org.uk
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: EYEKFNOTAHZLCHGDDDMGAUOFCOS2TGOA
X-Message-ID-Hash: EYEKFNOTAHZLCHGDDDMGAUOFCOS2TGOA
X-Mailman-Approved-At: Mon, 17 Feb 2025 10:09:05 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EYEKFNOTAHZLCHGDDDMGAUOFCOS2TGOA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Allows the LED on the dedicated mute button on the HP ProBook 450 G4 laptop
to change colour correctly.

Signed-off-by: John Veness <john-linux@pelago.org.uk>
---
  sound/pci/hda/patch_conexant.c | 1 +
  1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_conexant.c b/sound/pci/hda/patch_conexant.c
index 538c37a78..84ab357b8 100644
--- a/sound/pci/hda/patch_conexant.c
+++ b/sound/pci/hda/patch_conexant.c
@@ -1080,6 +1080,7 @@ static const struct hda_quirk cxt5066_fixups[] = {
         SND_PCI_QUIRK(0x103c, 0x814f, "HP ZBook 15u G3", CXT_FIXUP_MUTE_LED_GPIO),
         SND_PCI_QUIRK(0x103c, 0x8174, "HP Spectre x360", CXT_FIXUP_HP_SPECTRE),
         SND_PCI_QUIRK(0x103c, 0x822e, "HP ProBook 440 G4", CXT_FIXUP_MUTE_LED_GPIO),
+       SND_PCI_QUIRK(0x103c, 0x8231, "HP ProBook 450 G4", CXT_FIXUP_MUTE_LED_GPIO),
         SND_PCI_QUIRK(0x103c, 0x828c, "HP EliteBook 840 G4", CXT_FIXUP_HP_DOCK),
         SND_PCI_QUIRK(0x103c, 0x8299, "HP 800 G3 SFF", CXT_FIXUP_HP_MIC_NO_PRESENCE),
         SND_PCI_QUIRK(0x103c, 0x829a, "HP 800 G3 DM", CXT_FIXUP_HP_MIC_NO_PRESENCE),
-- 
2.48.1
