Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 296EE3A3A89
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Jun 2021 05:52:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA222186C;
	Fri, 11 Jun 2021 05:51:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA222186C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623383541;
	bh=zpwedSey2iPVaQsFw7XYv1YPXgYvYPWEzyBJJj3K8HM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UJBFRnznJkOmPvX1SkLe7OYMoXsl+P5t9lDBJB6WqhrOGx1SXCNJXq1cbxv0W8SpB
	 F6NLnh0UoJyHgKmnz5PV43iW57n7ucw7sTCdDIeoL3WoLsd6o5fOXRyILZ6AMyhbWb
	 dz4OghtPi1WFZQyNWabqiXtintsJ0aLT6M0zswXI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 018A3F804C1;
	Fri, 11 Jun 2021 05:50:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE9D6F804B4; Fri, 11 Jun 2021 05:50:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8054F802A0
 for <alsa-devel@alsa-project.org>; Fri, 11 Jun 2021 05:50:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8054F802A0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="RpcHZ+LX"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="p5wN97c4"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 665021943;
 Thu, 10 Jun 2021 23:50:11 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 10 Jun 2021 23:50:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=dASBS8SIufRV3
 e4q6dP0/X+IyHfWlNItgGggAGbji4E=; b=RpcHZ+LXEXzpColXPScqDRQgpEpTI
 y0ZV1w53dy9BOB4lbxbbXplc3lbkTHCEs14Z4aXei3A1DgmKEJiWKZO3OKBm3unC
 53+pHGyJwAgzhTRssZ5RYa0YFms3ys/FVt6MG0VHBeSVvuymyvD4sGNcvpNSnbZj
 bJ/ZC9B3VWO5rIQdRhTmH0YfQFqGk7n1ctflHkD4qA5hN9ScR6r2OjzLymvwg3XK
 kL+QqcSi2FLwI0mpt+9X1gQteYnbVUysh5/7zgrK2anP+KraRV2vCMmkFiq77gue
 EONeeaYDTOZ/uBNB4POUahntSCJZrqzuXKjx/eEA/d3iAs67QXnmJnCKg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=dASBS8SIufRV3e4q6dP0/X+IyHfWlNItgGggAGbji4E=; b=p5wN97c4
 qxstyKNicPWqlaNeIn2px8rcpMpU2qht2WKxsq9+ZcRB5Ib3Ypv8VhA71lKmPBYd
 4TbJePpDclWyA357dEmMpmj788Ryv1l+ZdLNCc14rXJA7IS3Ipu1ZbZApn9z1SRf
 U5QTaoBKtphF4VUby7hp/Pm6axVFHgRCNMghM/0PKzAOteLccNDP00WsC4kXS2TE
 uR0eVQtjpJUvqPH3PT/ghFrwrb3eI40Xj38ATGil/pP6ik11w6oIwFv+xPKqhA6W
 oWMKjkwbjrnGmMp8Fyw2PdNQrV2A7Bfz+zx7pB5AOZWHaI3Nz7YiQn+UqKZnHmen
 RaCDtG4jY74gKg==
X-ME-Sender: <xms:ct3CYFVnI9fCnquJhqrsjweV9kLK8QsRpKwKnkVS14d2x2PoLwpBVg>
 <xme:ct3CYFl5O6ksTGIHxns-K5vhiyzLJDIzSyoOSKuMRZz3XGEjGwVVIuknVyOVYe1JP
 BrONJLG51fGnWSGod8>
X-ME-Received: <xmr:ct3CYBb5xIBI5gOK2OxOsZOOnI8mh1Nkvkm_-Fp4V-nZJ_7bzeV1ZgRXma6U4SyzypWiKDeMllV4ACW84JRP99vPw0F-ZuOTJ2p3REpQORzWXM5029se>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeduiedgjeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecuvehluhhsthgv
 rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihessh
 grkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:ct3CYIU-08QYw-XtpPtSU22jpgf_Hr1vO4EGbhz4_3AQjIOTKkFf0g>
 <xmx:ct3CYPng_MwdZl-hAqqrYo149lzQ3CkoB1TDOMHjbGN1e2lE1rSd4w>
 <xmx:ct3CYFccPk7szXRWYiehhFtmFFDrr4BNKaVsU5KWNa264sbYSGWEEg>
 <xmx:c93CYHu1n1Lyz910ZT-jVAwK8FsZsWx6CDry_rIy-xD4wa8Q1zoWlQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Jun 2021 23:50:09 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 1/3] ALSA: bebob: dismiss sleep after breaking connections
Date: Fri, 11 Jun 2021 12:50:01 +0900
Message-Id: <20210611035003.26852-2-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210611035003.26852-1-o-takashi@sakamocchi.jp>
References: <20210611035003.26852-1-o-takashi@sakamocchi.jp>
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

In a commit d3eabe939aee ("ALSA: bebob: expand sleep just after breaking
connections for protocol version 1"), a workaround was added for a quirk
of freeze in BeBoB protocol version 1. As long as seeing with sequence
replay for media clock recovery, the quirk disappears.

This commit removes the workaround.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/bebob/bebob_stream.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/sound/firewire/bebob/bebob_stream.c b/sound/firewire/bebob/bebob_stream.c
index 470c2b70cbfa..6d47c25654e6 100644
--- a/sound/firewire/bebob/bebob_stream.c
+++ b/sound/firewire/bebob/bebob_stream.c
@@ -401,12 +401,6 @@ static void break_both_connections(struct snd_bebob *bebob)
 {
 	cmp_connection_break(&bebob->in_conn);
 	cmp_connection_break(&bebob->out_conn);
-
-	// These models seem to be in transition state for a longer time. When
-	// accessing in the state, any transactions is corrupted. In the worst
-	// case, the device is going to reboot.
-	if (bebob->version < 2)
-		msleep(600);
 }
 
 static int start_stream(struct snd_bebob *bebob, struct amdtp_stream *stream)
-- 
2.27.0

