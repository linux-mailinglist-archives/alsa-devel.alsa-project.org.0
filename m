Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E31F41F0AD
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Oct 2021 17:11:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D0FC1690;
	Fri,  1 Oct 2021 17:10:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D0FC1690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633101082;
	bh=8U2IIWKgNuc9WKPPzGTCsO02d4eMoHRXdaJemzHYrrE=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MUVwyrWhdjaLsz+y2gdBblWf/Zst1LqTqkpZkNZKr+ro134+SlDhHSzki0fVNzhgC
	 y2rzgTpmj8UNoX9AAkMI8XfNC3ag+PWSBAYk0kPFMO+2fRqpnyQhNa+gVaOJeCOh79
	 K/BP9YHHYdQ5PmkO8cEA0wnZM1kUhWcRJ1JP7QYQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A8923F80227;
	Fri,  1 Oct 2021 17:10:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9EEB6F80245; Fri,  1 Oct 2021 17:10:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PDS_BAD_THREAD_QP_64,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DAACFF800F3
 for <alsa-devel@alsa-project.org>; Fri,  1 Oct 2021 17:09:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DAACFF800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="syTqyE0d"
X-IronPort-AV: E=McAfee;i="6200,9189,10124"; a="222260286"
X-IronPort-AV: E=Sophos;i="5.85,339,1624345200"; d="scan'208";a="222260286"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2021 08:07:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,339,1624345200"; d="scan'208";a="709918299"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by fmsmga005.fm.intel.com with ESMTP; 01 Oct 2021 08:07:46 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 1 Oct 2021 08:07:46 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 1 Oct 2021 08:07:46 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Fri, 1 Oct 2021 08:07:45 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Fri, 1 Oct 2021 08:07:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Su9VbwS+LjQT1r59k5vFI95PhIZL512bGleEjWbRV9Y62FHukdux4C+ZLAP6spnMkufv0g0bhK9PCQU6Fa/yuwW6kj2Mh+Z/gHucwcMDxoGOFaACDEbrqq87moF8MDRmK4mx4z7KkEo8dGOR/KEuoJjxUOOBPR4VksL0gpi+moUXYDHIaJOM7gCAntqpuQioiAJSrcIXS92ZdUu0mwpCZYRhWQnD1FlDExk8d5UR5Eo9TnvPyjIWJATUzICIwI1KUU5ILgKNn/faNRW9iZKaVvrM7vo/uN9vHZJqjSkvwecpJpid4D/lKYp+taF78MkvNFJ6qgR8Ly593wQBcBeGAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8U2IIWKgNuc9WKPPzGTCsO02d4eMoHRXdaJemzHYrrE=;
 b=K/U3+OT+SDH0l2tWtj7FyaOSVW42FGgsndbg4r6hXiSH8Vd+zxKKnB2Yhn7N81nVr7k0T9BvhQTKr3NTeCqA2XI4XUOxwGzcSelEUBkEsfJd2+Aog4nJXEkz8pOwNQRmvWWZszLd+qvqS0hOIiYJXJxP8ssYd7YgDDlZIb9YHsCSNZYq8jhRqbkExdFgbZZXL70tpy/QLBlCCgufP4hjM52j5zdP1eIYZyLNOrnlcMVHBz+aDclPSClbxTED8PX/UTlEW7UBvSjzFTBIJKCb6eBNui4XvwQh6id3ALuHOz7dHZL/AxEKIeNpTLMft+8t3N91PmLVKi2OnBu8ZhzKrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8U2IIWKgNuc9WKPPzGTCsO02d4eMoHRXdaJemzHYrrE=;
 b=syTqyE0dXVVUQ230Wroc7xug5QBhMv+g7/y+hnwMdH4EuCdBzb355+JVvOuL7a/ZlAPja0qEgYU0ednqbLTL3eqUugsJ4/hOXd/eHUlVepBQvZy1cf+dUuiN0uUXcsT3H0SxQLyTIsnBHecmGNS2bBxoaoEo0KhsH3cf3FquY/8=
