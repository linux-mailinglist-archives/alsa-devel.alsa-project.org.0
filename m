Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3172942D
	for <lists+alsa-devel@lfdr.de>; Fri, 24 May 2019 11:06:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0319416AD;
	Fri, 24 May 2019 11:05:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0319416AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558688780;
	bh=ExBVNoeGJR7+VxynLu7OSVvy9RtEwgDGut7W/ia1mYc=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=eFZfS6La030AgBitzV0OGOGbgU6a4CJJnlNqo5y50JnhMDljQ6ujysL4aj2aL/3Rk
	 Ya2UKuL4jWHn6xYDjRxwtiL60wryZbJ8I2XwPE95ExZ2DaK0bgvBWZYOsGmgzty9A/
	 R2HyaGwwLbhCDuRZ9ppxmBVQvgAYPT//AzefQEWE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 71015F89718;
	Fri, 24 May 2019 11:03:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A003F8962F; Fri, 24 May 2019 11:03:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C0737F80C0F
 for <alsa-devel@alsa-project.org>; Fri, 24 May 2019 11:03:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0737F80C0F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="kMn0HHVO"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="0ctGhMmt"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id B04BB21B4C;
 Fri, 24 May 2019 05:03:48 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Fri, 24 May 2019 05:03:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=yyMq5buRiTbMnq0Zxz1uKILg8h
 BCxzhVgctUL3m0kdo=; b=kMn0HHVO10aibMBJQpPjS6qDsfYHLlvdgzLGr/I4oD
 mA3bDmDgz+jYRuJqUgj3B3/dh2Qs4PwyxixvWKn06zCQqnory+5fr/PKF+DZPbWD
 bq3wI49EGEbT84u6zNwXlDfa7+VwDfzAxO+W+ZfjtynLZC9kskUotdq6hjdRgRVZ
 Ug6Sg9+bDahaCV3cSD9KXNmgIo456zJahl81ra+wsxL9pVMky2+NncUXq13vjIyH
 2D1UYi/yv1X3Nlllnbi/xWb2Sb9pnx3ZQgn/YXvNOxtNAXkjHFzVC5NpoLirKsOU
 t6tKWDW4esbYDybto2nDLsVeHDBoTEfpDwL7LcGIjiWw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=yyMq5buRiTbMnq0Zx
 z1uKILg8hBCxzhVgctUL3m0kdo=; b=0ctGhMmteGqPxxG1BCUl/W/OwZAQNuCyd
 a0dWHJbGi40FcaB9Bqj9nZRO6esDTgVUxvmA0uEK7bSZMb6w1WLyQdThoL11+a+f
 vi2NqQZpIDCM9GmmdongwVtSUqk97LpCjM5+MxnyCIm5SalEfYl9QwTAoe1MECnY
 bfQlHVw/5tgbX0IqnF6ond2Ecsfii5q9iv6tfBz/r55hyC+wMVojz7JfRxUgwI/q
 FH6D8FLzO+6v2ZXBZWJdT4EG98rFhrMoiG4xNIW9HRBotvngZ54tUbL+5cdtZR3W
 wzWBWqphkPNgVyDp4OHb4jaxldFe7593XO141QnQxtGzRixYfEiwg==
X-ME-Sender: <xms:c7PnXHNFv26smOA32z7OzFIZcm9cngGcGV8_mujqZosauiz3-u8yeg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudduiedgudduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhh
 ihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedunecurf
 grrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdr
 jhhpnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:c7PnXPjp_h61SsKsG1epeHqQc5w4pSQYd5L0UaRrrb4fw6q8Iw7Lfg>
 <xmx:c7PnXHlG-8HjIvXIQBu4zQsq5LxKshOyu_cFEH-PP8ikD3zFsFD7Ww>
 <xmx:c7PnXGFc63a7LW0tv-Htta6gz9BGiXy1-l2r3cj0mUEsVs3fGOyWPg>
 <xmx:dLPnXDSFLEwQQOtuQyIlwblxI-c8Q3rlIQvq2cZScPpXsgM7qbXTTA>
Received: from localhost.localdomain (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id B836D80061;
 Fri, 24 May 2019 05:03:45 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Fri, 24 May 2019 18:03:38 +0900
Message-Id: <20190524090342.15619-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 0/4] ALSA: firewire-lib: bug fix and code
	cleanup for packet streaming engine
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

This patchset is the last part of refactoring for ALSA IEC 61883-1/6
packet streaming engine. It includes two fixes and two refactoring.

Takashi Sakamoto (4):
  ALSA: firewire-lib: fix data block counter for incoming packet without
    CIP header
  ALSA: firewire-lib: fix inverted node IDs for amdtp_packet events
  ALSA: firewire-lib: refactoring to obsolete IT packet handler
  ALSA: firewire-lib: refactoring to obsolete IR packet handler

 sound/firewire/amdtp-stream-trace.h |   6 +-
 sound/firewire/amdtp-stream.c       | 138 ++++++++++++++--------------
 2 files changed, 74 insertions(+), 70 deletions(-)

-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
