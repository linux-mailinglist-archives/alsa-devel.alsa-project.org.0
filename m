Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B848052FB20
	for <lists+alsa-devel@lfdr.de>; Sat, 21 May 2022 13:14:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48672172C;
	Sat, 21 May 2022 13:13:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48672172C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653131656;
	bh=3vq6UQVd6+mGhHC5CTJzanDzAIY/a2MiBXhP2VICzfE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=vHMcVP9v9Rr51g5ZWZWkZK1VwrRir1jax93NU6ZsmC+J0CHv8dAMA/NaGOSIs8GQ9
	 82xcpdyy00GUVsZhLaEDiuRokqJnDQfvXsPSbacza0RC/YT2J5xExxbZUnnbL4z5YZ
	 QzZKqMFXBENgAqs7DAc3zK0MOgd9j4Mnn+GvzoOI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 99B3AF8051B;
	Sat, 21 May 2022 13:12:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C2A0F80526; Sat, 21 May 2022 13:12:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3A7CEF8051B
 for <alsa-devel@alsa-project.org>; Sat, 21 May 2022 13:12:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A7CEF8051B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr
 header.b="HZcq6RDs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inria.fr; s=dc;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TN/j615y2tkYA0srFihzWLP+GjLIX6UQauDVbNDVzTk=;
 b=HZcq6RDsXGGZgT2GMpbx+k0znTTWtUngBgdaZC+QskSN2Mo78eDk0kGO
 bkLsh+chX0bb5x1S6AR0MleYwDGq8paFjnemsLRis0U5lCyJq+eC98XBV
 zDuWjdQuy4SUH/YHEP4DBN/CVsahWllvWTFuVN0V9DFPmrCY1phwl9JK1 4=;
Authentication-Results: mail3-relais-sop.national.inria.fr;
 dkim=none (message not signed) header.i=none;
 spf=SoftFail smtp.mailfrom=Julia.Lawall@inria.fr;
 dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.91,242,1647298800"; d="scan'208";a="14727996"
Received: from i80.paris.inria.fr (HELO i80.paris.inria.fr.) ([128.93.90.48])
 by mail3-relais-sop.national.inria.fr with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2022 13:12:08 +0200
From: Julia Lawall <Julia.Lawall@inria.fr>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH] slimbus: messaging: fix typos in comments
Date: Sat, 21 May 2022 13:11:38 +0200
Message-Id: <20220521111145.81697-88-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
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

Spelling mistakes (triple letters) in comments.
Detected with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/slimbus/messaging.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/slimbus/messaging.c b/drivers/slimbus/messaging.c
index e5ae26227bdb..4ce0cb61e481 100644
--- a/drivers/slimbus/messaging.c
+++ b/drivers/slimbus/messaging.c
@@ -79,7 +79,7 @@ int slim_alloc_txn_tid(struct slim_controller *ctrl, struct slim_msg_txn *txn)
 EXPORT_SYMBOL_GPL(slim_alloc_txn_tid);
 
 /**
- * slim_free_txn_tid() - Freee tid of txn
+ * slim_free_txn_tid() - Free tid of txn
  *
  * @ctrl: Controller handle
  * @txn: transaction whose tid should be freed
@@ -101,7 +101,7 @@ EXPORT_SYMBOL_GPL(slim_free_txn_tid);
  * @txn: Transaction to be sent over SLIMbus
  *
  * Called by controller to transmit messaging transactions not dealing with
- * Interface/Value elements. (e.g. transmittting a message to assign logical
+ * Interface/Value elements. (e.g. transmitting a message to assign logical
  * address to a slave device
  *
  * Return: -ETIMEDOUT: If transmission of this message timed out

