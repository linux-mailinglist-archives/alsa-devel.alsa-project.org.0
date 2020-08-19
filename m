Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 876772495EA
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Aug 2020 09:00:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 223371801;
	Wed, 19 Aug 2020 08:59:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 223371801
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597820442;
	bh=LH0NaDnKAHcVRn3lT3rDdtXF2qEXbg0yWEOD4MwwB8g=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dhCiRcV+kZ1B1wgk/JHmOjRha45kbNHmNpeN0/YdZln+cNXHa1ywNhjzHecGDjLDS
	 66XPkXAhntc6p3aNyqol8T0U4ICCYzdblxiYlr4H7ftacZTzOWnoTY1UzM/V0iCjTg
	 VBXUbg1gLuAK4RXaa8FUJo6DEGWP9TBo3/665RGs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A766CF802E1;
	Wed, 19 Aug 2020 08:56:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 686C4F80218; Wed, 19 Aug 2020 08:56:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 189FBF80255
 for <alsa-devel@alsa-project.org>; Wed, 19 Aug 2020 08:56:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 189FBF80255
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="W7jp/kmQ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=eBdiOi8NPtkzomu53YzYl2srwsK9DIz9xkGY00o46Kk=; b=W7jp/kmQRNQmUKHIQCbWiH2UzD
 GHchOhkvpQXWR6G8uHdQkx6sUQhPxtEOypHvMit0pnMaJ96seYjUrPxSxVC6yzpyGBSOC2Nrgsh8t
 habu4qVEkcucriWPKkm9BybK9fhXZoRM6VZxHk19H4GtftcZP4mFNmDQh9R4d6euSpnVjF/IT+4VA
 fQn1gjBdhax7V48K7ChncjzQBXjHEdp34pMLA0HCN9PETDLnVwDoWAMZ6z8zDxVD+JSzcAWRs6/Yh
 jvj7ygz03LhQShxpipeKs0B45bhtyQCSewe+tNF4boY9o+jka2d5wVanpf8IakmCQfRJXxYOcqDdr
 mCnhF8Kg==;
Received: from [2001:4bb8:198:f3b2:86b6:2277:f429:37a1] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8I0v-0008L8-G8; Wed, 19 Aug 2020 06:56:02 +0000
From: Christoph Hellwig <hch@lst.de>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Ben Skeggs <bskeggs@redhat.com>,
 Pawel Osciak <pawel@osciak.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Matt Porter <mporter@kernel.crashing.org>, iommu@lists.linux-foundation.org
Subject: [PATCH 03/28] drm/nouveau/gk20a: stop setting DMA_ATTR_NON_CONSISTENT
Date: Wed, 19 Aug 2020 08:55:30 +0200
Message-Id: <20200819065555.1802761-4-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200819065555.1802761-1-hch@lst.de>
References: <20200819065555.1802761-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: Tom Lendacky <thomas.lendacky@amd.com>, alsa-devel@alsa-project.org,
 linux-samsung-soc@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-doc@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
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

DMA_ATTR_NON_CONSISTENT is a no-op except on PARISC and some mips
configs, so don't set it in this ARM specific driver part.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c
index 985f2990ab0dda..13d4d7ac0697b4 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c
@@ -594,8 +594,7 @@ gk20a_instmem_new(struct nvkm_device *device, int index,
 
 		nvkm_info(&imem->base.subdev, "using IOMMU\n");
 	} else {
-		imem->attrs = DMA_ATTR_NON_CONSISTENT |
-			      DMA_ATTR_WEAK_ORDERING |
+		imem->attrs = DMA_ATTR_WEAK_ORDERING |
 			      DMA_ATTR_WRITE_COMBINE;
 
 		nvkm_info(&imem->base.subdev, "using DMA API\n");
-- 
2.28.0

