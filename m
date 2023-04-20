Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D8C6E8FEF
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Apr 2023 12:19:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08DC7EC9;
	Thu, 20 Apr 2023 12:18:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08DC7EC9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681985946;
	bh=jN8ld25u9/hpYreX3PvryA/Sh0N2V4CloXsfrbczsJ0=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ns+D1UMV7hTHOAOv6TrMXZNJKoF3V8qAHuh5NqrTT/Gj1k321WQtuqVksmMJSruKH
	 QvbgUh0akSjcmGhIbbpwXYPe9Q+0TYcll56+TF1VWelf1M2eymV0QAFtqnaD5IWltL
	 9+Es6kmYUV/VTnmt3SWtmP5DOclEOI9VAWabsovE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 48AC9F80551;
	Thu, 20 Apr 2023 12:16:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 047ABF80552; Thu, 20 Apr 2023 12:16:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E3A5FF80149
	for <alsa-devel@alsa-project.org>; Thu, 20 Apr 2023 12:16:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3A5FF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ZdhT1l/E
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-50506ac462bso671426a12.3
        for <alsa-devel@alsa-project.org>;
 Thu, 20 Apr 2023 03:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681985790; x=1684577790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gxQN4hZ4JVSgplNB9vM+TACxEqA37qdo6fBUY/Qfhug=;
        b=ZdhT1l/Ewnw8PJH9WHmYU66panGvAGmseKsA1QI14AcHKVjKMxVnU3LzsyflnJaSsT
         0SsaSKbcWs7WckSg27jljRg6VV3DwqhpTLP6IQGi/ukXFFUEFcPf77aJPNk1r6zWsAej
         9naiRVNvRcz5F/OBPqzOYQqWgb9MZD3r9qf94IrZh9CvL8ZXCvkjTR+YO2hbADbWUKv2
         ATvis3qRCxbidFKHfTut9rMBICDy00uRi9OXLFLIijGALI+2XDJdj8NJtdDDNAw5xgeF
         S4oFzhhbIZ37jr7lIrwpStGblZyQ9UE3jwRtyUfVymNzKv5D2vUZWLGXgfJtzCSOUzME
         rw4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681985790; x=1684577790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gxQN4hZ4JVSgplNB9vM+TACxEqA37qdo6fBUY/Qfhug=;
        b=WiAM16dXZdyCofXz8fBKx6XiV7fTKZ8+W3oXSVli2K6A+FB7nGuDBEQPqzi99UB4Dx
         5ftYMqNzTnYTTMUi3KNCAuXDhG7JSkmlg9g87rrlhxN93URsZyQuTExZr/tzPVDuTjXs
         rpSKIYVTo38O9DxbzP10aG7QG66rs2q5g6IwIaXIAOwvafYnPtqNNncWZkjcf3mRCqi/
         MXT561U/WsT3Sw4Q9GLMjoXy9Gk8+zC5o2f5Rta2b1a086/p9q2tSULtHrnr3ZUnuOrJ
         GmdMM9efuPp1HDcz6RGWi60SsllPKpTBM5eQG9gBX78uKRCnOInXMZv9E+TSWLWsZKyo
         JBrg==
X-Gm-Message-State: AAQBX9cP1Bx1bbOoJFiOoIY23zzht7PbJANofhA0nYvP26EoF2ZDB6Ex
	YAyVPRXgzrh+dz2sVLMw9LY/+Q==
X-Google-Smtp-Source: 
 AKy350ZGpkQT2xEEpIlm7akllE9wiybPG/3gcFKmyhXXX82oydlx7HcP+cAwnEryxuxKBnISy8rfiQ==
X-Received: by 2002:aa7:d78d:0:b0:506:be3f:ebb5 with SMTP id
 s13-20020aa7d78d000000b00506be3febb5mr1365210edq.1.1681985790496;
        Thu, 20 Apr 2023 03:16:30 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:bcb8:77e6:8f45:4771])
        by smtp.gmail.com with ESMTPSA id
 l22-20020aa7c3d6000000b00506be898998sm588954edr.29.2023.04.20.03.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Apr 2023 03:16:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 6/6] soundwire: qcom: do not probe devices before bus/link
 init
