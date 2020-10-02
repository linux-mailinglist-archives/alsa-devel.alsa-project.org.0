Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7DC280F06
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Oct 2020 10:34:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46CD01EFC;
	Fri,  2 Oct 2020 10:33:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46CD01EFC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601627676;
	bh=K4yxkYFP/FvRKDDEB+qGaIBu0tlzBlicCwTR2d5I6e0=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vEzkHjbSbm/D73l50C9oKkinGvdtsF7U/CuOWQnLBqmj3Yxk1Hoz0BzAo+5FeeHab
	 lndxcn1ZEmceg81aAKWRcX/8fA7e2Y/T3UCZSlLilL4bUer00mL3Xjq7a/+D3wjtpG
	 Xq7DfMKsSLV5iMprmzQsr67qgQemaMozl/GsmGvE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4752CF800AB;
	Fri,  2 Oct 2020 10:32:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A15EEF801ED; Fri,  2 Oct 2020 10:32:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F2F06F800E5
 for <alsa-devel@alsa-project.org>; Fri,  2 Oct 2020 10:32:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2F06F800E5
IronPort-SDR: 0pTlQ7JoOycgRT0GeyTU62Mg+ZLrQbHj6X/Tqfs1eMGkYrs3h+0jbhJVG4xG3Y8BLss6ksS2en
 P2SafAoSFOXA==
X-IronPort-AV: E=McAfee;i="6000,8403,9761"; a="163807401"
X-IronPort-AV: E=Sophos;i="5.77,326,1596524400"; d="scan'208";a="163807401"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2020 01:32:36 -0700
IronPort-SDR: Ax+9t2RD6Yw5aZRRnEQD4vqo/adY/NJLc4vMBTPlYP2l7G3IMtJ3iwZ/YLS6SyWQwrfqc+ftYh
 8zcYPXeQAHGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,326,1596524400"; d="scan'208";a="308971022"
Received: from irsmsx604.ger.corp.intel.com ([163.33.146.137])
 by orsmga003.jf.intel.com with ESMTP; 02 Oct 2020 01:32:35 -0700
Received: from irsmsx601.ger.corp.intel.com (163.33.146.7) by
 IRSMSX604.ger.corp.intel.com (163.33.146.137) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 2 Oct 2020 09:32:34 +0100
Received: from irsmsx601.ger.corp.intel.com ([163.33.146.7]) by
 irsmsx601.ger.corp.intel.com ([163.33.146.7]) with mapi id 15.01.1713.004;
 Fri, 2 Oct 2020 09:32:34 +0100
From: "Rojewski, Cezary" <cezary.rojewski@intel.com>
To: Mark Brown <broonie@kernel.org>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>
Subject: RE: [PATCH v10 14/14] ASoC: Intel: Select catpt and deprecate haswell
Thread-Topic: [PATCH v10 14/14] ASoC: Intel: Select catpt and deprecate haswell
Thread-Index: AQHWlmrLQob8q+OMl0uqglClvpPAzKmDBR2AgAAFx4CAAA9zgIAA5cCA
Date: Fri, 2 Oct 2020 08:32:34 +0000
Message-ID: <347145dee59c4dab900da84724382769@intel.com>
References: <20200929141247.8058-1-cezary.rojewski@intel.com>
 <20200929141247.8058-15-cezary.rojewski@intel.com>
 <20201001183329.GA41046@sirena.org.uk>
 <20201001185409.GV3956970@smile.fi.intel.com>
 <20201001194927.GY6715@sirena.org.uk>
In-Reply-To: <20201001194927.GY6715@sirena.org.uk>
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
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "Kaczmarski,
 Filip" <filip.kaczmarski@intel.com>, "N,
 Harshapriya" <harshapriya.n@intel.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "ppapierkowski@habana.ai" <ppapierkowski@habana.ai>, "Barlik,
 Marcin" <marcin.barlik@intel.com>, "zwisler@google.com" <zwisler@google.com>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "Proborszcz,
 Filip" <filip.proborszcz@intel.com>,
 "amadeuszx.slawinski@linux.intel.com" <amadeuszx.slawinski@linux.intel.com>,
 "Wasko, Michal" <michal.wasko@intel.com>, "tiwai@suse.com" <tiwai@suse.com>,
 "Hejmowski, Krzysztof" <krzysztof.hejmowski@intel.com>,
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

On 2020-10-01 9:49 PM, Mark Brown wrote:
> On Thu, Oct 01, 2020 at 09:54:09PM +0300, Andy Shevchenko wrote:
>=20
>> This has a dependency from SPI tree. Can you merge (cherry-pick) one pat=
ch from
>> there to ASoC tree, please?
>=20
>> a2bee00cccf4 ("spi: pxa2xx: Add SSC2 and SSPSP2 SSP registers")
>=20
> Ah, right - that was actually mentioned in the cover letter but got
> missed (I think I didn't register that it was a SPI change and stopped
> at the "already merged" bit).  It would have been helpful to highlight
> this with the SPI change so it could have been applied as a separate
> branch rather than on the main branch which would make this easier, this
> sort of stuff is why I like to have per driver branches.
>=20

While catpt's cover-letter mentioned this, indeed the SPI change was
devoid of such note. Sorry for that, Mark.

Is my action required?

Regards,
Czarek

