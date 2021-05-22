Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBCC38D2CF
	for <lists+alsa-devel@lfdr.de>; Sat, 22 May 2021 03:35:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36A7716CB;
	Sat, 22 May 2021 03:34:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36A7716CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621647348;
	bh=q/rgLH2omKjCemDFmMA8gvGQ70OLro6Tn3Tu1QpeGek=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SeGOjKvQisrx+hQBAVgUWJm2o7ZZtcL4Tiiinh01J9sNMaWMeTnHDnt/Io8SGDdXt
	 5Cue33rGIJhcWmW17Cq4X1h5JK4wAR1GCRrZ6FxqCB64bu/ITCd/j6imslHXiWBsAP
	 rV2967hs/krOLM5ItFP8zdwctqWBqVda0pvf+blM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CB555F80425;
	Sat, 22 May 2021 03:33:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ED254F802C8; Sat, 22 May 2021 03:33:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 68DD0F8020B
 for <alsa-devel@alsa-project.org>; Sat, 22 May 2021 03:33:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68DD0F8020B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="M2+rUlhP"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="UGTnwp6e"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 40BF55C011A;
 Fri, 21 May 2021 21:33:08 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 21 May 2021 21:33:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=B0IP0ON4lRwxPfe1uIK8485ws7
 hLan0LeAU4LKpjU2o=; b=M2+rUlhPux9J8LXDnnIxab1VTtkmNzZ0nfHK1Bq33M
 G3u89g8FmFEII4FTt60Ujq4icTpMa4DNyKmdDD5NsGVgx1XH5sBYln7thaLN7QzZ
 FUNFQkYCbgS76BgWxktvDr3sfLHoTevph78grqXL2G5FjJS1A+ZlFvnTiKoh59tO
 Mqdj3WnSZePeGpCPAoof5k0p8Kle/zScREH+YEQm74NMwKk52pl5XKfKrEwq5WKm
 dCD02IYpHVYOxEKJ31i0uWMJzF/wxN5/xtZoqCcXkT7d5/ZpB6xvJQqGXjav6XWW
 Vs7/0S3SEF41sQgXLltOeHvL/kllFc4XkHedtxL6XHFw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=B0IP0ON4lRwxPfe1u
 IK8485ws7hLan0LeAU4LKpjU2o=; b=UGTnwp6eeFj//cgjrb2gS4QT9dnrDxTjA
 t8PQtx/cK8FliLaoY05nxu2Q3+CJNYu5HvpHOOwzGVH6lvbH37jSBQmmc3nU+UY0
 UIYIGpVCDtgt5DvBQJxFgHsoj6xMDrUF0CGs8k92/tCToAvB2qAZ1/L43DrDA52Y
 e0rD6knVcEVp1BL2BE1fGgNnVeothkbUexO3EN0sWULArD862I5U9GGbKPiDnxiU
 3l1Upt0yktpdvpnzvIrnSVEe+CTuZzSg4xaTQnP7puTlRxP3HcvVxsvTN9Vy+83i
 kGB7Ccp3PrhMBtuEqw9QDOPYt0DQCYd7pCQA1WPDkcDvi6jhOT2hg==
X-ME-Sender: <xms:U1-oYNWG50soFJDrtxQbtlZUHuqkI8qU0xEPuBODPr3gg5NVNpLJ9A>
 <xme:U1-oYNniCZ8AFJWXhXBG4mJmFjAMQFl3Lbp0x435usKZcQ-l8QxDJ7vjxNHHxwJBa
 P-ZJBY10slJFw_MYxQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdejgedggeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhh
 ihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepudejteelhfdttd
 ekgfdtueeilefhgfetjeejheekgeevuddvveegieehueeukeejnecukfhppedugedrfedr
 ieehrddujeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
 homhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:U1-oYJbkcN6hyKIriZJS4qnrc7yOH5yt1wElDBTCfmJnAUkPRzQrJw>
 <xmx:U1-oYAWEmzb3bFSLzZnnXrc1TvJQDvmTkHiq3EKAN4WH1YyBK7wuPQ>
 <xmx:U1-oYHl4sz-MSecJ8kO5KiF9bcVGJ_64f-CBRdlI8D1yvPrG6QldqQ>
 <xmx:VF-oYGu-gSY0EQoE0XgN_t2mXin1wG7pI3E2GAGYTa-LKfTaJSCfEg>
Received: from workstation.flets-east.jp (ae065175.dynamic.ppp.asahi-net.or.jp
 [14.3.65.175]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Fri, 21 May 2021 21:33:06 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 0/6] ALSA: firewire-lib: code refactoring for processing rx
 packets
Date: Sat, 22 May 2021 10:32:57 +0900
Message-Id: <20210522013303.49596-1-o-takashi@sakamocchi.jp>
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

This patchset refactors mainly for processing rx packets.

Except for devices handled by ALSA bebob and dice drivers, the devices
doesn't take care of the value of syt field of CIP header for playback
timing. To code it explicitly, the new flag is added in 1st patch.

Some of devices based on DICE ASICs supports two pairs of packet
streams. In the case, the sequence of rx packet in the streams should
be different independently so that each of them deliver timing
information from each peer. On the other hand, current implementation
pools the sequence in AMDTP domain, then the rx packets are processed
with the same pool. It is inconvenient and in 2nd patch the pool is
prepared per streams.

The other patches are for my future work.


Regards

Takashi Sakamoto (6):
  ALSA: firewire-lib: add flag to unaware of syt in CIP header
  ALSA: firewire-lib: pool sequence of packet in IT context
    independently
  ALSA: firewire-lib: code refactoring for generation of packet
    descriptors
  ALSA: firewire-lib: code refactoring for generation of syt sequence
  ALSA: firewire-lib: code refactoring for generation of data block
    sequence
  ALSA: firewire-lib: code refactoring for transfer delay

 sound/firewire/amdtp-stream.c        | 267 +++++++++++++--------------
 sound/firewire/amdtp-stream.h        |  33 ++--
 sound/firewire/motu/amdtp-motu.c     |   4 +-
 sound/firewire/tascam/amdtp-tascam.c |   6 +-
 4 files changed, 146 insertions(+), 164 deletions(-)

-- 
2.27.0

