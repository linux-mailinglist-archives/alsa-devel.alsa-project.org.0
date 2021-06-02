Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD7B397E17
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Jun 2021 03:35:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D4D116E1;
	Wed,  2 Jun 2021 03:35:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D4D116E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622597752;
	bh=nbqhGxScC5K+Dmpm3klPYSevPlS54JSyW/XJXUViPiw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=C/P05F+46Dh4NBOFodsVf+4jlTVEWqsmBvjb5JuoeUg6lLjshQvtwdwpBH57VyOW3
	 tYnpUmJGNUNlpmTyx7q1kjbDkxvikvY0etPu5irlWYh9S52jS0WB0XY+QZuKSAn+Hk
	 uhMwrTbRlFLHXGXiqlmPhmorby8TrWp2qJDnbrYI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D571AF8049C;
	Wed,  2 Jun 2021 03:34:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0260AF80431; Wed,  2 Jun 2021 03:34:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 83877F80273
 for <alsa-devel@alsa-project.org>; Wed,  2 Jun 2021 03:34:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83877F80273
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="hdPUBU5Z"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="NYNX3wUt"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 6D2F515BB;
 Tue,  1 Jun 2021 21:34:11 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 01 Jun 2021 21:34:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=2swqNPbHtkjlG1pQNYO+GI+ds6
 T3VaxLwsrd+Oo/nbg=; b=hdPUBU5Z2+Jy5uKujG2YPCArLViJmwlugrogkpU/TB
 n52dYZqZhm/FO82gRTO3hDNemWFitm7i8E0GFoALPjo6uwbMAX8ddd6nHnF3mKHD
 3w7eCvn8v8qR8Z9wWhAbMDJgbYtluqsY1/v6oDCbqnXdKxdfnbJwWREIfiTsn45Z
 L1j4thn9GWF0/TBSg4/OkrtRgsvK63anB2VOG0iIsxiygg5nffdXO5YtHjGAgjyf
 tuN79nwbYPBWpntKBDGDPi0vtK1DSBBwQKhbjlhL1IB00lhz4g7RAcMDJs/Do91g
 0orJh1H8ncig4sjmJmaR27MSMjaTI8bplR+CdZFoqM5g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=2swqNPbHtkjlG1pQN
 YO+GI+ds6T3VaxLwsrd+Oo/nbg=; b=NYNX3wUtH5qXLQgaA6LAB36mq9g06UHpK
 fvrRMYwp4VXQbUbc80Dih8HHsBV3uFd23N7OFLdKeRu+9dTpQK2/OWEgiVcC6xyK
 oVqou3Og+jIeHUSLLvuXhNFOOQ5i/j38qKQ5BDcjbkuOnFkv27oeVEV31941/Cah
 PEoXaKAGttid+LbmtG3MW+FANRknDWw4iIaBjn2E54sXKe/QJ1IZCaA63+Wg205I
 iYkys3J3w2y1inhmbtc/MVRkZ9GOnTgjng8xBAZI5pF9JKMHxXzxtq03bm20u7K7
 VPfvRlIadEWaZJlYlTnQL58fk4iDNadDwa1iqnyifWJL4TXbaP+HA==
X-ME-Sender: <xms:EuC2YJ0xP851ATXLqHurQ4y2bZZWeJshtCukF4Y94ixkQy4Hu3l-RQ>
 <xme:EuC2YAFKLcLsdZ7CMJNamgpIr1nUJfhVLzj6edKGADhznz8pKezeqXMiD-_NyRcJq
 vi6wmgzvi4AsRiSPOA>
X-ME-Received: <xmr:EuC2YJ7AEWyQWulal13RNxbtfKN8xnNqf42AiD3KEho5Pxoa76Zu7-2QgKVF2jYhZqnM4d-YoW53t7KOMe6ndGUEDOJhWR8PU4WO_diy9n9XXxOZ_TrK>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeliedggeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhh
 ihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepudejteelhfdttd
 ekgfdtueeilefhgfetjeejheekgeevuddvveegieehueeukeejnecuvehluhhsthgvrhfu
 ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkh
 grmhhotggthhhirdhjph
X-ME-Proxy: <xmx:EuC2YG1jKNGAkihgphAivF3OPUMFYS7os_7f-JDx5RviUBYOtoZFAg>
 <xmx:EuC2YMEHRsLkx0aTScjZxzYcZJukrbwc5P_cHjsBlpyzMZK22Y62Pw>
 <xmx:EuC2YH9Pm6cAwZ4JAwfQXMP1SzZ8ecXyQpAgOjZtdUYvrits4yNMRg>
 <xmx:E-C2YGOPDTlo1clxDlwjhxK4fIYJDWp5bLTmaxvV4R1nK8LddSyRSg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 1 Jun 2021 21:34:09 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 0/3] ALSA: firewire-motu: media clock recovery for sph-aware
 devices
Date: Wed,  2 Jun 2021 10:34:03 +0900
Message-Id: <20210602013406.26442-1-o-takashi@sakamocchi.jp>
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

In a commit f9e5ecdfc2c2 ("ALSA: firewire-lib: add replay target to cache
sequence of packet"), I categorize devices supported by drivers in ALSA
firewire stack in terms of the way to deliver effective sampling
transfer frequency. This patchset is for the devices in group 3.

The devices are known to have problems when ALSA firewire-motu driver
handles. Many of them generate sound with noise. In the worst case, it
generates no sound.

The devices interpret presentation time to decide playback timing.
Unlike the syt-aware devices, the devices interpret the presentation
time in source packet header (SPH) per data block, instead of the
presentation time in syt field of CIP header.

Current implementation of the driver processes the sequence of outgoing
packet by computation according to nominal sampling transfer frequency.
However, the ideal sequence is not adequate to the devices, actually.

With this patchset, the drivers are going to replay the sequence of
incoming packets for media clock recovery, instead of nominal sampling
transfer frequency. For the detail of sequence replay, please refer to a
commit 39c2649c71d8 ("ALSA: firewire-lib: replay sequence of incoming
packets for outgoing packets"). The sequence replay is done by two levels;
the sequence of the number of data blocks per packet, and the sequence of
SPH per data blocks in the packet.

Takashi Sakamoto (3):
  ALSA: firewire-motu: use macro for magic numbers relevant to IEC
    61883-1
  ALSA: firewire-motu: cache event ticks in source packet header per
    data block
  ALSA: firewire-motu: sequence replay for source packet header

 sound/firewire/motu/amdtp-motu.c  | 136 +++++++++++++++---------------
 sound/firewire/motu/motu-stream.c |  27 +++++-
 sound/firewire/motu/motu.h        |  14 ++-
 3 files changed, 104 insertions(+), 73 deletions(-)

-- 
2.27.0

