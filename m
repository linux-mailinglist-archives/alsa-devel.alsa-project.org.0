Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 551D229743A
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Oct 2020 18:35:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B7F71183C;
	Fri, 23 Oct 2020 18:34:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B7F71183C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603470933;
	bh=u1Pqr2RIY1HqhTK0TpGLNOF+nTm1eTs38WLO0ZJ4+0A=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A/xXEl6xyALH2ijscwlHntPc7NBXjLYRezxEjHC1twwM7bdzOSCcLqHlB6a0xnl8Q
	 Lf64uNbixJzMUufDtf59vowPS6WSaWFks31ZFG5vlKnQy0Med/i40RQ3jR55lFIEVp
	 7uDi5BYDzrQmBsWZbrXPQaXgKoQe4t1/zuGOXTvw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2902FF80264;
	Fri, 23 Oct 2020 18:34:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 04325F80264; Fri, 23 Oct 2020 18:33:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C0BF8F80245
 for <alsa-devel@alsa-project.org>; Fri, 23 Oct 2020 18:33:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0BF8F80245
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Z/hkxDZY"
Received: from mail.kernel.org (ip5f5ad5a3.dynamic.kabel-deutschland.de
 [95.90.213.163])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1C0FE246A2;
 Fri, 23 Oct 2020 16:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603470828;
 bh=u1Pqr2RIY1HqhTK0TpGLNOF+nTm1eTs38WLO0ZJ4+0A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Z/hkxDZYSLHRKJLOvLuXvqK3NtrZvdTmorxLGJrektvtGbFuOEQn34lI95TcpNxF+
 qlitjXCM4k77NEdYy1rMiXEf843CY27CIh0q217ZDc/pDLaPDyt39lauLEqIvXUaYA
 MOqQ4FkJOyYuKxsbU2LOpLuoptmFSr+tpEXx9O/k=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
 (envelope-from <mchehab@kernel.org>)
 id 1kW00g-002Awc-0B; Fri, 23 Oct 2020 18:33:46 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: [PATCH v3 28/56] slimbus: fix a kernel-doc markup
Date: Fri, 23 Oct 2020 18:33:15 +0200
Message-Id: <7a581d05aec5ebbd02be27513de1c5e5a25b7922.1603469755.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1603469755.git.mchehab+huawei@kernel.org>
References: <cover.1603469755.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 alsa-devel@alsa-project.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
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

Fix the name of the enum on its kernel-doc markup:
	enum slim_ch_aux_fmt -> enum slim_ch_aux_bit_fmt

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/slimbus/slimbus.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/slimbus/slimbus.h b/drivers/slimbus/slimbus.h
index c73035915f1d..00a7f112574b 100644
--- a/drivers/slimbus/slimbus.h
+++ b/drivers/slimbus/slimbus.h
@@ -244,7 +244,7 @@ enum slim_ch_data_fmt {
 };
 
 /**
- * enum slim_ch_aux_fmt: SLIMbus channel Aux Field format IDs according to
+ * enum slim_ch_aux_bit_fmt: SLIMbus channel Aux Field format IDs according to
  *	Table 63 of SLIMbus Spec 2.0
  * @SLIM_CH_AUX_FMT_NOT_APPLICABLE: Undefined
  * @SLIM_CH_AUX_FMT_ZCUV_TUNNEL_IEC60958: ZCUV for tunneling IEC60958
-- 
2.26.2

