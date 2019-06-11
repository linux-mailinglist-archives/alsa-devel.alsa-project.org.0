Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D60A53CCD8
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jun 2019 15:25:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D6E91729;
	Tue, 11 Jun 2019 15:24:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D6E91729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560259504;
	bh=TmbYeSuog7Nx9484VQjYSDo9ZkRRlspTBazi6vV1jxc=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ex/xsCOoHJkn/EPGZrr6RDFhO66ZEQI1qgvZUNIU+gqJ5LN0eeU4ZMwolZovd5Ua6
	 O+e2X7dCh3N84F2lzMzaVl7KMJJaUJNFiqdHBaVcSWZiuWeajkwvAeGbFpv/U2n6Gd
	 tiklAWgKMnVX5bLOgykrxaPMXH0Hrs2ijKiFI+7I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B8A4F89736;
	Tue, 11 Jun 2019 15:21:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 52B90F8971A; Tue, 11 Jun 2019 15:21:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 74951F80791
 for <alsa-devel@alsa-project.org>; Tue, 11 Jun 2019 15:21:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74951F80791
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="T/xMHJks"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="nyfrkqwv"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 8FF092224E;
 Tue, 11 Jun 2019 09:21:28 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Tue, 11 Jun 2019 09:21:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=BEsvzyIImajGd
 +SUoyZ36pfMaZNIcBVbdwvTCZx04rU=; b=T/xMHJksOX5ukJBJdgMq6rWUL718m
 ywU3jhlN+YWI3ZPAAKGcaOSoQbz1jeNqXYzqVXpV3Ghr+tB/PX01xctfeCE+t+fr
 L1OceSwuScpZoc11M7oG/6a45VfVapbyLgDw1FeddnF8g1tgS164C6/RL1EG/AzZ
 BPMwUDNLbzyuCbMrVfvN7lRuLAFi8gYLLlZSTRK+5bUs+Ie3XNPfhJLNkIwVFtbW
 iUNItCSt8VJb+tglO7MKsSJNxfSgPdThbhAlwIqbK/JBi+ZiMMCC/5rowLawTdxg
 wOiACjqPypxa13Q8OiPPbRrqeAPgN9ULxmW7obRC211MAG//CAgnaB9oQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=BEsvzyIImajGd+SUoyZ36pfMaZNIcBVbdwvTCZx04rU=; b=nyfrkqwv
 ONPk4WfIsgfNm624T6hpYc7IeLg/gj2YMKGc6yv7m3PcWa+UR8h/AwELxU1iTCO7
 wjKZnjerSxE5WgaJzezIgv+pmIlk/fDO02jeQQDQ6TRG/iEj2lNSHNsCb64dfTT0
 VN0LAu34W9DxoeE6Dv5EN3PbO8eScONoJs7bqdPPKUtwpc62e6d97XIXr4eLhU65
 1wKTEaxUjjlq9wI6oAloI4627kGYCCVtP9CqJjII+IYvg+sDWjsnZyGwmAhgjUSC
 8W/UdykV454ZiydhkQ4NaCwVody/2YF2ZsZzWp3eOzauqnVq5xBbs6TlCZPxNt/j
 OQgiyKVQd10lqw==
X-ME-Sender: <xms:2Kr_XP_oMD7ESE4CRICcrJgmxAqvmAYM1EUzrtABFJKzKjswb9demw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudehhedggeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgepvd
X-ME-Proxy: <xmx:2Kr_XBze9p3yX0aOKEwLsxjYdjITHULMSHMAQKMvd_5JoPmPWPSuBA>
 <xmx:2Kr_XAQbA5jnmzPzICOz6Rs3Z3gBw8zjYwSOGvFpFP24IbiVMzIpaw>
 <xmx:2Kr_XDmw7hJRHAFcI2Qi4x1qtc79dIHEy7YoyMsJEWD6iPAc2-fAoQ>
 <xmx:2Kr_XO8X-PVY0azUY1wj7d5-ZC4u8H9VL8HVe20HQlOydUqQrC72fA>
Received: from localhost.localdomain (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 08D3B380083;
 Tue, 11 Jun 2019 09:21:26 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Tue, 11 Jun 2019 22:21:09 +0900
Message-Id: <20190611132118.8378-4-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190611132118.8378-1-o-takashi@sakamocchi.jp>
References: <20190611132118.8378-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 03/12] ALSA: firewire-digi00x: simplify error
	path to begin streaming session
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

This commit is a part of preparation to perform allocation/release
of isochronous resources in pcm.hw_params/hw_free callbacks.

The caller of begin_session() calls finish_session() in its error path,
thus no need to call finish_session() in error path of begin_session().

This commit simplifies error path of begin_session().

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/digi00x/digi00x-stream.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/firewire/digi00x/digi00x-stream.c b/sound/firewire/digi00x/digi00x-stream.c
index 90e31b63ac2f..8104af94aed5 100644
--- a/sound/firewire/digi00x/digi00x-stream.c
+++ b/sound/firewire/digi00x/digi00x-stream.c
@@ -159,13 +159,13 @@ static int begin_session(struct snd_dg00x *dg00x)
 				 DG00X_ADDR_BASE + DG00X_OFFSET_ISOC_CHANNELS,
 				 &data, sizeof(data), 0);
 	if (err < 0)
-		goto error;
+		return err;
 
 	err = snd_fw_transaction(dg00x->unit, TCODE_READ_QUADLET_REQUEST,
 				 DG00X_ADDR_BASE + DG00X_OFFSET_STREAMING_STATE,
 				 &data, sizeof(data), 0);
 	if (err < 0)
-		goto error;
+		return err;
 	curr = be32_to_cpu(data);
 
 	if (curr == 0)
@@ -180,15 +180,12 @@ static int begin_session(struct snd_dg00x *dg00x)
 					 DG00X_OFFSET_STREAMING_SET,
 					 &data, sizeof(data), 0);
 		if (err < 0)
-			goto error;
+			break;
 
 		msleep(20);
 		curr--;
 	}
 
-	return 0;
-error:
-	finish_session(dg00x);
 	return err;
 }
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
