Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ACEFC8DC9
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Oct 2019 18:08:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07879167B;
	Wed,  2 Oct 2019 18:07:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07879167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570032489;
	bh=fU0PWvsqmI0Xk649BzK0J7pFjbkVs6zk/ShfMq4MEjc=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e0O8b+WMgY6nLRkxzW+SrUvex5oHsvugtyKMs5+sNdMFQ+ufLzxbajpq1wAcm7lzM
	 9fKovLl1EuloapVT4RZjI3QJYG6WWl/sZdwN+hlZHzscfUEzbGHdDftM3xwCLoq6l5
	 6ldiCnxSEqtkkyY7zFc5ZcXfebN/E62XzyUAEWQQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 591ABF80377;
	Wed,  2 Oct 2019 18:06:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1DDA6F80391; Wed,  2 Oct 2019 18:06:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BBE13F8016F
 for <alsa-devel@alsa-project.org>; Wed,  2 Oct 2019 18:06:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BBE13F8016F
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Oct 2019 09:06:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,249,1566889200"; d="scan'208";a="185597189"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga008.jf.intel.com with ESMTP; 02 Oct 2019 09:06:15 -0700
Received: from abapat-mobl1.amr.corp.intel.com (unknown [10.251.1.101])
 by linux.intel.com (Postfix) with ESMTP id D54FE5803E4;
 Wed,  2 Oct 2019 09:06:14 -0700 (PDT)
To: Michal Suchanek <msuchanek@suse.de>, alsa-devel@alsa-project.org
References: <20191002081717.GA4015@kitsune.suse.cz>
 <91e2fc425e0dea92d7f131da890e52af273de36c.1570005196.git.msuchanek@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <c0b00292-2529-135d-8282-974684508396@linux.intel.com>
Date: Wed, 2 Oct 2019 11:06:14 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <91e2fc425e0dea92d7f131da890e52af273de36c.1570005196.git.msuchanek@suse.de>
Content-Language: en-US
Cc: Sanyog Kale <sanyog.r.kale@intel.com>, Vinod Koul <vkoul@kernel.org>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH 2/2] soundwire: depend on ACPI || OF
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

On 10/2/19 3:33 AM, Michal Suchanek wrote:
> Now devicetree is supposrted for probing sondwire as well.

typos...

also it'd be simpler to squash the two patches together and add in the 
commit message a mention that the s390 builds without ACPI and without OF.

> 
> Fixes: a2e484585ad3 ("soundwire: core: add device tree support for slave devices")
> Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> ---
>   drivers/soundwire/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soundwire/Kconfig b/drivers/soundwire/Kconfig
> index c73bfbaa2659..c8c80df090d1 100644
> --- a/drivers/soundwire/Kconfig
> +++ b/drivers/soundwire/Kconfig
> @@ -5,7 +5,7 @@
>   
>   menuconfig SOUNDWIRE
>   	tristate "SoundWire support"
> -	depends on ACPI
> +	depends on ACPI || OF
>   	help
>   	  SoundWire is a 2-Pin interface with data and clock line ratified
>   	  by the MIPI Alliance. SoundWire is used for transporting data
> 

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
