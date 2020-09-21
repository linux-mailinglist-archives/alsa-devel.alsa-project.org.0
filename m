Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40186272477
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Sep 2020 15:01:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 818AB16B8;
	Mon, 21 Sep 2020 15:00:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 818AB16B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600693295;
	bh=svrj3r6JyRBmZ8VN3Nh2iqOg7zSUGfTuSDwsPvcXwr8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XL06EOgw7iqj/6Vs5MOIUVcN75KolSJmHK6CZ57FOXn77e5ll6gj+lO1c0fRHHhAV
	 Ym6qW8JZvXznlly5YPf7BZqFHUwq/bf2RrW3DlCGb8HU+0PcIibnKRJkTvUn8MzXEJ
	 QoHq0ln96qFJ9Zkj23XU8W8X+kHPgFGiN+F74bPU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A8716F80161;
	Mon, 21 Sep 2020 14:59:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EC768F80162; Mon, 21 Sep 2020 14:59:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F3B1CF8015F
 for <alsa-devel@alsa-project.org>; Mon, 21 Sep 2020 14:59:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3B1CF8015F
IronPort-SDR: k2daiR0aAl2DjBiFuVk45P5oJNPVniqwFwsRtPHyvPOjKaWhgV0AX0pfGoOyRhQ7hnXTvSEKRu
 N/w/0FvY6hQA==
X-IronPort-AV: E=McAfee;i="6000,8403,9750"; a="221963446"
X-IronPort-AV: E=Sophos;i="5.77,286,1596524400"; d="scan'208";a="221963446"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2020 05:59:42 -0700
IronPort-SDR: sS3j5H/CzRksm/RC66KPFqE0HBp2zgnsBaOjra1dxDJDZTbpD4ObRZCjoj6jjuIo4dwPWDDJZA
 nWSt/N7ie06A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,286,1596524400"; d="scan'208";a="337879149"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga008.jf.intel.com with ESMTP; 21 Sep 2020 05:59:37 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1kKLPq-000jlf-2q; Mon, 21 Sep 2020 15:59:34 +0300
Date: Mon, 21 Sep 2020 15:59:34 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [PATCH v7 03/14] ASoC: Intel: catpt: Add IPC message handlers
Message-ID: <20200921125934.GT3956970@smile.fi.intel.com>
References: <20200921115424.4105-1-cezary.rojewski@intel.com>
 <20200921115424.4105-4-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200921115424.4105-4-cezary.rojewski@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 filip.kaczmarski@intel.com, harshapriya.n@intel.com,
 gregkh@linuxfoundation.org, marcin.barlik@intel.com, zwisler@google.com,
 lgirdwood@gmail.com, tiwai@suse.com, filip.proborszcz@intel.com,
 broonie@kernel.org, amadeuszx.slawinski@linux.intel.com,
 michal.wasko@intel.com, cujomalainey@chromium.org,
 krzysztof.hejmowski@intel.com, ppapierkowski@habana.ai,
 vamshi.krishna.gopal@intel.com
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

On Mon, Sep 21, 2020 at 01:54:13PM +0200, Cezary Rojewski wrote:
> Declare global and stream IPC message handlers for all known message
> types.

...

