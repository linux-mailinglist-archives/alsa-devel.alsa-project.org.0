Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FAC75B95F8
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Sep 2022 10:10:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD8B018ED;
	Thu, 15 Sep 2022 10:09:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD8B018ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663229441;
	bh=Fw7LofPdwkA3JicDBJ7TMtjX3E9U6G456ZX5l5QzUhU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=k36e/tp0tY+d7LQ+nriCSEZaveUAeGeabktJqmmladGkOe/483ITsYKEwaBTfWhLF
	 WXdSoskfNYwEttWRRUef/o3UCYCD+WKn8/necQ6ELPcJCK4/+D+RyZLldKSzoAEtSo
	 farq0AEyAa2D7sAtSdEy1oy/Mz3RLZ5/FaEJxeOE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 26BB2F8032D;
	Thu, 15 Sep 2022 10:09:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9B14F800FE; Thu, 15 Sep 2022 10:09:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5C4FCF800FE
 for <alsa-devel@alsa-project.org>; Thu, 15 Sep 2022 10:09:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C4FCF800FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev
 header.b="GvflTb70"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="epYlB/+5"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 3CA843200B5D;
 Thu, 15 Sep 2022 04:09:33 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 15 Sep 2022 04:09:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm3; t=1663229372; x=1663315772; bh=jB3LbFdeH6Kq+2icxS6m8jTZv
 X8bT5/rnnwz9l1va1E=; b=GvflTb70bej+GmsOiABbrcvA3AzhTVK4O04Ma4DN4
 s4Y2YpVAcAmTwcCwjGsewc8DJ5i/mDfDwd8a057keKOmmAObzGiFwji23xFeYXee
 KuSIzVEfEl/FRscwOqPdhHp/z+2+zPczaKZXwKRtBSboZuTh55K8B5bDlE8/Z3dY
 SmKskrT0Y7U+Xm5f0PQF/gYxCh9idakEItYd/dJWj3ytqbt4KNiWcWL3EhKPbZeT
 rSK53rAIPGvlMq/jVgZjhZqmhh+iRVmvWvW0iE22gRPtEMbVs0bDDOZCWFNiL8Sm
 pz9nr6ebZlQ0Rccd4oYw0DBl+K02atBTGESP5DviTl+Ew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1663229372; x=1663315772; bh=jB3LbFdeH6Kq+2icxS6m8jTZvX8bT5/rnnw
 z9l1va1E=; b=epYlB/+5l9dbXlQaZ4DnGm9a2CydhPB/ZKt9cG7/8qWWefHmfzB
 YJ5ZSYlH+j0JXd9mcUmjCGv4iz3a6aYPhwqNFOjr29ToHdn/9akFuV9aAEcwekrq
 gEcFXNlmfzG56KFtsscZ6bGGuvxFqBEnfTgVDdThX05m1cvYGMU7vnUANtsa/rbB
 ePW2UFZnGb0JxUwsUJS20udGLYxcurBHaMcql3j7maPEz4DWhu4B4ov1vHvNVzn3
 YyDS1xPJ1ypJxP+I73EvAYIomNvPkUrPp81DQCAC0WsCg6T7VYOBbcEE0Ob/w8Jk
 4ybL4NuiNmJyzlqI924sGPtDT/CgzxU5Q6Q==
X-ME-Sender: <xms:u90iYxI4HAl_rw_yhNZX7PHUEunkA56wBruwnw-3HNAX0EeI8AoqmQ>
 <xme:u90iY9In8s-0n6Gfefw6NCkhVBKgwrZaLoCC28kca4EnHXVAE7tJF5cwqMILxGVDA
 YxxThyaJ87IwLPeTuc>
X-ME-Received: <xmr:u90iY5v42eJonoUskDFoQ7p49z268KyyVkvH2qPBuQapzzefl2Y1CjPftdrn>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedukecutefuodetggdotefrodftvfcurf
 hrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgggfestdekredtredttd
 enucfhrhhomhepfdfnuhhkvgcuffdrucflohhnvghsfdcuoehluhhkvgeslhhjohhnvghs
 rdguvghvqeenucggtffrrghtthgvrhhnpefgudejtdfhuddukefffeekiefftddtvdfhge
 duudeuffeuhfefgfegfeetvedvgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
 mhepmhgrihhlfhhrohhmpehluhhkvgeslhhjohhnvghsrdguvghv
X-ME-Proxy: <xmx:u90iYyaI8UnGH9KEpLuV42ezMX27PFJ_q9xPwu6n8-xTd8z0PQAMlQ>
 <xmx:u90iY4bgdC9Ti14RwE4iIN4TyCyVSC8jtSgDGeKIzKqqtzUnEeEtlg>
 <xmx:u90iY2CZ6ubAa3y_NngeoLzEk2b81Hlw30aRfJ524SDfw1dG-A3JKw>
 <xmx:vN0iY3k4rR-ixRL5tjGJUaymbU5SzmyfWdp4TGyyr48m5hlep2nuRg>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 15 Sep 2022 04:09:28 -0400 (EDT)
From: "Luke D. Jones" <luke@ljones.dev>
To: tiwai@suse.com
Subject: [PATCH v2 0/3] sound: realtek: add quirks for ASUS G513, G533Z, GA503R
Date: Thu, 15 Sep 2022 20:09:18 +1200
Message-Id: <20220915080921.35563-1-luke@ljones.dev>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, "Luke D. Jones" <luke@ljones.dev>,
 linux-kernel@vger.kernel.org
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

This series adds quirks to fix pincfg for the ASUS ROG G513 and G533Z laptops, and adds a mapping
for the ASUS ROG GA503R to use the previous G15/G14 quirks which fix the DAC mapping.

Changelog:
V2:
- Use smallcaps in hex string
- Chain the G533Z quirk with the G513 quirk as they use the same base pincfg
- Add the quirk for GA503R series to use GA401 quirk

Luke D. Jones (3):
  sound: realtek: Add pincfg for ASUS G513 HP jack
  sound: realtek: Add pincfg for ASUS G533Z HP jack
  sound: realtek: Add quirk for ASUS GA503R laptop

 sound/pci/hda/patch_realtek.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

-- 
2.37.3

