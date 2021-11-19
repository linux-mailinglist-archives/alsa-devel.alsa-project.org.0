Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E78BE4579B8
	for <lists+alsa-devel@lfdr.de>; Sat, 20 Nov 2021 00:49:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B873177C;
	Sat, 20 Nov 2021 00:48:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B873177C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637365787;
	bh=3VDfadjeBRiHxpHGiR11KFt76tSbWj1veqyTj+7SpR4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oHMN/JFzY29RH62x/W2qELHaQf+JdptV14+TgcGGpOPvt//XjlO4sGVU7tcnSoxxe
	 ZLU5t5bWNosPBxiBu5FqehAHYs2MuhDTHhudbDh510HKPgevuHDs2PD0ImpcSuwwpS
	 m+GcEQ9Vd215c35H4YA7HHtZxmODDufYR2FVzc90=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CB1ECF8026D;
	Sat, 20 Nov 2021 00:48:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CB44BF80217; Sat, 20 Nov 2021 00:48:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8CE23F80115
 for <alsa-devel@alsa-project.org>; Sat, 20 Nov 2021 00:48:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8CE23F80115
X-IronPort-AV: E=McAfee;i="6200,9189,10173"; a="233233250"
X-IronPort-AV: E=Sophos;i="5.87,248,1631602800"; d="scan'208";a="233233250"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2021 15:48:14 -0800
X-IronPort-AV: E=Sophos;i="5.87,248,1631602800"; d="scan'208";a="508105829"
Received: from mredenti-mobl.amr.corp.intel.com (HELO [10.212.30.252])
 ([10.212.30.252])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2021 15:48:13 -0800
Subject: Re: [PATCH] ALSA: intel-dsp-config: add quirk for JSL devices based
 on ES8336 codec
To: Takashi Iwai <tiwai@suse.de>, Bard Liao <yung-chuan.liao@linux.intel.com>
References: <20211027023254.24955-1-yung-chuan.liao@linux.intel.com>
 <s5ha6ivx9zs.wl-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <3e70f05b-47d1-d1bb-5225-7fba5de96d91@linux.intel.com>
Date: Fri, 19 Nov 2021 17:48:10 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <s5ha6ivx9zs.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, broonie@kernel.org, bard.liao@intel.com
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



On 10/27/21 1:22 AM, Takashi Iwai wrote:
> On Wed, 27 Oct 2021 04:32:54 +0200,
> Bard Liao wrote:
>>
>> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>>
>> These devices are based on an I2C/I2S device, we need to force the use
>> of the SOF driver otherwise the legacy HDaudio driver will be loaded -
>> only HDMI will be supported.
>>
>> We previously added support for other Intel platforms but missed
>> JasperLake.
>>
>> BugLink: https://github.com/thesofproject/linux/issues/3210
>> Fixes: 9d36ceab9415 ('ALSA: intel-dsp-config: add quirk for APL/GLK/TGL devices based on ES8336 codec')
>> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>> Reviewed-by: Kai Vehmanen <kai.vehmanen@intel.com>
>> Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> 
> As the commit still didn't reach to me but only in Mark's tree,
> it should go through asoc tree.
> 
> Acked-by: Takashi Iwai <tiwai@suse.de>

Looks like this patch was missed, likely a merge window effect?

Takashi, you should be able to apply this on your tree now? or do you
want me to resend it?

Thanks
-Pierre
