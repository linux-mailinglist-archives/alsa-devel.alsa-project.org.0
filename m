Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E91BF3DBA28
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Jul 2021 16:14:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 572A51AA1;
	Fri, 30 Jul 2021 16:13:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 572A51AA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627654459;
	bh=/38O2QM9YEoABjvYXPEZQj0UbAFRIAxs/adCDhp/12Q=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PZHeVgYuR7T8mtK9VVgR6c9utd/52Uenv0i7RqGO01tGVR/odGMP/Kb0WaS1XsAak
	 tQYMryElY1Bu0+zyV1XLVjnLV0i7R19jHTnrCKynDkOHbHLQdbtOIhhD0UOIXWuVUO
	 L5aN3/Xsnh5YQLDWxGE8ubwCvFsCcUFr+HExeEuc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1F1DF80253;
	Fri, 30 Jul 2021 16:12:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F144AF80253; Fri, 30 Jul 2021 16:12:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 24290F800ED
 for <alsa-devel@alsa-project.org>; Fri, 30 Jul 2021 16:12:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24290F800ED
X-IronPort-AV: E=McAfee;i="6200,9189,10060"; a="200310678"
X-IronPort-AV: E=Sophos;i="5.84,282,1620716400"; d="scan'208";a="200310678"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2021 07:12:40 -0700
X-IronPort-AV: E=Sophos;i="5.84,282,1620716400"; d="scan'208";a="518961685"
Received: from spichard-mobl1.amr.corp.intel.com (HELO [10.212.106.239])
 ([10.212.106.239])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2021 07:12:39 -0700
Subject: Re: [PATCH v1] ASoC: Intel: kbl_da7219_max98357a: fix drv_name
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Lukasz Majczak <lma@semihalf.com>
References: <20210730115906.144300-1-lma@semihalf.com>
 <58b46549-9b42-1832-b1e1-680d56c3f393@linux.intel.com>
 <c1fb1cd1-6d27-648a-ac9c-81e150505750@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <6a0866a7-aec4-69d9-eb70-07931952b732@linux.intel.com>
Date: Fri, 30 Jul 2021 09:12:36 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <c1fb1cd1-6d27-648a-ac9c-81e150505750@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, upstream@semihalf.com,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
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



On 7/30/21 9:05 AM, Cezary Rojewski wrote:
> On 2021-07-30 3:55 PM, Pierre-Louis Bossart wrote:
>> On 7/30/21 6:59 AM, Lukasz Majczak wrote:
> 
> ...
> 
>>> @@ -113,7 +113,7 @@ struct snd_soc_acpi_mach
>>> snd_soc_acpi_intel_kbl_machines[] = {
>>>       },
>>>       {
>>>           .id = "DLGS7219",
>>> -        .drv_name = "kbl_da7219_mx98373",
>>> +        .drv_name = "kbl_da7219_max98373",
>>
>> this one is wrong though? The correct name was already present, you're
>> reverting back to the wrong name.
>>
>> there's another one that I missed, do you mind changing this as well?
>>
>> soc-acpi-intel-cml-match.c:             .drv_name =
>> "cml_da7219_max98357a",
>>
>> Should be "cml_da7219_mx98357a"
>>
>>
> 
> Not saying 'nay' or 'yay' but why is configuration first available on
> KBL platforms being renamed to 'cml_XXX'?
The same bxt_da7219_max98357a.c machine driver is used for multiple devices.

static const struct platform_device_id bxt_board_ids[] = {
	{ .name = "bxt_da7219_mx98357a" },
	{ .name = "glk_da7219_mx98357a" },
	{ .name = "cml_da7219_mx98357a" },
	{ }
};
MODULE_DEVICE_TABLE(platform, bxt_board_ids);

Why there are different drivers for KBL and BXT is probably lost in history.
