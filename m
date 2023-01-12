Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 302886670D3
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Jan 2023 12:25:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CABCA8B0F;
	Thu, 12 Jan 2023 12:25:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CABCA8B0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673522756;
	bh=4bLAnsOE+ifM6eaLLc0QK8S9x6WlDjUjqMkbCurEswY=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=O35KYwsXBMwutww5yLZfFQRFqNSbqJ7MB/NkHfTSJE7i2phvbPo7osFwU9locKpIV
	 cpKo0vABIY0JIynnv4TcgAzVcJy65cDA98PhhrBWFbsdEiIQUL2UfErDmvqdlrggF6
	 DkNyRiqik4LLSr2Go+e6OBciT4DmBaAdUpGrRPbE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E5B5F8016E;
	Thu, 12 Jan 2023 12:25:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 153EDF804CA; Thu, 12 Jan 2023 12:25:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C9C69F804BD
 for <alsa-devel@alsa-project.org>; Thu, 12 Jan 2023 12:25:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9C69F804BD
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ejcXjwF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673522702; x=1705058702;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=4bLAnsOE+ifM6eaLLc0QK8S9x6WlDjUjqMkbCurEswY=;
 b=ejcXjwF3qtivASb6R1ndFI5WiO326tcbv7d03x61hITB3hPU4aRNL0aT
 1H1OnSwOmVyC0mgTNsC5HyWZ0uSdEqLMPI0PhtlnrA0/rcLxLWmPLfaMo
 TGFxwoC2VR+4/nt68dxHJXiOtRG5wEfYFyEBWh+7QYU1fieESidIP7ZH+
 lfErsFtEJjEmbr5CHMKbtjWHkN5x9x4VH+PphdoQWDE19ztgETsLsDMdW
 eHQ2ofZ5M545N/PddbmFSVXMsNo4FXJPbwVGDvSol7vvpavA7yq0z9K5H
 XfnFw9KguDmvUEbldxKpS2ur5gTIb0Mp3KgddkeEyoKn9sHLoEsBzRnZO A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="325704658"
X-IronPort-AV: E=Sophos;i="5.96,319,1665471600"; d="scan'208";a="325704658"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2023 03:24:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="607750425"
X-IronPort-AV: E=Sophos;i="5.96,319,1665471600"; d="scan'208";a="607750425"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga003.jf.intel.com with ESMTP; 12 Jan 2023 03:24:50 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1pFvhP-0081D0-2K; Thu, 12 Jan 2023 13:24:47 +0200
Date: Thu, 12 Jan 2023 13:24:47 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v1 2/6] ASoC: Intel: bytcht_es8316: Drop reference count
 of ACPI device after use
Message-ID: <Y7/t/2LCY2R+nZ8e@smile.fi.intel.com>
References: <20230102203014.16041-1-andriy.shevchenko@linux.intel.com>
 <20230102203014.16041-2-andriy.shevchenko@linux.intel.com>
 <edde76c0-a444-1c3a-3541-af79897701fa@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <edde76c0-a444-1c3a-3541-af79897701fa@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, Jan 10, 2023 at 07:20:08PM -0600, Pierre-Louis Bossart wrote:
> On 1/2/23 14:30, Andy Shevchenko wrote:
> > Theoretically the device might gone if its reference count drops to 0.
> > This might be the case when we try to find the first physical node of
> > the ACPI device. We need to keep reference to it until we get a result
> > of the above mentioned call. Refactor the code to drop the reference
> > count at the correct place.
> > 
> > While at it, move to acpi_dev_put() as symmetrical call to the
> > acpi_dev_get_first_match_dev().
> > 
> > Fixes: 3c22a73fb873 ("ASoC: Intel: bytcht_es8316: fix HID handling")
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> How do we proceed for this patchset? I am happy to ack a v2 if Andy
> splits the AMD and Intel patches w/ a cover letter, but this could also
> be added directly if there is no objection.

I have split out the AMD stuff, so I will resend v2 without it and with cover
letter.

-- 
With Best Regards,
Andy Shevchenko


