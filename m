Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E98E825C09B
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Sep 2020 13:51:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 902F51925;
	Thu,  3 Sep 2020 13:50:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 902F51925
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599133896;
	bh=6MIasn/UbIMheiL07BO4dQ2F1IUsNXnQh8tvJ+7HVYA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X7H6zv9KUSYNmNO1N8cV3NXOW81UNduqUuoD9hqVNVk3zzBfGc6mh4yAwIkZUHcmF
	 7E10k9cUZmnq58SZjjGjaLE9ZbAFulCgIvPfaGyA8m+roWmTJJevT5TxieQhKKGlOs
	 ujxkY6RROd2XRZtlz4IRkNNIVYJbQLWL4G3KJd1k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 78BEAF80328;
	Thu,  3 Sep 2020 13:45:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4AD4DF80328; Thu,  3 Sep 2020 13:45:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0A8CBF80321
 for <alsa-devel@alsa-project.org>; Thu,  3 Sep 2020 13:45:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A8CBF80321
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ybIoXID5"
Received: from localhost.localdomain (unknown [122.171.179.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 13EAF20709;
 Thu,  3 Sep 2020 11:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599133546;
 bh=6MIasn/UbIMheiL07BO4dQ2F1IUsNXnQh8tvJ+7HVYA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ybIoXID5qHy1ZGhv1I6BqR4Dsn/KvH74w5jQlE+9YVizNZnv5KSkIo1Crl4ViZho6
 TlMsf2sjHi4HTiLolwwdz/BxsDRZbJlBkl8JPGiS0HhpQJNm7lZXLQSm6HM0gI5zlc
 jrKySq2BVsxuSY6FR5O8y2C07Ms81u3ddZoUOfAU=
From: Vinod Koul <vkoul@kernel.org>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 9/9] soundwire: remove SDW_REG_SHIFT()
Date: Thu,  3 Sep 2020 17:15:04 +0530
Message-Id: <20200903114504.1202143-10-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200903114504.1202143-1-vkoul@kernel.org>
References: <20200903114504.1202143-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Vinod Koul <vkoul@kernel.org>
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

soundwire had defined SDW_REG_SHIFT to calculate shift values for
bitmasks, but now that we have better things in bitfield.h, remove this.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 include/linux/soundwire/sdw_registers.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/include/linux/soundwire/sdw_registers.h b/include/linux/soundwire/sdw_registers.h
index 5d3c271af7d1..f420e8059779 100644
--- a/include/linux/soundwire/sdw_registers.h
+++ b/include/linux/soundwire/sdw_registers.h
@@ -4,13 +4,6 @@
 #ifndef __SDW_REGISTERS_H
 #define __SDW_REGISTERS_H
 
-/*
- * typically we define register and shifts but if one observes carefully,
- * the shift can be generated from MASKS using few bit primitaives like ffs
- * etc, so we use that and avoid defining shifts
- */
-#define SDW_REG_SHIFT(n)			(ffs(n) - 1)
-
 /*
  * SDW registers as defined by MIPI 1.2 Spec
  */
-- 
2.26.2

