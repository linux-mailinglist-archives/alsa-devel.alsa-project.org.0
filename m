Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14528569410
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Jul 2022 23:15:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ACE7F1695;
	Wed,  6 Jul 2022 23:14:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ACE7F1695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657142149;
	bh=Uf86Hkv/T3OrNfclvSASAA8YWegz3QLs3xXsW2ZJhds=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AgIF3dCJBBXLXNxI935Yc8AxCe+YiQNpbqyP//0mflLAreJhjPHly9glPN6/jds5Z
	 FPLgQlCA2Fo/qaTMOYeSTpp9sgqg/FK/kbOWFulIWuQNV/3R2iXGi8kgXcNk2eHJXv
	 Xqlls85yuSYZeHEpc2CiYc/uBJCdBPmtqso+yr+Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 632C5F80564;
	Wed,  6 Jul 2022 23:13:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 652B1F8055A; Wed,  6 Jul 2022 23:12:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 50896F8054A
 for <alsa-devel@alsa-project.org>; Wed,  6 Jul 2022 23:12:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50896F8054A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="jlTOXZ1w"
Received: by mail-ed1-x530.google.com with SMTP id g1so13167317edb.12
 for <alsa-devel@alsa-project.org>; Wed, 06 Jul 2022 14:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rMEBorNhVh7ufMst5Qk6uYNQl+nmEbNFWhKX6b10HnM=;
 b=jlTOXZ1wwHsirtfZGe/1GnuPbG2A8hDgcztcSgQslipPOpKTmWeHD074+ttc/thnxA
 KWQN95ivS/FHDQnxz5p/Bwpu4sOD4G342QW3RDsN/fcrWLyn9JWRsDH0qCdm7kPGREpu
 twP5krmt5onISnYkRBDZOAXw6AyORs5+QgCsVevuiJ6fIMjydQTfr8eXpTl1thNqRUfj
 J5O3eLOTyYzB2RfCAR/ajdA0I/3S1mqvMYEDWk2FUw2FlXK2bhmGeDjaT5bIqJobXD62
 NHgTV4Gy6tsOxqKmdsYcA2aWC27VnY6RJYdXEeXEKemh7M1i+rHdcp7ywdJSjTBZsvqM
 eigQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rMEBorNhVh7ufMst5Qk6uYNQl+nmEbNFWhKX6b10HnM=;
 b=JBHk6eziF4qmNdDE7BCLV0rg0kdRNcCQNqW98jk3sj0ghBP93xmu/19pv0DnOGAEoW
 3jFiW+79O8tYvOA2jESqiO19PhFfF65PKWFcYSBcK1sbpmNc0TBA44F8e+hsIgnMrSOm
 oqrIl9t484p5C9dVz6zgMU/4GC1JkiXKqqVAoi7YFxgogNcm3k7M2bA/q4K+dUIcwlsC
 vVGYWZgabuu1qkPo6X0yF2G3Zo4rmnhnFuY5vo21oDg1dI811fbGVeX+SqhaJ8aAHIBH
 lxLn9AcpAZ3E+ud24412SM/E5Qywt7hbKvXachNAqpX13t296MW1PhAXiyAZ5xQgEMPA
 vMWg==
X-Gm-Message-State: AJIora/D9i40faFzOyuDkqvK5fihC9kBuiSCNUzryYmAge5Vsz2hwk7u
 mI7lUcPXgFDl6BQzH2XnaMI=
X-Google-Smtp-Source: AGRyM1tET1A7JwSiL++MIHi1kHvIRcUofme2fPTEumpKBcRzjv3d3RnOJ+Ft7soDIOhRwsqP9tA4eA==
X-Received: by 2002:aa7:d8d6:0:b0:43a:2a05:d601 with SMTP id
 k22-20020aa7d8d6000000b0043a2a05d601mr27594107eds.96.1657141971986; 
 Wed, 06 Jul 2022 14:12:51 -0700 (PDT)
Received: from localhost (92.40.202.8.threembb.co.uk. [92.40.202.8])
 by smtp.gmail.com with ESMTPSA id
 u5-20020a170906068500b00703671ebe65sm17742818ejb.198.2022.07.06.14.12.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 14:12:51 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: paul@crapouillou.net, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com
