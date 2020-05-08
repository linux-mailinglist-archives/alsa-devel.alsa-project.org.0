Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D821CA254
	for <lists+alsa-devel@lfdr.de>; Fri,  8 May 2020 06:39:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48BFE1813;
	Fri,  8 May 2020 06:38:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48BFE1813
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588912779;
	bh=tTwUP+oNI8qEM30IAWQV4xCKRHdAwAJ1Bfpx8Iujh5M=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mLJq1/WziQqzGyKShWF6YgZZcPW0T7hsV29OjTOn8jboXVgL9yQvImwPymg+yX5Es
	 +YgNjQlkJv5ikjnTDRXeown1pVRnRiW+nsT0d+FXGtrSe+3D0cssKTQTbdKT0djmLH
	 w1CGN81/A9zOslP2dCBYAPoaeJ61wlbptBW6LmwA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD016F80253;
	Fri,  8 May 2020 06:37:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C2B4F8029B; Fri,  8 May 2020 06:36:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C8082F80234
 for <alsa-devel@alsa-project.org>; Fri,  8 May 2020 06:36:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8082F80234
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="x4HkNO6s"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="aeqakyPb"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id F1B1FAD1;
 Fri,  8 May 2020 00:36:39 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 08 May 2020 00:36:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=uyTTTCuEZksc/
 f8Yik1bj3I3cUjckh478A7A0tLZt04=; b=x4HkNO6sMOYZjF3mk3NhvJdnaFyhA
 +ilVgyhz64upW0UaoS257zQCs7ooAeV3trLF7Pb+DM4hDIGiTETISDkwDKsGsCC3
 IXERt5BxOcG5Rd9ZgWLYj6JqdxsLqCZK+w++3i/rrYaUexbCNHmekraQDGup1Maq
 k2K88z0a7YpGVrmtZPhrqyH7gordBj4vTvMAiuAnpA9VJKKup+xyKP9Tx4Hm6rpc
 eq4qE9/gFFzBSv0LgObse6MOarRGNq6IOOq2EHMtRedcMcUdj459/NcbYqWcfQnT
 CsJLfw4332JEiJM3QibX2LmjH3VkmDBOZC/4q1/sCqLPtC47g7PafRDjw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=uyTTTCuEZksc/f8Yik1bj3I3cUjckh478A7A0tLZt04=; b=aeqakyPb
 8i5B9lLTbJ8EeGVoMiEqnxnnOhcmOYgSEnKzMx7SLVVVhdAbxE3HbM+r6SfKdUhm
 tCDoXmx4s0LHsWTzGvJuOIXA3DD9Rb/qdt5PW51j8d+UVo/p7FgGOU6wxVfSzzaH
 eka7Bfdgrl5UzOLpmTUO/hH5sBI2pa+Kgyuv0qTe/3q6R+Lq79vBGB6ZZs17eBsV
 +x6g7Zfp9BrZtjIF7z/RPfByoReK3zbqN2cA8iQRjEUR4WvNSUYRCL/hKM0rs7oS
 V0M3rFAI3mncY7lVeXnju6e5FHRs0+SjjSlD2Ut9s32QkcpvLl0nEJ2Q58oujxOp
 Js2hxbx4Sg/BPg==
X-ME-Sender: <xms:1-G0XjxL6ZifXF5b3IIK0DFNA0lbfpU_lmrcz9eJTnPHrsYGYVSZOQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrkedugdekvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeevfefffeekte
 fgveegfeelheffhfeujedtjeevtefhkeevkedtjeejvddtjefhjeenucfkphepudektddr
 vdefhedrfedrheegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:1-G0XrcjZpw0jvjaBD2atbpflH0EjHmsqGV9NNfbOeSHjCbbKNoEcA>
 <xmx:1-G0XrqttpdfPqpZcuxzeaE0NC5wQ266iv9NkGWJcGqmdGj0z7-Tlg>
 <xmx:1-G0XrRjL0xz6R9j5V0ZLHelRPkU_HuCwGkE2VsCP4IwQ4Es57TIVw>
 <xmx:1-G0XhJI-ggAKH75rBr-cr50N06w5FIRjQK4rliRwwclC-6NzuMPgQ>
Received: from workstation.flets-east.jp (ad003054.dynamic.ppp.asahi-net.or.jp
 [180.235.3.54])
 by mail.messagingengine.com (Postfix) with ESMTPA id A170E3280063;
 Fri,  8 May 2020 00:36:38 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Subject: [PATCH 01/10] ALSA: firewire-lib: fix invalid assignment to union
 data for directional parameter
Date: Fri,  8 May 2020 13:36:26 +0900
Message-Id: <20200508043635.349339-2-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200508043635.349339-1-o-takashi@sakamocchi.jp>
References: <20200508043635.349339-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org
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

Although the value of FDF is used just for outgoing stream, the assignment
to union member is done for both directions of stream. At present this
causes no issue because the value of same position is reassigned later for
opposite stream. However, it's better to add if statement.

Fixes: d3d10a4a1b19 ("ALSA: firewire-lib: use union for directional parameters")
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-am824.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/firewire/amdtp-am824.c b/sound/firewire/amdtp-am824.c
index 67d735e9a6a4..fea92e148790 100644
--- a/sound/firewire/amdtp-am824.c
+++ b/sound/firewire/amdtp-am824.c
@@ -82,7 +82,8 @@ int amdtp_am824_set_parameters(struct amdtp_stream *s, unsigned int rate,
 	if (err < 0)
 		return err;
 
-	s->ctx_data.rx.fdf = AMDTP_FDF_AM824 | s->sfc;
+	if (s->direction == AMDTP_OUT_STREAM)
+		s->ctx_data.rx.fdf = AMDTP_FDF_AM824 | s->sfc;
 
 	p->pcm_channels = pcm_channels;
 	p->midi_ports = midi_ports;
-- 
2.25.1

