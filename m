Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3E723B285
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Aug 2020 03:59:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9BB8A1669;
	Tue,  4 Aug 2020 03:58:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9BB8A1669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596506367;
	bh=08juxPBsuT/UBOoqsHstqD/GVc7IpS8HIxe4mRT43zs=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kmgYXt3+dApSA94HcQ/SothnBtkgJrwHeiCjZVXYynN6O7WBpulXma525Y069MXef
	 BGiw4oKTOnb8evLCC80gkPEQo5kMN/NocBCrouRYSGz4l6hcPLcQ5W2C1ht+LvyNbi
	 NW1qgwUOir5RZ5OhiYXdP2YWxeNzUGT3ehZR3avo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CFBA7F800B7;
	Tue,  4 Aug 2020 03:57:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D969F80150; Tue,  4 Aug 2020 03:57:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 24AC4F800B7
 for <alsa-devel@alsa-project.org>; Tue,  4 Aug 2020 03:57:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24AC4F800B7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="E1GRP8ph"
IronPort-SDR: A3J5fK/SujbVOLiiBuI9zyj3mcA117OjrQmG4BhU7K4Iq4SeGqeWyQYiGP/Zcf1Dl7In0n3IVb
 F7Rih6lBJ6Rg==
X-IronPort-AV: E=McAfee;i="6000,8403,9702"; a="216634782"
X-IronPort-AV: E=Sophos;i="5.75,432,1589266800"; d="scan'208";a="216634782"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2020 18:57:32 -0700
IronPort-SDR: OxFJm3hOpYjgD0opIaniqClulxBPOMhC2CnQyCyMPJn84XiHOCLzOj0YnoeXGuQ/gFjtPbG97a
 ZUm2JRc4D4hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,432,1589266800"; d="scan'208";a="492694874"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga005.fm.intel.com with ESMTP; 03 Aug 2020 18:57:32 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 3 Aug 2020 18:57:32 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 3 Aug 2020 18:57:31 -0700
Received: from ORSEDG002.ED.cps.intel.com (10.7.248.5) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 3 Aug 2020 18:57:31 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (134.134.137.101) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 3 Aug 2020 18:57:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Crkvyo53ajY2y3c0mys6qOH/n3hN7AXd60W4us8yu68zwQfKbBcK5TIZ19nK5pFpv6dMcfsWgF5Dg/hay9XfF2QdDaZABFSndExnUMqRlS4HGmtKajJDZBsA2dfG+4k7Bc08Z2gsY3GG77A65uAwQfz5g8+LxNBc94clpwudaCSAtiREgBayetVaQ9VrCVD+1I/rX4HZicTnTqqP63ZkvStxLncIaIDQzoKyCsV7gRvr4qpcK/v3gsZF7ydQJX/EO3lyDyYhwXg5Nefb6MFEiI7BPpgv0aGP+fDqaUH1mDYNjBcevH5lp0bzhNeNZqcJJalgP+hQBaltnNO3q651Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0iiK9rcTbGcps+UfJg8K4eNTEbwYioizX6S1hkHBoRM=;
 b=WquVikPtdj8c61mlYmLqQ6Cb9S2gIPnxLqi2wjhOfpKrR3ANptpJdM/PkTL58DdwZ9ai7EsTEZE9at5ZSBjWOkkkaVgQj6IFRP3f3mQ157QI9BxOrGv9uSQVSFq/2ePKTgbZozrpSDDtKYxIwXt63NT87BrgnOKqrCmr0X5DrApXjHkdUjYWlEEqdqJkGzgifNFXWpBF7oHgFO2P3nW6QvrWblXrXFHfmehBHMCq4kVOEpogKx6MyuelwmRbL7DIc4ljUB6pJ1ywR/w2dcdOt/7iuEQJdmAhgw3Etlwx0+vWbh64I+T5+8JmvN1EIIv4u/AZ87tREAS/YN0IcQ7ajw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0iiK9rcTbGcps+UfJg8K4eNTEbwYioizX6S1hkHBoRM=;
 b=E1GRP8ph2hnpBe1LAQK7M7vCRPKn1k808gYiX7wN2J3OCHuMj4l1QPkD19t6/fv50oHMURJLGSP/8wIZJr2GqHkuA4XhaMtyWoXaSg+Rl67d4hEU6nTIh4+URlwap5OEcqjSIfq+/4ZV8AY2LnfSmtXnc/VIlqXJbgsEJkghyDA=
