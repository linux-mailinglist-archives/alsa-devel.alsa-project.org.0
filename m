Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A98A42D9495
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Dec 2020 10:10:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4824F1612;
	Mon, 14 Dec 2020 10:09:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4824F1612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607937046;
	bh=71q7T4yAVGPhYjz7ww8c4j9pHMjnChBFOqCf+ha/XgE=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gSJHJzsBKiCtIR+YL1TjDbYTXweJwkrLPpH7vJNk07svAxEkbGagHgLkY4PsNvbrQ
	 THUFViZadji2BMLt2O1yIQiD+T92g8vpT3CvotGZ6sGozqtL88xDYN4bWvf4ujir2O
	 BJYZ9QzPKCUi+wRF2AwA8FDPlV3KJNZsV0P778j0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C2969F80171;
	Mon, 14 Dec 2020 10:09:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BFDBBF801F7; Mon, 14 Dec 2020 10:09:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 531D4F80129
 for <alsa-devel@alsa-project.org>; Mon, 14 Dec 2020 10:08:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 531D4F80129
IronPort-SDR: KSBSKzsV0gpYoYK2d7WNwsy71zTUFmLX58/kGaOEHgbnCDjg5zUeuWT5YRRJ8X4zHKdC2n98ka
 KoaggCUOY7BQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9834"; a="153909201"
X-IronPort-AV: E=Sophos;i="5.78,418,1599548400"; d="scan'208";a="153909201"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2020 01:08:50 -0800
IronPort-SDR: xPzgKZQnh+ubZYnPU5ZhWL6WQZG2ZGvRNCMabknE6rXaPec5agfeZlzD3kxGvGly754p4ffykm
 SxJlsuAundzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,418,1599548400"; d="scan'208";a="351224147"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga002.jf.intel.com with ESMTP; 14 Dec 2020 01:08:50 -0800
Received: from bgsmsx602.gar.corp.intel.com (10.109.78.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 14 Dec 2020 01:08:48 -0800
Received: from irsmsx601.ger.corp.intel.com (163.33.146.7) by
 BGSMSX602.gar.corp.intel.com (10.109.78.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 14 Dec 2020 14:38:45 +0530
Received: from irsmsx601.ger.corp.intel.com ([163.33.146.7]) by
 irsmsx601.ger.corp.intel.com ([163.33.146.7]) with mapi id 15.01.1713.004;
 Mon, 14 Dec 2020 09:08:44 +0000
From: "Rojewski, Cezary" <cezary.rojewski@intel.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: RE: [PATCH] ASoC: Intel: fix error code cnl_set_dsp_D0()
Thread-Topic: [PATCH] ASoC: Intel: fix error code cnl_set_dsp_D0()
Thread-Index: AQHWz6VrP/elf/kqtEm4xays79ITg6n2UdQQ
Date: Mon, 14 Dec 2020 09:08:44 +0000
Message-ID: <b3df1e4d04c84b02939321c6994ec978@intel.com>
References: <X9NEvCzuN+IObnTN@mwanda>
In-Reply-To: <X9NEvCzuN+IObnTN@mwanda>
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
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "Singh, 
 Guneshwor O" <guneshwor.o.singh@intel.com>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, Mark
 Brown <broonie@kernel.org>
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

On 2020-12-11 11:06 AM, Dan Carpenter wrote:
> Return -ETIMEDOUT if the dsp boot times out instead of returning
> success.
>=20
> Fixes: cb6a55284629 ("ASoC: Intel: cnl: Add sst library functions for cnl=
 platform")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> Not tested.
>=20
>   sound/soc/intel/skylake/cnl-sst.c | 1 +
>   1 file changed, 1 insertion(+)
>=20
> diff --git a/sound/soc/intel/skylake/cnl-sst.c b/sound/soc/intel/skylake/=
cnl-sst.c
> index fcd8dff27ae8..1275c149acc0 100644
> --- a/sound/soc/intel/skylake/cnl-sst.c
> +++ b/sound/soc/intel/skylake/cnl-sst.c
> @@ -224,6 +224,7 @@ static int cnl_set_dsp_D0(struct sst_dsp *ctx, unsign=
ed int core_id)
>   				"dsp boot timeout, status=3D%#x error=3D%#x\n",
>   				sst_dsp_shim_read(ctx, CNL_ADSP_FW_STATUS),
>   				sst_dsp_shim_read(ctx, CNL_ADSP_ERROR_CODE));
> +			ret =3D -ETIMEDOUT;
>   			goto err;
>   		}
>   	} else {
>=20

Thanks for the patch, Dan.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>