Date: Thu, 20 Apr 2023 12:16:17 +0200
Message-Id: <20230420101617.142225-7-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230420101617.142225-1-krzysztof.kozlowski@linaro.org>
References: <20230420101617.142225-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 74WPPAH5RWRAQHHJNZOXLB3V5OMCZ2E3
X-Message-ID-Hash: 74WPPAH5RWRAQHHJNZOXLB3V5OMCZ2E3
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Patrick Lai <quic_plai@quicinc.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/74WPPAH5RWRAQHHJNZOXLB3V5OMCZ2E3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Soundwire devices are supposed to be kept in reset state (powered off)
till their probe() or component bind() callbacks.  However if they are
already powered on, then they might enumerate before the master
initializes bus in qcom_swrm_init() leading to occasional errors like:

  qcom-soundwire 6d30000.soundwire-controller: Qualcomm Soundwire controller v2.0.0 Registered
  wcd938x_codec audio-codec: bound sdw:0:0217:010d:00:4 (ops wcd938x_sdw_component_ops)
  wcd938x_codec audio-codec: bound sdw:0:0217:010d:00:3 (ops wcd938x_sdw_component_ops)
  qcom-soundwire 6ad0000.soundwire-controller: swrm_wait_for_wr_fifo_avail err write overflow

The problem primarily lies in Qualcomm Soundwire controller probe() sequence:
1. request_threaded_irq()
2. sdw_bus_master_add() - which will cause probe() and component bind()
   of Soundwire devices, e.g. WCD938x codec drivers.  Device drivers
   might already start accessing their registers.
3. qcom_swrm_init() - which initializes the link/bus and enables
   interrupts.

Any access to device registers at (2) above, will fail because link/bus
is not yet initialized.

However the fix is not as simple as moving qcom_swrm_init() before
sdw_bus_master_add(), because this will cause early interrupt of new
slave attached.  The interrupt handler expects bus master (ctrl->bus.md)
to be allocated, so this would lead to NULL pointer exception.

Rework the init sequence and change the interrupt handler.  The correct
sequence fixing accessing device registers before link init is now:
1. qcom_swrm_init()
2. request_threaded_irq()
3. sdw_bus_master_add()
which still might cause early interrupts, if Soundwire devices are not
in powered off state before their probe.  This early interrupt issue is
fixed by checking if bus master (ctrl->bus.md) was allocated and if not,
scheduling delayed work for enumerating the slave device.  Since we
actually can handle early interrupt now, drop IRQF_TRIGGER_RISING flag
from the interrupt, because it is not really valid and driver should use
flags provided by DTS.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Change context depends on:
https://lore.kernel.org/r/20230209131336.18252-3-srinivas.kandagatla@linaro.org
https://lore.kernel.org/all/20230418095447.577001-1-krzysztof.kozlowski@linaro.org/

Cc: Patrick Lai <quic_plai@quicinc.com>
---
 drivers/soundwire/qcom.c | 89 ++++++++++++++++++++++++++++++++--------
 1 file changed, 72 insertions(+), 17 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 679990dc3cc4..802d939ce7aa 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -19,6 +19,7 @@
 #include <linux/slimbus.h>
 #include <linux/soundwire/sdw.h>
 #include <linux/soundwire/sdw_registers.h>
+#include <linux/workqueue.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
 #include "bus.h"
@@ -187,6 +188,7 @@ struct qcom_swrm_ctrl {
 #endif
 	struct completion broadcast;
 	struct completion enumeration;
+	struct delayed_work new_slave_work;
 	/* Port alloc/free lock */
 	struct mutex port_lock;
 	struct clk *hclk;
@@ -606,6 +608,37 @@ static int qcom_swrm_enumerate(struct sdw_bus *bus)
 	return 0;
 }
 
+static void qcom_swrm_new_slave(struct work_struct *work)
+{
+	struct qcom_swrm_ctrl *ctrl = container_of(work, struct qcom_swrm_ctrl,
+						   new_slave_work.work);
+
+	/*
+	 * All Soundwire slave deviecs are expected to be in reset state (powered down)
+	 * during sdw_bus_master_add().  The slave device should be brougth
+	 * from reset by its probe() or bind() function, as a result of
+	 * sdw_bus_master_add().
+	 * Add a simple check to avoid NULL pointer except on early interrupts.
+	 * Note that if this condition happens, the slave device will not be
+	 * enumerated. Its driver should be fixed.
+	 *
+	 * smp_load_acquire() paired with sdw_master_device_add().
+	 */
+	if (!smp_load_acquire(&ctrl->bus.md)) {
+		dev_err(ctrl->dev,
+			"Got unexpected, early interrupt, device will not be enumerated\n");
+		return;
+	}
+
+	clk_prepare_enable(ctrl->hclk);
+
+	qcom_swrm_get_device_status(ctrl);
+	qcom_swrm_enumerate(&ctrl->bus);
+	sdw_handle_slave_status(&ctrl->bus, ctrl->status);
+
+	clk_disable_unprepare(ctrl->hclk);
+};
+
 static irqreturn_t qcom_swrm_wake_irq_handler(int irq, void *dev_id)
 {
 	struct qcom_swrm_ctrl *ctrl = dev_id;
@@ -668,9 +701,17 @@ static irqreturn_t qcom_swrm_irq_handler(int irq, void *dev_id)
 					dev_dbg(ctrl->dev, "Slave status not changed %x\n",
 						slave_status);
 				} else {
-					qcom_swrm_get_device_status(ctrl);
-					qcom_swrm_enumerate(&ctrl->bus);
-					sdw_handle_slave_status(&ctrl->bus, ctrl->status);
+					unsigned long delay = 0;
+
+					/*
+					 * See qcom_swrm_new_slave() for
+					 * explanation. smp_load_acquire() paired
+					 * with sdw_master_device_add().
+					 */
+					if (!smp_load_acquire(&ctrl->bus.md))
+						delay = 10;
+					schedule_delayed_work(&ctrl->new_slave_work,
+							      delay);
 				}
 				break;
 			case SWRM_INTERRUPT_STATUS_MASTER_CLASH_DET:
