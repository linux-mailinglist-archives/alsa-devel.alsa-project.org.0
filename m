Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B1A6F86E2
	for <lists+alsa-devel@lfdr.de>; Fri,  5 May 2023 18:38:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7A9F2D55;
	Fri,  5 May 2023 18:37:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7A9F2D55
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683304679;
	bh=2FFcPgjqPGL1p3hZ36ss91I327mpl5v2YVW6AYg0cRk=;
	h=To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From:Reply-To:Cc:From;
	b=QD3tyQ/FL8wqOmC25otA4qJeoC2/KblB6H2a4S0eVirOLK851KpvQRsnroaBi1J1Z
	 WORbob5rZ6cufanJe9mwzV0WFzKmKdHfZDe2n7ZnaY2viyNxpZQYLM+9uXw0/ga7Si
	 gHgNunMjSt4fbv+Hxr7KBQB4ltXne8u7mMryabjg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 16063F80529;
	Fri,  5 May 2023 18:37:09 +0200 (CEST)
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda/realtek: Add quirk for Clevo L140AU
Date: Fri,  5 May 2023 10:36:51 -0600
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UCYH4F6H4OTWPB35ZZ5HZ66JKMC44IGR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168330462874.26.16477454361923749640@mailman-core.alsa-project.org>
From: Tim Crawford via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Tim Crawford <tcrawford@system76.com>
Cc: tiwai@suse.de, productdev@system76.com,
 Jeremy Soller <jeremy@system76.com>, Tim Crawford <tcrawford@system76.com>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C2CEBF8052D; Fri,  5 May 2023 18:37:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 542E6F804B1
	for <alsa-devel@alsa-project.org>; Fri,  5 May 2023 18:36:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 542E6F804B1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=system76.com header.i=@system76.com header.a=rsa-sha256
 header.s=fm3 header.b=oQN/XaZv;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=UV81SAFn
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 06BE65C01D5;
	Fri,  5 May 2023 12:36:58 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Fri, 05 May 2023 12:36:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=system76.com; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1683304618; x=1683391018; bh=18LDF5N6hP
	Zv1yWQqhuAmnt4rM0P3RA1etUVmhzbnCs=; b=oQN/XaZvpSFo7M2XKNCsnKA0EI
	Pz0I2hGtSM3JjPsaN4PmL3PXD8gDjtQXbfs16L5DPTyZ/qgVc25oftyC/VlZKiPb
	6BOyopK6rgDwD9/AIEM6VocAjyAk1K4kR+SdUoeaQyNbo/e8quvCt9UkE+Dllb+u
	C+PZCQvVfkrx8WoMJAGlE0xdw/r2hgsijwtFHkRO4n4Gw5mQTTxrYxjSh8hzLO+t
	8VQtv3icvuW9shdqlWqTK4E8/R3vCkj0RqOt90OOal2k/JG8MgsPU1dePA4g81jb
	BlpSUKz1eOQWxy+ePQTMk7bBCYp4R8/TBWLrH8HEB1LZnaE7fqMFtsna9BFg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1683304618; x=1683391018; bh=18LDF5N6hPZv1
	yWQqhuAmnt4rM0P3RA1etUVmhzbnCs=; b=UV81SAFnvJPd9AfpIxqImtPnatrWK
	QvLYM3PRchTIRkxf9eNYbv4k3noBcB9KFxAZAG1rL/VmCpQhY7ZnN6EqQx9oPsD8
	D9u6v7fpV7byFFzxEWc8DyD201JeSSGfmp0R3L9pYEkvx6w7EUBbpTnmPHC/3QHo
	+/02nNw3NbUoi05N92SEGULNxaRhJkhEJvhY6yg0eAwvhnpBNdISBUXKYTIkvwhc
	SgXhLdcQkDhp8Ib5dhAyvhoh0Ckant5dav7XeqQRtoTyZNh1QUV0C3/xBYRtSP1T
	cMwAXrIHAa5HwZNV671A4zDWVE8KSO0DUm5K8v/0eT0SOxyP8hD5drE/Q==
X-ME-Sender: <xms:qTBVZBVFaCJKOKKAT4hU4b34joag76j4zyeJeqdvcXiIk-znFL6sAA>
    <xme:qTBVZBlkyIH1D2dhX_VKJWv1uRnYqpUd33qipcBbQi4CTdWjiQZ3MwnE00577sZij
    AxSLzIh9iyzc3KROA>
X-ME-Received: 
 <xmr:qTBVZNZsrTi5LrkltIWCTQbQzBC7j4e_YSm82mmybfsIXhN-rpXZ91KK7QYAeDTo5KLqKd2Yyj0ZlKnhb8XYrjrNqn3sem2sDb42WBnvhw>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvhedrfeefvddguddtgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefvihhmucev
    rhgrfihfohhrugcuoehttghrrgiffhhorhgusehshihsthgvmhejiedrtghomheqnecugg
    ftrfgrthhtvghrnhepkefgteefvdeivdfhffdtfffgieffhfetgeduudekieefueeutdel
    fedtveeuheefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepthgtrhgrfihfohhrugesshihshhtvghmjeeirdgtohhm
X-ME-Proxy: <xmx:qTBVZEUHyx-1yzjimagyZqkGLlTwEJqcLzp3yEs3USr0Kz3KA2Mv3g>
    <xmx:qTBVZLna2bcW3l8vnrDmuhMYFd-WWZPS5ty_Yb_wZqeiR5SgFEJKKQ>
    <xmx:qTBVZBfztpPWslKqTrP-CztD_K3W3nMvEGIxm0txG_l_j6D42wD1Lg>
    <xmx:qjBVZJgEjPyTj5-qZ2D9vwpPkQgd4Qr5LJfIHHnfSt2VOAqnYBXmsg>
Feedback-ID: i1761444e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 May 2023 12:36:57 -0400 (EDT)
From: Tim Crawford <tcrawford@system76.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda/realtek: Add quirk for Clevo L140AU
Date: Fri,  5 May 2023 10:36:51 -0600
Message-Id: <20230505163651.21257-1-tcrawford@system76.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: UCYH4F6H4OTWPB35ZZ5HZ66JKMC44IGR
X-Message-ID-Hash: UCYH4F6H4OTWPB35ZZ5HZ66JKMC44IGR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UCYH4F6H4OTWPB35ZZ5HZ66JKMC44IGR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Jeremy Soller <jeremy@system76.com>

Fixes headset detection on Clevo L140AU.

Signed-off-by: Jeremy Soller <jeremy@system76.com>
Signed-off-by: Tim Crawford <tcrawford@system76.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 068ce0db9562..570f3478c4e7 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9617,6 +9617,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1558, 0x7716, "Clevo NS50PU", ALC256_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x7717, "Clevo NS70PU", ALC256_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x7718, "Clevo L140PU", ALC256_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
+	SND_PCI_QUIRK(0x1558, 0x7724, "Clevo L140AU", ALC256_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x8228, "Clevo NR40BU", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x8520, "Clevo NH50D[CD]", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x8521, "Clevo NH77D[CD]", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
-- 
2.40.1

