Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 466D96141F
	for <lists+alsa-devel@lfdr.de>; Sun,  7 Jul 2019 07:24:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 446E4167E;
	Sun,  7 Jul 2019 07:24:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 446E4167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562477096;
	bh=t/5iprNKxX0DBIra6xaQY79q61rJ/LeWlKazp+k4mxA=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QcaK6Hdk7LNimPpjT3Hmp9z8SIBYzbwF0kDors0fNryYuOPGNCSbyTeaxi6w9jP7/
	 SwskWYbZs/OUvMofOa0a0M3a65kHnrYvI0rXBV1xjJ2NQp8e2ac+WV5Ixour0rbCDa
	 dBVmkNuQsoZvKMRcraChj/rJemFdCGN5goOYXg4M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2FBF3F802FB;
	Sun,  7 Jul 2019 07:20:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 27FD4F80269; Sun,  7 Jul 2019 07:20:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F64EF800E3
 for <alsa-devel@alsa-project.org>; Sun,  7 Jul 2019 07:20:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F64EF800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="VQUl7G6j"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="edBKh9Cv"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 2A1CF446;
 Sun,  7 Jul 2019 01:20:22 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sun, 07 Jul 2019 01:20:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=CKRmcqQ/fYz7w
 1wFbtiDYW9BE9i4AHZ4+BTsCGePwZM=; b=VQUl7G6jXWQZXTt+emgKmEDNXMuQS
 Xjtvlo36zhjmi2/jwiqaSIhgU9VMpHnqAAMWS9jonaBdX7w6qgEGZel6QemzAxwA
 v7ZxIQnGeCXB45/4ihpQpe/7k2qTtp05ZVYIlwTYk/texfbZfWFGHVSSb0eHlt5R
 TliepI0MgqjV7yAxOdYwjHzexpE8o+24Clzp9jgfde81Kuc39cW2PKDNnuqqVkJN
 TXtgcnJ3UsjhhuF7DvrPkw5U+4eeZD9z3g5GOgavew7cQwTNEXSDpy9xZqlb8V9B
 ZXmyStT5Z6YGeFY7Y3Dwdriv5HO0MJJDBIkAvxtaen9k8drErh7VfUklg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=CKRmcqQ/fYz7w1wFbtiDYW9BE9i4AHZ4+BTsCGePwZM=; b=edBKh9Cv
 Pq8pM6Ak++iN9cQntvLekBJT7VEzjaNA+2W3rgMk0Pf/1dj0NgquIhqk5yQ3B29S
 VK0bxRelW8OVso7BQ+IFIkhcDM7PLiUPk9loKz3kTcWFV48BuYtJ1enov6m8uMQa
 4D/38OEwcSQWZXMxGSYleK9gr9R9u+kYYRAffWW6ynPRVZBpQ+7UOGdzIqS5lbPy
 yYG+QcUSEqY4U3MxMRU43y3OzRX463B8WA/Qtfag9SOFPOLEzcGFTBQ6ru09hIZb
 CJTE+TFOndjqnQw1bUySDONjjFJk1dnf+BLh2JIdElED0QCASqTPPrKr22yL4kfL
 ZCfmDnjrY+V+1w==
X-ME-Sender: <xms:E4EhXfSD73J7w0ps81txBW2nLhnkMrsOke1-niLcB-s7y5j4z-Ttrg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrfeejgdelgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekudenuc
 frrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhi
 rdhjphenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:E4EhXQ7oCWhAQm97pSIh2yXbjztbx--ngIy9q8xbNlzXdd8yQ8O9tQ>
 <xmx:E4EhXcxrb7FbE527KovmvGHWCezKjiXPRtoeuZsmfctnOHJW9S3Lhg>
 <xmx:E4EhXXTuiFIHjeEedbGuyYYadyq70SJ4T9qwocKGfeSHjBTFasP8Ig>
 <xmx:FYEhXbS4ZIY6Ju_Q4eNYLF8hg92X0ZRmCESoFYhH5nPdmOxVuYo04Q>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id DCB7080059;
 Sun,  7 Jul 2019 01:20:17 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Sun,  7 Jul 2019 14:20:07 +0900
Message-Id: <20190707052011.24687-3-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190707052011.24687-1-o-takashi@sakamocchi.jp>
References: <20190707052011.24687-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 2/6] ALSA: fireworks: fix wrong reference count
	for stream functionality at error path of rawmidi interface
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

ALSA fireworks driver allows applications of rawmidi interface to start
packet streaming for transmission of MIDI messages. However at error
path, the reference count of stream functionality is not operated
correctly. This can brings a bug that packet streaming is not stopped
when all referrers release the count.

This commit fixes the bug.

Fixes: 3d7250667ea9 ("ALSA: fireworks: configure sampling transfer frequency in pcm.hw_params callback")
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/fireworks/fireworks_midi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/firewire/fireworks/fireworks_midi.c b/sound/firewire/fireworks/fireworks_midi.c
index 6d3d942e2dce..fd17777981e4 100644
--- a/sound/firewire/fireworks/fireworks_midi.c
+++ b/sound/firewire/fireworks/fireworks_midi.c
@@ -22,6 +22,8 @@ static int midi_open(struct snd_rawmidi_substream *substream)
 	if (err >= 0) {
 		++efw->substreams_counter;
 		err = snd_efw_stream_start_duplex(efw);
+		if (err < 0)
+			--efw->substreams_counter;
 	}
 	mutex_unlock(&efw->mutex);
 	if (err < 0)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
