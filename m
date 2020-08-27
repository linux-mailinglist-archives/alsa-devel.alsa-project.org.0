Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F10255159
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Aug 2020 00:53:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E43AE1820;
	Fri, 28 Aug 2020 00:52:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E43AE1820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598568789;
	bh=y5MvzliuWn2tQkeFd/As2d9l/3oTNZrr1jNoqwplnQ4=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L43iQiJG2ho8jbtYDX86EiBy88SIpLw6nAqi9OVSJHtMR3iunA59kP0/DiVzvW5QC
	 Gdd0aF3HmVwUhUW+8huLCQyo8LBsicge5Z33pW5ghaG1wzWg1FKT/gD0AFCzkekyby
	 KdslI6Mog9mrO41H6xe804TV11y7W4kxSmbChQ6s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 22057F800EB;
	Fri, 28 Aug 2020 00:51:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A367F8016F; Fri, 28 Aug 2020 00:51:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8BE12F800EB
 for <alsa-devel@alsa-project.org>; Fri, 28 Aug 2020 00:51:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8BE12F800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="nzpmeXiY"
IronPort-SDR: 73uP9PIwGp6KtinJ54J52+EsPilNNCgDxjGNbXshj1Fvmo7R1TfbdeFmgqLLm9VPiDkMFWlF/K
 XS7vMxiEtDFw==
X-IronPort-AV: E=McAfee;i="6000,8403,9726"; a="218129866"
X-IronPort-AV: E=Sophos;i="5.76,361,1592895600"; d="scan'208";a="218129866"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2020 15:51:15 -0700
IronPort-SDR: PxkxcE/XX0S2B40OZq8vuyUAkCioFCwWokP52vtN25ppycMCwDtj+eS0/KW5i3STiS4co2FCZs
 Gu9XfFlcZdqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,361,1592895600"; d="scan'208";a="403557798"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by fmsmga001.fm.intel.com with ESMTP; 27 Aug 2020 15:51:14 -0700
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 27 Aug 2020 15:50:29 -0700
Received: from fmsmsx156.amr.corp.intel.com (10.18.116.74) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 27 Aug 2020 15:50:29 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx156.amr.corp.intel.com (10.18.116.74) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 27 Aug 2020 15:50:29 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Thu, 27 Aug 2020 15:50:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P5AEJmhrDs8gIKbZrw+KH6nH9PBoyFkm4/UjFSHiex+eTfmrIie/0Xr3e4eqRqEBLv7o0Q6lUZcGHQhWC2Tzvl7ZkoxmURYz7UCz4mVeowVnwly7928x9YqGf8CuPHLQrT+b+L13xwEXbbhgmGgBMe738iTM/k0uCmb4+jk/yhT4rRrJDuCpjIFimNGDoGt6NBMgJACVn5x0g7HdYzC70zGGL0UjLieP5fj3Gzdylsawc23vgZXJB91INnLN/UdTug5rXzSGc82SdcpjcpdhKBqrzS2oPhzCYfy/bmhImbV1OVe3738fyy1svWrVEOYVOpg6i30lgkh40dEiF3hSZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zarADD+AqDFFhT8LW2VfeDaEcCTEX18LSApP4IHmyCc=;
 b=K7v+mSPvwi5xZ2aynUqXcugouRr/vIPc7M6e1UnP7BBBJSU/aeawp9g8KoFcTUI0WI78CNUGmPglb2V/rlgdZ69GT4nKbA1XQyV2IXLwuG9lGEZeGAjWgAp8VyJckMQ3ILGATA4CkyduEeLsNUAXsO6QbVsuMrjamGVEchDjT0K4/4644w2JxDs98Y/wqMyEA5+iudrzwkJDgPo4vkLh6+3MZmyHx9LyjcxdQIdbSrMiJbRXp/8A6X7XkVYxo7emBLJrcm7D/VN+iNQsR8514L72HlNFL8AqOIIUEfzRl+DiUMe6OtuffmvDkGJqdFCi5pDGDrg7ZBaYCE5aQ6tqsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zarADD+AqDFFhT8LW2VfeDaEcCTEX18LSApP4IHmyCc=;
 b=nzpmeXiY5XUPvTyG+tvijA2jX63SjnjpwdDgZlvfveFaDpHYWHb/Ft63xXIruZ+GX2nq9pxQ+2YfyiwJ5xsQx9Cd8r4ArWReTB5N1sssiPOn1liUDetQ1qkirH7q+o752m9l9Ie86B5/rgYM8RvfcF+mV7t27DG7zR4eKPVI528=
