Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EEFF4AB90E
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Sep 2019 15:16:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 630F315F8;
	Fri,  6 Sep 2019 15:15:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 630F315F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567775775;
	bh=8rOxmUngZ9d6ojf7tagxWyhPUVVqFFH8+FuEyeWS+tU=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IruswFWyg4r548NPFJKvbETqmHcFznTjY5SmPmvfN6HsjBSi8/0FZ7J1rVGPjwdw6
	 5thDtVj7cwvG4jbF72Uwsu0liTb/VCOYpIGiPySH6ThBy3U/S9hCFHTxteD5jgt2TB
	 3TqEsvF7xUnCWocOAWo+KawTUB5LXmBiWmKiTlms=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 07E40F80394;
	Fri,  6 Sep 2019 15:14:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C84EF80394; Fri,  6 Sep 2019 15:14:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F353F80214
 for <alsa-devel@alsa-project.org>; Fri,  6 Sep 2019 15:14:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F353F80214
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="sqxerFnb"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="fzxQ/BcX"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 94C6254A;
 Fri,  6 Sep 2019 09:14:20 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Fri, 06 Sep 2019 09:14:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm2; bh=oSLELcJJeY1zP2Y34hnOX5rO9z
 evlrvD1jyDwZPJZSU=; b=sqxerFnbhVNYbJ343yzbGux6gOkLsD4h4iH+UZwWx0
 RO+Z52A/a2dBJM994OngDc4BDggR0uLQ5O1Y+YZ3zqPozs6htO54ZCjmoScHAlqv
 l1/WL/+3bR0D13fMLSDtqwnDiq2z3ZI6gfSFk+CdrumTqdOUijCbxvc0H1SPU41x
 nWWRwvwr7t9iSe9tsOxW79f5rBJPmgFtPQulBx3kK22HMdSNnZ2tHP6ng/SulN2d
 on6pR2vxgJ2H/XdbYqB5Mp8eoSMaHNq9IuodMxzWzwCJOXMBOEmxzT92AnTL0Jb9
 H9aeXgp7rqtcfe5VsZicLQj/hxDM5OcQ1XVzW5txLeyw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=oSLELcJJeY1zP2Y34
 hnOX5rO9zevlrvD1jyDwZPJZSU=; b=fzxQ/BcXFqUW+GnAE8zI5eAj7n27yEw6L
 8fUfeEllHM+h6rktJypWp09SJ9clLAWb+JZqwnXsSv00135Aiy7xi34HASnX6PBs
 cVa71rl6zvqPOWmqWVBHLp1brVtebx+xzmI9dRFcgyz8yYliMtrm28CiJPYlXsW5
 UwOKTBOOC3KMPMIKF7bp32nvsKpHu9yjsAWXTdEVhR7g7hypmh+E27WYNku8tYHb
 5qV5CjNwReXJaaMJsGXW+DBBAmUwOWT85WJizkULBd/LT8BMdTOo64fo0tUAbfPU
 W9YDVPt3sK5S3tYaEawjviq5OA0iQxb3PelO4dKz1ZKprYNGdeC9A==
X-ME-Sender: <xms:q1tyXTuGzWsR7dF_cKZtNGt6lpNLNjTBu-ikB_hu4SZQPRWLkfCyKw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudejledggeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhh
 ihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedunecurf
 grrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdr
 jhhpnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:q1tyXRpeL0ltFRs4JDsYKWb-mhTIvBcl_zaskidb75Ie3uFEZt7-Cw>
 <xmx:q1tyXfW6sZgINwxJE9PiX-PDczJ4XkH4iaGdKzEuVKJ3C9V-AXY1Bg>
 <xmx:q1tyXR1WvDv_Hr_gN7drvP4HARB-2wuWQS-_rTWH2Jq6ChhI1woDbA>
 <xmx:rFtyXW-I4yBLwXzSIm8u3nTmn7bYI1E25wOruPplsdY03IrvLwBG5Q>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id E002AD6005D;
 Fri,  6 Sep 2019 09:14:17 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Fri,  6 Sep 2019 22:14:14 +0900
Message-Id: <20190906131414.15370-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH] ALSA: firewire-lib: remove WARN_ON() at
	destruction of AMDTP domain
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

The destructor of AMDTP domain has WARN_ON() for the list of associated
AMDTP stream. Although this reminds a case that developers forget to
program consumer drivers to stop AMDTP domain, it hits when AMDTP domain
is not initialized yet. This occurs when initialization of sound card
fails as well and it's superfluous.

This commit removes the WARN_ON. Although the API to AMDTP domain does
nothing, it's left for future usage.

Fixes: 3ec3d7a3ff106 ("ALSA: firewire-lib: add AMDTP domain structure to handle several isoc contexts")
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index 88270257e896..e50e28f77e74 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -1153,7 +1153,8 @@ EXPORT_SYMBOL_GPL(amdtp_domain_init);
  */
 void amdtp_domain_destroy(struct amdtp_domain *d)
 {
-	WARN_ON(!list_empty(&d->streams));
+	// At present nothing to do.
+	return;
 }
 EXPORT_SYMBOL_GPL(amdtp_domain_destroy);
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
