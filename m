Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0752A243E3B
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Aug 2020 19:23:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 973E91667;
	Thu, 13 Aug 2020 19:23:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 973E91667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597339430;
	bh=Z6A/Nm74icChz2Xjka/Og/QQtA8GXnEZ6Rns/k0g82A=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HQIKjwqo6tL7+t3AMPiSJTmmnJpQT3w2Zakg0fntIiJd8B1c1BIemd5D0UvAFvUIM
	 tPqA/Zzl02TcdzXPuwxkiT0/h2PwlkeO9AjsBfK3T68apu6Rg7zfdYVaeZIluTAs8a
	 xiLFYeZxoMTsWARUeQCnxIQWZiCZGeLaLIAOeiNQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F6BFF80161;
	Thu, 13 Aug 2020 19:22:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 77BF8F8015B; Thu, 13 Aug 2020 19:22:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9E134F800F4
 for <alsa-devel@alsa-project.org>; Thu, 13 Aug 2020 19:21:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E134F800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="ouGUsVz+"
IronPort-SDR: L93B5XpddJEC0HV2jm8zMn7rJYxM2sbKEZLIXk4x6wuXd1jNzUkjQaeG3oGAs+jbOa/BNwzLvh
 KS/GBS+gBQOA==
X-IronPort-AV: E=McAfee;i="6000,8403,9712"; a="151930714"
X-IronPort-AV: E=Sophos;i="5.76,309,1592895600"; 
 d="scan'208,217";a="151930714"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2020 10:21:42 -0700
IronPort-SDR: 9mkEFf+dyQYTOlD08qW7gqnZn1jthEdPMbI9RLDXhGeHZhtizDvwTALzIwuIoMxm8iN96KY73Z
 aaCG32VBEc2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,309,1592895600"; 
 d="scan'208,217";a="495932234"
Received: from fmsmsx603-2.cps.intel.com (HELO fmsmsx603.amr.corp.intel.com)
 ([10.18.84.213])
 by fmsmga005.fm.intel.com with ESMTP; 13 Aug 2020 10:21:42 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 13 Aug 2020 10:21:42 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 13 Aug 2020 10:21:42 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Thu, 13 Aug 2020 10:21:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V8pYaZYyA07hAkhXPUp//0x4Cd0/II2M9KWMSSleyqOY42JDgLNu6DtC5dsCpQhYcIW+Phuu18ZdiEghDjslemJhxGCKlKotmcGGSQSJ6fUsd7RTbUCgxzqqpGfrcCn6SlMGvR4wDl8wo3SCt55hKhQUkhRY8Fe+h0BOEfidUS61Um8UMRSdjEhj87eMsxoaAlAoGnbfXeN8zqW7JYFG0ViWYtzGVbgViDe667yFdWsMuidZQrr+1NM/ZYTxyaaha/eU+W+8Fo+IytItxcLe0yp+qXiASOluHMOe+gv8+E2Lv8mk64cPKcizZ5AdWNfjbaRqddtl+S7N5a0Pji3jDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Oy3M3Ttw+0/HPyyc6l9lITETHexDtHY6Xg6OprsOFA=;
 b=TmR3G6y7BCUEjitTLxpS2eCHnErhI4LBvqrQ8XsakERTgbrykciaEjg+0lSrCqyZUjcGUr0k8S2PSG2NWP2blkm13eDbIsTrnxm6fxIujEV6WcmZSAznue8mR9QcKs9FzV3hrwOh2xEjeh7XklzJ1SMRwH2j5BvOugxQhqiU0VcktMPiMxapyq0Z4TkelKmTYeY1zMTbEX7GBm1bWbmA/SnwxLAuSwpEFfWtN6XhDohxVOE9cd9Eq/4c9BLkiJU0vICLxHb1bbGWMQ/T3cghYdvnh1AlQsnuvgvq2aJEDvk+bq9N/W7SYm3IfselVaDuen2D8AZEvxeJVX3qrI/tYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Oy3M3Ttw+0/HPyyc6l9lITETHexDtHY6Xg6OprsOFA=;
 b=ouGUsVz+77G7++sDjTZCXf1z05RF6LvM+RNnBNMJzuDjSo0cfzPO/g5sudvCj1sIw7q+CvymXY4PnmGBaF9ha0wxGGV2xiNmerH3N4zFSdPkKwxzEMH0uM6Gp16/YHZ/8gz+i4j88L1vshZ7nxlLVffrmrcBLlZI5sks1qchm3I=
