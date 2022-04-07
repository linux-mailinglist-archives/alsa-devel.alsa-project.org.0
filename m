Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 992674F79CC
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Apr 2022 10:32:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58B75174F;
	Thu,  7 Apr 2022 10:31:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58B75174F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649320322;
	bh=m9mZwmfITUG9y7od8bh3zjd0ZA2ymkqK6Y6Y4T2wQ3A=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gN7nn8Jg6m/HlXK+XWjhmIs5LWRDHKl0Y/tMgfeFEyC3ar1eCzzF3H5/o3uOort5N
	 qAUBeP8bjewfRaBqUaFUsaXBR79lEnGJeFIt+3Hy0w1KaYWK5UiRMPPuSA0zcj4h9B
	 1AeZ6/1v35a/HJTsUn26jZP/5AU44lJNG5LqC4Xo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D9744F804CF;
	Thu,  7 Apr 2022 10:31:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 84D61F8047B; Thu,  7 Apr 2022 10:31:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 47F7CF80141
 for <alsa-devel@alsa-project.org>; Thu,  7 Apr 2022 10:31:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47F7CF80141
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="b9KpGhr1"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 876D5618E5;
 Thu,  7 Apr 2022 08:31:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C1D9C385AA;
 Thu,  7 Apr 2022 08:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649320261;
 bh=m9mZwmfITUG9y7od8bh3zjd0ZA2ymkqK6Y6Y4T2wQ3A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=b9KpGhr13M2J52U606lfwZCkz90YFN3domd7I0xQ7ufvgt5hl2L3BX+QIKs2DyUEm
 jlybbhXAmwOiIjF3pM+wRGCGm9BykXHU//CzTUy7uawDVMk40+YaiKyIaX3Yln5old
 spCbVghVr9jd+bnfHlXR3CkJ/Y37KzhUh1Z4B7bR8bmdpMZJ9+xYl4cEPHeagsHThK
 mrV0OCbeJZ7rXo636owmzjAqccSnrs8pgqRLIYiL3d3SSLwwcLjV2ekZgJihFvvheV
 KEkcA1m9JqdgEsLkvCf0S8dxPMqUh/hTVM7icsRZmIV4+0kF8Ba7XnjcdFUkMu8TtO
 QhEkXetJVT2Ew==
Date: Thu, 7 Apr 2022 14:00:57 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH v3 09/20] dmaengine: imx: Move header to include/dma/
Message-ID: <Yk6hQR/ApMsLY+yf@matsya>
References: <20220405075959.2744803-1-s.hauer@pengutronix.de>
 <20220405075959.2744803-10-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220405075959.2744803-10-s.hauer@pengutronix.de>
Cc: alsa-devel@alsa-project.org, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 kernel@pengutronix.de, dmaengine@vger.kernel.org,
 Shengjiu Wang <shengjiu.wang@gmail.com>
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

On 05-04-22, 09:59, Sascha Hauer wrote:
> The i.MX DMA drivers are device tree only, nothing in
> include/linux/platform_data/dma-imx.h has platform_data in it, so move
> the file to include/linux/dma/imx-dma.h.

Acked-By: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
