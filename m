Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D80B328B486
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Oct 2020 14:21:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 76C75168D;
	Mon, 12 Oct 2020 14:20:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 76C75168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602505288;
	bh=PWb0hE4zj1KED/lEeUVGdT4oTuu7suLWMl2Nac3p97g=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LJmSE7uXzqS4u2zpzKrnqDoHdlK4B+D/giL+mvu8y0pSflE3W3rqEFZNE3kcQXr/a
	 8jB5d5/eMyl46qj5JNh+mQyWKpZhrgB/zP816OhsfkJnVEjCDFF10ceNFz+OtR1+AX
	 dlCW7JlpOPn8MnMfS87857fB6FKqqt5cLwabrun4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04FF3F8020D;
	Mon, 12 Oct 2020 14:19:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 75790F80217; Mon, 12 Oct 2020 14:19:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30, RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C6D7EF800F6
 for <alsa-devel@alsa-project.org>; Mon, 12 Oct 2020 14:19:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6D7EF800F6
IronPort-SDR: 6aJi7vxyK6onF2VVayxzvLrn0dKSrjhLGTfOb8nW9j+DjF80qmNFvdrqakosyDUXLUrDPXwtJL
 nAT5UcpK5UAQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9771"; a="152655883"
X-IronPort-AV: E=Sophos;i="5.77,366,1596524400"; d="scan'208";a="152655883"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2020 05:19:38 -0700
IronPort-SDR: kvQH1Tk+iNzZq4vqE4jJXLiW+tgv004mA0HuYIjBQ6QrFyrku2bnWBHHg0x34yT0qkokBhVxqZ
 dwNgl1KDL+Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,366,1596524400"; d="scan'208";a="344868790"
Received: from irsmsx605.ger.corp.intel.com ([163.33.146.138])
 by fmsmga004.fm.intel.com with ESMTP; 12 Oct 2020 05:19:36 -0700
Received: from irsmsx601.ger.corp.intel.com (163.33.146.7) by
 IRSMSX605.ger.corp.intel.com (163.33.146.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 12 Oct 2020 13:19:36 +0100
Received: from irsmsx601.ger.corp.intel.com ([163.33.146.7]) by
 irsmsx601.ger.corp.intel.com ([163.33.146.7]) with mapi id 15.01.1713.004;
 Mon, 12 Oct 2020 13:19:36 +0100
From: "Rojewski, Cezary" <cezary.rojewski@intel.com>
To: Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.de>
Subject: RE: [PATCH v2 00/13] ASoC: Intel: Remove obsolete solutions and
 components
Thread-Topic: [PATCH v2 00/13] ASoC: Intel: Remove obsolete solutions and
 components
Thread-Index: AQHWm6zgujBgnZDY0kedbl6MD/dAjKmTmpiAgAAL9ACAACktAIAABOEAgAAWNMA=
Date: Mon, 12 Oct 2020 12:19:35 +0000
Message-ID: <cb5d62e393e7483f8f60b52fbc52dbc3@intel.com>
References: <20201006064907.16277-1-cezary.rojewski@intel.com>
 <cf1fb47d-412f-48fd-4501-e63f1db32bc1@redhat.com>
 <s5ha6wrretr.wl-tiwai@suse.de> <20201012113626.GA4332@sirena.org.uk>
 <bda70fe7-ac16-8215-5506-c4144064bcfd@redhat.com>
In-Reply-To: <bda70fe7-ac16-8215-5506-c4144064bcfd@redhat.com>
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
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "Hejmowski,
 Krzysztof" <krzysztof.hejmowski@intel.com>, "Kaczmarski,
 Filip" <filip.kaczmarski@intel.com>, "N,
 Harshapriya" <harshapriya.n@intel.com>,
 "ppapierkowski@habana.ai" <ppapierkowski@habana.ai>, "Barlik,
 Marcin" <marcin.barlik@intel.com>, "zwisler@google.com" <zwisler@google.com>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "Proborszcz,
 Filip" <filip.proborszcz@intel.com>,
 "amadeuszx.slawinski@linux.intel.com" <amadeuszx.slawinski@linux.intel.com>,
 "Wasko, Michal" <michal.wasko@intel.com>, "tiwai@suse.com" <tiwai@suse.com>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "cujomalainey@chromium.org" <cujomalainey@chromium.org>, "Gopal,
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

On 2020-10-12 1:53 PM, Hans de Goede wrote:
> Hi,
>=20
> On 10/12/20 1:36 PM, Mark Brown wrote:
>> On Mon, Oct 12, 2020 at 11:09:04AM +0200, Takashi Iwai wrote:
>>> Hans de Goede wrote:
>>
>>>> replacement and dropping the old code ?  I'm not sure if that is such
>>>> a great idea, what is the fallback plan if testing does find=20
>>>> significant
>>>> issues with the new catpt code ?
>>
>>> I find the action a bit too rushing, too.  OTOH, the old code wasn't
>>> well maintained, honestly speaking.  So, from another perspective,
>>> switching to a new code can be seen as a better chance to fix any
>>> bugs.
>>
>> That was my take as well - the old code seemed to be very fragile for
>> structural reasons which are hopefully addressed here and Intel seem
>> willing to actively work on supporting this version.  I have to confess
>> I had assumed Hans had seen all this stuff going past, the new driver
>> got quite a few rounds of review.

Thanks for your encouraging words, Takashi and Mark.

My faith is with accuracy of our CI, not the fingers crossing though : )

Happy to receive any feedback. Andy pushed me to dig several low-level
issues e.g. DMA engine configuration and PCI description which were
hidden since 2014 behind other errors, what I'm thankful for.
v1 addressed the latter, further series the former.

Indeed, given the resources that have been put into assembling active
HSW/BDW CI - which happily joined the SKL-TGL family in racks -,
commitment to support the catpt solution is assured.

>=20
> My ASoC interest is 99% Intel Bay Trail / Cherry Trail support, so
> I'm not on alsa-devel list since that gets a lot more then just that.
>=20
> IOW I'm relying on being Cc-ed, which might not be the best tactic
> I guess.
>=20
> Anyways, the Bay Trail / Cherry Trail changes here are 100% ok with me.
> I pointed out the Haswell / Broadwell bits since I was taking a look
> anyways, I don't really have a strong opinion on those, I've never seen
> a  Haswell / Broadwell machine actually using the SST/ASoC code,
> all those which I have seen use the HDA driver.
>=20
> And from the sounds of it for those rare Haswell / Broadwell machines
> which do use the SST code the new catpt code should be an improvement.
> So from my pov everything is good.
>=20

Hans,

I understand that actual DSP-hw is quite old (2011 dev, 2014 release) so
besides what is already available, I won't be adding many things. Those
are: firmware logs (debug feature), module support (WAVES). Nothing more,
nothing less. Immediately afterward catpt enters hard-maintenance stage
where only fixes are allowed.

Stress tests are still ongoing as my goal is to remove basically any-hsw
specific code (~50 lines) as hsw is here only from maintenance point of
view as explained in catpt's series cover-letter.

The more eyes looking at the code, the merrier : ) Thanks for your
input.

Regards,
Czarek