Received: from MWHPR11MB1919.namprd11.prod.outlook.com (2603:10b6:300:106::22)
 by MWHPR11MB1967.namprd11.prod.outlook.com (2603:10b6:300:111::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.17; Fri, 1 Oct
 2021 15:07:43 +0000
Received: from MWHPR11MB1919.namprd11.prod.outlook.com
 ([fe80::698e:991:9d18:3727]) by MWHPR11MB1919.namprd11.prod.outlook.com
 ([fe80::698e:991:9d18:3727%6]) with mapi id 15.20.4566.016; Fri, 1 Oct 2021
 15:07:43 +0000
From: "Lu, Brent" <brent.lu@intel.com>
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: RE: [PATCH] ASoC: Intel: sof_rt5682: Add support for max98360a
 speaker amp
Thread-Topic: [PATCH] ASoC: Intel: sof_rt5682: Add support for max98360a
 speaker amp
Thread-Index: AQHXttW1Yt6zhKfa8UCr9F31h3V8Gau+Pdyw
Date: Fri, 1 Oct 2021 15:07:43 +0000
Message-ID: <MWHPR11MB1919F695979F9AAED31B27E297AB9@MWHPR11MB1919.namprd11.prod.outlook.com>
References: <20211001150316.414141-1-brent.lu@intel.com>
In-Reply-To: <20211001150316.414141-1-brent.lu@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.6.200.16
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: alsa-project.org; dkim=none (message not signed)
 header.d=none; alsa-project.org; dmarc=none action=none header.from=intel.com; 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d020f9ec-1440-4432-6d41-08d984ed3864
x-ms-traffictypediagnostic: MWHPR11MB1967:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR11MB19673E1924E4971D4A9015AE97AB9@MWHPR11MB1967.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QogU+OO25Yjvt4Q4qD8Jjxno2ipZhnV5MYj/1vtJ0pmd6RG2dZmhdLrJIH9jLKt160VMJWO5WzDXr6BzQy1au7JhBoTrE8ldQ+8Gepzx73mytfHz/v/y56Mm1GKmA926K8f+tXYmBldZ6qTKMty3trU57/v9U1CzUJUWxdJ+njK8XeD76K7mkbZr/N34HKowcqOgBfLyWfgMvjFLNhSDUEGVGD5FYNUZ8Pa0cHttCZZeIZ2a1Y91STgqwpqgo0Rg5QKv/wSIoExch16Hem0OJb2PjO0n7KS1V2uFBzwK7xAGN4Jdb7bMKEokZIHPsZiQeWui+Lox64TVdyjRMN196xHF9uPSObK42ftjQxPEQ/7lzWdnjFHwxays2Ez+PU+gXwS7IQ+jc66oVGARVHSUaNW4UjRZbhdrrR92Hwl2Hu1xPgv4zfPNkkG+lCxzHlQvGFUVTgcfx+tWYv0EZcE0nIP5+09bE4ErZpacSAjRttO68wbsUNqMkm7rRCd2BOvD4Avo2AfJx5xxmpTw0lJqZEMcpBHQQD4wczFpPCNaEm8IV9+eUp0WVSlIRdBBkXrYju/DsGCULiCouOqYnq1prwqswQw1b7qpRkhdgd5CP+ryHaVH3WlMkMnkEf3opoZSQ5TWSePzxiv8vMRFuFhSTE3lu4egWlQgvulLzHvRx8EdrkLt5hVoEyF5Umy2KDTh1V3rxNy2jyxpcEs0YDDyNLzaEyNupeiXNJKEs+AWRvE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1919.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6916009)(5660300002)(6506007)(9686003)(4326008)(71200400001)(8676002)(54906003)(33656002)(52536014)(7696005)(76116006)(8936002)(4744005)(66556008)(7416002)(122000001)(38070700005)(86362001)(316002)(64756008)(66446008)(66476007)(66946007)(186003)(38100700002)(2906002)(26005)(55016002)(508600001)(11716005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?hwV1qbJr8f0TnNA/DLBLRNIImaNq94/nOlrjqgD/jR/IiWTTTwYZnkyPhnqV?=
 =?us-ascii?Q?mjg4R9vxqJHFjDy6l8cKoHYEO7dVZqFPB0D4h6iB9KALsG7DLe19x7HNl+Jl?=
 =?us-ascii?Q?4hWF8pEZ5oAClYhqxJIO99oKIpxdvs8+3nqslEHtE/xYd1zG8x8EHNgqIBoi?=
 =?us-ascii?Q?CBcgCJ113FI4CyNKmvMfTITOrP3BXBov+pdYvx274MLia8Ua+VGc+RTo0AoX?=
 =?us-ascii?Q?vPyQ486v1prAPPmf4FlU86Uf9iZJUyK6l/HeST9T4RllgocQu8VcCGHKhmnh?=
 =?us-ascii?Q?xv1Kgcrc1tyuGTjbgS2WU0rct6UGAIILYCE4QX3VJ8SrQis2pzLrI4xKQTzQ?=
 =?us-ascii?Q?dAW9xMTlYeRjc7KkStoUTKYFsFFI7sjbRrP4G0aVt48FvzeAEkWF7CYIa2/k?=
 =?us-ascii?Q?/pDcIi+l6tn27DK1UI2Y18C2nsPRu17doMTbryGLU7lRZ1LEemoZiXlUo1jP?=
 =?us-ascii?Q?84rUr4BCKtWni/0HK3bgc918WZkraflR2b5r8G8jLq2Fl4Hj9Z8VWTkte7vG?=
 =?us-ascii?Q?hjZsvl1Oq2u3mjDSoj6oJJCiR1f1iEH9heIO9JP1dH5BwQngquOcm7rsW1rk?=
 =?us-ascii?Q?K2xJ2YCU+N66k+G4P0TGja63NyUOs0SiOhpvzVQRqA7srpUEzG2Djdo9+Vyp?=
 =?us-ascii?Q?Bu+0rjX0eBUR4lseOL6ori4mjyqJJCdTbXgqPkHxhfe6mYqWtOWlk/LqCAUf?=
 =?us-ascii?Q?VwyMsxWgHQ6JErVzcOsiq1ew0aZk9s5+w7BATNxNa452d57hmjuopSRrMMfg?=
 =?us-ascii?Q?Ugc7bMacGWyd4eTqsPbze7hXujrgShOuEfhW1HlDyKC7TlPGKqbJPe//2pKj?=
 =?us-ascii?Q?0VlNR/OwkoNG/vigEJUOL/LtEgVEdm76CSkIe5Rg0XP+hpaDiKADOPYnD3HB?=
 =?us-ascii?Q?g2BZg9ifw/M2vI4fmLwKh+jQwiUglRrkDTpYU+qTV4HO5ixFhrt+MkCuFmNM?=
 =?us-ascii?Q?2d4f1TjgsuWjePLqyX6Xev2Wjf8/AV4krrg6d+Q/bOhMl0Xk8kAARcyuAN8i?=
 =?us-ascii?Q?yNUu4ySeJZowL9rprwNR/Id3RyiI9IaAQmC/SWSu76ZqLbkqOx/Dv20ddK65?=
 =?us-ascii?Q?+p/pqWW6SSdZVm6Aj/TymtO6jugReORj/RZXaszKmG0lbO+zZMUKuGaDt1YG?=
 =?us-ascii?Q?URdIScZrddKtgXBmsxjhTtM2eNePhNZF+iG4EKKs1JEuMya8LPQKGx8RsCEh?=
 =?us-ascii?Q?PGB0QkhhTvEE2zR5H6wMb2iY2K5DCXZwbZZOehdckzag3ACNJYAdBt7mbXry?=
 =?us-ascii?Q?+k06VOy20sc58AkjOPCS8GAYAwtOfxptnuWx7XZehDFr+PbF36CAYdfHqSRw?=
 =?us-ascii?Q?Obc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1919.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d020f9ec-1440-4432-6d41-08d984ed3864
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2021 15:07:43.3639 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LTyvKB8+p6yJ54knvk+/udZTm6CjnAKSrBUZR5YS28qcnP5mmRX4vX8IZn+6L9bfEaQzvGlZQBbUC2KjASMs5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1967
X-OriginatorOrg: intel.com
Cc: "Yang, Libin" <libin.yang@intel.com>, Guennadi
 Liakhovetski <guennadi.liakhovetski@linux.intel.com>, "Rojewski,
 Cezary" <cezary.rojewski@intel.com>,
 Malik_Hsu <malik_hsu@wistron.corp-partner.google.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Tzung-Bi Shih <tzungbi@google.com>, Mark Brown <broonie@kernel.org>, "Liao,
 Bard" <bard.liao@intel.com>, "Wang, Rander" <rander.wang@intel.com>, "Gopal,
 Vamshi Krishna" <vamshi.krishna.gopal@intel.com>, "Zhi,
 Yong" <yong.zhi@intel.com>
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

>=20
> From: Malik_Hsu <malik_hsu@wistron.corp-partner.google.com>
>=20
> Add a board config adl_mx98360a_rt5682 to support alc5682 headset codec
> and max98360a speaker amplifier. Follow Intel BT offload design by
> connecting alc5682 to SSP0 and max98360a to SSP1.
>=20
> Signed-off-by: Malik_Hsu <malik_hsu@wistron.corp-partner.google.com>
> Signed-off-by: Brent Lu <brent.lu@intel.com>

Already accepted on SOF github. Merged with another fixup patch for the
platform device name.

