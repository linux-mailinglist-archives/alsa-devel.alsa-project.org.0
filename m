Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FD163C536
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Nov 2022 17:33:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7DB031690;
	Tue, 29 Nov 2022 17:32:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7DB031690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669739622;
	bh=RsiqyQgyj8Z5PLoLgztsickTRKrGI0VYzWKzSjnKRDw=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aYP9AT1aqQbWmrM5J7s8lb1m9mn8wHuInXnYZp+PeFkdNVkUnTOiKMlCcCqFbWlX/
	 XLH1AyA5jeLHqoMvekDKv9e/e5WbrhXVfbKoEZQw9nFq9MmAIyb0nN4WztNY92qzks
	 A84gxlOXPCgM47gedub4QrkTa2Hd8TCgq1BwQ6Nw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0CF16F800B6;
	Tue, 29 Nov 2022 17:32:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2BBEEF801F7; Tue, 29 Nov 2022 17:32:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D8160F800B6
 for <alsa-devel@alsa-project.org>; Tue, 29 Nov 2022 17:32:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8160F800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="cnT0dxB4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669739559; x=1701275559;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=RsiqyQgyj8Z5PLoLgztsickTRKrGI0VYzWKzSjnKRDw=;
 b=cnT0dxB41/Y38wyfmOojPJXAJhOt4lR63q1eYB1KJoafgxpF6MQQOnQs
 GIrG252iBkQt4yOlJLrHoBUmqx0t2PHCkJ4mbUztq+0Le/TMZT+A/RQnD
 5fhhcSDji+cTFltm+Y9l/rRXQZMPwGa2dPyL1X2jwnEUuilts2EZkwcsa
 MiRDo1u95LPkudKmKWs9/PHlEj3Qyuas/wX1Js4Tcr2yIGutn5Z6gpu5q
 SCmDOeIuOqOGEf2mbM96hSsU3I6WdRpOzsHa5PV6aadrNZFxtzymHOLq/
 R4Ao4kfiHwL1ypjDoEOfffG8PSGAVHGHOv0KPDz/CU/dC202rzVl56Xo9 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10546"; a="294853021"
X-IronPort-AV: E=Sophos;i="5.96,203,1665471600"; d="scan'208";a="294853021"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2022 08:31:17 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10546"; a="749915187"
X-IronPort-AV: E=Sophos;i="5.96,203,1665471600"; d="scan'208";a="749915187"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.249.114])
 ([10.99.249.114])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2022 08:31:15 -0800
Message-ID: <2be35f9b-089b-581d-2982-8b0e1a91b58f@linux.intel.com>
Date: Tue, 29 Nov 2022 17:31:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 10/11] ASoC: Intel: avs: rt5682: Add define for codec DAI
 name
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>
References: <20221125184032.2565979-1-cezary.rojewski@intel.com>
 <20221125184032.2565979-11-cezary.rojewski@intel.com>
 <Y4YySIFSZB5/NfYh@sirena.org.uk>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <Y4YySIFSZB5/NfYh@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: hdegoede@redhat.com, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com
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

On 11/29/2022 5:24 PM, Mark Brown wrote:
> On Fri, Nov 25, 2022 at 07:40:31PM +0100, Cezary Rojewski wrote:
>> From: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
>>
>> Following commits will make use of it to find codec DAI, define it
>> first.
> 
> This breaks an x86 allmodconfig build:
> 
> /build/stage/linux/sound/soc/intel/avs/boards/rt5682.c: In function ‘avs_create_dai_link’:
> /build/stage/linux/sound/soc/intel/avs/boards/rt5682.c:198:20: error: ‘avs_rt5682_codec_exit’ undeclared (first use in this function); did you mean ‘avs_rt5682_codec_init’?
>    198 |         dl->exit = avs_rt5682_codec_exit;
>        |                    ^~~~~~~~~~~~~~~~~~~~~
>        |                    avs_rt5682_codec_init
> 
> and looks out of place in this commit, it at least deserves calling out
> in the commit log?

Oops.. that seems like patch split gone wrong, it is added in following 
commit. Other patches add dl->exit in the "second" patch, so this chunk 
should be part of patch 11, instead of this one.
