Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7EF25F174
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Sep 2020 03:21:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B843517E5;
	Mon,  7 Sep 2020 03:20:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B843517E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599441706;
	bh=Ru0xkOcgUzqPX4LMUUtAU+aFz6Ve58f8Rc18tJCA06o=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MOkfQ8DK4Zv4S1KHwBx0fPOJdgUb7hIdXHPoixY40619h+eLRnbp1ON68P0nAXcoM
	 YhrcjT0kzi0EVsA879skPWzepk6nftJICrVitCtUwBvxe2wBWfiord2G3dbRwvRLX7
	 IrS9j46Ppjc0pH0Fm+ykYy0n8UTKIhTHamMMnwWc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DDB29F80272;
	Mon,  7 Sep 2020 03:20:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF28BF8026F; Mon,  7 Sep 2020 03:20:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7435CF800B4
 for <alsa-devel@alsa-project.org>; Mon,  7 Sep 2020 03:19:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7435CF800B4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="UR+/MPqy"
IronPort-SDR: Eax+VqAiMNz+WxiFW51cy9I6oL4Ot8N7P5TgzgF1qioup0MpKVMaJboc7mD/krFv26XkUSj91T
 udEgQFTSiYyw==
X-IronPort-AV: E=McAfee;i="6000,8403,9736"; a="158922715"
X-IronPort-AV: E=Sophos;i="5.76,400,1592895600"; d="scan'208";a="158922715"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2020 18:19:50 -0700
IronPort-SDR: 5gb6o+iINcaurwHnN1beHCODFydL6yhVhlRh9JNsgkMPzR7IyGY1U5B4vxiPN4QpMeEkQBlgzc
 VX8A5MHpWIIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,400,1592895600"; d="scan'208";a="504510318"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by fmsmga005.fm.intel.com with ESMTP; 06 Sep 2020 18:19:49 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 6 Sep 2020 18:19:49 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 6 Sep 2020 18:19:48 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Sun, 6 Sep 2020 18:19:48 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Sun, 6 Sep 2020 18:19:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S76YAm9TdJmxUJc0sDghkkuhvpZC9slBvAHSmQqSyy3mnsBRP2lQUhI7sjWroLbSe3PGPS5ZWidYAhYMG6gMpQa38pfE4Yf2ULK1qSYjYUkI88W7pWtL3oM1+wDec2hUqWhUVQNPWG8dfsJrR3x2+uTdYGH1N/i1EfPV5ay9hJww63VSr267UKig8l7XjklW/GTI1sat/ZNxs/L20Efy20Ob9OR4c1Ia7CUp8MT7dMOHoTGy7PjWCZ0ffNYhYgvHjDM0mrGds5MAWgSG1+1TMmfy1cFt5Bhw2PEHptJ+sN7+MsXBpCQRneegP0gX0kb36ejBrBRfrYOP7Cg4JKpXLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ru0xkOcgUzqPX4LMUUtAU+aFz6Ve58f8Rc18tJCA06o=;
 b=bkux+b0MIDw39FTImMsuksdlwPLEF36J92bJTQVbgl1do4xtQz6k61S7hCh7uMmOLpidYC8+l/FiJ4/GDQUS7O6HhlSeuhGQQpl9u2zplhcr1qz0l7vyeKI3EfqmZM1lR5psEJEsR9rQ97GBhpe3RlGuADK8aAiJClD8IMlvzODcIOSCtaEiBGB+YuweFkQdCWp2AFW62wW3zdodEqfco9v8+iZZbPXeS11ht7ZYw4iCCZR7hn4c8ccBXG6KV2QWJ8KmTAnL5MWvwDfMJo3XdIR5eWkA8oAXF4sGz0Ziwq0u11LTeOUZcEGSVo5y0UqW9CRxQqUOu1nt2BnAsyLwsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ru0xkOcgUzqPX4LMUUtAU+aFz6Ve58f8Rc18tJCA06o=;
 b=UR+/MPqygQ4omGwpR+YNSW5VIGtRgL31g4BZXb4xaqFs8/bACvzGctvZkvgYA9gljx3J5wPDG4gX8GdIQw9NCJ5ErwxMmSpFph6706dspt9tf+EOyWRTIMANNzK1jE4srDpm9JzTksSWA88J6K1l0s3Z2QE1ASyHUlQJCh+2rwI=
