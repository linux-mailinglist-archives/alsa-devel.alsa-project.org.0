Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A77B809A7
	for <lists+alsa-devel@lfdr.de>; Sun,  4 Aug 2019 08:26:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E76316B2;
	Sun,  4 Aug 2019 08:25:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E76316B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564899978;
	bh=F5fTCDEBr1/a9GuEi3yU/pbziPf8074o3sruf/8+1e8=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NTmtrj3BspUaTnLb1kEO1iLxs49M1EICKZx84mtC0avMaXigLYrbwRechX4q8SopX
	 zq0kInRr1mGwmrMpZvEGVca8aqfXV+ArGxpEYHthTzMmCFdFmHNMqQbyI4PWKRz9DE
	 0DKarLvp/an7hqPHXp+wMbcV5W5BpOC1FX4LX0pQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 06C89F805FF;
	Sun,  4 Aug 2019 08:22:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CDB07F805A1; Sun,  4 Aug 2019 08:21:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C43DEF804CA
 for <alsa-devel@alsa-project.org>; Sun,  4 Aug 2019 08:21:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C43DEF804CA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="PRhzR26A"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="uJ08Mvb1"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id BCEFC21650;
 Sun,  4 Aug 2019 02:21:48 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Sun, 04 Aug 2019 02:21:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=8Q3ki6SokKQIx
 D0OcMVfFQ0Vxolf80vnY/gD8X0p+0E=; b=PRhzR26AbUllHkZ0m2zjrkroDxjC5
 6TtB8PlAAdcaSNJ5eHWf0JSRvNq+fWi5m3PFxtoZorpIJBDTW2+HOtbtE/yXYiZU
 uXHz8LLGVhOZgbj8x3tMj3qh4H3i89kRcUKil75vXdvrLefHszJsgM6K60vlzWzi
 PSaYfrmexvRaCh35VKiyma2S0FPwS0zhy8gwsSjnY/ueHUKxyHYm6lgoq+yk6aeP
 Un0mKaz3kAFgeoTxjXEbSp60bsIZFoH5aKChSKXCTy0ns5eE6u6x8L1A+XpzGV6Z
 QJ0FaOYRZMfmO3exa6Vt4G6CWsQs/uC8077v4Q7pIBgIgXWhl+tWn2F0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=8Q3ki6SokKQIxD0OcMVfFQ0Vxolf80vnY/gD8X0p+0E=; b=uJ08Mvb1
 GdieRfZDNfqXxTO8Z80+92F9Mo+MNbhYL5jYGijRTPS520M+d4L+qSrt3OGRSo5A
 r+h9lbcLsAkwuAGJG6kiQjs2kwz2nKKLJOucIe/O5H/nPAoORQ/U7AFnb15OGo/n
 HUyULqFONvokEljwHGxamjXSG3kGiaqegOhtCHjxAs3zdyJUjEQK3GTR8ArSzVF6
 xYk5KsyCFZaTVtRFKTANIJSH6FyTBBE7DfWB6yEOq/V+28w+Pc/Ob9NylMWignid
 +UGOqPBlY1tOuqqB3P1vYDGNo6O4YTs1KsS2Qj1UT9VejwKOPtLtiP19dCxJWZGn
 HZ2SgKLcof9/XA==
X-ME-Sender: <xms:fHlGXQrr0Py6Rg7bbVuGwxpGGXOOvIkLRujAMRmCkBE30S9n4xuXag>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddruddtgedguddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgepvd
X-ME-Proxy: <xmx:fHlGXYf6_7bGw2ydTrSAW_svkBKZPWuFwJgmVjww38Mw8XuAty69TA>
 <xmx:fHlGXW8f7IrtvSU5Mt15zxtv1dJhxQBTuwwg0Nm_TWIFUl9ERSaj6Q>
 <xmx:fHlGXZHmPE8P3HmKutSSMmB4vhDvTIKFZ2Vjg8QmAcfiibUzj08vcQ>
 <xmx:fHlGXRKgm-hYVxxGZ38K0t0EGwpnhBnQY18q8PxzPHAotchr7VlXmA>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5FC4A380084;
 Sun,  4 Aug 2019 02:21:47 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Sun,  4 Aug 2019 15:21:23 +0900
Message-Id: <20190804062138.1217-5-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190804062138.1217-1-o-takashi@sakamocchi.jp>
References: <20190804062138.1217-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 04/19] ALSA: firewire-lib: add a kernel API to
	start AMDTP streams in AMDTP domain
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

This commit adds a kernel API to start a couple of isochronous contexts
for some AMDTP streams.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c | 24 ++++++++++++++++++++++++
 sound/firewire/amdtp-stream.h |  1 +
 2 files changed, 25 insertions(+)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index fa7989ee4769..158d210caea7 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -1185,6 +1185,30 @@ int amdtp_domain_add_stream(struct amdtp_domain *d, struct amdtp_stream *s,
 }
 EXPORT_SYMBOL_GPL(amdtp_domain_add_stream);
 
+/**
+ * amdtp_domain_start - start sending packets for isoc context in the domain.
+ * @d: the AMDTP domain.
+ */
+int amdtp_domain_start(struct amdtp_domain *d)
+{
+	struct amdtp_stream *s;
+	int err = 0;
+
+	list_for_each_entry(s, &d->streams, list) {
+		err = amdtp_stream_start(s, s->channel, s->speed);
+		if (err < 0)
+			break;
+	}
+
+	if (err < 0) {
+		list_for_each_entry(s, &d->streams, list)
+			amdtp_stream_stop(s);
+	}
+
+	return err;
+}
+EXPORT_SYMBOL_GPL(amdtp_domain_start);
+
 /**
  * amdtp_domain_stop - stop sending packets for isoc context in the same domain.
  * @d: the AMDTP domain to which the isoc contexts belong.
diff --git a/sound/firewire/amdtp-stream.h b/sound/firewire/amdtp-stream.h
index 4b102fd7529d..15d471660a43 100644
--- a/sound/firewire/amdtp-stream.h
+++ b/sound/firewire/amdtp-stream.h
@@ -282,6 +282,7 @@ void amdtp_domain_destroy(struct amdtp_domain *d);
 int amdtp_domain_add_stream(struct amdtp_domain *d, struct amdtp_stream *s,
 			    int channel, int speed);
 
+int amdtp_domain_start(struct amdtp_domain *d);
 void amdtp_domain_stop(struct amdtp_domain *d);
 
 #endif
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
