Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71CBA8BFC6
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Aug 2019 19:41:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 112C7166F;
	Tue, 13 Aug 2019 19:41:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 112C7166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565718112;
	bh=1VGru4AuefaDXzkChQbPiwx1uLSBhUJbeIb/TKTnBhg=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bM/yZ1/FKmSA2/+YJc4Df95ay/k8sZLmtvVoljMTG9OfS+7d3vCRBMr9rNeqtXdkg
	 my8Hdp/pnxRM/bphgfxe1T/xQt9ETzvPVnRhAW3zoR6ZvMmghrpwoBwSa9lea3unUg
	 DLXv06FHhYvX6zmbF54uXVW7YJxkCliv0H3rULvs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B3ADF80290;
	Tue, 13 Aug 2019 19:40:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F2AB3F80273; Tue, 13 Aug 2019 19:40:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 780AEF8015B
 for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2019 19:40:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 780AEF8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="pG72l78w"
Received: by mail-wm1-x343.google.com with SMTP id v19so2170678wmj.5
 for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2019 10:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=uc9OGgJkXEQLVzLUg29afYIlM/c0XiV4/R2vY7HBFgQ=;
 b=pG72l78w45KvG+5Zfl0HjCP8EGjxgk1KfJsnjgxznRwF4w1D5LvXcOLgFo+pYVhkfs
 Nue9VxhklvujK3dLfnu2yHuaCAZM5DtvwfboOLBdKfXW7IKKaQkLJTKWH5fHzfj7alEA
 T/SScbEd/AH05LrsoGDoIBr+BjZ0qhjvTQ4N3kRMK5cWqFeM2gaUNjICmMQ03qgKpSA4
 hVrWp1dyP0YoQO7mBJvCcaFVcNPw/YjFDgfDdNzcUE5b9uEQgiDG+IyDHVDD+b+wM9oG
 QIcLRIEq2uVLGaEODfRK6a4REB511/ORaq63o86p45jGlGMbPhpactqgqudLEf7ZcXk+
 En1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=uc9OGgJkXEQLVzLUg29afYIlM/c0XiV4/R2vY7HBFgQ=;
 b=I5UzWziZLGvLRYwUaWPYXVKtII0BPxW6UGkjYRJNfoHgCRVmQQgR9leHYJk+C2emEz
 DrLSn8+8CxlOgrzHNZV42viXfdheVfnhmz/XJWjV8a93g/hL30i8U/VzSrSBhUPk/W8p
 LYVh6/gzpFoQixCdBuEeCDWybWUZg9XK7kZHZ152Vy1MSouddcBQfjrclGPN2s70XGY9
 kIbathS33RrMIaErv79ZiJDWfHXkeL88G8wUn4Tu3GNVfK472BiM2kT0jvpQUEC+BX9W
 qq1kM+EVzkUHi7qOa3+Ahxgmpt3GLTnXorh5IcuCm6KgnIEi832d3owtYnfj9p+yttGD
 Rbfg==
X-Gm-Message-State: APjAAAWUIj7qWRHOz62XivmCtmumc9c/9If56yWshOK1L/1EvjbXPe+l
 NrsghMPopVhHQYa2XuGW6Kk=
X-Google-Smtp-Source: APXvYqy3XERKihuiXKn39bAzfUK9rYQJ6WpUYbDKEj6CpD/ldDppvP6u6aC12tO0Kz+zhhtUvsSaUA==
X-Received: by 2002:a7b:c0d0:: with SMTP id s16mr4240596wmh.65.1565718000233; 
 Tue, 13 Aug 2019 10:40:00 -0700 (PDT)
Received: from archlinux-threadripper ([2a01:4f8:222:2f1b::2])
 by smtp.gmail.com with ESMTPSA id s2sm1566914wmj.33.2019.08.13.10.39.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Aug 2019 10:39:59 -0700 (PDT)
