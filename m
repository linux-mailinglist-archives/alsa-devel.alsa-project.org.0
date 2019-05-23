Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0867F27A1F
	for <lists+alsa-devel@lfdr.de>; Thu, 23 May 2019 12:14:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F7641683;
	Thu, 23 May 2019 12:13:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F7641683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558606447;
	bh=sqsceOHWvziCORSzKseBQeTQC0K8glW/491ZlJwtIY0=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uN1cTfjMUOIKOi74DvjcojsC12VaoAZXEKgSf1oXS0ACa0KxFUN0r5Uw/MmOjvk3V
	 dgMNrJRAvhWrNwob0zFu57Ra6Y7fJB2bxrsIDzU0EG0clS9PYQ7YyfQHuLHGDALQeE
	 pwnMazMRRGz6J8C9GPeQ3+y+1+DzHO9IECDwzFrg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12CC1F80C0F;
	Thu, 23 May 2019 12:12:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A3870F89674; Thu, 23 May 2019 12:12:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 466A1F80C0F
 for <alsa-devel@alsa-project.org>; Thu, 23 May 2019 12:12:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 466A1F80C0F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Ib+KgVqL"
Received: by mail-pl1-x642.google.com with SMTP id p1so2572496plo.2
 for <alsa-devel@alsa-project.org>; Thu, 23 May 2019 03:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=U26hfEnzujUkh3KTuHOe5UmmcDFgXF3e4TaLMOxdmfM=;
 b=Ib+KgVqLDpT8MvHzygIpqSSllS0TetYaVrP7XgrFpZ4tAShr0RURzzglj6REWk93xQ
 WFFRiSJWx59+AH7KQcksdZE8FgH+kZ4UVcuDsg2fotamDs7PGww2jKz9UEuHZR4Ksluv
 BOuS0Q8pCI9SVeiK7/cYpZjkjBdon2Ib5kZ+pHSwkWt0y3CT9dSzcH2kXMpaKwjh90RK
 FG72cyNM327E21YkXcnhGrF3rgDAXbxiawmFFgR4JG3D0Qb8/Oc+O/0XxvPYKZkxu/9l
 VcXp5xzH2rgeygra1FJvVKVIVPaEJNrZMrr7BEDNsPl+9ZZaPDHjsFKtOn/guPNa5maa
 vuvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=U26hfEnzujUkh3KTuHOe5UmmcDFgXF3e4TaLMOxdmfM=;
 b=TFWKMF8F2wRzXIf7VKqzK0bUsLRoBVkilxY5PHrIz1xVIoCR7D5VPs60elLNrtldtz
 QpZ5GwD5XFsFWh9HGIiDMOa9sgFV5mVYaPnBo7QBu492FRm2d5IROL1FVjSgN7G8rV6O
 hw+sF7FAerPMCvxLDtDSXQ+K45eiwrx9ojdx31hCgJjXUoPaXzoO0syoIn9twBFTLcEz
 w9MDqJ7w1Vbh/7+YklAreKHgiy64Rfhy98tGhjM+qdWCpxFojZBJvFvH+SIwHBvTsJz6
 qqe75+Sdwdhc+St0KV/v4kdv0X3r9kB1NA5MIQtRcvPixmTsYS/KE8m8fQdQ3qdGQT6S
 2vCw==
X-Gm-Message-State: APjAAAV47cLfhGshgFa7WEKwq9J1D0e5iSAdOv7E0qemxjnEJO+EJSjO
 I6nnMXVaMIcA2zFfjxtgQ+8=
X-Google-Smtp-Source: APXvYqySDuPT7a7gghksq1od9CJZ2r1xxtVRGBUJt3XvoOYsZJiD4Eloj5sq2wLjCZ4i0lkxTdmMPQ==
X-Received: by 2002:a17:902:7044:: with SMTP id
 h4mr14867003plt.219.1558606335864; 
 Thu, 23 May 2019 03:12:15 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id c185sm32062477pfc.64.2019.05.23.03.12.15
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 23 May 2019 03:12:15 -0700 (PDT)
Date: Thu, 23 May 2019 03:10:56 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: "broonie@kernel.org" <broonie@kernel.org>,
 "S.j. Wang" <shengjiu.wang@nxp.com>
Message-ID: <20190523101055.GA28470@Asurada-Nvidia.nvidia.com>
References: <VE1PR04MB647934199C3AA60759BED888E3010@VE1PR04MB6479.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <VE1PR04MB647934199C3AA60759BED888E3010@VE1PR04MB6479.eurprd04.prod.outlook.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "timur@kernel.org" <timur@kernel.org>,
 "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: fsl_esai: fix the channel swap issue
	after xrun
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

Hello Shengjiu,

On Thu, May 23, 2019 at 09:53:42AM +0000, S.j. Wang wrote:
> > > +     /*
> > > +      * Add fifo reset here, because the regcache_sync will
> > > +      * write one more data to ETDR.
> > > +      * Which will cause channel shift.
> > 
> > Sounds like a bug to me...should fix it first by marking the data registers as
> > volatile.
> > 
> The ETDR is a writable register, it is not volatile. Even we change it to
> Volatile, I don't think we can't avoid this issue. for the regcache_sync
> Just to write this register, it is correct behavior.

Is that so? Quoting the comments of regcache_sync():
"* regcache_sync - Sync the register cache with the hardware.
 *
 * @map: map to configure.
 *
 * Any registers that should not be synced should be marked as
 * volatile."

If regcache_sync() does sync volatile registers too as you said,
I don't mind having this FIFO reset WAR for now, though I think
this mismatch between the comments and the actual behavior then
should get people's attention.

Thank you
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
