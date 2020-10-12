Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD46D28B08D
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Oct 2020 10:50:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 688DE167E;
	Mon, 12 Oct 2020 10:49:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 688DE167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602492609;
	bh=c4sr+01uSj7e12mlMB9nsGqgy082Rp65RFRa9kH0Dhw=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Dr1EMlOAgXLtxFmqoiqqxWh9dQ5H+DViqhIKDo4bywlXp4Gb20+Zvlf9P9hlUIWYC
	 jUHH1wjsz5M0nmAcwh/LQ12o2UKtmiqOZWxZYJfW8+HqN0doKNQWM+ovuFDAUDomaW
	 6v3p+VL2dqMP0IvHSAtZO1U1/xIEmVU6ljKK033w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 044B6F8020D;
	Mon, 12 Oct 2020 10:48:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7457F80217; Mon, 12 Oct 2020 10:48:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30, RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3F46DF800D8
 for <alsa-devel@alsa-project.org>; Mon, 12 Oct 2020 10:48:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F46DF800D8
IronPort-SDR: pOl06zbwMGGVOVj2Fw1DbwnwmzFwZXxy4QRJlpesK5S9myMuRTCZqM7fb3R/tTp8z3OS3jSHOW
 gVRN9b2kuyFg==
X-IronPort-AV: E=McAfee;i="6000,8403,9771"; a="152635249"
X-IronPort-AV: E=Sophos;i="5.77,366,1596524400"; d="scan'208";a="152635249"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2020 01:48:17 -0700
IronPort-SDR: cJ04vvycH8o/rxBNQwe89riI13jYAbkP+IJqB/80VhaGtvkcSOoZCjyT4ZtP3Vq3RGwQDdV2Kp
 KMkoODVhFp6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,366,1596524400"; d="scan'208";a="344798870"
Received: from irsmsx605.ger.corp.intel.com ([163.33.146.138])
 by fmsmga004.fm.intel.com with ESMTP; 12 Oct 2020 01:48:16 -0700
Received: from irsmsx601.ger.corp.intel.com (163.33.146.7) by
 IRSMSX605.ger.corp.intel.com (163.33.146.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 12 Oct 2020 09:48:15 +0100
Received: from irsmsx601.ger.corp.intel.com ([163.33.146.7]) by
 irsmsx601.ger.corp.intel.com ([163.33.146.7]) with mapi id 15.01.1713.004;
 Mon, 12 Oct 2020 09:48:15 +0100
From: "Rojewski, Cezary" <cezary.rojewski@intel.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: RE: [bug report] ASoC: Intel: catpt: Firmware loading and context
 restore
Thread-Topic: [bug report] ASoC: Intel: catpt: Firmware loading and context
 restore
Thread-Index: AQHWn0Iuu0cjdc3g0E+/qfDHce7hxKmTqVpw
Date: Mon, 12 Oct 2020 08:48:15 +0000
Message-ID: <423749645740488bab10cb3565426279@intel.com>
References: <20201010201547.GA1890676@mwanda>
In-Reply-To: <20201010201547.GA1890676@mwanda>
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
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
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

On 2020-10-10 10:15 PM, Dan Carpenter wrote:
> Hello Cezary Rojewski,
>=20
> The patch a9aa6fb3eb6c: "ASoC: Intel: catpt: Firmware loading and
> context restore" from Sep 29, 2020, leads to the following static
> checker warning:
>=20
> 	sound/soc/intel/catpt/loader.c:654 catpt_first_boot_firmware()
> 	warn: consider using resource_size() here
>=20
> sound/soc/intel/catpt/loader.c
>     638  int catpt_first_boot_firmware(struct catpt_dev *cdev)
>     639  {
>     640          struct resource *res;
>     641          int ret;
>     642
>     643          ret =3D catpt_boot_firmware(cdev, false);
>     644          if (ret) {
>     645                  dev_err(cdev->dev, "basefw boot failed: %d\n", r=
et);
>     646                  return ret;
>     647          }
>     648
>     649          /* restrict FW Core dump area */
>     650          __request_region(&cdev->dram, 0, 0x200, NULL, 0);
>     651          /* restrict entire area following BASE_FW - highest offs=
et in DRAM */
>     652          for (res =3D cdev->dram.child; res->sibling; res =3D res=
->sibling)
>     653                  ;
>     654          __request_region(&cdev->dram, res->end + 1,
>     655                           cdev->dram.end - res->end, NULL, 0);
>                                   ^^^^^^^^^^^^^^^^^^^^^^^^^
> It's been years since I have seen one of these warnings.  Back in the
> day we used have have a lot of off by one warnings because resource_size(=
)
> is supposed to be calculated as "end - start + 1".  But here we are
> calculating "dram.end - res->end" so I'm not sure if the math is correct
> or not.  This is very new code so hopefully you know the answer off the
> top of your head?
>=20
>=20

Hello Dan,

Thanks for your report. However, I do not see any problem with above
code.

Let me elaborate the context so both parties are aware of what's going
on:
Host (kernel driver) is tasked with reserving entire region of DRAM past
the module (aka resource) with highest offset. Offset is unknown
upfront. It needs to be searched for. So, after all modules have their
adequate DRAM space assigned, we search for the very last module. Its
'end + 1' marks the beginning of DSP-reserved region, that is one that
DSP firmware will be making use of internally. Host needs to reserve it
early so further reservations (done e.g.: on audio stream open) won't
target said region. 'dram.end' on the other hand marks the end of the
entire block - past that point IRAM begins. Area in-between is what we
need to flag as already in-use.

Some basic math/example:
	dram.start =3D 0x0
	dram.end =3D 0xAFFFF
	resource_size(dram) =3D 0xAFFFF - 0x0 + 1 =3D 0xB0000

found 'res':
	res.end =3D 0x9FFFF

area to be reserved:
	target.start =3D res.end + 1 =3D 0xA0000
	target.end =3D dram.end =3D 0xAFFFF
	resource_size(target) =3D 0xAFFFF - 0xA0000 + 1 =3D 0x10000

and so:
	dram.end - res.end =3D 0xAFFFF - 0x9FFFF =3D 0x10000
what equals resource_size(target).

Please, let me know if I'm missing something here.

Thanks,
Czarek

