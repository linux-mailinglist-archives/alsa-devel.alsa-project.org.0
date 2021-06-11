Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA6C3A3F38
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Jun 2021 11:40:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 209591924;
	Fri, 11 Jun 2021 11:39:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 209591924
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623404406;
	bh=3hvQRbIBZodSwK7Oxcas8k7Ms1ILe/OcL+FwZjp0aII=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VQfb6PrCY/NQMnuUDyn0lQLZZnw+TC0SSZsXHfm0ccjo0frB6K2fIiuDa8is+gVnz
	 R1qv8PFVwFEtibMkxY1BiNGSDIEf+I/bO0yqxAzF/Pv3zUilBmlxo2HRLA8d2Z8pPB
	 Eb1fIT0jaZpsQkC61mrDy/12GhVEhCtsS+/B++OU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75E8AF80149;
	Fri, 11 Jun 2021 11:37:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 59B40F804CA; Fri, 11 Jun 2021 11:37:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB6BCF80149
 for <alsa-devel@alsa-project.org>; Fri, 11 Jun 2021 11:37:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB6BCF80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="F0AVUTrB"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="oJpxTWyJ"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 0890DA6F;
 Fri, 11 Jun 2021 05:37:43 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Fri, 11 Jun 2021 05:37:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=dBgbnBfD11/6I
 BQz2U5e2J+JqfALg9QDZTXoU0hn39I=; b=F0AVUTrBzYgWF+KuvM2fgOYoH5qL/
 XukGzIXmB8EDmtxGUHlTSlmx87qkLLMhBB4/7mtjvxNtqdh11oo3rGQJ3fcumNq9
 lEH6XKN+4Ps1v3LOLOa4U5Yb7sdkKHYPt6CXwXX9mptuKHjJQykvOtrHOOjK1G+I
 eEbLooyn7rLZ3z0QpS0eNFYpoxgF9Ox82qGRe0XyWziXCDgJXiNw5RteCeGUQvSX
 y9HsfFOCFkqDWp7GNFY5iD7CFADBrxZgJGbEiPhDIe/OLu3J7dFllIj76GJ6/qM/
 0kDK14sNFFVE8IPixW9HSe4piYfA+awYqOa2HM16j5KYVoGX49RIwDZ5g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=dBgbnBfD11/6IBQz2U5e2J+JqfALg9QDZTXoU0hn39I=; b=oJpxTWyJ
 R3GQpMe8/Ta1NpJPSznXx7EDDIe76XvT+2yUkYfLIvv5h4KSbsWufHfVcjNM6dDa
 0jGBoLgNadTXU5zTuoMb106mAI+e0oHL/JkRpgr8M9sPAI2gZKfEMEvPr7sZEcBb
 +dwR0wvhxPf+S8kiAaCSeRfi0PtVO6rzTC4jTQgO/GDMhCTCjU+V0Ih77MHx5d+K
 SbPGiRRsVYhiCIvQ07FRerGIdg5DMHcZaLnBoLa8teSXdx5z6Ha0JupXW4Ugu0VO
 nfD4yIjA06n2lCi7KUPwJaQwvBcgmijO67Doyp9KfDP+Hv9xyZNAm6HTLbGwH+p4
 FIEazKQHLHI1VA==
X-ME-Sender: <xms:5y7DYC7suX6qMQNAcLsOn8IrZgKG6C80Bgq2XPVDCwXgRRlsChfuhQ>
 <xme:5y7DYL7_uOVpilrABv3qvvxXn_eR0OzEV7u4ULyXwdyPnPonFc8F22Bsk3iqfENF4
 9RqTHRLvNMCxjBLw4E>
X-ME-Received: <xmr:5y7DYBfwEYTk-YSc0_C0EXlHZt6__vhtVJx5dg53v2lgESmvN5tGquOBIWdyKN302720G4Toh-sF7gLQ3aPb6b0VBQ0d1ctAL65xPTAcba2x26iYukQI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedujedgudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepgfekgfetle
 dvhfehvdelkeduieefffeuveelkeegveeltdfhieejheeuveeileelnecuffhomhgrihhn
 pehffhgrughordhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
 hilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:5y7DYPJPb-U_d67Mzu_1gw19-khZIHBytzfcpYyfJZFyby-nGbaWVw>
 <xmx:5y7DYGI6lH04qBdKG4OePlK_njQMj_KDdcwMgBlk_HLeGczEFWVPdA>
 <xmx:5y7DYAyEz_NXceLy2izF6WLLGkqbfNoO3wYrohMz57vhZGJ8oMGB5w>
 <xmx:5y7DYIinUa39m7DHeeT9m3jgBSlsPtUigoK4fB5dWD-dtA6oGl1Irg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 11 Jun 2021 05:37:42 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 4/6] ALSA: bebob: correct device entry for Acoustic Reality
 eAR Master One, Eroica, Figaro, and Ciaccona
Date: Fri, 11 Jun 2021 18:37:28 +0900
Message-Id: <20210611093730.78254-5-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210611093730.78254-1-o-takashi@sakamocchi.jp>
References: <20210611093730.78254-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, clemens@ladisch.de
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

The value of vendor OUI is invalid. Furthermore it seems to be Terratec
OEM.

 * http://subversion.ffado.org/wiki/AvcModels/AcousticRealityeARMasterOne

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/bebob/bebob.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/firewire/bebob/bebob.c b/sound/firewire/bebob/bebob.c
index db1c1dfc0484..6784ab2cb678 100644
--- a/sound/firewire/bebob/bebob.c
+++ b/sound/firewire/bebob/bebob.c
@@ -46,7 +46,6 @@ static DECLARE_BITMAP(devices_used, SNDRV_CARDS);
 #define VEN_BEHRINGER	0x00001564
 #define VEN_APOGEE	0x000003db
 #define VEN_ESI		0x00000f1b
-#define VEN_ACOUSTIC	0x00000002
 #define VEN_CME		0x0000000a
 #define VEN_PHONIC	0x00001496
 #define VEN_LYNX	0x000019e5
@@ -403,8 +402,8 @@ static const struct ieee1394_device_id bebob_id_table[] = {
 	SND_BEBOB_DEV_ENTRY(VEN_APOGEE, 0x01eeee, &spec_normal),
 	/* ESI, Quatafire610 */
 	SND_BEBOB_DEV_ENTRY(VEN_ESI, 0x00010064, &spec_normal),
-	/* AcousticReality, eARMasterOne */
-	SND_BEBOB_DEV_ENTRY(VEN_ACOUSTIC, 0x00000002, &spec_normal),
+	// AcousticReality, eARMasterOne. Terratec OEM.
+	SND_BEBOB_DEV_ENTRY(VEN_TERRATEC, 0x00000002, &spec_normal),
 	/* CME, MatrixKFW */
 	SND_BEBOB_DEV_ENTRY(VEN_CME, 0x00030000, &spec_normal),
 	/* Phonic, Helix Board 12 MkII */
-- 
2.30.2

