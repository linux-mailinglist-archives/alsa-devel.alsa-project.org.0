Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB10395411
	for <lists+alsa-devel@lfdr.de>; Mon, 31 May 2021 04:53:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E0B9A1614;
	Mon, 31 May 2021 04:52:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E0B9A1614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622429588;
	bh=wvgWJAtyGsTfZ8V1GTYprCS+NCIU6M9T7Pee2aX8HGw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oIc7H3zqCU8a+KfHGH2nw4uUdM48jl56vSRv9qIvHCFC10i3V666hEDncUeL/DD+m
	 l6ba2VOEtSc0bfBvdGDlAVowhnzz8/2gOOl76BaYVKxJFz+jiGsRib/jQ1f78AcJA5
	 C5uBnWEE+rdqcmYM/QXdDOMPTLu/zIE+sLnSKWhE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F3DEDF80253;
	Mon, 31 May 2021 04:51:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BDB17F80253; Mon, 31 May 2021 04:51:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D45ECF80088
 for <alsa-devel@alsa-project.org>; Mon, 31 May 2021 04:51:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D45ECF80088
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="tjSoMcyc"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="dz1Xo0Pg"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 922055C0087;
 Sun, 30 May 2021 22:51:09 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Sun, 30 May 2021 22:51:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=zjNo7JAiAcgmq
 SdCHVvHIrAGJF6ji6FT0R3hYwYEoho=; b=tjSoMcyc81CU0U0k3uQZaei1uU9dF
 nG3K5PQlqQhQl0Q7xkDb7T+T3QkiRnS6U2PA7xVAPEjI0OIIta8Y3SKRcqQvHSuq
 wh5Y2f/zIxl66QXAy/B7QCkF3DPFsHyrcYcQ+5Oc28IprwkFbvxNluaym9Li9jb9
 Vu2MUOUx5xHxiGz/IOkWdkr+aFdoIBhDyLwclEUmQkSRe5CjaNI0MtuTglLOzPsz
 GTgwBhj6RdCtkN1LisAJH2+//+o1UaXbs7CFYJLfaDEe6atDGJMawSLYl4NpgzAQ
 DWQAldac4i5dhOT8pcZ6FawtRiRGjqssCkhLsBBDx7m1/IuxDNhGVVHqA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=zjNo7JAiAcgmqSdCHVvHIrAGJF6ji6FT0R3hYwYEoho=; b=dz1Xo0Pg
 Jc/0dVgwRH0Rbm+qPfEPFxvtkNIJlOBJUREjNWiDFkBI7Bp3/82N5o5LzTIIG5IR
 zRiOxAYcsnXLS5wXYmW9bZpyEZLOlEBjbDjPs/Za8QMd0d61gyJFb+q9TPQzhAqa
 ldBN3oOf7/Ir3jHGQqyeB/FhJBgXAbbT5UT/zwiO/TzxaKKTsQnBpJa/eKWhfPyP
 eLG1wLSy4raZoBEWsHMPrcysNPO58V1Tvf+QznND++6hO/69Ulq/plPGrcrKpJAY
 yNS3S0agiamA/lu2TE0qgrj4PAOIpNcqV7MQlnOUpsLbP50bDe2pwguUkaG1myW2
 JvHup5z5c86g5Q==
X-ME-Sender: <xms:HU-0YKiGfxVW2TsFkSLMm5aClMP87MDRgHuzs44j0IcAZtYRp1xtLg>
 <xme:HU-0YLBhHdVkv9rLCVGxQXMPFoT0LP44uSlEGXN7aNdjaOc4-mFrZkyJnkqRCxrfL
 gBwxElQ7xUgJbCwxPI>
X-ME-Received: <xmr:HU-0YCEQ58jfCM1ngWRmTwzGTlUhqPC5dL-VFtxsK0Kk2sfQ6KPf1SGjKc6R3oK6zS1aTujUcbeZ0qeL0uBcEcpL8TB8J9ApdAfhFzXYkWyjaFH0f7vD>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdelvddgieefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecuvehluhhsthgv
 rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihessh
 grkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:HU-0YDTwLuRAgZVwggzxFH9pgkSuzU-4Z_qw4i3CAEhUQiRP9EAn5w>
 <xmx:HU-0YHzC_hcRrKV2VfZeE2x-FauXcX3ckJ47E2ynzWsJX4AyiY3TEQ>
 <xmx:HU-0YB7Tam36nj83fTExe7MdHti-JAEzITveXu4AY6-gkZ777n6Vcg>
 <xmx:HU-0YApOGLDALmZrv6E40apU71AXY87wEHZ6pTjNBf6bZHboRvMVuA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 30 May 2021 22:51:08 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 1/6] ALSA: fireworks: delete SYTMATCH clock source
Date: Mon, 31 May 2021 11:50:58 +0900
Message-Id: <20210531025103.17880-2-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210531025103.17880-1-o-takashi@sakamocchi.jp>
References: <20210531025103.17880-1-o-takashi@sakamocchi.jp>
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

In the design of Fireworks board module, the device does't adjust its
media clock voluntarily by the sequence of presentation time expressed in
syt field of CIP header of received packet.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/fireworks/fireworks.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/firewire/fireworks/fireworks.h b/sound/firewire/fireworks/fireworks.h
index 654e28a6669f..49e12cf7c0e3 100644
--- a/sound/firewire/fireworks/fireworks.h
+++ b/sound/firewire/fireworks/fireworks.h
@@ -181,7 +181,7 @@ struct snd_efw_phys_meters {
 } __packed;
 enum snd_efw_clock_source {
 	SND_EFW_CLOCK_SOURCE_INTERNAL	= 0,
-	SND_EFW_CLOCK_SOURCE_SYTMATCH	= 1,
+	// Unused.
 	SND_EFW_CLOCK_SOURCE_WORDCLOCK	= 2,
 	SND_EFW_CLOCK_SOURCE_SPDIF	= 3,
 	SND_EFW_CLOCK_SOURCE_ADAT_1	= 4,
-- 
2.27.0

