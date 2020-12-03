Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1022CCCA4
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Dec 2020 03:31:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67DF417FD;
	Thu,  3 Dec 2020 03:30:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67DF417FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606962675;
	bh=bD0cVfG2LSpPzGAPxgotaVvJQzRExThjSv7/rUYIJNU=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dvHbS465XGEqEIxUYidAkTwDbcUIUUnOCaOpO3jJARL5ikxQ768gxcxu5ejK1forz
	 IpDTy4gOix4KBvcFoD11pPVeVmbCW0mRbxxFL5fEctDSGh7ZJTGdt0YoTwD8/8bUTv
	 FCbpOsnKd0SrrTNGXzEuErCe1q3BRZ1cCS2ugMzE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9372FF8049C;
	Thu,  3 Dec 2020 03:29:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55B7AF8026B; Thu,  3 Dec 2020 03:29:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 415DDF80168
 for <alsa-devel@alsa-project.org>; Thu,  3 Dec 2020 03:29:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 415DDF80168
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="j7kvJxJz"
IronPort-SDR: QS747zz+ZhN3o32oqnbxg4y/aMoYpL7Diq6jyuZFqq9W0B7f+J2Br7TRtHIBxmqYAfLQL2s8gm
 Y59kSXY5SgLQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9823"; a="152949234"
X-IronPort-AV: E=Sophos;i="5.78,388,1599548400"; d="scan'208";a="152949234"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2020 18:29:19 -0800
IronPort-SDR: yjiSzqQXpJA4nZYessrQE9wQ/GU1lsNReMeKLs6Ywj9FcDSjCt6QPY7NJmMUKAy14f5WC3TT4S
 D7h8evq2eMVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,388,1599548400"; d="scan'208";a="365562099"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga004.fm.intel.com with ESMTP; 02 Dec 2020 18:29:17 -0800
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 2 Dec 2020 18:29:17 -0800
Received: from orsmsx606.amr.corp.intel.com (10.22.229.19) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 2 Dec 2020 18:29:16 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 2 Dec 2020 18:29:16 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.108)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Wed, 2 Dec 2020 18:29:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KvxPF+NxX8NvcPQssnJlg1B3kqrCZy4dXFndDI8ccN45bTLQw/EkOi3SOjr3hlNDVXObS1HRRmjFrf5Bq1/1tZf5UUXA34FxfEfzjw3/NYu8KjTxCB0MTQx+qLsnDhhe0D0bfJOlrWnnUOtLvQnmR5AuKlyVRHLsFwnHpnzzACf1jOwA2mabUktgUjq/eXaWlWp7r1DEaFdQHZPTdIpteWuVswZC3AxPkURUoznWtPzLJ6L7YFkulXza0+JymUNVqldHc98r913RcyfvN6sE6or6RoK+M19l95pIwNCQdSjDwz5LYicqPXtSSxFz26FbbsZF6Ded3ox3/WaVACQqPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bD0cVfG2LSpPzGAPxgotaVvJQzRExThjSv7/rUYIJNU=;
 b=efK2vXNHFYqj37OOEIGOTanmgHz+R1EZLzPj8eFHOfE8WxbIoEmuO2bFzcvcolO+wX3qChiqEYTHmdD0/CnHAySx5MqO5bZaFoCIHvR0ddqwpVi6odb50/p1/yRotqGkdPBabx/WD8KmwT6UgfdcOUBXU4b8Vyep4CWgaYF/a02MqPVQdqxyfSE+bIlDDPIDuh9vjc6ZY3/NKOnDZFcN2BQ7meXUQEbUwYvNFTa+RoTXJi43No5MnMGF0AFM4enl4pBDEnHapiW6/CyHYFyKklaJgtE86KdkTsAV5c25nIBN8/btlhh99rsYcZ9bhT9dwhz3IlaVeiU/aE4El/2EPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bD0cVfG2LSpPzGAPxgotaVvJQzRExThjSv7/rUYIJNU=;
 b=j7kvJxJzxnnGhA8bL8w004aGE6NDawoRuGjb5jjsgqQUTUS2BEMOkLf9WpUv9HKe5h/QK8kpYizouK5xDyuW3BsnubDhSiWg8Uslbb92eMEJsh2uYLzjkCq5z5VwoPoJmtb/xDWEoqncrUJ/N98SCqARHhkWAcN7R5IYe50jH9U=
