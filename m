Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C13CDFE0
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Oct 2019 13:08:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B0A3166C;
	Mon,  7 Oct 2019 13:07:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B0A3166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570446497;
	bh=9t0sSA4l0zyGaHQf6+RodZHQnBQDIB7v2NQIsLcxLeE=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Fd+1xIyyqjemzty2J+AUNQUlymsZsOX82pH9MDugR2wIlQx6CenIjCq4K42MGfMi+
	 2WKXyBIhHcBdREbvzt+r3HJrKwnTAkCNRKkmEGqJ2BHDJD1/aWDFSTDOOJlPAhGv8c
	 Dru4cIoEwUUmgj3boN+M8UX4csuHfB+cv1tr26ck=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 64745F805FA;
	Mon,  7 Oct 2019 13:05:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89D25F80273; Mon,  7 Oct 2019 13:05:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 56337F80273
 for <alsa-devel@alsa-project.org>; Mon,  7 Oct 2019 13:05:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56337F80273
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="AiODNizj"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="R1wV9sLf"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 5537420D56;
 Mon,  7 Oct 2019 07:05:37 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 07 Oct 2019 07:05:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm2; bh=qT7b8RgwOvGHqgapDwdO3gokfs
 9wsPBQFA4PLAKL5Jw=; b=AiODNizj2y9MJshEAkF6Cv/OmF16WztmwAQlVJcDQ2
 7HWDK9AboeGMg2/enwSCBRQz5PmIWJFrHPyCiULRLMNcsIlunRB8uKp40gTkhQpD
 nrWiYRd3s6KA6G6nTDfh1heRwNB/mr2nJtwsdzV2OpNQ2GgoTVXF60gn1/V+G329
 Ntr2cgiyQs00OUcSkgP3z3BZDvbtEkQdb5SpBzXFdFnlR4XeUNDv65t8mq6Pfjuz
 b6Qa0oV1shr8C/Qp0z4AdmYRi14nbItHBWxzO1q5RNrqAwN+v0OM1ki2/KRYMGx2
 b4B8rZVj+AESOcZwJLVXiRU9GEFl3CxOlLIgl9DsY2iw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=qT7b8RgwOvGHqgapD
 wdO3gokfs9wsPBQFA4PLAKL5Jw=; b=R1wV9sLfY4fD+aGnHU4vk0dQNvx/ts5HN
 egu0vpGpo5P5iBrwlzND7GXt/FgTYO7hD8qhPS4AzVIigez2KtvJHd2VK9e+SGzF
 VPMc6Rawk4JPW1O3KWlhD1skRbSJKrqCi88fMN6gYcvbTRX7VElnUGwkODhBc2qX
 kOwMjsI7iCbE7F75Tlyu+b3qbiJqQMdxHCIUrc5sw5ANFPKowyJLqiqFpGMij+xh
 0q2WvHLF+6icYbYm7UjU9X7/T222igiuNqgxqPNTiLdNJ1174sW0mC3t1AB6j+Gr
 QdYM+QQ6neNOC9+Lb0Qrrq8Z+WI1unOLtskbDfCPY6x/NXCKVElWQ==
X-ME-Sender: <xms:ABybXTJ5yFoahL-xIo9svmcSWUVMy1Fr4ETsWt_bp-aXR_STzLt7dA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrheejgddvhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
 dtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhi
 sehsrghkrghmohgttghhihdrjhhpqeenucffohhmrghinheprghlshgrqdhprhhojhgvtg
 htrdhorhhgnecukfhppedugedrfedrjeehrddukedunecurfgrrhgrmhepmhgrihhlfhhr
 ohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhpnecuvehluhhsthgvrh
 fuihiivgeptd
X-ME-Proxy: <xmx:ABybXXRmXkgWbP0taVGyrl-wAljFBVIeOCaZk-ixnq5PtOk0e5fRpw>
 <xmx:ABybXZg1BKasfjgU8yCB4mrwgtcC8udAq5HGxr0-KkzbfQK6Z5SoJA>
 <xmx:ABybXQqhBkSiszBT4nh50tD6_FrgwTvZLtdVCCXFdGOyZQ6n-klvIg>
 <xmx:ARybXQOuktksBLkHT5gJeJxm4Ma4pBVkX_rePGrou8G8zYMw7eSn1g>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 22F1D80062;
 Mon,  7 Oct 2019 07:05:34 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Mon,  7 Oct 2019 20:05:15 +0900
