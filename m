Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E24EF3EB411
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Aug 2021 12:32:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7AB12189A;
	Fri, 13 Aug 2021 12:31:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7AB12189A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628850761;
	bh=XdbaZK3e/Y4S1CI0OQ+z4VQ+k5YeTjMqSSJmyqWFErU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jxQ+tmXqHW8BRl0HhZAQ79HXY/yjQlEFd6+cBKgvLddUtLhxEWRIUaWS2xPX/5nQh
	 C+e5X8aSjqhy/EW90EAMNTSVqmRILZC+JsslIuOn26R0shWbswCA0NhOSlb5MHv7Ps
	 4xDg87wFlRhV9a8sJGouPKqx5xYup37yd+cyha7w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C79EAF800E5;
	Fri, 13 Aug 2021 12:31:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 29E25F802D2; Fri, 13 Aug 2021 12:31:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 518F2F800E5
 for <alsa-devel@alsa-project.org>; Fri, 13 Aug 2021 12:31:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 518F2F800E5
X-IronPort-AV: E=McAfee;i="6200,9189,10074"; a="301125184"
X-IronPort-AV: E=Sophos;i="5.84,318,1620716400"; d="scan'208";a="301125184"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2021 03:31:00 -0700
X-IronPort-AV: E=Sophos;i="5.84,318,1620716400"; d="scan'208";a="674271543"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2021 03:30:58 -0700
Received: from andy by smile with local (Exim 4.94.2)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1mEUSi-00924n-6I; Fri, 13 Aug 2021 13:30:52 +0300
Date: Fri, 13 Aug 2021 13:30:52 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v2 0/8] ASoC: Intel: boards: use software node API
Message-ID: <YRZJ3LxkwUkX++Jp@smile.fi.intel.com>
References: <20210812224443.170144-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210812224443.170144-1-pierre-louis.bossart@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: tiwai@suse.de, Hans de Goede <hdegoede@redhat.com>,
 alsa-devel@alsa-project.org, broonie@kernel.org,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
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

On Thu, Aug 12, 2021 at 05:44:35PM -0500, Pierre-Louis Bossart wrote:
> This is an update on an earlier contribution from Heikki Krogerus
> 
> The function device_add_properties() is going to be removed.
> Replacing it with software node API equivalents.
> 
> Thanks for Hans de Goede and Andy Shevchenko for their comments,
> suggestions and Reviewed-by tags on GitHub. The review thread can be
> found at https://github.com/thesofproject/linux/pull/3041)

For all non-commented
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> v2 changes: feedback from Andy and Hans
> Better error handling
> Codec reference is kept until the .remove callback
> Remove bus search to find device
> 
> v1 changes from Heikki's patches:
> Avoid the use of devm_ routines for Baytrail machine drivers.
> 
> Heikki Krogerus (1):
>   ASoC: Intel: boards: use software node API in Atom boards
> 
> Pierre-Louis Bossart (7):
>   ASoC: Intel: boards: harden codec property handling
>   ASoC: Intel: boards: handle errors with acpi_dev_get_first_match_dev()
>   ASoC: Intel: boards: get codec device with ACPI instead of bus search
>   ASoC: Intel: sof_sdw: pass card information to init/exit functions
>   ASoC: Intel: sof_sdw_rt711*: keep codec device reference until remove
>   ASoC: Intel: use software node API in SoundWire machines
>   ASoC: Intel: remove device_properties for Atom boards
> 
>  sound/soc/intel/boards/bytcht_es8316.c      | 31 ++++++++--
>  sound/soc/intel/boards/bytcr_rt5640.c       | 57 ++++++++++++++-----
>  sound/soc/intel/boards/bytcr_rt5651.c       | 63 ++++++++++++++-------
>  sound/soc/intel/boards/sof_sdw.c            | 20 ++++---
>  sound/soc/intel/boards/sof_sdw_common.h     | 37 +++++++-----
>  sound/soc/intel/boards/sof_sdw_max98373.c   |  3 +-
>  sound/soc/intel/boards/sof_sdw_rt1308.c     |  3 +-
>  sound/soc/intel/boards/sof_sdw_rt1316.c     |  3 +-
>  sound/soc/intel/boards/sof_sdw_rt5682.c     |  3 +-
>  sound/soc/intel/boards/sof_sdw_rt700.c      |  3 +-
>  sound/soc/intel/boards/sof_sdw_rt711.c      | 51 +++++++++--------
>  sound/soc/intel/boards/sof_sdw_rt711_sdca.c | 52 +++++++++--------
>  sound/soc/intel/boards/sof_sdw_rt715.c      |  3 +-
>  sound/soc/intel/boards/sof_sdw_rt715_sdca.c |  3 +-
>  14 files changed, 221 insertions(+), 111 deletions(-)
> 
> -- 
> 2.25.1
> 

-- 
With Best Regards,
Andy Shevchenko


