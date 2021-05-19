Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 443ED389819
	for <lists+alsa-devel@lfdr.de>; Wed, 19 May 2021 22:39:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE7D91688;
	Wed, 19 May 2021 22:39:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE7D91688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621456793;
	bh=uLeTrLmJ9HGxgZDiim/waXs49X1CV9WccAqx2VisYw0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rcKcm6ZMGffQlMd5aJe3ccEXtu4EW4ouNKN/V3Fp7ulXbyAl/KZ9Fw09fWt3Xe67q
	 3JUe04NtgPpLPcSPl1SrJnqTsqTEduQxht0ZjWxOhNSbwWACCOhoX/VqYvGc67QJOX
	 vnGvE2T5gSzZ7RaA5Bwe1G3ywtaQyq9BlrdKV0L4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 024D6F80249;
	Wed, 19 May 2021 22:38:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9FBEFF802A0; Wed, 19 May 2021 22:38:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, 
 UPPERCASE_50_75,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 14169F80153
 for <alsa-devel@alsa-project.org>; Wed, 19 May 2021 22:38:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14169F80153
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="bROfuO5N"
Received: by mail-ot1-x32a.google.com with SMTP id
 69-20020a9d0a4b0000b02902ed42f141e1so12935232otg.2
 for <alsa-devel@alsa-project.org>; Wed, 19 May 2021 13:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y6gUZjW3DQSf/K+AolZUSOtqwAQrYwq+baqC3eF6v8I=;
 b=bROfuO5NfHeqfidw5/zBe5jA0eI1QXLyqGFQhOGd279vs7nqW06CUsrgv+K96bArmo
 2YJkWXqQV9yk7TNBEh2hwEgFKGrmLsz5ZiOg0jhSNCb+EH/eXhueXacFe3kPU1ZGYjx8
 DzPu5ZAru6xLkYYCig2u/9SdNHMWs2owo0SFyPDlsLBmmwZ4ilMv/dAKKdoD4bp+h3D1
 SzGAWLY/3WAMli+IPo0IF8EJE8Wt3bA7Z0QuS0/NNh9Nnkgk7tIB6AQrayYlp2Eb1Lp+
 Th3GQ1MhcOEV4b2BF6iCNjsAe4P1Nd9U7i8cYg1JvTy/GFtPy45peIJlG+pNWj9i0iY3
 xJlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y6gUZjW3DQSf/K+AolZUSOtqwAQrYwq+baqC3eF6v8I=;
 b=HWpoxWlQlLlI7mTE1XT/axjtEV3LKS8RT270zJzFk0ex4ubWGWus6mXabnQ6HY/qSQ
 BKMzciRM6dwvvdhdEbDsJBnkQL8QpUr9VUWGLUDoWyZLBvLMh5KJobvxePfHMoM0cNfg
 IBqhoNeQXykmU1ks2pymryzG2HhawdxV0VcNx5hl5f9otLaUyG9KfV51hYPTMjo42yG6
 HP6P2cP+sCboqiHHB/di6uRWJJjt2t0To0up46dZxueEW2Eg1GJHdIulXrNu3Os9GpSI
 a68ijfd722MFy4Y4x/iwDrXtFFjLKoXeK2Bs7A8Vwvn5UrZKGVe6rfGmSku0OYfipiTU
 Jmrg==
X-Gm-Message-State: AOAM532Dd5E2/oIlt7R8uIgydWx4K/oeu1+/mL6DAbRLyPYGb+A33JBR
 PHVwrVi11hSc50dIOET9KD9SgaRyQL0=
X-Google-Smtp-Source: ABdhPJztrHx049tLU9UgUk/SVZkbsFZFnK/7PgJ/XoKjOd/y1AIKz/BhpQUUZYgbLn6DU2BEEkl0Ug==
X-Received: by 2002:a05:6830:90d:: with SMTP id
 v13mr1108901ott.105.1621456683816; 
 Wed, 19 May 2021 13:38:03 -0700 (PDT)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com.
 [76.183.134.35])
 by smtp.gmail.com with ESMTPSA id w6sm189223otj.5.2021.05.19.13.38.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 13:38:03 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v12 1/4] mfd: Add Rockchip rk817 audio CODEC support
