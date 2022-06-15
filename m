Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE3954C84A
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Jun 2022 14:17:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B765B192C;
	Wed, 15 Jun 2022 14:16:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B765B192C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655295426;
	bh=XX+Aa+fT1RjwyoHoUXPHFjHKmen0LBK6YIBMddLOd4s=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ROT1MwWXJ4keXHgyz4kbfoCvEL7JbZKnwcFbHGo6Od3E3YYbqTyyGpEgrLGB1+l+H
	 uRQT2Ia74jUhi60dChoWoodQQvo4AeARBFukrDp0ewMh2V2OUcsYQU7jprm8XMrjb1
	 g8RC4bVqGWxuheSkcZV72E4ed31TCEYqo2LzU29E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2372AF80529;
	Wed, 15 Jun 2022 14:15:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9EE80F801F7; Wed, 15 Jun 2022 14:15:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 68D19F800B9
 for <alsa-devel@alsa-project.org>; Wed, 15 Jun 2022 14:15:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68D19F800B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="pOgL8x/L"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="PVvL8wis"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id A0E5D320094C;
 Wed, 15 Jun 2022 08:15:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 15 Jun 2022 08:15:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1655295316; x=
 1655381716; bh=MtKBc2bhfjgMYC9HTZUX2V0/dMYlGGjy+AYAPIY7ZaY=; b=p
 OgL8x/LCbQn1ZNkAoeJT4yLKckCmZt8L9inva/gKLl6CpoP9eEI22A/mBzZX9jnm
 wqyNxQVfZtkidxjFf8VlyecFpGPQ09/gslVQ5d70YOwlFecNNKsLrTqLySQIjwhL
 aSx7iJ2RcepelsJ6cf+ZX5C6uHPLVViDbMUCDlGZy1fYbElhRJWB3vIiGHUjzU/c
 u92UHw8GtvDbS1QFCC8N/ZV5p71LYSX0EMla5a3am/2HjWFlp2BnbaseFbsN1Tqv
 6HFt8YnkA54eCI8cLcnghCsLv6D6EGIZyFTLFC+PSum3ZQkQge3ndIeLeMZuJZJx
 ZEzDhF4eVqN01DYLFN3Xw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655295316; x=1655381716; bh=MtKBc2bhfjgMY
 C9HTZUX2V0/dMYlGGjy+AYAPIY7ZaY=; b=PVvL8wis2OyJPIAnu6qZutU3QqpUW
 RtyTWLXpnh6h7PzT0oEq45F+GGr3AMHs0YPPblpfJuxT1o4o33wMMrI7iF7YqmOn
 huXzEkzdumAHvu34ciSbfvcnwqwwEvMBfXFPB2dVbSde0i+OdxP50ctK3/LlhG2R
 XLTk6qh85FV+sQ4cGUSfu/DjZpP28hXLrw40c8daTnhHXGKovUakyrVJlyidGfQA
 mQZeuiKt7CRdkT3M1IHPnZusupUxYy+841Pd/Tw3+kjOOJ05z4Fmrwv4QCtIil1e
 NWwWh7Js6UJoA5rIh+Sm7fywjqmiI3JhngJQTyUrMPY7bmIC4fG9FFyyg==
X-ME-Sender: <xms:U82pYuz_TJtOmm6mspO7Xm37siDuNEseBoT97cMLhRtQyPMLyobooQ>
 <xme:U82pYqQbPSsGwQEWF6luJTCwJ_bwvVchVBDq0Xt0xljdx7glXI13PIx9eOxiNa6DM
 tgUwppIWiIyRFI-fb0>
X-ME-Received: <xmr:U82pYgV1avoX-ZvtRJOj0yhMYXgBtrSo_pJcKGY0O2ZINljwUz23LDEXc4-EjcfkMKdS1I40zkvprv65LfZlc_UzAxL-ec0WvT2Grbruf-f9w4GAwng>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddvuddggeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepvfgrkhgr
 shhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhird
 hjpheqnecuggftrfgrthhtvghrnhepvdejgfejuedvgfduudekleevtefgtdevhfdtffef
 iefgveeuteffiedvffekvddtnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpe
 hmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:U82pYki99b-h3W2WehOkNvDXxU_tTsUvrBcHd_NzwB_10xDXbirXmQ>
 <xmx:U82pYgAMVK7EWE97mXawaesmtXBCGs1d1Z571tmA7RKa61HeMAkbSg>
 <xmx:U82pYlK4d00e_xrLu9F84qa6zu_TwrZGcHkdi8R8TG0ejpOHCFqdnQ>
 <xmx:VM2pYjMWbM-m2btWT4YcTBJ9B1SeBFl7ZRhihAKJcg4mvyNMrL6QOw>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Jun 2022 08:15:14 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de,
	stefanr@s5r6.in-berlin.de
Subject: [PATCH v2 2/3] firewire: use struct_size over open coded arithmetic
Date: Wed, 15 Jun 2022 21:15:04 +0900
Message-Id: <20220615121505.61412-3-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220615121505.61412-1-o-takashi@sakamocchi.jp>
References: <20220615121505.61412-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux1394-devel@lists.sourceforge.net,
 "Minghao Chi \(CGEL ZTE\)" <chi.minghao@zte.com.cn>
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

From: "Minghao Chi (CGEL ZTE)" <chi.minghao@zte.com.cn>

Replace zero-length array with flexible-array member and make use
of the struct_size() helper in kmalloc(). For example:

struct fw_request {
    ...
    u32 data[];
}

Make use of the struct_size() helper instead of an open-coded version
in order to avoid any potential type mistakes.

(Revised by Takashi Sakamoto to fix the value of third argument.)

Signed-off-by: Minghao Chi (CGEL ZTE) <chi.minghao@zte.com.cn>
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/core-transaction.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/firewire/core-transaction.c b/drivers/firewire/core-transaction.c
index af498d767702..4604a9d97fd1 100644
--- a/drivers/firewire/core-transaction.c
+++ b/drivers/firewire/core-transaction.c
@@ -779,7 +779,8 @@ static struct fw_request *allocate_request(struct fw_card *card,
 		return NULL;
 	}
 
-	request = kmalloc(sizeof(*request) + length, GFP_ATOMIC);
+	request = kmalloc(struct_size(request, data, length / sizeof(request->data[0])),
+			  GFP_ATOMIC);
 	if (request == NULL)
 		return NULL;
 
-- 
2.34.1

