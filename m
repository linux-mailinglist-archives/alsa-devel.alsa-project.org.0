Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05EEE336B9D
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Mar 2021 06:27:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8FA26170E;
	Thu, 11 Mar 2021 06:26:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8FA26170E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615440446;
	bh=/w4VIcxS8vrH/sSZvqN9w6UZmSo6kozRlXSNQzzU+CE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RKS7cgmuOMbIHQx3gapqhcr1l+mUTpXbT7ROzksWorC0rRBn7NzmAeP8AgXb4+wjD
	 QySFdP08rZyQTpZF6wWwlGQRATORX1z9A3Qc5Qb+ey6txfpf0gaVqGxbezzXQPjPy4
	 /ZOJWM2/zjFGwH7PjF9j6Fk16CPHNxJTa7y81Eto=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 36BABF804FA;
	Thu, 11 Mar 2021 06:22:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EDD1CF8032B; Thu, 11 Mar 2021 06:22:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 115D9F8032B
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 06:22:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 115D9F8032B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="kUGb0xSD"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="IW2k6GJt"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 61A782F88;
 Thu, 11 Mar 2021 00:22:08 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 11 Mar 2021 00:22:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=J9guudtb6Eogk
 0WZpXeQnCskSuocbkmRpzRjcLI3Lik=; b=kUGb0xSDsDAvFejFzREd1yiltyLhU
 UEtwSAUeXUHce0dkVpLQ+xLJo6EoI+h5c2FAZuf8P5tGVUcdL1YWQ8QNt2HeMGa1
 6VC+5M2fE+IKqKVFdpPj+WV+bleOrZ8e/w6/DjkSxeBXrg5DBpJStQOoGQFp6AgO
 HnpdupZMQuGupXNXDgnbuYoeRXeGo8lYl8ugcqxherZKK0vAa0QE4UHX6DSCcymZ
 t1sB4xcKVuPAlBu9HypuQ5r5SYsSaxLPW47eUqm740yD0OSexceO0cbibzcJpG8C
 V5YorGCB3xnICpXZK+12Fg26xZgMBw48g/zUuENhCZOx3LUCij7+lQd5w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=J9guudtb6Eogk0WZpXeQnCskSuocbkmRpzRjcLI3Lik=; b=IW2k6GJt
 M+JyUT5KA9vUYhIjPLI93tpMjgh7qBn9dmzMvHiNCNBesWNCUWXQRWwewBM+/E0k
 mFKEwUwsN3EjRHv3phsBCYBAtZVqHcPimPtsz4kMapXyAniJq7NLhq/g6OyQTqYN
 tHUCVI/WnywhYnvAenIHVIldvOnAuWCoDStwgWDIeh6pUweoeztW3pWXs0URM007
 xzRE4ooWf6tLTIN5amaSqHgRO1QoFXPXun7TODDrh+XdoBIksCWj/BpRXYkVZwh9
 mrAPWccEamk3Cgm/lCcYu7y8SijBX1ql2zyjEquV7hAo9SGy48sQA7je+amhX/ZE
 2BTP+IPFLEwKHw==
X-ME-Sender: <xms:AKlJYCnpqzx5l-IyF7okKDKgGi-_h24AifzUNXOs8w6IWVxwUXf0Tw>
 <xme:AKlJYJ04bxA0ZfFJAIqGqQYPRJ-H_l6NGjRpm9wOWCzs5_JubToNzPdgbb5FBSHBb
 pFrkcJzfz1qC-GIMeA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduledgkedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecukfhppedugedr
 fedrieehrddujeehnecuvehluhhsthgvrhfuihiivgepgeenucfrrghrrghmpehmrghilh
 hfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:AKlJYAqBVDqrisquQGIEyFeJhBP0Nr_rpli2cZ5n4X43rtO6e9KpeA>
 <xmx:AKlJYGlZBagmqzQ5vQl1wTF8Wj3ukAn0Prk4gnuybNUR8Saxt2FA4A>
 <xmx:AKlJYA0sqw9eEb4tgG5kV-DiJCSqWjY_4ogN6B4JKHVciZCE1V7QxA>
 <xmx:AKlJYF_1yAUToTK_A7d4ZPDgPncL08Q25698b_w9MN7ewaO-KcFYzA>
Received: from workstation.flets-east.jp (ae065175.dynamic.ppp.asahi-net.or.jp
 [14.3.65.175])
 by mail.messagingengine.com (Postfix) with ESMTPA id F3CB5240057;
 Thu, 11 Mar 2021 00:22:06 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de,
	perex@perex.cz
Subject: [alsa-utils][PATCH 12/14] axfer: test: reduce test case for maximum
 number of frame count
Date: Thu, 11 Mar 2021 14:21:43 +0900
Message-Id: <20210311052146.404003-13-o-takashi@sakamocchi.jp>
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

This commit reduces test case for maximum number of frame count so that
overall time is shortened. The count of total iteration is still the same.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 axfer/test/container-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/axfer/test/container-test.c b/axfer/test/container-test.c
index 4e2dcc2..788507b 100644
--- a/axfer/test/container-test.c
+++ b/axfer/test/container-test.c
@@ -300,7 +300,7 @@ int main(int argc, const char *argv[])
 	for (i = begin; i < end; ++i) {
 		err = generator_context_init(&gen, access_mask,
 					     sample_format_masks[i],
-					     1, 128, 23, 4500, 1024,
+					     1, 128, 23, 3000, 512,
 					     sizeof(struct container_trial));
 		if (err >= 0) {
 			trial = gen.private_data;
-- 
2.27.0

