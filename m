Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A6E520001
	for <lists+alsa-devel@lfdr.de>; Mon,  9 May 2022 16:37:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06477182B;
	Mon,  9 May 2022 16:36:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06477182B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652107065;
	bh=Mjn/CYwCRlv13/LGy7FwFtcBgG/kp96cuyTiCnHpROQ=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f2z9zAsz25SHFSLfaSterzcWK5i+by9EIPf2e08DgZTjM1ib1J4txrYmzHjr+VNBW
	 ekXpDIU5fR9Veqa0Nb25aTQU08bV3/H0F7BvnYdJsRZPPa7B9ewfjqE18rJU4zN6p4
	 yu0N8jSV8tBjE7GU46VUo1KR0JtlMFbqXS5quww0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F56DF8011C;
	Mon,  9 May 2022 16:36:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 86D9BF8025D; Mon,  9 May 2022 16:36:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 12D84F8014C
 for <alsa-devel@alsa-project.org>; Mon,  9 May 2022 16:36:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12D84F8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="BxSwpP8D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652107001; x=1683643001;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Mjn/CYwCRlv13/LGy7FwFtcBgG/kp96cuyTiCnHpROQ=;
 b=BxSwpP8Dl0AV4XQD5SryOr4ZbX/rtnacBZ9CDxQJnAzR/y4FJTWZ+Ffx
 GCOMNGqgIA8y8qoukMMvrE5HGWTfNHfbWsTCJMXrC61KJab86e1dzcH2o
 XBeSwOB4ddUxjffO17wzhoflz/5mukvUGR4FRTRWvktD82XzVf0lyXoVo
 dAnmxV1zv5WtlSm/LEAzAWA2ZVpxjhwOekUv2SWnxRj+LIfImaFZo7FTp
 bDWFPzOC0gIDgdNkda1C1jjcmxbHpewwocTddEvKuRLHvQRJwrdDYrnFd
 YaT191WV7RyPnogdKNcl12QHnUaIhAnUVslFA6oPWmUwBM/u1myPoMLZc g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="294292952"
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="294292952"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 07:36:32 -0700
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="592550916"
Received: from gfgerman-mobl1.amr.corp.intel.com (HELO [10.209.80.95])
 ([10.209.80.95])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 07:36:31 -0700
Message-ID: <0d645ee0-a54f-d9b4-9392-06ea1c37b29a@linux.intel.com>
Date: Mon, 9 May 2022 09:36:31 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH v2] soundwire: qcom: adjust autoenumeration timeout
Content-Language: en-US
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, vkoul@kernel.org
References: <20220506084705.18525-1-srinivas.kandagatla@linaro.org>
 <725af523-d144-e373-e09b-fb48b3afb9ed@linux.intel.com>
 <8643d266-7108-2440-43e1-c51b829ba481@linaro.org>
 <d9646029-29b1-d71b-d1f5-b33267888e3c@linux.intel.com>
 <fd355232-c5e3-ba1b-801d-526ee6f04946@linaro.org>
 <97cd6566-e686-e1f2-fe91-4b4ba9d95f12@linux.intel.com>
 <d17db27d-ad1b-f52c-50e9-4aab78ae0ff0@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <d17db27d-ad1b-f52c-50e9-4aab78ae0ff0@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 bard.liao@intel.com, Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
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


>>> Even if enumeration timeout, we will not access the registers because
>>> the ASoC codec is not registered yet from WCD938x component master.
>>
>> What happens when the codec is registered then? the autoenumeration
> Codec is only registered after reset and when both TX and RX components
> are probed.
> 
>> still didn't complete, so what prevents the read/writes from failing
>> then?
> If codec is reset and registered and for some reason autoenum took more
> than 100ms which will be hw bug then :-).
> In this case register read/writes will fail.

Does this reset result in the 'bus reset' in the SoundWire sence and
restart hence the autoenumeration?

It looks like you have a race between different components and starting
the bus before it's needed, no?
