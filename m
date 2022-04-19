Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C558506EE6
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Apr 2022 15:48:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9CB8E1AAD;
	Tue, 19 Apr 2022 15:47:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9CB8E1AAD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650376106;
	bh=e/6LwBQRyYsqoQ1/3hfke8Tr/1qpFFXXNWHXWvPRr1U=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=COavPqDqRQmqrG5hcAAon0V47RhLZsG1Ahpecqj8dX1+dvfgeZLKyqPNlCcc6cSFt
	 xfBRtnAeLib5GtuMm16f4bRq0tyNbkAsoDC9P+jfTcKEyc1RuZ8ljTkF1N3/io/eS9
	 LhJe5GaFRbtgyzSnuA5QGQs06zglLLiPD8hmq0IE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2DCC8F80578;
	Tue, 19 Apr 2022 15:43:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF7C1F8025D; Tue, 19 Apr 2022 15:40:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B04BFF80116
 for <alsa-devel@alsa-project.org>; Tue, 19 Apr 2022 15:39:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B04BFF80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="iV3cqgxs"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9B6FA616C1;
 Tue, 19 Apr 2022 13:39:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB547C385A5;
 Tue, 19 Apr 2022 13:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650375563;
 bh=e/6LwBQRyYsqoQ1/3hfke8Tr/1qpFFXXNWHXWvPRr1U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iV3cqgxsdj2upxQIoK91L/txRXqfjq76PvDRmkXJrWp/FZGP3UwajNZc3LzYUXwep
 Wpjx5B2mgf8pPs8V3T9NF38UepMlWko7fW3ElDUkn1L39NbypTyjb4e3cTF2YtXtQM
 rZZBrb0moVxeTXaoNCmPZjxeZFc2BxdRbHQTb85h/EtHpKNmkXtvFfU3G1YcCDbWMG
 CVWPbZyeLymL8KTq6UQjFFxy8H40arcYLX9BtcjX8Nx5GCgnb/7f2+XzLLpVS0D1gI
 fGuz9dkWZKrYHjDKwJ8ucl3hOEywWE023+f3G2C7nEhMm4yp70/BMqYBIQ5am0gbGx
 IBMrD0Q8dumig==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-omap@vger.kernel.org, tony@atomide.com, aaro.koskinen@iki.fi,
 jmkrzyszt@gmail.com
Subject: [PATCH 14/41] serial: 8250/omap1: include linux/soc/ti/omap1-soc.h
Date: Tue, 19 Apr 2022 15:36:56 +0200
Message-Id: <20220419133723.1394715-15-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220419133723.1394715-1-arnd@kernel.org>
References: <20220419133723.1394715-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 19 Apr 2022 15:43:16 +0200
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-fbdev@vger.kernel.org,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Lee Jones <lee.jones@linaro.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Kevin Hilman <khilman@kernel.org>, Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Helge Deller <deller@gmx.de>, Russell King <linux@armlinux.org.uk>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alan Stern <stern@rowland.harvard.edu>,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 Felipe Balbi <balbi@kernel.org>, Paul Walmsley <paul@pwsan.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org,
 alsa-devel@alsa-project.org
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

As a preparation for cleaning up the omap1 headers, start
including linux/soc/ti/omap1-soc.h directly so we can
keep calling cpu_is_omap1510().

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/tty/serial/8250/8250.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/tty/serial/8250/8250.h b/drivers/tty/serial/8250/8250.h
index db784ace25d8..a8830e15a22c 100644
--- a/drivers/tty/serial/8250/8250.h
+++ b/drivers/tty/serial/8250/8250.h
@@ -259,6 +259,7 @@ static inline int fintek_8250_probe(struct uart_8250_port *uart) { return 0; }
 #endif
 
 #ifdef CONFIG_ARCH_OMAP1
+#include <linux/soc/ti/omap1-soc.h>
 static inline int is_omap1_8250(struct uart_8250_port *pt)
 {
 	int res;
-- 
2.29.2

