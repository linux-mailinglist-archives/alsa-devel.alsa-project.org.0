Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6AB63D647
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Nov 2022 14:07:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3063116ED;
	Wed, 30 Nov 2022 14:06:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3063116ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669813639;
	bh=Fr7F1yWPu50avQ0tllDAUfE+IuKtIzFJnuMjcCoKpIU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HN34uz91HS5wsc6b0cajW2IVcrO24e95V0C1nqMFYb2d8QeEWqJ2YrIqol4DM7PEE
	 H1cxn+/6scsAuM/qKmp1efpb/3Rp1ucWkvj9cw4PeRSxYC13N3UzeO9VbuJLhiI2tv
	 TQRUpSUA+hZhoDiDoBWVm0WxZAlbMQnz8zCsRNl4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 96E25F803DD;
	Wed, 30 Nov 2022 14:06:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C00D9F8023A; Wed, 30 Nov 2022 14:06:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, RCVD_IN_ZEN_BLOCKED_OPENDNS, SPF_HELO_NONE, T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 494B4F80118
 for <alsa-devel@alsa-project.org>; Wed, 30 Nov 2022 14:06:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 494B4F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="k++w+PQK"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="Nl5EY1Wh"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 0AAD15C00C7;
 Wed, 30 Nov 2022 08:06:10 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 30 Nov 2022 08:06:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1669813570; x=1669899970; bh=n03KMEO/9c
 voahW97c3DR62dVdR1Q9sWEupAej+/YVg=; b=k++w+PQKrX8BdFqoW3W2G5FoFG
 qxBzT0hxPE56ua4Et/4/kY4ZsMELTrFhzWUFw9XiLCxDbzt5VIn5QsjNnAqfpZH6
 wAwuKWpcL1y2PVqG7gECpgMJAzoSlvkfi6M1uF7udxuIq6L0Recfg6I/ZxjjfAhi
 0L8+v0sN/KWJ7P0fjopNSqa/dgNTCqf6Og+WGnL9FwCwkuw0JcJFt8TXcYh62HXg
 RKZ9JmpKr7RgJ/gqBgAmZ7bZZWrgfTX4HENhdKl1TgAG35gypz4GfZRdoBOzgE48
 t6GTvk2VKagS05t9IxHiOPrQbRDMHXvqFZF6XRV7N0/t/HrtpOfUGSVxouNQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1669813570; x=1669899970; bh=n03KMEO/9cvoahW97c3DR62dVdR1Q9sWEup
 Aej+/YVg=; b=Nl5EY1Wh3Kqa0SiWfYTWBgjLcSUv5ULU0VdZ0Ptzzx4N/w/b9Ku
 d0pwadUGAYNSRYJUuVwcCD38aUznOfUVKjRnegevH1LsZZB5XEKIrl7jJfENG3kv
 ojYMS6r7dIvWFVcIV7/fN7hJquALi/Cqi08MRnOsbXVpiLlvbTX7FtobuGh38Xjf
 BnUdfWldmTaQF9X3PCRvw5gGnu3K/WTA0I3bxuzvMWkowl86Ze0RBJXsaFalIql9
 dud5a6UIAQW+TpKUcc+HttchqzHiFqWe9SZrmfxBgMPWUDTY3Tb7TSrKzPBAIqZi
 lobVsOfQxE0u/ukvbv9zbtY/BL0hpvLy0vg==
X-ME-Sender: <xms:QVWHYxyYz_xmXTNlPlrq98pRwb5kyhuoPncRZMaE4mta4XQIMCYbGg>
 <xme:QVWHYxQI0_BXxuqzVwBItGos1pB5NqOiknGYDV3xrLtTnvMggI2qxZDOY7DanEfN3
 QMhPybT9jXiHyKKf1k>
X-ME-Received: <xmr:QVWHY7XA7OTUEeuwHyaIG4IXkY96tJmQGAMoc3LQOERDh-rYFcYIITiU8SxtGdMl60gpoTZna6yU9e4ourjlFUn2XFQx4FVJQaJfsxPP_GuK0p9yQj-PpmA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrtdefgdeghecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgggfestdekredtre
 dttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhh
 ihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepffdvueelffevke
 duhfetjeduffeghfettdfguedtgfdvgfeufeduheevheevkeeknecuvehluhhsthgvrhfu
 ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkh
 grmhhotggthhhirdhjph
X-ME-Proxy: <xmx:QVWHYzgXsA_ATLH2IS0uOIZaU25mkL9x6t1lv73-I1m2EwZR9xb8pQ>
 <xmx:QVWHYzD3uRYZOA66iFM_ccbjcQpVYgSkThmNjScPyuyb5Z_Z2A96VQ>
 <xmx:QVWHY8L7acKhp9srItPD9lfiqacTraHrPsq2kbUfIiMg2vukrHFu3w>
 <xmx:QlWHY2O6OrXW9td8uz-ioO5utG7YJE9NKxE927HK376QHJU1yjWoPg>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 30 Nov 2022 08:06:08 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH] ALSA: dice: fix regression for Lexicon I-ONIX FW810S
Date: Wed, 30 Nov 2022 22:06:04 +0900
Message-Id: <20221130130604.29774-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, clemens@ladisch.de, stable@vger.kernel.org
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

For Lexicon I-ONIX FW810S, the call of ioctl(2) with
SNDRV_PCM_IOCTL_HW_PARAMS can returns -ETIMEDOUT. This is a regression due
to the commit 41319eb56e19 ("ALSA: dice: wait just for
NOTIFY_CLOCK_ACCEPTED after GLOBAL_CLOCK_SELECT operation"). The device
does not emit NOTIFY_CLOCK_ACCEPTED notification when accepting
GLOBAL_CLOCK_SELECT operation with the same parameters as current ones.

This commit fixes the regression. When receiving no notification, return
-ETIMEDOUT as long as operating for any change.

Fixes: 41319eb56e19 ("ALSA: dice: wait just for NOTIFY_CLOCK_ACCEPTED after GLOBAL_CLOCK_SELECT operation")
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/dice/dice-stream.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/sound/firewire/dice/dice-stream.c b/sound/firewire/dice/dice-stream.c
index f99e00083141..4c677c8546c7 100644
--- a/sound/firewire/dice/dice-stream.c
+++ b/sound/firewire/dice/dice-stream.c
@@ -59,7 +59,7 @@ int snd_dice_stream_get_rate_mode(struct snd_dice *dice, unsigned int rate,
 
 static int select_clock(struct snd_dice *dice, unsigned int rate)
 {
-	__be32 reg;
+	__be32 reg, new;
 	u32 data;
 	int i;
 	int err;
@@ -83,15 +83,17 @@ static int select_clock(struct snd_dice *dice, unsigned int rate)
 	if (completion_done(&dice->clock_accepted))
 		reinit_completion(&dice->clock_accepted);
 
-	reg = cpu_to_be32(data);
+	new = cpu_to_be32(data);
 	err = snd_dice_transaction_write_global(dice, GLOBAL_CLOCK_SELECT,
-						&reg, sizeof(reg));
+						&new, sizeof(new));
 	if (err < 0)
 		return err;
 
 	if (wait_for_completion_timeout(&dice->clock_accepted,
-			msecs_to_jiffies(NOTIFICATION_TIMEOUT_MS)) == 0)
-		return -ETIMEDOUT;
+			msecs_to_jiffies(NOTIFICATION_TIMEOUT_MS)) == 0) {
+		if (reg != new)
+			return -ETIMEDOUT;
+	}
 
 	return 0;
 }
-- 
2.37.2

