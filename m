Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6FF395412
	for <lists+alsa-devel@lfdr.de>; Mon, 31 May 2021 04:53:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 26091850;
	Mon, 31 May 2021 04:52:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 26091850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622429624;
	bh=tnXbaJOxQO7iuuqZqtKagRUfHlRz1kpl5uInQ0W8K9I=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PoayqiFGthn3Khk86Ndoz+Aqpu9AJSibgs0n4NoiNcKls4fXnnUKKbynFCOXCgQVC
	 Xit8qB4+8nKzK9BFshWlYpevzWyR+Zz7vRDyqTCvibXiYZSl5lcxNGPVHJMZDB8Td5
	 PuU2rkqwOlqxvRcH4M2HM70c6waucNQ7uJuemdXo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3B9EF804BB;
	Mon, 31 May 2021 04:51:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 05612F80168; Mon, 31 May 2021 04:51:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DA2A9F80168
 for <alsa-devel@alsa-project.org>; Mon, 31 May 2021 04:51:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA2A9F80168
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="SunhTiOy"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="RxV8tlLw"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 1D5515C007F;
 Sun, 30 May 2021 22:51:08 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Sun, 30 May 2021 22:51:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=hwAYsVtnLQoxhEWOsdCXnCi1oi
 FK+dTT/1QpLVTX0rk=; b=SunhTiOyGTZ+n1eYYDgCwRSsNWdNoywtB5wcgWMaCE
 sykMUIJ/UCltNI4HwvuZKnRAaRmb8TaQiUIGQIGbpHAKevdppCT+swZZ/qCUVSYN
 lBEYx9z8L3yQXhzuGHJOuYzZkYTuZxG4FTVVS9hgyDbo4ALKWDPFBboWxkIXZ0+B
 ReLs/czr1FJamr4khoo65aaH6JnaHowbBp8syelWB/lZJTOqAWspKMH53nDale+V
 pUkGdRascgw4gZoDG8Wh1l11c2md4WK9f13DnZKKgbSn1HpZVYZuZmnfutqKoIi3
 /CQ3OPBl3q9jcprKcm/3813Bc8jybcdAoSLC14npLoAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=hwAYsVtnLQoxhEWOs
 dCXnCi1oiFK+dTT/1QpLVTX0rk=; b=RxV8tlLw4s1YBp+VYOR5FCy4A530rM4xN
 VIJWws8LIqBmnLQs3AjenlWse0F93RumIJx85wpT3rxkR521GSEHPUuPyWnzRzMl
 f6nbhx9YonObGj5Zwz5UoIRM+5iIQmyTqEGINl9d2d9fpMI67Z0CJIWPYoODKizE
 KJUkFRQ5gtALTaIKbb1y4fb07SEnlOurGLOHtqOSvXJ/z5r9qCPQLyXxfzR1t+oo
 fWs/YTlvXhgK4vbAzYxQY0QX4J/jLgU9T82ukYRg5XnU8Sfg0DvWwEsMrqnDTmyD
 HXwbqbWXoWyzL5I/JIqPgZ8ynlT8mclpWhNWRUN8Tw0lh4tqTaiUg==
X-ME-Sender: <xms:G0-0YGl-V6QLTLQhSjUvmvFksdVX0mDvGwBIkH5mEGR8UqVigxwHmQ>
 <xme:G0-0YN1ElXO39R7Rf93savm4qmWaADjsU26RfTvKV5RxdQ8gD8x8hEf5lnnN8FOUw
 TF1lFiRh3f9l6SI1Xs>
X-ME-Received: <xmr:G0-0YEo4iWsXE0yYV2Ji44El1KRqJvkFocwovVb56F25P0iT47iSPLrnyXovT9yLz1zwnI65Nwu74GKHfL5FJ43O5EF8zjigd1kAc9sBHREYZtdeiCrb>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdelvddgiedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhh
 ihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepudejteelhfdttd
 ekgfdtueeilefhgfetjeejheekgeevuddvveegieehueeukeejnecuvehluhhsthgvrhfu
 ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkh
 grmhhotggthhhirdhjph
X-ME-Proxy: <xmx:G0-0YKnfGmdOk_ilzo8aC-EDasMBpfBpfjFcjcgYbcAl49MCuEtUmw>
 <xmx:G0-0YE3VcgVyYTfJKmslh48mrSm4h6K1gzJ381z-zKthqVfJOTNczQ>
 <xmx:G0-0YBucamcnFmvhYkmFinhFioplL3lTrVtCSFA8Jsx3MrUA2W6QSQ>
 <xmx:HE-0YB_XJGEqO6zRAJs2D--GazybfI__fF9XDMEZTlxNaCOkzoN5qg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 30 May 2021 22:51:06 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 0/6] ALSA: firewire: media clock recovery for syt-unaware
 devices
Date: Mon, 31 May 2021 11:50:57 +0900
Message-Id: <20210531025103.17880-1-o-takashi@sakamocchi.jp>
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
transfer frequency. This patchset is for the devices in group 1.

The devices in the group ignore presentation time to decide playback
timing, therefore drivers to handle them can ignore processing
presentation time expressed in syt field of CIP header. The sequence of
the number of data blocks per packet is important for media clock recovery.
With the patchset, the drivers are going to replay the sequence. For the
detail of sequence replay, please refer to a commit 39c2649c71d8 ("ALSA:
firewire-lib: replay sequence of incoming packets for outgoing packets").

Takashi Sakamoto (6):
  ALSA: fireworks: delete SYTMATCH clock source
  ALSA: fireworks: perform sequence replay for media clock recovery
  ALSA: oxfw: perform sequence replay for media clock recovery
  ALSA: firewire-digi00x: perform sequence replay for media clock
    recovery
  ALSA: firewire-tascam: perform sequence replay for media clock
    recovery
  ALSA: fireface: perform sequence replay for media clock recovery

 sound/firewire/digi00x/amdtp-dot.c          |  9 +++------
 sound/firewire/digi00x/digi00x-stream.c     |  8 ++++++--
 sound/firewire/fireface/amdtp-ff.c          |  2 +-
 sound/firewire/fireface/ff-stream.c         |  6 +++++-
 sound/firewire/fireworks/fireworks.h        |  2 +-
 sound/firewire/fireworks/fireworks_stream.c | 18 ++++++++++++++---
 sound/firewire/oxfw/oxfw-stream.c           | 22 +++++++++++++++++----
 sound/firewire/tascam/tascam-stream.c       | 21 ++++++++++++++++++--
 sound/firewire/tascam/tascam.h              |  1 +
 9 files changed, 69 insertions(+), 20 deletions(-)

-- 
2.27.0

