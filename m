Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6C8E099B
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Oct 2019 18:48:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95C461682;
	Tue, 22 Oct 2019 18:47:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95C461682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571762888;
	bh=E5gzOl7P8GJR/02Ew56FSOwcidRkpH4EvAJpvLSfYxE=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Zyl/NLKv6YxKqiT5QJM9luxkrYdKeqKY/iHO+BzXZBR+Q0lq+frzhZz1QMX+92Tv+
	 Cl1k6Ort4MNAssL+/udXxl0YnH/ialPjUC9Va5o/i+oq0dbw6PlldRUNmnCnUGouF4
	 rnYJp1vGXc+Vz9Cb/4LA9dfIFHd5cz4TA2XRYTwI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 02D5BF80367;
	Tue, 22 Oct 2019 18:46:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7E2FCF8031A; Tue, 22 Oct 2019 18:46:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from smtp1.de.adit-jv.com (smtp1.de.adit-jv.com [93.241.18.167])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 508D6F80112;
 Tue, 22 Oct 2019 18:46:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 508D6F80112
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
 by smtp1.de.adit-jv.com (Postfix) with ESMTP id 375193C0579;
 Tue, 22 Oct 2019 18:46:16 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
 by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0v18L7p2Axcn; Tue, 22 Oct 2019 18:46:10 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 27A2F3C009D;
 Tue, 22 Oct 2019 18:46:10 +0200 (CEST)
Received: from vmlxhi-102.adit-jv.com (10.72.93.184) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.468.0;
 Tue, 22 Oct 2019 18:46:09 +0200
Date: Tue, 22 Oct 2019 18:46:07 +0200
From: Eugeniu Rosca <erosca@de.adit-jv.com>
To: Mark Brown <broonie@kernel.org>
Message-ID: <20191022164607.GA20665@vmlxhi-102.adit-jv.com>
References: <1550823803-32446-1-git-send-email-twischer@de.adit-jv.com>
 <20191022154904.GA17721@vmlxhi-102.adit-jv.com>
 <20191022163501.GK5554@sirena.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191022163501.GK5554@sirena.co.uk>
User-Agent: Mutt/1.12.1+40 (7f8642d4ee82) (2019-06-28)
X-Originating-IP: [10.72.93.184]
Cc: twischer@de.adit-jv.com, alsa-devel@alsa-project.org,
 patch@alsa-project.org, kuninori.morimoto.gx@renesas.com,
 Eugeniu Rosca <roscaeugeniu@gmail.com>, Jiada Wang <jiada_wang@mentor.com>,
 linux-kernel@vger.kernel.org, tiwai@suse.com,
 Eugeniu Rosca <erosca@de.adit-jv.com>
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

Hi Mark,

Thanks for the prompt reply.

On Tue, Oct 22, 2019 at 05:35:01PM +0100, Mark Brown wrote:
> On Tue, Oct 22, 2019 at 05:49:04PM +0200, Eugeniu Rosca wrote:
> 
> > It still applies cleanly to v5.4-rc4-18-g3b7c59a1950c.
> > Any chance to see it in vanilla?
> 
> Someone would need to resend it.  No idea what the issues are but I
> don't have it any more.

How about downloading it from [1] by pressing on the "mbox" button and
applying it with "git am"? This will also include any
"*-by: Name <E-mail>" signatures found in the thread.

If this doesn't match your workflow, I can resend it.

[1] https://patchwork.kernel.org/patch/10825513/
    ("ASoC: rsnd: dma: fix SSI9 4/5/6/7 busif dma address")

-- 
Best Regards,
Eugeniu
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
