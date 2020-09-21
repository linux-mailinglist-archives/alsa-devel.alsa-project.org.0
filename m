Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E54272188
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Sep 2020 12:55:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46AE916FD;
	Mon, 21 Sep 2020 12:55:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46AE916FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600685758;
	bh=GApe8jFt9KndEVDjA0LC8Onu1cM9YOBeURezqEvxi7Q=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OEO0SE05i8LXyMnjGaTQ1qSeAbTm69hrpjKTdZOHmO6wjS4P+d+wFI9G/QU3Vn2FO
	 sUA0LaYg3aIycXRmXOF3xJdrE0xaN+73luGc8Pi6ikuBrVc36/fyTjw+IHwXG/FtSS
	 iAZNvY1gGeybUA4snzDoi01CusuM8ixGRbz0cSRw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 72DD9F800B2;
	Mon, 21 Sep 2020 12:54:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 34003F80162; Mon, 21 Sep 2020 12:54:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EA75DF80161
 for <alsa-devel@alsa-project.org>; Mon, 21 Sep 2020 12:54:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA75DF80161
IronPort-SDR: wCl3ci3BecHIkv/Fh6PG+KQesF4ygmkkPyMknNzQRUFqmCpKftnbO4c+okw1ddSXZp+cykoAN6
 z+xpcZWMgbuA==
X-IronPort-AV: E=McAfee;i="6000,8403,9750"; a="178425474"
X-IronPort-AV: E=Sophos;i="5.77,286,1596524400"; d="scan'208";a="178425474"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2020 03:54:05 -0700
IronPort-SDR: 2sTcmJxZ4Eg0nSDP2VAhvtZtfQ/bYjFMhd7pNf2BcU7yj7hljtPxhfX/W1swDLFVt82KhEd67P
 9IczX4N2J7GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,286,1596524400"; d="scan'208";a="510647779"
Received: from irsmsx602.ger.corp.intel.com ([163.33.146.8])
 by fmsmga005.fm.intel.com with ESMTP; 21 Sep 2020 03:54:04 -0700
Received: from irsmsx601.ger.corp.intel.com (163.33.146.7) by
 irsmsx602.ger.corp.intel.com (163.33.146.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 21 Sep 2020 11:54:02 +0100
Received: from irsmsx601.ger.corp.intel.com ([163.33.146.7]) by
 irsmsx601.ger.corp.intel.com ([163.33.146.7]) with mapi id 15.01.1713.004;
 Mon, 21 Sep 2020 11:54:02 +0100
From: "Rojewski, Cezary" <cezary.rojewski@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: RE: [PATCH v5 02/13] ASoC: Intel: catpt: Define DSP operations
Thread-Topic: [PATCH v5 02/13] ASoC: Intel: catpt: Define DSP operations
Thread-Index: AQHWi32IyHHVImF91k6rxcFTJOLC7alrWLCAgAGd/ECAAWeRAIAElYKg
Date: Mon, 21 Sep 2020 10:54:02 +0000
Message-ID: <237c4e6f0ff14026a7aaa5118ad47aee@intel.com>
References: <20200915162944.16241-1-cezary.rojewski@intel.com>
 <20200915162944.16241-3-cezary.rojewski@intel.com>
 <20200916154409.GQ3956970@smile.fi.intel.com>
 <96ee725f1aa746c78ee380bb8e754ff3@intel.com>
 <20200918135248.GC3956970@smile.fi.intel.com>
In-Reply-To: <20200918135248.GC3956970@smile.fi.intel.com>
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
 Harshapriya" <harshapriya.n@intel.com>, "Barlik,
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

On 2020-09-18 3:52 PM, Andy Shevchenko wrote:
> On Thu, Sep 17, 2020 at 03:29:36PM +0000, Rojewski, Cezary wrote:
>> On 2020-09-16 5:44 PM, Andy Shevchenko wrote:
>>> On Tue, Sep 15, 2020 at 06:29:33PM +0200, Cezary Rojewski wrote:
>=20
> ...
>=20
>>>> +	dmac->regs =3D cdev->lpe_ba +
>>>> +		     cdev->spec->host_dma_offset[CATPT_DMA_DEVID];
>>>
>>> One line?
>>>
>> It's exactly 81 after one-lining - that's why I kept it as is.
>=20
> And 81 is okay when there is better readability.
>=20
> I'm wondering why you don't go 100...
>=20
> In any case it's not a reason to resend.
>

As I'll be sending v7, this nitpick will be addressed there too.

Thanks,
Czarek

