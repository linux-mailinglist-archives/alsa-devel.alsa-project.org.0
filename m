Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A49165D854
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Jan 2023 17:14:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2BBCBAB9;
	Wed,  4 Jan 2023 17:13:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2BBCBAB9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672848840;
	bh=5u1MnWbPdDkdU0lePvDGFz3o3hj2dJI39QEDkTF/5Ww=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=S3af8GdziTEASrWWKWMwoXkwv8gaFAK+KxPgPHVd/mBziWa/6aR5aIRmagfCj9O0I
	 uzq05zalAtRWTUW6E52g01BRhl8xdCpEUqErEO2R3TlHoM2ZdM0A+QrGYjic4dD6NJ
	 fLo+6oWpiobpAhS0f5u/oEvIfRyeexmEPP4/dFWI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C972F80238;
	Wed,  4 Jan 2023 17:13:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5BAB9F80240; Wed,  4 Jan 2023 17:12:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8FB6AF8023A
 for <alsa-devel@alsa-project.org>; Wed,  4 Jan 2023 17:12:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8FB6AF8023A
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=TxQLV85C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672848777; x=1704384777;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=5u1MnWbPdDkdU0lePvDGFz3o3hj2dJI39QEDkTF/5Ww=;
 b=TxQLV85CG4Y8ETvAd6JzluoBPihls0NVryprun1AbsLy7DNWdAhD1Cjg
 sHbmQTQs/yofWCrBjnv/iDVJKCM9/aZmLDhrshBb6OIZiFJp6/AFdZHT3
 iqhoELXVmx/wiYGUJDDBa421MEw5+06yGM9IHvb/aMF53bDhrRq7FH1kb
 hmxpGY4oWpMgd9tt7s5TscKVJ+1TZNPD0APdA5VH+xeU0/FB7WjkoDNr1
 hpz+HWjSk4dVP0ZjjQpT7bnP/5LP9iJfsu8NMNU5tuoXCSB0Nyx2yYzVr
 gyQANFgy0+9IB48utpUOdhE+HctbCKBK32IJHqIbGO/J6fubmGz7tuHFT w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="386402225"
X-IronPort-AV: E=Sophos;i="5.96,300,1665471600"; d="scan'208";a="386402225"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2023 08:12:45 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="762722855"
X-IronPort-AV: E=Sophos;i="5.96,300,1665471600"; d="scan'208";a="762722855"
Received: from hlgentry-mobl2.amr.corp.intel.com (HELO [10.212.74.62])
 ([10.212.74.62])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2023 08:12:44 -0800
Message-ID: <151a05a5-fc56-e005-e572-d031e6de0bb1@linux.intel.com>
Date: Wed, 4 Jan 2023 08:15:27 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [PATCH v1 1/5] ASoC: Intel: bytcht_cx2072x: Replace open coded
 acpi_dev_put()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20230102203037.16120-1-andriy.shevchenko@linux.intel.com>
 <731b2d59-22f1-a456-bcfc-040a1adccce0@linux.intel.com>
 <Y7VVCc7TjY3YsJoV@smile.fi.intel.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <Y7VVCc7TjY3YsJoV@smile.fi.intel.com>
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
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 1/4/23 04:29, Andy Shevchenko wrote:
> On Tue, Jan 03, 2023 at 09:08:20AM -0600, Pierre-Louis Bossart wrote:
>> On 1/2/23 14:30, Andy Shevchenko wrote:
>>> Instead of calling put_device(&adev->dev) where adev is a pointer
>>> to an ACPI device, use specific call, i.e. acpi_dev_put().
>>>
>>> Also move it out of the conditional to make it more visible in case
>>> some other code will be added which may use that pointer. We need
>>> to keep a reference as long as we use the pointer.
>>>
>>> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>>
>> Answering for the series: we should make the change across all Intel
>> machine drivers. I see at least four cases that were missed
>>
>> bytcr_rt5640.c:         put_device(&adev->dev);
>> bytcr_rt5651.c:         put_device(&adev->dev);
>> bytcr_wm5102.c: put_device(&adev->dev);
>> sof_es8336.c:           put_device(&adev->dev);
> 
> Aren't they (they all problematic, btw) covered by the fixes series
> https://lore.kernel.org/r/20230102203014.16041-1-andriy.shevchenko@linux.intel.com?

They are indeed, but if you group AMD-related patches with Intel ones,
it's only human for reviewers to skip the thread entirely, even more so
when catching up with email on January 3 :-)

For this series

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>


