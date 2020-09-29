Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 014E127C177
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Sep 2020 11:41:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D9BB18B2;
	Tue, 29 Sep 2020 11:40:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D9BB18B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601372493;
	bh=mb0fMB7Izp2v73XcBRrc/XuH2+1YpI81QP2nqtuKDvs=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B4EN9nVnFkFWBMDAJzyIR6oNI0BttleFbRCxHoGWzZBbkeFMZX6QBxKpvzDsRan3Q
	 hHnnD6Iq46lGov84fWYaM8xapWitsTlGp1N+9XzXDTQDTpm+eDNDrWt5QESCx1goBD
	 kXhyOiK3sScWVPP3SyX2VkhVKS3hv/p5CablTUp4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B929F8020C;
	Tue, 29 Sep 2020 11:39:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BD2C0F801F5; Tue, 29 Sep 2020 11:39:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8720FF800AB
 for <alsa-devel@alsa-project.org>; Tue, 29 Sep 2020 11:39:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8720FF800AB
IronPort-SDR: aX6GoLmfMEaXS1db33LZSFkriowh4R+FmH/MxbsEqy/noRB2DwZ5QLgzW+ythlOgn6VwuTegV7
 ctZsbM5RbrSQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9758"; a="163032998"
X-IronPort-AV: E=Sophos;i="5.77,318,1596524400"; d="scan'208";a="163032998"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2020 02:39:39 -0700
IronPort-SDR: n0VdGZHFvvRaQw6UPA4GpmQSAC2Hx7ZCe+ZfgfwqQA7UrOM81WKmA6Eb22DIcYqy2+Di+mWHGL
 7h5RvNF0Jr6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,318,1596524400"; d="scan'208";a="351062315"
Received: from irsmsx606.ger.corp.intel.com ([163.33.146.139])
 by orsmga007.jf.intel.com with ESMTP; 29 Sep 2020 02:39:37 -0700
