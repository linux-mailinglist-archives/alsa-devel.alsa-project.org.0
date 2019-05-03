Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 21620131BA
	for <lists+alsa-devel@lfdr.de>; Fri,  3 May 2019 18:02:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A58561809;
	Fri,  3 May 2019 18:01:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A58561809
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556899357;
	bh=5C1Q6uckxaxMhMWxNgtpOj2N+w2NCy8OBhDo0p8x/qM=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=uzG3pV2f/KjtSI356PjlH68GBNRN6y+oleAE93L0eSwO/ge1SZiZ1CptZrBaIPbbB
	 evEXE0R+AzD/PIe0yK7YXDupmTyiHlMxLYEYylCj+0ULLPWvIAu9NzigLCVfqW4OeZ
	 OsDIjucukCcT2IdxFcahaZZ7/j2jjkUCvMPswgSA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 61C3AF896CB;
	Fri,  3 May 2019 18:00:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 35908F896B7; Fri,  3 May 2019 18:00:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 680E5F80722
 for <alsa-devel@alsa-project.org>; Fri,  3 May 2019 18:00:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 680E5F80722
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="XGx3FEE2"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id CF4CF5E3
 for <alsa-devel@alsa-project.org>; Fri,  3 May 2019 12:00:42 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute1.internal (MEProxy); Fri, 03 May 2019 12:00:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=UxvdQHhY5TDpxV5sRkdsvN36nHRXf
 7LjdsQANd/LfII=; b=XGx3FEE2gWX5uAHWHzECX9UPszGZmjm3OrCFnLWSoj+9F
 1U4KXeheRgc+/ShWDBzl3hyFGuQ2c25BHZfb2qamxMgr0fjJAG79z/OCLq289rQZ
 a50MDelgw5LvwyxgtakmCz992cjP6UyNNtvviRfazm79hFspnudAeXQGBkoU/7Dz
 Goy5At2hUPqC+OxBK0t1IXf2lv23ydV7bIDAXnbpwIqbe0GaCpBqi1iHMr75n+m2
 GTLKfZO5SFfIzGESScZalPNci3IEm5sRaKQTRTLxbXhl/C8WDqCfv/0ccEcPAOU/
 Q3X20pivFrGwBWvlfIALUcrWT6I30XSjJIFJFGniw==
X-ME-Sender: <xms:qWXMXLhtHewNmTwWKkUBq_l_kRfcabwuvjWkwKrHgejjlbeIHXb7Ng>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrjedugddutddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfffhffvufgtsehttdertd
 erredtnecuhfhrohhmpedflfgvrhgvmhihucfuohhllhgvrhdfuceojhgvrhgvmhihsehs
 hihsthgvmhejiedrtghomheqnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjvghrvghmhi
 esshihshhtvghmjeeirdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:qWXMXMT830-QjIx1I5JrTCr3_yVrYSCMsSuDq-hfyrSfjf8N0WEruQ>
 <xmx:qWXMXGGk0f3BetQZ9xHE0Bp08CDQOGB-9ECW0DV7iFvO9ys-uvC56g>
 <xmx:qWXMXMksXSIlCPuabXNKfUaW-cdRrvQR453x5pFEsPD0_OV9hDRkNg>
 <xmx:qmXMXDsIhgQSVDy-FRImpaLVsXYN6fxPnC766BWOT_d7-yRFWOZvlg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 9502C7C6D9; Fri,  3 May 2019 12:00:41 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-449-gfb3fc5a-fmstable-20190430v1
Mime-Version: 1.0
Message-Id: <ed364456-7db7-4d8f-966a-c7311a6350c1@www.fastmail.com>
Date: Fri, 03 May 2019 12:00:40 -0400
From: "Jeremy Soller" <jeremy@system76.com>
To: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH] Headset fixup for System76 Gazelle (gaze14)
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On the System76 Gazelle (gaze14), there is a headset microphone input attached to 0x1a that does not have a jack detect. In order to get it working, the pin configuration needs to be set correctly, and the ALC269_FIXUP_HEADSET_MODE_NO_HP_MIC fixup needs to be applied. This is identical to the patch already applied for the System76 Darter Pro (darp5).

Signed-off-by: Jeremy Soller <jeremy@system76.com>

---
diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index f5b510f119ed..4ea3affad617 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -6931,6 +6931,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1462, 0xb120, "MSI Cubi MS-B120", ALC283_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1462, 0xb171, "Cubi N 8GL (MS-B171)", ALC283_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1558, 0x1325, "System76 Darter Pro (darp5)", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
+	SND_PCI_QUIRK(0x1558, 0x8550, "System76 Gazelle (gaze14)", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x17aa, 0x1036, "Lenovo P520", ALC233_FIXUP_LENOVO_MULTI_CODECS),
 	SND_PCI_QUIRK(0x17aa, 0x20f2, "Thinkpad SL410/510", ALC269_FIXUP_SKU_IGNORE),
 	SND_PCI_QUIRK(0x17aa, 0x215e, "Thinkpad L512", ALC269_FIXUP_SKU_IGNORE),
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
