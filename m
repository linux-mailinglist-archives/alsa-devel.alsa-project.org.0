Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 934546F6D60
	for <lists+alsa-devel@lfdr.de>; Thu,  4 May 2023 15:56:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8ABCE193D;
	Thu,  4 May 2023 15:55:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8ABCE193D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683208593;
	bh=cjnlraS0lRYM5x4ijWMr3Zi1VJ/Ps7ehOsoXpvmCBVo=;
	h=To:Subject:Date:References:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=GoOyRjoR0to9uGwnQuW8WHUirzdmMiBFNWVSzBxEBUYQZiUUTtYuOjmMoUR5Ui1Mk
	 1qUD0iwdjDLtiW/IBc00ePApk6mc3YOCiGwz9IkivoMyN8G3FG7vIDTvWrZamtdFbI
	 DPZCXnQTK/E3oj3zZmWWjbxbuIiyvZg0hDiKzX7M=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 31967F80529;
	Thu,  4 May 2023 15:55:43 +0200 (CEST)
To: Mark Brown <broonie@kernel.org>
Subject: RE: [EXTERNAL] Re: [PATCH v1 3/5] firmware: tasdevice_fmw: tasdevice
 firmware loading lib
Date: Thu, 4 May 2023 13:55:21 +0000
References: <20230502053235.27066-1-13916275206@139.com>
 <ZFGqhM0VYFdorkRa@finisterre.sirena.org.uk>
In-Reply-To: <ZFGqhM0VYFdorkRa@finisterre.sirena.org.uk>
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UYEJ2W6LU6D2TVGP4I7WLGCD6K3QMWV7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168320854297.26.2138675356297159469@mailman-core.alsa-project.org>
From: "Ding, Shenghao via Alsa-devel" <alsa-devel@alsa-project.org>
Reply-To: "Ding, Shenghao" <shenghao-ding@ti.com>
Cc: "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "pierre-louis.bossart@linux.intel.com"
 <pierre-louis.bossart@linux.intel.com>, "Lu, Kevin" <kevin-lu@ti.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Xu,
 Baojun" <x1077012@ti.com>, "Gupta, Peeyush" <peeyush@ti.com>,
 "Navada Kanyana, Mukund" <navada@ti.com>,
 "gentuser@gmail.com" <gentuser@gmail.com>,
 Shenghao Ding <13916275206@139.com>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7BDE9F8052E; Thu,  4 May 2023 15:55:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,T_SPF_HELO_TEMPERROR,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D1134F80529
	for <alsa-devel@alsa-project.org>; Thu,  4 May 2023 15:55:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1134F80529
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=VvuDnVk1
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 344DtMmG030465;
	Thu, 4 May 2023 08:55:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1683208522;
	bh=umEVx7KNQWSDDSFFpZpy630z6K88xRHx+G85wX/qN/s=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=VvuDnVk1FQyQqmtSLHL22UEQv6OAVgrYyuWfFZWnG5ojFXdnWuZRmOa/Uaw4r+2NO
	 fAmMmefVzZTjGMkfHskBplMWcdVkkLO4SxTNqD3WQuYSkkt3aM8J6E6rXohztl2uQd
	 K+100yYgoPj0Kfo6rkecGyd8LGXvqhbycneVXoMM=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 344DtLWD057451
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 4 May 2023 08:55:22 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 4
 May 2023 08:55:21 -0500
Received: from DLEE101.ent.ti.com ([fe80::91ee:60bc:bfb7:851c]) by
 DLEE101.ent.ti.com ([fe80::91ee:60bc:bfb7:851c%18]) with mapi id
 15.01.2507.023; Thu, 4 May 2023 08:55:21 -0500
From: "Ding, Shenghao" <shenghao-ding@ti.com>
To: Mark Brown <broonie@kernel.org>
Subject: RE: [EXTERNAL] Re: [PATCH v1 3/5] firmware: tasdevice_fmw: tasdevice
 firmware loading lib
