Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA4CDB19E
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Oct 2019 17:56:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D443169D;
	Thu, 17 Oct 2019 17:55:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D443169D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571327786;
	bh=0nHYAw3MldhoMnZQgS42OJovz2CrssC9DVD6boMpRYk=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RtQzrcv5dY421TjgpSRAJsK/z9LGE/+gwerZmL8/HudjTo0QYgPj3wr070akda7kh
	 EST/MYHAMg7Kgz4wW2uaCvurxVdJl/NXACDIQgRnh6uIkd4Ic8/Y1m6BHrr7BAi1oi
	 XHi4DT9tKinsjyCjTD0LrKkXOIM0WUUmMKVL9gsg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 65E58F805AA;
	Thu, 17 Oct 2019 17:54:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BD41CF80529; Thu, 17 Oct 2019 17:54:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6E294F802A0
 for <alsa-devel@alsa-project.org>; Thu, 17 Oct 2019 17:54:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E294F802A0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="PWesDDic"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="KueDAcCP"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 8CD5A4E9;
 Thu, 17 Oct 2019 11:54:31 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 17 Oct 2019 11:54:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm2; bh=lWerE5N4gSaRkgaOqLGQpgvrXs
 stC5QjAtRafvuhRNE=; b=PWesDDiceu0DSGIL8yXXcKOJJ+RXNiBRFve0eR+9Wc
 EzGzdAJIE0iS3eOtegZSeK8HZB3SRT7JwsjR7NLNNRT6IFClRCyL4KbKgm3hpSyP
 BYpLc9eQD8kCeQVjmfrKWdyiHFLnCdkpT65N6p8LzaKtw/hXTLyG/OU2fKAg6uw8
 gh8yGZf/JxarRQnExciY7TBb5FR0cAXtY6G2lvq4lA02aYnpGSQw/sDcub9i7Cex
 yi13Q0pZ1bMLqI9U5GQ4T0iCij1XgwF6cLAT0hj+WxuW/u+/3Vsod3ceFYWPdxoj
 hLYnk4+DBWT2X0a1FySztXviQtjoOCYID/qn0/kVaB9A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=lWerE5N4gSaRkgaOq
 LGQpgvrXsstC5QjAtRafvuhRNE=; b=KueDAcCP9zMEGkfPvkHIvCs3Z2bzmbRF2
 y6krTahtk5tuFZQZslcwETArcdkimqi9uFs+qeAWyKnZgk7m+W3OeIk5ztR/LuWB
 Bd2s3/+KbbeTLE3x7d9PZGXWDi0YBMCGpzNue4bONl7u5RoHdr7Cl8wU7XNLPmQM
 dMZNBzFa7LVI4nJMeA63Mft4N1a5Hs+Ww1bosIvgbEJkUQwCQPZLJopns0wVrsVZ
 Za35QPjGlJtpINrx07roxezkzqXdLploZYDmkk+dw68hq3PfK6C+7JhUmroBbiBp
 L3WHoENrotROcicdJNsekl6vZUYTxClKwv/a7IlfOM9F9Y1QUumnQ==
X-ME-Sender: <xms:tY6oXUmMpdQFSfckzxo5oHBUu7BzSaZe1wG_yuxmMkxAgSP44OWNjA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrjeejgdelgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
 dtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhi
 sehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekudenucfrrg
 hrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhj
 phenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:tY6oXf1OisgUSC4RQRFhLN64jhcJptWpocTMe5ff08qTlQ0j-GMtuw>
 <xmx:tY6oXU1A2l-cYOP4mZgrqEDi2GmdgpC7uRfa4nVxWoSgEXIB4J3gow>
 <xmx:tY6oXRpvYiUK8k7AROtk8T83KasPDMRPL4aUWwyimIrd1yoMRzxrtQ>
 <xmx:t46oXS5WtxrSxLmudStmOeYj6FCv6C0iKRNLTG-Ti8GUbPFnna4WLA>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 41B4E80060;
 Thu, 17 Oct 2019 11:54:28 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Fri, 18 Oct 2019 00:54:12 +0900
