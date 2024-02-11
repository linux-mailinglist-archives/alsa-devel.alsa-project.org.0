Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 005698533F7
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Feb 2024 16:01:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF2E5E0D;
	Tue, 13 Feb 2024 16:01:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF2E5E0D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707836506;
	bh=SiwFCaJfWhNdlNdl6SEg46+n+EXfIid+Cwwyq9BVmUM=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=FYwLY+1da6bOOLhx9KzWtQx0n6M88Cl46GYozAojHnNUys9hyhk2QYyv2P6dprJTs
	 5pJC5wm9l3CQd1IqjZaW8Jz9AZA/O53qE5GaN8qlOgJLABTzxOPWhq49wGr0fulhmW
	 JpHNK9pczjLi9jSpbXgrvK9UhWNaRcQsjZpUU2Nw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E779EF805C8; Tue, 13 Feb 2024 16:01:06 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F513F805B3;
	Tue, 13 Feb 2024 16:01:05 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E4583F80238; Sun, 11 Feb 2024 19:26:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8FD6AF8015B
	for <alsa-devel@alsa-project.org>; Sun, 11 Feb 2024 19:26:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8FD6AF8015B
X-QQ-mid: bizesmtp88t1707675989t432yrhp
X-QQ-Originating-IP: X9As0z1JtkHI52/qSsPTQphdbnwgb06NLtcp1NBZh5k=
Received: from VM-16-2-ubuntu.. ( [122.51.61.190])
	by bizesmtp.qq.com (ESMTP) with
	id ; Mon, 12 Feb 2024 02:26:27 +0800 (CST)
X-QQ-SSF: 01400000000000B0R000000A0000000
X-QQ-FEAT: Q4gfBD3K7t9VwmtcW25waEkxX6NY4tq7FpiJ3y/zJmV4df98ym1n1KUN7BLxV
	lQO1bRJddxD2wf25fNSSbplEoZQv5SW35cP/Rmr6n1RXEPt3RiWabZGas87/uZJhFIGYK62
	rc9fXv8Wom1XnvdxdaxTGyboT6qislh6Pu18V84+2l1BQfN43mw14GOG60PZUWLIaKHu4tF
	Bq6P7+tVBh1i+MNbBeb7fXUbOMF1o4XiHSg3YzQUw8PWqrTvDiA1tTn6e9IWSgDbglj1w3j
	+SxqADrWULzOV3GkuNdX+gbCoSv8eLA5RARC6SpewebkMb0UJsrOOC+A4Ucg/2FvPe+sbC7
	6IaefQGp36e7rY5Q1u4ToTLSbSWfRbO4SSFLMf3ndtZpAYgdn6N3RWJ75uliQ==
X-QQ-GoodBg: 2
X-BIZMAIL-ID: 5988167758481661900
From: Yinchuan Guo <guoych37@mail2.sysu.edu.cn>
To: linux-kernel@vger.kernel.org
Cc: lee.jones@linaro.org,
	james.smart@broadcom.com,
	dick.kennedy@broadcom.com,
	jejb@linux.ibm.com,
	martin.petersen@oracle.com,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	Yinchuan Guo <guoych37@mail2.sysu.edu.cn>
Subject: [PATCH] Subject: [PATCH] sound: drivers: fix typo 'reguest' to
 'request'
Date: Mon, 12 Feb 2024 02:28:46 +0800
Message-Id: <20240211182846.3608447-1-guoych37@mail2.sysu.edu.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:mail2.sysu.edu.cn:qybglogicsvrsz:qybglogicsvrsz3a-1
X-MailFrom: guoych37@mail2.sysu.edu.cn
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: RYH5HVLMB5MJZE42RGXHTJY5XN7XGSG4
X-Message-ID-Hash: RYH5HVLMB5MJZE42RGXHTJY5XN7XGSG4
X-Mailman-Approved-At: Tue, 13 Feb 2024 15:00:57 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RYH5HVLMB5MJZE42RGXHTJY5XN7XGSG4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch fixes a widespread spelling mistake of the word "request"
(incorrectly spelled as "reguest") across multiple files.

