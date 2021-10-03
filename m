Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E1D41FF60
	for <lists+alsa-devel@lfdr.de>; Sun,  3 Oct 2021 05:06:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F30791697;
	Sun,  3 Oct 2021 05:05:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F30791697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633230362;
	bh=FR+CLu0gl6DIXX8mgPY8RPSVgsj5A4EF3MsIkAEn1xU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=p+3sNTKz4dpRC0Ee69UvEnqdJuFtOR5h8Uv0huq8z+P6Hmu9vjdkzkXzVg2gwfU97
	 FeR6IBMppggoXK8bGgBjGxVA5vyGOjrK+fCVYqOAUa+zvNMvzfzmovEDT3VkD72Vxx
	 ZwAfbXfnmzS9DyCdObu5CKjlJw9gbyfNiY+DejkM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15B5DF800ED;
	Sun,  3 Oct 2021 05:04:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BA9F9F800ED; Sun,  3 Oct 2021 05:04:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 31AFCF800ED
 for <alsa-devel@alsa-project.org>; Sun,  3 Oct 2021 05:04:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31AFCF800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="wyjSaBqM"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=4YvURUzfuR+b0ciJbjJBoAaKlNBhJh9slT7j92oq2ws=; b=wyjSaBqMLdq3AWlScqXPahhc8+
 DJR3rBpOwDkvd5yGt614xQcqLNgeAtcYsuVU4dCWz1X38P/8USRS1P3OK/2lx8uvTUa3ONEjnNhFq
 J/7SefOAPKbf/hJDnz6hDVhCtQc6whfuyNiytwfFVgNym5NuXcsPmIz+7kLdM6FaKgMFhod2Trrnp
 zKSOfIFKf8/tz/pmeihDv1kYMfDzDtRWlK3375hzqkZeZPTLsGdBhs9TF4j180fR8w5iLafccdU6Y
 YkS4obrnIPlxlwD+/9O5yjbYqfc/dGdQUGKCmUHr/IrXlmlzsM8oLSF3XxMYfdu/4rj5RdKbd00ZM
 FML0DFbw==;
Received: from [2601:1c0:6280:3f0::aa0b] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mWrnC-0037SG-2t; Sun, 03 Oct 2021 03:03:58 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: atmel: add COMPILE_TEST for SND_ATMEL_SOC_PDC
Date: Sat,  2 Oct 2021 20:03:57 -0700
Message-Id: <20211003030357.32456-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Randy Dunlap <rdunlap@infradead.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
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

Geert pointed out that since sound/soc has the soc_dummy_driver for
NO_DMA platforms, it is possible (desirable) to have drivers that
depend on HAS_DMA to alternately depend on COMPILE_TEST.

This means that SND_ATMEL_SOC_PDC can depend on HAS_DMA || COMPIE_TEST.

Fixes: 6c5c659dfe3f ("ASoC: atmel: ATMEL drivers don't need HAS_DMA")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org
Cc: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
---
 sound/soc/atmel/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20211001.orig/sound/soc/atmel/Kconfig
+++ linux-next-20211001/sound/soc/atmel/Kconfig
@@ -11,6 +11,7 @@ if SND_ATMEL_SOC
 
 config SND_ATMEL_SOC_PDC
 	bool
+	depends on HAS_DMA || COMPILE_TEST
 
 config SND_ATMEL_SOC_DMA
 	bool
