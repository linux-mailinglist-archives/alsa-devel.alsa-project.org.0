Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB6B381678
	for <lists+alsa-devel@lfdr.de>; Sat, 15 May 2021 09:14:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2FD71677;
	Sat, 15 May 2021 09:13:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2FD71677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621062841;
	bh=8ayjLbVWf3C8BGPZC60BiLFPymypO7X5DbaciqOP0y4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FasSPh5yNoBEt0dvWkOIgGrXDr93qHclB72MNDkQ2IWbeq/lVtfvjvhufWqnao2S9
	 T5QMBZNLFHr9zNCcI6eQm+RogMCEJSpQFClnfjkRZaMOhJM5hLQFxV3A8jlvEGT5zk
	 KrK3qZVg9JLV5EWe2h1gEt71btFl7vtZEMNHXw7o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DE405F80245;
	Sat, 15 May 2021 09:11:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 38760F8016B; Sat, 15 May 2021 09:11:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4183DF8016B
 for <alsa-devel@alsa-project.org>; Sat, 15 May 2021 09:11:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4183DF8016B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="FmXCYPmi"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="DCiRWra2"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 719615C011D;
 Sat, 15 May 2021 03:11:21 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Sat, 15 May 2021 03:11:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=yy4KErEXtjHja
 I46tRlfO8xAp9Q7omE53IZRt+oG4NI=; b=FmXCYPmi6xDq+436qnOWP7Jlm95nY
 I+GAYUTdrU7RQbmdyrv+Zd/oQudbZG9fY72cVD5bQzdiOoTonQWGhWgB7z8GL21O
 6ujEJPn7EDV+48OZbV4xqy0i2zPaeZIPVcm4G9uBg2auS47B7gj1NuLOP9pXwqZ6
 nrWnJ2ZXnlwLg00tNA9v/V8W6Cy7SNTPHrEexEvld4X5lZ38QVGlggzyoye8ladO
 4klGVR4s2/4b7dlF33fbJCWCdMLbzlhuRafAhRZ+MD2M7ZXUzPfa7KyiaBR6O6UD
 0/zNvUwzlqCRdTAhobeg1N9K/g6paqM3B5j3bEUBbPV+W5bAuHcmJomCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=yy4KErEXtjHjaI46tRlfO8xAp9Q7omE53IZRt+oG4NI=; b=DCiRWra2
 Hedx/Dc/6vLhBSBJIlBD4EI2HoiJhHY0wTdzQokFVRD6WUARfRNR64tNvyIZffIO
 aQAbXHOnfeFhY8rAmQv7G+M8ijxhjNjP0NF3aZxz4XYl5uqFPIHSZq3ZcT25NfL3
 5njU6rta2VNWF9JQQGDZKOa04PZFxPN1sjSYEuq/l9qXntib+VyCXkeFm9NaZDq6
 Ze6vXGzqYoOz7TE6CG0k6orqBu0bKlJj9CYvtXqa7worlCViXh1hGAYXbobj8BD7
 y5bx+TlJYXSuHn4wiRfyaK5/tmGihBu4cTCg4v2h1JqvJhlNE7B0d8hbKyXqLz7k
 j3/Szr8Sx9Wj/Q==
X-ME-Sender: <xms:GXSfYBcJjCkecVxROv9piJmR0dYJJHNjZjeUN-2KPRqyIx4XGUl1UA>
 <xme:GXSfYPOk9Bu1F7Nr2uNtn0QuqNhnY8Mz-RbWIprJJFMN3p4aQpyaY_ibpMAcm3hoC
 DL61StQ0e3TA3_c3dQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdehledguddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecukfhppedugedr
 fedrieehrddujeehnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilh
 hfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:GXSfYKjlwHQEBe7ew7gpS90cZNL1ske4BoK5X8SCLNcbdp0JlDX2rg>
 <xmx:GXSfYK8kOrAHDf7MJfRi7NA3bLoEZ4jvVZ1ZPq5IfOPVFhQIAqXvVw>
 <xmx:GXSfYNucThXQ73DakHwMoB76rchCNNZJT1BFQUHBTqbvqgpQTionhA>
 <xmx:GXSfYL0PFo0ym7Bo8nGDEUpP_QCi328Hk9OIW5GVWgjMY-7F2N-tOg>
Received: from workstation.flets-east.jp (ae065175.dynamic.ppp.asahi-net.or.jp
 [14.3.65.175]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Sat, 15 May 2021 03:11:20 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH v2 03/10] ALSA: oxfw: code refactoring to detect mackie models
Date: Sat, 15 May 2021 16:11:05 +0900
Message-Id: <20210515071112.101535-4-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210515071112.101535-1-o-takashi@sakamocchi.jp>
References: <20210515071112.101535-1-o-takashi@sakamocchi.jp>
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

This commit changes condition statement to call mackie models detection
just for the device entry. Additionally, comment is added for Onyx 1640i.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/oxfw/oxfw.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/firewire/oxfw/oxfw.c b/sound/firewire/oxfw/oxfw.c
index 7be999c61730..2af72951ebf8 100644
--- a/sound/firewire/oxfw/oxfw.c
+++ b/sound/firewire/oxfw/oxfw.c
@@ -245,7 +245,7 @@ static int oxfw_probe(struct fw_unit *unit,
 {
 	struct snd_oxfw *oxfw;
 
-	if (entry->vendor_id == VENDOR_LOUD && !detect_loud_models(unit))
+	if (entry->vendor_id == VENDOR_LOUD && entry->model_id == 0 && !detect_loud_models(unit))
 		return -ENODEV;
 
 	/* Allocate this independent of sound card instance. */
@@ -341,6 +341,7 @@ static const struct ieee1394_device_id oxfw_id_table[] = {
 	/*
 	 * Any Mackie(Loud) models (name string/model id):
 	 *  Onyx-i series (former models):	0x081216
+	 *  Onyx 1640i:				0x001640
 	 *  Mackie Onyx Satellite:		0x00200f
 	 *  Tapco LINK.firewire 4x6:		0x000460
 	 *  d.2 pro/d.4 pro (built-in card):	Unknown
@@ -352,6 +353,7 @@ static const struct ieee1394_device_id oxfw_id_table[] = {
 				  IEEE1394_MATCH_SPECIFIER_ID |
 				  IEEE1394_MATCH_VERSION,
 		.vendor_id	= VENDOR_LOUD,
+		.model_id	= 0,
 		.specifier_id	= SPECIFIER_1394TA,
 		.version	= VERSION_AVC,
 	},
-- 
2.27.0

