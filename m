Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A4F3503F0
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Mar 2021 17:57:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2DC70167F;
	Wed, 31 Mar 2021 17:56:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2DC70167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617206228;
	bh=DdAxpoEII7X/fiK9DIy81GeAD/w0tH8k+zXxR3jH5OU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cod/K9zlYl8HVxbNW+mUsD9d8X4jKnj1b6vzB82pFF/iOr5CyarqLzVNF2fKqCyu5
	 IGwuKsknfW6o66uwU/pvwqldC36suMv+tjkDK7mR57gTCcLnATPGB6IscKs8F4i3xO
	 1qzlriYYPYCHiuWApW/qNQgZYbIlhNi35NVQ/O08=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 914ABF8014E;
	Wed, 31 Mar 2021 17:55:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8B7AFF80166; Wed, 31 Mar 2021 17:55:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 31ED5F8013C
 for <alsa-devel@alsa-project.org>; Wed, 31 Mar 2021 17:55:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31ED5F8013C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="GmS6uYKw"
Received: by mail.kernel.org (Postfix) with ESMTPSA id D52B961006;
 Wed, 31 Mar 2021 15:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617206131;
 bh=DdAxpoEII7X/fiK9DIy81GeAD/w0tH8k+zXxR3jH5OU=;
 h=From:To:Cc:Subject:Date:From;
 b=GmS6uYKwWxOUkWYbuRf/2itDpnOJvyIKt35hgTs6x79z+IQGAbRAGpbNdfhiD+54Y
 fhzeh+xmkrAsnELIf5lZiG9SXYwYenIPCt3/HSoNuJCedttwDMeM5vtvuhOta6nJ8J
 Pk2CEKmvvGakZuf5ER/m3ibx3cenlCi88rZ4RTn5LQvtAOjj8pmr/wgwNq6Sx9il6y
 MGA4Lvw6ak+0pzoijg4a6NAALWobxavn+bfuOVYYZHole6fCKGeTkhMs4bzutFJmL5
 3Vke09cOVrJFwQOQ/BqSqvK7etmeaB/ysnAZVRY9MSVPjqYcMJ9EVXrW8GqUUdupb1
 4BCVhV8IlUHpg==
From: Vinod Koul <vkoul@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH V2] soundwire: qcom: use signed variable for error return
Date: Wed, 31 Mar 2021 21:25:20 +0530
Message-Id: <20210331155520.2987823-1-vkoul@kernel.org>
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

We get warning of using a unsigned variable being compared to less than
zero. The comparison is correct as it checks for errors from previous
call to qcom_swrm_get_alert_slave_dev_num(), so we should use a signed
variable here.

While at it, drop the superfluous initialization as well

drivers/soundwire/qcom.c: qcom_swrm_irq_handler() warn: impossible
condition '(devnum < 0) => (0-255 < 0)'

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/soundwire/qcom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index b08ecb9b418c..ec86c4e53fdb 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -428,7 +428,7 @@ static irqreturn_t qcom_swrm_irq_handler(int irq, void *dev_id)
 	struct qcom_swrm_ctrl *swrm = dev_id;
 	u32 value, intr_sts, intr_sts_masked, slave_status;
 	u32 i;
-	u8 devnum = 0;
+	int devnum;
 	int ret = IRQ_HANDLED;
 
 	swrm->reg_read(swrm, SWRM_INTERRUPT_STATUS, &intr_sts);
-- 
2.26.3

