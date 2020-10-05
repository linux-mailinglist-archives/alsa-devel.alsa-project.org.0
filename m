Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94CC22834CC
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Oct 2020 13:18:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D78C17A1;
	Mon,  5 Oct 2020 13:17:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D78C17A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601896716;
	bh=MJIEiMvn4G2SlrdVpyKZWkl6EIBAWtgTS7gZB16ilTE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YfJmiJaNHaDVl/+4RYDZm+11Z+drXBL/msxZeNAWlQ1RGtbSjQZhOYf8qn2YfTdUH
	 atWRx8vz6d9MiCB/ITTuvhcTEx50UJC0nAyioz7JlliBiLSBmdpne2NO4A+6dfx/xq
	 Hbp0cT+AL0MWXhbjn+GN3MahB1TDlquf0uzYOaZ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B6A1F800C9;
	Mon,  5 Oct 2020 13:16:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 434C0F80260; Mon,  5 Oct 2020 13:16:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out-2.mail.amis.net (out-2.mail.amis.net [212.18.32.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2337AF800C9
 for <alsa-devel@alsa-project.org>; Mon,  5 Oct 2020 13:16:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2337AF800C9
Received: from in-2.mail.amis.net (in-2.mail.amis.net [212.18.32.19])
 by out-2.mail.amis.net (Postfix) with ESMTP id 7781681360;
 Mon,  5 Oct 2020 13:16:46 +0200 (CEST)
Received: from in-2.mail.amis.net (localhost [127.0.0.1])
 by in-2.mail.amis.net (Postfix) with ESMTP id 71531C9406;
 Mon,  5 Oct 2020 13:16:46 +0200 (CEST)
X-Virus-Scanned: amavisd-new at amis.net
Received: from in-2.mail.amis.net ([127.0.0.1])
 by in-2.mail.amis.net (in-2.mail.amis.net [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id js9Bz3HJPxjd; Mon,  5 Oct 2020 13:16:46 +0200 (CEST)
Received: from smtp1.amis.net (smtp1.amis.net [212.18.32.41])
 by in-2.mail.amis.net (Postfix) with ESMTP id 1E8FEC9402;
 Mon,  5 Oct 2020 13:16:46 +0200 (CEST)
Received: from localhost.localdomain (89-212-21-243.static.t-2.net
 [89.212.21.243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp1.amis.net (Postfix) with ESMTPSA id 8D2F8C2DD2;
 Mon,  5 Oct 2020 13:16:45 +0200 (CEST)
From: Primoz Fiser <primoz.fiser@norik.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/2] ASoC: dt-bindings: fsl: add ac97 fixed mode support
Date: Mon,  5 Oct 2020 13:16:44 +0200
Message-Id: <20201005111644.3131604-2-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201005111644.3131604-1-primoz.fiser@norik.com>
References: <20201005111644.3131604-1-primoz.fiser@norik.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, Shengjiu Wang <shengjiu.wang@gmail.com>
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

Add devicetree bindings documentation for operating SSI in AC'97
variable/fixed mode of operation.

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
 Documentation/devicetree/bindings/sound/fsl,ssi.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/fsl,ssi.txt b/Documentation/devicetree/bindings/sound/fsl,ssi.txt
index 7e15a85cecd2..abc5abe11fb9 100644
--- a/Documentation/devicetree/bindings/sound/fsl,ssi.txt
+++ b/Documentation/devicetree/bindings/sound/fsl,ssi.txt
@@ -43,6 +43,11 @@ Optional properties:
 - fsl,mode:         The operating mode for the AC97 interface only.
                     "ac97-slave" - AC97 mode, SSI is clock slave
                     "ac97-master" - AC97 mode, SSI is clock master
+- fsl,ac97-mode:    SSI AC97 mode of operation.
+                    "variable" - AC97 Variable Mode, SLOTREQ bits determine
+                    next receive/transmit frame
+                    "fixed" - AC97 Fixed Mode, SSI transmits in accordance with
+                    AC97 Frame Rate Divider bits
 - fsl,ssi-asynchronous:
                     If specified, the SSI is to be programmed in asynchronous
                     mode.  In this mode, pins SRCK, STCK, SRFS, and STFS must
-- 
2.25.1

