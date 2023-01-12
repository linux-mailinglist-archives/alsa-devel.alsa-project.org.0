Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 757F96671BC
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Jan 2023 13:11:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C3693FFA;
	Thu, 12 Jan 2023 13:11:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C3693FFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673525517;
	bh=To4lSe689bfimC1tf73m0as/vggIJfBEi8Jc8IhQo24=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=une1iuTgkcLbu3Kel6is9fM9WAhOxK0jkPijgjuCCD2HVzB3Hgt2tTnDP0vIuhzVQ
	 OLRX7y2PWuf1e7MzoCgh4tRRvvOJDwbP0o9ZtuuTZ14rTBDhZ3PD6rSEtb2YwQsf5y
	 4MyjqRgHZ9YwO9HlCDk0JwSJFPlhYQKMQ7Pccj+I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 56346F80543;
	Thu, 12 Jan 2023 13:10:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D7D3CF8013D; Thu, 12 Jan 2023 13:10:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 67D96F8013D
 for <alsa-devel@alsa-project.org>; Thu, 12 Jan 2023 13:10:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67D96F8013D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key, unprotected) header.d=sakamocchi.jp
 header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm3 header.b=N6nE1KQ1; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=ADcsZXKl
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 577413200926;
 Thu, 12 Jan 2023 07:10:00 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 12 Jan 2023 07:10:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1673525399; x=1673611799; bh=zUmch9t+Od
 dWRqZWCvewsHnaM99UXEj04SkfjwGm3pQ=; b=N6nE1KQ1Pjqqd784G2gCMcoktV
 jLfaHzhNTOjmCpz92N4O9XHYvoSRU6darMj7nKyZWIUwXsaFEEMHztunUFSsPcNz
 dExo99jK+4lHhHh3AYZwaga9NxcK/IBh1gSLnRqHloXyRGBDj5XRJSp1KdnijRcJ
 GfU8X7btck1rFtud9Dyr0VJBCmTUp3FPbEj3YG7PsiKNTN/44qh/dOm9NL+YPQHQ
 g1y94bS1OQXio6osVl6zCaC6Nq6wkpxV9+AfoRDNB5pecUOgDLTIDB+IjjAjXtK2
 C7AvspmMwP5N7IjFHlT0D4u4HRQVSSp5x88WaYvrEUhfD/ZymkGNQTnuX3Bg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1673525399; x=1673611799; bh=zUmch9t+OddWRqZWCvewsHnaM99UXEj04Sk
 fjwGm3pQ=; b=ADcsZXKlBwR262BH4p7Lfd/LQIEewA1IQbvJZfKNuaca267E2mu
 XyAg5ryqEXuVT7AppsEk7QyMiRpylOwGMed7a2HZqjvJ0+ITZ8mFT3zkJCmgURQe
 FGZ2382VLcou/7Dr5x7RyHNnUS2dDuvgb/Rq0k3aq8Br4GsX6G5I9816bLOu72Wt
 so9Qje1aJhkbfDQ8bhFBaVpTl4OWmDNrUJF8TFkmp239kftwgOhe31tv5z253dm5
 +mBR501uu0PZqNPdHD4gkv+Su7WGoGdp9kaZYoYMxD/iuYFHiR0acObe/YgItSaF
 c1DAcLBJUqMPNrMozb2jUvl0g546JAiig9w==
X-ME-Sender: <xms:l_i_Y8tVsBjf-ub6rynuksWZWIzm9edwP7VNdYtNP-GsImeRI8sYQA>
 <xme:l_i_Y5cFQ1mbAsrpTp1b7gMmlcSK2y6w_I6RpU9TInTFjtrehOFm-dWbnLU8SfRQw
 yFeiqZMOL7iaAbXocc>
X-ME-Received: <xmr:l_i_Y3xjI0mEIvcdSieyLtYpr0JDYnaGHqaI5Y4uuqwlPvahGA_pEiCQCmGgAwpKIBFPWbzGuvwyCO0ctQfr-ynre6uqv8VQZZSg1JXiqDqYUX0AAIpMBW4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrleeigdefiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgggfestdekredtre
 dttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhh
 ihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepkeevteefgeduhe
 ffudfgtedvuedvjeeviedvfeelgedvtdehtedvjefggedvtdeunecuffhomhgrihhnpehg
 ihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
 hlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:l_i_Y_MvpnL9gXQrKiWEPPouPGrboRp3FbdwRWzugw2J7Aoc9u6idQ>
 <xmx:l_i_Y8-AHkpSPyUULpdK9R1wddMnc1n3yS9_bgkzj0I8ZEQkh3ntAQ>
 <xmx:l_i_Y3VucbhTrJa148TlDHIUuFFI4mkTLTJxhk5VhpTfi2TcQbn4jQ>
 <xmx:l_i_Y6kmqvUgruEvHNt6SU925085d9ojJ80WvbZKkocsUinjBUV-Dw>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 Jan 2023 07:09:58 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 0/6] ALSA: fireface: support knob control event for Fireface
 400
Date: Thu, 12 Jan 2023 21:09:48 +0900
Message-Id: <20230112120954.500692-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, clemens@ladisch.de
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,

Fireface 400 uses asynchronous transaction mechanism to deliver event of
hardware knob control as well as received MIDI messages. Current
implementation doesn't distinguish them, thus all arrived messages are
processed for MIDI message.

This patchset adds the parser to distinguish them, and deliver knob
control event to user space via ALSA hwdep character device. The
implementation works well as long as I tested with the patches for
libhitaki library:

https://github.com/alsa-project/libhitaki/tree/topic/ff/400-msg

I note that Fireface 400 transmits no asynchronous transaction when it
is not configured by block write transaction to offset 0x000080100514,
which turn off HOST led from red.

Takashi Sakamoto (6):
  ALSA: fireface: rename callback functions
  ALSA: fireface: pick up time stamp for request subaction of asynchronous
    transaction
  ALSA: fireface: add helper function to parse MIDI messages transmitted by
    Fireface 400
  ALSA: fireface: update UAPI for data of knob control
  ALSA: fireface: add local framework to message parser
  ALSA: fireface: implement message parser for Fireface 400

 include/uapi/sound/firewire.h                |  24 +++
 sound/firewire/fireface/ff-hwdep.c           |  41 ++--
 sound/firewire/fireface/ff-protocol-former.c | 186 +++++++++++++++----
 sound/firewire/fireface/ff-protocol-latter.c |   6 +-
 sound/firewire/fireface/ff-transaction.c     |  17 +-
 sound/firewire/fireface/ff.c                 |  10 +
 sound/firewire/fireface/ff.h                 |   9 +-
 7 files changed, 239 insertions(+), 54 deletions(-)

-- 
2.37.2

