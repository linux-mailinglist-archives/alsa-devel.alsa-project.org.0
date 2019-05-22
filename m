Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3466E2659B
	for <lists+alsa-devel@lfdr.de>; Wed, 22 May 2019 16:23:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B74381669;
	Wed, 22 May 2019 16:22:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B74381669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558534986;
	bh=F0a6uWEhBoT41hptU7e341dyzdEDynSxrvJ8ZrhrXUk=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=eQSmMiIPu4atRmM5AzYo3n9cRCXTkVjO+lUHB/y2FK8DuRQZRGYnJ+RZSuOT6yESk
	 e0oVYZDCgStcRMsoOxg02IPKvPHxsxhtJHHa8XYmCQRHXLRRwSCH0Q1KiuYrTj2xn7
	 6QBChn7IcwiUB7wD8G4baabYzB85O7Rr58W4AjUY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7EB5CF89747;
	Wed, 22 May 2019 16:17:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 78234F8972F; Wed, 22 May 2019 16:17:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 50B21F80C20
 for <alsa-devel@alsa-project.org>; Wed, 22 May 2019 16:17:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50B21F80C20
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="EJ4MRcp6"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="IKQvb9lX"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 6FCDC248EE;
 Wed, 22 May 2019 10:17:14 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 22 May 2019 10:17:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=VK50tZoLFW0l2kXFOuCfvgOa4U
 BZNqfWZnx1mSFch+w=; b=EJ4MRcp66TTKnQQKotZyXUAnBrw0iW7oRtQiJmCxuO
 6Gs5lbh2bvIrVzv/qq4adO55XUHqmjT0xLsR+Cb9laF3OL03tLcwexzdmZh2icRQ
 Gx+4wJwGcCq+MlMPKXS6DV/uBVALV5hMrYPVF6kk+ayVxZJ525Hb12XBkJofUyQf
 OEDS7+BbWTtwRxhwbygzIz8t4SBuncLW45Jabsyj7vVXXzD68y88LjPYP28x931B
 c+zo063XdmjFdVHa5+pLJfraWdp1FKT99YywpWtWbUFXGL/xuofAi73+Ahf9dJHR
 NCj7FrsTBn/25J1x9So+hW8GeJJRTCzkSAyanrrld3bQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=VK50tZoLFW0l2kXFO
 uCfvgOa4UBZNqfWZnx1mSFch+w=; b=IKQvb9lXHZuwhO99seUlAv8M/M0N/relS
 EwcG0p3vTlgVWvVmlfwvCuRdLV5K9XI7Y9f47KLlEcOCAElruuh1604fpNBAFGgx
 9sZQ4G4WLzh9Ex8WxE/8IpNxCgTErdB56t923n4BgOvC0kUYjxe1BfuKACjO6nLu
 KEN1wVwR6QIx9CnveG/Uu/ywxbCcOF3JJxm1Za+jz/CptLwJ/NnR8eX7L7GVNS+i
 NcmAxHhDSoKg789o3nFJKrbpHmHyzurvWySiBn19BEXoShO4Wmzb43QCjBfcijme
 g0M050/klwxmOKkY/iaKEsJmhpzBJIcvTHCsYEH9VI/168F2BzY7g==
X-ME-Sender: <xms:6VnlXNXxoS1Ez_egmYHTWhampbQtpg1C8ZzGKqIGs90gsyFDIPi2eA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudduvddgjeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhh
 ihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedunecurf
 grrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdr
 jhhpnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:6VnlXEil4bf6VL6-i1r1NyUVbrlJNHaB2pK6ipiRFYHnU0PhZgbEkA>
 <xmx:6VnlXOgruZVSupW5cj9yRInK3ugStIzePct8pEKdVbLKeFC2hIooLg>
 <xmx:6VnlXEuwQnxYd4Tzk1W443_ZhZo0vIbPW52N1h7HgcMmKFobVstGnw>
 <xmx:6lnlXDrGd0XDx-Hhf2kUhHpKMEreN8ozS3-y_0QtNNG3RqTVRaWeyg>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id A2DD2380086;
 Wed, 22 May 2019 10:17:11 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Wed, 22 May 2019 23:17:02 +0900
Message-Id: <20190522141708.29159-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 0/6] ALSA: firewire-lib: unify handlers for
	incoming packet
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

In IR context of Linux FireWire subsystem, some quadlets of packet
payload can be handled as a part of context header. As a result context
payload can just include the rest of packet payload.

This patchset uses the mechanism to unify handlers of incoming packet
for with-CIP and without-CIP headers.

Takashi Sakamoto (6):
  ALSA: firewire-lib: use clear name for variable of CIP header
  ALSA: firewire-lib: calculate the length of packet payload in packet
    handler
  ALSA: firewire-lib: compute pointer to payload buffer in context
    handler
  ALSA: firewire-lib: split helper function to check incoming CIP header
  ALSA: firewire-lib: use 16 bytes IR context header to separate CIP
    header
  ALSA: firewire-lib: unify packet handler for IR context

 sound/firewire/amdtp-stream.c | 180 ++++++++++++++++++----------------
 sound/firewire/amdtp-stream.h |   8 +-
 2 files changed, 97 insertions(+), 91 deletions(-)

-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