Signed-off-by: Yinchuan Guo <guoych37@mail2.sysu.edu.cn>
---
 drivers/mfd/da9063-irq.c      | 2 +-
 drivers/scsi/lpfc/lpfc_sli.c  | 2 +-
 drivers/tty/serial/max310x.c  | 2 +-
 drivers/tty/serial/sccnxp.c   | 2 +-
 sound/soc/codecs/rt274.c      | 2 +-
 sound/soc/codecs/rt286.c      | 2 +-
 sound/soc/codecs/rt298.c      | 2 +-
 sound/soc/codecs/rt5514-spi.c | 2 +-
 sound/soc/codecs/rt5640.c     | 2 +-
 sound/soc/codecs/rt5645.c     | 2 +-
 sound/soc/codecs/rt5651.c     | 2 +-
 sound/soc/codecs/rt5659.c     | 2 +-
 sound/soc/codecs/rt5663.c     | 2 +-
 sound/soc/codecs/rt5665.c     | 2 +-
 sound/soc/codecs/rt5668.c     | 2 +-
 sound/soc/codecs/rt5682-i2c.c | 2 +-
 16 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/mfd/da9063-irq.c b/drivers/mfd/da9063-irq.c
index e2bbedf58e68..698d8ea50f32 100644
--- a/drivers/mfd/da9063-irq.c
+++ b/drivers/mfd/da9063-irq.c
@@ -188,7 +188,7 @@ int da9063_irq_init(struct da9063 *da9063)
 			IRQF_TRIGGER_LOW | IRQF_ONESHOT | IRQF_SHARED,
 			da9063->irq_base, irq_chip, &da9063->regmap_irq);
 	if (ret) {
-		dev_err(da9063->dev, "Failed to reguest IRQ %d: %d\n",
+		dev_err(da9063->dev, "Failed to request IRQ %d: %d\n",
 				da9063->chip_irq, ret);
 		return ret;
 	}
diff --git a/drivers/scsi/lpfc/lpfc_sli.c b/drivers/scsi/lpfc/lpfc_sli.c
index fc3682f15f50..a4fd45bb4ea5 100644
--- a/drivers/scsi/lpfc/lpfc_sli.c
+++ b/drivers/scsi/lpfc/lpfc_sli.c
@@ -9724,7 +9724,7 @@ lpfc_sli4_iocb2wqe(struct lpfc_hba *phba, struct lpfc_iocbq *iocbq,
 		}
 
 		wqe->els_req.payload_len = xmit_len;
-		/* Els_reguest64 has a TMO */
+		/* Els_request64 has a TMO */
 		bf_set(wqe_tmo, &wqe->els_req.wqe_com,
 			iocbq->iocb.ulpTimeout);
 		/* Need a VF for word 4 set the vf bit*/
diff --git a/drivers/tty/serial/max310x.c b/drivers/tty/serial/max310x.c
index 3cbc757d7be7..6e259b292c41 100644
--- a/drivers/tty/serial/max310x.c
+++ b/drivers/tty/serial/max310x.c
@@ -1402,7 +1402,7 @@ static int max310x_probe(struct device *dev, const struct max310x_devtype *devty
 	if (!ret)
 		return 0;
 
-	dev_err(dev, "Unable to reguest IRQ %i\n", irq);
+	dev_err(dev, "Unable to request IRQ %i\n", irq);
 
 out_uart:
 	for (i = 0; i < devtype->nr; i++) {
diff --git a/drivers/tty/serial/sccnxp.c b/drivers/tty/serial/sccnxp.c
index 10cc16a71f26..8968d214da2f 100644
--- a/drivers/tty/serial/sccnxp.c
+++ b/drivers/tty/serial/sccnxp.c
@@ -1016,7 +1016,7 @@ static int sccnxp_probe(struct platform_device *pdev)
 		if (!ret)
 			return 0;
 
-		dev_err(&pdev->dev, "Unable to reguest IRQ %i\n", s->irq);
+		dev_err(&pdev->dev, "Unable to request IRQ %i\n", s->irq);
 	} else {
 		timer_setup(&s->timer, sccnxp_timer, 0);
 		mod_timer(&s->timer, jiffies +
diff --git a/sound/soc/codecs/rt274.c b/sound/soc/codecs/rt274.c
index 0d3773c576f8..b385b859373b 100644
--- a/sound/soc/codecs/rt274.c
+++ b/sound/soc/codecs/rt274.c
@@ -1196,7 +1196,7 @@ static int rt274_i2c_probe(struct i2c_client *i2c,
 			IRQF_TRIGGER_HIGH | IRQF_ONESHOT, "rt274", rt274);
 		if (ret != 0) {
 			dev_err(&i2c->dev,
-				"Failed to reguest IRQ: %d\n", ret);
+				"Failed to request IRQ: %d\n", ret);
 			return ret;
 		}
 	}
diff --git a/sound/soc/codecs/rt286.c b/sound/soc/codecs/rt286.c
index 802f4851c3df..061211f0fd65 100644
--- a/sound/soc/codecs/rt286.c
+++ b/sound/soc/codecs/rt286.c
@@ -1244,7 +1244,7 @@ static int rt286_i2c_probe(struct i2c_client *i2c,
 			IRQF_TRIGGER_HIGH | IRQF_ONESHOT, "rt286", rt286);
 		if (ret != 0) {
 			dev_err(&i2c->dev,
-				"Failed to reguest IRQ: %d\n", ret);
+				"Failed to request IRQ: %d\n", ret);
 			return ret;
 		}
 	}
