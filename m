Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 59153273157
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Sep 2020 19:59:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC7BC16BF;
	Mon, 21 Sep 2020 19:58:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC7BC16BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600711156;
	bh=xsH1fIMCdxhSL8kbBlvgeIjLm8FJ177tvtj5TgAtlyk=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HhVXIGL0UQkm8wvTUVmfC7EMeXkj+qyyAfQQR4bcsC+hvJCP/HWmsIVE6l5kbPJyE
	 243M6gRYCeYwRgGnMIh+EdSNRw3by1AB3gsAFSmP31XCNC+PduKV8to2E31o45CnKM
	 N3b/vvhZ70YJg3U1diAk9GNCK0Dab4PlEw/o8Oew=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0DFFF80171;
	Mon, 21 Sep 2020 19:57:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7D89CF8010A; Mon, 21 Sep 2020 19:57:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8B032F8010A
 for <alsa-devel@alsa-project.org>; Mon, 21 Sep 2020 19:57:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B032F8010A
IronPort-SDR: JfLuZYJiZc0GgXvqaF5FNAdgDHQzb18JI3j8md1h7WiwoiV1N9fCXXlEt96BEbppcBPKr+HcB7
 VV+z8vFHopag==
X-IronPort-AV: E=McAfee;i="6000,8403,9751"; a="159739447"
X-IronPort-AV: E=Sophos;i="5.77,287,1596524400"; d="scan'208";a="159739447"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2020 10:57:15 -0700
IronPort-SDR: chj21VFCOIgKHLLWmDXe6eg2H+c882ALXICXkwAvDnBruX/hVSVHFoRbj3z0AlXbdpLgQTNbgI
 QfedoeDZryjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,287,1596524400"; d="scan'208";a="304623884"
Received: from irsmsx603.ger.corp.intel.com ([163.33.146.9])
 by orsmga003.jf.intel.com with ESMTP; 21 Sep 2020 10:57:13 -0700
Received: from irsmsx601.ger.corp.intel.com (163.33.146.7) by
 irsmsx603.ger.corp.intel.com (163.33.146.9) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 21 Sep 2020 18:57:12 +0100
Received: from irsmsx601.ger.corp.intel.com ([163.33.146.7]) by
 irsmsx601.ger.corp.intel.com ([163.33.146.7]) with mapi id 15.01.1713.004;
 Mon, 21 Sep 2020 18:57:12 +0100
From: "Rojewski, Cezary" <cezary.rojewski@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: RE: [PATCH v7 02/14] ASoC: Intel: catpt: Implement IPC protocol
Thread-Topic: [PATCH v7 02/14] ASoC: Intel: catpt: Implement IPC protocol
Thread-Index: AQHWkA4mLmmw5DPHok6M6QEQPAPmJqly/YkAgABjZhA=
Date: Mon, 21 Sep 2020 17:57:11 +0000
Message-ID: <21d003e6ce6f42dd9be81bd41014c463@intel.com>
References: <20200921115424.4105-1-cezary.rojewski@intel.com>
 <20200921115424.4105-3-cezary.rojewski@intel.com>
 <20200921130040.GU3956970@smile.fi.intel.com>
In-Reply-To: <20200921130040.GU3956970@smile.fi.intel.com>
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

On 2020-09-21 3:00 PM, Andy Shevchenko wrote:
> On Mon, Sep 21, 2020 at 01:54:12PM +0200, Cezary Rojewski wrote:
>> Implement IRQ handlers for immediate and delayed replies and
>> notifications. Communication is synchronous and allows for serialization
>> of maximum one message at a time.
>>
>> DSP may respond with ADSP_PENDING status for a request - known as
>> delayed reply - and when situation occurs, framework keeps the lock and
>> awaits upcoming response through IPCD channel which is handled in
>> bottom-half. Immediate replies spawn no BH at all as their processing is
>> very short.
>>
>> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>

...

>> diff --git a/sound/soc/intel/catpt/ipc.c b/sound/soc/intel/catpt/ipc.c
>> new file mode 100644
>> index 000000000000..500d4845a7cf
>> --- /dev/null
>> +++ b/sound/soc/intel/catpt/ipc.c
>> @@ -0,0 +1,246 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +//
>> +// Copyright(c) 2020 Intel Corporation. All rights reserved.
>> +//
>> +// Author: Cezary Rojewski <cezary.rojewski@intel.com>
>> +//
>> +
>> +#include <linux/irqreturn.h>
>> +#include "core.h"
>> +#include "messages.h"
>> +#include "registers.h"
>> +
>> +#define CATPT_IPC_TIMEOUT_MSECS	300
>=20
> A nit-pick: _MS is enough.
>=20

Sure, will reword this and one _MSECS that is found within loader.c

Thanks!

