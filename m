Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D66111F1EC
	for <lists+alsa-devel@lfdr.de>; Sat, 14 Dec 2019 14:15:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D55C61668;
	Sat, 14 Dec 2019 14:15:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D55C61668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576329350;
	bh=LidDspCz4Z8VOrJkyfnySBfynk+MUPo0sRGorPcO9bw=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MJd4Z9nwDGzQLTfJiYe2HZa7mPRV2vCv289CiKT1ElCLRhImNKz1XmRRu9tQbxFzb
	 IuVpOHIKpZqoblczeyMgFBPsPufmz/2aiiy3CY9C+tVGXQUBpobB6geUCSSDfqr7a6
	 6+nVXt1dNAfigp/kcdDR4xZO+LNQAXS2NDZreEZU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 841A8F8022D;
	Sat, 14 Dec 2019 14:14:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 340F2F8014F; Sat, 14 Dec 2019 14:14:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 11D03F8014F
 for <alsa-devel@alsa-project.org>; Sat, 14 Dec 2019 14:13:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11D03F8014F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="Rf/W71kM"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="JoEO4Mq8"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id E575C2271F;
 Sat, 14 Dec 2019 08:13:56 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sat, 14 Dec 2019 08:13:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=IYLZrrU8LhlJl3oItMRfUzwxky
 o4Pwwmw6hpTDf/D3M=; b=Rf/W71kMTs1x0YQvSOmTyTsg7VZVePZ7ERi4SgKmWG
 O3Vr5m1Y4VR5ZVgYEdsvUbZLBgTqcFR1k2vkZq5bbLGwgorKy5yYGAssYfel5tHc
 v2CpO/54eawQJfOqil/POOwB4OU5Lx3jzxGzkHf3dN1ZetMhz4j3IEqNt3/o7eEf
 Xl+rt1ZiP6MOTw0dLr1Anp7JjUgXlNp/FC5oMqKOa9GD2R03Ho7Wvk8vspAN0gpz
 AWoVyr49Kz+8t5ScMCNQTASVjR6YRuTKsTEIMdxGv5AMsz5RiSILpvDGUnaJ9m/m
 FC0mMR1xpHbx3AEfayklOa8B9eInBAbEk38hFGjV8hJQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=IYLZrrU8LhlJl3oIt
 MRfUzwxkyo4Pwwmw6hpTDf/D3M=; b=JoEO4Mq87GwQrvHmjqhN3BewEDky+cuTP
 pRIbtyWXapSGl+KpXXXYdbwJfQaBpI3NDYbvYJEK0cWkh0P0muwBuAFJUkuhUhUP
 KuhDw/1gGi44tMO1g2Qnqid7f5LEj0MToIdxNzQ5pRWuvj/P+k1LESle6EHMMkul
 GHGLdWfZ8EYOjRrr7KJNk4AxO15P22dDajEgll8MNxWpHFkyn/hGCHxbzYjwxtf3
 XKkBw+ogVjJvlyfu89WCXJugvPzJr4ba3Lp3qB1VUsbDmrw6cFLOtYa9y8X4jGHr
 XC2KBufIfkITKaQZN8KBoiM+bsigKsIycNehS1Neck5XkPA8fC0IQ==
X-ME-Sender: <xms:FOD0XWJoli4hE0OoceDQX85pg0mCj0CLBgGMtHfAlhqNK4ckeVGZ8w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvddtuddghedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhh
 ihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedunecurf
 grrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdr
 jhhpnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:FOD0XTRyiUg1LEDAPT523xjEyUMRK_gHy7GXCnmXwI0Gaqeci5JOoA>
 <xmx:FOD0XZov4jvHwR8Cz-2TpfLKlDe6KKkOFm_PQ6NnZhj4UB2G6OEj3w>
 <xmx:FOD0XRbpVld05kGMeVJGoncgE86eP9ZK5kOeCQp2pu8Tz-wivL7w4Q>
 <xmx:FOD0XUHdviTSm7N7rcMXiaOd5PeEpHIcmeYM_o_4Plb_yuELctB4iQ>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 17CB780059;
 Sat, 14 Dec 2019 08:13:54 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Date: Sat, 14 Dec 2019 22:13:51 +0900
Message-Id: <20191214131351.28950-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH] ALSA: control: remove useless assignment in
	.info callback of PCM chmap element
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

Control elements for PCM chmap return information to userspace abount
the maximum number of available PCM channels as the number of values
in the element.

In current implementation the number is once initialized to zero, then
assigned to. This is useless and this commit fixes it.

Fixes: 2d3391ec0ecc ("ALSA: PCM: channel mapping API implementation")
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/core/pcm_lib.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
index 2236b5e0c1f2..6f0a00fd3ae5 100644
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -2308,7 +2308,6 @@ static int pcm_chmap_ctl_info(struct snd_kcontrol *kcontrol,
 	struct snd_pcm_chmap *info = snd_kcontrol_chip(kcontrol);
 
 	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
-	uinfo->count = 0;
 	uinfo->count = info->max_channels;
 	uinfo->value.integer.min = 0;
 	uinfo->value.integer.max = SNDRV_CHMAP_LAST;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