diff --git a/sound/soc/codecs/rt298.c b/sound/soc/codecs/rt298.c
index c592c40a7ab3..ac81edfd2320 100644
--- a/sound/soc/codecs/rt298.c
+++ b/sound/soc/codecs/rt298.c
@@ -1286,7 +1286,7 @@ static int rt298_i2c_probe(struct i2c_client *i2c,
 			IRQF_TRIGGER_HIGH | IRQF_ONESHOT, "rt298", rt298);
 		if (ret != 0) {
 			dev_err(&i2c->dev,
-				"Failed to reguest IRQ: %d\n", ret);
+				"Failed to request IRQ: %d\n", ret);
 			return ret;
 		}
 	}
diff --git a/sound/soc/codecs/rt5514-spi.c b/sound/soc/codecs/rt5514-spi.c
index 1a25a3787935..98e12f8113bc 100644
--- a/sound/soc/codecs/rt5514-spi.c
+++ b/sound/soc/codecs/rt5514-spi.c
@@ -280,7 +280,7 @@ static int rt5514_spi_pcm_probe(struct snd_soc_component *component)
 			rt5514_dsp);
 		if (ret)
 			dev_err(&rt5514_spi->dev,
-				"%s Failed to reguest IRQ: %d\n", __func__,
+				"%s Failed to request IRQ: %d\n", __func__,
 				ret);
 		else
 			device_init_wakeup(rt5514_dsp->dev, true);
diff --git a/sound/soc/codecs/rt5640.c b/sound/soc/codecs/rt5640.c
index 9523f4b5c800..5b7ae70be1be 100644
--- a/sound/soc/codecs/rt5640.c
+++ b/sound/soc/codecs/rt5640.c
@@ -2843,7 +2843,7 @@ static int rt5640_i2c_probe(struct i2c_client *i2c,
 		/* Gets re-enabled by rt5640_set_jack() */
 		disable_irq(rt5640->irq);
 	} else {
-		dev_warn(&i2c->dev, "Failed to reguest IRQ %d: %d\n",
+		dev_warn(&i2c->dev, "Failed to request IRQ %d: %d\n",
 			 rt5640->irq, ret);
 		rt5640->irq = -ENXIO;
 	}
diff --git a/sound/soc/codecs/rt5645.c b/sound/soc/codecs/rt5645.c
index 9408ee63cb26..cc868a9742bc 100644
--- a/sound/soc/codecs/rt5645.c
+++ b/sound/soc/codecs/rt5645.c
@@ -4127,7 +4127,7 @@ static int rt5645_i2c_probe(struct i2c_client *i2c,
 			IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING
 			| IRQF_ONESHOT, "rt5645", rt5645);
 		if (ret) {
-			dev_err(&i2c->dev, "Failed to reguest IRQ: %d\n", ret);
+			dev_err(&i2c->dev, "Failed to request IRQ: %d\n", ret);
 			goto err_enable;
 		}
 	}
