Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B843F1C82
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Aug 2021 17:19:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66DEE1690;
	Thu, 19 Aug 2021 17:19:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66DEE1690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629386398;
	bh=HAVW71dZNQhgeIsQaFVyNX/AKtA5V/U7UmPSrxQma6U=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NFfgeT/6EEM4kY/hOVMABaDiBUw83ggFviSkCzYoSVjXkrHStNqn6leWniXr8Tv7O
	 LU70fXvMYFXQHYB/9MEGPFcOEAlMe0Ey8fXijz7c/DFDSwUEleALvv+ULnqh27sfdO
	 Cm7Bc6LGKiZE+4uoewFB+GhS5+Q93tknJ9xYUsIo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 53133F80302;
	Thu, 19 Aug 2021 17:19:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B3915F8026D; Thu, 19 Aug 2021 17:19:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 25C42F8026D
 for <alsa-devel@alsa-project.org>; Thu, 19 Aug 2021 17:18:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25C42F8026D
X-IronPort-AV: E=McAfee;i="6200,9189,10081"; a="238696714"
X-IronPort-AV: E=Sophos;i="5.84,335,1620716400"; d="scan'208";a="238696714"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2021 08:18:47 -0700
X-IronPort-AV: E=Sophos;i="5.84,335,1620716400"; d="scan'208";a="489703501"
Received: from mmdandap-mobl.amr.corp.intel.com (HELO [10.213.172.210])
 ([10.213.172.210])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2021 08:18:46 -0700
Subject: Re: [PATCH v2] ASoC: Intel: Fix platform ID matching for
 kbl_da7219_max98373
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Lukasz Majczak <lma@semihalf.com>
References: <20210819082414.39497-1-lma@semihalf.com>
 <87736cce-a96f-064e-6d60-71645ba46f13@linux.intel.com>
 <aeb40985-140f-b013-f368-778ad33fc7d0@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <50eb6c88-5f1a-7a42-adaf-da16f711e5c5@linux.intel.com>
Date: Thu, 19 Aug 2021 10:18:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <aeb40985-140f-b013-f368-778ad33fc7d0@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: Curtis Malainey <cujomalainey@chromium.org>, alsa-devel@alsa-project.org,
 upstream@semihalf.com, linux-kernel@vger.kernel.org, stable@vger.kernel.org
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



On 8/19/21 10:06 AM, Cezary Rojewski wrote:
> On 2021-08-19 4:30 PM, Pierre-Louis Bossart wrote:
>> On 8/19/21 3:24 AM, Lukasz Majczak wrote:
>>> Sparse warnings triggered truncating the IDs of some platform device
>>> tables. Unfortunately kbl_da7219_max98373 was also truncated.
>>> This patch is reverting the original ID.
>>> Tested on Atlas chromebook.
>>
>> Instead of reverting, how about changing the remaining occurrences of
>> the old name in the machine driver?
>>
>> sound/soc/intel/boards/kbl_da7219_max98927.c:   if (!strcmp(pdev->name,
>> "kbl_da7219_max98373") ||
>> sound/soc/intel/boards/kbl_da7219_max98927.c:           .name =
>> "kbl_da7219_max98373",
> 
> Mentioned by 'Fixes' tag patch clearly introduced regression. If we are
> to update any name-fields, it's better to have a fresh start and update
> all the boards in one-go than doing so separately.
> 
> Apart from that, Maxim codecs go by the name of 'max' in
> sound/soc/codecs/. It's more intuitive to have equivalent shortcut used
> in board's name.

the ACPI HID start with MX and there's not much consistency in naming,
is there?

		.drv_name = "kbl_r5514_5663_max",
		.drv_name = "kbl_rt5663_m98927",
		.drv_name = "kbl_da7219_mx98357a",
		.drv_name = "kbl_da7219_max98927",
		.drv_name = "kbl_max98373",

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
