Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F60E8CA60
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Aug 2019 06:26:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB9E9166D;
	Wed, 14 Aug 2019 06:25:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB9E9166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565756782;
	bh=zoLsXkMwu+ifC8q2qTpARnFnF010hwvptuwIMahzPRI=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SYRzRpuueVkm9hxTWD6O9wROcyLqci9L/NQZwhUKUHnJWAbKUZrC+8TaRzUplQcDx
	 XRqLPLLEmR9amnRrGrXwXwVo/K4KkNhjVaVi1BTrep/drxnuBhqkYmbmTqmQtC5w+9
	 7ZVc4gbgfcNKNPZWDA0t+lXvxNdQIEJRBl1fmQWw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 323F8F80214;
	Wed, 14 Aug 2019 06:24:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 02887F80214; Wed, 14 Aug 2019 06:24:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 29022F801DF
 for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2019 06:24:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29022F801DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Z8vgyNxN"
Received: by mail-wr1-x444.google.com with SMTP id g17so109739405wrr.5
 for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2019 21:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=y97MxFgoBqjees+drSVKeA6Szdi0VlvTHwvx0CSVO1o=;
 b=Z8vgyNxN1/96cju2HdSvgfCTLSIOfSiDeQdM25KCwud1GJn0mSUuNbobkxEJNSS1my
 QMcH8MW8j3HePQ+3lVx5dtnm1phfslKegw81BTBr46hr5pZC5SSmAI5/7SgPrnOUf73j
 XT5zLFeR7myXlMKWya90DstB4WULDrVqFBqw+N6DFI+NRueyQ8bcYunasX+uM1oEZF17
 ay+fLAuuhmH4J4HcxczCaHU6KW78UIw7xwAPFClxvpRg+k09UIbeDUajvYirLXp+IZck
 u64kJ3KAjiR+XQP0d9W5JvK2PKw/Cxn99GJYhlII+r585WtwZqbHYPHSkZEGZPmnP1lI
 148A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=y97MxFgoBqjees+drSVKeA6Szdi0VlvTHwvx0CSVO1o=;
 b=kEKYsGJ8yZRBYI3lolSeEw2OP3wu6Hjl0XFolCnT4hxbHZzAyDMixTjaxZXsDKML0+
 pqGxByIu6PGmfDrPKtG8b6EWw+d4KF1JZzKyzmO1F6OlVUV5W38XSSGqv1XO3iD7zUju
 M2/uFIlwgS5mxfnuGLrwmjOoxnHuCTD39scML4btv/qznxjZqnWE9AcW7lyn4wQEWLUr
 SIiLODXN4gZbM5BqenzYmH9JZqkRC+sa7fP2VGO0r/jCCFWx9Y4qHfylmp2mKXRMMt4V
 l4dvFeASEHCuaZUewvY57EqUbzGVCC+XwUELFSPGd6rDuikhz2FDHsjf74xI8m2sxuwb
 39uQ==
X-Gm-Message-State: APjAAAUrDr0r5bT3Hv8JhHqEVZKOxLgAPrhkLJrPBROzyBcvQfi2Oci5
 G8+x/bdhUpWhXyP8CZkE0j4=
X-Google-Smtp-Source: APXvYqwQCWsT9X5GSB/vfPatoxfMcZpIswxj18GJjMsqWR17Abi56/0ywNRUwzWqagGutEH97pd76w==
X-Received: by 2002:adf:f206:: with SMTP id p6mr51871123wro.216.1565756670312; 
 Tue, 13 Aug 2019 21:24:30 -0700 (PDT)
