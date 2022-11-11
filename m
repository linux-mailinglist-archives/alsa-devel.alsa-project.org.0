Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FE9624FE6
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Nov 2022 02:48:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0DC215CC;
	Fri, 11 Nov 2022 02:47:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0DC215CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668131317;
	bh=LsLwuJGxY3T/eqhHzQzb/hB6ASDecYTJ99F4oFiOpQk=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=co0JGwO3HetO7TlG5o+eghlwckmt4U1gfOn5xrbfAcmMNEqN88XxZg08fbdlKvG97
	 kAuX7FdRGehrTVH7UIlK/6OmIVphVLVTN+qfyY6Ew6vqRUATeYFpcqadCyVli6aAHm
	 G0jcC8DE0MBkZP1g3viHWnj++hWi2dni7QbSso+8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 54962F80162;
	Fri, 11 Nov 2022 02:47:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 94549F80162; Fri, 11 Nov 2022 02:47:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 50E9BF80162
 for <alsa-devel@alsa-project.org>; Fri, 11 Nov 2022 02:47:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50E9BF80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="dOToJKZd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668131255; x=1699667255;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LsLwuJGxY3T/eqhHzQzb/hB6ASDecYTJ99F4oFiOpQk=;
 b=dOToJKZdXLZm2KrH1S8Y15PoOMnBAUPSOuhX7nk3rtvbxKLgrAY4BQgm
 PqkrD1bSyOH/6eWBW/ZNLD9Ehid2bDf/SoyieG6OC/VvkbVr/MoTomHx7
 dQtzI+4TUaGJdPjSDuznNSCvpIMQdJh0KWHZrXv8l3mE4QyNVNp5Yompp
 5Gz3PnOcxUE736nH2udW361O4hAJwQ30+dCFYyz//FGyhEDkwWGos93b6
 im3FZ4Gfh9vWgrEwxPka7ZmHen+etF+uANj3h1cPDD94eQBKZeI8RYlHa
 4lqgtauZu5z5TAwsDNa8zMvO6Tqx8xxaNy3+Q4zZtZVStqnJDHHZNmhfS g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="313278227"
