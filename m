Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C4550B907
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Apr 2022 15:48:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D6B0163A;
	Fri, 22 Apr 2022 15:47:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D6B0163A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650635286;
	bh=XdueS6o3x8Genbrjo7SphR5bJ8o+YLBkmS/22/Y/tzI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CQFyAocCclec654sVh5RluYEKLDoRlV7hlJxnz655fdd904yRL7rc2XLdDSxWyt+D
	 dOGJW/Ks9qy2tWB7/bkvGS3E9J2xrD2Xrqj04ZI+GCtOi0QBo/H42em5zHli7zNbTZ
	 KYItueT9LGFxfWB8RoVtRE6ccMIEGPetxOgqh4s0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 552E8F806F7;
	Fri, 22 Apr 2022 15:32:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5AA90F80116; Tue, 19 Apr 2022 18:44:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 05148F80116
 for <alsa-devel@alsa-project.org>; Tue, 19 Apr 2022 18:44:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05148F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="YXQtUJB7"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DC19861879;
 Tue, 19 Apr 2022 16:44:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6062FC385A5;
 Tue, 19 Apr 2022 16:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650386683;
 bh=XdueS6o3x8Genbrjo7SphR5bJ8o+YLBkmS/22/Y/tzI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YXQtUJB7B4bM52daStJxTBrA8/zErvRHpHn2okco8xXiPRjGGTcMxZ34F9ihe2zZF
 1BoMvocNKdvX/A7Mn4lmcao9QbvEfofhr0515a2QLJ4e/1ti5g/eDZCmDNi5sdZR/I
 9XNG+Otrayi6yRijGpRrnLzixoTgFiEZlFFL/2ise5K7ONOzh9kv641LscK+chNQJ7
 Q9EFuzcxnFtDUtDisGrueMKhbPDgR4AstoPr4QwJ7WiTnp9E3XeIFc84uL5FnW7uoT
 5DjaGzrz2kHiXzQHJSz/k+R25fFOoMSH+WeElYMHF7zCHXx8w3wvu8Yx03jMnZvboF
 gxYGbk6+OLuAg==
From: Arnd Bergmann <arnd@kernel.org>
To: robert.jarzmik@free.fr,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 45/48] ARM: PXA: fix multi-cpu build of xsc3
Date: Tue, 19 Apr 2022 18:38:07 +0200
Message-Id: <20220419163810.2118169-46-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220419163810.2118169-1-arnd@kernel.org>
References: <20220419163810.2118169-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 22 Apr 2022 15:31:42 +0200
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-usb@vger.kernel.org,
 Philipp Zabel <philipp.zabel@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Sergey Lapin <slapin@ossfans.org>,
 linux-fbdev@vger.kernel.org, Dominik Brodowski <linux@dominikbrodowski.net>,
 linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-mtd@lists.infradead.org, Tomas Cech <sleep_walker@suse.com>,
 linux-clk@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-rtc@vger.kernel.org, Helge Deller <deller@gmx.de>,
 Marek Vasut <marek.vasut@gmail.com>, Paul Parsons <lost.distance@yahoo.com>,
 Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-pm@vger.kernel.org, linux-input@vger.kernel.org,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Lubomir Rintel <lkundrak@v3.sk>,
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Stephen Boyd <sboyd@kernel.org>, patches@opensource.cirrus.com,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 linux-mips@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 alsa-devel@alsa-project.org, Daniel Mack <daniel@zonque.org>
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

From: Arnd Bergmann <arnd@arndb.de>

On a kernel that includes both ARMv4 and XScale support,
the copypage function fails to build with invalid
instructions.

Since these are only called on an actual XScale processor,
annotate the assembly with the correct .arch directive.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mm/copypage-xsc3.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/mm/copypage-xsc3.c b/arch/arm/mm/copypage-xsc3.c
index 6f0909dda2f9..c86e79677ff9 100644
--- a/arch/arm/mm/copypage-xsc3.c
+++ b/arch/arm/mm/copypage-xsc3.c
@@ -29,6 +29,7 @@ static void xsc3_mc_copy_user_page(void *kto, const void *kfrom)
 	int tmp;
 
 	asm volatile ("\
+.arch xscale					\n\
 	pld	[%1, #0]			\n\
 	pld	[%1, #32]			\n\
 1:	pld	[%1, #64]			\n\
@@ -80,6 +81,7 @@ void xsc3_mc_clear_user_highpage(struct page *page, unsigned long vaddr)
 {
 	void *ptr, *kaddr = kmap_atomic(page);
 	asm volatile ("\
+.arch xscale					\n\
 	mov	r1, %2				\n\
 	mov	r2, #0				\n\
 	mov	r3, #0				\n\
-- 
2.29.2

