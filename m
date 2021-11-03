Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E613B4446D1
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Nov 2021 18:15:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6CF171674;
	Wed,  3 Nov 2021 18:14:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6CF171674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635959703;
	bh=aS/biTwAvZOWFQB1xNKglAvLqhZo2vUA39GY/C4dg8A=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iodrAKAWD/VGdSoEC35M8HLmNQsmEQwyl2ei9JaM9jF3naz+Dst6iztpWjqSwGKml
	 XjhGdlayl6+67fmq5R5rz/YpVsov+N3Zg9hmB9lVqI/rGp0lRunscJ21v3J1fU42AD
	 OO6+S9M5UhMsMsqeNiO69UJEZkdvGqcfrDHOVebM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C8B5BF800D2;
	Wed,  3 Nov 2021 18:13:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 44CFBF8026A; Wed,  3 Nov 2021 18:13:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 48151F800D2
 for <alsa-devel@alsa-project.org>; Wed,  3 Nov 2021 18:13:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48151F800D2
X-IronPort-AV: E=McAfee;i="6200,9189,10157"; a="231799336"
X-IronPort-AV: E=Sophos;i="5.87,206,1631602800"; d="scan'208";a="231799336"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2021 10:02:27 -0700
X-IronPort-AV: E=Sophos;i="5.87,206,1631602800"; d="scan'208";a="468174154"
Received: from niucharl-mobl2.amr.corp.intel.com (HELO [10.251.139.88])
 ([10.251.139.88])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2021 10:02:26 -0700
Subject: Re: [PATCH v2] ASoC: Intel: add sof-nau8825 machine driver
To: Mac Chiang <mac.chiang@intel.com>, alsa-devel@alsa-project.org
References: <20211101110050.28384-1-mac.chiang@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <31ae486f-7d0e-30a8-ea55-7cdf70a76020@linux.intel.com>
Date: Wed, 3 Nov 2021 11:36:59 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211101110050.28384-1-mac.chiang@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: kai.vehmanen@linux.intel.com, liam.r.girdwood@linux.intel.com,
 CTLIN0@nuvoton.com, vamshi.krishna.gopal@intel.com,
 sathya.prakash.m.r@intel.com, bard.liao@intel.com
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



On 11/1/21 6:00 AM, Mac Chiang wrote:
> From: David Lin <CTLIN0@nuvoton.com>
> 
> The machine driver is a generic machine driver for SOF with nau8825
> codec w or w/o speaker additionally. Depending on the SOC
> HDMI, DMIC, Bluetooth offload support are added dynamically.
> 
> Only add information related to SOF since the machine driver was
> only tested with SOF.
> 
> There are currently 4 i2s machine variants of ADL.
> This supports the headphone NUA8825(SSP0) alone or with smart or dumb
> speakers.
> Board 2,3,4 use SSP2 for Bluetooth offload support except board 1.
> 
> Board 1 : NAU8825 + RT1019P(SSP2)
> Board 2 : NAU8825 + MAX98373(SSP1)
> Board 3 : NAU8825 + MAX98360A(SSP1)
> Board 4 : NAU8825
> 
> Signed-off-by: David Lin <CTLIN0@nuvoton.com>
> Co-developed-by: Mac Chiang <mac.chiang@intel.com>
> Signed-off-by: Mac Chiang <mac.chiang@intel.com>
> ---
>   1. remove hdac_hdmi relevant codes support
>   2. remove duplicated max_98360a_dai_link calls. Instead of checking no_amp condition
>   3. alter module license name to "GPL"
>   4. due to rt1019 non-i2c mode, so change to SND_SOC_RT1015P in KConfig
> ---

Looks good to me, thanks.

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

