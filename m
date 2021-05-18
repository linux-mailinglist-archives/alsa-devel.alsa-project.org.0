Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BBFF387970
	for <lists+alsa-devel@lfdr.de>; Tue, 18 May 2021 15:02:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B59A616E7;
	Tue, 18 May 2021 15:01:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B59A616E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621342956;
	bh=1KDkBT5d6ep9LK2fMKDwSMae3bz/hrmzn4U8WXf/D54=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=G9RRhDvDdnKg6gXaU4ac9su23boXAidZMai3ccMBI+TRyIGThpM1ly9MRuhR0L4Cx
	 P7rQuPb1KNkEgRPJ0/GHclgUZCVyG7xfJD+2zZdahq3QUN2sO5utPDAcg7U0qpMGId
	 FRI9VVZYF+VIipUHRGk5W3KDFSBu6EFP5h6IZg4Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 36F72F80424;
	Tue, 18 May 2021 15:01:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE982F8027D; Tue, 18 May 2021 15:01:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 53969F801DB
 for <alsa-devel@alsa-project.org>; Tue, 18 May 2021 15:00:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53969F801DB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="F7oWshe1"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="afGgo3ph"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 931A75C0216;
 Tue, 18 May 2021 09:00:53 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Tue, 18 May 2021 09:00:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=tMTYDVqRWxL3BXlTs1SocAhKQ4
 cJTYcFGwxJM3/5NTw=; b=F7oWshe148eNZ08KNPKkvftDCxFYj2/qa7XUhpOiMH
 VvQnkmUZ1KJiR+tvIRkGunmabgxiwfb7R33DQVBCczT1D3AUz0k5OEcYM8iM5UD6
 gj1zpxc71J8KU9TjBFkzkSjjUyS/5RMoB7AgWGkZMFoYthDYmFgFOXZ0jo/PbHoL
 Py4uhwqB/EyPPC4VzvR40IeqIm5Sa0BtlcFpPyugg972f1EpNBWsP9DquAfA8uoO
 DAhLW71/Cqjwq/tx00J/5INYqiFu0+tRzplY8f/SGp4FRqFUaaJR2LWc8k+SFje/
 2HCp47b0ihs3ni+19f6vtp+8ODUe29f48cKuDagkWLug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=tMTYDVqRWxL3BXlTs
 1SocAhKQ4cJTYcFGwxJM3/5NTw=; b=afGgo3phcUioy5OIH8QGYiIXuKyR+fsjK
 EvLCtl6EM7Vjr9t4PXzFtle/Mkop2UsykiL2cTEep8lxWHYSzH8gG0S3uR8w9Obw
 tJcZ6zN6wIJAj2/anLXDHFHfPPfR9ZL9MrFUvsytehFH+SV5Ve1cXTzuYgucCLpW
 XR6tSnbstXOULd4hGwRKwxdph05T6PiCkEZcqiQAH6WbaxOlBirACtzoKizfRtqy
 ca/pho2aMOW5AmtTNNQPi7wLOvYEuKAHiEUQPpPCT3tmfcEQFQgaJLeesj4rwSJt
 HlEw8023syrS5WR+8MVC2XQIW4ypeCvnYipYw8B3giX0HgRdBTOfw==
X-ME-Sender: <xms:hLqjYIwAqz24V9nRFjLOs1pEe25eaYus7OJvcObH4rnevbRvmDbj_A>
 <xme:hLqjYMQfUxUemxzSe1IO8EXXyZ6H2gdyCMhgHhgGruobTFMkklrZK76yx8UQs5N7v
 q9T4jw4j9h-JZHSJzA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeijedgheekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhh
 ihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepudejteelhfdttd
 ekgfdtueeilefhgfetjeejheekgeevuddvveegieehueeukeejnecukfhppedugedrfedr
 ieehrddujeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
 homhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:hLqjYKX2_vqoKI6UvO_DQz1ox2lVUP0RFYgcdjdeHF_z_Xg2tgHq8Q>
 <xmx:hLqjYGiuJquA4W_LKYTvF4ZNFb9uhYaH9qywkGT58d7cq-8tWIZKnA>
 <xmx:hLqjYKB2TdS3wkOIgXiQdrMqp3XRJu8tkytt_wr6-Hb6ff2cJTm7mw>
 <xmx:hbqjYFpjNP9b0PnlTdKL27FH7wpgs1R-tuyfF4-P5YfnmJyPJm1P8Q>
Received: from workstation.flets-east.jp (ae065175.dynamic.ppp.asahi-net.or.jp
 [14.3.65.175]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Tue, 18 May 2021 09:00:51 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 0/8] ALSA: firewire-lib: check cycle continuity
Date: Tue, 18 May 2021 22:00:39 +0900
Message-Id: <20210518130048.146596-1-o-takashi@sakamocchi.jp>
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

Current implementation of ALSA IEC 61883-1/6 packet streaming engine
doesn't check whether received packets are exactly per isochronous
cycle. This is required to process packets transferred from
OXFW970-based devices and devices in RME Fireface series. However, the
packet sequence with skipped cycle is inconvenient for media clock
recovery.

This patchset takes the engine to check cycle continuity at processing
packets, including code refactoring. For RME Fireface series, the skipped
cycle is handled as receiving an empty packet. For OXFW970-based devices,
the skipped cycles are acceptable but media clock recovery is hard.

Takashi Sakamoto (8):
  ALSA: firewire-lib: code refactoring to refer the same frame count per
    period in domain structure
  ALSA: firewire-lib: handle the case that empty isochronous packet
    payload for CIP
  ALSA: firewire-lib: code refactoring for sequence descriptor'
  ALSA: firewire-lib: code refactoring for helper function to compute
    OHCI 1394 cycle
  ALSA: firewire-lib: code refactoring for parser of IR context header
  ALSA: firewire-lib: code refactoring for check of CIP header about
    payload size
  ALSA: firewire-lib: check cycle continuity
  ALSA: firewire-lib: insert descriptor for skipped cycle

 sound/firewire/amdtp-stream.c | 172 ++++++++++++++++++++++------------
 sound/firewire/amdtp-stream.h |  10 +-
 2 files changed, 119 insertions(+), 63 deletions(-)

-- 
2.27.0

