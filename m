Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 539933B155C
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Jun 2021 10:03:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1F85851;
	Wed, 23 Jun 2021 10:02:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1F85851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624435392;
	bh=3E5VmMcjtmzm+NBJFVyPRrDjm7jd1OhIPwQ5EkP0azc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BrYGHjcwO0TuE3koU9uyMwltoGr0Vyrm8QWBmR5o2lRgzzcbM9pa0zISRJJY/fDYE
	 1blyiE3UepCwKdwTHZYFOWhNzGYR2RBLO5X2AseS2bm8820ZA1JioXeNLeJHCsEa9Z
	 Yv3yiosNx5+3leVhqAqTXGdCQZAeo5gLMB7jiUOw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 573CEF804F2;
	Wed, 23 Jun 2021 10:00:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C940AF804E5; Wed, 23 Jun 2021 10:00:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 640B6F801DB
 for <alsa-devel@alsa-project.org>; Wed, 23 Jun 2021 09:59:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 640B6F801DB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="Cv9ZbCe+"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="w2C6+2rb"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 1CED110C5;
 Wed, 23 Jun 2021 03:59:54 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 23 Jun 2021 03:59:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=QddMEkT+Cm/s/
 APAugD3MPE0QMSr32/aWaEb3lrl6hc=; b=Cv9ZbCe+Fm480BkmgqAqec/PURWAa
 xWu2nqSq+ZvJK4B9yhPCv6MdrXUy3IXbfsZnQbgyWQWKT3nxekNbpxsN2O0eeN5a
 xFdZ1IRTSiISqBVg2Ih+x0r0+CnXq//wlv0QUie8Ytone/K7gf9qWStqnOv1DPz4
 HguKpUMhTTRsRNxp0lc1ieLuP/oS27A2HoLffjg67zsn4cvQgjAaNdssuJ+QDjBT
 X2RyOUWIPDnG3SxfCfgNsu7UNZrtrs99jsonUdYeAj21pcLqEaBfl2XNBnWkXieG
 /BERTs+DSHlmRJTzTvj4Dk435Cb9Mnf4tCufcFAQKM2M55Joa1skF0Qgg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=QddMEkT+Cm/s/APAugD3MPE0QMSr32/aWaEb3lrl6hc=; b=w2C6+2rb
 kMkPh1hiCvqS/w2tc0MKnp2Uo4Ygpsn51YpoMt4R5rk1rPs+/noBZOoVLfFvhIWP
 KRn+ADCxxIV2rlJSS7//K1W9M3+EGqF4wTHfMN8Pk9pSLvYE3YoqGqUCgcNc93HH
 tLI8hSAwKRiZ6As5cAv7jBrBJCX7IYZRSfCshYR2SI9/laHCH01jpAnrr007glPi
 c2U2lzANa6NouS8s7S+PRrLC6aJHeTP4cpnA+6sz1ea1jdOnUKRezc75/0gNn0ny
 MOPS4jJOgLOBEuMSMEdn3Nomm2rOHIx5+FZSQpeL0yU2xd6i7MbWdcecOOfxAw2f
 t040Bw8cBEmeqg==
X-ME-Sender: <xms:-enSYB4iRbkXtSHOvNwH0sffrIPXR1-LkDlRSAmJxwnhFjZUqPH-NQ>
 <xme:-enSYO6WtL7wS0OKb3HtrTX_k6LFBr-_8xqZpQKGmadYunZAuCaluM77lOnMeQpkA
 fhIFv4cdI9qoTP82ew>
X-ME-Received: <xmr:-enSYIdvRvGhzuIfNYH0kZmiiAEanZr5HDhdqZAtftuBpm4UY7__-X3Y3UJVcCuokrecKkxOu3XARF0s1nsVwvNU6bftg-M_qgyMQdRC9QZiD5BekNej>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeegvddguddukecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghk
 rghshhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeevfefffe
 ektefgveegfeelheffhfeujedtjeevtefhkeevkedtjeejvddtjefhjeenucevlhhushht
 vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhise
 hsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:-enSYKIyiCo05p9kQiY9Tfch426UpfPrgZeNKzQMRG2EJQDZXHWxjA>
 <xmx:-enSYFLfFt99U3hWipTciW9M3ym7LcMRj-ptExAaaCbfiEAv3D4HTA>
 <xmx:-enSYDxe3wVA5sY6yUXRDAkEkMiA1-rPkvAKzJz9NX3Vfb8vx0z5mg>
 <xmx:-enSYDgwwh0FvK3hyheOMcOfQeXs_SEvba9nGZrhNl95_Pvst_RyUw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Jun 2021 03:59:52 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 3/9] ALSA: firewire-motu: add support for AES/EBU clock source
 in v2 protocol
Date: Wed, 23 Jun 2021 16:59:35 +0900
Message-Id: <20210623075941.72562-4-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210623075941.72562-1-o-takashi@sakamocchi.jp>
References: <20210623075941.72562-1-o-takashi@sakamocchi.jp>
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

Although MOTU Traveler supports AES/EBU source for sampling clock,
current implementation of driver doesn't code it.

This commit adds support for AES/EBU source in protocol version 2.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/motu/motu-protocol-v2.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/firewire/motu/motu-protocol-v2.c b/sound/firewire/motu/motu-protocol-v2.c
index 7b69a8ef6b3d..7893cc73e983 100644
--- a/sound/firewire/motu/motu-protocol-v2.c
+++ b/sound/firewire/motu/motu-protocol-v2.c
@@ -121,6 +121,9 @@ static int get_clock_source(struct snd_motu *motu, u32 data,
 	case 5:
 		*src = SND_MOTU_CLOCK_SOURCE_ADAT_ON_DSUB;
 		break;
+	case 7:
+		*src = SND_MOTU_CLOCK_SOURCE_AESEBU_ON_XLR;
+		break;
 	default:
 		*src = SND_MOTU_CLOCK_SOURCE_UNKNOWN;
 		break;
-- 
2.30.2