> +int catpt_coredump(struct catpt_dev *cdev)
> +{
> +	struct catpt_dump_section_hdr *hdr;
> +	size_t dump_size, regs_size;
> +	u8 *dump, *pos;
> +	int i, j;
> +
> +	regs_size = CATPT_SHIM_REGS_SIZE;
> +	regs_size += CATPT_DMA_COUNT * CATPT_DMA_REGS_SIZE;
> +	regs_size += CATPT_SSP_COUNT * CATPT_SSP_REGS_SIZE;
> +	dump_size = resource_size(&cdev->dram);
> +	dump_size += resource_size(&cdev->iram);
> +	dump_size += regs_size;

> +	dump_size += 4 * sizeof(*hdr) + 20; /* hdrs and fw hash */

Function is full of hard coded 20s. Can you provide descriptive macro?

> +	dump = vzalloc(dump_size);
> +	if (!dump)
> +		return -ENOMEM;
> +
> +	pos = dump;
> +
> +	hdr = (struct catpt_dump_section_hdr *)pos;
> +	hdr->magic = CATPT_DUMP_MAGIC;
> +	hdr->core_id = cdev->spec->core_id;
> +	hdr->section_id = CATPT_DUMP_SECTION_ID_FILE;
> +	hdr->size = dump_size - sizeof(*hdr);
> +	pos += sizeof(*hdr);
> +
> +	for (i = j = 0; i < FW_INFO_SIZE_MAX; i++)
> +		if (cdev->ipc.config.fw_info[i] == ' ')
> +			if (++j == 4)
> +				break;

> +	for (j = ++i; j < FW_INFO_SIZE_MAX && j - i < 20; j++) {

This should have static_assert() at the place where you define both constants
(2nd is mentioned above 20).

> +		if (cdev->ipc.config.fw_info[j] == ' ')
> +			break;
> +		*(pos + j - i) = cdev->ipc.config.fw_info[j];
> +	}
> +	pos += 20;

These two for-loops should have some comment to explain what's going on.

> +	hdr = (struct catpt_dump_section_hdr *)pos;
> +	hdr->magic = CATPT_DUMP_MAGIC;
> +	hdr->core_id = cdev->spec->core_id;
> +	hdr->section_id = CATPT_DUMP_SECTION_ID_IRAM;
> +	hdr->size = resource_size(&cdev->iram);
> +	pos += sizeof(*hdr);
> +
> +	memcpy_fromio(pos, cdev->lpe_ba + cdev->iram.start, hdr->size);
> +	pos += hdr->size;
> +
> +	hdr = (struct catpt_dump_section_hdr *)pos;
> +	hdr->magic = CATPT_DUMP_MAGIC;
> +	hdr->core_id = cdev->spec->core_id;
> +	hdr->section_id = CATPT_DUMP_SECTION_ID_DRAM;
> +	hdr->size = resource_size(&cdev->dram);
> +	pos += sizeof(*hdr);
> +
> +	memcpy_fromio(pos, cdev->lpe_ba + cdev->dram.start, hdr->size);
> +	pos += hdr->size;
> +
> +	hdr = (struct catpt_dump_section_hdr *)pos;
> +	hdr->magic = CATPT_DUMP_MAGIC;
> +	hdr->core_id = cdev->spec->core_id;
> +	hdr->section_id = CATPT_DUMP_SECTION_ID_REGS;
> +	hdr->size = regs_size;
> +	pos += sizeof(*hdr);
> +
> +	memcpy_fromio(pos, catpt_shim_addr(cdev), CATPT_SHIM_REGS_SIZE);
> +	pos += CATPT_SHIM_REGS_SIZE;
> +
> +	for (i = 0; i < CATPT_SSP_COUNT; i++) {
> +		memcpy_fromio(pos, catpt_ssp_addr(cdev, i),
> +			      CATPT_SSP_REGS_SIZE);
> +		pos += CATPT_SSP_REGS_SIZE;
> +	}
> +	for (i = 0; i < CATPT_DMA_COUNT; i++) {
> +		memcpy_fromio(pos, catpt_dma_addr(cdev, i),
> +			      CATPT_DMA_REGS_SIZE);
> +		pos += CATPT_DMA_REGS_SIZE;
> +	}
> +
> +	dev_coredumpv(cdev->dev, dump, dump_size, GFP_KERNEL);
> +
> +	return 0;
> +}

...

> +struct catpt_set_volume_input {
> +	u32 channel;
> +	u32 target_volume;
> +	u64 curve_duration;
> +	enum catpt_audio_curve_type curve_type __aligned(4);

> +} __packed;

How this __packed changes anything? In general __packed doesn't make sense for
in-kernel data structures. Otherwise you have to use proper (POD) types for
data. Ditto for all similar cases.

-- 
With Best Regards,
Andy Shevchenko


