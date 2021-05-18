Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F94A386FFD
	for <lists+alsa-devel@lfdr.de>; Tue, 18 May 2021 04:46:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 978161699;
	Tue, 18 May 2021 04:45:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 978161699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621305966;
	bh=PGSEdCzrFWp1KCLY15CSFVG2AH/qJ+H5+cYY7uEKOow=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=df3Q7xeHHU3K9dGgB9lMWmEqZZxrH7nUJB26oJvPNDlbdfIQPFclK0xIykukmoN+t
	 itG7bqupswbd4MvSB4gP/R6YIQTB6o0WO+3TQhOx6t0i2sZLCipfbiIVWtYCKdScQs
	 eWxvB36YRh/HbjGTIoilBDC+mHUNg9TaOr2mo7dg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94ED9F8014C;
	Tue, 18 May 2021 04:43:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C05FF804AA; Tue, 18 May 2021 04:43:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3070BF8014C
 for <alsa-devel@alsa-project.org>; Tue, 18 May 2021 04:43:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3070BF8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="Vwv7jx2n"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="cNUnywXD"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 177755C00A2;
 Mon, 17 May 2021 22:43:31 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 17 May 2021 22:43:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=F5TOFtaX/YLVfuwZBcAPAUonGk
 2YrBwSH6FptZEBpX4=; b=Vwv7jx2nApjAp+H+vE8bCVuMWOBS3FsOE7ENelEQtF
 9C/RzH1uFpaTdW85IoNTCun8I5ZPbtdVsXeDd9pq5PKRm0pBVCEztluCSA0oSRg2
 qyNisLUSlQe1mK/dII//Wjx0jpCx+2iuJW09VyRGeVFosWafwh98345z/j8A9IaR
 a3pJFLIdqQoS7sYY6g2RI6tbIWeHQJ6BRJixrpMPYQF3K7ZYQ8Pr0hDoi4TbLWSo
 IdbRSF8m5quqlFDguRBzosn10Qvw11c7RDHZgnzOFMWN4jEOEU8BHvWLTMs1+ILv
 axd6Vj/UEAuMd+w4JUJoxNWxpthhrDAiV2WF+RjC3EGw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=F5TOFtaX/YLVfuwZB
 cAPAUonGk2YrBwSH6FptZEBpX4=; b=cNUnywXDHFxW3thx1c4CZhSnIYYTMCBa+
 bfCDh1miK3UkTiiC2wi6OVMDley/Cgb5hTBAoTvXEZVFJxv5SYUsIEmLXSnBEHwf
 MT4Vkk40ptFH7X5O8dLQRwrSKZvjrHQi5PL5ZUxbRJsMCst3quUODDgjpFIh4u2b
 868olrQn2D3D2bhtTehkCYEHFxuSpFx5ITpWQ4nEM56jhrJFUtNBBkP0/5G7TNa9
 aX8ThkGEnZvxHIN1d9qwfWqgD/D6CLknZm5l9joNNY37uC2rlJy4Q1b+rmua34uU
 QASu6myY7BWcZscCtwjZsEBGHsDDWJAbUXin/+Konl5xwBEkmnHyA==
X-ME-Sender: <xms:0imjYKMS6cJsWc9z4qMphI1Y-XutQzRTf8yURRLgj2epQVdyudHLvQ>
 <xme:0imjYI99NTTri2kWzJBqUEcGB7p1EyouyYUCqfEviUgIfqajLe0rinGzRNLu0OyWk
 hStu3XjU2JDR5qSBIc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeiiedgheejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhh
 ihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepteeiuefhjeekke
 efheetieekvdegfefhgffgvdeiheehhfehiedvhffgjeejuddunecuffhomhgrihhnpehk
 vghrnhgvlhdrohhrghenucfkphepudegrdefrdeihedrudejheenucevlhhushhtvghruf
 hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghk
 rghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:0imjYBRIyQIyCFgFOsXHtzaMTPx4eu3zMvMzMc07Pdn5b5GD0rkJdg>
 <xmx:0imjYKsUyRWRmDzfV-_t8SEo4QcY4Hv9gHH7W8_6xMLLtsRCYy4b3A>
 <xmx:0imjYCczF4PbW6rEB08Ql0NuYspQC2ZYi39M9COBH3HDaNOvOeKz0w>
 <xmx:0ymjYKnT517im92x9nSsaaovYjCeG-683hYI8cfB0iOuv1pDeyA_2g>
Received: from workstation.flets-east.jp (ae065175.dynamic.ppp.asahi-net.or.jp
 [14.3.65.175]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Mon, 17 May 2021 22:43:29 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH v3 00/11] ALSA: oxfw: code refactoring for quirks specific to
 ASICs
Date: Tue, 18 May 2021 11:43:15 +0900
Message-Id: <20210518024326.67576-1-o-takashi@sakamocchi.jp>
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

This patchset is revised version of my take 2:
 * https://lore.kernel.org/alsa-devel/20210515071112.101535-1-o-takashi@sakamocchi.jp/

Changes from v2:
 * use int type instead of enumerated type for combination of
   enumeration-constants
 * fix semi-colon typo in subject line of 10th patch

Regards

Takashi Sakamoto (11):
  Revert "ALSA: bebob/oxfw: fix Kconfig entry for Mackie d.2 Pro"
  ALSA: firewire-lib/motu: use int type for the value of bitwise OR with
    enumerator-constant
  ALSA: oxfw: code refactoring for existent device entry with
    specifier_id and version
  ALSA: oxfw: code refactoring to detect mackie models
  ALSA: oxfw: add explicit device entry for Loud Technologies Tapco
    Link.FireWire 4x6
  ALSA: oxfw: add explicit device entry for Loud Technologies Mackie
    Onyx Sattelite
  ALSA: oxfw: add comment for the type of ASICs
  ALSA: oxfw: code refactoring for jumbo-payload quirk in OXFW970
  ALSA: firewire-lib: code refactoring for jumbo payload quirk
  ALSA: oxfw: code refactoring for wrong_dbs quirk
  ALSA: oxfw: add quirk flag for blocking transmission method

 sound/firewire/Kconfig             |   4 +-
 sound/firewire/amdtp-am824.c       |   4 +-
 sound/firewire/amdtp-am824.h       |   2 +-
 sound/firewire/amdtp-stream.c      |  11 ++-
 sound/firewire/amdtp-stream.h      |   5 +-
 sound/firewire/bebob/bebob.c       |   2 +-
 sound/firewire/digi00x/amdtp-dot.c |   2 +-
 sound/firewire/motu/motu.h         |   3 +-
 sound/firewire/oxfw/oxfw-stream.c  |  25 +++---
 sound/firewire/oxfw/oxfw.c         | 137 ++++++++++++++---------------
 sound/firewire/oxfw/oxfw.h         |  13 ++-
 11 files changed, 110 insertions(+), 98 deletions(-)

-- 
2.27.0