Message-Id: <20191007110532.30270-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 00/17] firewire: share the size of period for
	both playback and capture PCM substreams
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

This patchset is a preparation for enhancement of AMDTP domain that I
addressed to my previous patchset:
https://mailman.alsa-project.org/pipermail/alsa-devel/2019-July/152430.html

When queued packets for several IT/IR contexts in the same domain are
handled in hardware IRQ context for an IT context, the number of events
in the packets are mostly the same for each of contexts. This means that
the size of period for PCM substreams associated to the contexts is also
the same.

At present, PCM substreams for the contexts can have own size of period.
This commit adds a member into AMDTP domain to share the size of period
for PCM substreams on AMDTP streams in the same domain.

This patchset includes optimization to detect whether isochronous
resources for AMDTP streams are reserved or not in pcm.open callback.

Takashi Sakamoto (17):
  firewire-lib: add a member into AMDTP domain for events per period
  bebob: register the size of PCM period to AMDTP domain
  fireworks: register the size of PCM period to AMDTP domain
  oxfw: register the size of PCM period to AMDTP domain
  dice: register the size of PCM period to AMDTP domain
  firewire-digi00x: register the size of PCM period to AMDTP domain
  firewire-tascam: register the size of PCM period to AMDTP domain
  firewire-motu: register the size of PCM period to AMDTP domain
  fireface: register the size of PCM period to AMDTP domain
  bebob: use the same size of period for PCM substream in AMDTP streams
  fireworks: use the same size of period for PCM substream in AMDTP
    streams
  oxfw: use the same size of period for PCM substream in AMDTP streams
  dice: use the same size of period for PCM substream in AMDTP streams
  firewire-digi00x: use the same size of period for PCM substream in
    AMDTP streams
  firewire-tascam: use the same size of period for PCM substream in
    AMDTP streams
  firewire-motu: use the same size of period for PCM substream in AMDTP
    streams
  fireface: use the same size of period for PCM substreams in AMDTP
    streams

 sound/firewire/amdtp-stream.c               |  4 ++
 sound/firewire/amdtp-stream.h               | 10 +++++
 sound/firewire/bebob/bebob.h                |  3 +-
 sound/firewire/bebob/bebob_midi.c           |  2 +-
 sound/firewire/bebob/bebob_pcm.c            | 43 ++++++++++++------
 sound/firewire/bebob/bebob_stream.c         | 11 ++++-
 sound/firewire/dice/dice-midi.c             |  2 +-
 sound/firewire/dice/dice-pcm.c              | 50 +++++++++++++++------
 sound/firewire/dice/dice-stream.c           |  8 +++-
 sound/firewire/dice/dice.h                  |  3 +-
 sound/firewire/digi00x/digi00x-midi.c       |  2 +-
 sound/firewire/digi00x/digi00x-pcm.c        | 39 ++++++++++++----
 sound/firewire/digi00x/digi00x-stream.c     | 11 ++++-
 sound/firewire/digi00x/digi00x.h            |  3 +-
 sound/firewire/fireface/ff-pcm.c            | 32 ++++++++++---
 sound/firewire/fireface/ff-stream.c         | 11 ++++-
 sound/firewire/fireface/ff.h                |  3 +-
 sound/firewire/fireworks/fireworks.h        |  3 +-
 sound/firewire/fireworks/fireworks_midi.c   |  2 +-
 sound/firewire/fireworks/fireworks_pcm.c    | 43 +++++++++++++-----
 sound/firewire/fireworks/fireworks_stream.c | 11 ++++-
 sound/firewire/motu/motu-midi.c             |  2 +-
 sound/firewire/motu/motu-pcm.c              | 33 ++++++++++----
 sound/firewire/motu/motu-stream.c           | 11 ++++-
 sound/firewire/motu/motu.h                  |  3 +-
 sound/firewire/oxfw/oxfw-midi.c             |  4 +-
 sound/firewire/oxfw/oxfw-pcm.c              | 45 +++++++++++++------
 sound/firewire/oxfw/oxfw-stream.c           | 12 ++++-
 sound/firewire/oxfw/oxfw.h                  |  3 +-
 sound/firewire/tascam/tascam-pcm.c          | 38 ++++++++++++----
 sound/firewire/tascam/tascam-stream.c       | 11 ++++-
 sound/firewire/tascam/tascam.h              |  3 +-
 32 files changed, 354 insertions(+), 107 deletions(-)

-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