Received: from archlinux-threadripper ([2a01:4f8:222:2f1b::2])
 by smtp.gmail.com with ESMTPSA id j2sm2741135wmh.43.2019.08.13.21.24.29
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 13 Aug 2019 21:24:29 -0700 (PDT)
Date: Tue, 13 Aug 2019 21:24:28 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Message-ID: <20190814042428.GA125416@archlinux-threadripper>
References: <20190813061014.45015-1-natechancellor@gmail.com>
 <445d16e1-6b00-6797-82df-42a49a5e79e3@linux.intel.com>
 <20190814035947.GS12733@vkoul-mobl.Dlink>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190814035947.GS12733@vkoul-mobl.Dlink>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: clang-built-linux@googlegroups.com, Sanyog Kale <sanyog.r.kale@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH] soundwire: Don't build sound.o without
 CONFIG_ACPI
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

On Wed, Aug 14, 2019 at 09:29:47AM +0530, Vinod Koul wrote:
> On 13-08-19, 09:22, Pierre-Louis Bossart wrote:
> > On 8/13/19 1:10 AM, Nathan Chancellor wrote:
> > > clang warns when CONFIG_ACPI is unset:
> > > 
> > > ../drivers/soundwire/slave.c:16:12: warning: unused function
> > > 'sdw_slave_add' [-Wunused-function]
> > > static int sdw_slave_add(struct sdw_bus *bus,
> > >             ^
> > > 1 warning generated.
> > > 
> > > Before commit 8676b3ca4673 ("soundwire: fix regmap dependencies and
> > > align with other serial links"), this code would only be compiled when
> > > ACPI was set because it was only selected by SOUNDWIRE_INTEL, which
> > > depends on ACPI.
> > > 
> > > Now, this code can be compiled without CONFIG_ACPI, which causes the
> > > above warning. The IS_ENABLED(CONFIG_ACPI) guard could be moved to avoid
> > > compiling the function; however, slave.c only contains three functions,
> > > two of which are static. Only compile slave.o when CONFIG_ACPI is set,
> > > where it will actually be used. bus.h contains a stub for
> > > sdw_acpi_find_slaves so there will be no issues with an undefined
> > > function.
> > > 
> > > This has been build tested with CONFIG_ACPI set and unset in combination
> > > with CONFIG_SOUNDWIRE unset, built in, and a module.
> > 
> > Thanks for the patch. Do you have a .config you can share offline so that we
> > add it to our tests?
> > 
> > > 
> > > Fixes: 8676b3ca4673 ("soundwire: fix regmap dependencies and align with other serial links")
> > > Link: https://github.com/ClangBuiltLinux/linux/issues/637
> > > Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> > > ---
> > >   drivers/soundwire/Makefile | 6 +++++-
> > >   drivers/soundwire/slave.c  | 3 ---
> > >   2 files changed, 5 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/soundwire/Makefile b/drivers/soundwire/Makefile
> > > index 45b7e5001653..226090902716 100644
> > > --- a/drivers/soundwire/Makefile
> > > +++ b/drivers/soundwire/Makefile
> > > @@ -4,9 +4,13 @@
> > >   #
> > >   #Bus Objs
> > > -soundwire-bus-objs := bus_type.o bus.o slave.o mipi_disco.o stream.o
> > > +soundwire-bus-objs := bus_type.o bus.o mipi_disco.o stream.o
> > >   obj-$(CONFIG_SOUNDWIRE) += soundwire-bus.o
> > > +ifdef CONFIG_ACPI
> > > +soundwire-bus-objs += slave.o
> > > +endif
> > 
> > I am fine with the change, but we might as well rename the file acpi_slave.c
> > then?
> 
> Srini's change add support for DT for the same file, so It does not make
> sense to rename. Yes this patch tries to fix a warn which is there due
> to DT being not supported but with Srini's patches this warn should go
> away as sdw_slave_add() will be invoked by the DT counterpart
> 
> Sorry Nathan, we would have to live with the warn for few more days till
> I apply Srini's changes. So I am not taking this (or v2) patch
> 

That is fine as I can apply this locally. Could you point me to these
patches so that I can take a look at them?

Thanks for the reply!
Nathan
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
