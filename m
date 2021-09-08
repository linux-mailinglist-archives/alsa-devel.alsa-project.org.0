Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD87403EB5
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Sep 2021 19:55:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7460A16AD;
	Wed,  8 Sep 2021 19:55:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7460A16AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631123752;
	bh=AIZ4RSbR2Y4m8IDCdTQOkXLoBaQ495UgNtOybOO34B4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UPGkBOh7Lng/F5i/Rb8zCVQyfYP2AYE5PkQDRjV/VDru0jcKmE0VdduFWjx9KidT3
	 wC9F8a/8eGfd+S+TrJMq8jMqVPybcpy5Ww5EXEG5maNQr6MLceKqxqhZ0En+pryZlG
	 QnUudZGkfLz00PMB4/grF8f8oWypH7umXrTlgLIo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9895EF804B3;
	Wed,  8 Sep 2021 19:54:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F736F802E7; Wed,  8 Sep 2021 19:54:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DA65EF80149
 for <alsa-devel@alsa-project.org>; Wed,  8 Sep 2021 19:54:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA65EF80149
X-IronPort-AV: E=McAfee;i="6200,9189,10101"; a="207788596"
X-IronPort-AV: E=Sophos;i="5.85,278,1624345200"; d="scan'208";a="207788596"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2021 10:53:58 -0700
X-IronPort-AV: E=Sophos;i="5.85,278,1624345200"; d="scan'208";a="693503964"
Received: from sgevirtz-mobl.amr.corp.intel.com (HELO [10.209.141.208])
 ([10.209.141.208])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2021 10:53:57 -0700
Subject: Re: [PATCH] ASoC: rt1011: add i2s reference control for rt1011
To: Jack Yu <jack.yu@realtek.com>, "broonie@kernel.org" <broonie@kernel.org>, 
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>
References: <20210906101208.11585-1-jack.yu@realtek.com>
 <3062f5e5-d2d7-8150-ef89-989af3b4b1d6@linux.intel.com>
 <05e92a24b1c34daeb64e5b222a3ae337@realtek.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <9f76a420-44c6-ad6d-4442-275ba4459b40@linux.intel.com>
Date: Wed, 8 Sep 2021 10:22:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <05e92a24b1c34daeb64e5b222a3ae337@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: Oder Chiou <oder_chiou@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>,
 =?UTF-8?B?a2VudF9jaGVuQHJlYWx0ZWsuY29tIFvpmbPlu7rlro9d?=
 <kent_chen@realtek.com>,
 =?UTF-8?B?RGVyZWsgW+aWueW+t+e+qV0=?= <derek.fang@realtek.com>,
 =?UTF-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?= <shumingf@realtek.com>,
 "Flove\(HsinFu\)" <flove@realtek.com>
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



On 9/7/21 9:17 PM, Jack Yu wrote:
> 
>> -----Original Message-----
>> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>> Sent: Tuesday, September 7, 2021 10:54 PM
>> To: Jack Yu <jack.yu@realtek.com>; broonie@kernel.org;
>> lgirdwood@gmail.com
>> Cc: Oder Chiou <oder_chiou@realtek.com>; alsa-devel@alsa-project.org;
>> lars@metafoo.de; kent_chen@realtek.com [陳建宏]
>> <kent_chen@realtek.com>; Derek [方德義] <derek.fang@realtek.com>;
>> Shuming [范書銘] <shumingf@realtek.com>; Flove(HsinFu)
>> <flove@realtek.com>
>> Subject: Re: [PATCH] ASoC: rt1011: add i2s reference control for rt1011
>>
>> On 9/6/21 5:12 AM, Jack Yu wrote:
>>> Add i2s reference control for rt1011 amp.
>>>
>>> Signed-off-by: Jack Yu <jack.yu@realtek.com>
>>
>>> +static const char * const rt1011_i2s_ref[] = {
>>> +	"None", "Left Channel", "Right Channel"
>>> +};
>>
>>> +enum {
>>> +	RT1011_I2S_REF_NONE,
>>> +	RT1011_I2S_REF_LEFT_CH,
>>> +	RT1011_I2S_REF_RIGHT_CH,
>>> +};
>>
>> is it possible to get Left-Right-mix (mixed on rt1011) and Left-Right (two
>> channels, with the application selecting what they want)?
> 
> It's a mono amp, so there's no Left-Right-mix setting. 
> And for the choice of Left-Right channel, it's already available with this patch.

So it's just to place a mono reference in either left or right channel
of the I2S link? Why not dual-mono as well then?
