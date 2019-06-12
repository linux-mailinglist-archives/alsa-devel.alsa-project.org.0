Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 505D041FC4
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2019 10:53:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E42E91763;
	Wed, 12 Jun 2019 10:52:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E42E91763
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560329585;
	bh=EwW0rhFznz/mT4GOOuVTjSRumAmplZILuYcTfWNn5Yw=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NeM0H6X3cqmm0UDx+lWMP3qhqTMYEMUdJ8owJO958fGBHI2SW7xxWbqi4D1Pzotbo
	 8FUbZnjsMQptxwr4kXz4zzkEWrilHqNdZY45ahvPBxYQuL3X9NsYvirbUC7LGILow8
	 8C6RwKO5/fJfcrPyoqPfnwfYFMLL9xqklTBrd34w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 44F6CF89767;
	Wed, 12 Jun 2019 10:45:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B6287F89745; Wed, 12 Jun 2019 10:44:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 12936F8973B
 for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2019 10:44:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12936F8973B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="rs2XmIfz"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="IxNs3VzF"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 6E0D9582;
 Wed, 12 Jun 2019 04:44:42 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 12 Jun 2019 04:44:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=OQbk5DVWuYm8n
 lFxcIB+Ho18mpF1tPogpwy7L3e6avs=; b=rs2XmIfz3FBmBnXbjzwW++m/Yqm+j
 BrFD/IJgMQ/KxmDjbpFda10GsvdgMubFsIVPncLJIcDuUi8d/yueC+mVUSY3LT1V
 3iY0FSU/rXqhyvv4qp63L9KT8S34YGQJiWqVza3YV29AjWJTJOd1b8mihSiRk3aU
 5e4TlhQrH89Nncrbf+9FBhoaA/TBs6qMmNqzfqB7n92kpt2QzO3+ZiSbnl9mCOmy
 ek3LP+5WI8iN5h9/ywBiubn2Jf4vUac2DkJfr/BNgaQJ1bwY4ZWpPQG2DzCZgLBG
 XkeTcCva7UD4H3unync0IabWDBiKagWhYEksKG4KredHTI8HDYfj7APyA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=OQbk5DVWuYm8nlFxcIB+Ho18mpF1tPogpwy7L3e6avs=; b=IxNs3VzF
 4WcqR4AFo8K7zwAfLQ4+mOvMyapAxJuMd864WKk5RoVSqt2/53Fbn2gywSflvZyj
 4rIN6XSrBE8Dm1/8rEitVuQCiCTfgS6M/8S0nKql3ZlFtejqPv6KuYdl/5+r9032
 eOkqiQzXhe7bIbs+IQyF7l9BpwcGNf3SeTa7Hz5qb/yO603iqq8UidoUppmSuzV1
 tSonR+EovwqFAqi5Dat5ITurOopmzMquVprX6QwlYJh+Z6e6/WTeeo0XCqPpeT2r
 pXZDKp2VuIeRZrhR7Uh+bv4BgobtaesiXrrisVa6+smby96tvZhjEpeTNv7pm7RH
 OQXAAXPJfaNRDw==
X-ME-Sender: <xms:ebsAXWRfYX7Xx0Adz-rWGlrKTdL4vzVnvxP_41o5E80HOw09FPZVaw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudehjedgtdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgepje
X-ME-Proxy: <xmx:ersAXWp_LGHqCQ6egqx0gx5Oz_1aCwO0u0-dCONb8m8UB1a5n6CvCQ>
 <xmx:ersAXbo8Uh_jqhk3a3GsxrV8QB0yEA7H-yNNkbDNptYejLoKtsrstw>
 <xmx:ersAXQMF9e2IhHI1pW0JujsJQNWzvjrHpHAog7ZnUIus5CLLhKhhCg>
 <xmx:ersAXeKYO8YR40g87iRwYQhh6nJVCTCFX6HvXQn28dq4z9VzI012cg>
Received: from localhost.localdomain (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id D2B20380087;
 Wed, 12 Jun 2019 04:44:40 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Wed, 12 Jun 2019 17:44:13 +0900
Message-Id: <20190612084422.5344-11-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190612084422.5344-1-o-takashi@sakamocchi.jp>
References: <20190612084422.5344-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 10/19] ALSA: fireworks: don't set XRUN in stop
	streaming
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

When stopping packet streaming, no need to stop PCM substream with XRUN
state. This commit suppresses it.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/fireworks/fireworks_stream.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/firewire/fireworks/fireworks_stream.c b/sound/firewire/fireworks/fireworks_stream.c
index 1abc15760513..61342c49dc38 100644
--- a/sound/firewire/fireworks/fireworks_stream.c
+++ b/sound/firewire/fireworks/fireworks_stream.c
@@ -43,7 +43,6 @@ init_stream(struct snd_efw *efw, struct amdtp_stream *stream)
 static void
 stop_stream(struct snd_efw *efw, struct amdtp_stream *stream)
 {
-	amdtp_stream_pcm_abort(stream);
 	amdtp_stream_stop(stream);
 
 	if (stream == &efw->tx_stream)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