X-IronPort-AV: E=Sophos;i="5.96,155,1665471600"; d="scan'208";a="313278227"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 17:47:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="639845411"
X-IronPort-AV: E=Sophos;i="5.96,155,1665471600"; d="scan'208";a="639845411"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga007.fm.intel.com with ESMTP; 10 Nov 2022 17:47:31 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 10 Nov 2022 17:47:31 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 10 Nov 2022 17:47:30 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 10 Nov 2022 17:47:30 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.49) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 10 Nov 2022 17:47:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n+0quYAWqPv0svdGIbLVMdaRP6u48RcbhkX4RgSS5wDG+TUs85t80PqBH+zr+ZbDBu6DOl0cVA2SmnouOujRMiZhwWe7cZBlkcVw/7qetAJ8lqKJRdSvMuq2/vwxOvx3XxYC3HBtIx8HPwAa8KXx2YM3pHPE4wbMmc21EAFFSiXTvqiS/yPUb6DRBgEt9TJE/qIffq6cMw9MfkSUtuWvWk+aAF6tvoMHdvq/S9Sro0WpCgPPjxy4riLiYh61W1W/vLqGxhcXt2YiI/5Ix/KwWu60npIvTlPnw07sEgL+Edga/Nk0huaItFW2f3wONvMSprunAjvdacJtubPSmxdD2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LsLwuJGxY3T/eqhHzQzb/hB6ASDecYTJ99F4oFiOpQk=;
 b=aTRWKpizTta7OTaNS6reZH0FOyp5mpiTkWg3fz01azbInKFiHgRftdKTDbI7Tsp04tWZxs2TqMQNV/shoPQ/UdDFvzCyVJrZ1mBzQmwOBRtWjQUAREDI+KvLJt4vdmo7B8XG5NDZ53hKo7KDt2qukzNv9kjBQiw6vcqPdMaSSu8azx1UqggDe+wAIImDBgusy+xDfx6z0IKx5LkTnUVih1DiNd/7r7/ZiHNUJ2v+YUxAmybC3Iy+csOA2OjXDDCd0P/hingXYT8x6v+9dyyrZA1vONILTKeT5wUxeUIluXe6rQJXwSI6szlyfgiyR2YSSTLpvUDOfw0afBSpiszUJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB4074.namprd11.prod.outlook.com (2603:10b6:5:5::11) by
 DS7PR11MB6126.namprd11.prod.outlook.com (2603:10b6:8:9e::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.27; Fri, 11 Nov 2022 01:47:28 +0000
Received: from DM6PR11MB4074.namprd11.prod.outlook.com
 ([fe80::3b48:76c4:5193:2df3]) by DM6PR11MB4074.namprd11.prod.outlook.com
 ([fe80::3b48:76c4:5193:2df3%7]) with mapi id 15.20.5791.027; Fri, 11 Nov 2022
 01:47:28 +0000
From: "Liao, Bard" <bard.liao@intel.com>
To: Bard Liao <yung-chuan.liao@linux.intel.com>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>, "vkoul@kernel.org" <vkoul@kernel.org>
Subject: RE: [PATCH 7/7] soundwire: intel: split auxdevice to different file
Thread-Topic: [PATCH 7/7] soundwire: intel: split auxdevice to different file
Thread-Index: AQHY9W0kVhKMfSQpDE6oqDEeqqAfF6448o+Q
Date: Fri, 11 Nov 2022 01:47:28 +0000
Message-ID: <DM6PR11MB407474B2B8CA4C10AE084AC3FF009@DM6PR11MB4074.namprd11.prod.outlook.com>
References: <20221111013135.38289-1-yung-chuan.liao@linux.intel.com>
 <20221111013135.38289-8-yung-chuan.liao@linux.intel.com>
In-Reply-To: <20221111013135.38289-8-yung-chuan.liao@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.6.500.17
dlp-reaction: no-action
dlp-product: dlpe-windows
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB4074:EE_|DS7PR11MB6126:EE_
x-ms-office365-filtering-correlation-id: bfec97c9-0afe-49dd-7c9e-08dac386b0c6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vDorRvnJrYT9m3XQ0ZGrwSpFNF48KE7HV8+nhECHIePERjhxwiQgjbzzgaK3H9QWkLnv/rGjmkP8lktHDt0vxnTANU/FSDvuamQcJ7W4V/AZKOJilxb5W3Ba5Q7tJ0gKNJtl0AkAjdi87uzOPGptRK+lvh4ekXrdUpXTqwKDTmqhHj/p5ZKZQu0FzesZoNI063J4W2jrDvN2AiCp/YqnDUgeaotWvisscy/HBVWE4R948TTcDgRVC8aa3Lv8Qa3QOUdjM+p1wO9EniFcGyYHUEUsC4Vq6D/UVKxKl0jgdYYdvAvqyh+jxRYh5OfJ4Tb9jU0gq3m8iFTzlgJ0LWYB32jIMMrdNj/6r/eMoNA2JyQ+UMxFE3dixav9AnaJJerwFruf6M62xWxy+MBy9BYZe0MuLZOwkAFWRw/L9HiVwhQbFAUI1wQmbKcbzv4xcAunDsITOP3m/ecnlTLLlQNqaMndxVxr7EbqKQhI7mO82F8svyWU7+lIV0FbQrqyit+MLCApZx7HMmCepEyTpCynQr4w3N9MpTsAp9iCywPTbA80uL2UMeqIAH6ws3PcjeRO7DxhSPk6qZLs4WL5XcKCK/9FnLJwwM6aS5PhUG/VnC/uFaEaq6rTnjYfQ6usnqPt9aZletIKHUDv7NFV1eMQBYI7syfa4myJwSqy/VDyRY1sbwF0Zb7jc6SHPJWGnfjNp0ALKyiLHC0FQVuVzme+ei+qvthrA3d/69udX0KBf3xBihy4CkQuJBEC6zIkSKABEnZkH9fRGd5jcyML0P8G1w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4074.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(376002)(136003)(346002)(396003)(39860400002)(451199015)(186003)(53546011)(6506007)(9686003)(8676002)(66476007)(26005)(4326008)(316002)(5660300002)(8936002)(4744005)(76116006)(7696005)(41300700001)(52536014)(66446008)(66556008)(66946007)(54906003)(55016003)(83380400001)(38100700002)(122000001)(38070700005)(110136005)(86362001)(33656002)(82960400001)(2906002)(64756008)(71200400001)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?zHwnad0UJUPJ+NrPtJx02nw2Th0TY8siTB5pAIkXhCL1HlZnuQWY+MOLg2vw?=
 =?us-ascii?Q?IM7GOP2pXZt9z7Mk34e3jyV/8EEbklp2D5twDw/C6iSAY4G8RnVPdaXb+Ek7?=
 =?us-ascii?Q?acQFiWzMaB+pKlK5VynRLfFylZ7/G8ghfBwSkPO9YwNd1LWQRLTCRgm8g2ND?=
 =?us-ascii?Q?aUvR02jpHAd6tW95rkMOwqvXm9XU76BozTECZZorRZApC7WI09+jMBgjFxbZ?=
 =?us-ascii?Q?S9cL/QXkSQeciWI1Dii1uBtOB9bMYWVvtKT9rsn1csYbr3+k/PAuGITlq64T?=
 =?us-ascii?Q?oRVQEFetg0w5oFTFA+P1U1udFdCcfY1Ws+F7NsibXWEKb0OYRvE6anjs5GCm?=
 =?us-ascii?Q?skV2jn74BNKYctlcBOMjvEsDvIzs1WOqpFELglf2JxLzUENh1UkDgLNktbdG?=
 =?us-ascii?Q?RVwfpUNKx2j2CbaYTm7b1QQi6n5vDtLMqluiLlVFWPtXhV5FL2C4vD0zwI2X?=
 =?us-ascii?Q?Qei9J+0U8UvN+U9+DxjJe/9iEkDXevmK84UhrVq9sJAmAvUPpPDE8atJbk+0?=
 =?us-ascii?Q?GV7z72l7TKVR5v9vf9XoESaQ9XTA2uZTgtCN1dO9rsmLX4PCakTgO/sk+6O6?=
 =?us-ascii?Q?/EguW2w0Cs4LTNtsqG1Rals1McenDSm1Dw739iwJfWcWn7zmk5/GbzlAghPF?=
 =?us-ascii?Q?hdzVsfymSoI4/neSAuNOPP31MhaA+/ylQ6jNB5HhRWJLrfLe+wfMMiYCOjoR?=
 =?us-ascii?Q?nAY5WtpDqWqqjkpB0mZYjG+lr5bhPdTA3JAIRb3i3vtEPEZczVKuQsw/ugqB?=
 =?us-ascii?Q?tkGGzE0Aela9gh30OygOpIW2qaIGMwXcgclAxzhOxOmRKxw6aUXQ53p/myvg?=
 =?us-ascii?Q?1b0GeukjS2ozv+vt5XaTfz+wDvyv5XiLDZPTqR2sAdYnnBdwY39YCH61tNHS?=
 =?us-ascii?Q?TFxjoCakAAMkU3zTWsCKCLBQlMQgLvyDlT8GbD6JvRffkoNhFRcymXY+2bF+?=
 =?us-ascii?Q?xwEyeHZac8LhVVaTBDIscuyc2CpoG/Y/YLW/nZXhj0UAfl101DmjAUbC/ZR7?=
 =?us-ascii?Q?Ynq9vQkz56ul+YmK8GMo6QbL/uezLUgUBjwT+IE0+x/hgd/XZQYivcaUB1vV?=
 =?us-ascii?Q?ynsWjERW9VFNfGDyHHPET3B6PBncObxFwMNvyau8NT+LNUvVJhM90hwocsft?=
 =?us-ascii?Q?AcltdpUZJMW4BmCVKGYSSGJtnnxpc+cDU7oCnZarGz5mR5tf1bft9UEkNFxR?=
 =?us-ascii?Q?S4j28LWihFQ8onjqTqykKU4iLfPjwZ3ObpAPmpPYUFjfTSrePk1i/9WkJuBk?=
 =?us-ascii?Q?2imWHvdTp0O944qGUQDYzrTqmO8bBis9XC/VRTmJwSsoJYm0IEgXgBy1sfO9?=
 =?us-ascii?Q?kckEF+qK9rI/SulU9d90a7LTzUtRzCt9xNGYqK/lQWcNScCwx2IGc067bSp4?=
 =?us-ascii?Q?8GIz1hfDYuOokJQxzQj622RSp89vUmBxBZmJyEB+4Mvea1A+Rk8SVcsjDnlD?=
 =?us-ascii?Q?jpruQ+RZCOnvtds9k61DMlLLyWQ8FFcdLjNPRFtSXa479MLu6syc5lH92AaT?=
 =?us-ascii?Q?HwHoKTWq7q7uZRrrzqpUMXVfMlOQJsjiPs7PBHYfD98bubYKKGrRTN+58QNw?=
 =?us-ascii?Q?r73LJ7ibpL3ABCg+pHYaVyFh3Ia1FVHPjCvueIu4?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4074.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfec97c9-0afe-49dd-7c9e-08dac386b0c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2022 01:47:28.4866 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7N4AlSw+LkmzrGvM61KDf/XLFO6Lc9yPxREuT0buMKG7px2vIZqHZ62mukKjyT0itOkFgPjsjQq2sGEZg1GzJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6126
X-OriginatorOrg: intel.com
Cc: "pierre-louis.bossart@linux.intel.com"
 <pierre-louis.bossart@linux.intel.com>,
 "vinod.koul@linaro.org" <vinod.koul@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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

> -----Original Message-----
> From: Bard Liao <yung-chuan.liao@linux.intel.com>
> Sent: Friday, November 11, 2022 9:32 AM
> To: alsa-devel@alsa-project.org; vkoul@kernel.org
> Cc: vinod.koul@linaro.org; linux-kernel@vger.kernel.org; pierre-
> louis.bossart@linux.intel.com; Liao, Bard <bard.liao@intel.com>
> Subject: [PATCH 7/7] soundwire: intel: split auxdevice to different file
>=20
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>=20
> The auxdevice layer is completely generic, it should be split from
> intel.c which is only geared to the 'cnl' hw_ops now.
>=20
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com=
>
> Reviewed-by: Rander Wang <rander.wang@intel.com>
> Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>

Hi Vinod,

Note that "soundwire: intel: Initialize clock stop timeout" which is in
your fixes branch, but not in your next branch is needed before applying
this patch.
