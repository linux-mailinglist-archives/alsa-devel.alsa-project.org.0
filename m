Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B7249065F
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jan 2022 12:05:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8CF9C1738;
	Mon, 17 Jan 2022 12:04:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8CF9C1738
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642417526;
	bh=gGaHPIiiXzkhPUNYhPAUeTnzFbjomMtE0nTpfntxqOY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EgDtHJHK+d/mqisDS1qCOwu85AjZ7F34un0X7e1TlEzTAo3khUYXT4jVkJMQ7bGQJ
	 IBOvw2byJ3L+RDm9wShNzQPDTHd7UEtQtxyiyRPnm5G8T5NdE5PdWDs6T4d9KFeU6p
	 V356hnywOc/jryGhJQDCtNiLBODlaBZ7i/bWI15k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D511F800EB;
	Mon, 17 Jan 2022 12:04:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C5F2DF800EB; Mon, 17 Jan 2022 12:04:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 16C92F800CE
 for <alsa-devel@alsa-project.org>; Mon, 17 Jan 2022 12:04:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16C92F800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="W/81fg0H"
Received: by mail-qk1-x733.google.com with SMTP id t1so2448644qkt.11
 for <alsa-devel@alsa-project.org>; Mon, 17 Jan 2022 03:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dVVFFLPkAhrjO1v7t1aDsmduyj0ieOuL7PziCjm6/tg=;
 b=W/81fg0Hk0sIXPbIeJrLwn4SfVlAT+y3A5lZ5OhghM9yR6857m0qZvilEcG4GRNMo4
 EivmcO1ftmIggwQWWMfy4xd0lQ50oEeHCuhyk2b8I+5J8HkWiKMA75V8BvI6ij6LYcbd
 +fMOayUylLTB3E/E/FeCSwm1Y+548SOr36hRT5npIbu+rtSsUgVX0/KARLfhBxsgdLS9
 aO7c0AuwPk5R5STzHDRQe+Lty80mQ6dC31Z+IvT3+lHIbDS5JSn9D/Tkvs3D3cAwKs2s
 Ez0G/nit80T9J9DlqthpEHh0raJKH+C/bZzKCQCh/vSPY8UdMDRejTVBhgLGOFJcQirK
 N6vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dVVFFLPkAhrjO1v7t1aDsmduyj0ieOuL7PziCjm6/tg=;
 b=n3Tu8KRONF+/KiYzs9AOoqhWtveRxbPUl6PczC7u+dSUk6OJucwCvQWOF02Re+U/M+
 rWUPdTlwGu0aJXluQ3NE9+CqB55xHek//eokTe0vJ4NVW/89KfBPz/Qe42KhsSidOlut
 eUL/IDbrE4tKv44VDtilrAnyrzNpZU+C9DQ0T3k/aRelWvXOPQPUaSJZxo6BC6DmJ6t9
 VN9Aa582sv75+M4+GATLzUVJfcf/cSxdCfxpLiFtMvhugwkR+OJNPpqWEMuOtJ+zXS/g
 Zhl2ON7XK1tDqOTyAG+x96WZ+WLatetb21luewKCleNYOOnwQDOUsgNaUAzR2X4CkkWH
 KyBQ==
X-Gm-Message-State: AOAM5303iQgZoT+6MRfj8ad93iGNeqQjcph1cZFaW4ZGCFaLjp9f19fI
 b0JQpWVgrbUPFS1dJ9pAvM4=
X-Google-Smtp-Source: ABdhPJz/pAE65j0ZQrMN/H6l9uLJ86U3AgN3jVqlcUFlNN1OGK6FGXX48zniSP4M+enymXdqkWSPcw==
X-Received: by 2002:a05:620a:4707:: with SMTP id
 bs7mr6890633qkb.69.1642417445471; 
 Mon, 17 Jan 2022 03:04:05 -0800 (PST)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id l16sm8198120qkl.114.2022.01.17.03.04.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 03:04:05 -0800 (PST)
From: cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To: krzysztof.kozlowski@canonical.com
Subject: [PATCH] sound/soc/samsung: remove unneeded ret variable
Date: Mon, 17 Jan 2022 11:03:57 +0000
Message-Id: <20220117110357.863990-1-chi.minghao@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Zeal Robot <zealci@zte.com.cn>, tiwai@suse.com,
 Minghao Chi <chi.minghao@zte.com.cn>, lgirdwood@gmail.com, broonie@kernel.org,
 CGEL ZTE <cgel.zte@gmail.com>
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

From: Minghao Chi <chi.minghao@zte.com.cn>

Return value from io_remap_pfn_range() directly instead
of taking this in another redundant variable.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
Signed-off-by: CGEL ZTE <cgel.zte@gmail.com>
---
 sound/soc/samsung/idma.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/sound/soc/samsung/idma.c b/sound/soc/samsung/idma.c
index c3f1b054e238..402ccadad46c 100644
--- a/sound/soc/samsung/idma.c
+++ b/sound/soc/samsung/idma.c
@@ -244,17 +244,14 @@ static int idma_mmap(struct snd_soc_component *component,
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	unsigned long size, offset;
-	int ret;
 
 	/* From snd_pcm_lib_mmap_iomem */
 	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
 	size = vma->vm_end - vma->vm_start;
 	offset = vma->vm_pgoff << PAGE_SHIFT;
-	ret = io_remap_pfn_range(vma, vma->vm_start,
+	return io_remap_pfn_range(vma, vma->vm_start,
 			(runtime->dma_addr + offset) >> PAGE_SHIFT,
 			size, vma->vm_page_prot);
-
-	return ret;
 }
 
 static irqreturn_t iis_irq(int irqno, void *dev_id)
-- 
2.25.1

