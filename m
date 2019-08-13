Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5303C8C246
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Aug 2019 22:43:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B3AB11657;
	Tue, 13 Aug 2019 22:43:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B3AB11657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565729036;
	bh=/gdoOe0XWoRwMoE6xDpl5K0FvVE9rXgVMlLglMTrxPM=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aTnZsiHhLQYcGMiTA+80D98oFKG2zn2yfGKYE9yR8phiSBHoyE1MMb3x9Oc77ONSJ
	 QhiFU45P7foPeSZ6zHbr2nSpi945EtXVUDmC4h7xAyXQFnT5g2XAhktabrvwvlmLum
	 +ZlCXHrZSt4Lghbs7BOHce2398e4ThUKfPZHw9Ag=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DCA0DF80273;
	Tue, 13 Aug 2019 22:42:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 038CDF80273; Tue, 13 Aug 2019 22:42:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 02AA5F8015B
 for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2019 22:42:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02AA5F8015B
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Aug 2019 13:41:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,382,1559545200"; d="scan'208";a="327788899"
Received: from ccalgarr-mobl.amr.corp.intel.com (HELO [10.252.205.92])
 ([10.252.205.92])
 by orsmga004.jf.intel.com with ESMTP; 13 Aug 2019 13:41:59 -0700
To: Nathan Chancellor <natechancellor@gmail.com>,
 Vinod Koul <vkoul@kernel.org>, Sanyog Kale <sanyog.r.kale@intel.com>
References: <20190813061014.45015-1-natechancellor@gmail.com>
 <20190813180929.22497-1-natechancellor@gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <4961bd17-c053-f630-423d-f6a945c8d92c@linux.intel.com>
Date: Tue, 13 Aug 2019 15:41:58 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190813180929.22497-1-natechancellor@gmail.com>
Content-Language: en-US
Cc: clang-built-linux@googlegroups.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH v2] soundwire: Make slave.o depend on ACPI
 and rename to acpi_slave.o
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 8/13/19 1:09 PM, Nathan Chancellor wrote:
> clang warns when CONFIG_ACPI is unset:
> 
> ../drivers/soundwire/slave.c:16:12: warning: unused function
> 'sdw_slave_add' [-Wunused-function]
> static int sdw_slave_add(struct sdw_bus *bus,
>             ^
> 1 warning generated.
> 
> Before commit 8676b3ca4673 ("soundwire: fix regmap dependencies and
> align with other serial links"), this code would only be compiled when
> ACPI was set because it was only selected by SOUNDWIRE_INTEL, which
> depends on ACPI.
> 
> Now, this code can be compiled without CONFIG_ACPI, which causes the
> above warning. The IS_ENABLED(CONFIG_ACPI) guard could be moved to avoid
> compiling the function; however, slave.c only contains three functions,
> two of which are static. Since slave.c is completetely dependent on
> ACPI, rename it to acpi_slave.c and only compile it when CONFIG_ACPI
> is set so sdw_acpi_find_slaves will actually be used. bus.h contains
> a stub for sdw_acpi_find_slaves so there will be no issues with an
> undefined function.
> 
> This has been build tested with CONFIG_ACPI set and unset in combination
> with CONFIG_SOUNDWIRE unset, built in, and a module.
> 
> Fixes: 8676b3ca4673 ("soundwire: fix regmap dependencies and align with other serial links")
> Link: https://github.com/ClangBuiltLinux/linux/issues/637
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>

Sounds good, thanks for the fix.

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
> 
> v1 -> v2:
> 
> * Rename slave.o to acpi_slave.o
> * Reword commit message to reflect this
> 
>   drivers/soundwire/Makefile                  | 6 +++++-
>   drivers/soundwire/{slave.c => acpi_slave.c} | 3 ---
>   2 files changed, 5 insertions(+), 4 deletions(-)
>   rename drivers/soundwire/{slave.c => acpi_slave.c} (98%)
> 
> diff --git a/drivers/soundwire/Makefile b/drivers/soundwire/Makefile
> index 45b7e5001653..718d8dd0ac79 100644
> --- a/drivers/soundwire/Makefile
> +++ b/drivers/soundwire/Makefile
> @@ -4,9 +4,13 @@
>   #
>   
>   #Bus Objs
> -soundwire-bus-objs := bus_type.o bus.o slave.o mipi_disco.o stream.o
> +soundwire-bus-objs := bus_type.o bus.o mipi_disco.o stream.o
>   obj-$(CONFIG_SOUNDWIRE) += soundwire-bus.o
>   
> +ifdef CONFIG_ACPI
> +soundwire-bus-objs += acpi_slave.o
> +endif
> +
>   #Cadence Objs
>   soundwire-cadence-objs := cadence_master.o
>   obj-$(CONFIG_SOUNDWIRE_CADENCE) += soundwire-cadence.o
> diff --git a/drivers/soundwire/slave.c b/drivers/soundwire/acpi_slave.c
> similarity index 98%
> rename from drivers/soundwire/slave.c
> rename to drivers/soundwire/acpi_slave.c
> index f39a5815e25d..0dc188e6873b 100644
> --- a/drivers/soundwire/slave.c
> +++ b/drivers/soundwire/acpi_slave.c
> @@ -60,7 +60,6 @@ static int sdw_slave_add(struct sdw_bus *bus,
>   	return ret;
>   }
>   
> -#if IS_ENABLED(CONFIG_ACPI)
>   /*
>    * sdw_acpi_find_slaves() - Find Slave devices in Master ACPI node
>    * @bus: SDW bus instance
> @@ -110,5 +109,3 @@ int sdw_acpi_find_slaves(struct sdw_bus *bus)
>   
>   	return 0;
>   }
> -
> -#endif
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
