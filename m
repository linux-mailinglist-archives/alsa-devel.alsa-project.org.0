Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 215423393B9
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Mar 2021 17:41:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B9C31685;
	Fri, 12 Mar 2021 17:40:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B9C31685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615567278;
	bh=SXGyLuV64Sm5YZoTjB0wGGVOmtV8BXqXkQyLjQPbtv8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AciL7m/5h+L4hrxg8ILYwFwD2rzVapaMJnC79CP1I0/Tw8J9aHEO39h/wlP7hn16b
	 vEkdqq5Oj4Hh29wPTNQlvq9+iwRsrx3qfjn2bdm73JFdTpfbtxA71Ts5JDg7PLl8k2
	 IM4G1u6R3TzjL00yFvQPEBdRpFKxEiYlg73tcOCQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DC331F801ED;
	Fri, 12 Mar 2021 17:39:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7A97BF801D8; Fri, 12 Mar 2021 17:39:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 58886F8012A
 for <alsa-devel@alsa-project.org>; Fri, 12 Mar 2021 17:39:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58886F8012A
IronPort-SDR: NZ4VyJTDLmpu2I3dV3OyRFLfwbXnTtYg3qX6xrXUY8HMSc5V+5hsGixBjH1WXmRKNiD0/d5xNf
 ramSH1pveUFQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9921"; a="273898365"
X-IronPort-AV: E=Sophos;i="5.81,244,1610438400"; d="scan'208";a="273898365"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2021 08:39:35 -0800
IronPort-SDR: da3MCXd1zGFGz+LIGK+EQ4coy9OkP5kZP8mIIk2jDYCcT4TxrFa4tukb8shD7i4m6dUq51/o35
 eyMciPl8WWqg==
X-IronPort-AV: E=Sophos;i="5.81,244,1610438400"; d="scan'208";a="411059361"
Received: from akharche-mobl2.ccr.corp.intel.com (HELO [10.212.135.254])
 ([10.212.135.254])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2021 08:39:34 -0800
Subject: Re: [PATCH v3 1/2] ASoC: samsung: tm2_wm5110: check of of_parse
 return value
To: Mark Brown <broonie@kernel.org>
References: <20210311003516.120003-1-pierre-louis.bossart@linux.intel.com>
 <20210311003516.120003-2-pierre-louis.bossart@linux.intel.com>
 <20210312142812.GA17802@sirena.org.uk>
 <a9caf1c6-d9d0-7e05-31f2-6a8d9026e509@linux.intel.com>
 <20210312163124.GK5348@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <22662857-46ca-1f3a-2a55-445384a5de07@linux.intel.com>
Date: Fri, 12 Mar 2021 10:39:33 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210312163124.GK5348@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, stable@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>
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



On 3/12/21 10:31 AM, Mark Brown wrote:
> On Fri, Mar 12, 2021 at 10:30:32AM -0600, Pierre-Louis Bossart wrote:
>> On 3/12/21 8:28 AM, Mark Brown wrote:
> 
>>> Commit: 11bc3bb24003 ("ASoC: samsung: tm2_wm5110: check of of_parse return value")
>>> 	Fixes tag: Fixes: 8d1513cef51a ("ASoC: samsung: Add support for HDMI audio on TM2board")
>>> 	Has these problem(s):
>>> 		- Subject does not match target commit subject
>>> 		  Just use
>>> 			git log -1 --format='Fixes: %h ("%s")'
> 
>> Sorry, I don't know what to make of this. I don't see this commit
>> 11bc3bb24003
> 
>> Something odd happened, there was an initial merge and it seems to have
>> disappeared, it's no longer in the for-next branch?
> 
> That commit is your patch being applied, which I've dropped because of
> the error reported.

ack, not sure why there's a missing space.

git log -1 --format='Fixes: %h ("%s")' 8d1513cef51a
Fixes: 8d1513cef51a ("ASoC: samsung: Add support for HDMI audio on TM2 
board")



