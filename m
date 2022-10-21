Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A05C460751D
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Oct 2022 12:39:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 432B99112;
	Fri, 21 Oct 2022 12:38:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 432B99112
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666348761;
	bh=A9ee0G2yGnSwzOea/zOoOPIzR6Ip6DIni+XSAmw/Yvs=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Tr8vy9QqOh2aoZ3aXy2Ghuc+CZvz61ALZ/Q2Ji1qKrwlUBYviir/2vL5shHGx54f/
	 +++OSLi9JtfnmSAtdqX+Y3A/ppQ5gCeMCtFo+TidmYKLgRTnn5IACLYRPZDy2tYj47
	 C6SdEnJmUdWxBN4FEhccwxHm3hrTBfybiZSsf3bY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C2A5FF80256;
	Fri, 21 Oct 2022 12:38:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 75506F8021D; Fri, 21 Oct 2022 12:38:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 424F5F80118
 for <alsa-devel@alsa-project.org>; Fri, 21 Oct 2022 12:38:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 424F5F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="a35nGFqv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666348703; x=1697884703;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=A9ee0G2yGnSwzOea/zOoOPIzR6Ip6DIni+XSAmw/Yvs=;
 b=a35nGFqv/LlwkQuk+t5dadyBfFrYCs9BXKfAN3UzN3Qug4WqpVy4oMRc
 9w6cjO+1TGKPRcus033aIIPVQK3/9oJbPDBFHzIhxxRZp9YBqLRRZXp+n
 oDen9lK0aABzxItKNeqFURxUK+IfEvutcL5I5FX9g/Kekw088UWy6Vk5v
 nzKpaAdw8cLONi2Y0YMP/Lz6pNinAXMwFXzv8vdKYQG9vfEjyZvXQifNm
 enBgkK+m5MwpHncxHG46+GqvDAjxJl+w8Ta8I+B7/ZcmcTpafv3tQul77
 VVFnezrwpnpkYCHIyiKcMMHvF2eu3tCZirTNALrVBcwflTk0WSSuxLEKo A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="287372265"
X-IronPort-AV: E=Sophos;i="5.95,200,1661842800"; d="scan'208";a="287372265"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2022 03:38:05 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="959563325"
X-IronPort-AV: E=Sophos;i="5.95,200,1661842800"; d="scan'208";a="959563325"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.249.40])
 ([10.99.249.40])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2022 03:38:03 -0700
Message-ID: <9db189aa-135a-752b-8819-ce2865dfb1c9@linux.intel.com>
Date: Fri, 21 Oct 2022 12:38:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH v2 00/19] ASoC: SOF: Intel/IPC4: Support for external
 firmware libraries
Content-Language: en-US
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, lgirdwood@gmail.com,
 broonie@kernel.org
References: <20221020121238.18339-1-peter.ujfalusi@linux.intel.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20221020121238.18339-1-peter.ujfalusi@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 cezary.rojewski@intel.com, ranjani.sridharan@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, chao.song@intel.com
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

On 10/20/2022 2:12 PM, Peter Ujfalusi wrote:
> Hi,
> 
> Changes since v1:
> - rebased on "[PATCH v2] ASoC: SOF: Intel: pci-tgl: fix ADL-N descriptor"
> 
> Cover letter:
> 
> In IPC4 all DSP loadable executable is a 'library' containing modules. The main
> or basefw is also a library which contains multiple modules.
> IPC4 allows to use loadable libraries to extend the functionality of the booted
> basefw.
> 
> This series adds support for loading external libraries in case they are needed
> by the loaded topology file.
> 
> The libraries must be placed to a specific firmware directory (fw_lib_prefix),
> which is:
> intel/avs-lib|sof-ipc4-lib/ followed by the platform name and in case of
> community key use a 'community' directory.
> 
> For example for upx-i11 (community key): intel/avs-lib/tgl/community is the
> default path.
> 
> The name of the library should be the UUID of the module it contains since the
> library loading is going to look for the file as <module_UUID>.bin
> In case there is a need to bundle multiple modules into single library, symlinks
> can be used to point to the file:
> 
> module_boundle.bin
> <UUID1>.bin -> module_boundle.bin
> <UUID2>.bin -> module_boundle.bin
> <UUID3>.bin -> module_boundle.bin
> 
> But note that in this case all modules will be loaded to the DSP since only the
> whole library can be loaded, not individual modules.
> 
> Regards,
> Peter

I've synced with Czarek and read your mails again, and while I still 
have minor doubts to paths that are chosen I think there is nothing 
blocking it from being merged from our side at this point. Thanks for 
explaining!

