Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A93D42451A0
	for <lists+alsa-devel@lfdr.de>; Sat, 15 Aug 2020 19:39:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2EF581672;
	Sat, 15 Aug 2020 19:38:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2EF581672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597513163;
	bh=5Z1AB+xA9g1dc9kg+pSIxqfFl0rKo9QfbwKOiGFjOpQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Qdw16GAQBwtXEnFME5YMq7FKXhVSIcnEzwKLeusgiSOvXmE4s9gz0c9fvHiNVf2Fd
	 g/HcUFjP47PIVtmUeHWiSaujkw7j5s7tgrqO24CjdspRQoXEDsgZEwMjgsw152d2r1
	 xq9/3i8WqG4TYy+qbUsVcFgk/BVDUAl74rOuUmAM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 368ABF80161;
	Sat, 15 Aug 2020 19:37:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 51432F8015B; Sat, 15 Aug 2020 19:37:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODY_30,SPF_HELO_PASS,SPF_NEUTRAL,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wforward2-smtp.messagingengine.com
 (wforward2-smtp.messagingengine.com [64.147.123.31])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1142BF8014B
 for <alsa-devel@alsa-project.org>; Sat, 15 Aug 2020 19:37:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1142BF8014B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="fMULs6pn"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailforward.west.internal (Postfix) with ESMTP id 9EB4AB59;
 Sat, 15 Aug 2020 13:37:07 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Sat, 15 Aug 2020 13:37:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Ls7ouCZS5ob9Y+6pc
 AnWwB9qo4t6/+cyQ0ZmwuQ+yAk=; b=fMULs6pnS1TL6+dN02C7TGwtvNWM2AjIA
 Xm7mIWrkflfJr5MCQL5v6bGLmnhYsjH6u7MZcqxUNV1xCtxziFPYe+JilLGf8yIu
 Ma9t6KHHqSGANhQQk1M1XxrHWuppAzZ+s+fw8k/6YvG3cQK3I/BT8HqJP8Q1dYLH
 ysro5KQavbt1xfTMax5++U0qsrDxPKDlnN+J9CDei6LDZehcdorO34lUjA/n1H2O
 nMZiDr3lvNEqLXheudOp+I/x/f4UkUDvi+6CNQ6L7T1MTbbnw23qvLRXQhkmNVUh
 5+J6IU8T8/nKJ6Gfv1UZpjrw8z+pQlerNMF4vIYG9rrP7AvaXfYWg==
X-ME-Sender: <xms:Qh04Xyc8FyHWMCTxSR-XFzfoCmLc61j80Ys1297id9D74mKPtKggUw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrleelgdduudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefvrghnuhcumfgr
 shhkihhnvghnuceothgrnhhukhesihhkihdrfhhiqeenucggtffrrghtthgvrhhnpeffue
 eugeegvddtudeludehledvkefftddtgeejheehvdefudeiffekgfeiteettdenucffohhm
 rghinheprghlshgrqdhprhhojhgvtghtrdhorhhgnecukfhppedukeekrdduvdeirdekle
 drgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpeht
 rghnuhhksehikhhirdhfih
X-ME-Proxy: <xmx:Qh04X8PC2YT2mal1FptDl2UXSwPLyWCdILesxj4YF66UDoc5qssaCQ>
 <xmx:Qh04Xzh319LkOjJLu5tj6VFwc5CuqTN4s6RFmSV5MIgyu7X4RG4Jcw>
 <xmx:Qh04X_9-XRdTI1AO92fCORYR1Gz1qQnP_P_Vuh4Yp-Q0psPSNRGfZw>
 <xmx:Qx04X85kTinqBlpw4gqnC0OQACR3I4ky5D6Fwwgd-Af-hqyQX-P72UhRf6E>
Received: from localhost.localdomain (unknown [188.126.89.4])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9AAB93060067;
 Sat, 15 Aug 2020 13:37:04 -0400 (EDT)
From: Tanu Kaskinen <tanuk@iki.fi>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 alsa-lib] README: add patch submission instructions
Date: Sat, 15 Aug 2020 20:35:55 +0300
Message-Id: <20200815173554.39173-1-tanuk@iki.fi>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>
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

Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
---

v2:
 - fixed Markdown syntax: changed ' to `
 - added Signed-off-by

 README.md | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/README.md b/README.md
index 3cd122d5..56af78d0 100644
--- a/README.md
+++ b/README.md
@@ -12,3 +12,14 @@ http://www.alsa-project.org/alsa-doc/alsa-lib/
 
 You may give a look for more information about the ALSA project to URL
 http://www.alsa-project.org.
+
+### Submitting patches
+
+The preferred way to submit patches is by sending them by email to the
+alsa-devel mailing list. Sending mail to the list requires subscription,
+subscribe here: https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
+
+Add Takashi Iwai `<tiwai@suse.de>` and/or Jaroslav Kysela `<perex@perex.cz>` to
+Cc so that your patch won't be missed.
+
+Patches are also accepted as GitHub pull requests.
-- 
2.20.1

