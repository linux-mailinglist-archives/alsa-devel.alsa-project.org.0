Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 60DD938DB35
	for <lists+alsa-devel@lfdr.de>; Sun, 23 May 2021 14:44:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DACF316B5;
	Sun, 23 May 2021 14:43:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DACF316B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621773844;
	bh=2HKbwmLItnyLHxb6UNvNXTC2QmycER1Xe42JDNCx2w8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SoJgCigmGas8ILdvZ9uHnYnxb6VUpRYxump/S5Ry+VRW/gwh700rY/Xokhn+N9z8E
	 XIXBZuJJbXFUc2/rsCJx9OK25lXNBl9gpYhcVjAgAOVZz8b/5AXqFvLip3kLeEBFxn
	 1fBJmHIW+LCgrO2fCPoBDFeulM/r6Xvxiu5yntC4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A259EF80482;
	Sun, 23 May 2021 14:41:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 11CFBF80424; Sun, 23 May 2021 14:41:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 24E88F801EB
 for <alsa-devel@alsa-project.org>; Sun, 23 May 2021 14:41:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24E88F801EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="F6GeNjY3"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="Sj6pnkTC"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 6DE351303;
 Sun, 23 May 2021 08:41:23 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Sun, 23 May 2021 08:41:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=EIpaXupRyAsD2
 1Jvw+kdoUnr/ocjFTK8yb9n6jnR8QI=; b=F6GeNjY3oBWYLHkaXxxS4/CTc6o6d
 QmQv8eT3+ProNvIYhnBEvc5e4CKxgxBrslKosVqRTwiRMbhZxEqu7lXxS32MOoGF
 fjP6FsekdZWh7XQZL9eMQinV0h3LEs8OG9f3lmZ2vgRrYIxjrAzFGHBgW/+vDs8s
 cBiiIHKfXfCKY2LlrxGv99ogPeo6A1DHnJEIczWfYDOsqv7CKdLgvZiZ4gfQVdbK
 OqybLOvt0HONL1aOssfFj96atHFoEEGwiC/tTnNkGQwrdSrEG+jk85+5jtielnrH
 jP27wVo64t0sksuMvwsOVxBhAwk1JC9FIIEWOqDnscKfMOvY7TA8aGTRg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=EIpaXupRyAsD21Jvw+kdoUnr/ocjFTK8yb9n6jnR8QI=; b=Sj6pnkTC
 gfe4DZPXTm9xZ5DxLSjd75t5X3Aeo/Nrnmnxw7FCnb0To81zuelniX1e6s2sIIVm
 spO0bHAAIpySSbAxO4OLLAJ6v4amlan8/2+TkTCkg7eAwdtIr2ZKZzDBjoorMsgu
 k6ZVFIM9YRZXA7ibxgsss0YkdmvQvdtS0RXvUtT3stnW0LZutpca2qyjCAX1+HEg
 XU/vsGQfK1xuCMn8p5P5wGKDFbVF2Ln8+TqiKQYHHjh8YQMHeLQ/qD8Y+sNPoWfp
 7EKDuSRHtKC8ZV9TPQQW8F8KcBy4rftyc0nO1wwPyWgBJDBvVCYnF79by8BneMq/
 IMft2Bn2aQCvqg==
X-ME-Sender: <xms:ck2qYC9qvrn8GnNF-xJECoQK31ZCZYoL9DLEZ1Qr_TXlhJwScslIDQ>
 <xme:ck2qYCuMwxZAv577dlqvAwU2KosEwsNMFHFqVPc154dUY1QK_F53j5vpYfJKnAv3l
 _UTk6x-sFZEz1IbFDE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdejjedgtdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecukfhppedugedr
 fedrieehrddujeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:ck2qYICoNdpyzh4bxUaWusBs0UXxu_u-WRAqsmkx6o7IuYS8IE_oGg>
 <xmx:ck2qYKcqH7mLyabMhmGab-pGNhUbqhzusJcAVcq72v_nND2KQd5OXQ>
 <xmx:ck2qYHP3zjLfi1HkDjJ5bS0i3akBfKGgPKCW7CCpVuO0E5616nB57Q>
 <xmx:c02qYJVVX3dos7eG8Vqe_2RFaJ3qGXZLH6_AElHFqxHdLItkHXqX1A>
Received: from workstation.flets-east.jp (ae065175.dynamic.ppp.asahi-net.or.jp
 [14.3.65.175]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Sun, 23 May 2021 08:41:21 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 2/3] ALSA: bebob: cancel switching connection order
Date: Sun, 23 May 2021 21:41:13 +0900
Message-Id: <20210523124114.272134-3-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210523124114.272134-1-o-takashi@sakamocchi.jp>
References: <20210523124114.272134-1-o-takashi@sakamocchi.jp>
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

