Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9517C30C64B
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Feb 2021 17:45:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 402101764;
	Tue,  2 Feb 2021 17:44:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 402101764
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612284311;
	bh=vzL8qQ41oNyatWIYXfSJJlGmIlQyQ0/N6TzIpCA26L4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BQ3kSIa1JQqk9Q6bVfbas6BljPrgVhTtjZSpsakFqLX8ww6e6mhP7cYg240To52U+
	 +9BT35mUskPTsQwHTh7G5EuG0PB9QUKink8lKmXyuo6PI7wGGcC3HMd7AM32gyzItc
	 xCn8s8sSHhEqT7t+8hJYKM6ObDK16YUW6WqKO7jk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B7F7F801F7;
	Tue,  2 Feb 2021 17:43:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 936D8F80171; Tue,  2 Feb 2021 17:43:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C8E02F8013C
 for <alsa-devel@alsa-project.org>; Tue,  2 Feb 2021 17:43:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8E02F8013C
IronPort-SDR: ejsLrrO+zXjmkgzR3qaFuxd6Mc5ISkCHjhq5iRH9WYHxeTBuhhAxHHBranbMlGWip9bSgxiw+Y
 iIvlVK8uZXIg==
X-IronPort-AV: E=McAfee;i="6000,8403,9883"; a="177377297"
X-IronPort-AV: E=Sophos;i="5.79,395,1602572400"; d="scan'208";a="177377297"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2021 08:43:20 -0800
IronPort-SDR: Mik2ouu6FRss9AOS0SbJY7i4r2d/YqEjTDVgiyZPrxjGNLsPw6PRlAITedaZuVaxHrgoo0nZ5w
 t4l/YFObU0rQ==
X-IronPort-AV: E=Sophos;i="5.79,395,1602572400"; d="scan'208";a="391564051"
Received: from bmdumitr-mobl.amr.corp.intel.com (HELO [10.212.155.40])
 ([10.212.155.40])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2021 08:43:16 -0800
Subject: Re: [PATCH] soundwire: debugfs: use controller id instead of link_id
To: Vinod Koul <vkoul@kernel.org>
References: <20210115162559.20869-1-srinivas.kandagatla@linaro.org>
 <20210119145220.GS2771@vkoul-mobl>
 <45300dc3-00b0-497b-804e-f7f1e857f32a@linux.intel.com>
 <57d5f1bd-50fa-30ab-03c0-260460e45d61@linaro.org>
 <6d4d4a6b-f28c-81db-4e67-2b5b94116fa4@linux.intel.com>
 <1fad2388-27d0-7014-818d-1272fa70ed9b@linaro.org>
 <33fe8455-01b4-f867-4974-a3e867c930f0@linux.intel.com>
 <feee8676-33fe-7929-8b6c-6abe3a09159a@linaro.org>
 <20210201101414.GS2771@vkoul-mobl>
 <4b850685-1058-0e18-d3e8-e23e20086235@linux.intel.com>
 <20210202041853.GF2771@vkoul-mobl>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <6eebbadd-d26b-9dba-f425-01988fb64bec@linux.intel.com>
Date: Tue, 2 Feb 2021 10:43:14 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210202041853.GF2771@vkoul-mobl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, sanyog.r.kale@intel.com,
 yung-chuan.liao@linux.intel.com
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



On 2/1/21 10:18 PM, Vinod Koul wrote:
> On 01-02-21, 10:10, Pierre-Louis Bossart wrote:
>> On 2/1/21 4:14 AM, Vinod Koul wrote:
>>> On 21-01-21, 17:23, Srinivas Kandagatla wrote:
>>>> On 21/01/2021 15:12, Pierre-Louis Bossart wrote:
>>>>> On 1/21/21 6:03 AM, Srinivas Kandagatla wrote:
> 
>>>> I totally agree!
>>>>
>>>> If I understand it correctly in Intel case there will be only one Link ID
>>>> per bus.
>>>
>>> Yes IIUC there would be one link id per bus.
>>>
>>> the ida approach gives us unique id for each master,bus I would like to
>>> propose using that everywhere
>>
>> We have cases where link2 is not used but link0, 1 and 3 are.
>> Using the IDA would result in master-0,1,2 being shown, that would throw the
>> integrator off. the link_id is related to hardware and can tolerate gaps,
>> the IDA is typically always increasing and is across the system, not
>> controller specific.
>>
>> We can debate forever but both pieces of information are useful, so my
>> recommendation is to use both:
>>
>> snprintf(name, sizeof(name), "master-%d-%d", bus_id, bus->link_id);
> 
> I agree we should use both, but does it really make sense for naming? We
> can keep name in ida and expose the link_id as a parameter for
> integrators to see in sysfs.

That would mean changing the meaning of sysfs properties:

/*
  * The sysfs for properties reflects the MIPI description as given
  * in the MIPI DisCo spec
  *
  * Base file is:
  *	sdw-master-N
  *      |---- revision
  *      |---- clk_stop_modes
  *      |---- max_clk_freq
  *      |---- clk_freq
  *      |---- clk_gears
  *      |---- default_row
  *      |---- default_col
  *      |---- dynamic_shape
  *      |---- err_threshold
  */

N is the link ID in the spec. I am not convinced we'd do the community a 
service by unilaterally changing what an external spec means, or add a 
property that's kernel-defined while the rest is supposed to come from 
firmware. If you want to change the spec then you can contribute 
feedback in MIPI circles (MIPI have a mechanism for maintainers to 
provide such feedback without company/employer membership requirements)

So either we add a sysfs layer that represents a controller (better in 
my opinion so that we can show the link/master count), or keep the 
existing hierarchy but expand the name with a unique ID so that Qualcomm 
don't get errors with duplicate sysfs link0 entries.

