Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 207DE30834D
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Jan 2021 02:38:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F88516B5;
	Fri, 29 Jan 2021 02:37:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F88516B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611884328;
	bh=1AF4ad7/5a0SnCBRsTi8szHVQnnay0DmIgl6m7C9d2s=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MCAdEPURHXO3oTfHJ9kxOvn/VZdbkFvP514XWHsPdrmwV9cHDS8WGAzXyPIz8/xEA
	 hB7McUI+t94yBNOLhc7DO1HPUNuS1YzqzP+baANWrmduJsqoUYzyLpb7/4srr8W+xW
	 vi/fEc+HbPioFtW9tKtzC1huuViSVZ2lIhnxCEK8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E9C33F800D1;
	Fri, 29 Jan 2021 02:37:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5A505F8015B; Fri, 29 Jan 2021 02:37:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PDS_BAD_THREAD_QP_64,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 74F88F800E9
 for <alsa-devel@alsa-project.org>; Fri, 29 Jan 2021 02:37:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74F88F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="d1ajBos7"
IronPort-SDR: FmjJqg+Ti8r1r5BaEpmEzDl2bqW7sfBgQp2Si4MXcc5tNMqYQDfelgxKT3koKWVqxgvua2KdvM
 uwef1SjDRpGw==
X-IronPort-AV: E=McAfee;i="6000,8403,9878"; a="180424445"
X-IronPort-AV: E=Sophos;i="5.79,384,1602572400"; d="scan'208";a="180424445"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2021 17:37:04 -0800
IronPort-SDR: 5/1CjRbz8vtm8ACpR8++aqQG0NTMgNkgbX2rXMwXQExmgXNm8p5H/ZD6QkK560zwuZRuWbVkze
 AuBvtOJ8Qlog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,384,1602572400"; d="scan'208";a="394600531"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga007.jf.intel.com with ESMTP; 28 Jan 2021 17:37:04 -0800
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 28 Jan 2021 17:37:04 -0800
Received: from orsmsx605.amr.corp.intel.com (10.22.229.18) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 28 Jan 2021 17:37:03 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Thu, 28 Jan 2021 17:37:03 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.109)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Thu, 28 Jan 2021 17:37:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ftcvW4so6CwvBMI2RzTS68HhJbACej/PvmmfV2WjkAThStDrYBuZiXuDjsyyTU8QXZ0rxtO/tx9PZypY/jpD45WrZ5lTloW3vZpwESxTcRLbMrOzs6DbAkAKSp9WRRAMEqgVOYiCbPb2Y5jyZvzalflBokkRnGYDDi+cVZFfYp3fkNa3GSHB2G4a43WdMQfpXETEh6VtrdcvYoKGlNHYZQw5gfZs81iHd4GW01ZLjUopoUy37Qd9sKXZ3ewxV/SFeDAALt7v+oRAsWXoIJCgnZlKYhJ7/oc6aqTsY8SXJhMJDvrAPZrFz6fEumrAdRTbgH/qZa1qH9/fio3MHyMWBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1AF4ad7/5a0SnCBRsTi8szHVQnnay0DmIgl6m7C9d2s=;
 b=N7FEWz9h2eVlxPy7NSrhpCm+xlBsbriSTSYIotUhmpvhR/sCH3uxCrfcosG6UF709Iv/DyxTDr8K9YEO0KU0qIFerlnl8BYLE0+J+qitswq7u35d86ImqqPv7e/jtyUI28lJ8s9x1QLFViLoC0lZgvybWQ4ZwUvasIzocujMGV6syYiInjc6fgsrOuruf9VajJ3cX7gxnWGp8jJshJDVVMH96TcZl1jwCChC7JHE1cL9j1cK/H9wzsTsdpZ2uiw3a32vJ03JQuECRaivEmXDXpejKmqKYFpKQ7rZDs9b9J2BGkgWwInvuq/OSJxlBBhdubYIf5Dw6HWLFt+CgipsPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1AF4ad7/5a0SnCBRsTi8szHVQnnay0DmIgl6m7C9d2s=;
 b=d1ajBos7+8sxJbwdWOhDh8Z0a5ztTkRoR/wG1BSXyKqK0UKUEW+vAcAJdK1APT/jOT5pcTJH9pYV018nIm8eJc/uhV1uMJyqxtH19cPNpL5vI0LHa10ZS9BYSkRkpTleeF/Cj73BBZnstCGkFLQnlMvkQjBgxx1+SZ4gC2Vvwo8=
