Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F834B10AB
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Feb 2022 15:43:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BEC85192B;
	Thu, 10 Feb 2022 15:42:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BEC85192B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644504199;
	bh=oKLvFFIPOkAhwdM4DVcD44a/FjVoxptg+i1dfhscPkk=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XjbczmI9D0UVum3kIsF/pbQeVsvs8mri7+sqQzGkg2ocpkKgddjXTMSZFH5JV+suG
	 lqUzGb+ZwHRiFV2F8lLy3BiIpExaKPkTL+y8N2Uh1VX+Z8+3OzyRc7ZsoxiA1lXKJg
	 rPFkuYwJ2c83YBAMzBtfmCjrtoEhYKjrOmUTtwpY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ADF13F80302;
	Thu, 10 Feb 2022 15:42:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 250AFF8028B; Thu, 10 Feb 2022 15:42:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 11587F800A7
 for <alsa-devel@alsa-project.org>; Thu, 10 Feb 2022 15:41:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11587F800A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Pi/zUK9i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644504121; x=1676040121;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=oKLvFFIPOkAhwdM4DVcD44a/FjVoxptg+i1dfhscPkk=;
 b=Pi/zUK9i5nXh4b+q534NExNHqJmV8mmVxwsaqKrumD99+tHUUt82p4zK
 0nqv7ANM/ONpp8rdp0LXEPWFz45UzouICdEuCNZ0TjjlqhCggR4wTGttV
 UqUl2HkonCwlY1L/2/HkSTZ44BYxx6T1WZdkJXaWQ90uWp7JBciB+vVuU
 5MuthYEmF1Hd8IEZTJBV+JGisuXmWKXYjhj6WCGRZWUQqpRx7JY4UBfUx
 vHqlAHNjS/IyaGA/ke4KsPwNq8E82XRT9N9rullT/LYVsHuodErwqzmwo
 eGDPdCufXLdtjHMyOT/tu2+5HLv84zZtsrGlPc7yH5qF4qhi4q4zNe0uH w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10253"; a="310240972"
X-IronPort-AV: E=Sophos;i="5.88,359,1635231600"; d="scan'208";a="310240972"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2022 06:41:52 -0800
X-IronPort-AV: E=Sophos;i="5.88,359,1635231600"; d="scan'208";a="679165836"
Received: from barabano-mobl.ccr.corp.intel.com (HELO [10.252.41.18])
 ([10.252.41.18])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2022 06:41:49 -0800
Message-ID: <cc1598d7-5029-197c-9abc-49043fdc11ed@linux.intel.com>
Date: Thu, 10 Feb 2022 16:41:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH 9/9] ASoC: SOF: Convert the generic probe support to SOF
 client
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20220210105519.19795-1-peter.ujfalusi@linux.intel.com>
 <20220210105519.19795-10-peter.ujfalusi@linux.intel.com>
 <YgUZKgPacRNrFk/e@sirena.org.uk>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <YgUZKgPacRNrFk/e@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 kai.vehmanen@linux.intel.com, linux-kernel@vger.kernel.org, tiwai@suse.com,
 ranjani.sridharan@linux.intel.com, lgirdwood@gmail.com,
 fred.oh@linux.intel.com, daniel.baluta@nxp.com
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



On 10/02/2022 15:54, Mark Brown wrote:
> On Thu, Feb 10, 2022 at 12:55:19PM +0200, Peter Ujfalusi wrote:
>> Add a new client driver for probes support and move
>> all the probes-related code from the core to the
>> client driver.
> 
> This breaks an x86 allmodconfig build:
> 
> /mnt/kernel/sound/soc/sof/compress.c: In function 'create_page_table':
> /mnt/kernel/sound/soc/sof/compress.c:87:9: error: implicit declaration of function 'snd_sof_create_page_table'; did you mean 'create_page_table'? [-Werror=implicit-function-declaration]
>    87 |  return snd_sof_create_page_table(component->dev, dmab,
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>       |         create_page_table

Interesting, we have this under constant builds for months and we
certainly are building things as modules.

Let me check and fix this.

-- 
Péter
