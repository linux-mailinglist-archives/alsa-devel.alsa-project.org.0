Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8E416CE3
	for <lists+alsa-devel@lfdr.de>; Tue,  7 May 2019 23:13:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB8E617FF;
	Tue,  7 May 2019 23:12:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB8E617FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557263598;
	bh=xJG2uWVl+DllN45QUKoHNEgawGHTETC7CywFCCaw2O0=;
	h=In-Reply-To:References:Date:From:To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dpdqNDG+OREOITytHehqZLPexyOdx6odWJgjdN0sum0eGvdKMj5sMbZemA0orFwTB
	 f4I5/o/SWyUrQQ4H2uNs2EG7YJAZts6pFmGt0g5nAHhmxDI4PuoP4TPNWjX5MAcq+A
	 fki1OG2PgwaZGgNHyiv5fhXNr47vsConFGu6QQho=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 48FE7F8972A;
	Tue,  7 May 2019 23:11:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 909D0F89727; Tue,  7 May 2019 23:11:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 58630F89725
 for <alsa-devel@alsa-project.org>; Tue,  7 May 2019 23:11:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58630F89725
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="PfB4dfP+"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 6156237F
 for <alsa-devel@alsa-project.org>; Tue,  7 May 2019 17:11:09 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute1.internal (MEProxy); Tue, 07 May 2019 17:11:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Wdsg7j
 rvxJr4AA2lcroJLlOXIhYrNKRoTtG5syntYs8=; b=PfB4dfP+r3Ik/aVZPqbnK+
 9iS8eD9q2bUKnqUtT9ofxtGEks0Qw5CfBdzC9nF6HxUoWWdmyu55cGKcKMm8KO0F
 h3lfQ+oL1ZmrTenIiUroCVb75Tm7BVV8lKnKRQLBC8v6ORkbML595JrGbvL2NDbH
 v5Eo3Ld0K1pSILi5rRpLdvd7VWUigXCKMjR0R5EZ2NikoxSdpmZa1IpOIMefdMvJ
 xrqoe66XalXpVh5z5iR8A5sy24p1sHLjmcIWpCq2q93qLyPLPYaFojhftNhkW4Zf
 zqZ8FFaejL62QBNX0rfKizTx4V+RDlrlbivebeqg8dDqVh7rY7WEZHAq+K7RIRfw
 ==
X-ME-Sender: <xms:bPTRXON_sZMw9hz6thERptBb1tvxXlFFNqGtDPywKkMRr-4Oa2hhsw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrkedtgdduieefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtsehttd
 ertderredtnecuhfhrohhmpedflfgvrhgvmhihucfuohhllhgvrhdfuceojhgvrhgvmhih
 sehshihsthgvmhejiedrtghomheqnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjvghrvg
 hmhiesshihshhtvghmjeeirdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:bPTRXMonOKQgpPXhyoKz59323l-HOHoUDc5gagwA7VMx3hGR-1Q2gQ>
 <xmx:bPTRXA7zWJxSEt6XLQYw0juvsVabRpJmUwk6tD6KgWTvpmK7Xob7yg>
 <xmx:bPTRXKhUdKgol__OyyOUYu-c_TtG7Yn069koGfQ6McBM-cTvFLssyg>
 <xmx:bfTRXIIu4psMqdkzoMvmsuFcvVfaWtiPVJ9zrD6ilbLOqWcy1-ZNTw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 756B07C67A; Tue,  7 May 2019 17:11:08 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-449-gfb3fc5a-fmstable-20190430v1
Mime-Version: 1.0
Message-Id: <b7fac4d4-558f-4c20-8db6-06e0188a49c9@www.fastmail.com>
In-Reply-To: <ed364456-7db7-4d8f-966a-c7311a6350c1@www.fastmail.com>
References: <ed364456-7db7-4d8f-966a-c7311a6350c1@www.fastmail.com>
Date: Tue, 07 May 2019 17:11:08 -0400
From: "Jeremy Soller" <jeremy@system76.com>
To: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [PATCH] Headset fixup for System76 Gazelle (gaze14)
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

Updated patch, adding second PCI ID:

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
+	SND_PCI_QUIRK(0x1558, 0x8560, "System76 Gazelle (gaze14)", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x17aa, 0x1036, "Lenovo P520", ALC233_FIXUP_LENOVO_MULTI_CODECS),
 	SND_PCI_QUIRK(0x17aa, 0x20f2, "Thinkpad SL410/510", ALC269_FIXUP_SKU_IGNORE),
 	SND_PCI_QUIRK(0x17aa, 0x215e, "Thinkpad L512", ALC269_FIXUP_SKU_IGNORE),
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
