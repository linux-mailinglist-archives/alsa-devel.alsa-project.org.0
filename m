Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D26226129D
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Sep 2020 16:24:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 265841779;
	Tue,  8 Sep 2020 16:23:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 265841779
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599575052;
	bh=I3UVbKh5PdwBqs+cwXVYI7OTl+1EcX/7mc26HivuWaQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Mp4IR71CmnZdWBLPbfsK5TnXN6JmdSGTKsVD2PSafJAGKqktXnWBop9OAQ0GR0R5W
	 oriaila5AL7I1YE6WzpQgtq9KlgwRGrm4ZtdadZJBtIvJoJwsRczT6cu6aoEFmRIIi
	 PVqAUCMmO9VnwradQr/MBfVmAoHKKf9/nEhUqz08=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F4BAF8028E;
	Tue,  8 Sep 2020 16:21:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BA38FF8010B; Tue,  8 Sep 2020 16:21:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=NICE_REPLY_A,
 RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 218D7F8010B
 for <alsa-devel@alsa-project.org>; Tue,  8 Sep 2020 16:21:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 218D7F8010B
IronPort-SDR: fgdKSPebaLxfu6HDG83RlEGO397XXngAeza20DgVeH6z72Y515Qr4VjIt31i1mFrzxk15PFa8R
 CCACm1Fxe1IQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9737"; a="159106178"
X-IronPort-AV: E=Sophos;i="5.76,406,1592895600"; d="scan'208";a="159106178"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2020 07:21:33 -0700
IronPort-SDR: dun0+JlDEOAUH4fU6c+UUidwT3ben5QpCr8Dy5TTXNwHsxPxc5wQgdEhyKGLF6GBS0K1ukaqMF
 ZhDFW/lBiIXA==
X-IronPort-AV: E=Sophos;i="5.76,406,1592895600"; d="scan'208";a="448802350"
Received: from mgarber-mobl1.amr.corp.intel.com (HELO [10.212.179.134])
 ([10.212.179.134])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2020 07:21:32 -0700
Subject: Re: [PATCH v2 2/3] soundwire: SDCA: add helper macro to access
 controls
To: Vinod Koul <vkoul@kernel.org>
References: <20200901162225.33343-1-pierre-louis.bossart@linux.intel.com>
 <20200901162225.33343-3-pierre-louis.bossart@linux.intel.com>
 <20200904050244.GT2639@vkoul-mobl>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <f35a0ae7-2779-0c69-9ef3-0d0e298888ac@linux.intel.com>
Date: Tue, 8 Sep 2020 08:33:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200904050244.GT2639@vkoul-mobl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 tiwai@suse.de, gregkh@linuxfoundation.org,
 open list <linux-kernel@vger.kernel.org>, broonie@kernel.org,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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

Thanks for the review Vinod,

> This is good, thanks for adding it in changelog. Can you also add this
> description to Documentation (that can come as an individual patch),

ok

>> +/*
>> + * v1.2 device - SDCA address mapping
>> + *
>> + * Spec definition
>> + *	Bits		Contents
>> + *	31		0 (required by addressing range)
>> + *	30:26		0b10000 (Control Prefix)
> 
> So this is for 30:26

I don't get the comment, sorry.

> 
>> + *	25		0 (Reserved)
>> + *	24:22		Function Number [2:0]
>> + *	21		Entity[6]
>> + *	20:19		Control Selector[5:4]
>> + *	18		0 (Reserved)
>> + *	17:15		Control Number[5:3]
>> + *	14		Next
>> + *	13		MBQ
>> + *	12:7		Entity[5:0]
>> + *	6:3		Control Selector[3:0]
>> + *	2:0		Control Number[2:0]
>> + */
>> +
>> +#define SDW_SDCA_CTL(fun, ent, ctl, ch)						\
>> +	(BIT(30)							|	\
> 
> Programmatically this is fine, but then since we are defining for the
> description above, IMO it would actually make sense for this to be defined
> as FIELD_PREP:
> 
>          FIELD_PREP(GENMASK(30, 26), 1)
> 
> or better
> 
>          u32_encode_bits(GENMASK(30, 26), 1)
> 
>> +	FIELD_PREP(GENMASK(24, 22), FIELD_GET(GENMASK(2, 0), (fun)))	|	\
> 
> Why not use u32_encode_bits(GENMASK(24, 22), (fun)) instead for this and
> below?

Because your comment for the v1 review was to use FIELD_PREP/FIELD_GET, 
and your other patches for bitfield access only use FIELD_PREP/FIELD_GET.

I really don't care about which macro is used but it wouldn't hurt to 
have some level of consistency between different parts of the code? Why 
not use FIELD_PREP/GET everywhere?

>> +	FIELD_PREP(BIT(21), FIELD_GET(BIT(6), (ent)))			|	\
>> +	FIELD_PREP(GENMASK(20, 19), FIELD_GET(GENMASK(5, 4), (ctl)))	|	\
>> +	FIELD_PREP(GENMASK(17, 15), FIELD_GET(GENMASK(5, 3), (ch)))	|	\
>> +	FIELD_PREP(GENMASK(12, 7), FIELD_GET(GENMASK(5, 0), (ent)))	|	\
>> +	FIELD_PREP(GENMASK(6, 3), FIELD_GET(GENMASK(3, 0), (ctl)))	|	\
>> +	FIELD_PREP(GENMASK(2, 0), FIELD_GET(GENMASK(2, 0), (ch))))
> 
> Also, can we rather have a nice function for this, that would look much
> cleaner

I am not sure what would be cleaner but fine.

> And while at it, consider defining masks for various fields rather than
> using numbers in GENMASK() above, that would look better, be more
> readable and people can reuse it.

Actually on this one I disagree. These fields are not intended to be 
used by anyone, the goal is precisely to hide them behind regmap, and 
the use of raw numbers makes it easier to cross-check the documentation 
and the code. Adding a separate set of definitions would not increase 
readability.