Received: from BYAPR11MB3046.namprd11.prod.outlook.com (2603:10b6:a03:86::18)
 by BY5PR11MB3992.namprd11.prod.outlook.com (2603:10b6:a03:188::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.21; Tue, 4 Aug
 2020 01:57:23 +0000
Received: from BYAPR11MB3046.namprd11.prod.outlook.com
 ([fe80::cc39:1771:dc1f:593c]) by BYAPR11MB3046.namprd11.prod.outlook.com
 ([fe80::cc39:1771:dc1f:593c%3]) with mapi id 15.20.3239.021; Tue, 4 Aug 2020
 01:57:23 +0000
From: "Sit, Michael Wei Hong" <michael.wei.hong.sit@intel.com>
To: Mark Brown <broonie@kernel.org>
Subject: RE: [PATCH 4/4] dt-bindings: sound: intel,keembay-i2s: Add
 channel-max property
Thread-Topic: [PATCH 4/4] dt-bindings: sound: intel,keembay-i2s: Add
 channel-max property
Thread-Index: AQHWZmTSECd6XhR1kUiCjOuunRmPnqklpW/ggACVP4CAAP0SgA==
Date: Tue, 4 Aug 2020 01:57:23 +0000
Message-ID: <BYAPR11MB3046E41085E470BFB11D710B9D4A0@BYAPR11MB3046.namprd11.prod.outlook.com>
References: <20200730055319.1522-1-michael.wei.hong.sit@intel.com>
 <20200730055319.1522-5-michael.wei.hong.sit@intel.com>
 <20200730112948.GB5055@sirena.org.uk>
 <BYAPR11MB3046DD82FAC2B5C672FC85B29D4D0@BYAPR11MB3046.namprd11.prod.outlook.com>
 <20200803104917.GB4502@sirena.org.uk>
In-Reply-To: <20200803104917.GB4502@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=intel.com;
x-originating-ip: [121.123.85.241]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aa05616c-3791-4eb6-6b84-08d83819bb2a
x-ms-traffictypediagnostic: BY5PR11MB3992:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB3992C9AA5677246B5CB252CB9D4A0@BY5PR11MB3992.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +tu9sjdQddObrgpgxu39dqIJbhXD07465aKm3oikW4GAabhw9kXFTb9woVFZprCzVqOoZcGV2x3VG46gW8u/k5zVwKqeRmQLTnqlVoNWWUUcCcP5Rd6ywJDUE9yELAG40sXBwe3nvCDhyzkg/wxhox/k2kOjWqF/221XQ/z/Hjo2u/USe5p1t81vm1DS36fFTjS3amDu+Kn8dYqm+u29+NWReeSI2/sMUfTNXfMP88w0Ldygvg4l4Gld/3MifW+8RptEf94GGl1/hvEIi6JolJ6vVXnl0OxZTsalCXAmKKWKvSWHn2snN6MEFfmlUo6XEZQnLBaDZLIhw0PBT29c63Id3mU5ajVwTfbqoz8Yn7B01GKx3czcvOIhrU1Wn/ru
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(136003)(396003)(39860400002)(376002)(366004)(83380400001)(55016002)(26005)(6506007)(33656002)(5660300002)(7696005)(2906002)(53546011)(52536014)(86362001)(478600001)(6916009)(9686003)(66446008)(71200400001)(316002)(186003)(66476007)(64756008)(66946007)(76116006)(54906003)(4326008)(8676002)(66556008)(8936002)(142933001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: pDobKezYLwUQUBstT4I7Gq7jGJQnPh7PVHQVymrZBW7I64lr5xTPtH5swOfpdUfMDu/FlvqElQHtlclSVCWI3UECNllGABLP6Xr3NYA0ksuRPqaiIP/uer9z24lfDKhb3WnJ+I7M804kBESLGGxQv1s/fImh+Jp45yvj2+wbByzUsUZ1HlQcOBfw5SlBoB43yDLG9rf+1ZQciWt7RQXiJeildOzIQdW5vS6reM9GD1suCC6kLr+f9kAlHww5vkyz0cjungEx2mNJ+gMqYXCDEp8b4TLeNjkAHic+/0AVmjmO7leRWCDLs7ffE8Zwo9i6mSECUV4Itf8PPS4wvk7ek8kPRqyFwp9hNmi1eh8Z4Sa8glQYrGbrklqjoGxAFtE2gYyIVCLc3j7lT9b+mmlGWqYJXzB5/X3jvXUII5uPJH1c+8mSc+D6+iw/kUazSiWyA7ORXbq7xuVP6MOkNYNa8orP2bt0PDMiQ4GOSplBv+mRtYN+cYuuXmcPs8wwV8sKvglDattYGQ+CkHXj2PjojI0QANXYJVy7hJcSnGin7SSXrau8kfv5zXBww+ABoyE5zfXIbBSa2prCTdQNff8QNnHT9IwCkeP5Bf6R/sxwe81jg0JXak0UHp/0DD6epLRip8T+AJVtSJl14Jm1Gjyjbg==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa05616c-3791-4eb6-6b84-08d83819bb2a
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2020 01:57:23.6323 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1LTzqeABXvP0GfGYhz4v+R6l4yuzNlJ2V5tFj2/kYqJpr3VcLlAXTCGSOQ2cmjT/7YLrMc+FpIxeSn3eNlDqTPNw2HS0FLJeJMQlGU0CCkw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3992
X-OriginatorOrg: intel.com
Cc: "pierre-louis.bossart@linux.intel.com"
 <pierre-louis.bossart@linux.intel.com>, "Rojewski,
 Cezary" <cezary.rojewski@intel.com>, "Shevchenko,
 Andriy" <andriy.shevchenko@intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "Sia,
 Jee Heng" <jee.heng.sia@intel.com>, "tiwai@suse.com" <tiwai@suse.com>,
 "liam.r.girdwood@linux.intel.com" <liam.r.girdwood@linux.intel.com>
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
> Sent: Monday, 3 August, 2020 6:49 PM
> To: Sit, Michael Wei Hong <michael.wei.hong.sit@intel.com>
> Cc: alsa-devel@alsa-project.org; tiwai@suse.com; pierre-
> louis.bossart@linux.intel.com; Rojewski, Cezary
> <cezary.rojewski@intel.com>; Shevchenko, Andriy
> <andriy.shevchenko@intel.com>; liam.r.girdwood@linux.intel.com;
> Sia, Jee Heng <jee.heng.sia@intel.com>
> Subject: Re: [PATCH 4/4] dt-bindings: sound: intel,keembay-i2s: Add
> channel-max property
>=20
> On Mon, Aug 03, 2020 at 01:59:10AM +0000, Sit, Michael Wei Hong
> wrote:
> > > On Thu, Jul 30, 2020 at 01:53:19PM +0800, Michael Sit Wei Hong
> wrote:
>=20
> > > > Add a property that configures the interface to the desired max
> > > > number of capture channels. The platform may have multiple
> > > > interfaces with different number of capture channels.
>=20
> > > Why?  None of the other platforms which support many
> channels need
> > > this defining and the constraint code and/or machine driver
> would
> > > normally be where this would be handled.
>=20
> > The platform uses the audio-graph-card to create the dai-links,
> and doesn't use a specific machine driver code.
>=20
> The audio-graph-card is very flexible and if it doesn't support
> something which it is useful to configure per platform then that's
> the place to add the extension, not some DAI specific driver.
>=20
> > The platform also has 2 different interfaces which have different
> supported max-channels.
> > Using this value in the device-tree to determine the maximum
> supported channel of the interface.
>=20
> These should have different compatible strings, there are likely
> further differences between them (even if they are not currently
> documented).
>=20
The 2 different I2S ports are from the same SoC which supports different
number of channels, do we need different compatible strings for this?
Considering the only difference is the maximum supported channels is 8 and =
2?

> Please fix your mail client to word wrap within paragraphs at
> something substantially less than 80 columns.  Doing this makes
> your messages much easier to read and reply to.
