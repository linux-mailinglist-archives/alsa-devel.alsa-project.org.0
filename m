Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1998D8806CE
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Mar 2024 22:34:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E6102999;
	Tue, 19 Mar 2024 22:34:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E6102999
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710884088;
	bh=YNSwYBTB5UtGcNvOyrnKsVp8v4gUvj7N5qNw6zN090Y=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=h7C0dfC4aEsaNOyuPiTxxTEc7UkL/q1Apet0NsD20lHDcXrW9Knc3pH79VvtogRkd
	 RIB2vu3uC/+aJ0GS/JbHoPWdg0juUNNykRCpYkt+Hfme5SHIi7H10PX+SaB3dX04R5
	 ZxxYOX+qf7RQUJKYw5xQpSblytZN7AA0+9f4sQKo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 01C8EF80563; Tue, 19 Mar 2024 22:34:26 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9CB48F80093;
	Tue, 19 Mar 2024 22:34:26 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6582CF804E7; Tue, 19 Mar 2024 22:29:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from wfhigh7-smtp.messagingengine.com
 (wfhigh7-smtp.messagingengine.com [64.147.123.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A04FAF80093
	for <alsa-devel@alsa-project.org>; Tue, 19 Mar 2024 22:27:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A04FAF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=system76.com header.i=@system76.com header.a=rsa-sha256
 header.s=fm2 header.b=F6SJbBtH;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=mcOl5g6y
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfhigh.west.internal (Postfix) with ESMTP id DFE2B18000E7;
	Tue, 19 Mar 2024 17:27:36 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Tue, 19 Mar 2024 17:27:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=system76.com; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm2; t=1710883656; x=1710970056; bh=auzezZyoZ+HBRgr8V3qty
	XzXmAjh63NA6zFB7rFXf2s=; b=F6SJbBtH4SSb2sTE3+66SMogKCbv3zBv8OsTw
	69AHUm/kblNSMBE6iLzilAwZTyyicXaGa2vTENioWMjrGdrW+o/ZYvfA9E0MWGun
	CQ/uG7gKBtBK0WUYJ9SXu7HWyphir+3WA0CtmZWxqWJqFSu4x2Jkz+mhnXCCzbe1
	r29moGaVqzRnm+JJ8pY8c9PXHOwfRCGbk9Z60GAHQt0bZHqF8FqoG8zrtPgixjEi
	zGPdtT0wIrbl+sFZ6sPT/XG+GvRQeARr4YlVzX55WdJGMulJkmA1+wEr2khcJB44
	2As7NfVhdaZC17cauIa70XGfsIbPNUuoX1//uoZbreysOHv1Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1710883656; x=1710970056; bh=auzezZyoZ+HBRgr8V3qtyXzXmAjh
	63NA6zFB7rFXf2s=; b=mcOl5g6yaSxT63u+WJ7jhYcacxBgQib9P0wCBUr4/Xt8
	M5dJxfZ2GCLqZNiPpxF75hE0QA8KR7iE+Sw2hYrus+LNR4kCJlTTxCHAGBaKdClH
	oLwW5dX8UmDkJ9oBiyHHxMetuen9Z9CD29kSTvHoiihhW2q0uDgmBQadU7UK/KNS
	U+Y59ahcpypZCh6I8gxjmDc/2gkCEE8W6VHAz70c2RpjL4by9oPdfBOKgzObrVA0
	hLuxNycSqcNxrAAUczDYNJ9FwDAivOWixBwN7+Cd4FlbBmcJrPpyZhWEkRfL83I7
	UfkG2hQNRyIhmdNXQTnj1x7pD666sM3RLY//+ot6YA==
X-ME-Sender: <xms:SAP6Zb4TKDRsA4Z4pkT0E1dMniRFxFzwiWaWiVPp9VU6nODXm69agQ>
    <xme:SAP6ZQ4463XEFoRsqc2R_yR_AeAWSkLAjm7FDNNW6mlrp1IR3rGV4E2xagg3iQ00y
    yUy3maOGBoUtDpCYA>
X-ME-Received: 
 <xmr:SAP6ZSfKy1FLqEBUF9fP34CuIR-409DJpfe6euVvcswBqLF7T8KETzc5oc9MjDbZAAlhX8zwHYtDedpLBahuh7Liafji5HYhrQ>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvledrledtgdduvdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepvfhimhcuvehr
    rgiffhhorhguuceothgtrhgrfihfohhrugesshihshhtvghmjeeirdgtohhmqeenucggtf
    frrghtthgvrhhnpeekgfetfedviedvhffftdffgfeifffhteeguddukeeifeeuuedtleef
    tdevueehfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehttghrrgiffhhorhgusehshihsthgvmhejiedrtghomh
X-ME-Proxy: <xmx:SAP6ZcKIO14yfPt13ZSNdogLUskUPOjtyOsieLlhPS7KLmL0T2vWWg>
    <xmx:SAP6ZfJKUyezUaKLh3vXydxW22hE_5pYmipfW9wyq8CkbgPYyLYjZA>
    <xmx:SAP6ZVzxygdm4fwhd6jo41tY8z2XeUXagHs5miyaboC3NRNgxroUDw>
    <xmx:SAP6ZbL9rmG64vcMZaaTVFfWtnu2omp8rtHyIEHsEB-fezf0V1ZOMw>
    <xmx:SAP6ZX_k2WvLT-Au45uRH3XvhMOkt-zUq2LUWq5y_u9cz0rsl3aH-WJAXYU>
Feedback-ID: i1761444e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 19 Mar 2024 17:27:35 -0400 (EDT)
From: Tim Crawford <tcrawford@system76.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	productdev@system76.com,
	Tim Crawford <tcrawford@system76.com>,
	Jeremy Soller <jeremy@system76.com>
Subject: [PATCH] ALSA: hda/realtek: Add quirks for some Clevo laptops
Date: Tue, 19 Mar 2024 15:27:26 -0600
Message-ID: <20240319212726.62888-1-tcrawford@system76.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: WK43D7NZDFZFM6RVLBD3MJC5AQHL44XL
X-Message-ID-Hash: WK43D7NZDFZFM6RVLBD3MJC5AQHL44XL
X-MailFrom: tcrawford@system76.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WK43D7NZDFZFM6RVLBD3MJC5AQHL44XL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add audio quirks to fix speaker output and headset detection on some new
Clevo models:

- L240TU (ALC245)
- PE60SNE-G (ALC1220)
- V350SNEQ (ALC245)

Co-authored-by: Jeremy Soller <jeremy@system76.com>
Signed-off-by: Tim Crawford <tcrawford@system76.com>
---
 sound/pci/hda/patch_realtek.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index d463d416fc23..25183996756c 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -2645,6 +2645,7 @@ static const struct snd_pci_quirk alc882_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1558, 0x65f1, "Clevo PC50HS", ALC1220_FIXUP_CLEVO_PB51ED_PINS),
 	SND_PCI_QUIRK(0x1558, 0x65f5, "Clevo PD50PN[NRT]", ALC1220_FIXUP_CLEVO_PB51ED_PINS),
 	SND_PCI_QUIRK(0x1558, 0x66a2, "Clevo PE60RNE", ALC1220_FIXUP_CLEVO_PB51ED_PINS),
+	SND_PCI_QUIRK(0x1558, 0x66a6, "Clevo PE60SN[CDE]-[GS]", ALC1220_FIXUP_CLEVO_PB51ED_PINS),
 	SND_PCI_QUIRK(0x1558, 0x67d1, "Clevo PB71[ER][CDF]", ALC1220_FIXUP_CLEVO_PB51ED_PINS),
 	SND_PCI_QUIRK(0x1558, 0x67e1, "Clevo PB71[DE][CDF]", ALC1220_FIXUP_CLEVO_PB51ED_PINS),
 	SND_PCI_QUIRK(0x1558, 0x67e5, "Clevo PC70D[PRS](?:-D|-G)?", ALC1220_FIXUP_CLEVO_PB51ED_PINS),
@@ -10139,12 +10140,14 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1462, 0xb120, "MSI Cubi MS-B120", ALC283_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1462, 0xb171, "Cubi N 8GL (MS-B171)", ALC283_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x152d, 0x1082, "Quanta NL3", ALC269_FIXUP_LIFEBOOK),
+	SND_PCI_QUIRK(0x1558, 0x0353, "Clevo V35[05]SN[CDE]Q", ALC256_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x1323, "Clevo N130ZU", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x1325, "Clevo N15[01][CW]U", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x1401, "Clevo L140[CZ]U", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x1403, "Clevo N140CU", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x1404, "Clevo N150CU", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x14a1, "Clevo L141MU", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
+	SND_PCI_QUIRK(0x1558, 0x2624, "Clevo L240TU", ALC256_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x4018, "Clevo NV40M[BE]", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x4019, "Clevo NV40MZ", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x4020, "Clevo NV40MB", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
-- 
2.44.0

