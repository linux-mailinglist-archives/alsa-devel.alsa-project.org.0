Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C453E859553
	for <lists+alsa-devel@lfdr.de>; Sun, 18 Feb 2024 08:51:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13961847;
	Sun, 18 Feb 2024 08:51:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13961847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708242712;
	bh=Fu3fdtS7oQgOWe/O3MBGdeO+WH/z2+AmZDVcBf+jPJw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AX64MPWuKs8sFp+plbxuKQJM4KDi4ANzoOrL1ifE/v3vnHhx6rvjlmEtolgldNAgZ
	 YkcOGCBIFWnTFY/DsdMNaNP4TAbbYYWiNiyX5+jBBIjTNc2HTuWwoa4E0T+cGCwWu3
	 LraGUFh5TVwE3TIfAvxg6BbgkPeW2Tf7CYVFJ4Hs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 91F25F805F1; Sun, 18 Feb 2024 08:50:30 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 89566F805F1;
	Sun, 18 Feb 2024 08:50:28 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8C86DF804B0; Sun, 18 Feb 2024 08:44:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A34D0F8047D
	for <alsa-devel@alsa-project.org>; Sun, 18 Feb 2024 08:41:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A34D0F8047D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.a=rsa-sha256 header.s=fm1 header.b=g0Uewg3H;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=KUXus+Sb
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 5A0C15C006E;
	Sun, 18 Feb 2024 02:41:36 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Sun, 18 Feb 2024 02:41:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1708242096; x=
	1708328496; bh=xfklvt63Cya7crTHMbBmSR2hu8vK8DoS/tjKNZFEIvM=; b=g
	0Uewg3HXcfZlH9ZwKSAAT1pzO8VOOFtaUZhWAs2LTgQ/y1arIqRMlWihK9uk12Fm
	0yoPw79Cr3juDccVaibeo8gf/AI9MRBcwDFIrqIjVYJTWxvtHWEHM9fHh64XY+VW
	WyV1xZ9bZHpqk4Z9DoOarGf6LjPPx5uoWPdueUvonco5feE0Z1NLn5lF6ESAIPCa
	jpdvG1tNKh97kC1WEhCaJ9W0thxYGYzDwNaawrPxJQoCuh8kr+gdYaDrDz8JhvuV
	hI7YdutvY1z3AaCpt8c6Fsv9DuPQLzaBH7HM0hCY2HW/SNLo5FVuQWOfQbTgkir3
	+7bkXkQfddXC0eLDe/MhA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1708242096; x=
	1708328496; bh=xfklvt63Cya7crTHMbBmSR2hu8vK8DoS/tjKNZFEIvM=; b=K
	UXus+SbLoj6qQzj5ePwzijntzNCUvJX+bgI591lhsyQWy9jqyamk0Q7UVTXEoEX1
	RHSRFT41n3u5Ot3Py9TfaEXTS2zI8YxM+iNDNw8K5pV0xaR0rHaj+U+6Ka9bAKc1
	WgqWJasjHuzEHVvTg08HXJ1ShCaRI+IXyM9Vw1/rKOTrp80TFTnnckTx2bD+Ea3R
	KVapqJ/EEfut9mp3DgdROacY1axeNQVsPCbKhSLHlMAfE9GK1OlPMMgyqfaIuC0X
	32uFWUU3xypxw3vxyA167VOIBZL5BQcje8beLz0KgqnIP0YB43TX0dPHo8JpkRZg
	xHbTPS5kSI/x+ewmj6LxA==
X-ME-Sender: <xms:sLTRZbas-q8dmdJbTFOhNZLsIVAPW-ZdhUXmQ4-EYnTTx_iJKtZyNQ>
    <xme:sLTRZaYppXgCUyCUbWcc-gL31mBEAm2oTCw0LuLhcfA-hxXsqsppjBdH7Z2_NAOEH
    Qd42BDmfN6XWhoD9oI>
X-ME-Received: 
 <xmr:sLTRZd83JhJTw4N-7Le1A4tA2GCxYXUsZ625oorVFxLF2Mt5iILSNUrLfvKmZKdxULX-TXLTbk8eGrR7bwsQEFErQecm_1Z7JhJMDTrNpQ5G>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvledrvdehgdduudefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghk
    rghshhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpedvjefgje
    euvdfguddukeelveetgfdtvefhtdfffeeigfevueetffeivdffkedvtdenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhise
    hsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:sLTRZRqQ7zjbp2fzpla1Xg8tHLmRu1ahkRaONizv9RIixKvyAX_nVA>
    <xmx:sLTRZWp7sxkxgUkvI-YYnFmMHQ0AcWRTZyGO3AmAb1IPhVYbKNS_eA>
    <xmx:sLTRZXRk62QK9z64aiMejUhSfkAcZgQqb1aTjPejmNNI3doRxjPiSQ>
    <xmx:sLTRZdTRKNAgXklU_ECR1bohhDtthHGiax9D6DsC5DGuYr0NFSy8qQ>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 18 Feb 2024 02:41:35 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Cc: alsa-devel@alsa-project.org
Subject: [PATCH 1/4] ALSA: oxfw: use const qualifier for immutable argument
Date: Sun, 18 Feb 2024 16:41:25 +0900
Message-Id: <20240218074128.95210-2-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240218074128.95210-1-o-takashi@sakamocchi.jp>
References: <20240218074128.95210-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: YGSFURXDZACTR7522TIOA5P2YSGEL4SM
X-Message-ID-Hash: YGSFURXDZACTR7522TIOA5P2YSGEL4SM
X-MailFrom: o-takashi@sakamocchi.jp
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YGSFURXDZACTR7522TIOA5P2YSGEL4SM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

In the helper function, the first argument is immutable, thus it is
preferable to use const qualifier.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/oxfw/oxfw-stream.c | 2 +-
 sound/firewire/oxfw/oxfw.h        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/firewire/oxfw/oxfw-stream.c b/sound/firewire/oxfw/oxfw-stream.c
index f4a702def397..6d8722f9d3a5 100644
--- a/sound/firewire/oxfw/oxfw-stream.c
+++ b/sound/firewire/oxfw/oxfw-stream.c
@@ -515,7 +515,7 @@ int snd_oxfw_stream_get_current_formation(struct snd_oxfw *oxfw,
  * in AV/C Stream Format Information Specification 1.1 (Apr 2005, 1394TA)
  * Also 'Clause 12 AM824 sequence adaption layers' in IEC 61883-6:2005
  */
-int snd_oxfw_stream_parse_format(u8 *format,
+int snd_oxfw_stream_parse_format(const u8 *format,
 				 struct snd_oxfw_stream_formation *formation)
 {
 	unsigned int i, e, channels, type;
diff --git a/sound/firewire/oxfw/oxfw.h b/sound/firewire/oxfw/oxfw.h
index d728e451a25c..39316aeafeaa 100644
--- a/sound/firewire/oxfw/oxfw.h
+++ b/sound/firewire/oxfw/oxfw.h
@@ -136,7 +136,7 @@ struct snd_oxfw_stream_formation {
 	unsigned int pcm;
 	unsigned int midi;
 };
-int snd_oxfw_stream_parse_format(u8 *format,
+int snd_oxfw_stream_parse_format(const u8 *format,
 				 struct snd_oxfw_stream_formation *formation);
 int snd_oxfw_stream_get_current_formation(struct snd_oxfw *oxfw,
 				enum avc_general_plug_dir dir,
-- 
2.40.1

