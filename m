Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BFF5591213
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Aug 2022 16:21:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D683083E;
	Fri, 12 Aug 2022 16:21:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D683083E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660314114;
	bh=2cuTw/jbmlAeUfKTHT4pJ9M/UB15yaoen1sDJ7TWZWM=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OMqILsMD5tfNsVVZdJxcYKvoHh17F5z9T1zk8v3P0+qGjsS568IAXV/7GM432Jn15
	 ym/RVTR6dk9OMeZVQMmjOzfypjN9INkjHRF3oL3+oIQW4BpaYyOWtI7rfejFf8tP9h
	 RrRZ25sXRo/160Px297KzaQOc2xMObFaVY3aYgHE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E846F8026A;
	Fri, 12 Aug 2022 16:20:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7092FF80551; Fri, 12 Aug 2022 16:20:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A8E34F80551
 for <alsa-devel@alsa-project.org>; Fri, 12 Aug 2022 16:20:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8E34F80551
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="laQS9ixQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660314022; x=1691850022;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=2cuTw/jbmlAeUfKTHT4pJ9M/UB15yaoen1sDJ7TWZWM=;
 b=laQS9ixQjUHNZ+K4F9vQoDEcd3VDymFaFVf4wEKghkmCR0vmtevhUxnx
 iAML9PX9wifxPmdWKmjnGdam8HsHneMWy64gYdLd6p64v3Dpc3IuTWSYs
 MFLiJxjFb608pRjc3/pMX20GvUsbkpCruo7b1i92q5idjfKizBaTsjWFU
 s+PcUqs79Y+YGP5VjV/k7RRBD0G37FlofwxW+LH/vNDmb5RXOvzEgAZJT
 Y8xktSQg5eW/xb8JwgIdlJqScbzBnHy32+c65VoTLb6722PhYoOIXKKdg
 YE5Nn+KtCnOQrLiyGjQiJsKnkYD8cs1i10qTf9ajvYhyM9zWYqwQERwOl w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10437"; a="317573097"
X-IronPort-AV: E=Sophos;i="5.93,233,1654585200"; d="scan'208";a="317573097"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2022 07:20:17 -0700
X-IronPort-AV: E=Sophos;i="5.93,233,1654585200"; d="scan'208";a="634655949"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.241.73])
 ([10.99.241.73])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2022 07:20:14 -0700
Message-ID: <0cf33957-83aa-5baf-735e-835ab3db9956@linux.intel.com>
Date: Fri, 12 Aug 2022 16:20:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 05/13] ASoC: amd: add acp6.2 pdm platform driver
Content-Language: en-US
To: Syed Saba kareem <Syed.SabaKareem@amd.com>, broonie@kernel.org,
 alsa-devel@alsa-project.org
References: <20220812120731.788052-1-Syed.SabaKareem@amd.com>
 <20220812120731.788052-6-Syed.SabaKareem@amd.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20220812120731.788052-6-Syed.SabaKareem@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Sunil-kumar.Dommati@amd.com, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 open list <linux-kernel@vger.kernel.org>, mario.limonciello@amd.com,
 Vijendar.Mukunda@amd.com
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

On 8/12/2022 2:07 PM, Syed Saba kareem wrote:
> PDM platform driver binds to the platform device created by
> ACP6.2 PCI device. PDM driver registers ALSA DMA and CPU DAI
> components with ASoC framework.
> 
> Signed-off-by: Syed Saba Kareem <Syed.SabaKareem@amd.com>
> ---

...

> +
> +module_platform_driver(acp62_pdm_dma_driver);
> +
> +MODULE_AUTHOR("Syed.SabaKareem@amd.com");
> +MODULE_DESCRIPTION("AMD PHEONIX PDM Driver");

phoenix is usually written with "oe", so just making sure if above is 
not a typo?

> +MODULE_LICENSE("GPL v2");
> +MODULE_ALIAS("platform:" DRV_NAME);

