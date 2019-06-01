Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C79E931930
	for <lists+alsa-devel@lfdr.de>; Sat,  1 Jun 2019 05:10:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B5DC168C;
	Sat,  1 Jun 2019 05:09:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B5DC168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559358601;
	bh=q5VDW1jHBOgaAXgUxvh5k73w45qpJVWs3fyoM/vOpg8=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FYAGTTVNuoRLTOiLzDKoE/gRkGXN3SxB0z2K3LlLk01khi7NUWJiTIittiiT3+duB
	 AvU6URg1YhkwZLBYLWU4W/WPP8eKJ0oENW3FT0X3RVMdA3r3Ovy5xmDyvvz2xxqnf1
	 6MfMYCCd5EiXAUKP5MzsEfipw28i2M7tD9tT/bZs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BEFE6F89706;
	Sat,  1 Jun 2019 05:08:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AA25EF89706; Sat,  1 Jun 2019 05:08:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 44F80F8072E
 for <alsa-devel@alsa-project.org>; Sat,  1 Jun 2019 05:08:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44F80F8072E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="L/9bNPZa"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="26Lebn79"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id BE3751234;
 Fri, 31 May 2019 23:08:07 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Fri, 31 May 2019 23:08:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=VGVBhByXJBs/Thj5O+O4Fr707/
 XLIrNFaMGYre5Xmkk=; b=L/9bNPZaQWm0TMRrkHYUlOkA29WIiezfr48J6KdUYX
 Ac/F0tDkwzoIs5oWtyBN9FNpYddTQnIso+C/icwNVkKderXkS313TtnByx8BAe7P
 iWPdLEhYTEy9JlH3jtr6LWbcjt+0/vGZpJkEwm7oYDx4bTqVKfTF9KJfm2aPTZZQ
 vNpeZEc1rOPNAHrj80ee2DuoQn0opS2GQvS+7DQCtGT+JNVKUIGxAl6+U6l2LJfM
 IYcGvZFW8kxckLfS4sTnaM0bajzwvJudsg25aHLkVvXAVWPTKKDzb+NFLvJDtEtv
 DZXzLtTI8ysbsSCbPOW7kNquFEHMZzqpcAgI4SOIhT5Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=VGVBhByXJBs/Thj5O
 +O4Fr707/XLIrNFaMGYre5Xmkk=; b=26Lebn79JkJzPzizFQ1ePwxsJ0Oh8ccCW
 TtdTtKwWorlcxoDu+PbbieeeaU6xCJfc5icuGmLhyM6f70q2i4EO7eck0UbPnHVO
 zE1AcHCxd0RFdK/ymGCMULEe+JIGpLGRb1SwBeVXNs+mCNjrnhlrCHdMRNefUTup
 sus+E3v+UEBQ1mXDjT/C30H/MnIBkX07zWFXM4PFlO4xJXIS07yW2j8mHEbchaVm
 4Ruq/S+qvx+hHZhoWXJ/FEh36x5WsGLAFGMV2hoV+kQyou1dL7AIMDQUdtTdueLt
 O7wjEFC5Eu8npfYB0p70QlzbS/xjG2Exb6/m7tWNeWBim1IbCvdrw==
X-ME-Sender: <xms:FuzxXB85VfheV5sjOmEfx-VNISZVmZCGzUBDjMY91B3CuZPrty1kDQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudefvddgieelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhh
 ihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedunecurf
 grrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdr
 jhhpnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:FuzxXD-ypzrILpjEuhrtv1ofZnYXiTKmpqGT0ZWkn7hBkEcOEq2YxQ>
 <xmx:FuzxXIXC7Y45aq87aOtXl2veHSzH4EYzVoHv5t-9kVJyYK_YNHrlhQ>
 <xmx:FuzxXIcjgBesMKOWrl8e2jCM3QBuFvl2zbbV-jKY05Kz4HDcV6SYGw>
 <xmx:F-zxXGuAMtfV8r0wlGaH-U4cqzfX8pRAvBeXjcNiaxsRKcAuYgCq6Q>
Received: from localhost.localdomain (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id CFDC080059;
 Fri, 31 May 2019 23:08:04 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Sat,  1 Jun 2019 12:08:01 +0900
Message-Id: <20190601030801.3675-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, stable@vger.kernel.org
Subject: [alsa-devel] [PATCH] ALSA: firewire-motu: fix destruction of data
	for isochronous resources
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

The data for isochronous resources is not destroyed in expected place.
This commit fixes the bug.

Cc: <stable@vger.kernel.org> # v4.12+
Fixes: 9b2bb4f2f4a2 ("ALSA: firewire-motu: add stream management functionality")
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/motu/motu-stream.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/firewire/motu/motu-stream.c b/sound/firewire/motu/motu-stream.c
index 73e7a5e527fc..483a8771d502 100644
--- a/sound/firewire/motu/motu-stream.c
+++ b/sound/firewire/motu/motu-stream.c
@@ -345,7 +345,7 @@ static void destroy_stream(struct snd_motu *motu,
 	}
 
 	amdtp_stream_destroy(stream);
-	fw_iso_resources_free(resources);
+	fw_iso_resources_destroy(resources);
 }
 
 int snd_motu_stream_init_duplex(struct snd_motu *motu)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
