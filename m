Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7B0B581
	for <lists+alsa-devel@lfdr.de>; Sun, 28 Apr 2019 09:32:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 25C9A87E;
	Sun, 28 Apr 2019 09:32:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 25C9A87E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556436772;
	bh=zmlapQdT/HZz6+AHUSIrx761bjF6OKlHJLr4G7tEKGQ=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=l1ANlnth1+PyOeBQjtEkXmoE59pMKl6iLwJr4RXqYa9r81dpW5l6VhGETQHdudlvg
	 FbN/eMEGY/BOTEJmz7aPw/n1K0rEkvhgQEHUOycSVTyanoXNXl/yPlwGEP+CHuqTSe
	 wrF5dGPMDvcPTsoocRZjH7dsNbkO6FVFcoRfJToo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6BC96F896F0;
	Sun, 28 Apr 2019 09:30:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BA94BF896DF; Wed, 24 Apr 2019 17:28:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,KHOP_DYNAMIC,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7A756F89618
 for <alsa-devel@alsa-project.org>; Wed, 24 Apr 2019 17:28:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A756F89618
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=st.com header.i=@st.com header.b="rmgLZLWt"
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x3OFH4d9000566; Wed, 24 Apr 2019 17:28:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=RoPstAPuCUxNTqGt8P8YKt6rQGwssvcBvsdDnN1zA+s=;
 b=rmgLZLWtmixJL4NaVtUx8q908GL2JPDxaTri0FP+hf+hnBSIPSsvLNXZNmM6yY00nqJW
 D4G5IOsaTgrHjkSviBx+iLWvetNpYRoqVc5++HpdstoTcCBjex2gzmam6a8m4FdT6JqI
 fzRmULluDOKzJmpMDrVTjeyJKN8fnqcNo+Hnd8uyNqrnJlul43eZ7JGrnsgDO4Nawqtd
 4LdDPP8KiYzfxBJFYh7+jzBZOeIfA5JH/KzBDXRAFYUW8yShTipbqbFJ4diW2xbw8vCf
 1X7HxLq2L+bxPOv9zKqzjkskY6UudxbXBYw0XGIG10sNSeqCXh43zy9ghWkPHy6FXQ2K cA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2rytad7e6n-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Wed, 24 Apr 2019 17:28:50 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B196C34;
 Wed, 24 Apr 2019 15:28:49 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7689F292D;
 Wed, 24 Apr 2019 15:28:49 +0000 (GMT)
Received: from SAFEX1HUBCAS23.st.com (10.75.90.47) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.361.1; Wed, 24 Apr
 2019 17:28:49 +0200
Received: from localhost (10.201.23.25) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 24 Apr 2019 17:28:48
 +0200
From: Fabien Dessenne <fabien.dessenne@st.com>
To: Olivier Moysan <olivier.moysan@st.com>, Arnaud Pouliquen
 <arnaud.pouliquen@st.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, "Alexandre
 Torgue" <alexandre.torgue@st.com>, <alsa-devel@alsa-project.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Wed, 24 Apr 2019 17:28:44 +0200
Message-ID: <1556119724-9873-1-git-send-email-fabien.dessenne@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.201.23.25]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-24_09:, , signatures=0
X-Mailman-Approved-At: Sun, 28 Apr 2019 09:30:26 +0200
Cc: Fabien Dessenne <fabien.dessenne@st.com>
Subject: [alsa-devel] [PATCH] ASoC: stm32: i2s: return the get_irq error
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

During probe, return the "get_irq" error value instead of -ENOENT. This
allows the driver to be deferred probed if needed.

Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
---
 sound/soc/stm/stm32_i2s.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/stm/stm32_i2s.c b/sound/soc/stm/stm32_i2s.c
index 9526342..97d5e99 100644
--- a/sound/soc/stm/stm32_i2s.c
+++ b/sound/soc/stm/stm32_i2s.c
@@ -838,8 +838,9 @@ static int stm32_i2s_parse_dt(struct platform_device *pdev,
 	/* Get irqs */
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0) {
-		dev_err(&pdev->dev, "no irq for node %s\n", pdev->name);
-		return -ENOENT;
+		if (irq != -EPROBE_DEFER)
+			dev_err(&pdev->dev, "no irq for node %s\n", pdev->name);
+		return irq;
 	}
 
 	ret = devm_request_irq(&pdev->dev, irq, stm32_i2s_isr, IRQF_ONESHOT,
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
