Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2ED14A20
	for <lists+alsa-devel@lfdr.de>; Mon,  6 May 2019 14:46:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE81C1889;
	Mon,  6 May 2019 14:46:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE81C1889
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557146816;
	bh=XN8KKrFSTZw7VadrHSB2kUo4W+LXj+/xb3PDnDeuGq0=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DKxc8xWz54ctayFqA3uxBaPag9n6vlztmOfeVNevct3ISFVwOdeyNIqtJ32+jEbRD
	 cgE5j/QnrO4LH82uiaBPCaKhTdeKXTnevMzALaCQSfc3NxNi3kDISX8jEtK7cd1+NQ
	 i54w98TIe4kbJ/725eTTVzBIT1U3RtApo7Mev7x4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9BDE6F8972D;
	Mon,  6 May 2019 14:44:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7997BF8972A; Mon,  6 May 2019 14:44:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9CCCEF89701
 for <alsa-devel@alsa-project.org>; Mon,  6 May 2019 14:44:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9CCCEF89701
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=st.com header.i=@st.com header.b="YPn34W6a"
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x46CaeeK004677; Mon, 6 May 2019 14:44:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=ePramUuugRjelkjbhu7MX3ckPvU758bFiYwYbfLUL6o=;
 b=YPn34W6aCQcpXFdfWgM++nsc9OYFu5Fe+WDkUy00ha31Mj/pIUCN8pmhxSRRTV+80Wsn
 DPF5hkKxPWysJDXyxXbWaoakFAMni6vXOXsNtxX2hnF05N1jUj1FQ7nVzHQhU2cafc/2
 pQHqcf2DBJ4/stq93ESDTnFWxXWqYaDwJYIFP12d9qDLbk4lJquhz+d4BthHh6+ToPok
 IeK42KdNvlUIHDplcwc6BBhkhXA8w8mqWPN1y+YF0BUSemwvOHqJGsYi8o8P5Gd2Vq6I
 2facXitW4GVi3YEARnxAiyyDxHz+EbwqgA2mwGzW2ocTRpnlx7milZhuC7cbGfldwO3w /w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2s94c39ey7-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 06 May 2019 14:44:15 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8AE6D34;
 Mon,  6 May 2019 12:44:14 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 501E02583;
 Mon,  6 May 2019 12:44:14 +0000 (GMT)
Received: from SAFEX1HUBCAS24.st.com (10.75.90.95) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.361.1; Mon, 6 May 2019
 14:44:14 +0200
Received: from localhost (10.201.23.16) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 6 May 2019 14:44:13
 +0200
From: Olivier Moysan <olivier.moysan@st.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@st.com>, <alsa-devel@alsa-project.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-kernel@vger.kernel.org>, <olivier.moysan@st.com>,
 <arnaud.pouliquen@st.com>
Date: Mon, 6 May 2019 14:44:06 +0200
Message-ID: <1557146646-18150-4-git-send-email-olivier.moysan@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1557146646-18150-1-git-send-email-olivier.moysan@st.com>
References: <1557146646-18150-1-git-send-email-olivier.moysan@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.16]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-06_08:, , signatures=0
Cc: benjamin.gaignard@st.com
Subject: [alsa-devel] [PATCH 3/3] ASoC: stm32: spdifrx: manage
	identification registers
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

Add support of identification registers in STM32 SPDIFRX.

Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
---
 sound/soc/stm/stm32_spdifrx.c | 37 +++++++++++++++++++++++++++++++++++--
 1 file changed, 35 insertions(+), 2 deletions(-)

diff --git a/sound/soc/stm/stm32_spdifrx.c b/sound/soc/stm/stm32_spdifrx.c
index 3d64200edbb5..4a3fad4a711f 100644
--- a/sound/soc/stm/stm32_spdifrx.c
+++ b/sound/soc/stm/stm32_spdifrx.c
@@ -16,6 +16,7 @@
  * details.
  */
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/completion.h>
 #include <linux/delay.h>
