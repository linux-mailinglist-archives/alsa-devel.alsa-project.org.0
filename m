Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5DE1290F3
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Dec 2019 03:42:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8DB801672;
	Mon, 23 Dec 2019 03:41:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8DB801672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1577068921;
	bh=GMsOv53q6tbWvGV2xG4Oz75janIMpuGRpTgoo3B/K6w=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sxoi1LirFDtaNANg/zaxDF70rKBsF0Hv2rBc2rYvljlo7BiQDy9T61Iewdfe/cY90
	 93heoQNAd9P3AeKUDLC8xo2Qrcegz4PEH3D0pjslUL+AMOVKxSMLSCKC1ZNP6c7bZj
	 Xl3Posv2WWRhe/8qkwypRYTtgSEzKrkXBqzJTCg8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1B2AF8024A;
	Mon, 23 Dec 2019 03:39:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F81FF80145; Mon, 23 Dec 2019 03:39:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1869BF800E8
 for <alsa-devel@alsa-project.org>; Mon, 23 Dec 2019 03:39:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1869BF800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="xlUYKU2w"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="ZqJBh2VP"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 7E8EC2202A;
 Sun, 22 Dec 2019 21:39:26 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sun, 22 Dec 2019 21:39:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=JmOeXx5s2VNvE
 VaOH7rB2fBHITW04bEYZ/wNjgkk5m0=; b=xlUYKU2wS66uQmpmT5zU3VfmNujK5
 zwi5Z0GvB6t9bGJWP1/T5ZKEK2smAWvKt6/FescN/mqe2XiuM/N5LDb6x65HYkwX
 SoCnReg+cPRYvo3lqOPvzNjOhhfCnAjfOgPcsIvUZ6luu4qZ54lvsshLTp6fM4o0
 RQNubtZ0IOEBZkdgp9DfX7VDu2XHTexyPzHpXXrqYI9HnIP29m/ph7TJEn9/oRb3
 wnBncWQSDMmrIExBFOLNH+JWnjV9P87JcI1QAYQCoyQXoJGgUYQbXhAdOXOyp5HE
 zPp7kvPB01YCpl1GbcmN9pgK9lW4C7BXHduH7CF5jqBEe/0j2ZD3LILLg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=JmOeXx5s2VNvEVaOH7rB2fBHITW04bEYZ/wNjgkk5m0=; b=ZqJBh2VP
 wsq/WhHXtuuxgk3mF680xIQzTiNiTFaUJlYUgjkhex0cMqNie7BNFqnMzW3tIoCo
 xmd0MamibGK9uqsDfDAkOyutEOz1PMfjMbXILWNsi/N+cbHcTeSIeJnB5XPRK93Z
 iKrFbC7iJDJ8JBYTYJxJb43YBH0X0lkJ3hWOfPjslvjPdlVwcSnDNJvdUki2R5o0
 i30rbS+KWsWVsbYex4cVw/98Is+taPQMM26hUv47aCuHOEh4gnNpr5C74bK9pP1d
 1veZuupqPy4NQyUENjoBKKt8Dm1+O1doxMdd9bWMbZ96WNyQiu7KevAqmCPHT3Na
 Vhhnur6p/jodJg==
X-ME-Sender: <xms:3igAXvfG1PML6it9qZb-SST62OLgKoAMRz8HS0q-WBbagZgHcklqFg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdduledggeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:3igAXuyY3Pa31ztEngpBZ5U56u5P3U8lsrWiYbl8vrtfQtJDokTASg>
 <xmx:3igAXj8Hbsz2KAJfSlqyOfkKG0HlCNheC2PaId4LLEjba2H5_9-jDg>
 <xmx:3igAXvrw0DTgtSrqPRd0vqbEnwPt6lvfpuO2cbavO-7S8mLYT_yP8Q>
 <xmx:3igAXrma_GAo0v5bISRYo9uCdoA9_xKD7D3zJeIpM2l9u6VKAtpz1Q>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 661D88005C;
 Sun, 22 Dec 2019 21:39:25 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Date: Mon, 23 Dec 2019 11:39:18 +0900
Message-Id: <20191223023921.8151-2-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191223023921.8151-1-o-takashi@sakamocchi.jp>
References: <20191223023921.8151-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH for-5.6 1/4] ALSA: ctl: remove unused macro for
	timestamping of elem_value
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

In a former commit, 'tstamp' member was removed from 'struct
snd_ctl_elem_value' in a middle way toward solution of Y2038 issue. In a
protocol of ALSA control interface, this member is designed to deliver
timestamp information in the value structure when the target element
supports SNDRV_CTL_ELEM_ACCESS_TIMESTAMP flag.

Actually, the feature is neither used by kernel space nor user space,
especiall alsa-lib has no API for the feature. Therefore it's reasonable
to remove both of them. Practically, the timestamp information
corresponds to no information about type of clock ID. It can bring
confusions to applications.

Reference: a4e7dd35b9da ("ALSA: Avoid using timespec for struct snd_ctl_elem_value")
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 include/uapi/sound/asound.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/sound/asound.h b/include/uapi/sound/asound.h
index e7943302359e..efd9e1398e07 100644
--- a/include/uapi/sound/asound.h
+++ b/include/uapi/sound/asound.h
@@ -974,7 +974,7 @@ typedef int __bitwise snd_ctl_elem_iface_t;
 #define SNDRV_CTL_ELEM_ACCESS_WRITE		(1<<1)
 #define SNDRV_CTL_ELEM_ACCESS_READWRITE		(SNDRV_CTL_ELEM_ACCESS_READ|SNDRV_CTL_ELEM_ACCESS_WRITE)
 #define SNDRV_CTL_ELEM_ACCESS_VOLATILE		(1<<2)	/* control value may be changed without a notification */
-#define SNDRV_CTL_ELEM_ACCESS_TIMESTAMP		(1<<3)	/* when was control changed */
+// (1 << 3) is unused.
 #define SNDRV_CTL_ELEM_ACCESS_TLV_READ		(1<<4)	/* TLV read is possible */
 #define SNDRV_CTL_ELEM_ACCESS_TLV_WRITE		(1<<5)	/* TLV write is possible */
 #define SNDRV_CTL_ELEM_ACCESS_TLV_READWRITE	(SNDRV_CTL_ELEM_ACCESS_TLV_READ|SNDRV_CTL_ELEM_ACCESS_TLV_WRITE)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