Received: from irsmsx601.ger.corp.intel.com (163.33.146.7) by
 IRSMSX606.ger.corp.intel.com (163.33.146.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 29 Sep 2020 10:39:36 +0100
Received: from irsmsx601.ger.corp.intel.com ([163.33.146.7]) by
 irsmsx601.ger.corp.intel.com ([163.33.146.7]) with mapi id 15.01.1713.004;
 Tue, 29 Sep 2020 10:39:36 +0100
From: "Rojewski, Cezary" <cezary.rojewski@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: RE: [PATCH v9 02/14] ASoC: Intel: catpt: Implement IPC protocol
Thread-Topic: [PATCH v9 02/14] ASoC: Intel: catpt: Implement IPC protocol
Thread-Index: AQHWk+NWwUl83Zep90OOxekHAkyKjKl+AmkAgABD/WCAAPsXAIAAHbDQ
Date: Tue, 29 Sep 2020 09:39:36 +0000
Message-ID: <39c11ae42aa84cd3b03e8cc376e57317@intel.com>
References: <20200926085910.21948-1-cezary.rojewski@intel.com>
 <20200926085910.21948-3-cezary.rojewski@intel.com>
 <20200928134424.GM3956970@smile.fi.intel.com>
 <407ca256d3884856b469ba65c0379d91@intel.com>
 <20200929084626.GY3956970@smile.fi.intel.com>
In-Reply-To: <20200929084626.GY3956970@smile.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
x-originating-ip: [163.33.253.164]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "pierre-louis.bossart@linux.intel.com"
 <pierre-louis.bossart@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "Kaczmarski,
 Filip" <filip.kaczmarski@intel.com>, "N,
 Harshapriya" <harshapriya.n@intel.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "Barlik,
 Marcin" <marcin.barlik@intel.com>, "zwisler@google.com" <zwisler@google.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "tiwai@suse.com" <tiwai@suse.com>,
 "Proborszcz, Filip" <filip.proborszcz@intel.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "amadeuszx.slawinski@linux.intel.com" <amadeuszx.slawinski@linux.intel.com>,
 "Wasko, Michal" <michal.wasko@intel.com>,
 "cujomalainey@chromium.org" <cujomalainey@chromium.org>, "Hejmowski,
 Krzysztof" <krzysztof.hejmowski@intel.com>,
 "ppapierkowski@habana.ai" <ppapierkowski@habana.ai>, "Gopal, 
 Vamshi Krishna" <vamshi.krishna.gopal@intel.com>
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

On 2020-09-29 10:46 AM, Andy Shevchenko wrote:
> On Mon, Sep 28, 2020 at 04:52:41PM +0000, Rojewski, Cezary wrote:
>> On 2020-09-28 3:44 PM, Andy Shevchenko wrote:
>>> On Sat, Sep 26, 2020 at 10:58:58AM +0200, Cezary Rojewski wrote:

...

>>>> +	ret =3D ipc->rx.rsp.status;
>>>> +	if (reply) {
>>>> +		reply->header =3D ipc->rx.header;
>>>> +		if (!ret && reply->data)
>>>> +			memcpy(reply->data, ipc->rx.data, reply->size);
>>>> +	}
>>>> +
>>>> +	return ret;
>>>
>>> One more looking into this... What about
>>>
>>> 	if (reply)
>>> 		reply->header =3D ipc->rx.header;
>>>
>>> 	ret =3D ipc->rx.rsp.status; // or even directly if (status) return sta=
tus.
>>> 	if (ret)
>>> 		return ret;
>>>
>>> 	if (reply->data)
>>> 		memcpy(reply->data, ipc->rx.data, reply->size);
>>>
>>> 	return 0;
>>>
>>> It may be verbose but I think readability is better here.
>>
>> In your example, last 'if' will cause exception if reply=3D=3DNULL.
>=20
> Yeah, should be reply && reply->data.
>=20
>> Got your point, although that's just few lines which already involve
>> 'if' with { } spacing. After removing size-checks you suggested this
>> code is quite thin already.
>=20
> Yes, sometimes too thin is not good in terms of readability.
>=20

This will cost us additional check (2x reply=3D=3DNULL instead of 1x). Mayb=
e
a newline between:

	reply->header =3D ipc->rx.header;

	if (!ret && reply->data)
		memcpy(reply->data, ipc->rx.data, reply->size);

suffices?


...

>>>> +	CATPT_CHANNEL_CONFIG_5_POINT_0	=3D 7, /* L, C, R, Ls & Rs */
>>>> +	CATPT_CHANNEL_CONFIG_5_POINT_1	=3D 8, /* L, C, R, Ls, Rs & LFE */
>>>> +	CATPT_CHANNEL_CONFIG_DUAL_MONO	=3D 9, /* One channel replicated in t=
wo */
>>>> +	CATPT_CHANNEL_CONFIG_INVALID	=3D 10,
>>>
>>> Hmm... I think I got the point why DUAL_MONO was at the end of the swit=
ch-case.
>>>
>>
>> Well, well. Indeed we found where Willy is..
>=20
> So, we may return to the previous state, up to you.
>=20
> ...
>=20
>>>> +enum catpt_mclk_frequency {
>>>> +	CATPT_MCLK_OFF =3D 0,
>>>> +	CATPT_MCLK_FREQ_6_MHZ =3D 1,
>>>> +	CATPT_MCLK_FREQ_21_MHZ =3D 2,
>>>> +	CATPT_MCLK_FREQ_24_MHZ =3D 3,
>>>> +};
>>>
>>> Looks like a 3 MHz as base frequency with multiplicators 0, 2, 7, 8.
>>
>> Naming based on FW enum type equivalent.
>=20
> It was just an observation without any AR item :-)
> If you really know the (hardware) background of these choices then perhap=
s
> comment would be good to have.
>=20

In general I'm avoiding that subject here. Quite disappointed with what
I had to face, and that's not "just" existing linux solution but every
other component involved in LPT/WPT ADSP project.

I have plans for many more comments Andy, e.g.: fw image block division
(ascii graph and such). All of that will come in time, eventually. Not
intending to leave catpt without maintenance like other sound/soc/intel/
solutions once were.

>>>> +#define CATPT_STREAM_MSG(msg_type) \
>>>> +{ \
>>>> +	.stream_msg_type =3D CATPT_STRM_##msg_type, \
>>>> +	.global_msg_type =3D CATPT_GLB_STREAM_MESSAGE }
>>>> +#define CATPT_STAGE_MSG(msg_type) \
>>>> +{ \
>>>> +	.stage_action =3D CATPT_STG_##msg_type, \
>>>> +	.stream_msg_type =3D CATPT_STRM_STAGE_MESSAGE, \
>>>> +	.global_msg_type =3D CATPT_GLB_STREAM_MESSAGE }
>>>
>>> Hmm... This split is interesting. I would rather move } to a new line.
>>>
>>
>> As basically everything in my code, style is based on existing example -
>> usually stuff from ASoC core - here, it's include/sound/soc.h. It's full
>> of such definitions so because catpt belongs to ASoC subsystem, I've
>> used the exact same style. No problem changing if that's your preference=
.
>=20
> I think it's better to follow the existing style across subsystem. You ma=
y
> discard my (style related) comments if they contradict with used style.
>=20

If there are no other concerns, either a quick spinoff (v10) or delay
those readability improvements till series with resource_union() re-use?

While catpt is a big upgrade when compared to existing /haswell/
(obviously) there are more fruits of this rewrite: house cleaning -
follow-up series targeting /haswell/, /baytrail/ and /common/ of
sound/soc/intel. Guess everyone would like to see those in 5.10.

Regards,
Czarek

