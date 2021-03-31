Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E72334F9C3
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Mar 2021 09:22:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EEE51168D;
	Wed, 31 Mar 2021 09:21:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EEE51168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617175354;
	bh=BTW66Z06dN1EnDtCDk+B5PVhTFQ03DeugVVi33Kyn6g=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jJ+iCbOQ9/h/3sPKbYCMqWRIAQE0FqiGT9+qnS9OBuKFe9RZW8Qv4upFcKuTi6k+O
	 IN4Mv4j6P+w8KNOdGUJafuyklRU2t146hJQLdbootJ9/PgGNFDY+7r28r97qYnV13r
	 cwU5+B5gFmPBPgR6TbAu51wlPbQ9efUxcceVMfAE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EBCEFF8014E;
	Wed, 31 Mar 2021 09:21:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 17F0BF801DB; Wed, 31 Mar 2021 09:21:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 63D30F8013C
 for <alsa-devel@alsa-project.org>; Wed, 31 Mar 2021 09:21:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63D30F8013C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="cRlXjrD+"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4248D619D3;
 Wed, 31 Mar 2021 07:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617175284;
 bh=BTW66Z06dN1EnDtCDk+B5PVhTFQ03DeugVVi33Kyn6g=;
 h=From:To:Cc:Subject:Date:From;
 b=cRlXjrD+sBhiggkelJca4Yru5SmIA2dMAaYw4G/zGGCKOuHN/CGuAYRP/vakrl8bl
 Pyu4U9EBSVsez7n4/Bf41cAlYGsb4QL5TWNJShnfDP8QHQfN7AFetC7KNCiEUAJVa7
 YJOJNmSXWk0j1b6sKA7BFeBi9IfLi/utPcn3pPMA1RtmGHcQ6ahMRFVrCKAE1bXQpy
 OQgbcHlRqzs/ro7eCohXmxGvyndkcx4gn4CQb0hNUjxkKWaL6hOKmRvIm1D2yMQ73Z
 9q3ZCXt6/8950v9Pd02qBX1qv//NhssFRibhpH2CU84z2979AMjzRuLrc2IBoqHvS9
 5CQeIYuLtt7SA==
From: Vinod Koul <vkoul@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH] soundwire: qcom: use signed variable for error return
Date: Wed, 31 Mar 2021 12:51:11 +0530
Message-Id: <20210331072111.2945945-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kernel test robot <lkp@intel.com>,
 linux-arm-msm@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, linux-kernel@vger.kernel.org
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

We get warning for using a unsigned variable being compared to less than
zero. The comparison is correct as it checks for errors from previous
call to qcom_swrm_get_alert_slave_dev_num(), so we should use a signed
variable instead.

drivers/soundwire/qcom.c: qcom_swrm_irq_handler() warn: impossible
condition '(devnum < 0) => (0-255 < 0)'

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/soundwire/qcom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index b08ecb9b418c..55ed133c6704 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -428,7 +428,7 @@ static irqreturn_t qcom_swrm_irq_handler(int irq, void *dev_id)
 	struct qcom_swrm_ctrl *swrm = dev_id;
 	u32 value, intr_sts, intr_sts_masked, slave_status;
 	u32 i;
-	u8 devnum = 0;
+	s8 devnum = 0;
 	int ret = IRQ_HANDLED;
 
 	swrm->reg_read(swrm, SWRM_INTERRUPT_STATUS, &intr_sts);
-- 
2.26.3

