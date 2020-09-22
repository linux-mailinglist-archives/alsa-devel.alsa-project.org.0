Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C77E2741A9
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Sep 2020 13:57:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D49071714;
	Tue, 22 Sep 2020 13:57:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D49071714
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600775878;
	bh=at54hSWnLrq8Wt1775SYLCmnNgm+ebYAGJEa0NKpa64=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KM+fIWyGrMgVGLCRm8UrpYBCBAmnrA8ci+rzDk0t7NjqtByeLe/5A01I8nHjbDige
	 HJ34K95DtjuEzFbUrcdWJMeKqVEECfywyCNB3k3wGKa36MY4dnVBV02IYfI2DLGSE2
	 EmjQ1dhKpyOZLlsYyA5y6wKhtmwsjjamYmahixCM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 109F5F8010A;
	Tue, 22 Sep 2020 13:56:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 16CFCF80229; Tue, 22 Sep 2020 13:56:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30, RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 45E6CF800ED
 for <alsa-devel@alsa-project.org>; Tue, 22 Sep 2020 13:56:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45E6CF800ED
IronPort-SDR: 47y2DiI8haBx8JsGRv3xXqXR2BC04ecI8if1UeRVpn/+7jWgHn+SjYGrSZ5ZIxxhCPdWTiJNZA
 wLXaXtvUUH9Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9751"; a="178649442"
X-IronPort-AV: E=Sophos;i="5.77,290,1596524400"; d="scan'208";a="178649442"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2020 04:56:05 -0700
IronPort-SDR: iflQVmLLkUJ5T+vjKUida18hFaHrLFKqjR78rlgzYp6P3LczDLk0ulh9zqadUv1i77m1Q9WKAl
 JW5tsha2U2XA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,290,1596524400"; d="scan'208";a="291272320"
Received: from irsmsx606.ger.corp.intel.com ([163.33.146.139])
 by fmsmga008.fm.intel.com with ESMTP; 22 Sep 2020 04:56:04 -0700
Received: from irsmsx601.ger.corp.intel.com (163.33.146.7) by
 IRSMSX606.ger.corp.intel.com (163.33.146.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 22 Sep 2020 12:56:03 +0100
Received: from irsmsx601.ger.corp.intel.com ([163.33.146.7]) by
 irsmsx601.ger.corp.intel.com ([163.33.146.7]) with mapi id 15.01.1713.004;
 Tue, 22 Sep 2020 12:56:03 +0100
From: "Rojewski, Cezary" <cezary.rojewski@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: RE: [PATCH v7 03/14] ASoC: Intel: catpt: Add IPC message handlers
Thread-Topic: [PATCH v7 03/14] ASoC: Intel: catpt: Add IPC message handlers
Thread-Index: AQHWkA4pBFUDuLKjeUm4qjF+MvEK1aly/TsAgABnvpD///fKgIAAMnCAgAC+vgCAADFoEP//9vUAgAAAcgCAABbfoA==
Date: Tue, 22 Sep 2020 11:56:02 +0000
Message-ID: <dd87dac3fd3a4e408dafa8a498ae3403@intel.com>
References: <20200921115424.4105-1-cezary.rojewski@intel.com>
 <20200921115424.4105-4-cezary.rojewski@intel.com>
 <20200921125934.GT3956970@smile.fi.intel.com>
 <55266617b42843839fb85309d3097fd6@intel.com>
 <20200921184129.GH3956970@smile.fi.intel.com>
 <191afe965b1e46799bf776be3254d28f@intel.com>
 <20200922090442.GJ3956970@smile.fi.intel.com>
 <4e51e628f9df457c8253a3ef6d7095eb@intel.com>
 <20200922112910.GM3956970@smile.fi.intel.com>
 <20200922113046.GN3956970@smile.fi.intel.com>
In-Reply-To: <20200922113046.GN3956970@smile.fi.intel.com>
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
 Krzysztof" <krzysztof.hejmowski@intel.com>, "Papierkowski,
 Piotr \(Habana\)" <ppapierkowski@habana.ai>, "Gopal, 
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

On 2020-09-22 1:30 PM, Andy Shevchenko wrote:
> On Tue, Sep 22, 2020 at 02:29:10PM +0300, Andy Shevchenko wrote:
>> On Tue, Sep 22, 2020 at 11:04:31AM +0000, Rojewski, Cezary wrote:
>>> On 2020-09-22 11:04 AM, Andy Shevchenko wrote:
>>>> On Mon, Sep 21, 2020 at 08:48:12PM +0000, Rojewski, Cezary wrote:
...

>>>> And here basically enough check is info against NULL, right?
>>>> Just try to look at different possibilities how to make code simpler a=
nd neater.
>>>>
>>>>> Didn't compile this, some typecheck fixes might be in order and so on=
.
>>>>
>>>
>>> What you meant is:
>>> 	if (i =3D=3D 4 && !info) // instead of 'info < eof'
>>>
>>> right?
>>
>> Simply if (!info)...
>=20
> 	if (info)
> 		memcpy();
>=20
> of course, otherwise it will crash.
>=20

Indeed, sorry about the typo.

>>> If 4th space is last char in this string then info would end up being
>>> non-NULL and equal to 'eof' and thus memcpy() would get invoked with
>>> size=3Deof-info=3D0.
>>
>> ...which is not a problem.
>=20

And what about the case where 1st space is the last char?
We quit the loop afterward, 'info' will not be NULL, 'i' on the other
hand certainly won't be 4.
TLDR: without checking 'i' how am I sure about whether or not cursor is
actually at 5th segment?

Czarek

