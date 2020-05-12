Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D7F1CFCE2
	for <lists+alsa-devel@lfdr.de>; Tue, 12 May 2020 20:11:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D1A9E16DC;
	Tue, 12 May 2020 20:11:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D1A9E16DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589307110;
	bh=mZeel27Wd65xJxBlkroBukYBJTQJThkLSOG09DLgr1M=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZoNWINvYlaPOVdB/L7D1ovEftemQJW6RMekseawDcRB6n4t/oQtGNCHie1wcZ5Nzz
	 8EY314COOrukqYPhLOL6DP89RfnSMnUzGvKEGiGgJqxzFzGLvgOMqSDrvfvxVSdtko
	 hQVat0StoMWVpDR6+JQsnvgyGT1CBhW6ski13sho=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D4549F80112;
	Tue, 12 May 2020 20:10:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE43AF8014C; Tue, 12 May 2020 20:10:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 689A1F800E3
 for <alsa-devel@alsa-project.org>; Tue, 12 May 2020 20:09:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 689A1F800E3
IronPort-SDR: PuW8fx39vehGjNL8YruK7muci+SXTRBrfu9yHC17LVcX04q6GHQ/SeW0MesQjkRIpIhvUTi1m2
 NjaebVkbspOg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2020 11:09:56 -0700
IronPort-SDR: eIV3tl+sN+QukeaZmNiqkQ/Vocvjm+dRR/yFi88O5jDhzKS9Ix4ZkJuM/NlLKeiUl4PDEW4mT+
 26qRhQWuoUUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,384,1583222400"; d="scan'208";a="340986383"
Received: from hqiao-mobl1.ccr.corp.intel.com (HELO [10.254.215.24])
 ([10.254.215.24])
 by orsmga001.jf.intel.com with ESMTP; 12 May 2020 11:09:54 -0700
Subject: Re: [PATCH] ASoC: topology: log all headers being parsed
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20200509082248.2757-1-yang.jie@linux.intel.com>
 <75fb69cc-830f-432a-c724-7449309f2eba@linux.intel.com>
 <36aab97b-a45a-de39-dea1-a1aa84c5a6d9@linux.intel.com>
 <b00ab72b-df95-b9dc-eb94-4491b8074413@linux.intel.com>
From: Keyon Jie <yang.jie@linux.intel.com>
Message-ID: <f99bc5a7-981d-3ae8-a81c-1d4120280c5f@linux.intel.com>
Date: Wed, 13 May 2020 02:10:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <b00ab72b-df95-b9dc-eb94-4491b8074413@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>
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


On 5/13/20 12:22 AM, Pierre-Louis Bossart wrote:
> 
> 
>> I can add a function to reconcile the two list, but since we already 
>> have "tplg->pass != SOC_TPLG_PASS_xxx" check in each xxx_load(), do 
>> you suggest to moving the logging inside these xxx_load() to reduce 
>> the redundant check?
> 
> yes, you could add a static inline sof_tplg_log_hdr(hdr); after each 
> pass check, sounds good to me.

OK, let me drop this and will send a new one soon.

Thanks,
~Keyon