Subject: [PATCH 09/11] ASoC: jz4740-i2s: Make the PLL clock name SoC-specific
Date: Wed,  6 Jul 2022 22:13:28 +0100
Message-Id: <20220706211330.120198-10-aidanmacdonald.0x0@gmail.com>
In-Reply-To: <20220706211330.120198-1-aidanmacdonald.0x0@gmail.com>
References: <20220706211330.120198-1-aidanmacdonald.0x0@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org
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

On some Ingenic SoCs, such as the X1000, there is a programmable
divider used to generate the I2S system clock from a PLL, rather
than a fixed PLL/2 clock. It doesn't make much sense to call the
clock "pll half" on those SoCs, so the clock name should really be
a SoC-dependent value.

Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 sound/soc/jz4740/jz4740-i2s.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/soc/jz4740/jz4740-i2s.c b/sound/soc/jz4740/jz4740-i2s.c
index 3a21ee9d34d1..80b355d715ce 100644
--- a/sound/soc/jz4740/jz4740-i2s.c
+++ b/sound/soc/jz4740/jz4740-i2s.c
@@ -71,6 +71,8 @@ struct i2s_soc_info {
 	struct reg_field field_tx_fifo_thresh;
 	struct reg_field field_i2sdiv_capture;
 	struct reg_field field_i2sdiv_playback;
+
+	const char *pll_clk_name;
 };
 
 struct jz4740_i2s {
@@ -265,7 +267,7 @@ static int jz4740_i2s_set_sysclk(struct snd_soc_dai *dai, int clk_id,
 		clk_set_parent(i2s->clk_i2s, parent);
 		break;
 	case JZ4740_I2S_CLKSRC_PLL:
-		parent = clk_get(NULL, "pll half");
+		parent = clk_get(NULL, i2s->soc_info->pll_clk_name);
 		if (IS_ERR(parent))
 			return PTR_ERR(parent);
 		clk_set_parent(i2s->clk_i2s, parent);
@@ -387,6 +389,7 @@ static const struct i2s_soc_info jz4740_i2s_soc_info = {
 	.field_tx_fifo_thresh	= REG_FIELD(JZ_REG_AIC_CONF, 8, 11),
 	.field_i2sdiv_capture	= REG_FIELD(JZ_REG_AIC_CLK_DIV, 0, 3),
 	.field_i2sdiv_playback	= REG_FIELD(JZ_REG_AIC_CLK_DIV, 0, 3),
+	.pll_clk_name		= "pll half",
 };
 
 static const struct i2s_soc_info jz4760_i2s_soc_info = {
@@ -395,6 +398,7 @@ static const struct i2s_soc_info jz4760_i2s_soc_info = {
 	.field_tx_fifo_thresh	= REG_FIELD(JZ_REG_AIC_CONF, 16, 20),
 	.field_i2sdiv_capture	= REG_FIELD(JZ_REG_AIC_CLK_DIV, 0, 3),
 	.field_i2sdiv_playback	= REG_FIELD(JZ_REG_AIC_CLK_DIV, 0, 3),
+	.pll_clk_name		= "pll half",
 };
 
 static struct snd_soc_dai_driver jz4770_i2s_dai = {
@@ -421,6 +425,7 @@ static const struct i2s_soc_info jz4770_i2s_soc_info = {
 	.field_tx_fifo_thresh	= REG_FIELD(JZ_REG_AIC_CONF, 16, 20),
 	.field_i2sdiv_capture	= REG_FIELD(JZ_REG_AIC_CLK_DIV, 8, 11),
 	.field_i2sdiv_playback	= REG_FIELD(JZ_REG_AIC_CLK_DIV, 0, 3),
+	.pll_clk_name		= "pll half",
 };
 
 static const struct i2s_soc_info jz4780_i2s_soc_info = {
@@ -429,6 +434,7 @@ static const struct i2s_soc_info jz4780_i2s_soc_info = {
 	.field_tx_fifo_thresh	= REG_FIELD(JZ_REG_AIC_CONF, 16, 20),
 	.field_i2sdiv_capture	= REG_FIELD(JZ_REG_AIC_CLK_DIV, 8, 11),
 	.field_i2sdiv_playback	= REG_FIELD(JZ_REG_AIC_CLK_DIV, 0, 3),
+	.pll_clk_name		= "pll half",
 };
 
 static const struct snd_soc_component_driver jz4740_i2s_component = {
-- 
2.35.1

