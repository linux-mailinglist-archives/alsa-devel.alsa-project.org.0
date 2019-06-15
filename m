Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE1146F41
	for <lists+alsa-devel@lfdr.de>; Sat, 15 Jun 2019 11:17:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1678C1899;
	Sat, 15 Jun 2019 11:16:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1678C1899
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560590228;
	bh=FIIF4bKdwFL4vp+dW4tVg57GsF64J4ZstNxBbezWKls=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nBHVBxSK+AIF7/PWx8ixVw5c/avoWE9tgcXzpNKZW6jTJ9L6wZ0ugRMhuYXdplot9
	 JOVlPb72KaNrGCpQn5v3EWklAEOkSY7u9RKjiw4mEtg33/NP+92iYPiSM5L05rneUT
	 0aM9gikoD+kFpFuNOxkBL3Dz9CcK58z/qNokuzxU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F246F8974A;
	Sat, 15 Jun 2019 11:11:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EE676F89745; Sat, 15 Jun 2019 11:11:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4FE9F80760
 for <alsa-devel@alsa-project.org>; Sat, 15 Jun 2019 11:11:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4FE9F80760
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="CT1NEWyl"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="KoXX7gRL"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 376E547E;
 Sat, 15 Jun 2019 05:11:15 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sat, 15 Jun 2019 05:11:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=CXA0Yh2sTe2di
 il0XxUJoDBYUcghH7reB3RHGnCUCk4=; b=CT1NEWylDu3Pwq5d/XDIQP0PW0tLU
 tRPc35Dn5LJNokJHd2J7B4lLRQm+X1pt0S13WayZ1j3aIMjTfwndvIKDLhdNLloM
 RQyflRhJo5VD/ms0EaEN3hI/kk2Os9P1SDJ0attAVs2z7esVm/8A0jD7tmCNLAwb
 1BwuPBTlxg2GUF/Tt2Y084rgVZn0tsgpaFGdIZ/infL4zHpZ+FVoiapbOTkGKB3e
 Dsib6BUum6qpfPNpwnpCF/5zZ/sqCJ5V8d8/3QgNvRdjucbCVP7C1tGsMxVeu2Mo
 UUz/kcd7Asc8IcRnDcwVEBBJnPFQnEuMAB1cQhZCfMAl2woSISyWLIZWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=CXA0Yh2sTe2diil0XxUJoDBYUcghH7reB3RHGnCUCk4=; b=KoXX7gRL
 sL/b/dM3+Ra6QBX4A2BVvjPTnU/os3l3UUEFSxWyBK3aKzwqklTBdHo6YWy1HoRa
 lItMAyxrQTCn6WAXd/JGCiRLArF4uEudZKFHqugjFcegYeoXOrF6+vFO8IyJrpF0
 3ZFL8xkafXb7HLS97OnmOEyWWFl1p9K/K4y0DX4Q2cNrEibLBxxiTyli+N82vjPV
 lgcGSJgwlv+/m6eHrYOCFPS7Jl48pM5tSqFu9uhBX4UCDYuV4AELp7TrWmQptE+k
 Jn4LTW7ipjylybC7KEQs6o0mHLu9IzVe2A/lsXjCQMiq62ZNiONoU2vYlQh+IjPN
 wUyPYzE5w/5qnQ==
X-ME-Sender: <xms:MrYEXcw2GaCRGtezHKXBGiLbox1VgkNkvb02ZORgkXEs3WASte3_nA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudeifedguddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:MrYEXSIF9qBYyvJPNWJcMVRzBkeTmQ0EorwmoDR5_QuIWmORYoqd1Q>
 <xmx:MrYEXS_4dNOJH_tQEs2_rpKv0KzkKgPCiwGEItCqz30hLhudOJ5CAQ>
 <xmx:MrYEXZAuhUByPLWEUpPo30heaPlLi_6L_ZtCsAvzKOaIKGf2wRjQsA>
 <xmx:MrYEXXL_GNCB6U2Thb3bOFcfFQW4xsik3aJDX4GNT6sMHJPuDiyxiA>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 61FE38005A;
 Sat, 15 Jun 2019 05:11:13 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Sat, 15 Jun 2019 18:10:59 +0900
Message-Id: <20190615091101.7515-5-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190615091101.7515-1-o-takashi@sakamocchi.jp>
References: <20190615091101.7515-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 4/6] ALSA: bebob: code refactoring for error
	path to start duplex stream
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

This commit removes useless procedures to stop packet streaming.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/bebob/bebob_stream.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/firewire/bebob/bebob_stream.c b/sound/firewire/bebob/bebob_stream.c
index 6aab3dc99bef..9ef4663d13e5 100644
--- a/sound/firewire/bebob/bebob_stream.c
+++ b/sound/firewire/bebob/bebob_stream.c
@@ -650,8 +650,6 @@ int snd_bebob_stream_start_duplex(struct snd_bebob *bebob)
 
 		if (!amdtp_stream_wait_callback(&bebob->rx_stream,
 						CALLBACK_TIMEOUT)) {
-			amdtp_stream_stop(&bebob->rx_stream);
-			break_both_connections(bebob);
 			err = -ETIMEDOUT;
 			goto error;
 		}
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
