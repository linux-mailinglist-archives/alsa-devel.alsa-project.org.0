Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4B5AEC62
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Sep 2019 15:54:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 102D8168C;
	Tue, 10 Sep 2019 15:53:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 102D8168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568123680;
	bh=nD6NPn6J0OqIgQVXvHysQVzUVTAdMGI3uCWHVmGdAgU=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RLkEcHH7ufNg0qiOelhaxfhyQOTeiczr2XVYNobVuzvy1aD9vSRP/FFHPKWXVTN9v
	 BLDwa5I6ss7NrReufX55d1FWtKuVi25fjks9SYzTcq+BaYU3MJ1QeHx6kxodlCrxph
	 91XED8Xg0+I2ACYMx3EDZJGxlT6PFlQhABFzk8i8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5180CF805F6;
	Tue, 10 Sep 2019 15:52:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 79B8EF8036F; Tue, 10 Sep 2019 15:52:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8501F800C9
 for <alsa-devel@alsa-project.org>; Tue, 10 Sep 2019 15:52:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8501F800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="kaAGGE+7"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="ldqj6RBr"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 6EA5F54A;
 Tue, 10 Sep 2019 09:51:59 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Tue, 10 Sep 2019 09:51:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=moGB0nJAJd72r
 zqXrDEkU8H1iO7t69avZoCbt5iv/4o=; b=kaAGGE+7nrkw33MzKo69TsdZsUJee
 YMxBUKB7R/XC7HVjm4CyYXiPPhVp2J+mOi+mMTXmC5i27PuzD9YUh7sVnowY7kfL
 EumHQge+65rsXvF1TQG0ZYmvDyDOEBR9I62uWPPWOb55dlkLGPgPn9vTuqmTHz3f
 nz/SU8TiBfQLuxhdVKTZmQ0ey4Ygf8hQM1OVH4Zhe9bVgS5igVHPG7tAqth7tMxT
 CjVjqtlEz9V0m4kA4fQxZLXKUFRJ4ikmwy2mC7uTdM9SD1j7z/roHer4Ogc/XCEM
 wUW4hR81HljevxgkCm0ZmE9Jq8pjrymmuptZcyT5fO1swZkuc+/JEY1qA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=moGB0nJAJd72rzqXrDEkU8H1iO7t69avZoCbt5iv/4o=; b=ldqj6RBr
 b/5BHAz80rbgIrP696s1IEgFp6bv+zudfu/0b63KFbXq2Ybif3LYxV1gayq3G4fy
 ORR0btzVWzEuShu8lhqpnouxoUeuGJ7cA3piOeg0e7EepwmD7L5B/5JJVZcwWmA6
 afLr2KcK/sOvSKPY+9f95628kM6vNzvqHuj/kyDmJMxWrAnE8cBZegc7lXTdxvNG
 oxuL+r7dY/Iaxu0mVWQUqzQEN5LqLZBueF6gFbjRve39jW9cAMG+8UXrG9/FInvk
 kkS0z237WLgPkEdesHuGUp25JismSoS6FMtkvS4uXWunY3zfZ3sTiBS8BITuyAGH
 djdGSEiqQS43qg==
X-ME-Sender: <xms:fqp3XXpTVwyuleysU2u6m2s8qkstmbX2BrORLCg4b62Yq1UA3LBi4w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrtddtgdegjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekudenuc
 frrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhi
 rdhjphenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:fqp3XWj-d_OTCX5333C8CKjTx1LELTi52wrUxX-zfKc55FoY-UjQ4A>
 <xmx:fqp3XcwK1WOZPWQ9q4tn8YluLiI-ByaseQQ_M55-z2gOdeADo-X81Q>
 <xmx:fqp3XcIvfKHMD5rZD7lqC6djvpUL-JtrG-qNrbco5COcDRilDO_RyQ>
 <xmx:f6p3XV0IgGB9YVTw0SztvMWr3CQJdmCOE6z9bXlqfSlQq6ie1-0QBA>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7D49FD6005A;
 Tue, 10 Sep 2019 09:51:57 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Tue, 10 Sep 2019 22:51:51 +0900
Message-Id: <20190910135152.29800-2-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190910135152.29800-1-o-takashi@sakamocchi.jp>
References: <20190910135152.29800-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, stable@vger.kernel.org
Subject: [alsa-devel] [PATCH 1/2] ALSA: firewire-tascam: handle error code
	when getting current source of clock
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

The return value of snd_tscm_stream_get_clock() is ignored. This commit
checks the value and handle error.

Fixes: e453df44f0d6 ("ALSA: firewire-tascam: add PCM functionality")
Cc: <stable@vger.kernel.org> # v4.4+
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/tascam/tascam-pcm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/firewire/tascam/tascam-pcm.c b/sound/firewire/tascam/tascam-pcm.c
index b5ced5415e40..2377732caa52 100644
--- a/sound/firewire/tascam/tascam-pcm.c
+++ b/sound/firewire/tascam/tascam-pcm.c
@@ -56,6 +56,9 @@ static int pcm_open(struct snd_pcm_substream *substream)
 		goto err_locked;
 
 	err = snd_tscm_stream_get_clock(tscm, &clock);
+	if (err < 0)
+		goto err_locked;
+
 	if (clock != SND_TSCM_CLOCK_INTERNAL ||
 	    amdtp_stream_pcm_running(&tscm->rx_stream) ||
 	    amdtp_stream_pcm_running(&tscm->tx_stream)) {
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
