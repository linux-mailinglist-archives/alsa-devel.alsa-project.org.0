Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C23D525CB8D
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Sep 2020 22:56:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 605491ADE;
	Thu,  3 Sep 2020 22:55:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 605491ADE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599166586;
	bh=TrIh8ZKIcUopSkHo6kTsQupk75l6HAp2zNT+yxtPfSI=;
	h=In-Reply-To:References:Date:From:To:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cZw1ys/B1Lnej0CTZJ8Xn9bN5uJxHpNom9z2MJCTFgv7so71SI5PSiJR4MgZwsS8Y
	 VlBJ3VRESzWNcx0vOScaFG6v84ON0sma9ZnMHz4Lea9ghddaWGP+IXXYgvqXGWfxqx
	 PB7HO066LQE8vGLZv7KK70Cbiarnfyh2pTsZurhY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A6E19F80217;
	Thu,  3 Sep 2020 22:54:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C2C1FF80217; Thu,  3 Sep 2020 22:54:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D2417F800F0
 for <alsa-devel@alsa-project.org>; Thu,  3 Sep 2020 22:54:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2417F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="fB4ITS2n"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id D99FEEAD;
 Thu,  3 Sep 2020 16:54:35 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 03 Sep 2020 16:54:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=bC/Q4h
 DX0GMR7dks5P+l16taks+sXUSlK86EFQpgdnU=; b=fB4ITS2nBpW2R/tZXfN0w4
 XK7qH1PTiZaOiTUcWggTqZGzKmrXTt3RyttVn4qEh7g129dEqaPOnqMn38QHTaim
 DDa72QnrKWmDgGqRWpejYXyeDrDBhv4CbrIwE/W14Rw7wwyKMn/JE+X8b3rv0Ugu
 Ij2XWxcPfv7rncb3t4OjNfQr/77QNEoTFaPdj1LH2mmJ/dAoTEPN/RynySqNIg/m
 VazBItnEQOj7unWODj6I36+snYwUecCebYTUpffXRjjQYRaeZA3W3NlUZQaBv4DB
 iax8ybjkyWwnhSsfaIkD3fXvLERfAwKL7s5l4QO/M36tkZFjlPwmUWOyVD7dd5DQ
 ==
X-ME-Sender: <xms:C1hRX4zJxOuG_szAw0LSqSXPxanzygZoxSq-jPl2i1DaOAaqzfhwFA>
 <xme:C1hRX8S046wmybzsIXxVdw_qWkCeHN7V3pIyP3qo2lej855JY_tz_dVAYne7FJ-yq
 DC-a_hylV93nSpRdg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudeguddgudehiecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkjghffffhvffutgesth
 dtredtreerjeenucfhrhhomhepfdflvghrvghmhicuufholhhlvghrfdcuoehjvghrvghm
 hiesshihshhtvghmjeeirdgtohhmqeenucggtffrrghtthgvrhhnpedthfeuhfehteeihf
 efgeejjeduhfehjedvveejteegffekgfeggeefuefhkeeitdenucevlhhushhtvghrufhi
 iigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehjvghrvghmhiesshihshhtvghmje
 eirdgtohhm
X-ME-Proxy: <xmx:C1hRX6VnbMV6rvRQWe1ZzkelP0yGXhoQeh7C6o4sgEykwOsS9DuJoA>
 <xmx:C1hRX2jLRVtIItPBsSwIU0bPZIuJZ8yFLBHLi6JGmhSAS10Nm-0awg>
 <xmx:C1hRX6DPmoG1YkK2kDrDJyClv6SDwcy26qVDbaaVaU7jiOoXomvb5A>
 <xmx:C1hRXx88uALFams8dSl2utr5E-OqJbG56EmWdhKSh0MgnJDJRp4gjg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 2F2BBE00EC; Thu,  3 Sep 2020 16:54:35 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-259-g88fbbfa-fm-20200903.003-g88fbbfa3
Mime-Version: 1.0
Message-Id: <7e8def27-dd27-425f-a202-12248f81cadb@www.fastmail.com>
In-Reply-To: <624b02a6-d3a3-4717-aaf9-dada14df421a@www.fastmail.com>
References: <86a53327-0c15-4ea7-a158-2c6eb61aaa85@www.fastmail.com>
 <624b02a6-d3a3-4717-aaf9-dada14df421a@www.fastmail.com>
Date: Thu, 03 Sep 2020 14:54:14 -0600
From: "Jeremy Soller" <jeremy@system76.com>
To: alsa-devel@alsa-project.org
Subject: =?UTF-8?Q?[PATCH_3/3]_ALSA:_hda/realtek:_Add_quirk_for_System76_Serval_W?=
 =?UTF-8?Q?S_(serw12)?=
Content-Type: text/plain
Cc: =?UTF-8?Q?Bj=C3=B6rn_Lindfors?= <productdev@system76.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The System76 Serval WS (serw12) requires the
ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE quirk for the headset microphone
to function.

Signed-off-by: Jeremy Soller <jeremy@system76.com>
---
diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index de880eb92d95..a7ac46af5876 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -7703,6 +7703,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1462, 0xb171, "Cubi N 8GL (MS-B171)", ALC283_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1558, 0x1325, "System76 Darter Pro (darp5)", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x1401, "System76 Lemur Pro (lemp9)", ALC269_FIXUP_HEADSET_MODE_NO_HP_MIC),
+	SND_PCI_QUIRK(0x1558, 0x50f0, "System76 Serval WS (serw12)", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x8520, "System76 Gazelle (gaze15)", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x8521, "System76 Gazelle (gaze15)", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x8535, "System76 Gazelle (gaze15)", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