Received: from DM6PR11MB2905.namprd11.prod.outlook.com (2603:10b6:5:62::18) by
 DM5PR1101MB2137.namprd11.prod.outlook.com (2603:10b6:4:50::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3283.15; Thu, 13 Aug 2020 17:21:40 +0000
Received: from DM6PR11MB2905.namprd11.prod.outlook.com
 ([fe80::65c9:ac55:7693:e09e]) by DM6PR11MB2905.namprd11.prod.outlook.com
 ([fe80::65c9:ac55:7693:e09e%7]) with mapi id 15.20.3283.016; Thu, 13 Aug 2020
 17:21:40 +0000
From: "Sridharan, Ranjani" <ranjani.sridharan@intel.com>
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, Mark Brown
 <broonie@kernel.org>
Subject: Enabling DAPM for Dummy DAIs
Thread-Topic: Enabling DAPM for Dummy DAIs
Thread-Index: AQHWcZT+08Lc3mSa90ukN5oqtaKksA==
Date: Thu, 13 Aug 2020 17:21:40 +0000
Message-ID: <DM6PR11MB290561D66CB13F86B419004CE8430@DM6PR11MB2905.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: alsa-project.org; dkim=none (message not signed)
 header.d=none; alsa-project.org; dmarc=none action=none header.from=intel.com; 
x-originating-ip: [192.198.151.44]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0e1b0e42-a069-463c-791a-08d83fad57d3
x-ms-traffictypediagnostic: DM5PR1101MB2137:
x-microsoft-antispam-prvs: <DM5PR1101MB21379093A3F1E133C77CFC4BE8430@DM5PR1101MB2137.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vYHpjWLMzrujTcNbTqK3zkqTHIveC6LC35OE3t1XEx3/16aEBdZa9FCEBGFo69FCAK6vxcQWiDyAExT+QE4XfeGvmJo+mKjnZfgdingrNYdo952r3PYtHU8BkgIyvXYAud25e47ybN3MzZm2UqguAhvjPqfGNxs6ddAqVQ5Wkm31rQ2RgO1opWtmhsE7qb41G7CakSAIl/FO5QOFiSJW7nFTQIf74OP/ogaWwHPx1PZHuPhgnB0pR5S4XshCHIlneN9cLjZc1tzJlFPEoqXoGOTJ3nE+WOj6yj9R4WljpcPBcilOdm59p8Qvo+JzeGV+ltA0Acziiry5/db1L8hVKkX65A17L5X0VIdtcJUMh7H2cwPaiBjaOp02jENuwYdII3gO8/XdYmrcvwuJnrMwFQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2905.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(346002)(136003)(376002)(396003)(166002)(54906003)(83380400001)(86362001)(71200400001)(8676002)(66476007)(66446008)(66556008)(91956017)(76116006)(66946007)(52536014)(110136005)(4744005)(64756008)(55016002)(7696005)(26005)(33656002)(478600001)(19627405001)(9686003)(316002)(6506007)(5660300002)(2906002)(8936002)(186003)(4326008)(966005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: lxXSCmvfKhXEykqSiyC+cuUWRq28VjwiqGkZwAyBM1/46fy2cpOK6pMlquFZysJooYGHKJOihQFqkbFPqEt/MYhARa/jcBeiY3LLVueudVHjG6BcvJbvygSpy4lorXv7iaGwRVtQoHjASuNPLuplgJAmhNX7/KUCf3wAlJTFOje2p0J+VsRpLsiIanHBqpQaS4fX8XIL8F2x8PbVwlIjWo0QZ81eOD/vVW0HAYPSu4l34rY43vVjHVe3Q2ZjkBbT6be+uCgEVfpUY4CR94zk5xqIX+MTQnp7NPci2k+03haCQs/0n0iYECK5Abb5YR/YGfwVCGlJhtGO+fR4oonZytfj9to8yxsD/IY2ceT6A5tz9y1p5yK4VbJSkCFJ4bTQF21BirgB/y0ywDzGKGCcYaIx+EVKxKGqYUzHBoUWJa6ysiMcY6WTdxDuFhtMxogFsashdKPmN8dKHUjoUtW8A634ivZxDmYd33qWbdIu4GENMyFeeDsU/fWV8JUMBw9JQRC8nubCw7lkAdljkfDQ/VgeFz6zdCom2OwjKBs8L3fLe7IQ0E5qc4+CxMyB7q1jPKTiEKlgtOuNF+2Btbqs0xpUZ+5MOodrtBsF3koARF+W/gRmb5xlJkZK2JSoKi7kBtsG6sX+xi41SSwBMglxog==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2905.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e1b0e42-a069-463c-791a-08d83fad57d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2020 17:21:40.7134 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /06AcV4LFTUVk7Na3EZ66K2P6VyovyvyUtYbzgTOcGntgACKogO+FHW6F1a9YEcazTZIwx8YODlPDGghu2by5PGEoH2K5/kl1IflYtilWco=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2137
X-OriginatorOrg: intel.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Takashi Iwai <tiwai@suse.de>,
 "bard.liao@linux.intel.com" <bard.liao@linux.intel.com>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>
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

Hi Mark/Takashi,

We're using the Dummy DAI and dummy component for the nocodec mode in the S=
OF driver and we noticed that there are no DAPM power status updates for th=
e widgets because there are no output/input widgets in the Dummy component.=
 Adding these widgets in the dummy component wont help either because we ex=
plicitly skip adding widgets for the Dummy component in the core.

But it would be very useful for us to debug PM issue if we could have the D=
APM power updates for the widgets in topology. Reverting the change that im=
plemented the check for skipping the dummy component probe (ASoC: core: Don=
't probe the component which is dummy) would not be advisable because it wi=
ll be used by multiple cards and will lead to the same issue again.

More details about the issue can be found here:
https://github.com/thesofproject/linux/issues/1987

What would your recommendation be to get around this problem in SOF? Thanks=
 for your help.

Thanks,
Ranjani
