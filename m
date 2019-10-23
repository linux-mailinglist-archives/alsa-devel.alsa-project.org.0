Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FAE6E16E5
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Oct 2019 11:57:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0691115E2;
	Wed, 23 Oct 2019 11:57:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0691115E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571824670;
	bh=7DTfhSuhQq/ko3fsJRQHak+4yjAIfMYoHHcaVcF9x6A=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VPpOZmRa3Vmr24jWBlxyISZ9s3ZRaFq+8D+vIlkqgTaN8ROaFD7h0b9QwNwbCU0CC
	 5+E6ueB4HAxxEimyT53TpeLtvqJfWbFtzBRh5mNHffRvkgjPeE573QHlUgHh6Zp4R9
	 10cbos01Uw1lCNmK/MPztYS1Dw+a3S0+ZZ9C6aOM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 86240F8036F;
	Wed, 23 Oct 2019 11:56:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B6F7DF80112; Wed, 23 Oct 2019 11:56:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtp1.de.adit-jv.com (smtp1.de.adit-jv.com [93.241.18.167])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AAC1EF80112
 for <alsa-devel@alsa-project.org>; Wed, 23 Oct 2019 11:55:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AAC1EF80112
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
 by smtp1.de.adit-jv.com (Postfix) with ESMTP id 811B73C04C1;
 Wed, 23 Oct 2019 11:55:55 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
 by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gK48FXrscP2K; Wed, 23 Oct 2019 11:55:48 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp1.de.adit-jv.com (Postfix) with ESMTPS id EA0613C009D;
 Wed, 23 Oct 2019 11:55:48 +0200 (CEST)
Received: from vmlxhi-102.adit-jv.com (10.72.93.184) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.468.0;
 Wed, 23 Oct 2019 11:55:48 +0200
Date: Wed, 23 Oct 2019 11:55:45 +0200
From: Eugeniu Rosca <erosca@de.adit-jv.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Message-ID: <20191023095545.GA20748@vmlxhi-102.adit-jv.com>
References: <20191022185429.12769-1-erosca@de.adit-jv.com>
 <87h840z3l3.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87h840z3l3.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Mutt/1.12.1+40 (7f8642d4ee82) (2019-06-28)
X-Originating-IP: [10.72.93.184]
Cc: Timo Wischer <twischer@de.adit-jv.com>, alsa-devel@alsa-project.org,
 Andrew Gabbasov <andrew_gabbasov@mentor.com>,
 Eugeniu Rosca <roscaeugeniu@gmail.com>, Jiada Wang <jiada_wang@mentor.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 stable@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Eugeniu Rosca <erosca@de.adit-jv.com>
Subject: Re: [alsa-devel] [RESEND PATCH] ASoC: rsnd: dma: fix SSI9 4/5/6/7
 busif dma address
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

On Wed, Oct 23, 2019 at 09:51:36AM +0900, Kuninori Morimoto wrote:
> 
> Hi
> 
> > From: Jiada Wang <jiada_wang@mentor.com>
> > 
> > Currently each SSI unit's busif dma address is calculated by
> > following calculation formula:
> > 0xec540000 + 0x1000 * id + busif / 4 * 0xA000 + busif % 4 * 0x400
> > 
> > But according to R-Car3 HW manual 41.1.4 Register Configuration,
> > ssi9 4/5/6/7 busif data register address
> > (SSI9_4_BUSIF/SSI9_5_BUSIF/SSI9_6_BUSIF/SSI9_7_BUSIF)
> > are out of this rule.
> > 
> > This patch updates the calculation formula to correct
> > ssi9 4/5/6/7 busif data register address.
> > 
> > Fixes: 5e45a6fab3b9 ("ASoc: rsnd: dma: Calculate dma address with consider of BUSIF")
> > Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
> > Signed-off-by: Timo Wischer <twischer@de.adit-jv.com>
> > [erosca: minor improvements in commit description]
> > Cc: Andrew Gabbasov <andrew_gabbasov@mentor.com>
> > Cc: stable@vger.kernel.org # v4.20+
> > Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
> > ---
> 
> Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Many thanks for the prompt responses.

-- 
Best Regards,
Eugeniu
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
