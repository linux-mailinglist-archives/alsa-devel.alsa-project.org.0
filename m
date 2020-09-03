Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A52D925C09C
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Sep 2020 13:52:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3DB2B193C;
	Thu,  3 Sep 2020 13:51:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3DB2B193C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599133933;
	bh=Fi7GM1/OYmb/9tAwU/ijFZG1CkTAIhIQV72ALoWrINI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R6SfR2lhY5vfKN5cFeYMR++NNoO/v+IImxqMFg9UkwgvZBY8u0YIh1BtO7qbkM4wF
	 hLvODVQhlxFHI4MTsfkfANLe7jqLtroDz2M7HJqciIU/LiHoJBzCU8ZQvY6fzacnRH
	 vCKiBdyPrO9RFDOwv71SipEZdSb+ft+/bdSuljUA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6902BF80332;
	Thu,  3 Sep 2020 13:45:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 98C9CF80323; Thu,  3 Sep 2020 13:45:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BA04AF80316
 for <alsa-devel@alsa-project.org>; Thu,  3 Sep 2020 13:45:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA04AF80316
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Kb9Kx0yW"
Received: from localhost.localdomain (unknown [122.171.179.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DD9B42083B;
 Thu,  3 Sep 2020 11:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599133543;
 bh=Fi7GM1/OYmb/9tAwU/ijFZG1CkTAIhIQV72ALoWrINI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Kb9Kx0yW/AcO7qcHXq14NAfIAbHpBwwPsKIZM6UwjL+fRI2y687nXl2m0sSkY26ub
 nJVhi6DHjplvRHliQJGa2MZ0iL8vZ7feP+x2nFQz323M3Mihk4kXhxOINNypNn/Ecq
 tJAt8D7mLfDX8BWn6JWdK3sIDq5KKcjSk2/ycaL0=
From: Vinod Koul <vkoul@kernel.org>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 8/9] soundwire: intel_init: use FIELD_{GET|PREP}
Date: Thu,  3 Sep 2020 17:15:03 +0530
Message-Id: <20200903114504.1202143-9-vkoul@kernel.org>
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

use FIELD_{GET|PREP} in intel_init driver to get/set field values
instead of open coding masks and shift operations.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/soundwire/intel_init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soundwire/intel_init.c b/drivers/soundwire/intel_init.c
index 65d9b9bd2106..cabdadb09a1b 100644
--- a/drivers/soundwire/intel_init.c
+++ b/drivers/soundwire/intel_init.c
@@ -383,7 +383,7 @@ static acpi_status sdw_intel_acpi_cb(acpi_handle handle, u32 level,
 	 * Name(_ADR, 0x40000000), with bits 31..28 representing the
 	 * SoundWire link so filter accordingly
 	 */
-	if ((adr & GENMASK(31, 28)) >> 28 != SDW_LINK_TYPE)
+	if (FIELD_GET(GENMASK(31, 28), adr) != SDW_LINK_TYPE)
 		return AE_OK; /* keep going */
 
 	/* device found, stop namespace walk */
-- 
2.26.2

