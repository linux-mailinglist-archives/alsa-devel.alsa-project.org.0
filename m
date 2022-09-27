Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8395EC18A
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Sep 2022 13:36:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 47AB0820;
	Tue, 27 Sep 2022 13:35:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 47AB0820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664278565;
	bh=g6EgBQsu7Hx6HNkg4vQlyFT638t277ViWzx84i/23rI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hcxzXCWEJn4OfjXABFEYVTYR1LIRvnzhs1AmreylfshZ9j7vm2BaZL4ERIHxY+IWv
	 uvUWlqE7Wyo82/ZdyJ9asFSeMn9go9VAOVpoLNURnzSAQMclwLNouODCWAGf1/JFDM
	 ea2AKPgS6NhMtOOhif+w1zt2WqQ5hgTeIO9yYW4o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B2D6CF800AA;
	Tue, 27 Sep 2022 13:35:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9AA3F800AA; Tue, 27 Sep 2022 13:35:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from hutie.ust.cz (unknown [IPv6:2a03:3b40:fe:f0::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7DA47F800AA
 for <alsa-devel@alsa-project.org>; Tue, 27 Sep 2022 13:35:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7DA47F800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=cutebit.org header.i=@cutebit.org
 header.b="Nwr09I/s"
From: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
 t=1664278499; bh=nOoQhB339U5GGM36GHbGtBpVI5SaHkuDid0bhw4EnqY=;
 h=From:To:Cc:Subject:Date;
 b=Nwr09I/sqmPoJufDCxfV0CwuwcAg026CaPqliB8Oe3lX+CrBM0UrVDJPUK2yi5mTE
 v8fnko6E1l8dZp8T5Rv3h2rT8UYSLLgRUxfPi9FagnEeKVon6MGyq6OGD8EimtcO5k
 Zj2oZ7LspQSEulDJ4+BhsWOy2A8fK2xIZGoe8o6g=
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 1/3] ASoC: apple: mca: Trigger, not deassert,
 the peripheral reset
Date: Tue, 27 Sep 2022 13:34:24 +0200
Message-Id: <20220927113426.49724-1-povik+lin@cutebit.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>,
 alsa-devel@alsa-project.org, asahi@lists.linux.dev,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-kernel@vger.kernel.org
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

Replace the deassertion of the peripheral's shared reset with the
triggering of a pulse on it. This is what we should have been using all
along as the platform's custom is not leaving the reset asserted on
unused peripherals.

Fixes: 3df5d0d97289 ("ASoC: apple: mca: Start new platform driver")
Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
---

Cc: Philipp Zabel <p.zabel@pengutronix.de>

 sound/soc/apple/mca.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/apple/mca.c b/sound/soc/apple/mca.c
index 69643524796e..75925bfcf754 100644
--- a/sound/soc/apple/mca.c
+++ b/sound/soc/apple/mca.c
@@ -995,7 +995,7 @@ static void apple_mca_release(struct mca_data *mca)
 	if (!IS_ERR_OR_NULL(mca->pd_dev))
 		dev_pm_domain_detach(mca->pd_dev, true);
 
-	reset_control_assert(mca->rstc);
+	reset_control_rearm(mca->rstc);
 }
 
 static int apple_mca_probe(struct platform_device *pdev)
@@ -1049,12 +1049,12 @@ static int apple_mca_probe(struct platform_device *pdev)
 					       DL_FLAG_RPM_ACTIVE);
 	if (!mca->pd_link) {
 		ret = -EINVAL;
-		/* Prevent an unbalanced reset assert */
+		/* Prevent an unbalanced reset rearm */
 		mca->rstc = NULL;
 		goto err_release;
 	}
 
-	reset_control_deassert(mca->rstc);
+	reset_control_reset(mca->rstc);
 
 	for (i = 0; i < nclusters; i++) {
 		struct mca_cluster *cl = &clusters[i];
-- 
2.33.0

