Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4251CE774
	for <lists+alsa-devel@lfdr.de>; Mon, 11 May 2020 23:30:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 143CA15E2;
	Mon, 11 May 2020 23:29:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 143CA15E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589232622;
	bh=b3ujKm9+D/rI7lfxtr9wb8KjsLPqhWrylzvOWitIpJ0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HQu0TFptkCYP/QUQeDiRhMLRXC/6P5kli4/U42/2XpxezjYA5MDC6GdrJhJPpE4NO
	 l/EuveU1GIxBGVnxxTJsUUmSQaJKxPvWSqQJHhRZqzvApNvRkJf7PxbFtKOyjc4IxU
	 nE2l+eAbbA6x7e/z4opq/YiovfwSm3vVvh4cgYPQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 65D72F8033D;
	Mon, 11 May 2020 23:21:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 00EBDF8028F; Mon, 11 May 2020 23:20:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com
 [IPv6:2607:f8b0:4864:20::f42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7F9A1F8029A
 for <alsa-devel@alsa-project.org>; Mon, 11 May 2020 23:20:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F9A1F8029A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Lgs7M+dm"
Received: by mail-qv1-xf42.google.com with SMTP id l3so43564qvo.7
 for <alsa-devel@alsa-project.org>; Mon, 11 May 2020 14:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ib/XU70iTJnlGJGRgNHyvJT1k1yPXtyfUAC4ejElPJU=;
 b=Lgs7M+dmUL9ZpJwUS23yZZoEgUNQIbb38QJKJ3trMRck2mgVr2m5oU9SQSm4O516GR
 R2SHT+OoOQZUzxAWIx7NxkXQd4xmr9fs/U/y1FlEw+VOiAU20Y/tGxZzl4+3/u8sTSJk
 38kDdPeeWxCk5pwFOs66znAoIKDxMwKfc+vhMqKY5QLOAh0Gd1fBl+Vl33skssoIqCSK
 G8LKo2j3y3E9NtOLJ0h6WdPVkfcA+psvgA8b7bLVjY/vPQghlYVVMrjQHhgORJVXkEr2
 OlyswiI2+R3bk/JGJb//9i7izYQpmiwI7VmyX6xnkSll0P+q87PEymndCtIZBrxq3qdw
 912w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ib/XU70iTJnlGJGRgNHyvJT1k1yPXtyfUAC4ejElPJU=;
 b=OQeO2zdSaVZtWoLBL/Bb279qz9L0qTbK6q+Qf/n0+FaUiu83nG8HHxBl1xWf1Bna0J
 FOG5BZ6W3c3wD1qZhSP+Cw9ar/9lXyQpFgLs/p0c7Rvzzbjugwizhayk5MUFJv9UfMcu
 REmwT0gLbFeUDsD/0CHDidVM8Bfenwxa1LAOqut71DHbUNYb7z7mxEbnKBUvpGtCFFAr
 jS+EGeYDzpGJPhM3IZbeDpWqUqwHcDWQP2hW6DrwrBYUIH+4E3K7Lwgsk9ZHul1cy2tX
 vhJygjswnFhMtwqyTaw3fi0ukRQJW47nn+e0jXhZdEjzESeE0Pn/ttlVc5UJub5z5bwi
 Tnpg==
X-Gm-Message-State: AGi0Pua4uB+VyW00VadsE6SAxwwotEqTO4zXR8F2uq9nUlzieCfFJJOv
 G7zy3w0i13JDkjI7W7gE/2cRBD3m
X-Google-Smtp-Source: APiQypLOLAEaIJWEhv1lEPAXPg30noUAlGzoZvebsOdn/iYLH6gKRpNYP52AF+gaYGJg+WUAjzdlMQ==
X-Received: by 2002:a0c:b3dc:: with SMTP id b28mr18100781qvf.217.1589232037984; 
 Mon, 11 May 2020 14:20:37 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id c26sm9148691qkm.98.2020.05.11.14.20.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 14:20:37 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: alsa-devel@alsa-project.org, broonie@kernel.org, vijendar.mukunda@amd.com,
 tiwai@suse.de
Subject: [PATCH v2 12/14] ASoC: amd: create platform devices for Renoir
Date: Mon, 11 May 2020 17:20:12 -0400
Message-Id: <20200511212014.2359225-13-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200511212014.2359225-1-alexander.deucher@amd.com>
References: <20200511212014.2359225-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>
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

From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>

Create platform devices for generic dmic codec driver and
machine driver.
These platform devices required for creation of sound card.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 sound/soc/amd/renoir/rn-pci-acp3x.c | 51 ++++++++++++++++++-----------
 sound/soc/amd/renoir/rn_acp3x.h     |  1 +
 2 files changed, 32 insertions(+), 20 deletions(-)

diff --git a/sound/soc/amd/renoir/rn-pci-acp3x.c b/sound/soc/amd/renoir/rn-pci-acp3x.c
index 14651df9b5c8..8ae0d75103ff 100644
--- a/sound/soc/amd/renoir/rn-pci-acp3x.c
+++ b/sound/soc/amd/renoir/rn-pci-acp3x.c
@@ -21,7 +21,7 @@ MODULE_PARM_DESC(acp_power_gating, "Enable acp power gating");
 struct acp_dev_data {
 	void __iomem *acp_base;
 	struct resource *res;
-	struct platform_device *pdev;
+	struct platform_device *pdev[ACP_DEVS];
 };
 
 static int rn_acp_power_on(void __iomem *acp_base)
@@ -156,9 +156,9 @@ static int snd_rn_acp_probe(struct pci_dev *pci,
 			    const struct pci_device_id *pci_id)
 {
 	struct acp_dev_data *adata;
-	struct platform_device_info pdevinfo;
+	struct platform_device_info pdevinfo[ACP_DEVS];
 	unsigned int irqflags;
-	int ret;
+	int ret, index;
 	u32 addr;
 
 	if (pci_enable_device(pci)) {
@@ -219,20 +219,29 @@ static int snd_rn_acp_probe(struct pci_dev *pci,
 	adata->res[1].end = pci->irq;
 
 	memset(&pdevinfo, 0, sizeof(pdevinfo));
-	pdevinfo.name = "acp_rn_pdm_dma";
-	pdevinfo.id = 0;
-	pdevinfo.parent = &pci->dev;
-	pdevinfo.num_res = 2;
-	pdevinfo.res = adata->res;
-	pdevinfo.data = &irqflags;
-	pdevinfo.size_data = sizeof(irqflags);
-
-	adata->pdev = platform_device_register_full(&pdevinfo);
-	if (IS_ERR(adata->pdev)) {
-		dev_err(&pci->dev, "cannot register %s device\n",
-			pdevinfo.name);
-		ret = PTR_ERR(adata->pdev);
-		goto unregister_devs;
+	pdevinfo[0].name = "acp_rn_pdm_dma";
+	pdevinfo[0].id = 0;
+	pdevinfo[0].parent = &pci->dev;
+	pdevinfo[0].num_res = 2;
+	pdevinfo[0].res = adata->res;
+	pdevinfo[0].data = &irqflags;
+	pdevinfo[0].size_data = sizeof(irqflags);
+
+	pdevinfo[1].name = "dmic-codec";
+	pdevinfo[1].id = 0;
+	pdevinfo[1].parent = &pci->dev;
+	pdevinfo[2].name = "acp_pdm_mach";
+	pdevinfo[2].id = 0;
+	pdevinfo[2].parent = &pci->dev;
+	for (index = 0; index < ACP_DEVS; index++) {
+		adata->pdev[index] =
+				platform_device_register_full(&pdevinfo[index]);
+		if (IS_ERR(adata->pdev[index])) {
+			dev_err(&pci->dev, "cannot register %s device\n",
+				pdevinfo[index].name);
+			ret = PTR_ERR(adata->pdev[index]);
+			goto unregister_devs;
+		}
 	}
 	pm_runtime_set_autosuspend_delay(&pci->dev, ACP_SUSPEND_DELAY_MS);
 	pm_runtime_use_autosuspend(&pci->dev);
@@ -242,7 +251,8 @@ static int snd_rn_acp_probe(struct pci_dev *pci,
 	return 0;
 
 unregister_devs:
-	platform_device_unregister(adata->pdev);
+	for (index = 0; index < ACP_DEVS; index++)
+		platform_device_unregister(adata->pdev[index]);
 de_init:
 	if (rn_acp_deinit(adata->acp_base))
 		dev_err(&pci->dev, "ACP de-init failed\n");
@@ -295,10 +305,11 @@ static const struct dev_pm_ops rn_acp_pm = {
 static void snd_rn_acp_remove(struct pci_dev *pci)
 {
 	struct acp_dev_data *adata;
-	int ret;
+	int ret, index;
 
 	adata = pci_get_drvdata(pci);
-	platform_device_unregister(adata->pdev);
+	for (index = 0; index < ACP_DEVS; index++)
+		platform_device_unregister(adata->pdev[index]);
 	ret = rn_acp_deinit(adata->acp_base);
 	if (ret)
 		dev_err(&pci->dev, "ACP de-init failed\n");
diff --git a/sound/soc/amd/renoir/rn_acp3x.h b/sound/soc/amd/renoir/rn_acp3x.h
index 6e1888167fb3..75228e306e0b 100644
--- a/sound/soc/amd/renoir/rn_acp3x.h
+++ b/sound/soc/amd/renoir/rn_acp3x.h
@@ -7,6 +7,7 @@
 
 #include "rn_chip_offset_byte.h"
 
+#define ACP_DEVS		3
 #define ACP_PHY_BASE_ADDRESS 0x1240000
 #define	ACP_REG_START	0x1240000
 #define	ACP_REG_END	0x1250200
-- 
2.25.4