Received: from DM6PR11MB4074.namprd11.prod.outlook.com (2603:10b6:5:5::11) by
 DM6PR11MB3595.namprd11.prod.outlook.com (2603:10b6:5:142::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.25; Thu, 3 Dec 2020 02:29:14 +0000
Received: from DM6PR11MB4074.namprd11.prod.outlook.com
 ([fe80::8941:7045:2dc8:707e]) by DM6PR11MB4074.namprd11.prod.outlook.com
 ([fe80::8941:7045:2dc8:707e%7]) with mapi id 15.20.3611.032; Thu, 3 Dec 2020
 02:29:14 +0000
From: "Liao, Bard" <bard.liao@intel.com>
To: Mark Brown <broonie@kernel.org>, Bard Liao
 <yung-chuan.liao@linux.intel.com>
Subject: RE: [PATCH v2 3/5] ASoC/SoundWire: rt715-sdca: First version of rt715
 sdw sdca codec driver
Thread-Topic: [PATCH v2 3/5] ASoC/SoundWire: rt715-sdca: First version of
 rt715 sdw sdca codec driver
Thread-Index: AQHWx4pYRUwoCWEb2EWVJIUffE01Tanj+28AgACsq1A=
Date: Thu, 3 Dec 2020 02:29:14 +0000
Message-ID: <DM6PR11MB40747A2F2AAC0A4D87F3EA87FFF20@DM6PR11MB4074.namprd11.prod.outlook.com>
References: <20201130144020.19757-1-yung-chuan.liao@linux.intel.com>
 <20201130144020.19757-4-yung-chuan.liao@linux.intel.com>
 <20201202160740.GG5560@sirena.org.uk>
In-Reply-To: <20201202160740.GG5560@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-reaction: no-action
dlp-product: dlpe-windows
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=intel.com;
x-originating-ip: [220.133.4.96]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d717cc83-1614-4e95-175d-08d8973339fd
x-ms-traffictypediagnostic: DM6PR11MB3595:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB3595AF5579E281D0D82120F5FFF20@DM6PR11MB3595.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:773;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: i/jxY5pnDoSkfvwlaacUQB33jclaEUHPnMXNf9ShAjgEn9k5beAeciL6/ix0epBMU/f16lPm3kyvCB3ZDZm2+6YW6zZWrd5zTfEPXdPZF0VM1iheWVlPQLhAv6tO+L4w4ASoTL5rPsNpQNBdEQ3tQt5ESPJ66IWoHSXQ4pCJhdUJfLnq30Q36ZmmUnHiFqn41rWDmNYfSUg7bac+mMvAbSuvjmgASUqozxrMjkNVUKDQPH0/yX1QxI5rEaB3JO3JgLJkzdwZjQsj4Fvs7AIswMyKoNXRRwiQ8j5gku1AQb5jmLmioHZbZxT1e5xNYcTQjUn+d7QV5SSdGwcGYtDtiw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4074.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(346002)(39860400002)(396003)(376002)(71200400001)(83380400001)(55016002)(8676002)(64756008)(86362001)(76116006)(54906003)(66556008)(5660300002)(53546011)(7696005)(316002)(6506007)(66946007)(66476007)(8936002)(66446008)(9686003)(110136005)(7416002)(478600001)(52536014)(2906002)(4744005)(26005)(4326008)(33656002)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?9mBxO6ILD/b1tH1YJ77V3llMApnE4aNIY0e5pZDD3iLpshmAuuSGgxmhtHyQ?=
 =?us-ascii?Q?9sjVw3Kcv759jS9JY7hyGWPjwfSFht1ucivTy0AHtb65n3HgaVGBl1ye9XX/?=
 =?us-ascii?Q?Ta2XrmFXqzU4+7PzDY2RmZ+DxzR9hz3HXKBQrQLR51Yzw1eLRqQXeyHHA5yE?=
 =?us-ascii?Q?g4EJd6GbQWxDvA0d3tT3gWXOvpJeE5AW2OLB94ERbUSd7DR1ZoQLH0I1r7GN?=
 =?us-ascii?Q?tn69dTXJ5+n4dO6SGbXI/Hp2WStkT4kthkdZRE5Lz7pskigrmJtKUHPChQF4?=
 =?us-ascii?Q?DvuxWgraT1vuX5/KRUXyuhsUNkJZwbEM43L4wsw8l0FCWgxuz4MrQnNjetWW?=
 =?us-ascii?Q?Vl2EtWcFVXA/IPqXEO7QulPhMwjsqYwUepo0rQg4FY/hiWc0/cKA4aPyVDiu?=
 =?us-ascii?Q?P1QHtcw1fpNDRVg7YhenVfhIwrDZdWLAWALjjzO/YmyqTRFifz1iysKQZHFe?=
 =?us-ascii?Q?9PMwY/jUMsK1TgSvmfikpKhIVJMbcqHcAnleeZEpfiCxtAcdNgZyhtRz8AJB?=
 =?us-ascii?Q?QMA2hnNuhxqny3P6ZLUaKbeq49omAvdcMH3htY4eqsEvwNYRPTKi6mIDisoz?=
 =?us-ascii?Q?6dMXGQ0N07JtHHnu96n09A6k4JU5/sRAIGr5XEsOaQ0Y5slW/N1VOWoGnQyc?=
 =?us-ascii?Q?0yF3PKOqhTg+E9anNvhUzu01vh57NMuCYpByKBPqWRUIc4a+zWP7xllbrA9q?=
 =?us-ascii?Q?DwhC7htsMoMey735f5I3Ea5Kqzgwj//UwSolBLery4zVkyhXzGVzhPp+4d4/?=
 =?us-ascii?Q?cZSCihcmIgjTyLyZo7VtRUsu7FuF/b9c55HSMiAwWWtRrhzBg8CFgzClZfXY?=
 =?us-ascii?Q?8JwqUnOGi41Bl+7YkU+bSxu1/3/e1fNWZkWouWIYr+ZUWaQvdWNAuCOmc4Xq?=
 =?us-ascii?Q?cNXaJqkPr919lLOt4cXCIVgYj76PO5V9ApbCMfgRw9IPr20n9Z0RkSgBglu4?=
 =?us-ascii?Q?DpzPj+YInq0V9yRybOlM8HnKd+PrIOfmCB/dMCdoLOY=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4074.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d717cc83-1614-4e95-175d-08d8973339fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2020 02:29:14.1321 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZQbp9Rbm+w25ImrDgGJZvBZSQackuVEpRwryfwDsEtD2w2+o9jdubQPgQj/f/u4uFys7vgLZLHBu0BTZuwi/jQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3595
X-OriginatorOrg: intel.com
Cc: "pierre-louis.bossart@linux.intel.com"
 <pierre-louis.bossart@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "vinod.koul@linaro.org" <vinod.koul@linaro.org>,
 "tiwai@suse.de" <tiwai@suse.de>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "ranjani.sridharan@linux.intel.com" <ranjani.sridharan@linux.intel.com>,
 "hui.wang@canonical.com" <hui.wang@canonical.com>,
 "vkoul@kernel.org" <vkoul@kernel.org>,
 "srinivas.kandagatla@linaro.org" <srinivas.kandagatla@linaro.org>,
 "jank@cadence.com" <jank@cadence.com>, "Kale,
 Sanyog R" <sanyog.r.kale@intel.com>,
 "rander.wang@linux.intel.com" <rander.wang@linux.intel.com>
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
> From: Mark Brown <broonie@kernel.org>
> Sent: Thursday, December 3, 2020 12:08 AM
> To: Bard Liao <yung-chuan.liao@linux.intel.com>
> Cc: alsa-devel@alsa-project.org; vkoul@kernel.org; vinod.koul@linaro.org;
> linux-kernel@vger.kernel.org; tiwai@suse.de; gregkh@linuxfoundation.org;
> jank@cadence.com; srinivas.kandagatla@linaro.org;
> rander.wang@linux.intel.com; ranjani.sridharan@linux.intel.com;
> hui.wang@canonical.com; pierre-louis.bossart@linux.intel.com; Kale, Sanyo=
g
> R <sanyog.r.kale@intel.com>; Liao, Bard <bard.liao@intel.com>
> Subject: Re: [PATCH v2 3/5] ASoC/SoundWire: rt715-sdca: First version of
> rt715 sdw sdca codec driver
>=20
> On Mon, Nov 30, 2020 at 10:40:18PM +0800, Bard Liao wrote:
> > From: Jack Yu <jack.yu@realtek.com>
> >
> > First version of rt715 sdw sdca codec driver.
>=20
> This doesn't apply against the ASoC tree, please check and resend.


Looks like the previous version is already in ASoC tree. I will resend the
remaining patches on top of it.

