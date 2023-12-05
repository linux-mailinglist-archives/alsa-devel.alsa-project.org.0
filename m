Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 301D080588C
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Dec 2023 16:25:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CEBCCE0F;
	Tue,  5 Dec 2023 16:24:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CEBCCE0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701789908;
	bh=xvHOF/YEB3nJV2QutFxkDIzcxAMoNRWrPEwSp+iy8Nk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JNX/r+ciQ9A7iWS9PctVi31iLenB2lEbVK3qPc/6d5ByOyTSlgKK5bMfiouvH3TED
	 CTMLMLUXVdF4+aSFRtNZQSFkadk2Psj+Rx6JdyFgXXVHMXAPmBqSrREh+yNSst8xRX
	 0t0Ls7kypSEl+lZzy/fctsBkZlmPukTDiQECx0mY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 595C2F80750; Tue,  5 Dec 2023 16:22:18 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 50815F80568;
	Tue,  5 Dec 2023 16:22:18 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EA59FF806E0; Tue,  5 Dec 2023 16:22:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C7760F80166
	for <alsa-devel@alsa-project.org>; Tue,  5 Dec 2023 16:21:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7760F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bPHz/aVw
Received: by mail.gandi.net (Postfix) with ESMTPA id 3195C40013;
	Tue,  5 Dec 2023 15:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701789691;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fr/+FFqEM69Z2xWv6TIr9xG1wPePBXpVB6jujvPjf7w=;
	b=bPHz/aVwC/l9kXBOINLG0e+ZPXA9XHiKjq0rnAjQ2+3dlqMaRErm0OukHPYatzh1mF5cuT
	xUOWmmJvUJcMfn0vtmLYO7kmuYgxcR9gL5qj3GfUHzOZdBfBA9n5zsgQzY2OHZ+9PaXB5l
	3NHkcCug1z3oVRxFjDCsWNUHEDRomYRB2+/ExIpGqEyIiNOfxwzJimFlw2p52LZ3517Zoy
	lgV6itCytQqdL+PVPuZat9ohMt+yiEqmAOxnYfAJXzLbd2XiWwWFFUoEE0jKg13qzMUQXp
	JLqNpqH1Ni6iD9zqObm+BzheDazJbmyHYobb7VddhIXrGjEu7bpDfVNDhw0Gew==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Li Yang <leoyang.li@nxp.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH v2 05/17] soc: fsl: cpm1: qmc: Remove inline function
 specifiers
Date: Tue,  5 Dec 2023 16:21:02 +0100
Message-ID: <20231205152116.122512-6-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231205152116.122512-1-herve.codina@bootlin.com>
References: <20231205152116.122512-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
Message-ID-Hash: OGWE56R4JSFPLF4WZJKF5W4E7VK7O6RF
X-Message-ID-Hash: OGWE56R4JSFPLF4WZJKF5W4E7VK7O6RF
X-MailFrom: herve.codina@bootlin.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OGWE56R4JSFPLF4WZJKF5W4E7VK7O6RF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The inline function specifier is present on some functions but it is
better to let the compiler decide inlining or not these functions.

Remove inline specifiers.

Fixes: 3178d58e0b97 ("soc: fsl: cpm1: Add support for QMC")
Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Suggested-by: Andrew Lunn <andrew@lunn.ch>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 drivers/soc/fsl/qe/qmc.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
index 4b4832d93c9b..27f2f16deac9 100644
--- a/drivers/soc/fsl/qe/qmc.c
+++ b/drivers/soc/fsl/qe/qmc.c
@@ -218,37 +218,37 @@ struct qmc {
 	struct qmc_chan *chans[64];
 };
 
-static inline void qmc_write16(void __iomem *addr, u16 val)
+static void qmc_write16(void __iomem *addr, u16 val)
 {
 	iowrite16be(val, addr);
 }
 
-static inline u16 qmc_read16(void __iomem *addr)
+static u16 qmc_read16(void __iomem *addr)
 {
 	return ioread16be(addr);
 }
 
-static inline void qmc_setbits16(void __iomem *addr, u16 set)
+static void qmc_setbits16(void __iomem *addr, u16 set)
 {
 	qmc_write16(addr, qmc_read16(addr) | set);
 }
 
-static inline void qmc_clrbits16(void __iomem *addr, u16 clr)
+static void qmc_clrbits16(void __iomem *addr, u16 clr)
 {
 	qmc_write16(addr, qmc_read16(addr) & ~clr);
 }
 
-static inline void qmc_write32(void __iomem *addr, u32 val)
+static void qmc_write32(void __iomem *addr, u32 val)
 {
 	iowrite32be(val, addr);
 }
 
-static inline u32 qmc_read32(void __iomem *addr)
+static u32 qmc_read32(void __iomem *addr)
 {
 	return ioread32be(addr);
 }
 
-static inline void qmc_setbits32(void __iomem *addr, u32 set)
+static void qmc_setbits32(void __iomem *addr, u32 set)
 {
 	qmc_write32(addr, qmc_read32(addr) | set);
 }
-- 
2.43.0

