Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 981443A3F33
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Jun 2021 11:39:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB8C2190D;
	Fri, 11 Jun 2021 11:38:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB8C2190D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623404355;
	bh=3ALWn7P3Z1dvFrBm4uHJdqRIuLujnQqkjmlVvb3cZZk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LKXVJeZtWrK3IEka9WQNImgDBQuQorZBQAQpJFZS1wMg5JV4jCohUJczRUMRmUuJK
	 FGmE9BTeLLhlwZE9agylPWkgcYR9yDtMcvuVljl9zUbUIGutvAmXQQs0QMfrz8V/jJ
	 mYLH76Pe134N/GCNtQDEu6IJq//O0WCMkk7XK/qE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63231F8032B;
	Fri, 11 Jun 2021 11:37:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 22765F802A0; Fri, 11 Jun 2021 11:37:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 124B0F80149
 for <alsa-devel@alsa-project.org>; Fri, 11 Jun 2021 11:37:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 124B0F80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="3zRiRti6"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="jUY00AE6"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 528D31AF4;
 Fri, 11 Jun 2021 05:37:35 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 11 Jun 2021 05:37:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=DLkPD33ep/X/wxfHu3FRiM/cFg
 ippOLS6QQhYzo3w84=; b=3zRiRti6V0HxJvkCGxy23bVby64hWpfCPT6neUq/qM
 61/wQO3g8hmh78yY8twIHwRie8WdmektxhQHYQrYkARtyLdT6e0DNR36abi3xpyY
 YZsfsfxsloFaJCmdO6cmQx8PnM5fujeKW2VUySCWZc19rRElvasnKmyiL1OAMZx9
 uOIHznVdDEyjw5xzQUWNehxtyy8f38dgBYwIszue4j9U0jUT24Elmh8fYz2ZKbuP
 Ulo9ooME6YXwY7Ft9Lpi6t+uLOFhf12EHh3EEydkEKzvvelGalHWGdqlky4ixPKD
 jKU8uCCwjkFQZKGIhRVA7Rfgki+V82oV+6Ls5yzuk7jQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=DLkPD33ep/X/wxfHu
 3FRiM/cFgippOLS6QQhYzo3w84=; b=jUY00AE6VpBvk2UTB5zRfTGC2RU55hX7A
 m4ObirT3LQ58M5nVDgu/eyujovPYRtST+imnW3wTDXVSCnN/yiDlM+Na/c/C+9Xm
 aJ2/bCtK56EEM9xKAw2+vk/Umn9jng6W9KVYPYY5qXOhDbs232fphaHVjaibeSyA
 dyYLHeomB/nnr0ONZRbMVGYO//GdD9rL7gk3P3MIAxNf+r1vaWPcIIR650A/voaX
 7NiXujbZK+1/fhPXNr4K2zAykCvEO1dvLWVyVoV41+J/vx7BmezRIXnGezl2sB0v
 GbjghonOceQNQNa4nsjlxiL0FiJvkd13OaSK69zCGzJr6k+Ne6GVw==
X-ME-Sender: <xms:3i7DYJW_5pboE-Ihun8Ylc7hgsSshESF_AeSkNeOkdwnx9KCb_dYAA>
 <xme:3i7DYJmMsavt9_bMmjyouFGvcw0xN-4oBZT3uXPV7GWNdlUxURfBetpblJym4U9if
 EAedmnBtfZ220B0ZxI>
X-ME-Received: <xmr:3i7DYFarVuE-SbST2uNSPAINe0hF1E__Zgn7ONt5ghCSUl-WbzTSW11bV7dFKACwsrrpJyKq6NDKssZuprkkg9wA7IxRhiR75mRVQpQS7drpaKAGnyzn>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedujedgudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhh
 ihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepvddtgeegjeejte
 ejudffhfduvdefhfevhfelleevfeefhfelhefhgeeufeetvdehnecuffhomhgrihhnpehg
 ihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
 hlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:3i7DYMWjAZwkJvsCAPoIJ7Sa--6Cg1FNBdrfJCbYX2Ml_GsYSylYCA>
 <xmx:3i7DYDl9tfGVKSILvN1oR-Og4gG1NX8JFHpsSRz-X0cMDLEHeyL4Sw>
 <xmx:3i7DYJcjOlimQXTJQ1GlDtzEKW40keJYniBFbsoxPtl35ENLhb2teA>
 <xmx:3i7DYLuCvUIzaFnZjx51_igirw1xJF_eDioS7cOAUUYpIRsXpt295Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 11 Jun 2021 05:37:33 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 0/6] ALSA: bebob/fireworks: device entry corrections
Date: Fri, 11 Jun 2021 18:37:24 +0900
Message-Id: <20210611093730.78254-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.30.2
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

After working for hardware database of systemd[1], I realize that
current device entries of ALSA bebob/fireworks drivers includes some
issues. This patchset corrects them.

[1] https://github.com/systemd/systemd/pull/19124

Takashi Sakamoto (6):
  ALSA: bebob: fulfil device entries
  ALSA: fireworks: fulfil device entries
  ALSA: bebob: correct device entry for Mackie D.2 FireWire option card
  ALSA: bebob: correct device entry for Acoustic Reality eAR Master One,
    Eroica, Figaro, and Ciaccona
  ALSA: bebob: code refactoring for M-Audio models
  ALSA: bebob: correct device entries for Phonic Helix Board and FireFly
    series

 sound/firewire/bebob/bebob.c         | 92 ++++++++++++++--------------
 sound/firewire/bebob/bebob.h         |  9 ---
 sound/firewire/fireworks/fireworks.c | 15 +++++
 sound/firewire/fireworks/fireworks.h |  8 ---
 4 files changed, 61 insertions(+), 63 deletions(-)

-- 
2.30.2

