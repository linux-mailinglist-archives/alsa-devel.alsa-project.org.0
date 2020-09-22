Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C46FF27405D
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Sep 2020 13:06:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 458661703;
	Tue, 22 Sep 2020 13:05:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 458661703
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600772789;
	bh=kakvoiEfaQGRMKZOV3SHp1EWK/zNA3NmVVAsz+tKQkY=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KvkX30TW0MMRfsb4hFIQ46K1a8UhzJ7xKTyKAsSNyisG/7PpdUqg075p1CGJaOyI+
	 SazIB/jYqUfhpNwRWropZBzRlk1D3cDlIxaNSkgxACSGlC3ugPehovldEvji9q+Nrm
	 DYL+R6rwj3oT6YGREBhBi4JQX0fBlTeqAxccQuMA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 81206F800ED;
	Tue, 22 Sep 2020 13:04:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3999DF80229; Tue, 22 Sep 2020 13:04:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 148F1F800ED
 for <alsa-devel@alsa-project.org>; Tue, 22 Sep 2020 13:04:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 148F1F800ED
IronPort-SDR: jiT1UzUuoevkAiGDJgoU8rWpBT5OH7hTTrdFvL5exPFc0gceblyc9alUcz+xSyA5KRYTNkug3S
 aJtAalApsUNg==
X-IronPort-AV: E=McAfee;i="6000,8403,9751"; a="148242569"
X-IronPort-AV: E=Sophos;i="5.77,290,1596524400"; d="scan'208";a="148242569"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2020 04:04:34 -0700
IronPort-SDR: lsbafTbOZkBJTUW4tVhLDOxBcabUSVRBtObTVeME75m2+BX6EQlt7MlmwztSiL+gDgmWeAs5JU
 NDAvneEIKnzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,290,1596524400"; d="scan'208";a="334963608"
Received: from irsmsx606.ger.corp.intel.com ([163.33.146.139])
 by fmsmga004.fm.intel.com with ESMTP; 22 Sep 2020 04:04:32 -0700
Received: from irsmsx601.ger.corp.intel.com (163.33.146.7) by
 IRSMSX606.ger.corp.intel.com (163.33.146.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 22 Sep 2020 12:04:31 +0100
Received: from irsmsx601.ger.corp.intel.com ([163.33.146.7]) by
 irsmsx601.ger.corp.intel.com ([163.33.146.7]) with mapi id 15.01.1713.004;
 Tue, 22 Sep 2020 12:04:31 +0100
From: "Rojewski, Cezary" <cezary.rojewski@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: RE: [PATCH v7 03/14] ASoC: Intel: catpt: Add IPC message handlers
Thread-Topic: [PATCH v7 03/14] ASoC: Intel: catpt: Add IPC message handlers
Thread-Index: AQHWkA4pBFUDuLKjeUm4qjF+MvEK1aly/TsAgABnvpD///fKgIAAMnCAgAC+vgCAADFoEA==
Date: Tue, 22 Sep 2020 11:04:31 +0000
Message-ID: <4e51e628f9df457c8253a3ef6d7095eb@intel.com>
References: <20200921115424.4105-1-cezary.rojewski@intel.com>
 <20200921115424.4105-4-cezary.rojewski@intel.com>
 <20200921125934.GT3956970@smile.fi.intel.com>
 <55266617b42843839fb85309d3097fd6@intel.com>
 <20200921184129.GH3956970@smile.fi.intel.com>
 <191afe965b1e46799bf776be3254d28f@intel.com>
 <20200922090442.GJ3956970@smile.fi.intel.com>
In-Reply-To: <20200922090442.GJ3956970@smile.fi.intel.com>
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

On 2020-09-22 11:04 AM, Andy Shevchenko wrote:
> On Mon, Sep 21, 2020 at 08:48:12PM +0000, Rojewski, Cezary wrote:
>> On 2020-09-21 8:41 PM, Andy Shevchenko wrote:

...

>> While this should never happen (means user is somehow not making use of
>> officially released firmware binary), coredumps are useful only if you
>> have access to debug tools. In cases you'd mentioned, invalid hash would
>> have been dumped to coredump and crash reader simply wouldn't have been
>> able to navigate to actual build for it. The rest of the coredump is sti=
ll
>> vital though.
>>
>> memcpy() could be gated behind an 'if' for safety if needed:
>>
>> 	info =3D cdev->ipc.config.fw_info;
>> 	eof =3D info + FW_INFO_SIZE_MAX;
>> 	/* navigate to fifth info segment (fw hash) */
>> 	for (i =3D 0; i < 4 && info < eof; i++, info++)
>> 		/* info segments are separated by space each */
>> 		if ((info =3D strnchr(info, eof - info, ' ')) =3D=3D NULL)
>> 			break;
>=20
>> 	if (i =3D=3D 4 && info < eof)
>> 		memcpy(pos, info, min(eof - info, CATPT_DUMP_HASH_SIZE));
>=20
> And here basically enough check is info against NULL, right?
> Just try to look at different possibilities how to make code simpler and =
neater.
>=20
>> Didn't compile this, some typecheck fixes might be in order and so on.
>=20

What you meant is:
	if (i =3D=3D 4 && !info) // instead of 'info < eof'

right?

If 4th space is last char in this string then info would end up being
non-NULL and equal to 'eof' and thus memcpy() would get invoked with
size=3Deof-info=3D0.

catpt_coredump() is here to gather debug info for Intel folks to analyze
in case of critical error. In ideal world, it should not be required at
all as when we get here, there are bigger problems on our head.
Above solution is simpler than what is prevent in v7 while also
maintaining good readability - variable names - plus comments which you
suggested.

Czarek

