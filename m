Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F61809A4
	for <lists+alsa-devel@lfdr.de>; Sun,  4 Aug 2019 08:24:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE8A516BD;
	Sun,  4 Aug 2019 08:23:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE8A516BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564899871;
	bh=CoxpBr5mjZ0DWUhCdT73esqOuglX2hzAmBvXSi7PXuM=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RLPbU//3TxdCpA9iBubQMfX+7G2/v13I0eC9LHtjTiwgy3HxB1T1GD9KwcQQ16jbW
	 vbyTC6JAoaIrVlJptvvs53VT1kfLOk0HwJ9RLGR2nOpL35d0GSqKDTrUnV29DKYVyd
	 zGb5wzbqpD0jVyE8pqTkFhYL1XLzNgl7BZUWjass=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CE9EAF805DF;
	Sun,  4 Aug 2019 08:22:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89FD3F805A8; Sun,  4 Aug 2019 08:21:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 09BD8F800F3
 for <alsa-devel@alsa-project.org>; Sun,  4 Aug 2019 08:21:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09BD8F800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="GxASlDJF"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="L8xRfMav"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 802452134B;
 Sun,  4 Aug 2019 02:21:43 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Sun, 04 Aug 2019 02:21:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm2; bh=CEsqNs5Lc3Jq2VcidfGewdIgpj
 mXjYYBHcFtKShDB4c=; b=GxASlDJF7I6sBvUVUS3pe0tZDGvinULAD1N/mX4701
 3aZW6ISwVdXqAsxmauiOPaO0GsloonvCyKEsSBq66/wtHZZm3FCMyGHh+3qX9+z4
 tyq+k4Eugx96D2PbTa5NgfcGSIhJ9y6i45T7xK5oqgNuauVg4wN54K7vjrjM0hpd
 7cnSR2d3/xgrOPVTUQVo37LBupWDk+IcIAoVwxt0Hr8Wtxt992eizW0sGHW1sWa5
 ZWu783Vt9dRKwxc0RXbX2gQVm1kfuhvge4nLKTS7hInYAHrbq1iUhrD4LMorc9Lu
 r2XU8Sxskjyfyihujpitsd9/MjAWkqynuKsXNG5PWbJg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=CEsqNs5Lc3Jq2Vcid
 fGewdIgpjmXjYYBHcFtKShDB4c=; b=L8xRfMavCS5SlM742Xa27960kNhUyWuyU
 ZW18FW0Vn9K2s+GAsHc/PMXoap1RVY/B4SgG4n6C+G54XK7NbJ+WmF7MRCbScMpc
 0V5cSBpEWd21eX6o57Jmn4MeLQ5rlVcdOhygpIlf41z4mPCfS919LjAyf8KnYiTF
 tGe2scNxuj7rs3HCA89Ius0weJa0G5iBIa0BCJ9h452UnGGkBLojdiYSAwaBhJLB
 6Z9AZ9pk5bRdTWzrRjrfUuA363y3x47wH/I4m0E5WWrkNgfj/DDo+SWUDmD+Emhc
 WEtTeUDdcK5Z/fOsIcXTSaX9ihkQvdCxcz4S1sYGKpq4BeDuUUu1Q==
X-ME-Sender: <xms:dnlGXRUVb4SCWhX8YNFATFjMITh-KqHkHA9Bdjy8TOzF0QW7ZsuFOA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddruddtgedguddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhh
 ihesshgrkhgrmhhotggthhhirdhjpheqnecuffhomhgrihhnpehgihhthhhusgdrtghomh
 dprghlshgrqdhprhhojhgvtghtrdhorhhgnecukfhppedugedrfedrjeehrddukedunecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhih
 drjhhpnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:dnlGXYDaAOUBUtr64RmX3i1yIxF5zgvciJqzoTjv_2YD3MMXn14aOg>
 <xmx:dnlGXWM_24ESnfu1_78iO20uY2YYOEo7feCvRwqY_jWIM_Ct1-WgNw>
 <xmx:dnlGXTnjQP8tQquboelLXbLhHMwl1ZED6993WHcWbpeNi4MG3knDzA>
 <xmx:d3lGXfS8G8wzkG9ZCA8dK_Jdd5VhM3NiIuXgXHRU2WQIoxRgiFn71Q>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 495E8380084;
 Sun,  4 Aug 2019 02:21:41 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Sun,  4 Aug 2019 15:21:19 +0900
