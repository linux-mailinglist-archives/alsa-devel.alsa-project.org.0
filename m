Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8275D30BC71
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Feb 2021 11:58:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 03A9F175F;
	Tue,  2 Feb 2021 11:57:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 03A9F175F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612263510;
	bh=MG0AvYDlhI0gAx7olUX5ioO8I3b2cx63Wx0ltmEeXjQ=;
	h=Subject:From:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a17NTD5d3RoQpoKWIfnoZrTtYGy302d8IetwRzgQRd1UfirTkjAw/Habwh1rXRin8
	 5c1uD3mZIWsiZUJHQZyo0LDL6gpmJygu0H38vFTFai773dM6QZH1a4ZxvvsbkY557u
	 x5X4bSQr53yv+co+y8eFj1BQlsrKNgfgyq9BI0M0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 465E8F8013C;
	Tue,  2 Feb 2021 11:56:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0901F8013C; Tue,  2 Feb 2021 11:56:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1C5ECF8013C
 for <alsa-devel@alsa-project.org>; Tue,  2 Feb 2021 11:56:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C5ECF8013C
IronPort-SDR: z3wDC14h9sD21q+q+d9wEP4fuMZzhkhkZOz4Ky6eD2nMRksadlE2uLZe7AF3x6Znp+ZaEcawCB
 iZez5hnlTrng==
X-IronPort-AV: E=McAfee;i="6000,8403,9882"; a="177326110"
X-IronPort-AV: E=Sophos;i="5.79,394,1602572400"; d="scan'208";a="177326110"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2021 02:56:40 -0800
IronPort-SDR: tQ0j+q7AeNA3bPfXh90HvfYVvgAuit9eh3cywMwAcnGLPIG+BzFt2IrfHvlb9QeL6BHgqiWf1y
 Fu1K8j6zaxWA==
X-IronPort-AV: E=Sophos;i="5.79,394,1602572400"; d="scan'208";a="370565813"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.213.25.151])
 ([10.213.25.151])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2021 02:56:38 -0800
Subject: Re: [PATCH] ASoC: Intel: Skylake: Compile when any configuration is
 selected
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
References: <20210125115441.10383-1-cezary.rojewski@intel.com>
 <CAAd53p4fycxLn6y0WpaMWvWkN8EwmT216b40DavttfshN_GMRg@mail.gmail.com>
 <324dc8a5-c4d3-6ebf-c8e9-6321d6c93dab@intel.com>
 <CAAd53p4gqyuFPWX55fnPGHORXXf58++ZRMH9WFYp+QwS1=xDJQ@mail.gmail.com>
 <181c989f-7a4d-3cdd-11be-7378dbc9502c@intel.com>
Message-ID: <5e970d19-9544-50fe-f140-b66245418c6e@intel.com>
Date: Tue, 2 Feb 2021 11:56:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <181c989f-7a4d-3cdd-11be-7378dbc9502c@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>,
 =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?= <amadeuszx.slawinski@linux.intel.com>
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

On 2021-02-02 11:12 AM, Cezary Rojewski wrote:
> 
> On 2021-02-02 6:52 AM, Kai-Heng Feng wrote:
>>
>> Config file here:
>> https://pastebin.ubuntu.com/p/kGBv6XgHms/
> 
> Thank you for the config, Yang.
> 

Sorry for the typo, meant to say: Kai-Heng. Was writing several emails 
in short succession.

Regards,
Czarek
