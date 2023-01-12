Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E09F6667924
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Jan 2023 16:25:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E76191E7;
	Thu, 12 Jan 2023 16:24:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E76191E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673537131;
	bh=h/jmBfUIardPjEK19fEEdz739eyHPFiYa2jLT9jegNc=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Jv/E2JWrmpsgB5+HssEyYEigY+t2uHeS2bj7+S3k/tWtW8zoA20ZfDkIfBUayzleu
	 b0znQiXKn/FCEHrF2gTIWBgl6YfddJ50lFMZW78HkFGYEaLoguVcTca+3hFOdhUmxY
	 bjpMrxVSqOx4pjLvETwLYf6lZWvtMdrmQeTZ1tfA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E4DFF80557;
	Thu, 12 Jan 2023 16:23:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2758F804BD; Thu, 12 Jan 2023 16:23:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 60C54F804DC
 for <alsa-devel@alsa-project.org>; Thu, 12 Jan 2023 16:23:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60C54F804DC
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=nn1D851f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673536997; x=1705072997;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=h/jmBfUIardPjEK19fEEdz739eyHPFiYa2jLT9jegNc=;
 b=nn1D851fzQ9c5I61jPWO/8dVi+CcnclNTAMD43M+q2uxLYLykLX+1Syw
 pyEDuZaALjeafqVgW7PV5i1Tc0modd4lebXdkeJMhZ3R4PrwBa/mEUzSw
 5GcKKIf4NF5VJofNO6Kr4us780VY8EjrW9SCqUwOVNXYoUSsjrP125ice
 1lxXypzSlECAy0P0QEEnBWTueAjdQyCiMd6r7EwiJuF5WGCh17aL0/b0m
 ETHm30DFwDw5KW6CPUL2obUoOuf0hTkqwXaB/yqeqMBrJrR3+Z8VZjDrA
 /mniTFAUEFL+8EMRJN6qAX4r2I1npFQHv2QT8vm0uw6PCUfmI9jfMG3T1 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="388212598"
X-IronPort-AV: E=Sophos;i="5.97,211,1669104000"; d="scan'208";a="388212598"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2023 06:57:17 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="607816951"
X-IronPort-AV: E=Sophos;i="5.97,211,1669104000"; d="scan'208";a="607816951"
Received: from jbetan3x-mobl1.amr.corp.intel.com (HELO [10.209.143.163])
 ([10.209.143.163])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2023 06:57:16 -0800
Message-ID: <dae0ce3e-8538-f0ed-d065-464c6c2b8c6e@linux.intel.com>
Date: Thu, 12 Jan 2023 08:56:28 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [PATCH v2 0/5] ASoC: Intel: Balance ACPI device refcount
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
References: <20230112112852.67714-1-andriy.shevchenko@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230112112852.67714-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 1/12/23 05:28, Andy Shevchenko wrote:
> While looking for the open coded put_device(&adev->dev) cases, where
> adev stands for ACPI device, I noticed that in a few ASoC Intel driver,
> among others, the refcount is not balanced properly in some cases.
> 
> This series fixes that issue and converts to use acpi_dev_put().

Thanks Andy!

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> 
> Changelog v2:
> - split Intel drivers out from others (Pierre)
> - sent with cover letter (Mark)
> 
> Andy Shevchenko (5):
>   ASoC: Intel: bytcht_es8316: Drop reference count of ACPI device after
>     use
>   ASoC: Intel: bytcr_rt5651: Drop reference count of ACPI device after
>     use
>   ASoC: Intel: bytcr_rt5640: Drop reference count of ACPI device after
>     use
>   ASoC: Intel: bytcr_wm5102: Drop reference count of ACPI device after
>     use
>   ASoC: Intel: sof_es8336: Drop reference count of ACPI device after use
> 
>  sound/soc/intel/boards/bytcht_es8316.c | 20 ++++++++++++--------
>  sound/soc/intel/boards/bytcr_rt5640.c  | 12 ++++++------
>  sound/soc/intel/boards/bytcr_rt5651.c  |  2 +-
>  sound/soc/intel/boards/bytcr_wm5102.c  |  2 +-
>  sound/soc/intel/boards/sof_es8336.c    | 14 ++++++++------
>  5 files changed, 28 insertions(+), 22 deletions(-)
> 