Received: from BY5PR11MB4307.namprd11.prod.outlook.com (2603:10b6:a03:1bd::27)
 by BYAPR11MB3302.namprd11.prod.outlook.com (2603:10b6:a03:7b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.17; Fri, 29 Jan
 2021 01:37:02 +0000
Received: from BY5PR11MB4307.namprd11.prod.outlook.com
 ([fe80::1cad:65dc:41f2:78bd]) by BY5PR11MB4307.namprd11.prod.outlook.com
 ([fe80::1cad:65dc:41f2:78bd%6]) with mapi id 15.20.3784.019; Fri, 29 Jan 2021
 01:37:02 +0000
From: "N, Harshapriya" <harshapriya.n@intel.com>
To: Michael Catanzaro <mcatanzaro@redhat.com>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>
Subject: RE: [REGRESSION] "ALSA: HDA: Early Forbid of runtime PM" broke my
 laptop's internal audio
Thread-Topic: [REGRESSION] "ALSA: HDA: Early Forbid of runtime PM" broke my
 laptop's internal audio
Thread-Index: AQHW9caM51huPTq02ECMAm3z9SGAvKo90FZg
Date: Fri, 29 Jan 2021 01:37:01 +0000
Message-ID: <BY5PR11MB430713319F12454CF71A1E73FDB99@BY5PR11MB4307.namprd11.prod.outlook.com>
References: <EM1ONQ.OL5CFJTBEBBW@redhat.com>
In-Reply-To: <EM1ONQ.OL5CFJTBEBBW@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [73.170.36.97]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ff9d0f28-bb42-46c2-6871-08d8c3f66087
x-ms-traffictypediagnostic: BYAPR11MB3302:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR11MB330219A765AE4EA072ADCDDAFDB99@BYAPR11MB3302.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1417;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RRuyKq6YIYXnLdqhtyTCkphblZyADjYStVomhos8JiwW4gMG3B3NmHQXDma2RINRL+fCEL2HlYWqAnRFIEHckQ9u1bYJGKqdtFSLUFVFfBCLYGZ0NpVyfN3WshFcUQJ3wXk02v7U4UA/4NEqwq46ea8zhvq6seyLrKg6bKCjDU6aiRL5xUrPql/A6n5bhE5rfwhvjircl193t8tZDx9ePJq689bztgEEqZUV5QB9AO8Ko1R2VPWm1FPTp5G6ATNRzyjkygxVvAikf95pVG+8d3Afl0Uj/i4KN5FgyEIF4gfXRNacmatR/wb4i7/jOdaRQ2Jg9RcJhOfqL5dDn/p1ip+sOQemOIH59Rz8xTM3ZiJMZXuwIebb464XAulZ3wEY79FvFW2IElvc6T+70iw3LKehDvr8yirkz4Lt1DBLKdE+VdJIWPrLPxA7waj3MfgfpgXDWaJxaQi7m3Ciz4sF1c3SHtlRubdT1NXwwo5neELfgsP+dCkKDaItwqaBYZJoUVElvHgrq0djF5rzv7Wvpc28otu581MpSSKpGGVs2neLQrwgXXIJpPvKrLsx7E7/CJGhbrtKZGwav9l5ZFZhTWoMMOQ/BG1mapnqevBpWDI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(39860400002)(376002)(346002)(396003)(5660300002)(26005)(6506007)(71200400001)(8936002)(7696005)(966005)(110136005)(54906003)(52536014)(186003)(316002)(66446008)(64756008)(66556008)(66476007)(76116006)(66946007)(33656002)(2906002)(55016002)(9686003)(83380400001)(107886003)(4326008)(86362001)(8676002)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?yNRQdq/4Xu1kGQrk569bANSTSkBwtbPFUH3l29rtdn6ea0sHG4DPid5ofm1v?=
 =?us-ascii?Q?koKMN+QziVV/M4xH3XyZQVtfffXwsA+s7aSRQIP1Ws2oBep8Fg4EFcPk9VcR?=
 =?us-ascii?Q?yPJmk/ztcdz1JIaZ48gUYV09V9Z7kvWD1oOZRQtU/tYIRc/K5s+Q3w4JIT56?=
 =?us-ascii?Q?sL82BF9syJjep8Nnp8i4/vDuyYeqvhGHKfqBV8+5RvLnIyquDv6vmVk9FSfX?=
 =?us-ascii?Q?vCvitMcMRCfg7K2rUO66tJ/xloIYzF0QiYXEPGOdFk6+0cozJfG1WLZHeD1/?=
 =?us-ascii?Q?G54Cb0dqIa4A1gZe9UObRuwmROWXQ3FhSXWOw/Ur/RyCj5w/S307n6gPbP+u?=
 =?us-ascii?Q?+C2wSfeo4nW/daqWfQFY07X7MLE60zoIQt086E4WWp8Z/4OK5bn16AfD1/BZ?=
 =?us-ascii?Q?4g3TuxDNlJdpfDcdwjUfqJF48gh3Wwo+TWDByI+bXJcjdXAFtqMBgkmicZgX?=
 =?us-ascii?Q?jBHVn78PszZm+NftlZ2mQMFaAZZjQyOrRMIJF7R5eqNT7tvAYAm3i2QhrlPs?=
 =?us-ascii?Q?VkbVXUtII1JOQy3UejJQjCDSO9E/+l4R6/kybz6kYbOk7ycgILHnfI79OeHB?=
 =?us-ascii?Q?wMeYD9RhYZ2zV6jiRWwU7WgV5TN39UPqpQGydPVhRxx3t3bfKunvVlxyQwU0?=
 =?us-ascii?Q?NPk74HRRU1KnCppY4QEWt6lYWlGiZh9j/xXQHPG+u6UIfrrCN61yYTT3T7tx?=
 =?us-ascii?Q?Pn68gxOqIQN4hnvShMZxGhyR7w3AWCbXyKXMfF4TkmCBAqsAMtphLYwqNGst?=
 =?us-ascii?Q?11a6CrwNqmj3JjspSQIgdDCx2XE7p0K/3NXden0wXxdmS+8wy/HY8iG60yEE?=
 =?us-ascii?Q?R5rlyNrd7v0cKwPj86X/K/1DneM6FYP9j5qMKAc6Wibd5+81ixYCsCx22O5W?=
 =?us-ascii?Q?0n6VGaACLBPHvvcyvyY5F4CBXIRDTzf7Be9wELdGTlk2fax+7245n7/4HGSk?=
 =?us-ascii?Q?PwsxHX+X0QTZDOKaIOJTHERk5kAvMiFWaQbxt+Twvj0cEDGNYEU5jRnYf2y+?=
 =?us-ascii?Q?lHwPZMN9hNVhJxO8OEJ73Jabdbv5xaiSmp0ntPs8fw9n+bjMtlEx6lXhemBt?=
 =?us-ascii?Q?7njCluYy?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff9d0f28-bb42-46c2-6871-08d8c3f66087
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2021 01:37:01.9974 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k0kN1qj0OYMd7nng1fKsecA2JKy/V2FuXE7MfKJ1c/gPvUramvylQLbW5OhP7iIXzgYfgHG/zlUZllW2Nc72NA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3302
X-OriginatorOrg: intel.com
Cc: "Vehmanen, Kai" <kai.vehmanen@intel.com>,
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

> The laptop's speakers produce no sound. Audio from headphones still works
> fine. A quick test is to visit GNOME System Settings -> Sound -> Output,
> select Test, click Front Left or Front Right and notice there is no sound=
. I
> tested a mainline kernel revision from yesterday
> (5.11-rc5+) and the regression is not yet fixed. I bisected the regressio=
n to
> "ALSA: HDA: Early Forbid of runtime PM":
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?i
> d=3Da0645daf16101bb9a6d87598c17e9a8b7bd60ea7

Does reverting just this patch fix the issue you are seeing?

>=20
> I created a downstream bug report here, including some bits from dmesg
> that may or may not be relevant in comment #2:
>=20
> https://bugzilla.redhat.com/show_bug.cgi?id=3D1918933
>=20
> Audio devices:
>=20
> $ lspci | grep -i audio
> 00:03.0 Audio device: Intel Corporation Xeon E3-1200 v3/4th Gen Core
> Processor HD Audio Controller (rev 06)
> 00:1b.0 Audio device: Intel Corporation 8 Series/C220 Series Chipset High
> Definition Audio Controller (rev 05)
>=20
> OS: Fedora 33
>=20
> I'm happy to provide any additional required info or test patches if you =
CC
> me, since I'm not a kernel developer and am not subscribed to these lists=
.

Can you share the full dmesg and also let us know which codecs are on your =
system?

> Thanks.
>=20

