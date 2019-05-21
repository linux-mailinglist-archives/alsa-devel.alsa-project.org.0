Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 225C22538F
	for <lists+alsa-devel@lfdr.de>; Tue, 21 May 2019 17:12:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5FCD91677;
	Tue, 21 May 2019 17:11:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5FCD91677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558451519;
	bh=9psD7s6JpkIJ1y5+n7w73X6zIQGC2FOEHKQrJgNsGBM=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bOaL2iVlANX5jZ0dABOlOOTuGi5bMaeIwWZRXLakmAAPi+pN60JczzjCC+vhedkR0
	 XK3T+tc9wF1jEGbxWPRaQy1JQrNNhbJfIB2VFO672a3/KqXZwlfIJcPo8reJEZzSKW
	 iVsA8gBfWtd/M9ci2Bdqdm3UrsQxslWy4eSiMKFE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 07938F89725;
	Tue, 21 May 2019 17:10:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D538DF89633; Tue, 21 May 2019 17:07:58 +0200 (CEST)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 35F22F89707
 for <alsa-devel@alsa-project.org>; Tue, 21 May 2019 16:57:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35F22F89707
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="mgCytosX"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="XZM9dBD6"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id C5940228BA;
 Tue, 21 May 2019 10:57:43 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Tue, 21 May 2019 10:57:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=3bOEO8xiXiGptNlYQqvLqMYCMB
 n7Cu8QBuVE/yWRQxY=; b=mgCytosXB61goKK8UQdiqA6kO7symW84jvDF0H+AXW
 6ze8Qtc0jBI5YHCtQPUvcYHncN+IqPeaNdBCMp0HfR7amUD3ptJsDbhG+rSU0jmq
 f9EffbVpeI7cYqoy70soEbf/MzW173svrSIWvBhabv9BAy5hZH3szjVxVBwrVRkF
 q4V2XcPGyaNN5HbF05w48oVlawWbnBW0T3MlGclNe2kT/ZW1yASgfL8bMf7F+AUI
 hZ8EHVnlaTWrrmg8VQeCAsgXfcP3BEHWqgIgSilqCNUwB4YjuVfIV6f++m90z1r9
 +wwQJ2dHcIlyoZABNaQih8oUFyIRh8Buz8vqVCooYSVQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=3bOEO8xiXiGptNlYQ
 qvLqMYCMBn7Cu8QBuVE/yWRQxY=; b=XZM9dBD6Mqt3rsOnAobkRQiiTCwdLCkUO
 08cN/kbfxpORtuFbtA7AVnriUN41OY0b2TtiR5aiep4Qv00AhXHTxFxQzk7DpoPu
 gQZx8VlrSNDTtrMkqjPXvUZ6Y4wcpr1/gtJI0myO1EDdmA5YuO6JmeWDN5dVnQUt
 t0UUvN4z0h/mhR68AZmWrs4F8bWQ0KiKM/vl3sUrD3RIMtBpPYNWjNe+El1WN4ti
 Ld/URcn9c7SReAap+gVYKbEM6Z26mOzsdbcr3E1EVvI/bIpxfWdzqChOxVsAwdqk
 g4U/m0hybUoBT2p8ui+f2sU+Nkd6tYCDGF34ZZYTuZkKWlOvi5BjQ==
X-ME-Sender: <xms:5hHkXEU9xAL0Ex0AWi4hceuFzp6Xe8es-l9N7DHw2L2WSTT4lqOPjw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddruddutddgkeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhh
 ihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedunecurf
 grrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdr
 jhhpnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:5hHkXJrL5rU1D-WBTwH6JuZdgmEILqRf1MzShrXyvWJbylDd4LjXcg>
 <xmx:5hHkXLXhsEJ-CeqdLsAf2hOThZ6vRBATslSgi-J6dXdRK21K0CKE0A>
 <xmx:5hHkXBD-zquL7G2zO7aF8UT0ZJ3DtVstwxA3_Cmj0qF_fQAU80hocA>
 <xmx:5xHkXPQylqaS0yIZ2wn5ESicNdOLPIl4FeCLS3lDLw0AvhBT-qQQCA>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 512A110379;
 Tue, 21 May 2019 10:57:41 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Tue, 21 May 2019 23:57:33 +0900
Message-Id: <20190521145737.11809-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 0/4] ALSA: firewire-lib: use IT context header
	to compute cycle count
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

In Linux firewire subsystem, the series of timestamp for each packets is
passed as argument to callback of IT context. The timestamp comes from
descriptor of 1394 OHCI IT context and represents the cycle to process
queued packet.

In current implementation of ALSA IEC 61883-1/6 packet streaming engine,
the timestamp comes from calculation with the last packet to generate
the callback, thus it's not per-packet information.

For simplicity, this patchset uses the header to compute the cycle for
packet to be going to be queued. Additionally, this patchset adds some
minor refactoring.

Takashi Sakamoto (4):
  ALSA: firewire-lib: use union for directional parameters
  ALSA: firewire-lib: add helper function to cancel context inner
    callback handler
  ALSA: firewire-lib: obsolete macro for header of IT context
  ALSA: firewire-lib: use IT context header to compute cycle count for
    scheduling packet

 sound/firewire/amdtp-am824.c                |   2 +-
 sound/firewire/amdtp-stream.c               | 181 +++++++++++---------
 sound/firewire/amdtp-stream.h               |  35 ++--
 sound/firewire/digi00x/amdtp-dot.c          |   2 +-
 sound/firewire/fireworks/fireworks_stream.c |   4 +-
 sound/firewire/motu/amdtp-motu.c            |   2 +-
 sound/firewire/tascam/amdtp-tascam.c        |   2 +-
 7 files changed, 135 insertions(+), 93 deletions(-)

-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
