Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 840946AC7A1
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Mar 2023 17:20:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF7AC114B;
	Mon,  6 Mar 2023 17:19:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF7AC114B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678119647;
	bh=w5fHUhGS4N/pqarT9s0/kpBsFFSIvy8SK7Fig28Nmps=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Znqopi5IcK6bbFXbozmabFa7+SUy2KnQ94RNoF6NjiZFfemBE/q2Hig5llQq9fYQN
	 +FM825llb97WIVtB1DyMM3xFIB4F3KPLCi8wJ8Sz+28DBKwdUNS3TtJJhUqBgxqcLY
	 ujVu9lv7tP2G/be6VGRKeybw5NKtZ3ksiKJ7ljfE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 385E9F80557;
	Mon,  6 Mar 2023 17:18:36 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 73516F80542; Mon,  6 Mar 2023 17:18:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0C7FBF804FE
	for <alsa-devel@alsa-project.org>; Mon,  6 Mar 2023 17:18:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C7FBF804FE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RbaE1W5z
Received: (Authenticated sender: herve.codina@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPA id CBEF7240015;
	Mon,  6 Mar 2023 16:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1678119498;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y2V/LfVO+mZGhkYaRuIafYLqj3phD1Eeb7MH4X9WAQY=;
	b=RbaE1W5z0A7sOdo/DL1hDNtNXuAAhIWxbbYVemVr4kNKt3HjIlc80E7XjEHzmvSNF/FK9A
	UvB24A4kDqjHW3/zDWnzb3WKv9S5ONNeA9JBUHd5pB3J7NFbgXJqyNKxPyT9lmrp4Ee3u2
	vgVRbAiV7Qa+l+34oMQi8sIpCeCcuxAO2qv3DK36Z6JeptglYRVwtkQCIPXYTFPSJZStlv
	3kh7hk0SjL8+6h6XmCdWCrYLg/gVvadd3jFE2c98W3MXgyu7u7Yn4TVP9uDOTYAg7TMVxu
	kcgLpfNKKalaIhGj8z1v1Ls8JW+ZLe+dRZ19zDZuSkZq6VseCYwyM6/50aMMrA==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Li Yang <leoyang.li@nxp.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>
Subject: [PATCH v7 04/10] powerpc/8xx: Use a larger CPM1 command check mask
Date: Mon,  6 Mar 2023 17:17:48 +0100
Message-Id: <20230306161754.89146-5-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230306161754.89146-1-herve.codina@bootlin.com>
References: <20230306161754.89146-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XB3DMZTSM4G3EOO7ROXLK4A3YUXXTUZV
X-Message-ID-Hash: XB3DMZTSM4G3EOO7ROXLK4A3YUXXTUZV
X-MailFrom: herve.codina@bootlin.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XB3DMZTSM4G3EOO7ROXLK4A3YUXXTUZV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The CPM1 command mask is defined for use with the standard
CPM1 command register as described in the user's manual:
  0  |1        3|4    7|8   11|12      14| 15|
  RST|    -     |OPCODE|CH_NUM|     -    |FLG|

In the QMC extension the CPM1 command register is redefined
(QMC supplement user's manuel) with the following mapping:
  0  |1        3|4    7|8           13|14| 15|
  RST|QMC OPCODE|  1110|CHANNEL_NUMBER| -|FLG|

Extend the check command mask in order to support both the
standard CH_NUM field and the QMC extension CHANNEL_NUMBER
field.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Acked-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Acked-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/platforms/8xx/cpm1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/8xx/cpm1.c b/arch/powerpc/platforms/8xx/cpm1.c
index 8ef1f4392086..6b828b9f90d9 100644
--- a/arch/powerpc/platforms/8xx/cpm1.c
+++ b/arch/powerpc/platforms/8xx/cpm1.c
@@ -100,7 +100,7 @@ int cpm_command(u32 command, u8 opcode)
 	int i, ret;
 	unsigned long flags;
 
-	if (command & 0xffffff0f)
+	if (command & 0xffffff03)
 		return -EINVAL;
 
 	spin_lock_irqsave(&cmd_lock, flags);
-- 
2.39.2

