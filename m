Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3223133940D
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Mar 2021 17:58:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE78E1799;
	Fri, 12 Mar 2021 17:57:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE78E1799
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615568318;
	bh=zRrDA4/t8yUidnRL62y6eH5EbaNd3HWQJ/GmDdBjtsY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DdNbAGciXuBFPSIX0E+QgbckumuhiS9z/FwYe0x1D/ocNG6lR0FotdjIgb1xFflq0
	 lCri6edrCIIBBvs2bwvK36tMNSsMrFRcgSn+AG+5kqnhAq3GKrDVk9m58qtuxvZt4V
	 ZYJdHJjCZPN/RxruVC4cWI0VoPoLRbTsOSy83NWQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75B65F8032D;
	Fri, 12 Mar 2021 17:56:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50C0EF802E0; Fri, 12 Mar 2021 17:56:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2521F8016C
 for <alsa-devel@alsa-project.org>; Fri, 12 Mar 2021 17:56:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2521F8016C
IronPort-SDR: xtF919Sfj31VZtvkpWpDZBmrVWG5a0QByQQMlMaACDOvY3a5DoYXiNMF96YiHHxRNekjRA+a9N
 M30KjTEbWajw==
X-IronPort-AV: E=McAfee;i="6000,8403,9921"; a="250223218"
X-IronPort-AV: E=Sophos;i="5.81,244,1610438400"; d="scan'208";a="250223218"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2021 08:56:34 -0800
IronPort-SDR: m7PV7WkfAc93lqSIuY6CTzzWASguNbQtVIwM4ROE95HmqWyBGDjCzP7tQWliwQi4pEojYFkEZk
 gIQ0aA0uy8ag==
X-IronPort-AV: E=Sophos;i="5.81,244,1610438400"; d="scan'208";a="411064612"
Received: from akharche-mobl2.ccr.corp.intel.com (HELO [10.212.135.254])
 ([10.212.135.254])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2021 08:56:33 -0800
Subject: Re: [PATCH v4 0/9] soundwire: qcom: various improvements
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, vkoul@kernel.org
References: <20210312120009.22386-1-srinivas.kandagatla@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <5afd877e-2213-85f5-cd3c-eca8d060d75c@linux.intel.com>
Date: Fri, 12 Mar 2021 10:33:40 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210312120009.22386-1-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: robh@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, sanyog.r.kale@intel.com,
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



On 3/12/21 6:00 AM, Srinivas Kandagatla wrote:
> Thanks for reviewing v3 of this patchset!
> 
> During testing SoundWire controller on SM8250 MTP, we found
> few issues like all the interrupts are not handled,
> all transport parameters are not read from device tree.
> Patch to add Auto Enumeration supported by the controller
> is also part of this series.
> 
> Other major issue was register read/writes which was interrupt based
> was an overhead and puts lot of limitation on context it can be used from.
> 
> With previous approach number of interrupts generated
> after enumeration are around 130:
> $ cat /proc/interrupts  | grep soundwire
> 21: 130 0 0 0 0 0 0 0 GICv3 234 Edge      soundwire
>      
> after this patch they are just 3 interrupts
> $ cat /proc/interrupts  | grep soundwire
> 21: 3 0 0 0 0 0 0 0 GICv3 234 Edge      soundwire
> 
> So this patchset add various improvements to the existing driver
> to address above issues.
> 
> Tested it on SM8250 MTP with 2x WSA881x speakers, HeadPhones on
> WCD938x via lpass-rx-macro and Analog MICs via lpass-tx-macro.
> Also tested on DragonBoard DB845c with 2xWSA881x speakers.

LGTM, for the series

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> 
> Changes since v3:
> 	- Fixed setting assigned bit during autoenumeration
> 
> Srinivas Kandagatla (9):
>    dt-bindings: soundwire: qcom: clarify data port bus parameters
>    soundwire: qcom: add support to missing transport params
>    soundwire: qcom: set continue execution flag for ignored commands
>    soundwire: qcom: start the clock during initialization
>    soundwire: qcom: update register read/write routine
>    soundwire: qcom: add support to new interrupts
>    soundwire: export sdw_compare_devid() and sdw_extract_slave_id()
>    soundwire: qcom: add auto enumeration support
>    soundwire: qcom: wait for enumeration to be complete in probe
> 
>   .../bindings/soundwire/qcom,sdw.txt           |  20 +
>   drivers/soundwire/bus.c                       |   4 +-
>   drivers/soundwire/qcom.c                      | 529 ++++++++++++++----
>   include/linux/soundwire/sdw.h                 |   2 +
>   4 files changed, 442 insertions(+), 113 deletions(-)
> 
