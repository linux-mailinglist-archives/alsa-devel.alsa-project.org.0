Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5371E2721B1
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Sep 2020 13:01:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF28816E7;
	Mon, 21 Sep 2020 13:00:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF28816E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600686072;
	bh=mnEbZ+Hr5aTpdpJlN5ycSvjEzl7k4f91TBGhTihiM2o=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JNeTcqYY8UlKXoPo8MNtncmWAURAAiEmqKFti4HdJh4P7uCMosEJdZ6TScMo9tsWo
	 mn9bWZkorP4hwdH0M1jPMtKqPNzGmin9JuQjr72CvEmr04NotJLphvJ3XPXb/nJTb5
	 v6BdPA6gZSOirIZRT49LidsmxB/h1xuJnor45+e0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DA146F801EC;
	Mon, 21 Sep 2020 12:59:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C2E2BF80171; Mon, 21 Sep 2020 12:59:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 27CBFF800B2
 for <alsa-devel@alsa-project.org>; Mon, 21 Sep 2020 12:59:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27CBFF800B2
IronPort-SDR: 9+ACTPBiuBKJLw//0F9xvEuWCtZdqkEksqZSGanUT9dBdcLS1aTmgbn80AWnkEqnN9Xh7Jw2qh
 e2WHXrcK4T5A==
X-IronPort-AV: E=McAfee;i="6000,8403,9750"; a="159649193"
X-IronPort-AV: E=Sophos;i="5.77,286,1596524400"; d="scan'208";a="159649193"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2020 03:59:16 -0700
IronPort-SDR: SwSHsDegSmkq8YQVoQoaakynq3/s6W8Zlq0zIteVZXfLNI7pj6LWEOxQdxlvJ0FEacpw9oNl/8
 nDD0IOFjsBhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,286,1596524400"; d="scan'208";a="509958769"
Received: from irsmsx606.ger.corp.intel.com ([163.33.146.139])
 by fmsmga006.fm.intel.com with ESMTP; 21 Sep 2020 03:59:14 -0700
Received: from irsmsx601.ger.corp.intel.com (163.33.146.7) by
 IRSMSX606.ger.corp.intel.com (163.33.146.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 21 Sep 2020 11:59:13 +0100
Received: from irsmsx601.ger.corp.intel.com ([163.33.146.7]) by
 irsmsx601.ger.corp.intel.com ([163.33.146.7]) with mapi id 15.01.1713.004;
 Mon, 21 Sep 2020 11:59:13 +0100
From: "Rojewski, Cezary" <cezary.rojewski@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: RE: [PATCH v5 01/13] ASoC: Intel: Add catpt device
Thread-Topic: [PATCH v5 01/13] ASoC: Intel: Add catpt device
Thread-Index: AQHWi32GW37jr4EJj0CkLtYrpbvLFKlrU1CAgAGfiDCABgJSEA==
Date: Mon, 21 Sep 2020 10:59:13 +0000
Message-ID: <f4a2b707794c4b95b031f0566fd5b76a@intel.com>
References: <20200915162944.16241-1-cezary.rojewski@intel.com>
 <20200915162944.16241-2-cezary.rojewski@intel.com>
 <20200916152455.GP3956970@smile.fi.intel.com>
 <106a660275de43fd93cce153b529ef2a@intel.com>
In-Reply-To: <106a660275de43fd93cce153b529ef2a@intel.com>
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

On 2020-09-17 5:15 PM, Rojewski, Cezary wrote:
> On 2020-09-16 5:24 PM, Andy Shevchenko wrote:
>> On Tue, Sep 15, 2020 at 06:29:32PM +0200, Cezary Rojewski wrote:
>>> Declare base structures, registers and device routines for the catpt
>>> solution. Catpt deprecates and is a direct replacement for
>>> sound/soc/intel/haswell. Supports Lynxpoint and Wildcat Point both.

...

>>> +static int __maybe_unused catpt_suspend(struct device *dev)
>>> +{
>>> +	struct catpt_dev *cdev =3D dev_get_drvdata(dev);
>>> +	struct dma_chan *chan;
>>> +	int ret;
>>> +
>>> +	chan =3D catpt_dma_request_config_chan(cdev);
>>> +	if (IS_ERR(chan))
>>> +		return PTR_ERR(chan);
>>> +
>>> +	memset(&cdev->dx_ctx, 0, sizeof(cdev->dx_ctx));
>>> +	ret =3D catpt_ipc_enter_dxstate(cdev, CATPT_DX_STATE_D3, &cdev->dx_ct=
x);
>>> +	if (ret) {
>>> +		ret =3D CATPT_IPC_ERROR(ret);
>>> +		goto exit;
>>> +	}
>>> +
>>> +	ret =3D catpt_dsp_stall(cdev, true);
>>> +	if (ret)
>>> +		goto exit;
>>> +
>>> +	ret =3D catpt_store_memdumps(cdev, chan);
>>> +	if (ret) {
>>> +		dev_err(cdev->dev, "store memdumps failed: %d\n", ret);
>>> +		goto exit;
>>> +	}
>>> +
>>> +	ret =3D catpt_store_module_states(cdev, chan);
>>> +	if (ret) {
>>> +		dev_err(cdev->dev, "store module states failed: %d\n", ret);
>>> +		goto exit;
>>> +	}
>>> +
>>> +	ret =3D catpt_store_streams_context(cdev, chan);
>>> +	if (ret) {
>>> +		dev_err(cdev->dev, "store streams ctx failed: %d\n", ret);
>>> +		goto exit;
>>> +	}
>>
>>> +exit:
>>
>> I would rather name it as 'out_dma_release' or so to explain what's goin=
g to be
>> done.
>>
>=20
> I find more descriptive labels inviting reader into: "this is an error
> path" thinking and that's why I prefer to stick with simple 'exit'. If
> you think that's not a way to go, can change this.
>=20

As I'm sending v7, goto labels have been updated to be move readable as
you requested: 'release_dma_chan'.

Notice that 'if' preceding 'exit' label can be simplified: drop goto,
drop redundant brackets.

I've added that into v7 update too.

Thanks,
Czarek
