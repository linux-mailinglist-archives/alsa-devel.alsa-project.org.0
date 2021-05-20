Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 20AFA389C4A
	for <lists+alsa-devel@lfdr.de>; Thu, 20 May 2021 06:04:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 551DD1688;
	Thu, 20 May 2021 06:03:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 551DD1688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621483441;
	bh=5uxaYiQOAOsRCV3AempwLNRSR8PZ5ZoIxnXOeP0RhW4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bCHLmb+2A/zFfp6ZccS1YzadJGnXxFlaqCRv10MgaV8GHP6DcbpwDwYV1DFU5Jcc+
	 2tDLcqJ1shIENR1jsAve3feMsdAxw3YX4kNYL6KWhyu5Fs1d9WuLLLqVouY67EB+66
	 CyS9LiGiq4YpQTyKQBERtaHk++WEmxcbw/FgNnPE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 730A4F80217;
	Thu, 20 May 2021 06:02:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6924F80424; Thu, 20 May 2021 06:02:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A15EFF8020B
 for <alsa-devel@alsa-project.org>; Thu, 20 May 2021 06:02:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A15EFF8020B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="bqmBIt+Y"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="Gr6kp9cs"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 1D5865C00FD;
 Thu, 20 May 2021 00:01:59 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 20 May 2021 00:01:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=pIl2+xYcdzgOq5fH1tZYq3rOzl
 Dh1w2ncwUKn0rGKrM=; b=bqmBIt+Y849VskEdTZ7yLmxf8EsVypofI2OJttzFpk
 Vwj1aL7vaDmFp9lFRLpFIP7/b/28iKbrfpG9Hlu1HzVfcXx5WrhOmOXtr8ThLk3x
 MHkduLuaRlBaZ8cZg9a12C8H77MhyZTrAL9IKortfI0/AfpLLcFwNuGh/ABU//kk
 wMCcCsMJxC1Qh1otC35lRmN3cyOxKVY5vL9t+VSo/6gonLaYensE619vEH4mcslL
 wJMVrkJLzSq0sd8IPEA+sMQNk1cixet8Wqct/v6eMVnBB1X6KQ22LA0l0VVLPbDx
 8B5+/50QHk/THFLSDnKvkXdL6DMvIulfKcTAE1VpGc5Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=pIl2+xYcdzgOq5fH1
 tZYq3rOzlDh1w2ncwUKn0rGKrM=; b=Gr6kp9csdcpQQd/lBAcAaN5YaHV3kI7zP
 vpWfqYnn055kAtNvalBjcMY0pT0AUKSJ8DB65q+40obr/JvaUq+0DQyvUTMnz66Z
 H6uuzSfiwBAySqT20QIjnztYqKzaFs748QogcjCfECjvnuQg7s22CLekkJlk3EnF
 nvzkJo0S0VkYVqPkLONZjmgxGvxpGpHDWupv9DcvHsJOlaS/Oz2GHELQiKnOO8j2
 +i1U0ZluqdnNmHK0I2gR00WZ8U0aswPtXsBFklDKB7Lz4kUUfgccBj0gHXz/4tJz
 3TKtWva73HuyeTyM0iQcN6RfIXsZ5IRgy4EyPK9nUP20jrcGhROeA==
X-ME-Sender: <xms:Nt-lYC3cfLmjvDbYCLxsxw81lEcrgGeNQl1Z5t_8RFdFZMkzPzwbcg>
 <xme:Nt-lYFFJbG8mYGjTD6KRzw0h18bsnxZWnAetG8NGKOJOk5RYcrZEtoWy3yeLWPYnk
 xssQj5boNtiA_BOPck>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdejtddgjeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhh
 ihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepudejteelhfdttd
 ekgfdtueeilefhgfetjeejheekgeevuddvveegieehueeukeejnecukfhppedugedrfedr
 ieehrddujeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
 homhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:Nt-lYK5VBodYHOO8yEBgDxOOfnSquhZ7mur6m2jNtwKmNNbM_JKH1Q>
 <xmx:Nt-lYD07-FNb5o8JncLSAsVKcTsiJoaPPo6s4NnjcbtfxbgmRLrbzA>
 <xmx:Nt-lYFHLaYSx3QpFug_Ka6Wh88WaIugt4l7sJ8yj08m77wK_HH4nwg>
 <xmx:N9-lYIM6e_NuVSfNWWdLg2cI5AUVVMD_CU_ABUJZm9sBBWbf0c_-Bg>
Received: from workstation.flets-east.jp (ae065175.dynamic.ppp.asahi-net.or.jp
 [14.3.65.175]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Thu, 20 May 2021 00:01:57 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 0/8] ALSA: firewire-lib: start processing content of packet at
 the same cycle in several contexts for each direction
Date: Thu, 20 May 2021 13:01:46 +0900
Message-Id: <20210520040154.80450-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.27.0
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

Hi,

Within devices supported by drivers in ALSA firewire stack, only DICE
ASICs support several pair of isochronous packet streams. As long as I
experienced, the ASIC requires drivers to transfer packets at the same
isochronous cycle. Unless, it generates no sound.

Additionally, in future integration I have a plan to take drivers
performing sequence replay for media clock recovery. It's convenient
to manage the cycle to start processing content of packet in several
IR contexts.

This patchset is to start processing content of packet at the same cycle
in several contexts for each direction, including code refactoring.


Takashi Sakamoto (8):
  ALSA: firewire-lib: code refactoring for size of CIP header
  ALSA: firewire-lib: code refactoring for calculation of context
    payload
  ALSA: firewire-lib: code refactoring for selection of IT context
    header length
  ALSA: firewire-lib: start processing content of packet at the same
    cycle in several IR contexts
  ALSA: firewire-lib: skip initial packets instead of scheduling IR
    context
  ALSA: firewire-lib: code refactoring to start several IT/IR contexts
  ALSA: firewire-lib: start processing content of packet at the same
    cycle in several IT contexts
  ALSA: firewire-lib: change waking up timing to process packets

 sound/firewire/amdtp-stream.c               | 492 ++++++++++++++------
 sound/firewire/amdtp-stream.h               |  53 ++-
 sound/firewire/bebob/bebob_stream.c         |  29 +-
 sound/firewire/dice/dice-stream.c           |  15 +-
 sound/firewire/digi00x/digi00x-stream.c     |   7 +-
 sound/firewire/fireface/ff-stream.c         |   7 +-
 sound/firewire/fireworks/fireworks_stream.c |   8 +-
 sound/firewire/motu/amdtp-motu.c            |   9 +-
 sound/firewire/motu/motu-stream.c           |   7 +-
 sound/firewire/oxfw/oxfw-stream.c           |  14 +-
 sound/firewire/tascam/tascam-stream.c       |   7 +-
 11 files changed, 401 insertions(+), 247 deletions(-)

-- 
2.27.0

