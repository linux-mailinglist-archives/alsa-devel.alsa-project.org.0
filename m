Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA298FB6B1
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jun 2024 17:13:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 61318B65;
	Tue,  4 Jun 2024 17:12:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 61318B65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717513989;
	bh=WI66YXFhtMtD9v7S0j/6cTY9ceJOboCB3afTlXQhJXI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=S4pZOSiAHagIyEuk2BoTQxrOQBVDzmGlKoGH3n4f+8rXLqMMJircmRvdzD/2G5qvF
	 gm07cwc/ewob/NuwmJ/NJHStG/jdQa3VixzXqgy4+GDMpBW0Ld+UWA+/f7yoNQgb9K
	 ONLWeJ48uaWPkGez7uKUaTR1HJnbB3Ez7Rkc0cUs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C2CB7F8057A; Tue,  4 Jun 2024 17:12:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C5D1BF805A0;
	Tue,  4 Jun 2024 17:12:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6E70DF80496; Tue,  4 Jun 2024 17:12:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ACBFAF800FA
	for <alsa-devel@alsa-project.org>; Tue,  4 Jun 2024 17:12:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ACBFAF800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=i78ZMRg+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717513947; x=1749049947;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=WI66YXFhtMtD9v7S0j/6cTY9ceJOboCB3afTlXQhJXI=;
  b=i78ZMRg+vRrR1YqQyMHM7IGByRxBcjMZnQff0ZDPlJz3L49Invb+DXue
   tLp6anm67rUJSsFcIOQMGNrS5STU5p/zdGT6vS8JwurTZhB1fd1MAVJzP
   gNpsklPqWVotkZYPQMmKvhqrlZeB9IYbdaMBZo/7R8+Rz8kal8922qnkz
   weW3+auVu5HDx3bDx1IUIcCGlmC9CA2ICHbDVE6+G4hExjcaMDWYeZktA
   hDoSgLPZZfg7ovlI1MhyQ+1HzhEMAqX/L9AFQZCNBGURdTbOxtwCcOOl0
   Nv9iR3S/vCjvHgNlnCGtAs7EuhrZm0faYmbpUiWbE98WYNYIGKU3H2Qb8
   g==;
X-CSE-ConnectionGUID: P3ZaA+qQQTyexs40QaTjuQ==
X-CSE-MsgGUID: 28zu4z3oRSy+2msymaHQ4Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="31602486"
X-IronPort-AV: E=Sophos;i="6.08,214,1712646000";
   d="scan'208";a="31602486"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 08:12:06 -0700
X-CSE-ConnectionGUID: ISWGZxwKQBW4ys7I1KD4VA==
X-CSE-MsgGUID: XTj7vXuSQGWxND4FIYegeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,214,1712646000";
   d="scan'208";a="37139624"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO [10.245.246.143])
 ([10.245.246.143])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 08:12:04 -0700
Message-ID: <60a99290-b71e-41e4-844b-f46d8f959c81@linux.intel.com>
Date: Tue, 4 Jun 2024 15:29:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] soundwire: bus: suppress probe deferral errors
To: Johan Hovold <johan@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
References: <20240604075213.20815-1-johan+linaro@kernel.org>
 <20240604075213.20815-2-johan+linaro@kernel.org>
 <c5ecc0cd-c2ba-4f71-ac2a-9a81793a8f0c@linux.intel.com>
 <Zl7ZyEkmm8kHeRvL@hovoldconsulting.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <Zl7ZyEkmm8kHeRvL@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 24ODBBRJJTTYTGCMOXIKNUUULEJ5V7XX
X-Message-ID-Hash: 24ODBBRJJTTYTGCMOXIKNUUULEJ5V7XX
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/24ODBBRJJTTYTGCMOXIKNUUULEJ5V7XX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 6/4/24 11:09, Johan Hovold wrote:
> On Tue, Jun 04, 2024 at 10:30:21AM +0200, Pierre-Louis Bossart wrote:
>> On 6/4/24 02:52, Johan Hovold wrote:
>>> Soundwire driver probe errors are currently being logged both by the bus
>>> code and driver core:
>>>
>>> 	wsa884x-codec sdw:4:0:0217:0204:00:0: Probe of wsa884x-codec failed: -12
>>> 	wsa884x-codec sdw:4:0:0217:0204:00:0: probe with driver wsa884x-codec failed with error -12
>>>
>>> Drop the redundant bus error message, which is also incorrectly being
>>> logged on probe deferral:
>>
>> It's only redundant in the QCOM case... This would remove all error logs
>> for other codecs, e.g. see
>>
>> rt711_sdca_sdw_probe
>> cs35l56_sdw_probe
>> wcd9390_probe
>>
>> Looks like the wsa884x-codec is the chatty driver, others are just fine
>> with the existing code.
> 
> I believe you misunderstood this patch. The error messages above are not
> printed by the wsa884x-codec driver, but by the soundwire bus code and
> driver core, so the redundant error message will be printed for all
> codecs on probe failures.
> 
> And specifically, driver core will still log probe failures after this
> change.

Ah yes, you're right I read 'driver core' sideways, my bad. That's fine
then.