Date: Wed, 19 May 2021 15:37:51 -0500
Message-Id: <20210519203754.27184-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210519203754.27184-1-macroalpha82@gmail.com>
References: <20210519203754.27184-1-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com, heiko@sntech.de,
 devicetree@vger.kernel.org, tiwai@suse.com, robh+dt@kernel.org,
 lgirdwood@gmail.com, linux-rockchip@lists.infradead.org, broonie@kernel.org,
 Chris Morgan <macromorgan@hotmail.com>, jbx6244@gmail.com,
 lee.jones@linaro.org, maccraft123mc@gmail.com
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

From: Chris Morgan <macromorgan@hotmail.com>

Add rk817 codec support cell to rk808 mfd driver.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Tested-by: Maciej Matuszczyk <maccraft123mc@gmail.com>
Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mfd/rk808.c       | 81 +++++++++++++++++++++++++++++++++++++++
 include/linux/mfd/rk808.h | 81 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 162 insertions(+)

diff --git a/drivers/mfd/rk808.c b/drivers/mfd/rk808.c
index ad923dd4e007..77ccd31ca1d9 100644
--- a/drivers/mfd/rk808.c
+++ b/drivers/mfd/rk808.c
@@ -65,6 +65,7 @@ static bool rk817_is_volatile_reg(struct device *dev, unsigned int reg)
 	switch (reg) {
 	case RK817_SECONDS_REG ... RK817_WEEKS_REG:
 	case RK817_RTC_STATUS_REG:
+	case RK817_CODEC_DTOP_LPT_SRST:
 	case RK817_INT_STS_REG0:
 	case RK817_INT_STS_REG1:
 	case RK817_INT_STS_REG2:
@@ -163,6 +164,7 @@ static const struct mfd_cell rk817s[] = {
 		.num_resources = ARRAY_SIZE(rk817_rtc_resources),
 		.resources = &rk817_rtc_resources[0],
 	},
+	{ .name = "rk817-codec",},
 };
 
 static const struct mfd_cell rk818s[] = {
@@ -201,6 +203,85 @@ static const struct rk808_reg_data rk808_pre_init_reg[] = {
 
 static const struct rk808_reg_data rk817_pre_init_reg[] = {
 	{RK817_RTC_CTRL_REG, RTC_STOP, RTC_STOP},
+	/* Codec specific registers */
+	{ RK817_CODEC_DTOP_VUCTL, MASK_ALL, 0x03 },
+	{ RK817_CODEC_DTOP_VUCTIME, MASK_ALL, 0x00 },
+	{ RK817_CODEC_DTOP_LPT_SRST, MASK_ALL, 0x00 },
+	{ RK817_CODEC_DTOP_DIGEN_CLKE, MASK_ALL, 0x00 },
+	/* from vendor driver, CODEC_AREF_RTCFG0 not defined in data sheet */
+	{ RK817_CODEC_AREF_RTCFG0, MASK_ALL, 0x00 },
+	{ RK817_CODEC_AREF_RTCFG1, MASK_ALL, 0x06 },
+	{ RK817_CODEC_AADC_CFG0, MASK_ALL, 0xc8 },
+	/* from vendor driver, CODEC_AADC_CFG1 not defined in data sheet */
+	{ RK817_CODEC_AADC_CFG1, MASK_ALL, 0x00 },
+	{ RK817_CODEC_DADC_VOLL, MASK_ALL, 0x00 },
+	{ RK817_CODEC_DADC_VOLR, MASK_ALL, 0x00 },
+	{ RK817_CODEC_DADC_SR_ACL0, MASK_ALL, 0x00 },
+	{ RK817_CODEC_DADC_ALC1, MASK_ALL, 0x00 },
+	{ RK817_CODEC_DADC_ALC2, MASK_ALL, 0x00 },
+	{ RK817_CODEC_DADC_NG, MASK_ALL, 0x00 },
+	{ RK817_CODEC_DADC_HPF, MASK_ALL, 0x00 },
+	{ RK817_CODEC_DADC_RVOLL, MASK_ALL, 0xff },
+	{ RK817_CODEC_DADC_RVOLR, MASK_ALL, 0xff },
+	{ RK817_CODEC_AMIC_CFG0, MASK_ALL, 0x70 },
+	{ RK817_CODEC_AMIC_CFG1, MASK_ALL, 0x00 },
+	{ RK817_CODEC_DMIC_PGA_GAIN, MASK_ALL, 0x66 },
+	{ RK817_CODEC_DMIC_LMT1, MASK_ALL, 0x00 },
+	{ RK817_CODEC_DMIC_LMT2, MASK_ALL, 0x00 },
+	{ RK817_CODEC_DMIC_NG1, MASK_ALL, 0x00 },
+	{ RK817_CODEC_DMIC_NG2, MASK_ALL, 0x00 },
+	/* from vendor driver, CODEC_ADAC_CFG0 not defined in data sheet */
+	{ RK817_CODEC_ADAC_CFG0, MASK_ALL, 0x00 },
+	{ RK817_CODEC_ADAC_CFG1, MASK_ALL, 0x07 },
+	{ RK817_CODEC_DDAC_POPD_DACST, MASK_ALL, 0x82 },
+	{ RK817_CODEC_DDAC_VOLL, MASK_ALL, 0x00 },
+	{ RK817_CODEC_DDAC_VOLR, MASK_ALL, 0x00 },
+	{ RK817_CODEC_DDAC_SR_LMT0, MASK_ALL, 0x00 },
+	{ RK817_CODEC_DDAC_LMT1, MASK_ALL, 0x00 },
+	{ RK817_CODEC_DDAC_LMT2, MASK_ALL, 0x00 },
+	{ RK817_CODEC_DDAC_MUTE_MIXCTL, MASK_ALL, 0xa0 },
+	{ RK817_CODEC_DDAC_RVOLL, MASK_ALL, 0xff },
+	{ RK817_CODEC_DADC_RVOLR, MASK_ALL, 0xff },
+	{ RK817_CODEC_AMIC_CFG0, MASK_ALL, 0x70 },
+	{ RK817_CODEC_AMIC_CFG1, MASK_ALL, 0x00 },
+	{ RK817_CODEC_DMIC_PGA_GAIN, MASK_ALL, 0x66 },
+	{ RK817_CODEC_DMIC_LMT1, MASK_ALL, 0x00 },
+	{ RK817_CODEC_DMIC_LMT2, MASK_ALL, 0x00 },
+	{ RK817_CODEC_DMIC_NG1, MASK_ALL, 0x00 },
+	{ RK817_CODEC_DMIC_NG2, MASK_ALL, 0x00 },
+	/* from vendor driver, CODEC_ADAC_CFG0 not defined in data sheet */
+	{ RK817_CODEC_ADAC_CFG0, MASK_ALL, 0x00 },
+	{ RK817_CODEC_ADAC_CFG1, MASK_ALL, 0x07 },
+	{ RK817_CODEC_DDAC_POPD_DACST, MASK_ALL, 0x82 },
+	{ RK817_CODEC_DDAC_VOLL, MASK_ALL, 0x00 },
+	{ RK817_CODEC_DDAC_VOLR, MASK_ALL, 0x00 },
+	{ RK817_CODEC_DDAC_SR_LMT0, MASK_ALL, 0x00 },
+	{ RK817_CODEC_DDAC_LMT1, MASK_ALL, 0x00 },
+	{ RK817_CODEC_DDAC_LMT2, MASK_ALL, 0x00 },
+	{ RK817_CODEC_DDAC_MUTE_MIXCTL, MASK_ALL, 0xa0 },
+	{ RK817_CODEC_DDAC_RVOLL, MASK_ALL, 0xff },
+	{ RK817_CODEC_DDAC_RVOLR, MASK_ALL, 0xff },
+	{ RK817_CODEC_AHP_ANTI0, MASK_ALL, 0x00 },
+	{ RK817_CODEC_AHP_ANTI1, MASK_ALL, 0x00 },
+	{ RK817_CODEC_AHP_CFG0, MASK_ALL, 0xe0 },
+	{ RK817_CODEC_AHP_CFG1, MASK_ALL, 0x1f },
+	{ RK817_CODEC_AHP_CP, MASK_ALL, 0x09 },
+	{ RK817_CODEC_ACLASSD_CFG1, MASK_ALL, 0x69 },
+	{ RK817_CODEC_ACLASSD_CFG2, MASK_ALL, 0x44 },
+	{ RK817_CODEC_APLL_CFG0, MASK_ALL, 0x04 },
+	{ RK817_CODEC_APLL_CFG1, MASK_ALL, 0x00 },
+	{ RK817_CODEC_APLL_CFG2, MASK_ALL, 0x30 },
+	{ RK817_CODEC_APLL_CFG3, MASK_ALL, 0x19 },
+	{ RK817_CODEC_APLL_CFG4, MASK_ALL, 0x65 },
+	{ RK817_CODEC_APLL_CFG5, MASK_ALL, 0x01 },
+	{ RK817_CODEC_DI2S_CKM, MASK_ALL, 0x01 },
+	{ RK817_CODEC_DI2S_RSD, MASK_ALL, 0x00 },
+	{ RK817_CODEC_DI2S_RXCR1, MASK_ALL, 0x00 },
+	{ RK817_CODEC_DI2S_RXCR2, MASK_ALL, 0x17 },
+	{ RK817_CODEC_DI2S_RXCMD_TSD, MASK_ALL, 0x00 },
+	{ RK817_CODEC_DI2S_TXCR1, MASK_ALL, 0x00 },
+	{ RK817_CODEC_DI2S_TXCR2, MASK_ALL, 0x17 },
+	{ RK817_CODEC_DI2S_TXCR3_TXCMD, MASK_ALL, 0x00 },
 	{RK817_GPIO_INT_CFG, RK817_INT_POL_MSK, RK817_INT_POL_L},
 	{RK817_SYS_CFG(1), RK817_HOTDIE_TEMP_MSK | RK817_TSD_TEMP_MSK,
 					   RK817_HOTDIE_105 | RK817_TSD_140},
diff --git a/include/linux/mfd/rk808.h b/include/linux/mfd/rk808.h
index e07f6e61cd38..a96e6d43ca06 100644
--- a/include/linux/mfd/rk808.h
+++ b/include/linux/mfd/rk808.h
@@ -437,6 +437,87 @@ enum rk809_reg_id {
 #define RK817_RTC_COMP_LSB_REG		0x10
 #define RK817_RTC_COMP_MSB_REG		0x11
 
+/* RK817 Codec Registers */
+#define RK817_CODEC_DTOP_VUCTL		0x12
+#define RK817_CODEC_DTOP_VUCTIME	0x13
+#define RK817_CODEC_DTOP_LPT_SRST	0x14
+#define RK817_CODEC_DTOP_DIGEN_CLKE	0x15
+#define RK817_CODEC_AREF_RTCFG0		0x16
+#define RK817_CODEC_AREF_RTCFG1		0x17
+#define RK817_CODEC_AADC_CFG0		0x18
+#define RK817_CODEC_AADC_CFG1		0x19
+#define RK817_CODEC_DADC_VOLL		0x1a
+#define RK817_CODEC_DADC_VOLR		0x1b
+#define RK817_CODEC_DADC_SR_ACL0	0x1e
+#define RK817_CODEC_DADC_ALC1		0x1f
+#define RK817_CODEC_DADC_ALC2		0x20
+#define RK817_CODEC_DADC_NG		0x21
+#define RK817_CODEC_DADC_HPF		0x22
+#define RK817_CODEC_DADC_RVOLL		0x23
+#define RK817_CODEC_DADC_RVOLR		0x24
+#define RK817_CODEC_AMIC_CFG0		0x27
+#define RK817_CODEC_AMIC_CFG1		0x28
+#define RK817_CODEC_DMIC_PGA_GAIN	0x29
+#define RK817_CODEC_DMIC_LMT1		0x2a
+#define RK817_CODEC_DMIC_LMT2		0x2b
+#define RK817_CODEC_DMIC_NG1		0x2c
+#define RK817_CODEC_DMIC_NG2		0x2d
+#define RK817_CODEC_ADAC_CFG0		0x2e
+#define RK817_CODEC_ADAC_CFG1		0x2f
+#define RK817_CODEC_DDAC_POPD_DACST	0x30
+#define RK817_CODEC_DDAC_VOLL		0x31
+#define RK817_CODEC_DDAC_VOLR		0x32
+#define RK817_CODEC_DDAC_SR_LMT0	0x35
+#define RK817_CODEC_DDAC_LMT1		0x36
+#define RK817_CODEC_DDAC_LMT2		0x37
+#define RK817_CODEC_DDAC_MUTE_MIXCTL	0x38
+#define RK817_CODEC_DDAC_RVOLL		0x39
+#define RK817_CODEC_DDAC_RVOLR		0x3a
+#define RK817_CODEC_AHP_ANTI0		0x3b
+#define RK817_CODEC_AHP_ANTI1		0x3c
+#define RK817_CODEC_AHP_CFG0		0x3d
+#define RK817_CODEC_AHP_CFG1		0x3e
+#define RK817_CODEC_AHP_CP		0x3f
+#define RK817_CODEC_ACLASSD_CFG1	0x40
+#define RK817_CODEC_ACLASSD_CFG2	0x41
+#define RK817_CODEC_APLL_CFG0		0x42
+#define RK817_CODEC_APLL_CFG1		0x43
+#define RK817_CODEC_APLL_CFG2		0x44
+#define RK817_CODEC_APLL_CFG3		0x45
+#define RK817_CODEC_APLL_CFG4		0x46
+#define RK817_CODEC_APLL_CFG5		0x47
+#define RK817_CODEC_DI2S_CKM		0x48
+#define RK817_CODEC_DI2S_RSD		0x49
+#define RK817_CODEC_DI2S_RXCR1		0x4a
+#define RK817_CODEC_DI2S_RXCR2		0x4b
+#define RK817_CODEC_DI2S_RXCMD_TSD	0x4c
+#define RK817_CODEC_DI2S_TXCR1		0x4d
+#define RK817_CODEC_DI2S_TXCR2		0x4e
+#define RK817_CODEC_DI2S_TXCR3_TXCMD	0x4f
+
+/* RK817_CODEC_DI2S_CKM */
+#define RK817_I2S_MODE_MASK		(0x1 << 0)
+#define RK817_I2S_MODE_MST		(0x1 << 0)
+#define RK817_I2S_MODE_SLV		(0x0 << 0)
+
+/* RK817_CODEC_DDAC_MUTE_MIXCTL */
+#define DACMT_MASK			(0x1 << 0)
+#define DACMT_ENABLE			(0x1 << 0)
+#define DACMT_DISABLE			(0x0 << 0)
+
+/* RK817_CODEC_DI2S_RXCR2 */
+#define VDW_RX_24BITS			(0x17)
+#define VDW_RX_16BITS			(0x0f)
+
+/* RK817_CODEC_DI2S_TXCR2 */
+#define VDW_TX_24BITS			(0x17)
+#define VDW_TX_16BITS			(0x0f)
+
+/* RK817_CODEC_AMIC_CFG0 */
+#define MIC_DIFF_MASK			(0x1 << 7)
+#define MIC_DIFF_DIS			(0x0 << 7)
+#define MIC_DIFF_EN			(0x1 << 7)
+
 #define RK817_POWER_EN_REG(i)		(0xb1 + (i))
 #define RK817_POWER_SLP_EN_REG(i)	(0xb5 + (i))
 
-- 
2.25.1

