Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 153956405C5
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Dec 2022 12:27:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8F7117FD;
	Fri,  2 Dec 2022 12:26:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8F7117FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669980445;
	bh=PEuGnfNfXvO3mYDmwTkr+5QQk7Vk/04pQM3po7A9vWU=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WWwqFCtY2xAaS5+ipUuUXJO0V5CUZPNg/jnSZHkSDsXz8l73b0jZig1PJnCRKjYp9
	 AE5QU3gRHKATzZPw5OB7DOfpx5lLIzBDyTKwFBAOWqgg3bbdjgvA86++Tjo3mxVDoK
	 V5ijIUPC3QauBsvL0JCSAMsQdTPWKQnlg2SWl06E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2AE4CF800BD;
	Fri,  2 Dec 2022 12:26:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60EE6F800BD; Fri,  2 Dec 2022 12:26:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,PRX_BODY_72,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BF94EF80162
 for <alsa-devel@alsa-project.org>; Fri,  2 Dec 2022 12:26:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF94EF80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="k4QLG/h9"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B2AS0I3012954; Fri, 2 Dec 2022 05:26:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=1W0ML02+yxS2Wjg2iU2lEiI24ccpZbfrln48kLKoNwQ=;
 b=k4QLG/h9W97e78kj96ebGQLfDrTxyU2WpgO9quBDQ9mAjkbuyl7Z+XrsslAQNF0IU75w
 xkGT/4W5uD3wXkhskXaYAegRBxLnWDPG5Lcq38tzoAYV6Psz9qtNbfxs0mmwx7FmsFy+
 TTjgsCw6OcOhMh8SinAQMdQhx8zTozwge4X0uk5Wrtm/cRZxjtWoG3SAoYYqw3xORgNV
 wKiI0S2GNAzM3pbENyxisBOeIdP4cU9nIqix97O043e/onTudXqCtoA/P33rGM7hKoV1
 vx56FZdZQLA/drbU3mMghem2q5vRNvp4GzygiFXSShvNFWhirGmjhtnGo9DeMJjxW29z Cg== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3m6k2vsqev-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Dec 2022 05:26:23 -0600
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.20; Fri, 2 Dec
 2022 05:26:21 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.20 via Frontend Transport; Fri, 2 Dec 2022 05:26:21 -0600
Received: from [198.90.251.111] (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.111])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 9165EB10;
 Fri,  2 Dec 2022 11:26:21 +0000 (UTC)
Message-ID: <266bf397-4395-873b-c933-73a9e28f463c@opensource.cirrus.com>
Date: Fri, 2 Dec 2022 11:26:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 0/2] soundwire: Remove redundant zeroing of page registers
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <vkoul@kernel.org>
References: <20221201140813.4062146-1-rf@opensource.cirrus.com>
 <002826da-f22f-9ce2-1688-345fe4e3c7ed@linux.intel.com>
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <002826da-f22f-9ce2-1688-345fe4e3c7ed@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Dxm0bNnxqnEuk_xNxjz6wG9NcDKN47bl
X-Proofpoint-ORIG-GUID: Dxm0bNnxqnEuk_xNxjz6wG9NcDKN47bl
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 yung-chuan.liao@linux.intel.com, linux-kernel@vger.kernel.org,
 sanyog.r.kale@intel.com
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

On 01/12/2022 18:31, Pierre-Louis Bossart wrote:
> 
> 
> On 12/1/22 08:08, Richard Fitzgerald wrote:
>> Writing zero to the page registers after each message transaction can add
>> up to a lot of overhead for codecs that need to transfer large amount of
>> data - for example a firmware download.
>>
>> There's no spec reason I can see for this zeroing. The page registers are
>> only used for a paged address. The bus code uses a non-paged address for
>> registers in page 0. It always writes the page registers at the start of
>> a paged transaction.
>>
>> If this zeroing was a workaround for anything, let me know and I will
>> re-implement the zeroing as a quirk that can be enabled only when it is
>> necessary.
> 
> It's a feature, not a bug :-)
> 
> The page registers have to be zeroed out so that any bus-management
> command hits the page0 instead of using a value that was set by codec
> driver for vendor-specific configurations.
> 

Why would these bus management commands set bit 15 to indicate a paged
access? If they don't set bit 15 the page registers are not used and
bits 15..31 of the register address must be 0. Table 78 in the Soundwire
1.2 spec. Table 71 in the 1.0 spec. Table 43 in the 0.6 draft spec.


> The implementation is far from optimal though, and indeed if we have
> long transactions that are not interrupted by anything else we could
> avoid resetting the page registers.
> 
> I tried to implement a 'lazy approach' some time back, but at the time I
> didn't see any benefits due to the limited number of configurations.
> 
> I can't remember where the code is, but the initial enhancement was
> listed here: https://github.com/thesofproject/linux/issues/2881
> 
>>
>> Richard Fitzgerald (2):
>>    soundwire: bus: Don't zero page registers after every transaction
>>    soundwire: bus: Remove unused reset_page_addr() callback
>>
>>   drivers/soundwire/bus.c             | 23 -----------------------
>>   drivers/soundwire/cadence_master.c  | 14 --------------
>>   drivers/soundwire/cadence_master.h  |  3 ---
>>   drivers/soundwire/intel_auxdevice.c |  1 -
>>   include/linux/soundwire/sdw.h       |  3 ---
>>   5 files changed, 44 deletions(-)
>>
