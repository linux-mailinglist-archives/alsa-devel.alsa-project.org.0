Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BEC538DB32
	for <lists+alsa-devel@lfdr.de>; Sun, 23 May 2021 14:43:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85BAA167B;
	Sun, 23 May 2021 14:42:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85BAA167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621773779;
	bh=dflXr8wLbdTN5Y5OxEMz+mqauAfzFusAd5VOEZShayk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kEj/1v5ofvVn8Xyka64qushywUgJZHQHqwljTCc9p2F21AyiHvfRcr2AYd4QJ8ou0
	 EbH9LGkjkglDim7Y2JOa75qEUgLw9leK+0WZYJuJIbqopxhdxSH6jikjFXizl0Gh8o
	 V1wahIPdyX/O69AX9ln0wPRgc+HoMeakO8kvseqg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 14DCCF800DF;
	Sun, 23 May 2021 14:41:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DBC64F8026B; Sun, 23 May 2021 14:41:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7D9D3F800DF
 for <alsa-devel@alsa-project.org>; Sun, 23 May 2021 14:41:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D9D3F800DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="M3jpK7i3"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="mqf+vQ6d"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 605A8E7B;
 Sun, 23 May 2021 08:41:19 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Sun, 23 May 2021 08:41:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=03NdAVDEukhlIrXjsY0bseozuj
 p8nsn7QD2YDVhTJ24=; b=M3jpK7i3w32zZKIca1pSIjzwbI997k7DaJYtyuI9dQ
 cgkD/hib28UsnidIO5sSjQCNmhhTK/PgQw+B28tZJ3hmzh2iTEyCrfgSzITVmxeL
 67yjJo50sfagFaWVhzHXa/9a5bcQXxx7oLnUDfOiuvT8+05mm2Mb3ZWIGfPFLwpT
 Jumr4C80+x264KYKXv9+6BSBgAd5T4+OU2n2hcVCTA5C6hIqAAaONL/Ws0MIorFg
 QGjPkBHxAy+l8eX/NFtWAZDafllrccxn7rNp9FCspTE3MBCqznCen8ulBSVWDoT8
 1JCppxjox1bXsaEBBRZXbc5AMCqqNaV9+CZ4ZDl1d3Bg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=03NdAVDEukhlIrXjs
 Y0bseozujp8nsn7QD2YDVhTJ24=; b=mqf+vQ6dxhM803M7YoSUr4Q8ApnYdHHWl
 Lj9QkErAlu5d3a+8OHNBVLhNfK9FexVnWOuDLkwS61vMwedBPde7ijGlh3WkfH24
 PkyCZYUUunvUtFxyU7/Cod4ZrmysXgh1GPdpzv8vhE+zxyw4RDZHBtCQpeRfivfx
 ytoSlGNJmAX84UXdTxsmJzhbQ94VeTcahp7V8wX557nWvqV9KJBqItRVKpjOd3du
 dkJBcmVHXgl/qu9+SUDymk6DMp3DJ+qXf1nbPBBoofVWuWrRJo9iFS+a1uZhoTgd
 At2NT3th8RVmggT9TPkOKmjZYpNyHcGffnO7nltcSCDxJD7DgEQ8A==
X-ME-Sender: <xms:bk2qYITtPW1LEbHoFw-mKBzHoTkzcIz8gHY9YSlY13KSX-Eeavek8Q>
 <xme:bk2qYFzVaNx-F_npbx58V8V2EHyG5AhTkbdhc_vUSujVSwGZgua5VU1CvhQz8K1_9
 xZlZjOnXG3NCM7OzkU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdejjedgtdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhh
 ihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepudejteelhfdttd
 ekgfdtueeilefhgfetjeejheekgeevuddvveegieehueeukeejnecukfhppedugedrfedr
 ieehrddujeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
 homhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:bk2qYF3Yg3jbT6yizk2K2whLbxdh8N_p9UpC1vQPjG8i05CMjRJBjw>
 <xmx:bk2qYMAZJiWVuynDiTHuxvXBF-ZM358z-qWWulFs4_IQEzuM8nLsTA>
 <xmx:bk2qYBg7n4WDRa-TgQRJVALxSJFWZY6Zim1gIfG-ZWbNOqlMWfD77Q>
 <xmx:b02qYBLEHp20V95qYKEroLt61QcWMS4NHFCjNXRnkkjdnr1qRGwMtA>
Received: from workstation.flets-east.jp (ae065175.dynamic.ppp.asahi-net.or.jp
 [14.3.65.175]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Sun, 23 May 2021 08:41:17 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 0/3] ALSA: firewire-lib: drop initial NODATA packets or empty
 packets
Date: Sun, 23 May 2021 21:41:11 +0900
Message-Id: <20210523124114.272134-1-o-takashi@sakamocchi.jp>
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

This patchset is for convenience of ALSA bebob and firewire-tascam
drivers.

The devices based on BeBoB ASICs or the devices in Tascam FireWire
series transfer a batch of NODATA packet or empty packet in initial step
of streaming. To avoid processing them, current implementation uses an
option to skip processing content of tx packet during some initial
cycles. However, the hard-coded number is not enough useful.

In 1st patch, ALSA IEC 61883-1/6 packet streaming engine becomes to drop
the initial packets. As a result, The tx_init_skip_cycles argument of
amdtp_domain_start() function changes its meaning. In the following
patches, ALSA bebob driver is refactored.

Takashi Sakamoto (3):
  ALSA: firewire-lib: drop initial tx packets with NODATA or empty
  ALSA: bebob: cancel switching connection order
  ALSA: bebob: distinguish M-Audio ProFire Lightbridge quirk

 sound/firewire/amdtp-stream.c       | 130 +++++++++++++++++++++-------
 sound/firewire/amdtp-stream.h       |   3 +
 sound/firewire/bebob/bebob.c        |  10 ++-
 sound/firewire/bebob/bebob.h        |   1 +
 sound/firewire/bebob/bebob_stream.c |  25 ++----
 5 files changed, 119 insertions(+), 50 deletions(-)

-- 
2.27.0

