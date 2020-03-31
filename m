Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A75198CBF
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Mar 2020 09:13:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B58711657;
	Tue, 31 Mar 2020 09:12:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B58711657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585638779;
	bh=NQcfvAvY83aRHbGcNNZvpnTveuRnTGSP1b/8Sf9WMU0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i/i92Z36JmLlKOkwyrqG3TU51UKBQaO/7HaKrQX8RH0HkWdRX1LTpBWbuKRLTwfsq
	 43DTDasfLoxyVmfUX6Zzctxa+8rLoTt+FEJrZV5QqVfD4L5P8qLbN/MCjcvorBN6XK
	 URuNHukRuOaRw3KeWL9LA8HxX/OLaxLweHpEi3BU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 59DA0F8014F;
	Tue, 31 Mar 2020 09:11:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3924FF80146; Tue, 31 Mar 2020 09:11:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F443F8010D
 for <alsa-devel@alsa-project.org>; Tue, 31 Mar 2020 09:11:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F443F8010D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=metafoo.de header.i=@metafoo.de
 header.b="HYkYmnit"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de; 
 s=default2002;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mMjEhJ5afOo7V8FWLj2BndVg5Nty3zlP7Q2CReNcnRw=; b=HYkYmnitpkwfFGlSWoMEdgouOa
 dXOZ7tIlIP8U8ghlom0EKgulwsx/+G5AZS9k3aD6gd2ch+rIJ6wa6ZXiha+iXTleHGkOB/VmG9rsv
 Rxp0la8O3MKc+fPn8rWfoM/p+5vcLA5xFKM44RwErG+eNlnH49DD4YyvaL4qPSWHNsk+VWRKNOwnd
 fVtbhw2WGtCCuURH/09d8qk7+70LC24ooSlWjrB3tfuQmYgF41iRvV+zHizHs+V8+6M4viNoT/+De
 rSGgwmbWYvT4BMPFz6RgPBeMLJ2j5rWp6Q9YRU546ICX1gEQNWap2aKQ6MC34RMJq1S5eyt03m46C
 lJsWPpiw==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
 by www381.your-server.de with esmtpsa (TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256)
 (Exim 4.89_1) (envelope-from <lars@metafoo.de>)
 id 1jJB2l-0002mp-Vx; Tue, 31 Mar 2020 09:10:40 +0200
Received: from [82.135.70.63] (helo=[192.168.178.20])
 by sslproxy03.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <lars@metafoo.de>)
 id 1jJB2l-0005lY-MR; Tue, 31 Mar 2020 09:10:39 +0200
Subject: Re: [PATCH 1/3] ASoC: dapm: connect virtual mux with default value
To: =?UTF-8?B?7J206rK97YOd?= <gt82.lee@samsung.com>, broonie@kernel.org
References: <CGME20200330073548epcas2p3045be9d3c8b76115c76ce27679840b6f@epcas2p3.samsung.com>
 <000e01d60665$d48444b0$7d8cce10$@samsung.com>
 <010901d6071f$1f299dd0$5d7cd970$@samsung.com>
 <b76d4955-94d3-5a75-d01f-5cb9ab47d6a7@metafoo.de>
 <011701d60726$a309abc0$e91d0340$@samsung.com>
From: Lars-Peter Clausen <lars@metafoo.de>
Message-ID: <4e119221-9350-aa43-8f7e-9af664383003@metafoo.de>
Date: Tue, 31 Mar 2020 09:10:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <011701d60726$a309abc0$e91d0340$@samsung.com>
Content-Type: text/plain; charset=euc-kr; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.102.2/25767/Mon Mar 30 15:08:30 2020)
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, tiwai@suse.com,
 hmseo@samsung.com, tkjung@samsung.com, pilsun.jang@samsung.com
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

On 3/31/20 8:35 AM, 이경택 wrote:
> On 3/31/20 7:55 AM, Lars-Peter Clausen wrote:
>> On 3/31/20 7:42 AM, 이경택 wrote:
>>> Since a virtual mixer has no backing registers to decide which path to
>>> connect, it will try to match with initial value 0.
>>> This is to ensure that the default mixer choice will be correctly
>>> powered up during initialization.
>>>
>>> Signed-off-by: Gyeongtaek Lee <gt82.lee@samsung.com>
>>> ---
>>>    sound/soc/soc-dapm.c | 11 ++++++++++-
>>>    1 file changed, 10 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c index
>>> 9fb54e6fe254..fc55a0534252 100644
>>> --- a/sound/soc/soc-dapm.c
>>> +++ b/sound/soc/soc-dapm.c
>>> @@ -802,7 +802,16 @@ static void dapm_set_mixer_path_status(struct
>>> snd_soc_dapm_path *p, int i,
>>>    			val = max - val;
>>>    		p->connect = !!val;
>>>    	} else {
>>> -		p->connect = 0;
>>> +		/* since a virtual mixer has no backing registers to
>>> +		 * decide which path to connect, it will try to match
>>> +		 * with initial value 0.  This is to ensure
>>> +		 * that the default mixer choice will be
>>> +		 * correctly powered up during initialization.
>>> +		 */
>>> +		val = 0;
>>> +		if (invert)
>>> +			val = max - val;
>>> +		p->connect = !!val;
>> Do you have virtual mixers that have the inverted flag set and if yes why? Cause otherwise this is exactly the same as before.
> Yes, I have virtual mixers with inverted flag.
> It is used to create a switch which is connected by default and can be disconnected when user application needs it.
> Actually hardware can't be disconnected by virtual switch.
> So, connected was better for default value for virtual mixers in my experience.

It would be good to mention this in the commit message, that the purpose 
of the patch is to allow virtual mixers with a default state of on.

I think you can also simplify the expression to just `p->connect = invert;`

