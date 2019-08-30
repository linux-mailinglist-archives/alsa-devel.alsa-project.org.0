Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 56EADA3F76
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Aug 2019 23:09:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D8CA1166A;
	Fri, 30 Aug 2019 23:08:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D8CA1166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567199339;
	bh=5myXkZ5W6aQrB06gZmyickMGDhEIyb+hnEr4HML32qI=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R11hhT0dK5x3dtZ+WopmHK499NOgl5osWWpVxHHgsxo9Lno6FXxIpbBKRcvoeX7Eu
	 62uD2KOmtbXDT/ndXilvK5ECJtDSf24ElQs9bQ1nr6L3MyxZ9+JDUN6rIYB3WuM+7F
	 gY/iLDRw3TPgfCbIHwioB37PBQ1I8+SHzThdBJqo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E402CF805F6;
	Fri, 30 Aug 2019 23:06:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9289EF80444; Fri, 30 Aug 2019 23:06:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=PRX_BODY_13,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6DF06F8036C
 for <alsa-devel@alsa-project.org>; Fri, 30 Aug 2019 23:06:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6DF06F8036C
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 6B0BF100005;
 Fri, 30 Aug 2019 21:06:17 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Date: Fri, 30 Aug 2019 23:06:07 +0200
Message-Id: <20190830210607.22644-3-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190830210607.22644-1-miquel.raynal@bootlin.com>
References: <20190830210607.22644-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Michal Simek <michal.simek@xilinx.com>,
 Rob Herring <robh+dt@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, alexandre@bootlin.com,
 linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH 3/3] MAINTAINERS: Add an entry for the Xilinx
	logicPD-I2S block
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

Reference the driver and and the bindings.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5bf8f340e6a8..382c33a1adef 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17136,6 +17136,12 @@ L:	linux-serial@vger.kernel.org
 S:	Maintained
 F:	drivers/tty/serial/uartlite.c
 
+XILINX LOGICPD I2S SOUND DRIVER
+M:	Miquel Raynal <miquel.raynal@bootlin.com>
+S:	Maintained
+F:	sound/soc/xilinx/xlnx-logicpd-i2s.c
+F:	Documentation/devicetree/bindings/sound/xlnx,logicpd-i2s.yaml
+
 XILINX VIDEO IP CORES
 M:	Hyun Kwon <hyun.kwon@xilinx.com>
 M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
