Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F33CA8CA03
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Aug 2019 06:02:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85C52169C;
	Wed, 14 Aug 2019 06:02:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85C52169C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565755378;
	bh=bxuylk1NsDIiTGHWpO692tEIEUlySvbj2vL3QotEZkw=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ayigu/8HRVKf6oxrZIB4qxU/P2WOQLsnoROkfbyvIv83lqbHK6ydupwJPgyjK0tSg
	 lKBEKDxGkjZWv/gP5Xcpy1t/2qrmUXbvgZFlasEf53UEinNjcw+KFNUoqNoz4lGqxi
	 zhVfcIMjusb1ZN5X9EuVqOnjJm34YLoBijp62s+4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F03A2F80268;
	Wed, 14 Aug 2019 06:01:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 67548F80214; Wed, 14 Aug 2019 06:01:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6CE72F8015B
 for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2019 06:01:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6CE72F8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ONnlQGzs"
Received: from localhost (unknown [106.51.111.160])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9C3262083B;
 Wed, 14 Aug 2019 04:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565755265;
 bh=KjGrHL3n1w6JAxO6p8Ca0jjy6JRrEniuOLnYntqmCG8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ONnlQGzsDHaZJiA2scjuNH9O0USpNDO8H5fBeieKfzd62tzRnCLZRfClpKloYexhC
 JTe+tt1VBfK9HlRdchAkZptcmFkpy+LgzmBQBkCV0BkrOLWrVJHuZteA1Nnn5JLFf7
 eZXb3AkHvZ1RDMUgS4VSWEpTMJj+dWrtj6QCKu3g=
Date: Wed, 14 Aug 2019 09:29:47 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190814035947.GS12733@vkoul-mobl.Dlink>
References: <20190813061014.45015-1-natechancellor@gmail.com>
 <445d16e1-6b00-6797-82df-42a49a5e79e3@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <445d16e1-6b00-6797-82df-42a49a5e79e3@linux.intel.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Cc: clang-built-linux@googlegroups.com,
 Nathan Chancellor <natechancellor@gmail.com>,
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

On 13-08-19, 09:22, Pierre-Louis Bossart wrote:
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

Srini's change add support for DT for the same file, so It does not make
sense to rename. Yes this patch tries to fix a warn which is there due
to DT being not supported but with Srini's patches this warn should go
away as sdw_slave_add() will be invoked by the DT counterpart

Sorry Nathan, we would have to live with the warn for few more days till
I apply Srini's changes. So I am not taking this (or v2) patch

Thanks

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

-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
