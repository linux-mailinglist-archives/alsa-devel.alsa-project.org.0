Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B761E38DFD2
	for <lists+alsa-devel@lfdr.de>; Mon, 24 May 2021 05:16:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3AA4C1692;
	Mon, 24 May 2021 05:15:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3AA4C1692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621826195;
	bh=2HKbwmLItnyLHxb6UNvNXTC2QmycER1Xe42JDNCx2w8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dJ5TRaUfn6zzLeg+C/pFzBWLofZeqIKrQgUeQMPAFu4dvzuIC4EW0G6tZuIXtc31C
	 9sqd1VbCSMxV6/La3vkZ2it0oS5zlp+aBTG+oLl8pAl+qMV7LsB6bQ7HDbkBRc4Tz3
	 fA3szpBb/zweBWxqTz39cRdcjDbHw14LviChYLvs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F38D5F80475;
	Mon, 24 May 2021 05:14:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 72562F8042F; Mon, 24 May 2021 05:14:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 24858F8022B
 for <alsa-devel@alsa-project.org>; Mon, 24 May 2021 05:13:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24858F8022B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="vIH64yu4"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="ECnrdLFr"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 5F3725C0114;
 Sun, 23 May 2021 23:13:57 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Sun, 23 May 2021 23:13:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=EIpaXupRyAsD2
 1Jvw+kdoUnr/ocjFTK8yb9n6jnR8QI=; b=vIH64yu433W93fw7TUAuqJviYjzCH
 2cXgoMePtQyE8SKnWzc9+JEpk21Ul3w4slPg1kjp7rfd+ZlT2ndpFp9AM4lp82ZC
 fm8/x8m41WlRDgDzDcD1klFnLpm9hHDZkZZm/nuM9pD6oaJzVDufIzc38kbo3kho
 7oti2RsasKfpTtzwq3ogEGPV0kcGbB93sLjzwNodYtXLKZuFKxw6dS6E3cfdUrnH
 /WU36hNWHbtmd6QtNKySrY5u44H8lQ97dM0bRvQtaqLBwF13FcRyPcBNEo/KSmWB
 1sbWXCRW3qk8mke32YVv3ZuOLAmalSPvX0SPYnfB0pzwUKb8ArvKCB1vA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=EIpaXupRyAsD21Jvw+kdoUnr/ocjFTK8yb9n6jnR8QI=; b=ECnrdLFr
 YFLjzZ5quwN8ECB7pAc3LwNucVfBA5rDClFTC78TsBN2PYbqLATiTplJ/UyI55lw
 6jW/uYkVkzffdwe61HJSbHnCHN87Y2B7P/tNt4VqCv/TjVJql2768hT4OJ5jcrrI
 7WnuWy+7sz2O3t2lUaAf+r6WhH4wMZR49lYkl8wVOu1N9F6aY4Z47Zuhh7vE5nz8
 OYjLrbrz1WlU+Qk0YBl6TpAOU6RGKKbW8Hkj/+emVzeJgJWKqqE1hOy0izHR8cQY
 IYkOrEclSgJH/THTihBwfjkz5YSMydXeV7bEm5DUF40AM/9Q7THhZb04M/JJ54fY
 IeRekitGdzPNQA==
X-ME-Sender: <xms:9BmrYJs-BgKrUTDJ7FZXX2g6gtYakHVvZRWUyq5QG4Aai2v8XjYgGw>
 <xme:9BmrYCcGwuH09k0DwkR3tjWnscVz-pkAaQENRDI4sFYiCi_AEtKd91iv_D79foQrj
 vgZYwIILWD_DjQc9vQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdejkedgfeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecukfhppedugedr
 fedrieehrddujeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:9BmrYMwAeObRJd6j5kpAS8F8j6clxWePVftAuuWkW_214iRTwnylxw>
 <xmx:9BmrYAMLw9pe4-JJlYbprL3kIdrP--awndoACifC5f_d0s1mmKCzXQ>
 <xmx:9BmrYJ8m-F120OyRm54YYBXrXXGRosL0njv_Runp8MLMk1BQ4bhEnw>
 <xmx:9RmrYGHrvzcgAEfvGhS90dRUTpA-xJaIRJNTFHxhiorA6hx8P8ClMg>
Received: from workstation.flets-east.jp (ae065175.dynamic.ppp.asahi-net.or.jp
 [14.3.65.175]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Sun, 23 May 2021 23:13:55 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH v2 3/4] ALSA: bebob: cancel switching connection order
Date: Mon, 24 May 2021 12:13:45 +0900
Message-Id: <20210524031346.50539-4-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210524031346.50539-1-o-takashi@sakamocchi.jp>
References: <20210524031346.50539-1-o-takashi@sakamocchi.jp>
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

The order to establish connection seems to be meaningless.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/bebob/bebob_stream.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/sound/firewire/bebob/bebob_stream.c b/sound/firewire/bebob/bebob_stream.c
index df764171f84b..975670a29a72 100644
--- a/sound/firewire/bebob/bebob_stream.c
+++ b/sound/firewire/bebob/bebob_stream.c
@@ -623,7 +623,6 @@ int snd_bebob_stream_start_duplex(struct snd_bebob *bebob)
 
 	if (!amdtp_stream_running(&bebob->rx_stream)) {
 		enum snd_bebob_clock_type src;
-		struct amdtp_stream *master, *slave;
 		unsigned int curr_rate;
 		unsigned int tx_init_skip_cycles;
 
@@ -637,19 +636,11 @@ int snd_bebob_stream_start_duplex(struct snd_bebob *bebob)
 		if (err < 0)
 			return err;
 
-		if (src != SND_BEBOB_CLOCK_TYPE_SYT) {
-			master = &bebob->tx_stream;
-			slave = &bebob->rx_stream;
-		} else {
-			master = &bebob->rx_stream;
-			slave = &bebob->tx_stream;
-		}
-
-		err = start_stream(bebob, master);
+		err = start_stream(bebob, &bebob->rx_stream);
 		if (err < 0)
 			goto error;
 
-		err = start_stream(bebob, slave);
+		err = start_stream(bebob, &bebob->tx_stream);
 		if (err < 0)
 			goto error;
 
-- 
2.27.0

