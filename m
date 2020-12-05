Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3846C2CFBA3
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Dec 2020 16:01:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B5EAB189B;
	Sat,  5 Dec 2020 16:00:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B5EAB189B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607180495;
	bh=8YZq+wYhe31/EFf6Cu7wqNO0rxvXUXho/5LNapKytA0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gv8A2bT0BOmPt7/5m3gtkJswTRgCBWGQQ/r/Vk+Qu7ZK04DJ9auqWrMgAmOSuG+of
	 1YtlCDUkyAVIk/SG2y5W4yiy+dCOxLUKiqtIHDDb911KYBieMksEZyGBPFWqHSsrNJ
	 NMUzOUOz+b3QLNwZ2hX8tdRIdhIwcH1sMHGRdHA0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DB6F8F8026B;
	Sat,  5 Dec 2020 16:00:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 215E4F800E2; Sat,  5 Dec 2020 15:59:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A, RCVD_IN_MSPIKE_H4,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 93C63F800E2
 for <alsa-devel@alsa-project.org>; Sat,  5 Dec 2020 15:59:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93C63F800E2
IronPort-SDR: 1MJK8hg5WLrrJmreQzw5tj0OcTVeXyWUKWWlMAswm8bw8nKtL3fu8zFrykLqDXGCcVCN/riAMH
 6A8wRMMriv2Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9825"; a="237628582"
X-IronPort-AV: E=Sophos;i="5.78,395,1599548400"; d="scan'208";a="237628582"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2020 06:59:52 -0800
IronPort-SDR: +vl+HACmjCKcAtpEM37NXeuK0wfxYW7gV4L1SEvyX/90iJeWmUPkwGbEPU4HvxhF+3xikZUCgi
 GC/J6Jf/Vm+A==
X-IronPort-AV: E=Sophos;i="5.78,395,1599548400"; d="scan'208";a="436104261"
Received: from schamb2-mobl2.amr.corp.intel.com (HELO [10.212.89.161])
 ([10.212.89.161])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2020 06:59:51 -0800
Subject: Re: [PATCH 4/7] soundwire/regmap: use _no_pm functions in
 regmap_read/write
To: Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>
References: <20201202204645.23891-1-yung-chuan.liao@linux.intel.com>
 <20201202204645.23891-5-yung-chuan.liao@linux.intel.com>
 <20201205074554.GR8403@vkoul-mobl>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <f72fc1d5-f904-2247-17ef-d01a9fcf0b97@linux.intel.com>
Date: Sat, 5 Dec 2020 08:43:49 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201205074554.GR8403@vkoul-mobl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, ranjani.sridharan@linux.intel.com,
 hui.wang@canonical.com, broonie@kernel.org, srinivas.kandagatla@linaro.org,
 jank@cadence.com, sanyog.r.kale@intel.com, rander.wang@linux.intel.com,
 bard.liao@intel.com
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


>> -static int sdw_write_no_pm(struct sdw_slave *slave, u32 addr, u8 value)
>> +int sdw_write_no_pm(struct sdw_slave *slave, u32 addr, u8 value)
>>   {
>>   	return sdw_nwrite_no_pm(slave, addr, 1, &value);
>>   }
>> +EXPORT_SYMBOL(sdw_write_no_pm);
> 
> Why not export this is patch 1..?

yes, good point. I guess Bard and I were debugging in parallel and 
missed this. thanks for pointing it out.
