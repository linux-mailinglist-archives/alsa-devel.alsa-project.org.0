Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA2274ED3
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jul 2019 15:08:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5750D16FF;
	Thu, 25 Jul 2019 15:08:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5750D16FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564060132;
	bh=tsVqLxYRwpP/WK9RRe4eWuisxr27wj/dY3GpS6klzdQ=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uVC8xPaxJvJv+++tXQTJWXj+BGDu+rAtmzTQo/sNrHZJ3vDgWhp4z9U+ZJTZvqa36
	 dtJfggsGHWmJDYP6wqkH7QqpHTqOqvSTeo3uHkMODBrHo0S8ZJNKiI1CKqU7KzQYfe
	 kWk0s/7yPezcB5BevcNPPBxntWsddLg+HHNHcjGs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 72399F80392;
	Thu, 25 Jul 2019 15:07:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F30B6F803D0; Thu, 25 Jul 2019 15:07:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 24640F8015A
 for <alsa-devel@alsa-project.org>; Thu, 25 Jul 2019 15:07:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24640F8015A
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Jul 2019 06:07:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,306,1559545200"; d="scan'208";a="160900541"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga007.jf.intel.com with ESMTP; 25 Jul 2019 06:07:00 -0700
Received: from xiliu-mobl1.amr.corp.intel.com (unknown [10.252.200.163])
 by linux.intel.com (Postfix) with ESMTP id 027355803FA;
 Thu, 25 Jul 2019 06:06:59 -0700 (PDT)
To: Jaroslav Kysela <perex@perex.cz>,
 ALSA development <alsa-devel@alsa-project.org>
References: <20190725110808.19938-1-perex@perex.cz>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <e7e3f5b1-fc5f-8af2-c194-b4e0bd8ff23c@linux.intel.com>
Date: Thu, 25 Jul 2019 08:07:07 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190725110808.19938-1-perex@perex.cz>
Content-Language: en-US
Cc: Takashi Iwai <tiwai@suse.de>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: SOF: Makefile - fix the top-level
 kernel module names (add snd- prefix)
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

On 7/25/19 6:08 AM, Jaroslav Kysela wrote:
> Use the proper module name. The objs assignments are already there.

Good catch, I've been using these module names blindly in our test 
scripts without noticing this.
Thanks for the correction


> Signed-off-by: Jaroslav Kysela <perex@perex.cz>
> Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>
> Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Cc: Takashi Iwai <tiwai@suse.de>
> Cc: Mark Brown <broonie@kernel.org>0
> ---
>   sound/soc/sof/Makefile | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/sof/Makefile b/sound/soc/sof/Makefile
> index 8f14c9d2950b..d2f7a1bc09a1 100644
> --- a/sound/soc/sof/Makefile
> +++ b/sound/soc/sof/Makefile
> @@ -11,8 +11,8 @@ obj-$(CONFIG_SND_SOC_SOF) += snd-sof.o
>   obj-$(CONFIG_SND_SOC_SOF_NOCODEC) += snd-sof-nocodec.o
>   
>   
> -obj-$(CONFIG_SND_SOC_SOF_ACPI) += sof-acpi-dev.o
> -obj-$(CONFIG_SND_SOC_SOF_PCI) += sof-pci-dev.o
> +obj-$(CONFIG_SND_SOC_SOF_ACPI) += snd-sof-acpi-dev.o
> +obj-$(CONFIG_SND_SOC_SOF_PCI) += snd-sof-pci-dev.o
>   
>   obj-$(CONFIG_SND_SOC_SOF_INTEL_TOPLEVEL) += intel/
>   obj-$(CONFIG_SND_SOC_SOF_XTENSA) += xtensa/
> 

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
