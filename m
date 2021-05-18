Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7358038745B
	for <lists+alsa-devel@lfdr.de>; Tue, 18 May 2021 10:49:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07B3116D9;
	Tue, 18 May 2021 10:48:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07B3116D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621327758;
	bh=ecXGP7UvcqAeddWVujTRhp5wXlYTu+1U5pTQO+kYzP0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Wl0P2NbzTDHEs04b8pje6xsnQC77cPxvH8A3WfLRrjNdWCvC0K1uMPDLV3NCf0tb8
	 Vue7IUgwnBkk3MGPn406Qo/VYZ+ipxYYFChcxHQT7w25R5wyuUUAyPYyC0zmk0HPwH
	 Qk6oZ71pbRsrJx5S6QXxuro2eg5bkhroPuCnLR64=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D05FAF804B0;
	Tue, 18 May 2021 10:46:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CECA9F804A9; Tue, 18 May 2021 10:46:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B643F8012C
 for <alsa-devel@alsa-project.org>; Tue, 18 May 2021 10:46:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B643F8012C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="S3n5ecyD"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="SnjVgBzf"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 3D9C05C0117;
 Tue, 18 May 2021 04:46:10 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 18 May 2021 04:46:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=70ipNRkwOuqh7
 Y/8xTJRyXNS0tI5YWloNgWLpub/Vho=; b=S3n5ecyDZlJUsMOlbWSlvoc4jmUQy
 vJ6OfqpYBHxmQ5e7jxIxS5ODiCXdBLhlLfaoLIHMY8xd8sYUmvhn8w1l4aRxRzyI
 LWKqaDPEN7PCGI0FpywYzbH2+7rC1b+Dle3AzC347Vp5aXCXYYC3zeemsTrbk1dY
 ZSDI42wf9YWx0QSkz06RLoBomKB/Xks3KJnjaJlyaEsan31oVlbvFEoG0iZo81VF
 d8FiilD7clsNQ7gvIloiZVttM7zAEe/WZ/B3q4wjGkkNm7q/JvliPfY4mFZ7IvX7
 B65VuI+zxCVe181vBspR12OvFYcShoJMB+QomW0KsTKsV2ZIM/lhVuXqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=70ipNRkwOuqh7Y/8xTJRyXNS0tI5YWloNgWLpub/Vho=; b=SnjVgBzf
 lsHOukd3YlBSrps8U34ISK6SPYcRN6CmAk+QFkN/vBqzCcMsj18bGLqb+tltN9U2
 eekmvxkskn300pleONBtXO0hIbPw6VdVcpxxP9RQEp49E6ud1gKCURWVNV67Wrso
 Xr7/FJwZ3KNAsLlGkxK1SoiHz5mIy7jeaOZrJNwpIdI7qiJkxptrGulQnuJA65BB
 32+FdCgiDsBRXOzg79pn/4A2PaijOcjcvskjaETPH7pXRxxPWS55+z/eozF/YBzP
 O6wvhiQW0Yn++Q6hvCIOGF8yF+qWLCvOyJVr6os0ifAO591Cob3m0qIjPXBJiXE6
 fXKpdhqvPvOsKw==
X-ME-Sender: <xms:0n6jYOstLizBQK2ho6c7--beovMugDv9M-RB0-Y3iDqsT-minHqYiA>
 <xme:0n6jYDfLhLOJ3CZHUP55MHInSKtLzck1AiQ0o4fFgEhK6XMzbrFU2BStWhd0_GRHk
 fYFBued1np9Os5K8hg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeijedgtdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecukfhppedugedr
 fedrieehrddujeehnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilh
 hfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:0n6jYJxIMr58f6NpKCYFuYOBO0_RlJw0GaaSBiq3xhISC9YwmvxLKw>
 <xmx:0n6jYJN-WKWDaVKljB7Kviv0mQf1Jys9Y4vWZnMIjvqbAks_S4rmqg>
 <xmx:0n6jYO-6LU5T8MAsmF5WMPGKFGKjSOkQvP1j2Zi9Oz3n6wMUw_IRaA>
 <xmx:0n6jYDFdbUqxascqtCI6ZByLxjoS10jdNyCU9grmtSrVFb3BFXtDxg>
Received: from workstation.flets-east.jp (ae065175.dynamic.ppp.asahi-net.or.jp
 [14.3.65.175]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Tue, 18 May 2021 04:46:09 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH v4 06/11] ALSA: oxfw: add explicit device entry for Loud
 Technologies Mackie Onyx Sattelite
Date: Tue, 18 May 2021 17:45:52 +0900
Message-Id: <20210518084557.102681-7-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210518084557.102681-1-o-takashi@sakamocchi.jp>
References: <20210518084557.102681-1-o-takashi@sakamocchi.jp>
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

Loud Technologies Mackie Onyx Satellite is identified as the model with
OXFW970 ASIC.

This commit adds explicit entry for the model.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/oxfw/oxfw.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/sound/firewire/oxfw/oxfw.c b/sound/firewire/oxfw/oxfw.c
index 998f0da6fd5b..e851149c5280 100644
--- a/sound/firewire/oxfw/oxfw.c
+++ b/sound/firewire/oxfw/oxfw.c
@@ -46,7 +46,6 @@ static bool detect_loud_models(struct fw_unit *unit)
 		"Onyx-i",
 		"Onyx 1640i",
 		"d.Pro",
-		"Mackie Onyx Satellite",
 		"U.420"};
 	char model[32];
 	int err;
@@ -339,15 +338,14 @@ static const struct ieee1394_device_id oxfw_id_table[] = {
 	OXFW_DEV_ENTRY(VENDOR_BEHRINGER, 0x00fc22, NULL),
 	// Loud Technologies, Tapco Link.FireWire 4x6.
 	OXFW_DEV_ENTRY(VENDOR_LOUD, 0x000460, NULL),
-	/*
-	 * Any Mackie(Loud) models (name string/model id):
-	 *  Onyx-i series (former models):	0x081216
-	 *  Onyx 1640i:				0x001640
-	 *  Mackie Onyx Satellite:		0x00200f
-	 *  d.2 pro/d.4 pro (built-in card):	Unknown
-	 *  U.420:				Unknown
-	 *  U.420d:				Unknown
-	 */
+	// Loud Technologies, Mackie Onyx Satellite.
+	OXFW_DEV_ENTRY(VENDOR_LOUD, MODEL_SATELLITE, NULL),
+	// Any Mackie(Loud) models (name string/model id):
+	//  Onyx-i series (former models):	0x081216
+	//  Onyx 1640i:				0x001640
+	//  d.2 pro/d.4 pro (built-in card):	Unknown
+	//  U.420:				Unknown
+	//  U.420d:				Unknown
 	{
 		.match_flags	= IEEE1394_MATCH_VENDOR_ID |
 				  IEEE1394_MATCH_SPECIFIER_ID |
-- 
2.27.0