Received: from MWHPR1101MB2159.namprd11.prod.outlook.com (2603:10b6:301:53::7)
 by MWHPR1101MB2093.namprd11.prod.outlook.com (2603:10b6:301:50::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16; Mon, 7 Sep
 2020 01:19:47 +0000
Received: from MWHPR1101MB2159.namprd11.prod.outlook.com
 ([fe80::ec1c:836e:2b30:e9b5]) by MWHPR1101MB2159.namprd11.prod.outlook.com
 ([fe80::ec1c:836e:2b30:e9b5%7]) with mapi id 15.20.3348.019; Mon, 7 Sep 2020
 01:19:47 +0000
From: "Wang, Rander" <rander.wang@intel.com>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>, Takashi Iwai <tiwai@suse.de>
Subject: RE: [PATCH] ALSA: hda: release resource when snd_hdac_device_init is
 failed
Thread-Topic: [PATCH] ALSA: hda: release resource when snd_hdac_device_init is
 failed
Thread-Index: AQHWgT/Z7iD6cnO/J0qVWk8Qf4yCX6lVmw4AgALAQgCABAqpYA==
Date: Mon, 7 Sep 2020 01:19:46 +0000
Message-ID: <MWHPR1101MB215952337B78A0CD47FC65B9F0280@MWHPR1101MB2159.namprd11.prod.outlook.com>
References: <20200902154229.1440489-1-kai.vehmanen@linux.intel.com>
 <s5hpn7484sf.wl-tiwai@suse.de>
 <alpine.DEB.2.22.394.2009041427570.3186@eliteleevi.tm.intel.com>
In-Reply-To: <alpine.DEB.2.22.394.2009041427570.3186@eliteleevi.tm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.198.147.199]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 147515c2-4b3a-4755-62fa-08d852cc1c1f
x-ms-traffictypediagnostic: MWHPR1101MB2093:
x-microsoft-antispam-prvs: <MWHPR1101MB20939E0AB7C25EFB47611066F0280@MWHPR1101MB2093.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kpj16OrookTHj3/PEbOYtpKk6NP4jjfNaTVo1bcVBGsQLb9wWN9w9lY4LsIzrPWKnq9B18oTfwe3nakYeFbEGBE+9V851Nuda1TK7WPWA47NuvjXDDSAWB7KDZ0+cvdMybdLrIGb1WJ6lHLHKNO/6ZoTgQBCbLjqIX9UTqVkwDZCFIYrxbq6PMxfn1c4u34WdVDDDVDwONXRK5WhO8i9jc4HhXK0r3s3+qNwMMA7RTp0ZOnX2NmnQHzLF1DAIwY0mdZtKAArpeyPzeBBA9Sa6rbA2M1kvMCnrVCL0UKS6N9G+T5/5cKogUVDYkojZq4Gv1ha/2sTBN1d2J7yBmTfWQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2159.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(346002)(376002)(39860400002)(396003)(316002)(26005)(71200400001)(5660300002)(8676002)(53546011)(55016002)(8936002)(76116006)(6506007)(9686003)(66446008)(52536014)(64756008)(83380400001)(66476007)(66556008)(66946007)(54906003)(86362001)(2906002)(4326008)(186003)(478600001)(110136005)(33656002)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: qeScb245YdygWS7hH3y+f3bPA9SSARgo6W+KdJE7hf1Zd+400bXdyHHHKEb7pVLY/TjSXT7uqXxZqTon/aFhTHWp7uIQY11JbEYJoMjCmFM6qSQrQ39k16aPUaROo4n03gwWuFDbQLznCME8U5BL6FCOw8SBCp2vGslydx/PBdsPk+RhVAqeFXaEth0HGFPvIcSFO90HSqQVe14IQKCfpusPsLK4Nlan01hlT5KitvMwyO0mO5I8Sv9PQEcFv/Ry/w/JPBJb3dU/emsmLZRzCEZnRebfeiMofxl8bIAzVONMFXBaBA7Zpx2Pmxb/z7bcfbZ8trXlBqDtJY2yk+U/letw1g7wJv3/twD4bFU9sxdAKwBbehUCiTgQ00CHFSWpEcKWB8sUBG8voC0JkgiuhZsAvB0JUqrDNtoYrF4zcEuyJpGevRjTZmK+4Ltrvwn8gdwkGTsWrmbIAC2XYP6qGsDRE0efkfZr521rMCXUg9FnYtsIB9OAux7LfDKlDrooSQNhbtGQRfeybuuAnhs3HQ26iXiZJEasGNFbhJZVrShhoJS3UL11zrIFjfR0Y+kvhunbcuyQmw7ShXcutH8QnepQOYeuHy0EN1FINTwOWd5jxpKaIVyLfFIDZ+0HznM7nfE0EHu9at2R6ymNU93ZEA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2159.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 147515c2-4b3a-4755-62fa-08d852cc1c1f
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2020 01:19:46.8771 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +n9rCopwTpjR508/xoLgXt/r1NWbiLbrxX5y/59HYlfXmiUVR1GDRRAasLG6JFjGoYN5UMYwShZoIYxx8a++UQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2093
X-OriginatorOrg: intel.com
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Ranjani
 Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

Thanks, I got the point, so the fix in snd_hdac_device_exit will resolve th=
e issue completely.

Rander
> -----Original Message-----
> From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> Sent: Friday, September 4, 2020 7:31 PM
> To: Takashi Iwai <tiwai@suse.de>; Wang, Rander <rander.wang@intel.com>
> Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>; alsa-devel@alsa-
> project.org; Ranjani Sridharan <ranjani.sridharan@linux.intel.com>; Pierr=
e-
> Louis Bossart <pierre-louis.bossart@linux.intel.com>; Bard Liao <yung-
> chuan.liao@linux.intel.com>; Guennadi Liakhovetski
> <guennadi.liakhovetski@linux.intel.com>
> Subject: Re: [PATCH] ALSA: hda: release resource when snd_hdac_device_ini=
t is
> failed
>=20
> Hey,
>=20
> On Wed, 2 Sep 2020, Takashi Iwai wrote:
>=20
> > On Wed, 02 Sep 2020 17:42:29 +0200, Kai Vehmanen wrote:
> > > When snd_hdac_device_init is failed, the codec is released by kfree
> > > immediately without releasing some resources. The vendor_name should
> >
> > It's released via put_device() and this should call the release
> > callback, default_release(), and it contains all those kfree()'s and
> > pm_runtime_*().
> >
> > Could you double-check whether it's really missing?
>=20
> ack, thanks for spotting. put_device() indeed calls the default release, =
so this
> patch is not correct.
>=20
> Rander, can you check as well this matches with the scenario you were loo=
king
> at?
>=20
> Br, Kai
