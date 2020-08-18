Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EDC924883B
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Aug 2020 16:51:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D5B1D178D;
	Tue, 18 Aug 2020 16:50:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D5B1D178D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597762274;
	bh=F9DJNCgMdXzvs3dNE0fBJIWiLlHaRuIUCV/6yqJvSkg=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vHWUNlZj/sgvf2QXgr4AnRg4oWtNsqg1PL+9nXD/ZyA275WC/eoKFkKVvl/0Dg966
	 +B0zi+LMlgM08BUDH5KS7LNdJZ2NfrzulOpmCgwpPGccHDiMPyVQnVxr398OB9HtG5
	 lsyveoz+OAhVw7RyBqCcpIhOiaox/ATKRcuMkZok=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7CA45F800D3;
	Tue, 18 Aug 2020 16:50:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 93E20F800D3; Tue, 18 Aug 2020 16:50:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8A5CAF800D3
 for <alsa-devel@alsa-project.org>; Tue, 18 Aug 2020 16:49:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A5CAF800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="ypDrSJOM"
IronPort-SDR: 4094hzoN0OLhEuS3jrMv39z0z1gxqiVjF19n29e7Kjzr/jKGaAAbMvz1FQHnWHTRjbgzMkapnJ
 gdpP+0m20Bew==
X-IronPort-AV: E=McAfee;i="6000,8403,9716"; a="216443294"
X-IronPort-AV: E=Sophos;i="5.76,327,1592895600"; d="scan'208";a="216443294"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2020 07:49:53 -0700
IronPort-SDR: cPyiDPj+knOMUQttPDsj0wXUb7sTOSx6MjUq4LwO1nb16XCGfUPhavuZXq69OJG5BzJL0F9mH2
 ObzFAV5KhBaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,327,1592895600"; d="scan'208";a="497393959"
Received: from orsmsx606-2.jf.intel.com (HELO ORSMSX606.amr.corp.intel.com)
 ([10.22.229.86])
 by fmsmga005.fm.intel.com with ESMTP; 18 Aug 2020 07:49:52 -0700
Received: from orsmsx606.amr.corp.intel.com (10.22.229.19) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 18 Aug 2020 07:49:51 -0700
Received: from orsmsx103.amr.corp.intel.com (10.22.225.130) by
 orsmsx606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 18 Aug 2020 07:49:51 -0700
Received: from ORSEDG001.ED.cps.intel.com (10.7.248.4) by
 ORSMSX103.amr.corp.intel.com (10.22.225.130) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 18 Aug 2020 07:49:51 -0700
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (104.47.45.58) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Tue, 18 Aug 2020 07:49:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e3SyTKOB0bLAnimhnRgUsVSVUVwW/Er8RZ3QYal70wvi+JovYuqDuvNZ8k9rHTg/PpMFcyvpu/rsLazBZAvemj52mkX9nMVn63R6ZRLyvAvNajrAIQzOmvBCaiGSLK9LEZEaFZixf7BUmzgAvE1rtNVkjEVt2/nA69BnNhQQlIv9IX7Ewso1/PXzck9rYv6No0MF/thFl1LHJIz6pPZ9ySxz5gKVq38QN9UyVjUmvLwHks2+fKu0WfniyW7eVtTifz2FbskLg4Dk6BAlVfsTRrqgJEUSzMyI84Qp6OVjhzKAHziLGbMOzRnkVIMBh/OW+7szVJCtPHppcnbLyK+mcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F9DJNCgMdXzvs3dNE0fBJIWiLlHaRuIUCV/6yqJvSkg=;
 b=FsivVFCVmqM7fkdLtTyEnlfDT6no7FGGabiz7qPHmPPG2mL7dDD0nTbGIM9JUkw+P+oMMDK1BgMVDrXSvprIe5bEQcsFqO8HY88jIJP8z/cGJynx5JX64z+i6qg7/qrY4borTEVnRzUPQxyw3XYPBoUMYnpMMxi1bigomzHUBxngMgAYmj80HXVhUEbslTG+jduHIQsYZVKcadvii55CyqxZ/Ri26thaQE84H+QK6o4brPPanATq86axSJd+rlUngvD+vrlcspUppCJi8mg3SNu48tRfzy7R9NNTAPPC/M90DwGeu1DqfiOIE5sVcex+q27X9taCrpw1Mc0pIhYkjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F9DJNCgMdXzvs3dNE0fBJIWiLlHaRuIUCV/6yqJvSkg=;
 b=ypDrSJOMDHPRJdVjUOpKFY7jkxV+cT02K0GS0zelTdDfYvY/7Ql8guFeMjtJP2CoNpILkMzAK0kB3D1laz7SX3p6jzjtnjFWhrV2Rv96lPQRovvp9Gx5QSO+Z8qqu8XaAUEkUU0NIGXyUS900uyOqkAzvnMDRYELmC6cpCc7i+M=
