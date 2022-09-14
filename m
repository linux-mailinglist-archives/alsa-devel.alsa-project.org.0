Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B62AD5B8969
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Sep 2022 15:47:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04FF71DB;
	Wed, 14 Sep 2022 15:46:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04FF71DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663163235;
	bh=7YH/b/GNdPm6/3C/nq6yhlK34hP2qfMGz0BxLSDr9WM=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CM6UM0ah9OuGYTpGEX2GlvhM3XZxypw8hI0jM0q/gSUAjXaDlJ/61NrdQ4uq8tjwH
	 IY9DZ9Ne3YI3KePdG6fDFxrlP5IS220FQp6svqzJO95YMmyOgkecmi1H6C180PW0FZ
	 CT5ZU8R/QxIh3lfUUpPC1LIxRqh5jG1yJSMVE73o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5FAFFF8008E;
	Wed, 14 Sep 2022 15:46:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9BB1F800C0; Wed, 14 Sep 2022 15:46:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from proxy25214.mail.163.com (proxy25214.mail.163.com
 [103.129.252.14])
 by alsa1.perex.cz (Postfix) with ESMTP id B83C4F800C0
 for <alsa-devel@alsa-project.org>; Wed, 14 Sep 2022 15:46:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B83C4F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=126.com header.i=@126.com
 header.b="iLY8Cc5O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=blbt9
 kPpdsO+OFxSlN2UvOUGPYhPzfe468VXHcEBEIw=; b=iLY8Cc5O4sprwzUiIsu1C
 vltchQ6BjhfYpAIpUhuKCEBClf28E8JjrdtF48u3cbW57nGbnhXpxwczdvnb6YHO
 CyfodPPSsorbUoldynSYLOhE/KaWF2F3X7a6pIQ8gZJZABkd8is09a6ff5dwuaOQ
 IFEh61AFd3Gl3szkFT1ZCU=
Received: from localhost.localdomain (unknown [124.16.139.61])
 by smtp3 (Coremail) with SMTP id DcmowAB3frKa2iFjLRktBg--.23567S2;
 Wed, 14 Sep 2022 21:43:55 +0800 (CST)
From: Liang He <windhl@126.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, wangkelin2023@163.com, windhl@126.com
Subject: [PATCH] ASoC: eureka-tlv320: Hold reference returned from of_find_xxx
 API
Date: Wed, 14 Sep 2022 21:43:54 +0800
Message-Id: <20220914134354.3995587-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DcmowAB3frKa2iFjLRktBg--.23567S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Kr13uFyxGw15Cw1kuw4rXwb_yoW8tr47pF
 WUCrW5KrWkGFn8WrWIva4kJFW7K3yfKay5JryxKayUt3ZIqryrJ3Z2qr1ayFW3XFZ3Cry5
 JasrK3yrJa18ZrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0ziOzVUUUUUU=
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbi3Bx8F1pEEQVu4QAAsu
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

In eukrea_tlv320_probe(), we need to hold the reference returned
from of_find_compatible_node() which has increased the refcount
and then call of_node_put() with it when done.

Fixes: 66f232908de2 ("ASoC: eukrea-tlv320: Add DT support.")
Co-authored-by: Kelin Wang <wangkelin2023@163.com>
Signed-off-by: Liang He <windhl@126.com>
---
 sound/soc/fsl/eukrea-tlv320.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/soc/fsl/eukrea-tlv320.c b/sound/soc/fsl/eukrea-tlv320.c
index 8b61582753c8..9af4c4a35eb1 100644
--- a/sound/soc/fsl/eukrea-tlv320.c
+++ b/sound/soc/fsl/eukrea-tlv320.c
@@ -86,7 +86,7 @@ static int eukrea_tlv320_probe(struct platform_device *pdev)
 	int ret;
 	int int_port = 0, ext_port;
 	struct device_node *np = pdev->dev.of_node;
-	struct device_node *ssi_np = NULL, *codec_np = NULL;
+	struct device_node *ssi_np = NULL, *codec_np = NULL, *tmp_np = NULL;
 
 	eukrea_tlv320.dev = &pdev->dev;
 	if (np) {
@@ -143,7 +143,7 @@ static int eukrea_tlv320_probe(struct platform_device *pdev)
 	}
 
 	if (machine_is_eukrea_cpuimx27() ||
-	    of_find_compatible_node(NULL, NULL, "fsl,imx21-audmux")) {
+	    (tmp_np = of_find_compatible_node(NULL, NULL, "fsl,imx21-audmux"))) {
 		imx_audmux_v1_configure_port(MX27_AUDMUX_HPCR1_SSI0,
 			IMX_AUDMUX_V1_PCR_SYN |
 			IMX_AUDMUX_V1_PCR_TFSDIR |
@@ -158,10 +158,11 @@ static int eukrea_tlv320_probe(struct platform_device *pdev)
 			IMX_AUDMUX_V1_PCR_SYN |
 			IMX_AUDMUX_V1_PCR_RXDSEL(MX27_AUDMUX_HPCR1_SSI0)
 		);
+		of_node_put(tmp_np);
 	} else if (machine_is_eukrea_cpuimx25sd() ||
 		   machine_is_eukrea_cpuimx35sd() ||
 		   machine_is_eukrea_cpuimx51sd() ||
-		   of_find_compatible_node(NULL, NULL, "fsl,imx31-audmux")) {
+		   (tmp_np = of_find_compatible_node(NULL, NULL, "fsl,imx31-audmux"))) {
 		if (!np)
 			ext_port = machine_is_eukrea_cpuimx25sd() ?
 				4 : 3;
@@ -178,6 +179,7 @@ static int eukrea_tlv320_probe(struct platform_device *pdev)
 			IMX_AUDMUX_V2_PTCR_SYN,
 			IMX_AUDMUX_V2_PDCR_RXDSEL(int_port)
 		);
+		of_node_put(tmp_np);
 	} else {
 		if (np) {
 			/* The eukrea,asoc-tlv320 driver was explicitly
-- 
2.25.1

