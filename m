Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A276210CFC7
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Nov 2019 23:40:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2306216E3;
	Thu, 28 Nov 2019 23:39:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2306216E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574980812;
	bh=r1muO2F9exCo1sefZM3iBD1MuZz5R0bAQ7j2pzwtmYw=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OLjbk4uOpCo+RGuOCKoWFDFSMjZbUP7KDe9PJPLQUBGe0pkCcXQREyFce5kov/vX0
	 Bp5XYVTd3riOYZ9GHvECEZF/CA7v3+dlv/4jPJiXIAAgjxy5FYiNWQAnKBBGH8lvq3
	 7RRZBABqMSaneylEv9aRxEiv3KIiy2Ap9GjrU0gI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 902F2F80149;
	Thu, 28 Nov 2019 23:38:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 82525F80149; Thu, 28 Nov 2019 23:38:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ssl.serverraum.org (ssl.serverraum.org [176.9.125.105])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DF6AFF800CB
 for <alsa-devel@alsa-project.org>; Thu, 28 Nov 2019 23:38:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF6AFF800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=walle.cc header.i=@walle.cc
 header.b="NJL1lyR+"
Received: from apollo.fritz.box (unknown
 [IPv6:2a02:810c:c200:2e91:6257:18ff:fec4:ca34])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 0C8B222EDB;
 Thu, 28 Nov 2019 23:38:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1574980701;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Y4b1ub2wBoYW7RKVV+BH5we4lCb9ywzmaPsTxmMyDsk=;
 b=NJL1lyR+dokvXhronO4ODUDIpDTJnoHq9SNH4vy7IYHQChy3MqCdy/OvuzrlxeOkZ3Qg6y
 5cO7IEiUJmDgAMv7oLF5Rs5ylkckd0ssFX3HvDSA6O6Tl88Fcxq6LZY0CXobj6GT3+x+tN
 qIlcpI5FRiExHQnBT6Da8KJ4Tly/dzA=
From: Michael Walle <michael@walle.cc>
To: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Date: Thu, 28 Nov 2019 23:38:02 +0100
Message-Id: <20191128223802.18228-1-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Spamd-Bar: ++++++
X-Rspamd-Server: web
X-Rspamd-Queue-Id: 0C8B222EDB
X-Spamd-Result: default: False [6.40 / 15.00]; TO_DN_SOME(0.00)[];
 R_MISSING_CHARSET(2.50)[]; BROKEN_CONTENT_TYPE(1.50)[];
 RCVD_COUNT_ZERO(0.00)[0]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+];
 ASN(0.00)[asn:31334, ipnet:2a02:810c::/31, country:DE];
 ARC_NA(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; TAGGED_RCPT(0.00)[];
 MIME_GOOD(-0.10)[text/plain]; DKIM_SIGNED(0.00)[];
 RCPT_COUNT_TWELVE(0.00)[12]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM(-0.00)[-0.593];
 FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,walle.cc];
 SUSPICIOUS_RECIPS(1.50)[]
X-Spam: Yes
Cc: Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Michael Walle <michael@walle.cc>,
 Mark Brown <broonie@kernel.org>, Fabio Estevam <festevam@gmail.com>
Subject: [alsa-devel] [PATCH] ASoC: fsl_sai: add IRQF_SHARED
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

The LS1028A SoC uses the same interrupt line for adjacent SAIs. Use
IRQF_SHARED to be able to use these SAIs simultaneously.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 sound/soc/fsl/fsl_sai.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index b517e4bc1b87..8c3ea7300972 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -958,7 +958,8 @@ static int fsl_sai_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
-	ret = devm_request_irq(&pdev->dev, irq, fsl_sai_isr, 0, np->name, sai);
+	ret = devm_request_irq(&pdev->dev, irq, fsl_sai_isr, IRQF_SHARED,
+			       np->name, sai);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to claim irq %u\n", irq);
 		return ret;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
