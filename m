Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 763CD61422
	for <lists+alsa-devel@lfdr.de>; Sun,  7 Jul 2019 07:26:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E80D9167C;
	Sun,  7 Jul 2019 07:25:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E80D9167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562477183;
	bh=rP02Yct1E8qFrqQje9G61H5gKg5xR2HNFya2JxtYlr8=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iEZ4DyMd+eAtongRkNpwBsrMCCDyl98vc8icFdyGXMy8OpdkpecJv2sLC+NAiCSqW
	 pg2uSqWoDr9Miyvk1ExnFOuXXTydBKNJcpEfl8cKMXc7Gc0BKgXJ/7a9CyjiYCXJSD
	 kRuUBV7JDdNeVi3zRuCAz3QvG71K7Pztk7KyEDSU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 06316F80367;
	Sun,  7 Jul 2019 07:21:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 04D54F80212; Sun,  7 Jul 2019 07:20:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 65960F80228
 for <alsa-devel@alsa-project.org>; Sun,  7 Jul 2019 07:20:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65960F80228
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="oGrkKPH2"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="ADMolA9k"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 0506744A;
 Sun,  7 Jul 2019 01:20:24 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sun, 07 Jul 2019 01:20:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=a+Ug6y4xHzS04
 mvrQf0Brv7KW3f+2wJaMlXQR4RcWTI=; b=oGrkKPH22QOm8uGNoWEpw0fkZT03Y
 oX1W1nUKR/BSTxQRXK6g2cGb276nhT7CjuK0K5irT+DWBwz6hHihB3qKpdLeW/1X
 3flL+kfK+ED7MpNWhgIezAFZphmvIG8ATVd/L/lTiYY4dmiaC9uVWjiu3+1fSIQZ
 xKc6hx1oMemQn4xdZGEYw1GuA1kRQsMpE1X4EqZAmToSxDM7Pc8FqQ4aIhSFqGDz
 QcZVJAhmeSDda0lrD1iCImoHEwrlUDaFNOOpSeeMvxxEq8RE6hFqb/XrvQ6E3LGf
 aDJ2NZSD+g3UfA3OIzWUIWarmCssbncWqBgtCx4xgRSojnjTm/pEPRMLQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=a+Ug6y4xHzS04mvrQf0Brv7KW3f+2wJaMlXQR4RcWTI=; b=ADMolA9k
 TrIoaOYWSONnwxVzMLNLxPSbPVTrKy9rjJaec7In7HHBDnQoDgcPQc8qvVDUojCg
 /kqw7qn0F1TqEK2WTh5cWnSsASbRMFm3Ujn9bW+pNkCV9wRpUwpugJuViwumSg7c
 2senbPyDAhufoI5Dsqst7iFt79Y8xuL9qaZJ1rArsK2TxO8zSH2ftPGS/nJ/7hwe
 LH0+jZS1011YslohznnbkrxNgvNCWvSutcX8IY7RW1HJf+uYhnVy2ObDR/8A5YtA
 +LUvCTIJ1S2fEUigwHCU0MxxjLm3L4y/VlC3xg4ySLQnbpRaheUiTExZ0BN7chGg
 fVUGBWClsRB+EA==
X-ME-Sender: <xms:GIEhXfdKkj055qStGIRnOnZb1W9-QfH57SDwUAAp99xr8SWjKqAAsg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrfeejgdelgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekudenuc
 frrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhi
 rdhjphenucevlhhushhtvghrufhiiigvpedv
X-ME-Proxy: <xmx:GIEhXRGoPOueTj09-_mMDbysGyQcQlgObWyI3Ow06Z8UHZyBhiiudw>
 <xmx:GIEhXVjwSSVwLPh6uOO8qs1el-MchuLY-hq2jW1lNN1u6LUHkc7qZw>
 <xmx:GIEhXV3Qu-xGuetlQYAObHESwf8w0COPWQTExHDjBRBxCgFJYc5now>
 <xmx:GIEhXecZgL4SFDsxt4Dyi_3Auxx42gm4W9_OBzuMRxKqG7DEItthSw>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 39A6480059;
 Sun,  7 Jul 2019 01:20:23 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Sun,  7 Jul 2019 14:20:10 +0900
Message-Id: <20190707052011.24687-6-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190707052011.24687-1-o-takashi@sakamocchi.jp>
References: <20190707052011.24687-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 5/6] ALSA: firewire-digi00x: fix wrong
	reference count for stream functionality at error path of
	rawmidi interface
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

In IEC 61883-6, several types of sampling data can be multiplexed into
payload of common isochronous packet (CIP). For typical audio and music
units, PCM samples and MIDI messages are multiplexed into one packet
streaming.

ALSA firewire-digi00x driver allows applications of rawmidi interface to
start packet streaming for transmission of MIDI messages. However at
error path, the reference count of stream functionality is not operated
correctly. This can brings a bug that packet streaming is not stopped
when all referrers release the count.

This commit fixes the bug.

Fixes: ae8ffbb26512 ("ALSA: firewire-digi00x: reserve/release isochronous resources in pcm.hw_params/hw_free callbacks")
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/digi00x/digi00x-midi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/firewire/digi00x/digi00x-midi.c b/sound/firewire/digi00x/digi00x-midi.c
index ca06ad318ed6..0563701141b8 100644
--- a/sound/firewire/digi00x/digi00x-midi.c
+++ b/sound/firewire/digi00x/digi00x-midi.c
@@ -22,6 +22,8 @@ static int midi_open(struct snd_rawmidi_substream *substream)
 	if (err >= 0) {
 		++dg00x->substreams_counter;
 		err = snd_dg00x_stream_start_duplex(dg00x);
+		if (err < 0)
+			--dg00x->substreams_counter;
 	}
 	mutex_unlock(&dg00x->mutex);
 	if (err < 0)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
