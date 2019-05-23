Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05303280CA
	for <lists+alsa-devel@lfdr.de>; Thu, 23 May 2019 17:17:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 899C91677;
	Thu, 23 May 2019 17:16:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 899C91677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558624635;
	bh=MuoB/d3aBYWjw7d165WyaE+SW/9hmvoytEKYEgoiylk=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Dn+pGlvNRqkBxV8I4MqGu1tDGizLzjlcrScsxaobcNuAlu4seLK7tD/SWPeOMNttq
	 lOfjzHxkcwuuWYIXBcCRG87paYUu/ycOinT0wZ99xLkhlG7HoHlXqKrNbwB4/4Wqpn
	 5jat3u0j0e9Xfw8pjZZAKxyh4zFfiaeMXMeJgp5Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 705EEF89725;
	Thu, 23 May 2019 17:14:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0E307F89715; Thu, 23 May 2019 17:14:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 428C4F8079B
 for <alsa-devel@alsa-project.org>; Thu, 23 May 2019 17:14:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 428C4F8079B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="ELjeFpm1"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="DLsL9Z+a"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 449AB37D85;
 Thu, 23 May 2019 11:14:46 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Thu, 23 May 2019 11:14:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=zvCQHTFN6Lr7uJ5iZNFjQ3vD8z
 Bt2NvxUXB42/Ij6HM=; b=ELjeFpm1RtAHnoKxIYY1GJ920gv1EjoIeKHqnXEPpm
 WgVWaJGQFk5SDhklOV7gp0k92uaL/2wul8q3gnfKTJljD3j+gDgnapOUWl2kzISn
 0hbRI59DgkfVzRMUwmnX43C9xKyFM+YwIu5bq4uEdEE8klE1t7ev6Rl5YUQ6mRVv
 NuHhxvqOBzRjudOk2meXWjSSztxk7n6grcd+9FBfWZH6cmn9nl3SuFaJ18fgVGPP
 WSjeTG3HW3RZMCzs+6B/hYQe4ZlqN1Bbhhbo+MfYTckl/veqX3ykiE/fJfuBMbDp
 For6MxKsAEStJYzk5n/5qNblPqVKPBtz8Bx6sbtXqUfQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=zvCQHTFN6Lr7uJ5iZ
 NFjQ3vD8zBt2NvxUXB42/Ij6HM=; b=DLsL9Z+aYwRy1rWSvm6CB2sQR719CuQ3l
 W/JznfCWYiD+Obt/aV9p9XZ0/vEH4bLvDc959JPL7el1PgFrZQDXeTyXcZw/iynu
 niYt2q7kIs8ODpDINpTo5SIb5JTI0CC+hbe/9VoGIfdLdXnNRFOOrUl/mpUNw9YM
 +A1w1iqiPNKWbCeVYMNkT+sZOtyFhtRxgQftccrZqbggML0ajKcq/hSl97NF8G4I
 laWmzi+3lil+K4VcJJGRpJgstuvSsbQgqQGz2VUE8Ul+gaN8tEViUBQEV9b4xc14
 S3jtYEiLGjq2Fal+ImzEIHnpe4cLLLeVJWSxf3JVz4CyNRrtrxKiQ==
X-ME-Sender: <xms:5bjmXIfJ6frjmik5awbdUftzEPM9OCcgX80Es8lhR24MOt1_btugKA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddruddugedgkeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhh
 ihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedunecurf
 grrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdr
 jhhpnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:5bjmXJ7tlfG8WA650ci9s2d-pztcDwynK0gwSghB5udsDpW4XWN3cA>
 <xmx:5bjmXEVm1PTAGrHPLHGxT0b_UAvuKGOcFQt7T7_tOdv4mtPRUhcASg>
 <xmx:5bjmXAZFPk5LzAp8hygMIe0NkuMEAjCxlsY5bFHEWdgFuTBbuRjxXQ>
 <xmx:5rjmXPfTNVJHRocvvNr7UM5LGr-bIavq8s2orWsBBhG6TMGNlm42PQ>
Received: from localhost.localdomain (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0978B380073;
 Thu, 23 May 2019 11:14:43 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Fri, 24 May 2019 00:14:36 +0900
Message-Id: <20190523151440.5127-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 0/4] ALSA: firewire-lib: unify handlers for
	outgoing packet
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

In IT context of Linux firewire subsystem, some quadlets of packet
payload can be put as a part of packet header. This enables to
use context payload for data blocks only.

This patchset uses the mechanism to unify handlers of outgoing packet
for with-CIP and without-CIP headers.

Takashi Sakamoto (4):
  ALSA: firewire-lib: split helper function to generate CIP header
  ALSA: firewire-lib: unify packet handler for IT context
  ALSA: firewire-lib: code refactoring to queueing packets
  ALSA: firewire-lib: use 8 byte packet header for IT context to
    separate CIP header from CIP payload

 sound/firewire/amdtp-stream.c | 150 ++++++++++++++++------------------
 sound/firewire/amdtp-stream.h |   3 -
 2 files changed, 69 insertions(+), 84 deletions(-)

-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
