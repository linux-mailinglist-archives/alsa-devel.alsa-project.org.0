Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 912EF5B2D24
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Sep 2022 05:56:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 26528169F;
	Fri,  9 Sep 2022 05:55:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 26528169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662695796;
	bh=2utefFzhLE6xTp21ULOp7F38twZELvGMFod/cIJma2A=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ljNcLzMrIlpXVx5pP4eVzDDleY2A6J1GMyppi4jCdUvn7l1GpHpxIxoM9Gi6TPvnL
	 OjtzVIYpDkZ8vCyOvp0DuuiFqSgJBYdih/pp+ZIcmNlBrnuTOyBSXw/eQ4jDtn+XmU
	 VZe6Jf0GADu+1CjptlWoU38jFzYqISQuOLP0Eo0s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A6F8F80533;
	Fri,  9 Sep 2022 05:55:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 94605F80527; Fri,  9 Sep 2022 05:54:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4A578F8016D
 for <alsa-devel@alsa-project.org>; Fri,  9 Sep 2022 05:54:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A578F8016D
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.53])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4MP28Z6xqSz14QYY;
 Fri,  9 Sep 2022 11:50:54 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 9 Sep 2022 11:54:45 +0800
From: Gaosheng Cui <cuigaosheng1@huawei.com>
To: <perex@perex.cz>, <tiwai@suse.com>, <johan@kernel.org>,
 <stefanha@gmail.com>, <dhowells@redhat.com>, <cuigaosheng1@huawei.com>
Subject: [PATCH 2/2] ALSA: memalloc: remove snd_dma_sg_ops declaration
Date: Fri, 9 Sep 2022 11:54:43 +0800
Message-ID: <20220909035443.1065737-3-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220909035443.1065737-1-cuigaosheng1@huawei.com>
References: <20220909035443.1065737-1-cuigaosheng1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.244.148.83]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

snd_dma_sg_ops has been removed since
commit 2c95b92ecd92 ("ALSA: memalloc: Unify x86 SG-buffer handling
(take#3)"), so remove it.

Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 sound/core/memalloc_local.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/sound/core/memalloc_local.h b/sound/core/memalloc_local.h
index a6f3a87194da..8b19f3a68a4b 100644
--- a/sound/core/memalloc_local.h
+++ b/sound/core/memalloc_local.h
@@ -13,8 +13,4 @@ struct snd_malloc_ops {
 	void (*sync)(struct snd_dma_buffer *dmab, enum snd_dma_sync_mode mode);
 };
 
-#ifdef CONFIG_SND_DMA_SGBUF
-extern const struct snd_malloc_ops snd_dma_sg_ops;
-#endif
-
 #endif /* __MEMALLOC_LOCAL_H */
-- 
2.25.1