Message-Id: <20191017155424.885-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 00/12] ALSA: firewire: configure interval of hw
	IRQ via ALSA PCM interface
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

ALSA IEC 61883-1/6 packet streaming engine controls OHCI 1394 controller
to generate hardware IRQ for fixed number (=16) of isoc packets.
Additionally, the size of packet buffer is fixed for triple of interval
of hardware IRQ (=48).

This commit allows ALSA PCM applications to configure these parameters
by ALSA PCM interface. As a result, the size of PCM period is available
in the range between 125 usec and 64 msec (or 32 msec). The hardware
IRQ is scheduled for isoc packet which includes event across PCM period
boundary.

Takashi Sakamoto (12):
  ALSA: firewire-lib: use variable size of queue for isoc packets
    instead of fixed size
  ALSA: bebob: share PCM buffer size for both direction
  ALSA: fireworks: share PCM buffer size for both direction
  ALSA: oxfw: share PCM buffer size for both direction
  ALSA: dice: share PCM buffer size for both direction
  ALSA: firewire-digi00x: share PCM buffer size for both direction
  ALSA: firewire-tascam: share PCM buffer size for both direction
  ALSA: firewire-motu: share PCM buffer size for both direction
  ALSA: fireface: share PCM buffer size for both direction
  ALSA: firewire-lib: schedule hardware IRQ according to the size of PCM
    period
  ALSA: firewire-lib: tune the maximum available size of PCM period
  ALSA: firewire-lib: tune the minimum available size of PCM period

 sound/firewire/amdtp-stream.c               | 154 ++++++++++++++------
 sound/firewire/amdtp-stream.h               |   9 +-
 sound/firewire/bebob/bebob.h                |   3 +-
 sound/firewire/bebob/bebob_midi.c           |   2 +-
 sound/firewire/bebob/bebob_pcm.c            |  12 +-
 sound/firewire/bebob/bebob_stream.c         |   5 +-
 sound/firewire/dice/dice-midi.c             |   2 +-
 sound/firewire/dice/dice-pcm.c              |  20 ++-
 sound/firewire/dice/dice-stream.c           |   5 +-
 sound/firewire/dice/dice.h                  |   3 +-
 sound/firewire/digi00x/digi00x-midi.c       |   2 +-
 sound/firewire/digi00x/digi00x-pcm.c        |  12 +-
 sound/firewire/digi00x/digi00x-stream.c     |   5 +-
 sound/firewire/digi00x/digi00x.h            |   3 +-
 sound/firewire/fireface/ff-pcm.c            |  13 +-
 sound/firewire/fireface/ff-stream.c         |   5 +-
 sound/firewire/fireface/ff.h                |   3 +-
 sound/firewire/fireworks/fireworks.h        |   3 +-
 sound/firewire/fireworks/fireworks_midi.c   |   2 +-
 sound/firewire/fireworks/fireworks_pcm.c    |  12 +-
 sound/firewire/fireworks/fireworks_stream.c |   5 +-
 sound/firewire/motu/motu-midi.c             |   2 +-
 sound/firewire/motu/motu-pcm.c              |  12 +-
 sound/firewire/motu/motu-stream.c           |   5 +-
 sound/firewire/motu/motu.h                  |   3 +-
 sound/firewire/oxfw/oxfw-midi.c             |   4 +-
 sound/firewire/oxfw/oxfw-pcm.c              |  17 ++-
 sound/firewire/oxfw/oxfw-stream.c           |   5 +-
 sound/firewire/oxfw/oxfw.h                  |   3 +-
 sound/firewire/tascam/tascam-pcm.c          |  12 +-
 sound/firewire/tascam/tascam-stream.c       |   5 +-
 sound/firewire/tascam/tascam.h              |   3 +-
 32 files changed, 266 insertions(+), 85 deletions(-)

-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
