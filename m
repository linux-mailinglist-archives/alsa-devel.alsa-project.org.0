Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C198F57D0A4
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Jul 2022 18:04:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5D8C18CA;
	Thu, 21 Jul 2022 18:03:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5D8C18CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658419466;
	bh=LHaaDjk74cE2H0h2y0T0WzWVaVo7i9UnMocd80kG3HU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QLCBJkWj+3j1HqMFnfvmo8nLfTWQOyI87YJk7Y8azddjGoYAD6CM8Rwq1SUnfY0e1
	 /z/aacYUL1/57PNeAEbjgTPQpGxGZcbfLWSkvUiWY+wRBavj4c27+r1hTKzBRGnl4k
	 ihu6HgtU+nkiuNfOgvJJC8Vj6nKkwGMj+VFZwWcI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 750E4F805D6;
	Thu, 21 Jul 2022 17:58:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CCC50F8016D; Thu, 21 Jul 2022 17:55:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtpbg.qq.com (unknown [43.155.67.158])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E308AF800BA
 for <alsa-devel@alsa-project.org>; Thu, 21 Jul 2022 17:55:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E308AF800BA
X-QQ-mid: bizesmtp68t1658418939tni39y8y
Received: from localhost.localdomain ( [125.70.163.183])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 21 Jul 2022 23:55:21 +0800 (CST)
X-QQ-SSF: 01000000002000409000B00A0000000
X-QQ-FEAT: bhet8yMU7vn5WdIbn+X4cwVFm4ZE5gYnlE5WclUheQpQIDmCR7sr8HZ92xmLa
 YQpKQwuR1xb60fTBSgGlPhLcsOaT09JDi42x+wDJwZbpyYHkWUBp7daxk+NmJJWrfVs2x/3
 oq78PdcA2A8CUanpytwrzeAuA5IUjnc53CP+84foaSDF2FBxGneUH6xuKyWDW9YTkdQbMp2
 rEWmHn39Ua8Bfsr/Lp7k3kl0Mj8zRt66nAgl5fEfqYBotIkPnTKRsQzB32yunZkK2AStgiD
 /MN7S+RH6Z3k9ZuH9vdPfMeGZQIEcq0OoHvRU73ElwSOtvtKi2yd8SfaQf/BlMB4VlGaQMG
 Eu+Le5gFGO4pwAK2YQIn225E4VAm1Kgp+WDGEFT+Vu/z7wfcRB4Aj9C9EyjYLJ/SLYuxAim
X-QQ-GoodBg: 0
From: shaomin Deng <dengshaomin@cdjrlc.com>
To: perex@perex.cz,
	tiwai@suse.com
Subject: [PATCH] ALSA: asihpi: Fix typo in comments
Date: Thu, 21 Jul 2022 11:55:17 -0400
Message-Id: <20220721155517.2438-1-dengshaomin@cdjrlc.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr4
X-Mailman-Approved-At: Thu, 21 Jul 2022 17:58:03 +0200
Cc: alsa-devel@alsa-project.org, shaomin Deng <dengshaomin@cdjrlc.com>,
 linux-kernel@vger.kernel.org
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

Delete the repeated word "in" in comments.

Signed-off-by: shaomin Deng <dengshaomin@cdjrlc.com>
---
 sound/pci/asihpi/hpi6205.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/asihpi/hpi6205.c b/sound/pci/asihpi/hpi6205.c
index 3d6914c64c4a..27e11b5f70b9 100644
--- a/sound/pci/asihpi/hpi6205.c
+++ b/sound/pci/asihpi/hpi6205.c
@@ -445,7 +445,7 @@ void HPI_6205(struct hpi_message *phm, struct hpi_response *phr)
 /* SUBSYSTEM */
 
 /** Create an adapter object and initialise it based on resource information
- * passed in in the message
+ * passed in the message
  * *** NOTE - you cannot use this function AND the FindAdapters function at the
  * same time, the application must use only one of them to get the adapters ***
  */
-- 
2.35.1

