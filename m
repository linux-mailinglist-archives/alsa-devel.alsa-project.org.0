Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ECAD06FA186
	for <lists+alsa-devel@lfdr.de>; Mon,  8 May 2023 09:51:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4873912CD;
	Mon,  8 May 2023 09:50:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4873912CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683532283;
	bh=TRpYw2fpRa7fXhdrkLZoh1N8WJduEB3s6iHzOhUS0Y4=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=LDXJl/w9BMIHqPBrIUHg37HW1rjPadyP88TMRVw+5fSdXxQC+qpAovdsdDCG5R3cv
	 1Byftbz/PJ7UyRMy9+0y8v/lcBbVmL89mEm01gyYtn2w+Pg+w7UcS+S9ABXbuApFln
	 WuUR+mG1PTxNkmcWcVWS2owqyPbyBSkArn+pyv2w=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 81259F805F0;
	Mon,  8 May 2023 09:46:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 33B63F8032D; Sun,  7 May 2023 15:00:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 67620F80087
	for <alsa-devel@alsa-project.org>; Sun,  7 May 2023 15:00:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67620F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=UIzAEM0l
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-30786c6082dso751978f8f.2
        for <alsa-devel@alsa-project.org>;
 Sun, 07 May 2023 06:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683464423; x=1686056423;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B2ZLNCEsJLERCJy0gGs5VDu5LaJyymMxQIgFZdzx4Oc=;
        b=UIzAEM0lhWcg0LvT+iLaZZ9z95LJtB1QA58RomVZDdNArnmYi/vFYjhsnuIl2l/47E
         dPnm7ILOBtB3VN1pdoWZ4rC7VcywvLAP5Y1BiGzEo+SMfsiJmw8tnVk7pV2yvKYFDmGo
         bkxDM8icz53z02W8KqRpeI4Ge1f42/8L0UNhEL6KqNleKQ8ImWi2AAx2LJv0L63kSCB0
         xINqTuauYD7REnMO6SdhmJSJ8Uq+tsVRmmUzxijk/FnXpPYSQW2HtnYVfcJBYG5VRrcN
         nZ14K4PYvOttEHK3ZbDajenu+5s/MVsas/0Y2WACfDNZiOrAx4iiMafnpR4np5VhOOI9
         iKgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683464423; x=1686056423;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B2ZLNCEsJLERCJy0gGs5VDu5LaJyymMxQIgFZdzx4Oc=;
        b=DL/mrqW/zfM+cEGP4DIiYAdXCUrEN+GtnS4qxuwE72d3yqWHsUxbijsADtHQwJQLTf
         hek/Iqu9w77bA2iOGV16mIEBR6e71eJZw9PnZ/Jlh0CdRxCfe/fhBfBVikwlau6OdjUz
         rCxNJS1dS2OoR5/dS3u4VPa0etcOPvD2Alj0rlAAzN4xeSg67ZNNxcCrvBvWWk99rSou
         FrJUa9jV3HswPSrAtuesTZe7jOEtXHyN4T/YknVksuGGK9CjBCxqbCPc9O6QIYOPqhiv
         5c8lO540KSkhlczsKi5hHw0/pDLGYj9UcRUpOTBm9sVKuukyuYg1SwZ/SSKwCPJALv8S
         XSbQ==
X-Gm-Message-State: AC+VfDytOsFU4XF8KaMQoPLWG7hlkQaG4gaNmQ5mMVKiX8h9W/MwvR9P
	A3JvjK3iSsASVZgYOwmZOQc=
X-Google-Smtp-Source: 
 ACHHUZ7BQF8TmLtYLTVOhFy275Vi6INRdqa96cajN2Saxs9+TCMydxCmQl1KPVxKJSME5QtwGfso1w==
X-Received: by 2002:a5d:4146:0:b0:2cf:e747:b0d4 with SMTP id
 c6-20020a5d4146000000b002cfe747b0d4mr4859241wrq.40.1683464423299;
        Sun, 07 May 2023 06:00:23 -0700 (PDT)
Received: from jack.home ([92.58.200.160])
        by smtp.gmail.com with ESMTPSA id
 c17-20020adffb11000000b003075428aad5sm7907969wrr.29.2023.05.07.06.00.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 May 2023 06:00:23 -0700 (PDT)
From: jack1989s@gmail.com
To: perex@perex.cz,
	tiwai@suse.com
Subject: [PATCH] Sound:last.c: fix code syle trailing white space - modify
 printk()->netdev_dbg() - Possible unnecessary KERN_INFO removed
Date: Sun,  7 May 2023 15:00:21 +0200
Message-Id: <20230507130021.48112-1-jack1989s@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: jack1989s@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: QSKXT4UZRF3QQ72RJC4OITEEJJD6YORW
X-Message-ID-Hash: QSKXT4UZRF3QQ72RJC4OITEEJJD6YORW
X-Mailman-Approved-At: Mon, 08 May 2023 07:46:11 +0000
CC: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Federico Di Lembo <jack1989s@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QSKXT4UZRF3QQ72RJC4OITEEJJD6YORW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Federico Di Lembo <jack1989s@gmail.com>

Fixing coding style.

Signed-off-by: Federico Di Lembo <jack1989s@gmail.com>
---
 sound/last.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/last.c b/sound/last.c
index f0bb98780e70..b8cfd6ded95d 100644
--- a/sound/last.c
+++ b/sound/last.c
@@ -11,18 +11,18 @@ static int __init alsa_sound_last_init(void)
 {
 	struct snd_card *card;
 	int idx, ok = 0;
-	
-	printk(KERN_INFO "ALSA device list:\n");
+
+	netdev_dbg("ALSA device list:\n");
 	for (idx = 0; idx < SNDRV_CARDS; idx++) {
 		card = snd_card_ref(idx);
 		if (card) {
-			printk(KERN_INFO "  #%i: %s\n", idx, card->longname);
+			netdev_dbg("  #%i: %s\n", idx, card->longname);
 			snd_card_unref(card);
 			ok++;
 		}
 	}
 	if (ok == 0)
-		printk(KERN_INFO "  No soundcards found.\n");
+		netdev_dbg("  No soundcards found.\n");
 	return 0;
 }
 
-- 
2.34.1