@@ -36,6 +37,9 @@
 #define STM32_SPDIFRX_DR	0x10
 #define STM32_SPDIFRX_CSR	0x14
 #define STM32_SPDIFRX_DIR	0x18
+#define STM32_SPDIFRX_VERR	0x3F4
+#define STM32_SPDIFRX_IDR	0x3F8
+#define STM32_SPDIFRX_SIDR	0x3FC
 
 /* Bit definition for SPDIF_CR register */
 #define SPDIFRX_CR_SPDIFEN_SHIFT	0
@@ -169,6 +173,18 @@
 #define SPDIFRX_SPDIFEN_SYNC	0x1
 #define SPDIFRX_SPDIFEN_ENABLE	0x3
 
+/* Bit definition for SPDIFRX_VERR register */
+#define SPDIFRX_VERR_MIN_MASK	GENMASK(3, 0)
+#define SPDIFRX_VERR_MAJ_MASK	GENMASK(7, 4)
+
+/* Bit definition for SPDIFRX_IDR register */
+#define SPDIFRX_IDR_ID_MASK	GENMASK(31, 0)
+
+/* Bit definition for SPDIFRX_SIDR register */
+#define SPDIFRX_SIDR_SID_MASK	GENMASK(31, 0)
+
+#define SPDIFRX_IPIDR_NUMBER	0x00130041
+
 #define SPDIFRX_IN1		0x1
 #define SPDIFRX_IN2		0x2
 #define SPDIFRX_IN3		0x3
@@ -607,6 +623,9 @@ static bool stm32_spdifrx_readable_reg(struct device *dev, unsigned int reg)
 	case STM32_SPDIFRX_DR:
 	case STM32_SPDIFRX_CSR:
 	case STM32_SPDIFRX_DIR:
+	case STM32_SPDIFRX_VERR:
+	case STM32_SPDIFRX_IDR:
+	case STM32_SPDIFRX_SIDR:
 		return true;
 	default:
 		return false;
@@ -642,10 +661,11 @@ static const struct regmap_config stm32_h7_spdifrx_regmap_conf = {
 	.reg_bits = 32,
 	.reg_stride = 4,
 	.val_bits = 32,
-	.max_register = STM32_SPDIFRX_DIR,
+	.max_register = STM32_SPDIFRX_SIDR,
 	.readable_reg = stm32_spdifrx_readable_reg,
 	.volatile_reg = stm32_spdifrx_volatile_reg,
 	.writeable_reg = stm32_spdifrx_writeable_reg,
+	.num_reg_defaults_raw = STM32_SPDIFRX_SIDR / sizeof(u32) + 1,
 	.fast_io = true,
 	.cache_type = REGCACHE_FLAT,
 };
@@ -912,6 +932,7 @@ static int stm32_spdifrx_probe(struct platform_device *pdev)
 	struct stm32_spdifrx_data *spdifrx;
 	struct reset_control *rst;
 	const struct snd_dmaengine_pcm_config *pcm_config = NULL;
+	u32 ver, idr;
 	int ret;
 
 	spdifrx = devm_kzalloc(&pdev->dev, sizeof(*spdifrx), GFP_KERNEL);
@@ -968,7 +989,19 @@ static int stm32_spdifrx_probe(struct platform_device *pdev)
 		goto error;
 	}
 
-	return 0;
+	ret = regmap_read(spdifrx->regmap, STM32_SPDIFRX_IDR, &idr);
+	if (ret)
+		goto error;
+
+	if (idr == SPDIFRX_IPIDR_NUMBER) {
+		ret = regmap_read(spdifrx->regmap, STM32_SPDIFRX_VERR, &ver);
+
+		dev_dbg(&pdev->dev, "SPDIFRX version: %lu.%lu registered\n",
+			FIELD_GET(SPDIFRX_VERR_MAJ_MASK, ver),
+			FIELD_GET(SPDIFRX_VERR_MIN_MASK, ver));
+	}
+
+	return ret;
 
 error:
 	if (!IS_ERR(spdifrx->ctrl_chan))
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