diff --git a/sound/soc/codecs/rt5651.c b/sound/soc/codecs/rt5651.c
index fc0c83b73f09..e603886627e4 100644
--- a/sound/soc/codecs/rt5651.c
+++ b/sound/soc/codecs/rt5651.c
@@ -2266,7 +2266,7 @@ static int rt5651_i2c_probe(struct i2c_client *i2c,
 		/* Gets re-enabled by rt5651_set_jack() */
 		disable_irq(rt5651->irq);
 	} else {
-		dev_warn(&i2c->dev, "Failed to reguest IRQ %d: %d\n",
+		dev_warn(&i2c->dev, "Failed to request IRQ %d: %d\n",
 			 rt5651->irq, ret);
 		rt5651->irq = -ENXIO;
 	}
diff --git a/sound/soc/codecs/rt5659.c b/sound/soc/codecs/rt5659.c
index 4a50b169fe03..acfbdcf2fbd9 100644
--- a/sound/soc/codecs/rt5659.c
+++ b/sound/soc/codecs/rt5659.c
@@ -4299,7 +4299,7 @@ static int rt5659_i2c_probe(struct i2c_client *i2c,
 			rt5659_irq, IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING
 			| IRQF_ONESHOT, "rt5659", rt5659);
 		if (ret)
-			dev_err(&i2c->dev, "Failed to reguest IRQ: %d\n", ret);
+			dev_err(&i2c->dev, "Failed to request IRQ: %d\n", ret);
 
 		/* Enable IRQ output for GPIO1 pin any way */
 		regmap_update_bits(rt5659->regmap, RT5659_GPIO_CTRL_1,
diff --git a/sound/soc/codecs/rt5663.c b/sound/soc/codecs/rt5663.c
index be9fc58ff681..8f7db0703ea2 100644
--- a/sound/soc/codecs/rt5663.c
+++ b/sound/soc/codecs/rt5663.c
@@ -3676,7 +3676,7 @@ static int rt5663_i2c_probe(struct i2c_client *i2c,
 			IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING
 			| IRQF_ONESHOT, "rt5663", rt5663);
 		if (ret) {
-			dev_err(&i2c->dev, "%s Failed to reguest IRQ: %d\n",
+			dev_err(&i2c->dev, "%s Failed to request IRQ: %d\n",
 				__func__, ret);
 			goto err_enable;
 		}
diff --git a/sound/soc/codecs/rt5665.c b/sound/soc/codecs/rt5665.c
index e59323fd5bf2..d82ead0e5caf 100644
--- a/sound/soc/codecs/rt5665.c
+++ b/sound/soc/codecs/rt5665.c
@@ -4930,7 +4930,7 @@ static int rt5665_i2c_probe(struct i2c_client *i2c,
 			rt5665_irq, IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING
 			| IRQF_ONESHOT, "rt5665", rt5665);
 		if (ret)
-			dev_err(&i2c->dev, "Failed to reguest IRQ: %d\n", ret);
+			dev_err(&i2c->dev, "Failed to request IRQ: %d\n", ret);
 
 	}
 
diff --git a/sound/soc/codecs/rt5668.c b/sound/soc/codecs/rt5668.c
index 6ab1a8bc3735..f1abfbc62a78 100644
--- a/sound/soc/codecs/rt5668.c
+++ b/sound/soc/codecs/rt5668.c
@@ -2581,7 +2581,7 @@ static int rt5668_i2c_probe(struct i2c_client *i2c,
 			rt5668_irq, IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING
 			| IRQF_ONESHOT, "rt5668", rt5668);
 		if (ret)
-			dev_err(&i2c->dev, "Failed to reguest IRQ: %d\n", ret);
+			dev_err(&i2c->dev, "Failed to request IRQ: %d\n", ret);
 
 	}
 
diff --git a/sound/soc/codecs/rt5682-i2c.c b/sound/soc/codecs/rt5682-i2c.c
index 8ea9f1d9fec0..d03307585806 100644
--- a/sound/soc/codecs/rt5682-i2c.c
+++ b/sound/soc/codecs/rt5682-i2c.c
@@ -261,7 +261,7 @@ static int rt5682_i2c_probe(struct i2c_client *i2c,
 			rt5682_irq, IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING
 			| IRQF_ONESHOT, "rt5682", rt5682);
 		if (ret)
-			dev_err(&i2c->dev, "Failed to reguest IRQ: %d\n", ret);
+			dev_err(&i2c->dev, "Failed to request IRQ: %d\n", ret);
 	}
 
 	return devm_snd_soc_register_component(&i2c->dev,
-- 
2.34.1