Date: Tue, 13 Aug 2019 10:39:57 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190813173957.GA96879@archlinux-threadripper>
References: <20190813061014.45015-1-natechancellor@gmail.com>
 <445d16e1-6b00-6797-82df-42a49a5e79e3@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <445d16e1-6b00-6797-82df-42a49a5e79e3@linux.intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: clang-built-linux@googlegroups.com, Vinod Koul <vkoul@kernel.org>,
 Sanyog Kale <sanyog.r.kale@intel.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

On Tue, Aug 13, 2019 at 09:22:29AM -0500, Pierre-Louis Bossart wrote:
> On 8/13/19 1:10 AM, Nathan Chancellor wrote:
> > clang warns when CONFIG_ACPI is unset:
> > 
> > ../drivers/soundwire/slave.c:16:12: warning: unused function
> > 'sdw_slave_add' [-Wunused-function]
> > static int sdw_slave_add(struct sdw_bus *bus,
> >             ^
> > 1 warning generated.
> > 
> > Before commit 8676b3ca4673 ("soundwire: fix regmap dependencies and
> > align with other serial links"), this code would only be compiled when
> > ACPI was set because it was only selected by SOUNDWIRE_INTEL, which
> > depends on ACPI.
> > 
> > Now, this code can be compiled without CONFIG_ACPI, which causes the
> > above warning. The IS_ENABLED(CONFIG_ACPI) guard could be moved to avoid
> > compiling the function; however, slave.c only contains three functions,
> > two of which are static. Only compile slave.o when CONFIG_ACPI is set,
> > where it will actually be used. bus.h contains a stub for
> > sdw_acpi_find_slaves so there will be no issues with an undefined
> > function.
> > 
> > This has been build tested with CONFIG_ACPI set and unset in combination
> > with CONFIG_SOUNDWIRE unset, built in, and a module.
> 
> Thanks for the patch. Do you have a .config you can share offline so that we
> add it to our tests?

I just took the arm64 defconfig and deleted CONFIG_ACPI and added
CONFIG_SOUNDWIRE=y or =m to produce this warning. I initially found this
on an arm64 allyesconfig build.

> 
> > 
> > Fixes: 8676b3ca4673 ("soundwire: fix regmap dependencies and align with other serial links")
> > Link: https://github.com/ClangBuiltLinux/linux/issues/637
> > Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> > ---
> >   drivers/soundwire/Makefile | 6 +++++-
> >   drivers/soundwire/slave.c  | 3 ---
> >   2 files changed, 5 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/soundwire/Makefile b/drivers/soundwire/Makefile
> > index 45b7e5001653..226090902716 100644
> > --- a/drivers/soundwire/Makefile
> > +++ b/drivers/soundwire/Makefile
> > @@ -4,9 +4,13 @@
> >   #
> >   #Bus Objs
> > -soundwire-bus-objs := bus_type.o bus.o slave.o mipi_disco.o stream.o
> > +soundwire-bus-objs := bus_type.o bus.o mipi_disco.o stream.o
> >   obj-$(CONFIG_SOUNDWIRE) += soundwire-bus.o
> > +ifdef CONFIG_ACPI
> > +soundwire-bus-objs += slave.o
> > +endif
> 
> I am fine with the change, but we might as well rename the file acpi_slave.c
> then?

Sure, I can do that rename and send a v2.

> 
> > +
> >   #Cadence Objs
> >   soundwire-cadence-objs := cadence_master.o
> >   obj-$(CONFIG_SOUNDWIRE_CADENCE) += soundwire-cadence.o
> > diff --git a/drivers/soundwire/slave.c b/drivers/soundwire/slave.c
> > index f39a5815e25d..0dc188e6873b 100644
> > --- a/drivers/soundwire/slave.c
> > +++ b/drivers/soundwire/slave.c
> > @@ -60,7 +60,6 @@ static int sdw_slave_add(struct sdw_bus *bus,
> >   	return ret;
> >   }
> > -#if IS_ENABLED(CONFIG_ACPI)
> >   /*
> >    * sdw_acpi_find_slaves() - Find Slave devices in Master ACPI node
> >    * @bus: SDW bus instance
> > @@ -110,5 +109,3 @@ int sdw_acpi_find_slaves(struct sdw_bus *bus)
> >   	return 0;
> >   }
> > -
> > -#endif
> > 
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
