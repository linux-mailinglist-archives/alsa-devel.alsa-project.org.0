Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81FD07CFC61
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Oct 2023 16:23:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D358C1D7;
	Thu, 19 Oct 2023 16:22:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D358C1D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697725405;
	bh=Wt+aX4la4eXjHv+2TrkEeyyK7itYRmgyqM39uYkX+0o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PHE2nWMF+/PFqmzglFB3kdim1/JNy9H+Czjh1dZMUQmLIH6aFXQT6bJGtoNBQtAgE
	 7HDurmMe3y3wUO6Rm03/M4b48PheacHxfUhPaEmFBCb0TsFpYC339inAB147NgqmSE
	 0EeFI+GJwYj6TzI9ruPrDdtMA1A4mFxE5yvu+A+4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5C00BF80552; Thu, 19 Oct 2023 16:22:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 23450F8024E;
	Thu, 19 Oct 2023 16:22:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1ACD6F8025F; Thu, 19 Oct 2023 16:22:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 03E30F800C9
	for <alsa-devel@alsa-project.org>; Thu, 19 Oct 2023 16:22:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03E30F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=A8H9gWoD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697725349; x=1729261349;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Wt+aX4la4eXjHv+2TrkEeyyK7itYRmgyqM39uYkX+0o=;
  b=A8H9gWoDw9uvK0uw0e/VKJOao33b+2AyFRcrnDKkVkg6T5+Qafm7inSP
   rL8FmQ8l/V03zyviUqKfhdKJP7CbEtPVQpFSTDl3SpnhHg9zxTf9l1Y83
   fCgrzWnbn9dY1B0FCStijyz6py3rFBVqSpS+RbVvaPvlLfJS+/quxNszM
   XXpL1ufNTrHMMagMJZiAEfVZlZe1Viu77c8ieTIbIoMFkg+gXBZ8okNU/
   vdQACPzAHPwuvTb9ifdn/rmdxt0cIZQeskq0B7QNq7PzsV176LStvl3Un
   lSBeMFpH9R2p84C6eMIb6eoiCA63LTReY6B623D1Uk1cB9u4qeps6rYR0
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="385136633"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200";
   d="scan'208";a="385136633"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2023 07:22:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="786402701"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200";
   d="scan'208";a="786402701"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.0.91])
 ([10.94.0.91])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2023 07:22:22 -0700
Message-ID: <7b08520e-8f36-45a1-9b7a-316a33c8e8c4@linux.intel.com>
Date: Thu, 19 Oct 2023 16:22:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] ALSA: hda: intel-dsp-config: Fix JSL Chromebook quirk
 detection
To: Mark Hasemeyer <markhas@chromium.org>, LKML <linux-kernel@vger.kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Guenter Roeck <linux@roeck-us.net>, stable@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Brady Norander <bradynorander@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org
References: <20231018235944.1860717-1-markhas@chromium.org>
Content-Language: en-US
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20231018235944.1860717-1-markhas@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 6RM7KCOFETLZ32VOZEYPTHWVYN2UCMUY
X-Message-ID-Hash: 6RM7KCOFETLZ32VOZEYPTHWVYN2UCMUY
X-MailFrom: amadeuszx.slawinski@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6RM7KCOFETLZ32VOZEYPTHWVYN2UCMUY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 10/19/2023 1:59 AM, Mark Hasemeyer wrote:
> Some Jasperlake Chromebooks overwrite the system vendor DMI value to the
> name of the OEM that manufactured the device. This breaks Chromebook
> quirk detection as it expects the system vendor to be "Google".
> 
> Add another quirk detection entry that looks for "Google" in the BIOS
> version.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Mark Hasemeyer <markhas@chromium.org>
> ---
> 
>   sound/hda/intel-dsp-config.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/sound/hda/intel-dsp-config.c b/sound/hda/intel-dsp-config.c
> index 24a948baf1bc..756fa0aa69bb 100644
> --- a/sound/hda/intel-dsp-config.c
> +++ b/sound/hda/intel-dsp-config.c
> @@ -336,6 +336,12 @@ static const struct config_entry config_table[] = {
>   					DMI_MATCH(DMI_SYS_VENDOR, "Google"),
>   				}
>   			},
> +			{
> +				.ident = "Google firmware",
> +				.matches = {
> +					DMI_MATCH(DMI_BIOS_VERSION, "Google"),
> +				}
> +			},
>   			{}
>   		}
>   	},

I would assume that platform that has DMI_SYS_VENDOR set to "Google", 
also has DMI_BIOS_VERSION set to "Google", so perhaps just replace 
DMI_SYS_VENDOR match with DMI_BIOS_VERSION, to keep table small? Or is 
that not a case?
