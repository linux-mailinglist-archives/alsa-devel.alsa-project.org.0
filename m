Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8952C2572
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Nov 2020 13:15:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E83B71685;
	Tue, 24 Nov 2020 13:14:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E83B71685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606220103;
	bh=1byQ1ti+IVq/zIRFazdI8g5yc0t6tuDqE8aoC7Kep5E=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K5ZC/QqwyFaJNZpJWT3wqRUlu1yoTyqXgk42DT8ArLMqaS8iNwmhON/OpHL6YMdm7
	 xzFll0AwmlzQRvYHI7WIuZQ8jQb9eNfe824aKgTUyQSar5WvhPIo5wek+6hUBMevS1
	 p9LCCUut+hPqYBwTTkqJyFGo0ImnMF1j8zqSfMUU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7EA2AF8015A;
	Tue, 24 Nov 2020 13:13:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3671F80165; Tue, 24 Nov 2020 13:13:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 62D84F80128
 for <alsa-devel@alsa-project.org>; Tue, 24 Nov 2020 13:13:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62D84F80128
IronPort-SDR: FjwFFDL0q/bAPzRGvCv9zBMc1hu71mZh9p71fssh+lvXZOGarntrlBUTKXQwAuHFUwsD4yAVXW
 fmwDd8V1ndCg==
X-IronPort-AV: E=McAfee;i="6000,8403,9814"; a="172030430"
X-IronPort-AV: E=Sophos;i="5.78,366,1599548400"; d="scan'208";a="172030430"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2020 04:13:14 -0800
IronPort-SDR: 7sRMgkqgJDGROzikiPg+doVbqcPXuLq5Oh0AmMXWxvWpXe6UWiqMbnEVhOKVvWr42ZxXgr6nuM
 JONFxg0kJ8PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,366,1599548400"; d="scan'208";a="478478918"
Received: from irsmsx604.ger.corp.intel.com ([163.33.146.137])
 by orsmga004.jf.intel.com with ESMTP; 24 Nov 2020 04:13:12 -0800
Received: from irsmsx601.ger.corp.intel.com (163.33.146.7) by
 IRSMSX604.ger.corp.intel.com (163.33.146.137) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 24 Nov 2020 12:13:11 +0000
Received: from irsmsx601.ger.corp.intel.com ([163.33.146.7]) by
 irsmsx601.ger.corp.intel.com ([163.33.146.7]) with mapi id 15.01.1713.004;
 Tue, 24 Nov 2020 12:13:11 +0000
From: "Rojewski, Cezary" <cezary.rojewski@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: RE: [PATCH v1] ASoC: Intel: catpt: Replace open coded variant of
 resource_intersection()
Thread-Topic: [PATCH v1] ASoC: Intel: catpt: Replace open coded variant of
 resource_intersection()
Thread-Index: AQHWwkgdIGKaAow/nEuYVlWZrtvA4KnXMNWA
Date: Tue, 24 Nov 2020 12:13:11 +0000
Message-ID: <f33b4381ea3a4cf4b8e7f27676cd90ed@intel.com>
References: <20201124095628.54373-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20201124095628.54373-1-andriy.shevchenko@linux.intel.com>
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
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>
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

On 2020-11-24 10:56 AM, Andy Shevchenko wrote:
> Since we have resource_intersection() helper, let's utilize it here.
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>=20
> Promised clean up for recently introduced helper.
>=20
> This has dependency to the patches currently in linux-pm tree. Other than=
 that
> everything else is already in upstream. Hence, logically it's better to p=
ush
> thru Rafael's tree than wait one more cycle.
>=20
>   sound/soc/intel/catpt/core.h   | 11 -----------
>   sound/soc/intel/catpt/loader.c |  2 +-
>   2 files changed, 1 insertion(+), 12 deletions(-)
>=20

Thanks for the patch, Andy.

I hope you didn't get the impression I somehow forgotten about this : )
Wanted to make it part of "cleanup/code reduction" after addition of
last two missing features (fw traces + external module support).

Fixes and removal of lpt-specific code were the priority though.
As change is already here, I don't see any reason for delaying its
merge:

Acked-by: Cezary Rojewski <cezary.rojewski@intel.com>

Regards,
Czarek
