Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E51009A7C5
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Aug 2019 08:47:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5498486F;
	Fri, 23 Aug 2019 08:46:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5498486F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566542842;
	bh=AU/aQO4tEPk5dFVtO9W7lh0IvCJ43azDDdJur70UeOc=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Dqcoa4w0XymmtoYiF2QEpvNB+FWfimfuc4gXZuNrX8eyNddgsEKL2qh9u1wwjTlpy
	 7DzVfWNrAu3uHmWtvohqSBjUGMvfpQM1CMwzC2UcjIyxVU3NkcBK7O02gzZJJfTpm6
	 dB01+xbWPPqSTCV2+SnUgtBHgVzckUrDX4nCj6VA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6773AF8014A;
	Fri, 23 Aug 2019 08:45:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50810F802FB; Fri, 23 Aug 2019 08:45:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 71992F8014A
 for <alsa-devel@alsa-project.org>; Fri, 23 Aug 2019 08:45:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71992F8014A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="U8wyb94o"
Received: from localhost (unknown [106.200.210.161])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9173322CEC;
 Fri, 23 Aug 2019 06:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566542729;
 bh=RD4wwXaEVvl7Pb39QxEhxwdKqJW6ucyEsdVbg5nBR2o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=U8wyb94oGuWbzdpNGDHD8XaYCk4UupJKP10qYmx2SysXXRrC6pbbUHvwJY1BMrFcd
 WdlOLeEWFloEy1ew41PYSwLf3IqqL9qy8E6tOMxVbFDKsYCHVayob2I3P837Mp9wCi
 xPOQUplW+tvNOrPOkkXZ2u4UiAtUkVet2IeUT3q4=
Date: Fri, 23 Aug 2019 12:14:17 +0530
From: Vinod Koul <vkoul@kernel.org>
To: YueHaibing <yuehaibing@huawei.com>
Message-ID: <20190823064417.GC2672@vkoul-mobl>
References: <20190816141409.49940-1-yuehaibing@huawei.com>
 <20190822145408.76272-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190822145408.76272-1-yuehaibing@huawei.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Cc: sanyog.r.kale@intel.com, ladis@linux-mips.org,
 pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH v2 -next] soundwire: Fix -Wunused-function
	warning
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

On 22-08-19, 22:54, YueHaibing wrote:
> If CONFIG_ACPI is not set, gcc warning this:
> 
> drivers/soundwire/slave.c:16:12: warning:
>  'sdw_slave_add' defined but not used [-Wunused-function]
> 
> Now all code in slave.c is only used on ACPI enabled,
> so compiles it while CONFIG_ACPI is set.

Sorry YueHaibing as I have said to other patch doing this, this slave.c
is acpi specific but Srini has already send DT support for this so it
doesn't become acpi only and this warn also goes away. We should get the
DT support soon

> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Suggested-by: Ladislav Michl <ladis@linux-mips.org>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
> v2: use obj-$(CONFIG_ACPI) += slave.o
> ---
>  drivers/soundwire/Makefile | 3 ++-
>  drivers/soundwire/slave.c  | 3 ---
>  2 files changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/soundwire/Makefile b/drivers/soundwire/Makefile
> index 45b7e50..a28bf3e 100644
> --- a/drivers/soundwire/Makefile
> +++ b/drivers/soundwire/Makefile
> @@ -4,8 +4,9 @@
>  #
>  
>  #Bus Objs
> -soundwire-bus-objs := bus_type.o bus.o slave.o mipi_disco.o stream.o
> +soundwire-bus-objs := bus_type.o bus.o mipi_disco.o stream.o
>  obj-$(CONFIG_SOUNDWIRE) += soundwire-bus.o
> +obj-$(CONFIG_ACPI) += slave.o
>  
>  #Cadence Objs
>  soundwire-cadence-objs := cadence_master.o
> diff --git a/drivers/soundwire/slave.c b/drivers/soundwire/slave.c
> index f39a581..0dc188e 100644
> --- a/drivers/soundwire/slave.c
> +++ b/drivers/soundwire/slave.c
> @@ -60,7 +60,6 @@ static int sdw_slave_add(struct sdw_bus *bus,
>  	return ret;
>  }
>  
> -#if IS_ENABLED(CONFIG_ACPI)
>  /*
>   * sdw_acpi_find_slaves() - Find Slave devices in Master ACPI node
>   * @bus: SDW bus instance
> @@ -110,5 +109,3 @@ int sdw_acpi_find_slaves(struct sdw_bus *bus)
>  
>  	return 0;
>  }
> -
> -#endif
> -- 
> 2.7.4
> 

-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
