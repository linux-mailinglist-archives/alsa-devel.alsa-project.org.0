Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D689ADB1DE
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Oct 2019 18:04:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 695CD1683;
	Thu, 17 Oct 2019 18:03:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 695CD1683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571328286;
	bh=2d/QGpAcpAm3v1ajd6fmYhuvK5IxQURVslXXI5IeMfQ=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fSPFj4VysF95R8kQA1bJLrKzmwG4SjReVNV3VLy+pnZ6ASnvXmPaMb19DYcmdXQ2C
	 3GrwutHnCpO9GDTJHXjj5uDm2i0Pl5RH51bl1iXuQJyaxOlN38EUtFTQd+clVGWBYX
	 bEmubabC4oK1y3xlQV1uMnEljtDQFrCmFCHW/+gc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 28640F8071F;
	Thu, 17 Oct 2019 17:55:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6A6EF8063A; Thu, 17 Oct 2019 17:54:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5DDC4F80611
 for <alsa-devel@alsa-project.org>; Thu, 17 Oct 2019 17:54:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5DDC4F80611
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="mZbAT9PO"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="dTheEY+p"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 8E81D51D;
 Thu, 17 Oct 2019 11:54:48 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 17 Oct 2019 11:54:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=pQnVJ4RFC3beo
 gCWRqq/Uq8xX+nvmJyI3hjh4Y/a6l8=; b=mZbAT9POtew9NfqfERa2fl6nBA8Ai
 NU2k4F1ezTeDLuk6blS7E7tF7Tdbq9PrJqSA1M7V0JsoSgOK8bJdE40QYoZ9Q3UW
 dkExv1Y4TH4sPegHs5Z55TZvUWUJUQFbPli2xkRKPNwnmRH0lE5eevqx9DyAMIZ3
 ScmFT2j3F6GS7b6debd+LDh0JRDl0duvCw6DSjXO3gUemBjAmQiJxsM/lLK6mmzo
 efCqz0Ium1pee5/WRVGe2sRzqjv/7ZbJi0xB7U6BQ6XrHe0fzvDtIwltw4j1U+H9
 SFbdOuIpGN1pMU9ZTnfyoljj8jWzncamQcH7MnXJRopZfTA+PMVth1qrw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=pQnVJ4RFC3beogCWRqq/Uq8xX+nvmJyI3hjh4Y/a6l8=; b=dTheEY+p
 IPG0Y6FxnbsSTubCFdTaDbkW3p61P1QmoFZxrWtLbw4Kl0H1dryy5yp3sLC2tZAD
 XkGKjLQb0Aqk0w5C4YJyRFjxt8DESx3waTp/m0gKH78RSHzc5kwuqchbXL2XHyjN
 Ii+dKNVRArBqSfEYmIzktWgIbKsmO1yVQTIfDrXn6cH2zafnwtIO0medsawDPqOd
 UnN/WaoEwbUtaeMj/CmKMwCoK3PqBPZ3fh77Aep9fKcpbBTo3sCYN9WA3ZVDZEz8
 w8ajWOGOR0MAthuuHrF3/DDmQywhfyvz6uEGpLuQRY+GONS9RyahaKZRCsBrgJP9
 dBQnLcHzJCYRyQ==
X-ME-Sender: <xms:x46oXcZKSDO0um57CuGXSNgMaIf1YH1Fl2mJQUYr0puJ6A2JnsAM-w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrjeejgdelgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekudenuc
 frrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhi
 rdhjphenucevlhhushhtvghrufhiiigvpeduud
X-ME-Proxy: <xmx:yI6oXeZ6rM4Pfp9sxxIHXkln_Fc_2ckQ1kS1RrRIkRPWXd3vTUqPkw>
 <xmx:yI6oXb8FzSOG8ZJmsah-iMK8bDeNmfCibLmS99GpO08gNIbdNIOHuw>
 <xmx:yI6oXVgaqTgYfZypJIKcM-At7ngHfKUfVplAwvE0M46rgX-mltgnXA>
 <xmx:yI6oXSamT1xFhBxLyGTabSUlvqUN0kfdMZUs3JmzRy0yJlZiCSP0Ww>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id B0ADB80059;
 Thu, 17 Oct 2019 11:54:46 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Fri, 18 Oct 2019 00:54:24 +0900
Message-Id: <20191017155424.885-13-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191017155424.885-1-o-takashi@sakamocchi.jp>
References: <20191017155424.885-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 12/12] ALSA: firewire-lib: tune the minimum
	available size of PCM period
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

In IEC 61883-1/6, one isoc packet can transfer events up to the value of
syt interval. This comes from the interval of isoc cycle. As 1394 OHCI
controller can generate hardware IRQ per isoc packet, the interval is
calculated as 125 usec.

In IEC 61883-1/6, two ways of transmission is described; blocking and
non-blocking methods. In blocking method, the sequence of packet includes
'empty' or 'NODATA' packets which include no events. In non-blocking
method, the number of events per packet is variable up to the syt
interval.

This commit uses double of the value of syt interval as minimum available
size of PCM period due to the above protocol design.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index 8a7818130382..7486eec4d958 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -213,9 +213,21 @@ int amdtp_stream_add_pcm_hw_constraints(struct amdtp_stream *s,
 	maximum_usec_per_period = USEC_PER_SEC * PAGE_SIZE /
 				  CYCLES_PER_SECOND / ctx_header_size;
 
+	// In IEC 61883-6, one isoc packet can transfer events up to the value
+	// of syt interval. This comes from the interval of isoc cycle. As 1394
+	// OHCI controller can generate hardware IRQ per isoc packet, the
+	// interval is 125 usec.
+	// However, there are two ways of transmission in IEC 61883-6; blocking
+	// and non-blocking modes. In blocking mode, the sequence of isoc packet
+	// includes 'empty' or 'NODATA' packets which include no event. In
+	// non-blocking mode, the number of events per packet is variable up to
+	// the syt interval.
+	// Due to the above protocol design, the minimum PCM frames per
+	// interrupt should be double of the value of syt interval, thus it is
+	// 250 usec.
 	err = snd_pcm_hw_constraint_minmax(runtime,
 					   SNDRV_PCM_HW_PARAM_PERIOD_TIME,
-					   5000, maximum_usec_per_period);
+					   250, maximum_usec_per_period);
 	if (err < 0)
 		goto end;
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
