Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92DCD336B63
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Mar 2021 06:23:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2416116FF;
	Thu, 11 Mar 2021 06:22:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2416116FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615440221;
	bh=fXzADS1kq2dZtVPzavTTOVod7u+a/ibR0BQErc0xOsk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O7QgE7PLI4/tkwCINDHm2pMDKgQNEpbr63wHqHVJtjwkFeUVvDS29Vh5ewe/yFs3W
	 f0gvH4BdBqmrd/ZkCIX4VJhKgkgu+7xWzfi6Euv2RUP1BRYw5ZrpXABtYLwX+IYYqj
	 vraO11xPNb94CeshFq0H/BIlv+6oLc6ioxOwMelw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6091CF80423;
	Thu, 11 Mar 2021 06:22:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1DB14F8019B; Thu, 11 Mar 2021 06:22:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 788D8F8019B
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 06:21:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 788D8F8019B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="EcMimhCj"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="qDNZ9MAa"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id C2D1E2FA6;
 Thu, 11 Mar 2021 00:21:55 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 11 Mar 2021 00:21:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=woD/s1xL3qGTy
 n5onCrVICODUISrJwFGDBfJAjXoCcg=; b=EcMimhCj5GzcFF+YsySRu70XPzjad
 4NtsMks9uHNMnVYFDPOOiQOlRg5m6uKZOp457T+GYDS9IqQDo5WIf8YUz3qD6Fhl
 a/1RtKsl0OXHFJjRKUYXdz6X4Yp/+nSlvtF0piBnMq+wYm8s/XdUXdaJUsN37f1H
 +lv81a3twzlGbwoBEp/qxvvrTRqbkcOGwMFYNIktPiDkw2TrVI6dWdAxpZlQIPuH
 A+lM5szcHL4cEBr+oKIkIiRa98Jt6aqYqSAwRKBoxoHoeTl9G4OQH4pbZCb4v/pg
 kW+tKIH3raj8DY7Ipn9Ek+BEdInBzsfr7wPreJXh3M2OXnUJdvybFEGVQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=woD/s1xL3qGTyn5onCrVICODUISrJwFGDBfJAjXoCcg=; b=qDNZ9MAa
 wdnJIcIdkHTNZNcmN6NMI8cl7DIilBHS6Tn69EjJ+MgyASH7V8mcw+kvZDP6xDIO
 JEwwHCqEv3dySEmiagWixtnJlbgOQFhgUphzInL3O549HlpyPhqNwugU2iXbMT1V
 zpTw9Sa+ir5F9vDHHSE2ANY2u1ieGB37JCKr/+s5wsHzfqHvOl8YkU4mxsoNVS50
 g4HtgUH7YcMLns2INqDXkZV7nl0dNii8X1c0J0BfnCdRpxrmCjmdknMeuypX+cO0
 5MYOKBpsjzY47WmDcB50FbwRVZKE+iHnrg2/NuGSm9VZlLh1YWF85G/Fwlrj7Jku
 ryDyrMTtUIGFBQ==
X-ME-Sender: <xms:86hJYI7iyaXxQDLnNlzWMUTdlOiVlgPxAj85qrZGe2OlqBkwQLXDww>
 <xme:86hJYFVY_0U-rDn71wTpBR4yXjCX1gMIIGHkppSchs3j-ZiYP_vx6RKPbKn4q0tzl
 CvtP_fyMw4TwpLGF80>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduledgkeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecukfhppedugedr
 fedrieehrddujeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:86hJYK8NXONtumB_FArxdL7T2fvBkwDSNX_HPUzysfcEaysrBHTb6A>
 <xmx:86hJYBn0_fwOdXXvPQmAHXnveN0dsz_WKEmBn9UwGKuS1xyj2BjXtg>
 <xmx:86hJYIX3jTkstEeYodkP0hs1yXm75EQcnw1UtrtmvZNtMIRR8XMncQ>
 <xmx:86hJYE9mi4jdrsRSVuwb6iPt7JAdHkuozDnyIN8hfpy1A7e__DBtvQ>
Received: from workstation.flets-east.jp (ae065175.dynamic.ppp.asahi-net.or.jp
 [14.3.65.175])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5988F24005D;
 Thu, 11 Mar 2021 00:21:54 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de,
	perex@perex.cz
Subject: [alsa-utils][PATCH 03/14] axfer: minor code arrangement in a point of
 opened file descriptor
Date: Thu, 11 Mar 2021 14:21:34 +0900
Message-Id: <20210311052146.404003-4-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210311052146.404003-1-o-takashi@sakamocchi.jp>
References: <20210311052146.404003-1-o-takashi@sakamocchi.jp>
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

This commit arranges assignment to fd member after checking file
descriptor.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 axfer/container.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/axfer/container.c b/axfer/container.c
index fb35eba..b4646b9 100644
--- a/axfer/container.c
+++ b/axfer/container.c
@@ -151,6 +151,7 @@ int container_parser_init(struct container_context *cntr,
 		[CONTAINER_FORMAT_AU] = &container_parser_au,
 		[CONTAINER_FORMAT_VOC] = &container_parser_voc,
 	};
+	int fd;
 	const struct container_parser *parser;
 	unsigned int size;
 	int i;
@@ -168,12 +169,13 @@ int container_parser_init(struct container_context *cntr,
 
 	// Open a target descriptor.
 	if (!strcmp(path, "-")) {
-		cntr->fd = fileno(stdin);
+		fd = fileno(stdin);
 	} else {
-		cntr->fd = open(path, O_RDONLY);
-		if (cntr->fd < 0)
+		fd = open(path, O_RDONLY);
+		if (fd < 0)
 			return -errno;
 	}
+	cntr->fd = fd;
 
 	cntr->stdio = (cntr->fd == fileno(stdin));
 	if (cntr->stdio) {
@@ -239,6 +241,7 @@ int container_builder_init(struct container_context *cntr,
 		[CONTAINER_FORMAT_VOC] = &container_builder_voc,
 		[CONTAINER_FORMAT_RAW] = &container_builder_raw,
 	};
+	int fd;
 	const struct container_builder *builder;
 	int err;
 
@@ -256,12 +259,13 @@ int container_builder_init(struct container_context *cntr,
 	if (path == NULL || *path == '\0')
 		return -EINVAL;
 	if (!strcmp(path, "-")) {
-		cntr->fd = fileno(stdout);
+		fd = fileno(stdout);
 	} else {
-		cntr->fd = open(path, O_RDWR | O_CREAT | O_TRUNC, 0644);
-		if (cntr->fd < 0)
+		fd = open(path, O_RDWR | O_CREAT | O_TRUNC, 0644);
+		if (fd < 0)
 			return -errno;
 	}
+	cntr->fd = fd;
 
 	cntr->stdio = (cntr->fd == fileno(stdout));
 	if (cntr->stdio) {
-- 
2.27.0

