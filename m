Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A48B1B43F6
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Apr 2020 14:05:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3E9716C0;
	Wed, 22 Apr 2020 14:04:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3E9716C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587557150;
	bh=yH5sOA1FvPP9ULM8IE8o6fItNjpwIix1STLnoWo1sHE=;
	h=From:Subject:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b1J/UqZnAbO4CC8Y2mJSMwhWFJCdtr+7vJD6JSVowxUx3vRNhheBudlASPOJ3yzjp
	 gAHDXAbfxsYGsii9KmKjGPtqo1MxZUpxh71Ykv04tSYFwtUYMGjhUXJmNa/SiqC09b
	 lgiJFt90lc4zeEi6weY6iUqoMokb9Q7CSnh+3u3E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 09EFCF800FF;
	Wed, 22 Apr 2020 14:04:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C901F800FF; Wed, 22 Apr 2020 14:04:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 09667F800F2
 for <alsa-devel@alsa-project.org>; Wed, 22 Apr 2020 14:04:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09667F800F2
IronPort-SDR: eLG6AjCzpneP6tPLH2UMT0zVLLEW1nMjekA10oWUC4gD2qKbTnSzRX/RIsoznO/qMNXHtaAB9j
 k2NUILrEUmQA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2020 05:03:58 -0700
IronPort-SDR: hERZUvV+5a7uTj7m9y167Mqti8rPuI+F07xBKtGcSLU12L+/4QWtBCrlZuci7F2kEa1stPMzu3
 b0efKFHsvHew==
X-IronPort-AV: E=Sophos;i="5.72,414,1580803200"; d="scan'208";a="429887138"
Received: from mgorski-mobl.ger.corp.intel.com (HELO [10.252.52.93])
 ([10.252.52.93])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2020 05:03:57 -0700
From: "Gorski, Mateusz" <mateusz.gorski@linux.intel.com>
Subject: Re: [PATCH 1/4] ASoC: Intel: Skylake: Change the order of machine
 device and platform registration
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20200421202519.4008-1-mateusz.gorski@linux.intel.com>
 <20200421202519.4008-2-mateusz.gorski@linux.intel.com>
 <bd0e8d65-74ea-8b17-9f92-ed980e265a1c@linux.intel.com>
Message-ID: <cb08d66e-6a10-7dd7-c2ee-39e8e84943a4@linux.intel.com>
Date: Wed, 22 Apr 2020 14:03:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <bd0e8d65-74ea-8b17-9f92-ed980e265a1c@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: pl
Cc: cezary.rojewski@intel.com, tiwai@suse.com
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


> Swap the order of machine device and platform device registration.
>> This change ensures that even if the codec enumeration falls late - 
>> during
>> the driver module or topology reload - i2s_dev field is always ready to
>> be used.
>
> Are you sure?
>
> The platform device will register the DAIs that are used by the 
> machine driver, don't you have a risk of missing dependencies during 
> the card registration with this change?
>
> Put differently, why do this now when the existing code has been 
> 'working' for a number of years without needing such a change?
>
This change was tested on multiple platforms (including production 
laptops) and did not show any issues.
Anyway, in patchset v2 the alt_tplg_name creation mechanism was slightly 
changed and this patch was removed.

Thanks for your input,
Mateusz

