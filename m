Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 02EC848B614
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jan 2022 19:48:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7DAE11AAF;
	Tue, 11 Jan 2022 19:47:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7DAE11AAF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641926911;
	bh=Ki1dfu3CTX+I4SibyQ0iEBCbueJH/cmovqchnyaT4MQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qFd2SsiFF6oYbXek2JxB3o7A7BJT/rPyIyB/Aarc4S9Tepe1ljs/OkcbV7grvFt2M
	 hv61kqdEw5VanDLmDsm/oaN19ywQjNtdfyheX1I0vNRtlcNcZs2gJMMTLD3zf7YFnC
	 9nKFcJu47TubHuCphceqIiFF9J5Zzaahqmf95A2s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E111CF80430;
	Tue, 11 Jan 2022 19:47:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D4A56F80302; Tue, 11 Jan 2022 19:47:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 07B0DF800A7
 for <alsa-devel@alsa-project.org>; Tue, 11 Jan 2022 19:47:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07B0DF800A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=igorinstitute-com.20210112.gappssmtp.com
 header.i=@igorinstitute-com.20210112.gappssmtp.com header.b="paSVu7fL"
Received: by mail-pj1-x1035.google.com with SMTP id o3so463955pjs.1
 for <alsa-devel@alsa-project.org>; Tue, 11 Jan 2022 10:47:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igorinstitute-com.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=EBGPmf/4b8LtJ6IRDoixNp9baHgCn1IFhp/o+iuQRBU=;
 b=paSVu7fL/cMC9s/i+J/cExD+hEW0YlScO5DY5d6qIamg46PLj01KzSDaYsEgIPj9bM
 iMj1E59D9pH7RAY1xKwdJIuhdVy/SGwl0fHlIpTaKVZ0AURFU3Ygx20rb+ndC3LlxIAC
 IfisQE9vpefbDBjUgG1oxovdaC/ByCzdd32zjZWfewOixPo5l5zDCIbSiRn5atwc2nJI
 nGX3TqMrl289lw6D0XvWN1y8SYzk+KJtzHNpepbclb23sXmGmNH4ZEbvCTGNooan+I28
 ymi7OZ8CDEjVF0LPYZqZ/6KnCKjtXl39XrFW5xWXFf0l8rE9rGShpZxEfpHv6WI4R9OI
 PqzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=EBGPmf/4b8LtJ6IRDoixNp9baHgCn1IFhp/o+iuQRBU=;
 b=RPRBNAUB7WOeqIFrSFNhyNnJV2aMHpr7/KXpk3iWu4tSqRnf6UwHGRjUkyt8PJ7QPR
 0load5EpLrPBdOFm0cP3WFbZFluWMI7a+489uaLCrx33rowt6f94mSrBLMG6H9/z0D7W
 T0/2I4s+xRNGlpGWsMSievTLYuPjRkJ7IrOgTns8Q7zsXtYD3TbhhPEYEZcXjkGvWtD/
 rnfWDxTcc+Scd4+yebKbfaFPgP+9UCsl28lvHU8DrqDEFOmPfhQHKImuTsXAo6JLspcn
 Oo+cCGV6wmfyi7r8NWb2JhgaJ61iWUhjRxPwhYrbxU6O0USZyzJlYGZuRlKo9ZGnqZii
 FnZw==
X-Gm-Message-State: AOAM530bKmt/axUAaNjkjDBcW6ig4fIGhehhJVxbw5pbBcC/G3RlfuM8
 2q4NvKuTqZyAjdASc4fwBViguw==
X-Google-Smtp-Source: ABdhPJxnaXAlz26FFDOUJctx5xKwiFMkun3rvJ0Q1Mof/Urwu4EWmqRQOOvbSVmnouRM2uJkVIDd3A==
X-Received: by 2002:a17:902:d503:b0:149:16ed:d15f with SMTP id
 b3-20020a170902d50300b0014916edd15fmr5893872plg.102.1641926823855; 
 Tue, 11 Jan 2022 10:47:03 -0800 (PST)
Received: from localhost ([121.99.145.49])
 by smtp.gmail.com with ESMTPSA id on9sm3256638pjb.35.2022.01.11.10.47.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 10:47:03 -0800 (PST)
Date: Wed, 12 Jan 2022 07:47:00 +1300
From: Daniel Beer <daniel.beer@igorinstitute.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/2] ASoC: dt-bindings: add bindings for TI TAS5805M.
Message-ID: <20220111184700.GA10070@nyquist.nev>
References: <61dccc5c.1c69fb81.9af91.0df6@mx.google.com>
 <Yd29tk6ZJgDFDvVI@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yd29tk6ZJgDFDvVI@sirena.org.uk>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Andy Liu <andy-liu@ti.com>, Rob Herring <robh+dt@kernel.org>,
 Derek Simkowiak <derek.simkowiak@igorinstitute.com>
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

On Tue, Jan 11, 2022 at 05:26:14PM +0000, Mark Brown wrote:
> On Tue, Jan 11, 2022 at 01:00:09PM +1300, Daniel Beer wrote:
> 
> > +  ti,dsp-config: |
> > +    description: |
> > +      A byte sequence giving DSP configuration. Each pair of bytes, in
> > +      sequence, gives a register address and a value to write. If you
> > +      are taking this data from TI's PPC3 tool, this should contain only
> > +      the register writes following the 5ms delay.
> 
> This doesn't look appropriate for DT, it looks more like it should be
> loaded as firmware since systems might want to support multiple
> configurations at runtime based on use casea.  It would also be good to
> have code to validate that any supplied coefficeints/firmware don't
> overwrite registers managed by the driver, just in case.

Hi Mark,

That was my initial thought, but the problem is that different instances
may have different configurations.

We don't really have a way of validating the configuration here, since
it's typically generated by TI's PPC3 tool.

If you think it's still inappropriate to supply the configuration in the
device-tree, do you have any suggestions?

Cheers,
Daniel

-- 
Daniel Beer
Firmware Engineer at Igor Institute
daniel.beer@igorinstitute.com or +64-27-420-8101
Offices in Seattle, San Francisco, and Vancouver BC or (206) 494-3312
