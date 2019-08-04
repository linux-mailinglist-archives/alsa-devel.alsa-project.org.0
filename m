Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0BD809A6
	for <lists+alsa-devel@lfdr.de>; Sun,  4 Aug 2019 08:25:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 129A616B8;
	Sun,  4 Aug 2019 08:24:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 129A616B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564899945;
	bh=9Yk+SUNlt2Ssi0ZLXZrXblJfiDVJAHwYX9tVKhdQ78E=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AhjwmsOGNUH3g1EKLPfS9qEkrDOqNBHP3/8GcQU2bYmLOSCoIrlcl4T+KYPq4ugcJ
	 OdfcS4XstC+emtE2HYbjYYHi0LndoTpu2pqJjG8Q0LwWSMLGcRPCacMgjax6Tunzyt
	 hhmdm6h9okXTctjGrGndt55p+Y/lrPFO/ajCk2fk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C933F805F5;
	Sun,  4 Aug 2019 08:22:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CB087F805A8; Sun,  4 Aug 2019 08:21:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DB899F800F4
 for <alsa-devel@alsa-project.org>; Sun,  4 Aug 2019 08:21:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB899F800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="Dv2C/AzS"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="h1nVMPKv"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 4C4D821947;
 Sun,  4 Aug 2019 02:21:47 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Sun, 04 Aug 2019 02:21:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=yCWSxI1pk04bL
 aC6AVU8zvkfcMkksDgoNfBSw8qh7yA=; b=Dv2C/AzS+q5K+cxRdm18dXGnhEwH2
 Jeuz5ICgjWacOvA47UJf1GHbQmodtFDJYbr35egcpbORlPUua/4ARwEv6aZbofAh
 Euz9zAXod3eTGIoePMYcGQzT2fFnoVV7hhmWtBnhwDC+Z7oxh1NA3ZusgtHgMgdT
 +XIahtQbGZgYEuEXQClTTnQZZUw4RKw+Jp4nXQr6b3huoEUmFPCA062HGCuG1vqU
 nP7kHcqe56w4Pb4lVYbcMYYg1tG9y5dmi/TkE874E28Z6kugM/HMNI+TPt8YGhgl
 kGTZ+Nl/UQTuW9DUewjes7TlujJrWsDG1J2yhaEoONaes8gq+8JMlec6g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=yCWSxI1pk04bLaC6AVU8zvkfcMkksDgoNfBSw8qh7yA=; b=h1nVMPKv
 lEARAH2vsUIl9MJOtGklrBqoDfEtw8XyzVzqq5Ls1wPs2o9DKF/4gnfkgsxVrunT
 bobvvYV9siPb3kuAJW+FsPusjkjKfBO3WjshQA0t4bRYqudiqrit4iQcAXQlxbY2
 5CFJVh78naEGuiPXrQJk1Za76LFe7QcVnLzBpi7HXKVahNfXqmNmZOtCkg+ugLx7
 qD0QMJicl1RIS6cI1BwNhvIqV9QM/dRPY2I1W0BDJDyVCI6vSA7Y7my3Th2G40Q8
 /NAXHX++XaRkWcc5j3zfenbdvclKeB77W745fyZu8qdQwNnaK1BJaDCZ9lnGktDI
 7QGLnNdxO14pkw==
X-ME-Sender: <xms:e3lGXV213FZljanleN_d7KTBz16flyheyES3kQagCL2_ec2zQN0kCw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddruddtgedguddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgepvd
X-ME-Proxy: <xmx:e3lGXSFmOvep-0uNVVJqi2yezDFgpXyF0b75hibaN-RfQRDSpYr7nA>
 <xmx:e3lGXTgYVLSAWUoLhI6WBu2BPUOufyEU1wxOJQ35Cb6q_8MylVXInA>
 <xmx:e3lGXd_oCmHMG0eo6hTEDvwD95SqMpYpLzKyvDaB9SL2ZD71AbEpbA>
 <xmx:e3lGXfCvpdxcFoEEu0O8bsdfpUR4XCcbMdtLhZ1RvnTtU3WMeicctA>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id D510B380084;
 Sun,  4 Aug 2019 02:21:45 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Sun,  4 Aug 2019 15:21:22 +0900
Message-Id: <20190804062138.1217-4-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190804062138.1217-1-o-takashi@sakamocchi.jp>
References: <20190804062138.1217-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 03/19] ALSA: firewire-lib: add a kernel API to
	add AMDTP stream into AMDTP domain
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

This commit adds a kernel API to insert AMDTP stream to list in AMDTP
domain.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c | 26 ++++++++++++++++++++++++++
 sound/firewire/amdtp-stream.h |  5 +++++
 2 files changed, 31 insertions(+)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index 31fc90f76443..fa7989ee4769 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -1159,6 +1159,32 @@ void amdtp_domain_destroy(struct amdtp_domain *d)
 }
 EXPORT_SYMBOL_GPL(amdtp_domain_destroy);
 
+/**
+ * amdtp_domain_add_stream - register isoc context into the domain.
+ * @d: the AMDTP domain.
+ * @s: the AMDTP stream.
+ * @channel: the isochronous channel on the bus.
+ * @speed: firewire speed code.
+ */
+int amdtp_domain_add_stream(struct amdtp_domain *d, struct amdtp_stream *s,
+			    int channel, int speed)
+{
+	struct amdtp_stream *tmp;
+
+	list_for_each_entry(tmp, &d->streams, list) {
+		if (s == tmp)
+			return -EBUSY;
+	}
+
+	list_add(&s->list, &d->streams);
+
+	s->channel = channel;
+	s->speed = speed;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(amdtp_domain_add_stream);
+
 /**
  * amdtp_domain_stop - stop sending packets for isoc context in the same domain.
  * @d: the AMDTP domain to which the isoc contexts belong.
diff --git a/sound/firewire/amdtp-stream.h b/sound/firewire/amdtp-stream.h
index ab2a69180240..4b102fd7529d 100644
--- a/sound/firewire/amdtp-stream.h
+++ b/sound/firewire/amdtp-stream.h
@@ -172,6 +172,8 @@ struct amdtp_stream {
 	amdtp_stream_process_ctx_payloads_t process_ctx_payloads;
 
 	// For domain.
+	int channel;
+	int speed;
 	struct list_head list;
 };
 
@@ -277,6 +279,9 @@ struct amdtp_domain {
 int amdtp_domain_init(struct amdtp_domain *d);
 void amdtp_domain_destroy(struct amdtp_domain *d);
 
+int amdtp_domain_add_stream(struct amdtp_domain *d, struct amdtp_stream *s,
+			    int channel, int speed);
+
 void amdtp_domain_stop(struct amdtp_domain *d);
 
 #endif
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
