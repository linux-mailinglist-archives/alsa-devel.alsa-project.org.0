Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4068651C3F
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Dec 2022 09:21:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 542F322E2;
	Tue, 20 Dec 2022 09:20:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 542F322E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671524492;
	bh=2oMpAWTmfsSkuiCYKNLvYxQSzjPAZxI/DuxrfqHBuOg=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=ahOC5lPejusFgTyz3opI8o8UgnBWLZitYuwPfKqR5tMToyuXXVPhtWY/qZpK9LsRM
	 HsgXj9eWhWx0JX/brObql5IGbK4A9oajjw8EaWE87mXeti6zXHSPBz9g/cnX6zS9Lx
	 KKQMsdAQ9tCW+qi4eoZwz5zANuQKDEik9O4jbRTI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B7D93F8032B;
	Tue, 20 Dec 2022 09:20:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2B9ACF8032B; Tue, 20 Dec 2022 09:20:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C3B6EF801C0
 for <alsa-devel@alsa-project.org>; Tue, 20 Dec 2022 09:20:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3B6EF801C0
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=bombadil.20210309 header.b=OBrOQpeS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=ppdW24xT12RkaZU9C8ifVA44nnqAOsohCG3d1m74QY0=; b=OBrOQpeSeMeOJy2wqwZ3Ih9SjG
 0QJg7xBCYwlzNc4U8uVSgf6rsv/0yynaI5fpNKuhr9ymUgD/oLq7w4oCIOsfWtHbdd5sF7j/67tVF
 9MSe2M3rwQ2phhU81xcsSLzF7X6lrHKZeOJ7PoQSEOJ3rqcBiFIgVZgen54WW9cdYlvHznNXSzFv5
 JhJ4FCze8Ig8+SrE5GkbVUCWQU8nO7HpL5WNdxzQ6lY/FfbEPr9b3gzDycD9C1mKZ1qucTePVZenH
 VEp/qbGoPP5NmSnhX6enoy97qr85Vc5JFDfzUeCryAy8bs74khHhXiMBBrN5sUvXXwZHQFqF3UUXL
 SNgxAotg==;
Received: from [2001:4bb8:199:7829:c604:55b0:ed6a:61ce] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1p7XrA-00BuI1-22; Tue, 20 Dec 2022 08:20:12 +0000
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux.dev
Subject: fix GFP_COMP use in noncoherent dma allocators
Date: Tue, 20 Dec 2022 09:20:07 +0100
Message-Id: <20221220082009.569785-1-hch@lst.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, Robin Murphy <robin.murphy@arm.com>,
 Takashi Iwai <tiwai@suse.com>, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi all,

this series fixe the regression where dma-iommu stopped clearing
GFP_COMP from noncoherent dma allocations by never requesting those
in the sound code and rejecting them in the core DMA API code.

Diffstat:
 kernel/dma/mapping.c  |    4 ++++
 sound/core/memalloc.c |    4 ++--
 2 files changed, 6 insertions(+), 2 deletions(-)