Message-Id: <20190804062138.1217-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 00/19] ALSA: firewire: introduce AMDTP domain
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

This patchset is to implement AMDTP domain I addressed in my previous
patchset:
https://mailman.alsa-project.org/pipermail/alsa-devel/2019-July/152430.html

My work for libhinoko[1][2] allows me to sniff actual packet transmission
between devices and drivers in Windows/Mac OS for long period (e.g. 1
hour). As a result, some supported devices don't follow packet sequences
transferred by the drivers. They expect drivers to parse isoc packets
in tx stream and recover frequency of data block then transfer isoc packets
as rx stream.

(I note that no specification describes this mechanism as long as I know.
In the specification, clock recovery is one-way from transmitter to
receivers, thus recovered clock is not necessarily used for transmission
from the receiver to the transmitter.)

For the clock recovery in driver side, several isoc contexts should be
handled in one time to parse packets in incoming stream and to build
packets in outgoing stream. The AMDTP domain is designed for this purpose.

In this time, the AMDTP domain implements the functionalities to
start/stop a couple of isoc contexts for some AMDTP streams. Each
context still runs in own handler for scheduled hardware IRQs. I'll post
further work after merged.

[1] https://mailman.alsa-project.org/pipermail/alsa-devel/2019-April/147862.html
[2] https://github.com/takaswie/libhinoko

Takashi Sakamoto (19):
  ALSA: firewire-lib: add AMDTP domain structure to handle several isoc
    context in one interrupt callback
  ALSA: firewire-lib: add a kernel API to stop a couple of AMDTP streams
    in AMDTP domain
  ALSA: firewire-lib: add a kernel API to add AMDTP stream into AMDTP
    domain
  ALSA: firewire-lib: add a kernel API to start AMDTP streams in AMDTP
    domain
  ALSA: fireworks: code refactoring for initialization/destruction of
    AMDTP streams
  ALSA: fireworks: code refactoring for bus reset handler
  ALSA: firewire-digi00x: code refactoring for
    initialization/destruction of AMDTP stream
  ALSA: firewire-tascam: code refactoring for initialization/destruction
    of AMDTP stream
  ALSA: firewire-motu: code refactoring for initialization/destruction
    of AMDTP stream
  ALSA: fireface: code refactoring for initialization/destruction of
    AMDTP stream
  ALSA: bebob: support AMDTP domain
  ALSA: fireworks: support AMDTP domain
  ALSA: oxfw: support AMDTP domain
  ALSA: dice: support AMDTP domain
  ALSA: firewire-digi00x: support AMDTP domain
  ALSA: firewire-tascam: support AMDTP domain
  ALSA: firewire-motu: support AMDTP domain
  ALSA: fireface: support AMDTP domain
  ALSA: firewire-lib: localize kernel APIs to start/stop each AMDTP
    stream

 sound/firewire/amdtp-stream.c               |  94 ++++++++++-
 sound/firewire/amdtp-stream.h               |  20 ++-
 sound/firewire/bebob/bebob.h                |   2 +
 sound/firewire/bebob/bebob_stream.c         |  62 +++----
 sound/firewire/dice/dice-stream.c           |  32 +++-
 sound/firewire/dice/dice.h                  |   2 +
 sound/firewire/digi00x/digi00x-stream.c     | 106 +++++++-----
 sound/firewire/digi00x/digi00x.h            |   2 +
 sound/firewire/fireface/ff-stream.c         |  96 ++++++-----
 sound/firewire/fireface/ff.h                |   2 +
 sound/firewire/fireworks/fireworks.h        |   2 +
 sound/firewire/fireworks/fireworks_stream.c | 176 ++++++++++----------
 sound/firewire/motu/motu-stream.c           | 131 +++++++--------
 sound/firewire/motu/motu.h                  |   2 +
 sound/firewire/oxfw/oxfw-stream.c           |  72 ++++----
 sound/firewire/oxfw/oxfw.h                  |   2 +
 sound/firewire/tascam/tascam-stream.c       | 123 ++++++++------
 sound/firewire/tascam/tascam.h              |   2 +
 18 files changed, 558 insertions(+), 370 deletions(-)

-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
