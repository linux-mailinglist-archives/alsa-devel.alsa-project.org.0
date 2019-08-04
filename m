Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89191809A3
	for <lists+alsa-devel@lfdr.de>; Sun,  4 Aug 2019 08:23:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A82F61696;
	Sun,  4 Aug 2019 08:22:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A82F61696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564899824;
	bh=IlChtPzaDsf5slWGJh72umeRawyQkE/XquX6vJVQqm0=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VazWpgokc6paZlP//bVdI0ZSc6dgNYuqdRQP+5eE3BN1PUFHRKtWcjmGuWvpKyjm9
	 l3xRIiCX7ofL1pDddQPkGjNPXiyPSxO9YQ2znOI8f6O73Bmodu9LJXpW2pIGhIOPA4
	 BvNwoQAFsNflG6wMxPqD+1430XQM7fNQHHfpTDQ0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C4DE4F800F4;
	Sun,  4 Aug 2019 08:22:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7A89DF805AA; Sun,  4 Aug 2019 08:21:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0D458F804CA
 for <alsa-devel@alsa-project.org>; Sun,  4 Aug 2019 08:21:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D458F804CA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="brgpfKjp"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="geMwC/h/"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 42A9321550;
 Sun,  4 Aug 2019 02:21:44 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Sun, 04 Aug 2019 02:21:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=smIQuDuTm+2tc
 QpGTdXHAF7omGN/pgAuNE27v64h5oM=; b=brgpfKjpE/5x18cbl+3ADmYXa10zs
 rktoYiC/cqolM6zXQxBJSeiS5VTIlfmrcvRz4sHtz1fbdp/5u6rDI1hw4Ej1Thrb
 F/FYO97TL1P/HJZooxqgYGJ5N91I0Smrt67PNvSpK4DvlQCjpb4DRbbw0LtFjHTe
 St5Th9GXLgVKki+VCpz8W0ZQ6WDDt7HMnw1mFhnv49N8K5OV58pyytz3dL5BY0Cz
 Q8oo88rINvhR+bm37EOwLWqmTYrTrX4dxoVSSDe+PsIqrSh4c1229k9k8CNaYsJD
 7mkuYMDqX0NHcsVWJHh1TeXIltl6j5T7xQgBSTGEIpOVcC7OKQ4vn5BdQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=smIQuDuTm+2tcQpGTdXHAF7omGN/pgAuNE27v64h5oM=; b=geMwC/h/
 muk25TwTstoCi5ea/Ipx2zf+zSQkbIvWcMYJYF2r+XXklWRAC6uCtEcgpmnLymeD
 Au9g0VgnCuvTRYW1Mzbq4hpWalkWY3k0eI9bnQTRk2FU1yEhhNO4jrcz+eUpBXyW
 9BZNIyyQZrXtNDZxNdjWoV1ekLoy19cyCXMylAMP42A6QZ0KpcbMjnNvk52b8Zqt
 CT3dLJo9dakfnYaamGympTKhynaeUffgDFIgdszdpHVqnH+WVyX0E5qJm5ZA4voz
 bfe3xEGaUbXoiqJUhPhesn+T1Fy3JFDVlB4Lo1bAHD/uWaZer+hlCDtEz+RJweU5
 6a+ZUtZC41unzg==
X-ME-Sender: <xms:eHlGXXpHG4VcZW4GO3QeavtNUOyAu3MtlJk-_hN-dUn79TQEj23mmA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddruddtgedguddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:eHlGXbBWs7DrTUJ8_rAvV8kElJ5LB5eyBa28U3b9zxBq9-AtZK8v4w>
 <xmx:eHlGXctGfbbMifuJrM5xHZxCpBWlqjVk8BU3GbqD3HueTzi0_PDnEw>
 <xmx:eHlGXaYETsrtF_tGQGPhYotcBQPmBJV8onQjbeV8mmFBd6Fx4NGYgQ>
 <xmx:eHlGXT7-5Kfqv28VrQ6QL2Kxza2sIF-JN6xOMOqUvGYLtfrJM2wEGA>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id CBC16380085;
 Sun,  4 Aug 2019 02:21:42 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Sun,  4 Aug 2019 15:21:20 +0900
Message-Id: <20190804062138.1217-2-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190804062138.1217-1-o-takashi@sakamocchi.jp>
References: <20190804062138.1217-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 01/19] ALSA: firewire-lib: add AMDTP domain
	structure to handle several isoc contexts
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

This commit adds 'struct amdtp_domain' structure. This structure
has list of instance of AMDTP stream to handle a couple of
isochronous contexts.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c | 22 ++++++++++++++++++++++
 sound/firewire/amdtp-stream.h |  7 +++++++
 2 files changed, 29 insertions(+)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index 369e75e33120..02077696fa77 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -1136,3 +1136,25 @@ void amdtp_stream_pcm_abort(struct amdtp_stream *s)
 		snd_pcm_stop_xrun(pcm);
 }
 EXPORT_SYMBOL(amdtp_stream_pcm_abort);
+
+/**
+ * amdtp_domain_init - initialize an AMDTP domain structure
+ * @d: the AMDTP domain to initialize.
+ */
+int amdtp_domain_init(struct amdtp_domain *d)
+{
+	INIT_LIST_HEAD(&d->streams);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(amdtp_domain_init);
+
+/**
+ * amdtp_domain_destroy - destroy an AMDTP domain structure
+ * @d: the AMDTP domain to destroy.
+ */
+void amdtp_domain_destroy(struct amdtp_domain *d)
+{
+	WARN_ON(!list_empty(&d->streams));
+}
+EXPORT_SYMBOL_GPL(amdtp_domain_destroy);
diff --git a/sound/firewire/amdtp-stream.h b/sound/firewire/amdtp-stream.h
index 50041fa884d9..2378db4b4195 100644
--- a/sound/firewire/amdtp-stream.h
+++ b/sound/firewire/amdtp-stream.h
@@ -267,4 +267,11 @@ static inline bool amdtp_stream_wait_callback(struct amdtp_stream *s,
 				  msecs_to_jiffies(timeout)) > 0;
 }
 
+struct amdtp_domain {
+	struct list_head streams;
+};
+
+int amdtp_domain_init(struct amdtp_domain *d);
+void amdtp_domain_destroy(struct amdtp_domain *d);
+
 #endif
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
