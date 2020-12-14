Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3172D9A96
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Dec 2020 16:09:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9FDA177C;
	Mon, 14 Dec 2020 16:08:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9FDA177C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607958573;
	bh=k8UjUBJdPU+vjQnhTmcOPrkWvksMmNIQoZeTvqNnK74=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CRYWgmbanAAP7CoAtgWrvLniA9g+vmT51wqttcFjtPDASeA2dK8Ow03KmI7IgABuB
	 u0IPfV7vL16w8bllR9RL65Iw9gpVtcdR6WN1EkKZ0Cd4x3mTny7VoezIxDFSFJA2sR
	 +LDfqVmhjAZHSf3+pSiXLBOfJcNY6MzSTVx6PL7s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 55901F80240;
	Mon, 14 Dec 2020 16:07:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D564BF801F7; Mon, 14 Dec 2020 16:07:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4D582F80121
 for <alsa-devel@alsa-project.org>; Mon, 14 Dec 2020 16:07:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D582F80121
IronPort-SDR: HrZBnS2XXkCND404fGcAyXEwAuqk6pQ65vd1zUbjcGejA6LZv9QxjzI2BbNPY/EAjdpQWMih3q
 8NeBdktBWF+g==
X-IronPort-AV: E=McAfee;i="6000,8403,9834"; a="236305467"
X-IronPort-AV: E=Sophos;i="5.78,420,1599548400"; d="scan'208";a="236305467"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2020 07:07:46 -0800
IronPort-SDR: NNSldE3RgxdrnP+Axrvv5JMGe5uhKCUsDBHIgJmCFOD55R9nrLcdnCzEy67zrb0KxJyJj2UvAa
 OMSTZu/b5Uiw==
X-IronPort-AV: E=Sophos;i="5.78,420,1599548400"; d="scan'208";a="411280077"
Received: from wsavage-mobl.amr.corp.intel.com (HELO [10.209.63.121])
 ([10.209.63.121])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2020 07:07:42 -0800
Subject: Re: [PATCH] ASoC: rt715: add main capture switch and main capture
 volume control
To: Jaroslav Kysela <perex@perex.cz>, jack.yu@realtek.com,
 broonie@kernel.org, lgirdwood@gmail.com
References: <20201214064903.2746-1-jack.yu@realtek.com>
 <8eeddc8c-91cb-e62d-6114-547117d4d83e@perex.cz>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <0096059b-de76-d9a3-2446-b4c3becabce8@linux.intel.com>
Date: Mon, 14 Dec 2020 09:07:41 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <8eeddc8c-91cb-e62d-6114-547117d4d83e@perex.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: oder_chiou@realtek.com, alsa-devel@alsa-project.org, lars@metafoo.de,
 derek.fang@realtek.com, flove@realtek.com, shumingf@realtek.com,
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



On 12/14/20 1:35 AM, Jaroslav Kysela wrote:
> Dne 14. 12. 20 v 7:49 jack.yu@realtek.com napsal(a):
>> From: Jack Yu <jack.yu@realtek.com>
>>
>> Add main capture switch and main capture volume for callback to be in
>> single operation.
> 
> Could you be more verbose, what you're trying to do in the patch description?
> 
>> +	 * "Main Capture Volume" looks the same as "ADC 07 Capture Volume",
> 
> I would just use "Capture Volume" and "Capture Switch" here without the Main
> prefix to follow other drivers.

It's similar to the 'Master Capture Switch' used in HDaudio, what other 
drivers were you referring to?

