Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A32B6AF739
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Mar 2023 22:09:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DADC615AC;
	Tue,  7 Mar 2023 22:08:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DADC615AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678223343;
	bh=7IrEeKk0snZCSklr5bDVVFjLXU88F+WBESrvUTYCgG4=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OOJIiL+e/jVGp0tKPF0bCPKH+WuzUmzz+faUHBdpN9cJ2X8Pbm3L1MvBI8AyX96Ks
	 LM8LkOgKh/biLEHL23pgOvWi4IJ/z0JvLbgYgtoY86QY6dpHj2JjVt8btq9A8HBXEV
	 2EEyuPn0CGyls3Y1u6JbyDu4s9mBeluDtPoUzr/I=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 40A3DF80236;
	Tue,  7 Mar 2023 22:08:13 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9F3A4F8042F; Tue,  7 Mar 2023 22:08:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B3C93F800DF
	for <alsa-devel@alsa-project.org>; Tue,  7 Mar 2023 22:08:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3C93F800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=T3q+KjaA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678223287; x=1709759287;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=7IrEeKk0snZCSklr5bDVVFjLXU88F+WBESrvUTYCgG4=;
  b=T3q+KjaAl3EKGTz40OuTaBcbGecr01yB5plX/+vMiebln0M3JITPT4mx
   6iqBqe7MlyWpZBliHSun4GfpGHpD2KBSdRfu52cNM5fLC9yrT2+ch+npm
   mlLZEX9TLo3jbcytiH0259pBAX9AnD5P5GenBK8Mvf5FkoalV2VhKakim
   cJbPNLG//pNRIaOh8UdoMDK0LQ6rKjHxpR7Ig4IGbzplNb1rcCTz28ALP
   2K8J8CYAOaRzKgXVKGVAvluuCXtaZnvqQilIh/bk9vLvYE1s+Dqob5JoY
   H8kNw0I0r13PGplmXTqTebIGBq1w/QTNCV41N6PnudPfVG7DJ6EaCutm4
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="400799543"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400";
   d="scan'208";a="400799543"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 13:08:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="670070952"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400";
   d="scan'208";a="670070952"
Received: from jyankelo-mobl.amr.corp.intel.com (HELO [10.255.32.245])
 ([10.255.32.245])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 13:08:02 -0800
Message-ID: <9399110b-bbba-f96e-85ef-a317e8f4d518@linux.intel.com>
Date: Tue, 7 Mar 2023 15:08:01 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.7.1
Subject: Re: [PATCH V6 8/8] soundwire: amd: add pm_prepare callback and pm ops
 support
Content-Language: en-US
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>, vkoul@kernel.org
References: <20230307133135.545952-1-Vijendar.Mukunda@amd.com>
 <20230307133135.545952-9-Vijendar.Mukunda@amd.com>
 <4330af6a-ce97-53ed-f675-6d3d0ac8f32f@linux.intel.com>
 <d5a75826-d762-27fc-5820-6826debdecd9@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <d5a75826-d762-27fc-5820-6826debdecd9@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: KM2BEGPSJXZIQFQH5ATS2S7H4Z5ZP365
X-Message-ID-Hash: KM2BEGPSJXZIQFQH5ATS2S7H4Z5ZP365
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, Mario.Limonciello@amd.com,
 amadeuszx.slawinski@linux.intel.com, Mastan.Katragadda@amd.com,
 Arungopal.kondaveeti@amd.com, claudiu.beznea@microchip.com,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 open list <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KM2BEGPSJXZIQFQH5ATS2S7H4Z5ZP365/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 3/7/23 14:25, Mukunda,Vijendar wrote:
> On 07/03/23 20:58, Pierre-Louis Bossart wrote:
>>> +static int amd_resume_child_device(struct device *dev, void *data)
>>> +{
>>> +	struct sdw_slave *slave = dev_to_sdw_dev(dev);
>>> +	int ret;
>>> +
>>> +	if (!slave->probed) {
>>> +		dev_dbg(dev, "skipping device, no probed driver\n");
>>> +		return 0;
>>> +	}
>>> +	if (!slave->dev_num_sticky) {
>>> +		dev_dbg(dev, "skipping device, never detected on bus\n");
>>> +		return 0;
>>> +	}
>>> +	if (!pm_runtime_suspended(dev))
>>> +		return 0;
>>> +	ret = pm_request_resume(dev);
>> I still don't get why the test above was needed. It's racy and brings
>> limited benefits.
> As explained below thread,
> 
> https://lore.kernel.org/lkml/acd3a560-1218-9f1d-06ec-19e4d3d4e2c9@amd.com
> 
> Our scenario is multiple peripheral devices are connected
> over the same link.
> 
> In our implementation, device_for_each_child() function invokes
> amd_resume_child_device callback for each child.
> When any one of the child device is active, It will break the
> iteration, which results in failure resuming all child devices.

Can you clarify the 'it will break the iteration' statement?

Are you saying pm_request_resume() will return a negative error code if
the device is already active?

We've used an unconditional pm_request_resume() in the Intel code for
quite some time, including with multiple amplifiers per link, and have
never observed the issue you report, so I'd like to get to the root
cause pretty please. You took the Intel code and added a test for AMD
platforms, and I'd really like to understand if the Intel code was wrong
in the first place, or if the test is not needed. Something does not add
up here.

> 
> If we skip , pm_suspended check , it will not resume all
> peripheral devices when any one of the peripheral device is active.
>>
>>> +	if (ret < 0)
>>> +		dev_err(dev, "pm_request_resume failed: %d\n", ret);
>>> +
>>> +	return ret;
>>> +}
> 
