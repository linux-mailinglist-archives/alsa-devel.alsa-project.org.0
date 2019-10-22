Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5766CE07E2
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Oct 2019 17:51:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D673C1654;
	Tue, 22 Oct 2019 17:50:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D673C1654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571759466;
	bh=YqTg48DcDpPUJF9mCfWP5/AM1V8+lXhE291cjTAUIjs=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pFxABIcGOqUaYmDCaRoVoTda25b5ZPQeP+JkJ5JYfXoN4R/XWiX/B7tSX7pCd4/Gl
	 9KDodilV2t0mSirwo72KJW80uU/xd3fjBB6hb/nV8dmm5BLuE+xKQ0OsJGIx8smv9j
	 AJKBympsaYN+criN0ZKGY9TgFlxbLL1wbkf/d/oA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2446EF80322;
	Tue, 22 Oct 2019 17:49:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C6D75F8031A; Tue, 22 Oct 2019 17:49:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtp1.de.adit-jv.com (smtp1.de.adit-jv.com [93.241.18.167])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7CDAFF8026A;
 Tue, 22 Oct 2019 17:49:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7CDAFF8026A
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
 by smtp1.de.adit-jv.com (Postfix) with ESMTP id 0ADED3C0579;
 Tue, 22 Oct 2019 17:49:13 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
 by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F24eroNkNbDo; Tue, 22 Oct 2019 17:49:07 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 76C173C009D;
 Tue, 22 Oct 2019 17:49:07 +0200 (CEST)
Received: from vmlxhi-102.adit-jv.com (10.72.93.184) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.468.0;
 Tue, 22 Oct 2019 17:49:07 +0200
Date: Tue, 22 Oct 2019 17:49:04 +0200
From: Eugeniu Rosca <erosca@de.adit-jv.com>
To: <kuninori.morimoto.gx@renesas.com>
Message-ID: <20191022154904.GA17721@vmlxhi-102.adit-jv.com>
References: <1550823803-32446-1-git-send-email-twischer@de.adit-jv.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1550823803-32446-1-git-send-email-twischer@de.adit-jv.com>
User-Agent: Mutt/1.12.1+40 (7f8642d4ee82) (2019-06-28)
X-Originating-IP: [10.72.93.184]
Cc: twischer@de.adit-jv.com, alsa-devel@alsa-project.org,
 patch@alsa-project.org, Eugeniu Rosca <roscaeugeniu@gmail.com>,
 Jiada Wang <jiada_wang@mentor.com>, linux-kernel@vger.kernel.org,
 tiwai@suse.com, broonie@kernel.org, Eugeniu Rosca <erosca@de.adit-jv.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: rsnd: dma: fix SSI9 4/5/6/7 busif
 dma address
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

Hi Morimoto-san,

On Fri, Feb 22, 2019 at 09:23:23AM +0100, twischer@de.adit-jv.com wrote:
> From: Jiada Wang <jiada_wang@mentor.com>
> 
> Currently each SSI unit 's busif dma address is calculated by
> following calculation formulation:
> 0xec540000 + 0x1000 * id + busif / 4 * 0xA000 + busif % 4 * 0x400
> 
> But according to user manual 41.1.4 Register Configuration
> ssi9 4/5/6/7 busif data register address
> (SSI9_4_BUSIF/SSI9_5_BUSIF/SSI9_6_BUSIF/SSI9_7_BUSIF)
> are out of this rule.
> 
> This patch updates the calculation formulation to correct
> ssi9 4/5/6/7 busif data register address
> 
> Fixes: commit 5e45a6fab3b9 ("ASoc: rsnd: dma: Calculate dma address with consider of BUSIF")
> Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
> Signed-off-by: Timo Wischer <twischer@de.adit-jv.com>
> ---
>  sound/soc/sh/rcar/dma.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/sh/rcar/dma.c b/sound/soc/sh/rcar/dma.c
> index 0324a5c..28f65eb 100644
> --- a/sound/soc/sh/rcar/dma.c
> +++ b/sound/soc/sh/rcar/dma.c
> @@ -508,10 +508,10 @@ static struct rsnd_mod_ops rsnd_dmapp_ops = {
>  #define RDMA_SSI_I_N(addr, i)	(addr ##_reg - 0x00300000 + (0x40 * i) + 0x8)
>  #define RDMA_SSI_O_N(addr, i)	(addr ##_reg - 0x00300000 + (0x40 * i) + 0xc)
>  
> -#define RDMA_SSIU_I_N(addr, i, j) (addr ##_reg - 0x00441000 + (0x1000 * (i)) + (((j) / 4) * 0xA000) + (((j) % 4) * 0x400))
> +#define RDMA_SSIU_I_N(addr, i, j) (addr ##_reg - 0x00441000 + (0x1000 * (i)) + (((j) / 4) * 0xA000) + (((j) % 4) * 0x400) - (0x4000 * ((i) / 9) * ((j) / 4)))
>  #define RDMA_SSIU_O_N(addr, i, j) RDMA_SSIU_I_N(addr, i, j)
>  
> -#define RDMA_SSIU_I_P(addr, i, j) (addr ##_reg - 0x00141000 + (0x1000 * (i)) + (((j) / 4) * 0xA000) + (((j) % 4) * 0x400))
> +#define RDMA_SSIU_I_P(addr, i, j) (addr ##_reg - 0x00141000 + (0x1000 * (i)) + (((j) / 4) * 0xA000) + (((j) % 4) * 0x400) - (0x4000 * ((i) / 9) * ((j) / 4)))
>  #define RDMA_SSIU_O_P(addr, i, j) RDMA_SSIU_I_P(addr, i, j)
>  
>  #define RDMA_SRC_I_N(addr, i)	(addr ##_reg - 0x00500000 + (0x400 * i))

Reviewed-by: Eugeniu Rosca <erosca@de.adit-jv.com>

This patch lives in our tree for a while without any issues.
It still applies cleanly to v5.4-rc4-18-g3b7c59a1950c.
Any chance to see it in vanilla?

-- 
Best Regards,
Eugeniu
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