Received: from BY5PR11MB4307.namprd11.prod.outlook.com (2603:10b6:a03:1bd::27)
 by BY5PR11MB4259.namprd11.prod.outlook.com (2603:10b6:a03:1be::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25; Thu, 27 Aug
 2020 22:50:27 +0000
Received: from BY5PR11MB4307.namprd11.prod.outlook.com
 ([fe80::98fb:1978:c0aa:80a3]) by BY5PR11MB4307.namprd11.prod.outlook.com
 ([fe80::98fb:1978:c0aa:80a3%5]) with mapi id 15.20.3305.032; Thu, 27 Aug 2020
 22:50:27 +0000
From: "N, Harshapriya" <harshapriya.n@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: RE: [PATCH] ALSA: Realtek: Early Forbid of runtime PM
Thread-Topic: [PATCH] ALSA: Realtek: Early Forbid of runtime PM
Thread-Index: AQHWfDHplWSaCA8uFUCMzZ3Ei3jmzqlLhqkAgAEJWfA=
Date: Thu, 27 Aug 2020 22:50:27 +0000
Message-ID: <BY5PR11MB43072E4C060F11160BC01AA1FD550@BY5PR11MB4307.namprd11.prod.outlook.com>
References: <1598505643-30347-1-git-send-email-harshapriya.n@intel.com>
 <s5heensr2vl.wl-tiwai@suse.de>
In-Reply-To: <s5heensr2vl.wl-tiwai@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
authentication-results: suse.de; dkim=none (message not signed)
 header.d=none;suse.de; dmarc=none action=none header.from=intel.com;
x-originating-ip: [24.23.139.164]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b75fdb17-1a57-453e-12c8-08d84adb97b6
x-ms-traffictypediagnostic: BY5PR11MB4259:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB42593CAF1C72B52970339269FD550@BY5PR11MB4259.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NWZsv4bZqrnKNtDTzmSU9iZpwcES7rMop1DmG5MSZW7KOL6ZxY+nniQ9Djkjz+rnIkjy+SZwGUJ9ci8enupaZGQ8Jdcwja8LuqdzW3fmdVt4kXr/ygd3fJ1sF79VynpwvlnDisGEC1TUvfVmVSbMz12rhp7aGuT3aT+LpCRlKQKAndN29qohGzj1MHodbulZgSORZtKPo2uvzRMhlrT/dFadBGdBaN/cL+ow6P2DyNA3ARRcjkNaxOBKOZQrAcm54PsrnD3yNrxWEhW1D3VcGd00cy4C3bEZki9n1g7r7QnzTkSkkoPgC6ccm3pNO/iuvHWDgJTK41bwGgpeUx8bhg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(366004)(346002)(376002)(136003)(66476007)(66946007)(52536014)(64756008)(66446008)(76116006)(71200400001)(107886003)(6506007)(6916009)(8676002)(33656002)(8936002)(186003)(7696005)(9686003)(66556008)(4326008)(316002)(55016002)(26005)(2906002)(478600001)(5660300002)(54906003)(83380400001)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: BSUgqgk3C/i6/n0nintm/ahZjvu+lcuvjdEfDyhk9rHjmnIKQXs8+y9ZqI3+ql2kqPa7XbA5JvUQ04AnitK8B6eCO85KF9Wr0pilzExY5/oQtwMSl4pKMSc+5e5hiIRjfaz0LC8Mv1ddzfcnAFHCm+cYVWXHvdubklBcfp+kQO2ccchep3iTQqwRWz1IIMNWXW2Y5QLUV3OY3OrLf+dkrO2IF1e8SoBRq5mBlrF+DlZxfSZKVNuZfSWggGenXeXlyK3R3r2gkn83GRbAYmyHo7P9j/d058kR9jjuVTExDNKof9CUZKtadtcSOeECGP9LGQq2gRnG8tOXcDEYi426BCKWcohEXFnNxUKvrhgTqehLeLjtm2bi3F3+tjSiSstcRhCrw9CGbU4LzEGXkZUaJtQ64jIMRZvdqXWjH1sYsFWCrhMIVUoj49TiicXJJR01A/lO1DjOLId/vqXA1Tc2GBSJ4kWMD7ZjZ1XHdHWCcVLaR40khM5UVaE3fUjrW8RXhGzCEHgXRhCFgAAvs/LA15aQlboxhKA9dKegodQpt180SvJKCQlRuNZluAflqcrNME0S8vJq1cGdYhKgPVuOfMyn6oNKBy3kbxvcRt2erVJnTo40UJ/0IWNAvZdL04361/AgQLeO3nb3HFQdYyKpsw==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b75fdb17-1a57-453e-12c8-08d84adb97b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2020 22:50:27.4861 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YbkNJ2u1H/o/xWfq2Q1uTas1EIzCO2HSQCsxc43mm3TSODREHSFQxgyxDdYkle/lMrp8HwY2zOetByMzuHvhjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4259
X-OriginatorOrg: intel.com
Cc: "Jillela, Emmanuel" <emmanuel.jillela@intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
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

 >
> > For Realtek codecs, pm_runtime_forbid() is called in the probe
> > function after the build_controls(). In a stress test, occasionally
> > the runtime PM calls are invoked before controls are built. This
> > causes the codec to be runtime suspended before probe completes.
> > Because of this, not all controls are enumerated correctly and audio
> > does not work until system is rebooted.
> >
> > This patch calls pm_runtime_forbid() early to fix the issue.
> > Multiple stress tests of 2000+ cycles has been done to test the fix.
> >
> > Signed-off-by: Harsha Priya <harshapriya.n@intel.com>
> > Signed-off-by: Emmanuel Jillela <emmanuel.jillela@intel.com>
> > Reviewed-by: Kailang Yang <kailang@realtek.com>
>=20
> The behavior shouldn't be specific to that model, also not to codec vendo=
rs, but
> it's rather a generic problem, so it's no right place to correct, I suppo=
se.
>=20
> Can we simply call pm_runtime_forbid() at creating a codec object like be=
low?
We tried this change and its working as expected. I believe this will addre=
ss similar issues
across all codecs. Will send a patch with this fix.
>=20
>=20
> thanks,
>=20
> Takashi
>=20
> --- a/sound/pci/hda/hda_codec.c
> +++ b/sound/pci/hda/hda_codec.c
> @@ -1000,6 +1000,9 @@ int snd_hda_codec_device_new(struct hda_bus *bus,
> struct snd_card *card,
>  	if (err < 0)
>  		goto error;
>=20
> +	/* PM runtime needs to be enabled later after binding codec */
> +	pm_runtime_forbid(&codec->core.dev);
> +
>  	return 0;
>=20
>   error:
