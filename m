Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 770304A21D
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jun 2019 15:29:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 009E716D5;
	Tue, 18 Jun 2019 15:28:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 009E716D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560864544;
	bh=iXoxETh9Ef4qW66V/7sh4SGpKRFRsC3YMyAiGORrcsg=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UHzRYcGNghiF5bwHMhPjIiYT8S/1R8Tm+vYku3bEUqqzctgMTWi6ueSEZ70anyLxI
	 HquXaZ+Hnl6Zz4FbP7hLWMOL0VZm2F7pVyPM8ys2w9kcAidnc8KXfSMkORkR0/95ns
	 JJ/6tGL/q1l2a+Y/htmqk5uaYUPsdN6Yj6RVGxSI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BB7BEF89724;
	Tue, 18 Jun 2019 15:26:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EF852F8971B; Tue, 18 Jun 2019 15:26:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9BC04F80CC4
 for <alsa-devel@alsa-project.org>; Tue, 18 Jun 2019 15:26:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9BC04F80CC4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="OuznDIPd"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="FrfnViG0"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 46C1F21FB6;
 Tue, 18 Jun 2019 09:26:28 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Tue, 18 Jun 2019 09:26:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=1IgwZaNImhVIxABj7U/BwRpoG0
 nlqTJukyzyLB7ClIo=; b=OuznDIPdvBNzoGj5IG96OpSmq86E32JB/ifN2JPjLQ
 13vF3nqDYTid4BcTRhdL9KjcCfmiq06Xqfg1YKl/kH9ooramuErBKRtLo1RLQYE2
 BzFsj2Yf2kyAkadXn15uOVaQKfvIhudpE8tSMsS4QGBvK+EVTXo7u11NRKN7D6Sy
 SUHpxh/uCezdmkHGfn4AB5zGUr1IUnrM3smoCC68bZk7+KgswcAu300cvElBJrwD
 ymST9ryrCXBlVTzQqEvtz010HaZiUrNkuje8hlnzwBF4ZnfT84rJm0FiVm98jtzD
 QKXFfa1A2Ortuz9fD/UeSCmz1iO7Uo/Da4ckCzkIFfqA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=1IgwZaNImhVIxABj7
 U/BwRpoG0nlqTJukyzyLB7ClIo=; b=FrfnViG0VNk+w+lGtzEb1Ur/YmtEPtwFA
 30DwFicItdMFNTlI58LgRbzeiHko/y8doXxVpS4zC8nhz0EV+Z1OXLNtvtiRO93K
 hyrRh7K6iElCVFS0uyUObVONLvvZAWLwPkuQro4mRjPRGIOiGFs6zKuOe6RgnXiB
 K3ax40SOw9V5oDCz01NIEs2oaNFYGfREM8kDr9bzR+rdoS9lNAM9A+N/5FGXGJ/8
 5Js6h80eDPRfIFxrKXUw0+jcaS7J1p1jTGpEbj0JxcQBIeZlpXKV2ti31WmQZJ7q
 1ilS28oAitJvUlrUFgSMxH0GTXOAfu0GC7SrxWILmZ0w2oUyrorTA==
X-ME-Sender: <xms:g-YIXUq7kItA564luQvoD5Myg6rKp6BjENySQF5I6EMjVXIxwovauQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrtddtgdefgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
 dtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhi
 sehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekudenucfrrg
 hrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhj
 phenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:g-YIXU7YVwPwLnRUbmFS4NKiley4QmtXFOoYjVLnTI3XjqrbdDXMOg>
 <xmx:g-YIXa_7plEwEztG0t3SNiGXhPlcNBtj0igXJeC1PZ1vn-kEB34ruQ>
 <xmx:g-YIXQepsnx9BjRG5ValdXON20L1e5VHxWWH46aqOucC7p-Pk-eMdg>
 <xmx:hOYIXYM-S-XUtbAzR_jP2u-kE5WWhVL3LjjbSKOrmsy6O1MMUltHLg>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id A875A38008B;
 Tue, 18 Jun 2019 09:26:25 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Tue, 18 Jun 2019 22:26:14 +0900
Message-Id: <20190618132622.32659-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 0/8] ALSA: firewire: minor code refactoring and
	bug
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

During a couple of weeks, I added code refactoring to all of drivers in
ALSA firewire stack. But I can find some rooms for additional code
refactoring and some bugs.

This patchset is for them.

Takashi Sakamoto (8):
  ALSA: firewire-tascam: unify stop and release method for duplex
    streams
  ALSA: fireface: unify stop and release method for duplex streams
  ALSA: firewire-motu: unify stop and release method for duplex streams
  ALSA: firewire-digi00x: unify stop and release method for duplex
    streams
  ALSA: dice: unify stop and release method for duplex streams
  ALSA: bebob: ensure to release isochronous resources in pcm.hw_params
    callback
  ALSA: fireworks: ensure to release isochronous resources in
    pcm.hw_params callback
  ALSA: oxfw: ensure to release isochronous resources in pcm.hw_params
    callback

 sound/firewire/bebob/bebob_stream.c         |  3 +++
 sound/firewire/dice/dice-midi.c             |  1 -
 sound/firewire/dice/dice-pcm.c              |  1 -
 sound/firewire/dice/dice-stream.c           |  8 ++------
 sound/firewire/dice/dice.h                  |  1 -
 sound/firewire/digi00x/digi00x-midi.c       |  1 -
 sound/firewire/digi00x/digi00x-pcm.c        |  1 -
 sound/firewire/digi00x/digi00x-stream.c     | 14 +++++---------
 sound/firewire/digi00x/digi00x.h            |  1 -
 sound/firewire/fireface/ff-pcm.c            |  1 -
 sound/firewire/fireface/ff-stream.c         | 14 +++++---------
 sound/firewire/fireface/ff.h                |  1 -
 sound/firewire/fireworks/fireworks_stream.c |  3 +++
 sound/firewire/motu/motu-midi.c             |  1 -
 sound/firewire/motu/motu-pcm.c              |  1 -
 sound/firewire/motu/motu-stream.c           | 14 +++++---------
 sound/firewire/motu/motu.h                  |  1 -
 sound/firewire/oxfw/oxfw-stream.c           |  2 ++
 sound/firewire/tascam/tascam-pcm.c          |  1 -
 sound/firewire/tascam/tascam-stream.c       | 14 +++++---------
 sound/firewire/tascam/tascam.h              |  1 -
 21 files changed, 30 insertions(+), 55 deletions(-)

-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