Thread-Topic: [EXTERNAL] Re: [PATCH v1 3/5] firmware: tasdevice_fmw: tasdevice
 firmware loading lib
Thread-Index: AQHZfVYbZ97DiMVErUaDioHaf2zIQa9KHCLA
Date: Thu, 4 May 2023 13:55:21 +0000
Message-ID: <82b9ac35631a4c4993dd2cd75f137273@ti.com>
References: <20230502053235.27066-1-13916275206@139.com>
 <ZFGqhM0VYFdorkRa@finisterre.sirena.org.uk>
In-Reply-To: <ZFGqhM0VYFdorkRa@finisterre.sirena.org.uk>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.249.32.82]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Message-ID-Hash: UYEJ2W6LU6D2TVGP4I7WLGCD6K3QMWV7
X-Message-ID-Hash: UYEJ2W6LU6D2TVGP4I7WLGCD6K3QMWV7
X-MailFrom: shenghao-ding@ti.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "pierre-louis.bossart@linux.intel.com"
 <pierre-louis.bossart@linux.intel.com>, "Lu, Kevin" <kevin-lu@ti.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Xu,
 Baojun" <x1077012@ti.com>, "Gupta, Peeyush" <peeyush@ti.com>,
 "Navada Kanyana, Mukund" <navada@ti.com>,
 "gentuser@gmail.com" <gentuser@gmail.com>,
 Shenghao Ding <13916275206@139.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UYEJ2W6LU6D2TVGP4I7WLGCD6K3QMWV7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Broonie
Thanks for your comments.
In fact, we have a dilemma whether to put the code into firmware folder or =
sound/soc/codecs.
As you know, most cases are audio-related application,  such as a pure audi=
o device or=20
audio2haptics device, keeping the tasdevice-firmware lib into sound/soc/cod=
ecs would make sense.
However, in other cases, tasdevice(such as tas2781) can be used  as pure ha=
ptic to drive the Motor.
moving the lib into firmware folder would make sense, although such an appl=
ication is a niche.
Would you be so kind and give some comments on it? Thanks.

BR
Shenghao Ding
-----Original Message-----
From: Mark Brown <broonie@kernel.org>=20
Sent: Wednesday, May 3, 2023 8:28 AM
To: Shenghao Ding <13916275206@139.com>
Cc: lgirdwood@gmail.com; perex@perex.cz; pierre-louis.bossart@linux.intel.c=
om; Lu, Kevin <kevin-lu@ti.com>; Ding, Shenghao <shenghao-ding@ti.com>; als=
a-devel@alsa-project.org; linux-kernel@vger.kernel.org; Xu, Baojun <x107701=
2@ti.com>; Gupta, Peeyush <peeyush@ti.com>; Navada Kanyana, Mukund <navada@=
ti.com>; gentuser@gmail.com
Subject: [EXTERNAL] Re: [PATCH v1 3/5] firmware: tasdevice_fmw: tasdevice f=
irmware loading lib

On Tue, May 02, 2023 at 01:32:35PM +0800, Shenghao Ding wrote:
> Create tasdevice firmware lib.

>  drivers/firmware/Kconfig            |    1 +
>  drivers/firmware/Makefile           |    1 +
>  drivers/firmware/ti/Kconfig         |    5 +
>  drivers/firmware/ti/Makefile        |    3 +
>  drivers/firmware/ti/tasdevice-fmw.c | 2380=20
> +++++++++++++++++++++++++++
>  5 files changed, 2390 insertions(+)

Given how large this part of the code for these devices is it definitely ma=
kes sense to split it into a separate commit like you've done but are there=
 any non-audio devices in this series which will share the same firmware st=
yle?  If not then it probably makes sense to keep the code in sound/soc/cod=
ecs, though a separate file would still make sense.

There's some devices that do keep firmware interface code in the firmware d=
irectory but in those cases the devices have other, non-audio, functionalit=
y which also uses the firmware (eg, always on monitoring) but I've not seen=
 any of the tas devices like that.  If there are some then the split you've=
 made here makes sense.
