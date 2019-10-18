Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E79DBD9D
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Oct 2019 08:21:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 257B81675;
	Fri, 18 Oct 2019 08:21:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 257B81675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571379718;
	bh=+Vps6oXKxNigPWLzE42W15aQ4lNpvWOYXmlCx9BafZk=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XStCrdxpTKco3hlMV4w8DG5HwZmDL+gjihFGTgZ6qRGKqWGgJY1FBg8x4Ja/OIZD2
	 LkNwc1yjtnAQTt84lwJYXvjNVi3lUvheF9p4NzGB+IX3g9m2zN8lY7ytCH4HwAEu01
	 ssit78FBMCWDgXtDclbIxca6HQRBMZ08fYugzkdc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D7C9F80362;
	Fri, 18 Oct 2019 08:19:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C7C3BF8036C; Fri, 18 Oct 2019 08:19:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B9DFF800D0
 for <alsa-devel@alsa-project.org>; Fri, 18 Oct 2019 08:19:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B9DFF800D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="pDV6S+tY"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="IBoZu/zL"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 0CF533F9;
 Fri, 18 Oct 2019 02:19:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Fri, 18 Oct 2019 02:19:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm2; bh=KaxVZr7S8PiHiaQyEWQ6ZUrofv
 ricreKCVphsaphGF0=; b=pDV6S+tYC4NDaYMwffXtYPkZCt9dk9R06svAXS70wd
 CDsuoZh9TkFzq9fmhZ+Kj0Mn7y6DjvF90mY9LdTBP1OAbnkJlqyCHWNkhOCy9w/W
 kSC/RWJDJQ45KCHNzMxObP4bdtWIjVgivzVa+mhBuSBPColVP8kK2L2OMs+dthUQ
 cBQzwUtVEoF6L2fSisk0l0/ebcKjVfZkPSQ++w1Sg2p/f4gUwgdsuCtvWOA0SpAO
 6QX0JF4g9pRB1JBnLnB/s807mDFqiWXeBkJbLYsAIjC2GMpU6sCsXMU++n+Xtx6G
 Nyhj4d8ds1Eg+PaMX0TjO2koTiQLy8NMlnHpU6OHrmtg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=KaxVZr7S8PiHiaQyE
 WQ6ZUrofvricreKCVphsaphGF0=; b=IBoZu/zLyvJbzFNVs0qGPIkNOyUVvtKcd
 1DYiRQUiW4PvTJzji7uRkUMl5haVfUF3Bq3XjpYqyVOSPxnysjuLR/sMO8eP4YZl
 ivSpksVsUlHjX3z8Fhw+xucB6Q+Arzlq5QlA4suqbk8yh2ZsZ0yfE00yf0A2sDX+
 rhe1935+KY321VMIcSmGWoZFcwsMHxJvW+oIAMA/4bQuuwU5MjfWnVOvV1/pec1c
 GBdgaIGbyY7qp6PsjX8SbejRnPjSKgjs68n68jJc1GiP6DU1gFpmM1j2+Yc+IXjo
 abqavy9YM8oW5HR9hD9x9ADvk21Z3Yn9ykDajTOab/v9doEXbRlQQ==
X-ME-Sender: <xms:Y1mpXUfLnqFrY1fo9Hy-i2mC8_VQrYwCaYQi3ryav0CYaIG7Jqluow>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrjeekgddutdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhh
 ihesshgrkhgrmhhotggthhhirdhjpheqnecuffhomhgrihhnpegrlhhsrgdqphhrohhjvg
 gtthdrohhrghenucfkphepudegrdefrdejhedrudekudenucfrrghrrghmpehmrghilhhf
 rhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjphenucevlhhushhtvg
 hrufhiiigvpedt
X-ME-Proxy: <xmx:Y1mpXR6ltQfOj4xcH2f5D9_tWmJoxdbWOnol-KWah9RA66waMIZqoA>
 <xmx:Y1mpXZLfk3BM3JfwWetD1w00yilG9_EZImQiXkm2S2Cu4Z1loqR3Qw>
 <xmx:Y1mpXaMrbW3vCGdXk0zTwn6A2S7Sh-1gNvL2uk1rDZcjWaVIErWKOQ>
 <xmx:ZFmpXXcjS2UA0eOq0f43Tp5D58I7WSUFpna7JoQtGA5pIg5xbkjHcQ>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9A12580062;
 Fri, 18 Oct 2019 02:19:14 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Fri, 18 Oct 2019 15:19:05 +0900
Message-Id: <20191018061911.24909-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 0/6] ALSA: firewire: handle several IR/IT
	context in callback of the IT context
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

This patchset is a part of my continuous work to improve ALSA IEC
61883-1/6 packet streaming engine for clock-recovery, addressed in
my previous message:
https://mailman.alsa-project.org/pipermail/alsa-devel/2019-August/153388.html

For the clock-recovery, information in the sequence of tx packet from
device should be used to generate the sequence of rx packet to the
device. In current implementation of the engine, the packets are
processed in different tasklet contexts for each IR/IT context.
This is inconvenient to bypass information between these IR/IT contexts.

In this patchset, the engine is improved to process all of IR/IT
contexts in the same domain by a tasklet context for one of IT context.
For convenience, the IT context is called as 'IRQ target'. As a result,
1394 OHCI controller is managed to generate hardware IRQ just for the
IRQ target. All of rx/tx packets are processed in tasklet for the
hardware IRQ.

Takashi Sakamoto (6):
  ALSA: firewire-lib: add irq_target member into amdtp_domain struct
  ALSA: firewire-lib: replace pointer callback to flush isoc contexts in
    AMDTP domain
  ALSA: firewire-lib: replace ack callback to flush isoc contexts in
    AMDTP domain
  ALSA: firewire-lib: cancel flushing isoc context in the laste step to
    process context callback
  ALSA: firewire-lib: handle several AMDTP streams in callback handler
    of IRQ target
  ALSA: firewire-lib: postpone to start IR context

 sound/firewire/amdtp-stream.c               | 329 +++++++++++++++-----
 sound/firewire/amdtp-stream.h               |  17 +-
 sound/firewire/bebob/bebob_pcm.c            |  18 +-
 sound/firewire/bebob/bebob_stream.c         |  10 +-
 sound/firewire/dice/dice-pcm.c              |   8 +-
 sound/firewire/dice/dice-stream.c           |   2 +-
 sound/firewire/digi00x/digi00x-pcm.c        |   8 +-
 sound/firewire/digi00x/digi00x-stream.c     |   2 +-
 sound/firewire/fireface/ff-pcm.c            |   8 +-
 sound/firewire/fireface/ff-stream.c         |  10 +-
 sound/firewire/fireworks/fireworks_pcm.c    |  10 +-
 sound/firewire/fireworks/fireworks_stream.c |   2 +-
 sound/firewire/motu/motu-pcm.c              |   8 +-
 sound/firewire/motu/motu-stream.c           |   2 +-
 sound/firewire/oxfw/oxfw-pcm.c              |   8 +-
 sound/firewire/oxfw/oxfw-stream.c           |   2 +-
 sound/firewire/tascam/tascam-pcm.c          |   8 +-
 sound/firewire/tascam/tascam-stream.c       |   2 +-
 18 files changed, 325 insertions(+), 129 deletions(-)

-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