Received: from DM6PR11MB3642.namprd11.prod.outlook.com (2603:10b6:5:138::26)
 by DM5PR11MB1275.namprd11.prod.outlook.com (2603:10b6:3:15::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.24; Tue, 18 Aug
 2020 14:49:50 +0000
Received: from DM6PR11MB3642.namprd11.prod.outlook.com
 ([fe80::70a3:595c:6217:49c9]) by DM6PR11MB3642.namprd11.prod.outlook.com
 ([fe80::70a3:595c:6217:49c9%7]) with mapi id 15.20.3305.024; Tue, 18 Aug 2020
 14:49:50 +0000
From: "Lu, Brent" <brent.lu@intel.com>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: RE: [PATCH v2] ASoC: hdac_hdmi: support 'ELD' mixer
Thread-Topic: [PATCH v2] ASoC: hdac_hdmi: support 'ELD' mixer
Thread-Index: AQHWdPpg+cfNZMPg5UKpV0cEnnRyU6k9wCcAgAAzTVA=
Date: Tue, 18 Aug 2020 14:49:50 +0000
Message-ID: <DM6PR11MB3642F2053B86CD4FE10383E1975C0@DM6PR11MB3642.namprd11.prod.outlook.com>
References: <20200814083436.19845-1-brent.lu@intel.com>
 <20200818004413.12852-1-brent.lu@intel.com>
 <alpine.DEB.2.22.394.2008181311430.3186@eliteleevi.tm.intel.com>
In-Reply-To: <alpine.DEB.2.22.394.2008181311430.3186@eliteleevi.tm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [1.164.110.173]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0ba5c94f-c498-4537-d259-08d84385f5a7
x-ms-traffictypediagnostic: DM5PR11MB1275:
x-microsoft-antispam-prvs: <DM5PR11MB1275A03B3D260156BCF179BC975C0@DM5PR11MB1275.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UQKFaiaex7QrxE4QllFxBPtvfu6gAKN16NdIi3NJEE0FUU42KLk+XnMU/4A2K85jwlDcAntkgz5bXVWfSbsfneEIR7cvtl7qTHzE5wwl9CI3Gb6NK3IqFkANugiKzhOUULUIq1MoNpTCjsA04HhomD/9eQwux4WMagKvZcm0y2cD3q/tkt9LfvKLr0iZzi49uHucepNdbNiADwtUByZHDs772mKY6V93DzVDcR8Yub64hkCdHZ8qJpBxlQ+06Xuyn8LKSD4t0tA0pwcCipV4+fmaE14riOPKRt05ifrRs8UwFdHLFzsla2i/0pm8Q/1A3r8asXQIe9LNhiNm0/ANLg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(376002)(136003)(396003)(346002)(26005)(86362001)(8676002)(8936002)(71200400001)(52536014)(5660300002)(4744005)(4326008)(7416002)(66946007)(64756008)(66446008)(478600001)(186003)(66556008)(6916009)(6506007)(54906003)(55016002)(7696005)(33656002)(76116006)(2906002)(66476007)(316002)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 6zO4KSaQNFAcyYAR605nJe5CGyVNWE+NwppOhD/3wsSOxUWvUBl2NEeeMX3RWLhh9nHcM7VMXwgLHAjLUa6TlfosDS3E1rmmvD2ndEtgk0+gpGJNPfc1hM4vkQF50mH9056IMuCl7gBtOnDtRUipkWqNr1aSDRzanyR0vfRVmcxwjU2mxQ9R07/UjCYR64eX4UffHB87JWA90pe4gjoflS5BrCl+UB8Qy8X6nkQXUml7jpWZFTJ8zHk7htGU1QOG3oE/Zc3tiChGL2jq7PPSFg/Yk6uINTiSmysUZxtckJ2U8ikyjqBZgRXDO5vKQVtTF4kVgIqseI8mheoMXVXPfrfi2AEJxaBqCYAkAMuih7L3fsFZ4OKF/aCofIkZr4uKkUPlARel8BDe0S/Cwc4A3KNmAFtJeSIp3bE0wHfHK1XbeAJTePz1bdLxLdKZJpgn3wnao4qdlPZOF4h8i0JNG0g4pzEsGQjVqLQtx38qt1nvUOolcED6RWkG0iWNvS1SPL95x3TnbB7vxCGkv8czPlc7Fbk5WgPNvO9HPQbrvOBbt90fDsRZgrdfWhw1HTrpRSSyim30rpeNr+FrMpEQ71HVdqyVMINar+8RXHUQlCKJJDXzu6DmlZ6JGfYGIjDxWOo+9PJ2VvqhRLUunHaTDw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ba5c94f-c498-4537-d259-08d84385f5a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2020 14:49:50.2833 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M5FzE+2ugSQotKkCm8jgP0v9p0eeZdsfQMW3dLkJY2TJMti063oI3xzOtbFN4awYkM0W/3nJ2QK1TA5ura+86g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1275
X-OriginatorOrg: intel.com
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 =?iso-8859-2?Q?Amadeusz_S=B3awi=F1ski?= <amadeuszx.slawinski@linux.intel.com>
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
> This is a bit iffy part. If same PCM is connected to multiple receivers, =
you
> return ELD data for the first one and ignore the rest. OTOH, this is inli=
ne with
> comment in hdac_hdmi_get_port_from_cvt() in that this pcm-to-many
> routing is not really supported by the driver now. But jack status report=
ing is
> done a port basis, not per PCM/CVTs, so this is not fully aligned.
>=20
> Hmm. Given the proposed patch is aligned with the user-space interface
> exposed by patch_hdmi.c, I'm ok to go with this. Can you add an explicit
> comment to explain what is happening above?
>=20
> Br, Kai

Fix it in v3. Thank you for the review.


Regards,
Brent
