Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D4238DFCF
	for <lists+alsa-devel@lfdr.de>; Mon, 24 May 2021 05:15:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 377B31673;
	Mon, 24 May 2021 05:14:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 377B31673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621826132;
	bh=jsl6Ellh0s6iLkZ4xVlyPthUuvIPp9uTCv117yM77qw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LwLK9ypUi7kM1KMpJrUj97HdB2RLK3bJBuwL4k7zhATE/Ubd9j1O/BKQqOmrcLPRs
	 qhBjJwir9qgEwN4h5f0no36EAD+f3AWOphOlEhbG6LCBHLyeOWQQWzpU4Pym5is9Ru
	 KKzNWeRyEYz8gcjx2zYuX4+AVOkKFmqsbGHvxV7s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CB72CF8025C;
	Mon, 24 May 2021 05:14:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6A3DEF8025C; Mon, 24 May 2021 05:14:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 RCVD_IN_MSPIKE_H4, RCVD_IN_MSPIKE_WL, SPF_HELO_PASS,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1812AF800B8
 for <alsa-devel@alsa-project.org>; Mon, 24 May 2021 05:13:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1812AF800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="EdypJ/It"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="KJWGP6Pv"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id EFF2D5C0114;
 Sun, 23 May 2021 23:13:51 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Sun, 23 May 2021 23:13:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=7tsge20L5r5DYB0ePrPly2Hnzm
 iPVy4eh89kZZvMvco=; b=EdypJ/ItM0+XksXkP8ESYkEX0H2QlXIlUJscs5evNI
 p1gGyLgovT+dd9nfYLK6EHSbuYSuRj3derKniDgwtkA72vToExPRBZjboEQH2XHg
 JKMuojm/ed8FtOVxYYwie2rg7dL3jydlS9Krhb28/3TUbGHsY/R8nYE34mnyS3Kt
 2Xbsb15LN3hpvg1tO/0SM5gx4GkWOqoYuH9qdqYLuSvuMSqXbPMFIYwN1FvoHPuA
 P5pB36B6LlgHF/P6sVtEoIeIpNMgqjEHCHqAAJRp2oetxWx/inD12YsH6RDZDXWy
 p3mnCwuhdDr/wY2porNVm0bSfxvqQUZmpcdSOt7Ltl5A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=7tsge20L5r5DYB0eP
 rPly2HnzmiPVy4eh89kZZvMvco=; b=KJWGP6Pv8YHFi2HXQFRy2gQQxw8osnZMQ
 FYjSQfd1zldAczc2UQQyIlpiceQZhJEnee1qVf8m8MIA0g4ZiCgWv724oFOYc/Fj
 +4C+u9SsdXQPrXp0AcyRn8NJoIQaoMXrUZCWt9d4Vqo7y/UIJ4FZPc8ibTPqYDH/
 HefwVtg0CoL1ZZ99ux89E07simVu3NvyTabdAN06Od65he/I30+D/AvCgk430bjE
 84b0pM2yQT6dw8vK38gwZ8ymZ0SzFSxoIc+eEQ0ud8aNVTlPRSMKwFWDaFYCkco1
 kf8XosnLibVhjdsfu5PqgcCHRR2/6SA+g4VLp4DUmJPEsfXSu7XVQ==
X-ME-Sender: <xms:7xmrYJhpfpPlQmhg2t_RhDBY_X9fO8jVlhiX4ovxgh4rIVC5OOcRvA>
 <xme:7xmrYOChx8_wluHhuqGXT4GaFD7r4YTp8aBgQo9iMq3kLgoRI67B7qtBX0CWQblGE
 dXbV68VGLwudV2h6OU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdejkedgfeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhh
 ihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepteeiuefhjeekke
 efheetieekvdegfefhgffgvdeiheehhfehiedvhffgjeejuddunecuffhomhgrihhnpehk
 vghrnhgvlhdrohhrghenucfkphepudegrdefrdeihedrudejheenucevlhhushhtvghruf
 hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghk
 rghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:7xmrYJGET0W4kKAuMni2DyiWATMV1zIhSuoAxroWvV0324SaISgBUQ>
 <xmx:7xmrYOQjhSyeAn9gU2zAs99WQgVwQw6CYV7P0xk0AOLVoQphqL_s4g>
 <xmx:7xmrYGzkYp1w7VfY5BFg7Usf5qdsLXmjaIKNTO-K-xh6Eq1kUpD76Q>
 <xmx:7xmrYMZC2LLcY2cBQ0i13j97H404shVE83TR6kblmAuNomZ6F321YQ>
Received: from workstation.flets-east.jp (ae065175.dynamic.ppp.asahi-net.or.jp
 [14.3.65.175]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Sun, 23 May 2021 23:13:50 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH v2 0/4] ALSA: firewire-lib: drop initial NODATA packets or
 empty packets
Date: Mon, 24 May 2021 12:13:42 +0900
Message-Id: <20210524031346.50539-1-o-takashi@sakamocchi.jp>
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

This patchset is take 2 of my previous one;
 * https://lore.kernel.org/alsa-devel/20210523124114.272134-1-o-takashi@sakamocchi.jp/

The devices based on BeBoB ASICs or the devices in Tascam FireWire
series transfer a batch of NODATA packet or empty packet in initial step
of streaming. To avoid processing them, current implementation uses an
option to skip processing content of tx packet during some initial
cycles. However, the hard-coded number is not enough useful.

In 1st patch, ALSA IEC 61883-1/6 packet streaming engine becomes to drop
the initial packets. As a result, The tx_init_skip_cycles argument of
amdtp_domain_start() function changes its meaning. In the following
patches, ALSA bebob driver is refactored.

Changes from v1:
 * Fix -Wunused-but-set-variable warning reported by 0day-ci
 * Add 2nd patch to obsolete unused member of structure

Takashi Sakamoto (4):
  ALSA: firewire-lib: drop initial NODATA or empty packet
  ALSA: firewire-lib: obsolete callbacked member
  ALSA: bebob: cancel switching connection order
  ALSA: bebob: distinguish M-Audio ProFire Lightbridge quirk

 sound/firewire/amdtp-stream.c       | 145 +++++++++++++++++++---------
 sound/firewire/amdtp-stream.h       |   6 +-
 sound/firewire/bebob/bebob.c        |  10 +-
 sound/firewire/bebob/bebob.h        |   1 +
 sound/firewire/bebob/bebob_stream.c |  25 ++---
 5 files changed, 122 insertions(+), 65 deletions(-)

-- 
2.27.0

