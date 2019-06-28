Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C42593D7
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jun 2019 07:55:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31EEE1676;
	Fri, 28 Jun 2019 07:54:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31EEE1676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561701332;
	bh=hKfFkK3F+o862y2mAWKua4cIQ6B2W9UPwx6F39kaN7c=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Tu6rd2JWTCMaxkm3Qyb09wAIEkJheyG7PoAUqhZENF/LvwANcVy49rqrzYX3HE1Jw
	 A1m/TEH1Qf6VRWBMcIskr44gEV4H4f+tDzNULlTWcFz88wYVCCQ9ZGk00Ns2nrcZL1
	 JZwsXfksfScuLQjFlB+f8aua516rnmLJLK+KJ9C8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4524CF80058;
	Fri, 28 Jun 2019 07:53:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69A6BF896CC; Fri, 28 Jun 2019 07:53:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B6172F80768
 for <alsa-devel@alsa-project.org>; Fri, 28 Jun 2019 07:53:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6172F80768
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="n0td3ctC"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="MxqciWFI"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id C565A21391;
 Fri, 28 Jun 2019 01:53:36 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Fri, 28 Jun 2019 01:53:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=iAxYG95/0KRO98gCk5Fhnolk9B
 KYFamHhqleGfvP2xw=; b=n0td3ctCv+XgH+7ajxy+qV4KaSLH9+1mkRvR6P3wUr
 d4CP34+YezA2Qw7A3L5dA9pXnVf4HU8Ch5cI+pv2AXC1WhbWzMBT+V42a2k85oKe
 HpbKZJyUL/N2jOZ9ONe7aEWj3yTYVMy+NaBBdGPgK5Rt+4lAjuvgaAK0QXANeceY
 KAx0Zxm+he/UyMzTIEw8Zqs7/PaLR1kfhi80r5egkNZ6L8AnH5Ovy7l+gKkq7F2L
 Lj0kB9SaRLvS0Z5WcNAh+gU9z6DRz61WQlvT53MFka/oBSfWyc+hBjJlEzRxU9ib
 4IEKl5H7VfwMJegHnZoTb/gRAtaZvX773rdgLiZcbJiA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=iAxYG95/0KRO98gCk
 5Fhnolk9BKYFamHhqleGfvP2xw=; b=MxqciWFINUZUXNKkaCix4CH4cfLf6jaoV
 nc3tRN4uZLeu8R7qm5lwWpPd5z5FbtFny+q7dPPdKYnCTOSrM2AblUTl4V+uERP9
 bP52RrJWo99BP2IRJi5iNY7BKwhyubkZIzTHhmXPHqrlb/87VO06MiTaKmhM4OT9
 tK5ZTnymEcI79rWV/L0HoHDQOlwWLLSy6LRHTG2TEfzEllPAIOqIkNqwvn6hxR4Y
 Bs9QoHjlV+Rgk0HpCGi/vu0r90yk9S6ECZM4lAn+WZOofWYXInW/9TYxSVcgwLlz
 F7x9Dn50HW2Jt1C3VM16b8uFmCtYCCW1WlAui/V85I8fzp7oqMPTw==
X-ME-Sender: <xms:X6sVXcBpDs50DtY2M8YZbAvHGERhycLEF3LtiGVqRvBX7Pmj8Tf9Ig>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudelgddutdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhh
 ihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedunecurf
 grrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdr
 jhhpnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:X6sVXSdG3EfQjPTn_ZQuMLi9s1Hy8vlfDPFoe5e-vr836aJNOKNv-g>
 <xmx:X6sVXUKfuwGe6pJXRKZOEiEWzXuinVRMEZ-P0T8R5eIuSAAkQF6SoA>
 <xmx:X6sVXaskdnC0WXoAL6jOwEaAr4EgET_hlBOm3w2oQDJy6H-D9pAUhg>
 <xmx:YKsVXRXLNgX5jP_bfU-m4hFJvWNoXwU6A0iuFQmdtYQfj-Nt0IG1tQ>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id ADAEB380074;
 Fri, 28 Jun 2019 01:53:34 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Fri, 28 Jun 2019 14:53:29 +0900
Message-Id: <20190628055331.1427-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 0/2] ALSA: firewire-lib: fix miss detection
	from MIDI conformant data channel in AM824 format for IR context
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

This patchset is a fix for a case that AM824 format is used with
non-blocking transmission method in IEC 61883-1/6.

The recent changes for ALSA IEC 61883-1/6 engine brings a bug to miss
received MIDI messages in the case due to wrong data block counter for
calculation of multiplexed MIDI stream index. This bug mainly affects
ALSA oxfw driver.

Takashi Sakamoto (2):
  ALSA: firewire-lib: cache next data_block_counter after probing
    tracepoints event for IR context
  ALSA: firewire-lib: fix to process MIDI conformant data channel for
    AM824 format

 sound/firewire/amdtp-stream.c | 58 +++++++++++++++++++----------------
 1 file changed, 32 insertions(+), 26 deletions(-)

-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
