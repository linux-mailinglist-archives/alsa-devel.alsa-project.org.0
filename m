Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BF946F39
	for <lists+alsa-devel@lfdr.de>; Sat, 15 Jun 2019 11:13:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 02043186D;
	Sat, 15 Jun 2019 11:12:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 02043186D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560590026;
	bh=rC25sr0OMHz646kCmsViqwgSwcgXVB0hIpemaXf7K/E=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=g0U8I9Vjwa53I4bAA/yvgnhO0YQorUrsO/tvzZtySOxo/J9k7HqBzE2HFRtmFb7UQ
	 TYD2m1xp2Mkv9krVY8QPnruWtGSsmcsVE7hBVOqsbe2c79t9W84TmkxXrz4Rb3wcSv
	 O3j8/XiidAzWKshEFYFfCnXSR1j7YohOcgJCPv7U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AEC69F89730;
	Sat, 15 Jun 2019 11:11:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ECE79F8970F; Sat, 15 Jun 2019 11:11:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8F8A9F896F1
 for <alsa-devel@alsa-project.org>; Sat, 15 Jun 2019 11:11:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F8A9F896F1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="B0VF0nz8"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="CQuI9A6p"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 57A3947E;
 Sat, 15 Jun 2019 05:11:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sat, 15 Jun 2019 05:11:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=GQXslgv1eub7gS7N8SdNPn8Ye0
 PRfLhb5MisNFPe3d8=; b=B0VF0nz8Cc3XERsDgNSvLuklg1IseyIbEoupkMWUzh
 BaK4aszr6TY2n4AiZpvZDHfDreLuhr+Iy+OOJlsuDJfl/eWGpyq2l+TeTnEKOrJD
 qbjsnZtxsvqIEnMIElZjBGge8JN4qp/S4bbhTwmjena5CYU7sHlXo1jKW7vhbyG5
 6IUiRlJJDiprnA1rakqcIIfOkySgtUR+eogS2I81sB2043D9cr3wgMzvcklJ7lDp
 aIdOggDT+iDeiM4lpR7/kkOsg10SbKf+BymLDAl6aFZMsmGgtaAK8AlTuZ/mRkkD
 ROHMOIyAz8oKfxSDllbEM7lZktMYhO65jD16R5Pf2a5A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=GQXslgv1eub7gS7N8
 SdNPn8Ye0PRfLhb5MisNFPe3d8=; b=CQuI9A6pBf9WOvj8cmKP1mKdv5tQ8dAl8
 IGdJ0nYKGraCoh2GhRc/ctOTsC++A2TiTS8aFC/5VA4FICC0F02k0WagHT49Wp0Q
 vb1QCHvVyTAfamybaMe8u8TnYZRrN5gsSjugTmzAu7Kw/NHhZlo3jEAi+8FhnLwi
 OkjzoI7V+60wBNFuNQ7MUMzr0wx82daEsNJ68jQfJk65zeTP/JN9u/UtNZm40Qwb
 62bj0cpnlubRgIAI/2WnRRJ5aj8rVBCr3cNa8gZbghQ52ItErIDplmLhZZZf46f9
 2n3f5PFml71qiFQSIdEUhu3nqP9GIwzfuTuZ+5X61w5oRWtWLIt/w==
X-ME-Sender: <xms:LLYEXWKOZqaGg6HKbxVHq6l_t26yQVDRhKnyCEfjsnJ_Nvoq6AbOKQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudeifedguddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhh
 ihesshgrkhgrmhhotggthhhirdhjpheqnecuffhomhgrihhnpegrlhhsrgdqphhrohhjvg
 gtthdrohhrghenucfkphepudegrdefrdejhedrudekudenucfrrghrrghmpehmrghilhhf
 rhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjphenucevlhhushhtvg
 hrufhiiigvpedt
X-ME-Proxy: <xmx:LLYEXUM7qYDc0jSZNeHfUqRuVsAf8K1pYVuYhpOwmwhkjAWakklBow>
 <xmx:LLYEXZ_OmQ899C5Gc7mttlHnciOyZfLf5p5t-GqqyTgzHjrNUvEYQQ>
 <xmx:LLYEXThrWmAj1yiQnuHksjy-8p36AURrx1fhwg_5xfIEBiP9l5qFiw>
 <xmx:LLYEXfZSdKYfZvF0taTxyxr1e0I0FuP1KyaDYdDH5F7VlZmCTuVqeg>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id AB6F88005C;
 Sat, 15 Jun 2019 05:11:05 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Sat, 15 Jun 2019 18:10:55 +0900
Message-Id: <20190615091101.7515-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 0/6] ALSA: firewire-lib: split allocation of
	isochronous resources from establishment of connection
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,

This patchset is a part of patches to reserve/release isochronous
resources in pcm.hw_params/hw_free callbacks, like posted patchsets
below:
https://mailman.alsa-project.org/pipermail/alsa-devel/2019-June/150118.html
https://mailman.alsa-project.org/pipermail/alsa-devel/2019-June/150863.html

In IEC 61883-1/6, CMP is depicted with operations of isochronous
resources. The ALSA firewire-lib module implements some kernel API
for CMP according to it. However, once the isochronous resources
are allocated, several packet streaming can run consecutively.
Deallocation of isochronous resources for each of packet streaming
is not needless.

In this patchset, allocation of isochronous resources is split from
establishment of connection so that CMP runs with allocated isochronous
resources.

Takashi Sakamoto (6):
  ALSA: bebob: code rafactoring for callback functions to PCM interface
  ALSA: bebob: code refactoring for callback function to rawmidi
    interface
  ALSA: bebob: change the range of critical section for stream data in
    PCM.hw_free callback
  ALSA: bebob: code refactoring for error path to start duplex stream
  ALSA: fireworks: change the range of critical section for stream data
    in PCM.hw_free callback
  ALSA: firewire-lib: split allocation of isochronous resources from
    establishment of connection

 sound/firewire/bebob/bebob_midi.c           | 47 ++-----------
 sound/firewire/bebob/bebob_pcm.c            | 62 +++--------------
 sound/firewire/bebob/bebob_stream.c         | 32 ++++++---
 sound/firewire/cmp.c                        | 74 ++++++++++++---------
 sound/firewire/cmp.h                        |  7 +-
 sound/firewire/fireworks/fireworks_pcm.c    |  9 +--
 sound/firewire/fireworks/fireworks_stream.c | 22 ++++--
 sound/firewire/oxfw/oxfw-stream.c           | 18 +++--
 8 files changed, 122 insertions(+), 149 deletions(-)

-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
