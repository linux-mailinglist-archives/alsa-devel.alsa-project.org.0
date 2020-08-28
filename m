Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7CB25551E
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Aug 2020 09:28:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E1EC41868;
	Fri, 28 Aug 2020 09:27:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E1EC41868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598599685;
	bh=6MIasn/UbIMheiL07BO4dQ2F1IUsNXnQh8tvJ+7HVYA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eW1GYqTQpCxawlJ9tOFsNx17X+X3FZJJSjDGht29zg9HgCx9MpOg3N3POrTYFD8HN
	 xPFGY9jhuDydXsjRhZsLOOSsASH+GMOWW84qrgkyU8HDEQxvFyzg6segWEpGxpa2hV
	 EpAduQ4RlefiPh6Msipx11rCSdDHyB64PxYjn7ZM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 11393F80304;
	Fri, 28 Aug 2020 09:22:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C13BAF802E1; Fri, 28 Aug 2020 09:21:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F315F80299
 for <alsa-devel@alsa-project.org>; Fri, 28 Aug 2020 09:21:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F315F80299
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jzWdAMW/"
Received: from localhost.localdomain (unknown [122.171.38.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 802FD20E65;
 Fri, 28 Aug 2020 07:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598599300;
 bh=6MIasn/UbIMheiL07BO4dQ2F1IUsNXnQh8tvJ+7HVYA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jzWdAMW/KlcEuz6Df2ys95cioMFNGsCoKFnVBx2FjkiSlgsqW/7Qxh8sg5AUzBrPk
 xEH561g2ohsMaAQPAo8azis39NgnDjY/gXuUIoC7ZrgY8SLzTVbEUc10oT7Gk6MV2Q
 RTFeb6zu9tWuHDUQWH7wfGJEty8HsoqB6rvwj0Wk=
From: Vinod Koul <vkoul@kernel.org>
To: alsa-devel@alsa-project.org
Subject: [PATCH 9/9] soundwire: remove SDW_REG_SHIFT()
Date: Fri, 28 Aug 2020 12:51:01 +0530
Message-Id: <20200828072101.3781956-10-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200828072101.3781956-1-vkoul@kernel.org>
References: <20200828072101.3781956-1-vkoul@kernel.org>
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