@@ -780,6 +821,7 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
 
 	ctrl->intr_mask = SWRM_INTERRUPT_STATUS_RMSK;
 	/* Mask soundwire interrupts */
+
 	if (ctrl->version < SWRM_VERSION_2_0_0)
 		ctrl->reg_write(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_MASK_ADDR],
 				SWRM_INTERRUPT_STATUS_RMSK);
@@ -1485,6 +1527,7 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 	mutex_init(&ctrl->port_lock);
 	init_completion(&ctrl->broadcast);
 	init_completion(&ctrl->enumeration);
+	INIT_DELAYED_WORK(&ctrl->new_slave_work, qcom_swrm_new_slave);
 
 	ctrl->bus.ops = &qcom_swrm_ops;
 	ctrl->bus.port_ops = &qcom_swrm_port_ops;
@@ -1514,9 +1557,10 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 
 	ctrl->reg_read(ctrl, SWRM_COMP_HW_VERSION, &ctrl->version);
 
+	qcom_swrm_init(ctrl);
+
 	ret = devm_request_threaded_irq(dev, ctrl->irq, NULL,
 					qcom_swrm_irq_handler,
-					IRQF_TRIGGER_RISING |
 					IRQF_ONESHOT,
 					"soundwire", ctrl);
 	if (ret) {
@@ -1524,18 +1568,6 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 		goto err_clk;
 	}
 
-	ctrl->wake_irq = of_irq_get(dev->of_node, 1);
-	if (ctrl->wake_irq > 0) {
-		ret = devm_request_threaded_irq(dev, ctrl->wake_irq, NULL,
-						qcom_swrm_wake_irq_handler,
-						IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
-						"swr_wake_irq", ctrl);
-		if (ret) {
-			dev_err(dev, "Failed to request soundwire wake irq\n");
-			goto err_init;
-		}
-	}
-
 	pm_runtime_set_autosuspend_delay(dev, 3000);
 	pm_runtime_use_autosuspend(dev);
 	pm_runtime_mark_last_busy(dev);
@@ -1549,7 +1581,18 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 		goto err_clk;
 	}
 
-	qcom_swrm_init(ctrl);
+	ctrl->wake_irq = of_irq_get(dev->of_node, 1);
+	if (ctrl->wake_irq > 0) {
+		ret = devm_request_threaded_irq(dev, ctrl->wake_irq, NULL,
+						qcom_swrm_wake_irq_handler,
+						IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
+						"swr_wake_irq", ctrl);
+		if (ret) {
+			dev_err(dev, "Failed to request soundwire wake irq\n");
+			goto err_init;
+		}
+	}
+
 	wait_for_completion_timeout(&ctrl->enumeration,
 				    msecs_to_jiffies(TIMEOUT_MS));
 	ret = qcom_swrm_register_dais(ctrl);
@@ -1589,6 +1632,18 @@ static int qcom_swrm_remove(struct platform_device *pdev)
 {
 	struct qcom_swrm_ctrl *ctrl = dev_get_drvdata(&pdev->dev);
 
+	/*
+	 * Mask interrupts to be sure no delayed work can be scheduler after
+	 * removing Soundwire bus master.
+	 */
+	if (ctrl->version < SWRM_VERSION_2_0_0)
+		ctrl->reg_write(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_MASK_ADDR],
+				0);
+	if (ctrl->mmio)
+		ctrl->reg_write(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_CPU_EN],
+				0);
+
+	cancel_delayed_work_sync(&ctrl->new_slave_work);
 	sdw_bus_master_delete(&ctrl->bus);
 	clk_disable_unprepare(ctrl->hclk);
 
-- 
2.34.1

