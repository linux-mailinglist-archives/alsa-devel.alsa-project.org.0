Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D35014D029E
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Mar 2022 16:23:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C0701708;
	Mon,  7 Mar 2022 16:22:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C0701708
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646666602;
	bh=qFZ7KQDaPiD5+m/VB+YoZwBjnqAph5jlq0AM7ixjdjM=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Gn/w5rQK+mHzX/jEdMjx23YtMxGhcYvJQ/K3uUBR2N7btPB1WWOt+xwpeQ+xtEDI5
	 46eoD0dd1O44R9U2YVQfZqwuWghBhP7RHQQqi+Z6RFk/J9ztZaZeRPQ888YFKi/Zoh
	 jh0ZUQTMpy4LRz4JSgJZqadk5ztmSIW2GdhdAuHQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CA7E9F80159;
	Mon,  7 Mar 2022 16:22:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76ADFF8013F; Mon,  7 Mar 2022 16:22:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.8 required=5.0 tests=FORGED_MUA_MOZILLA,
 INVALID_MSGID,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6BB8AF800D1
 for <alsa-devel@alsa-project.org>; Mon,  7 Mar 2022 16:22:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6BB8AF800D1
X-QQ-mid: bizesmtp76t1646666511tgz87lim
Received: from [192.168.31.174] ( [114.222.120.105])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Mon, 07 Mar 2022 23:21:49 +0800 (CST)
X-QQ-SSF: 00400000002000C0I000B00A0000000
X-QQ-FEAT: ACkb0FcbxRn9yrNrs+6eTRxdQx7VGx6k7u/BbY0PrRWGtStpRjvnq2lviYDzP
 kWCzmwWP40FOghuH/AgYCLjJKgzHiEL5wkYFjYvOjXgg4B9R9c+KIbmakspDmjTPhMd/Xki
 jaY9R6m5ee6ld/BCbViuOnZHtVytTZ3XuZ2VOEYZUGOjIZ+D0SwhtQcOAihZM2ITu6ylRQV
 cMdqduhHCoZkHwN2ATmrS9j5xUqqCx2aeWLn3OZ0AdD7hPaLebkDCiQaNmfQuqYmjXsFzTr
 U+4f2jGv7ueUSijZ+oxS1xpmR3WlQwdigmIQPbvWt4N/jPccKfI8geii2MVt8Op+0p+QReE
 rlAB/eCq7yM6WLKMCoTsTLNRpfZJm2UVMYecCRkHyTZUR6HoWY=
X-QQ-GoodBg: 2
Message-ID: <0e9afdd5-747a-d731-bd05-f2afeba7ec18@uniontech.com>+C2F7C5EDCAFAC6AE
Date: Mon, 7 Mar 2022 23:21:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] ASoC: intel: use asoc_substream_to_rtd()
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Jaroslav Kysela <perex@perex.cz>
References: <20220305125105.142704-1-zhanglianjie@uniontech.com>
 <90602353-d795-6bf2-bd84-47600637b9b8@intel.com>
From: Lianjie Zhang <zhanglianjie@uniontech.com>
In-Reply-To: <90602353-d795-6bf2-bd84-47600637b9b8@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign5
X-QQ-Bgrelay: 1
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
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

Hi,

在 2022/3/7 22:17, Cezary Rojewski 写道:
> On 2022-03-05 1:51 PM, zhanglianjie wrote:
>> Now we can use asoc_substream_to_rtd() macro,
>> let's use it.
>>
>> Signed-off-by: zhanglianjie <zhanglianjie@uniontech.com>
> 
> Hello,
> 
> Thanks for your contribution!
> Commit's title does not match the requirements, though. Please see git 
> log of catpt-driver and align with the pattern found there.
> 
Thanks for the review, I reposted the patch.
[PATCH v2] ASoC: Intel: catpt: use asoc_substream_to_rtd()
> Regards,
> Czarek
> 

-- 
Kind regards,
Lianjie


