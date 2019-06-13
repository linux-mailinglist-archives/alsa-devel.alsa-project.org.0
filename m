Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A20814326F
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2019 05:56:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3134317E3;
	Thu, 13 Jun 2019 05:55:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3134317E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560398202;
	bh=8SFIjoYA+PJN7BBbVkYP3JiyIda2G/JpBNsZjC6ghl4=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MRIQCHvbpEy5l/wq5GWeijLGTSucyvIsTIE1cJgkhm1KuzDKMcy+wY6muu8rs+I+/
	 bYavqLj2GVFLgEI2OmFpNHf4zkJyEIU1QKUCyZDClhnVGkYT6+6DCLGtsVFOyhWCkz
	 74WBJiLn9hVVJJ9psKuDzmZ13oSNc9oGMYvVBFdo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80B98F89711;
	Thu, 13 Jun 2019 05:54:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3F50DF89703; Thu, 13 Jun 2019 05:54:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_30,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AAE40F80794
 for <alsa-devel@alsa-project.org>; Thu, 13 Jun 2019 05:54:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AAE40F80794
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="VY1ARRR2"
Received: by mail-pf1-x442.google.com with SMTP id j2so10918236pfe.6
 for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2019 20:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=mKy9mX5Pp1ioIzP2A8hzp0vntRtGgDnY3IkJQGZ2PBw=;
 b=VY1ARRR2PzJXX/T0X0dikiSYlvBOEZzpixIOxb3/mvvoEJvO1W+6VTiUN6qa+hwMMo
 jsl2ys0dkXq4g+DWURE4vjrOA2narBcN4B7lhf7YxeZhy+Z0fu5wAAQFHrloFTYa9bAY
 McCy2tdVTjXdUZYioxoPhBdfF9xPSgXf05UMISQO85e9KsMEvjDb2BwLLkPYMcRNEssg
 h7H455qyD1uCW4Zr8pD6qbBPtHYMzyMsJRpcuPVSkar+w665vxzgBZhRWnurIda6PDgu
 5Rof3ELHIuGjr0Fe4ShBzdXI70oyHYUPHypZZDzQB9bOCqzydNXdWbkpM5J+7NxaoAQ2
 xrow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=mKy9mX5Pp1ioIzP2A8hzp0vntRtGgDnY3IkJQGZ2PBw=;
 b=EHxVFvs3fr6lk1ff0bE8yW47+DMuyVTT5b4HT7iZb5m6DeYW2ryFc9VXZLUqoOmELp
 Z3FLQaTwIGmAF/yvnNUpIJbzLcNsb6Nj936LlDe2N0mkH0ojzj8AxpUCYPeugT3gq83r
 G+q7IKp/9q2E/qoR2NJSRw8z7epqOA9UaUPph9vnd+jjPfUtJVBQ1KeQxr0xEr2MuCFo
 dabJWtfyIWgTXKOXHGU8wiMNPyDRh0kF4+8pvstSXLAgtky8u0z0xXqiBWULU3gLLn5H
 gtCEgRTu+9zjFg3MVWrd6+rnf32+7JHrYqytX7zLLIKuMYJHASj3ZGCe14Oa5A/P4X4e
 4eUA==
X-Gm-Message-State: APjAAAX1cBmf5YFl5/w6esQlXlt8jF+8cjowanq791/pf3UgNFV9Lgx5
 vEM0V+VTVSdOdd2vGBuEPn4=
X-Google-Smtp-Source: APXvYqzRZrUpdn80GYYwHJcJVav31KYzUN1LPr7q/EkOEPciQgLl7crthZ3eONR3VME76glRiBDUmQ==
X-Received: by 2002:a65:5304:: with SMTP id m4mr27956862pgq.126.1560398089063; 
 Wed, 12 Jun 2019 20:54:49 -0700 (PDT)
Received: from Asurada (c-98-248-47-108.hsd1.ca.comcast.net. [98.248.47.108])
 by smtp.gmail.com with ESMTPSA id
 y22sm994911pgj.38.2019.06.12.20.54.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 Jun 2019 20:54:48 -0700 (PDT)
Date: Wed, 12 Jun 2019 20:54:35 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: "S.j. Wang" <shengjiu.wang@nxp.com>
Message-ID: <20190613035434.GA7692@Asurada>
References: <VE1PR04MB6479D4B1D5F00B07C5CECC5BE3EF0@VE1PR04MB6479.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <VE1PR04MB6479D4B1D5F00B07C5CECC5BE3EF0@VE1PR04MB6479.eurprd04.prod.outlook.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "timur@kernel.org" <timur@kernel.org>,
 "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [alsa-devel] [RFC/RFT PATCH v2] ASoC: fsl_esai: Revert "ETDR
 and TX0~5 registers are non volatile"
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

Hi Shengjiu,

On Thu, Jun 13, 2019 at 03:00:58AM +0000, S.j. Wang wrote:
> > Commit 8973112aa41b ("ASoC: fsl_esai: ETDR and TX0~5 registers are non
> > volatile") removed TX data registers from the volatile_reg list and appended
> > default values for them. However, being data registers of TX, they should
> > not have been removed from the list because they should not be cached --
> > see the following reason.
> > 
> > When doing regcache_sync(), this operation might accidentally write some
> > dirty data to these registers, in case that cached data happen to be
> > different from the default ones, which might also result in a channel shift or
> > swap situation, since the number of write-via-sync operations at ETDR
> > would very unlikely match the channel number.
> > 
> > So this patch reverts the original commit to keep TX data registers in
> > volatile_reg list in order to prevent them from being written by
> > regcache_sync().
> > 
> > Note: this revert is not a complete revert as it keeps those macros of
> > registers remaining in the default value list while the original commit also
> > changed other entries in the list. And this patch isn't very necessary to Cc
> > stable tree since there has been always a FIFO reset operation around the
> > regcache_sync() call, even prior to this reverted commit.
> > 
> > Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> > Cc: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> > Hi Mark,
> > In case there's no objection against the patch, I'd still like to wait for a
> > Tested-by from NXP folks before submitting it. Thanks!
> 
> bool regmap_volatile(struct regmap *map, unsigned int reg)
> {
>         if (!map->format.format_write && !regmap_readable(map, reg))
>                 return false;
> 
> 
> Actually with this patch, the regcache_sync will write the 0 to ETDR, even
> It is declared volatile, the reason is that in regmap_volatile(), the first
> condition
> 
> (!map->format.format_write && !regmap_readable(map, reg))  is true.
> 
> So the regmap_volatile will return false.

Interesting finding.....so a write-only register will not be treated
as a volatile register (to avoid regcache_sync) at all....

> And in regcache_reg_needs_sync(), because there is no default value
> It will return true, then the ETDR need be synced, and be written 0.

Looks like either way of keeping them in or out of volatile_reg list
might have the same result of having a data being written, while our
current code at least would not force to write 0.

So I think having a FIFO reset won't be a bad idea at all. And since
our suspend/resume() functions are already doing regcache_sync() with
a FIFO reset, we can just reuse that code for your reset routine.

Thanks a lot
Nicolin
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
