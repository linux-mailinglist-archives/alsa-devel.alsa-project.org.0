Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8692C283F4A
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Oct 2020 21:07:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC79417A6;
	Mon,  5 Oct 2020 21:06:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC79417A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601924833;
	bh=G/pZ9DXMrMyNgyeEUSTiNj4K+XiKOc62/XJpaTgZ9M4=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XzDmnpcFP2J3BYKuXkX4a2A6lVy5KnzRmMCDtbaFqvXUSoOoE6bMTOx69kibfX46e
	 MxzD3lJ2CJdUKsFqc4ujevb+NHrA29rz33/CLdEBkhltVwhFqiFH0xTsbQeoT9AVJ9
	 mJk3t5LPFb8Bo7AInsG54j+fNzNOK6FRWF6i4Jv4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 01408F80260;
	Mon,  5 Oct 2020 21:05:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7AEF7F8025A; Mon,  5 Oct 2020 21:05:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 55393F80121
 for <alsa-devel@alsa-project.org>; Mon,  5 Oct 2020 21:05:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55393F80121
IronPort-SDR: /jj8PvDHi8Y4FVO61MAe+b8XpzKmNVfP//BwIJoWcKpKqpxm+IOXQoObUUJZ/vnCNAIqdfOx9L
 ebplVddIf1sw==
X-IronPort-AV: E=McAfee;i="6000,8403,9765"; a="143246976"
X-IronPort-AV: E=Sophos;i="5.77,340,1596524400"; d="scan'208";a="143246976"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP; 05 Oct 2020 12:02:10 -0700
IronPort-SDR: IrPWW94UAQpszI0OmmrcSC97F+OtZYtZC9Lhg7qL5Pvdh5xeEEW5bIki9FaoHWBttCbmdAgp8m
 +tpJsnwJF4CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,340,1596524400"; d="scan'208";a="342969387"
Received: from irsmsx603.ger.corp.intel.com ([163.33.146.9])
 by orsmga008.jf.intel.com with ESMTP; 05 Oct 2020 10:25:30 -0700
Received: from irsmsx601.ger.corp.intel.com (163.33.146.7) by
 irsmsx603.ger.corp.intel.com (163.33.146.9) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 5 Oct 2020 18:25:27 +0100
Received: from irsmsx601.ger.corp.intel.com ([163.33.146.7]) by
 irsmsx601.ger.corp.intel.com ([163.33.146.7]) with mapi id 15.01.1713.004;
 Mon, 5 Oct 2020 18:25:27 +0100
From: "Rojewski, Cezary" <cezary.rojewski@intel.com>
To: Mark Brown <broonie@kernel.org>
Subject: RE: [PATCH 03/13] ASoC: Intel: Remove rt5640 support for baytrail
 solution
Thread-Topic: [PATCH 03/13] ASoC: Intel: Remove rt5640 support for baytrail
 solution
Thread-Index: AQHWmjVhwY2WPWmBF0qXfJGHo/aVT6mJJ1eAgAAcoSA=
Date: Mon, 5 Oct 2020 17:25:26 +0000
Message-ID: <ca16b4920db44e0789d2786634531df2@intel.com>
References: <20201004100128.5842-1-cezary.rojewski@intel.com>
 <20201004100128.5842-4-cezary.rojewski@intel.com>
 <20201005164041.GA29181@sirena.org.uk>
In-Reply-To: <20201005164041.GA29181@sirena.org.uk>
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

On 2020-10-05 6:40 PM, Mark Brown wrote:
> On Sun, Oct 04, 2020 at 12:01:18PM +0200, Cezary Rojewski wrote:
>> byt-rt5640 is deprecated in favor of bytcr_rt5640 used by
>> sound/soc/intel/atom and SOF solutions both. Remove redundant machine
>> board and all related code.
>=20
> This doesn't apply against current code, please check and resend.
>=20

Hmm, not seeing any problems when applying these 13 patches on
broonie/sound branch: for-next on my end.

For for-5.10 branch, I see that 'git am' failed on:
PATCH 04/13 ASoC: Intel: Remove baytrail solution
i.e. couldn't find sst-baytrail-pcm.c node (probably changed in between)
but this is certainly not the 04/13 patch.

What am I missing?

Thanks,
Czarek

