Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A06CD10FC18
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Dec 2019 11:59:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E62D1614;
	Tue,  3 Dec 2019 11:58:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E62D1614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575370779;
	bh=DV2ctO8c2KnCg+ZS2Ai8jKR7hOdRZ9uPAy9i9ooT5S8=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sRCVVRyysU8+GpowTYsux57zmVG+CAxSmD4uIAcThG1il9Q9W+JPMzLYYlWV4pdrs
	 icS9Iv/mfuT2+cUXxCFwfUEQXr+ONA9w+dE086E58TULib7gM1U8eqisEePSus3K0m
	 /ZfktU+0RqRX+mMlGs8H9aD2h1asx/aCIzDuce+c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 83DDBF8015A;
	Tue,  3 Dec 2019 11:57:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E624CF80227; Tue,  3 Dec 2019 11:57:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODY_29,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com
 [195.245.230.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ECF19F800F0
 for <alsa-devel@alsa-project.org>; Tue,  3 Dec 2019 11:57:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ECF19F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=dialogsemiconductor.onmicrosoft.com
 header.i=@dialogsemiconductor.onmicrosoft.com header.b="mpcvDPML"
Received: from [46.226.52.200] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-4.bemta.az-b.eu-west-1.aws.symcld.net id F0/92-17986-CAF36ED5;
 Tue, 03 Dec 2019 10:57:48 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrEJsWRWlGSWpSXmKPExsWSoc9oobvG/lm
 sQdMmDosrFw8xWaxp7mCymPrwCZvFtytA1uVdc9gsOnf1s1ps+L6W0YHdY8PnJjaPnbPusnss
 3vOSyWPTqk42j31vl7F5rN9ylcXj8ya5APYo1sy8pPyKBNaMk08OsxfMFKw4duAecwPja94uR
 i4ORoGlzBLH3rexQzjHWCQW9B5lg3A2M0r87v0J5rAInGCW2P1yFguIIyQwlUniZ/9uJgjnAa
 PEptl3GbsYOTnYBCwkJp94ANYiIjCdUeLp5Ldgk5kFGpgkVq04wQRSJSxgJ/HhyWNmEFtEwF5
 iWeM3dgjbSWLrzHMsIDaLgIrE6tOTweK8AokSb5s3Qa17yChxcd8XsEGcAqEST+fPBBvEKCAr
 8aVxNZjNLCAucevJfLAaCQEBiSV7zjND2KISLx//Y4WoT5U42XSDESKuI3H2+hMoW0li3twjU
 LasxKX53VC2r8TUk7fYYeoffrzCCmFbSCzpbgU6mgPIVpH4d6gSIlwg8Xz6YhYIW03ixpsOqB
 NkJA5eWsEK8ouEwCtWiTOL5rJNYNSfheRsCFtHYsHuT2wQtrbEsoWvmWeBw0JQ4uTMJywLGFl
 WMVokFWWmZ5TkJmbm6BoaGOgaGhrpGlpa6BoZGeglVukm6aWW6panFpfoGuollhfrFVfmJuek
 6OWllmxiBCa3lIJjd3Ywtn14q3eIUZKDSUmU9+/nJ7FCfEn5KZUZicUZ8UWlOanFhxhlODiUJ
 HhZrJ/FCgkWpaanVqRl5gATLUxagoNHSYQ3wA4ozVtckJhbnJkOkTrFqMsx4eXcRcxCLHn5ea
 lS4rxJtkBFAiBFGaV5cCNgSf8So6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWHeAJApPJl5JXC
 bXgEdwQR0hHnLI5AjShIRUlINTH2Tvu5Xvxp5tvy87Tw5kcQEpaWPbOb5cLXLvz3xM2xymMjd
 fdc755wJfXTD2WWx/zJe29PbPtTP8Ny+bs87NaNAASUfLp7C31c/qkn8PX4w/tOcnYsDY8P/N
 OnLmStkPL5+T2r/LyaWymjNwjr36UsvudesmO55aFXeA2n771v3vfD4FRzazJQno+ydoPLkXB
 /X6mU7VwnV+pWs5vlb9oHB4/KjvSW7Y/qurjh2aDLntNRVJaLKeixcwYuz+Z59mPsmZFnd+a5
 TnaVv7uSc/v8wyWn1y/gVjZPfTjI57XIoxb61ZQd744Mrszf/1NtWvKvc9LZb0ErmjEP/f5/6
 M/Vpdcys9at//uXdpyOorCiixFKckWioxVxUnAgAmzOnvXUEAAA=
X-Env-Sender: Adam.Thomson.Opensource@diasemi.com
X-Msg-Ref: server-16.tower-288.messagelabs.com!1575370667!709842!1
X-Originating-IP: [104.47.1.56]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.44.22; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13915 invoked from network); 3 Dec 2019 10:57:48 -0000
Received: from mail-ve1eur01lp2056.outbound.protection.outlook.com (HELO
 EUR01-VE1-obe.outbound.protection.outlook.com) (104.47.1.56)
 by server-16.tower-288.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 3 Dec 2019 10:57:48 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GravfMyEx3VwVi/C2Sw94X6p92B082OaeCepIZTqMjucZk7YFHymCx8md/QKvl7zAzac3pb5PsN7QIf/vM1v+EsMErtYfQcxE7j8RxfFTPOsIwt0tYAXtQ8WpF98/3PO7SX2NgNQtW2KhaO/bfmry2GV9OLaFXrvBiP0q0tKX46XjNdKmnf7nsJHmr/jWFIVbFp+wqKMZs/XKk/T6waGjoqHOADwRU/sQCdmDtiloLFAk9drWQKCwZ8n42bstQtuCSioOiID+EoYKHoNsThsjNUk/T71/tc/lRMhJIZ7U+5I4hKDcOLdOm8mfY7o1iyV+3fTlxsCSm1Mr2Q6cWbRZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X1zvaJtnVsoxnUlnINoTNeNjG0yPEP8EQdHjRHQ5/vY=;
 b=JZw/Gm5lz+tFipRJ5i55JzxWoLOo49QDtPe7EW/kuW7Rjy9C5QgLieaAInwiB/tMLkt9U7/7nRdXedPiGxwYON+99nwd33kpxtDNvtHyAF7eO2C8QlzRUl0ItR3K3IA/BGzGJWUQA50dOsTDVjzfm+1h6ihZdYkDV1jbWmf3ZjY04HftuZeKxK5iszu1spOITlrLan2Md4YcLTrZStMmmrlBzgxmCwwut8lXo9Nmf/r0d/qhJXCvJiNwB7FaYdIUNbaSnmOTNTdH/ZgqNz25nti7l6zNY/Mkhrb3dGmwZv3CyOuY/alL+ErZyDJ5pFq+DwFw6X2qc5oQcCm+qoqMTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X1zvaJtnVsoxnUlnINoTNeNjG0yPEP8EQdHjRHQ5/vY=;
 b=mpcvDPMLWfx7U6onskKAasic264m/yAsSPbiE2lcX0FqknE4rN9GB7XeRq3z3shpkhUn3IwifDnZjYNZKMx1M/LZwp5zEOPJkNuY0y2atPKz8uMrgHWoqv2PRHjXT/VckaEkuf4EFtTKMTno4ENicfXpb/OCgGHrt5XyynkS4fE=
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM (10.169.154.136) by
 AM5PR1001MB1140.EURPRD10.PROD.OUTLOOK.COM (10.169.155.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.17; Tue, 3 Dec 2019 10:57:45 +0000
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5525:87da:ca4:e8df]) by AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5525:87da:ca4:e8df%7]) with mapi id 15.20.2495.014; Tue, 3 Dec 2019
 10:57:44 +0000
From: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To: "Lu, Brent" <brent.lu@intel.com>, Adam Thomson
 <Adam.Thomson.Opensource@diasemi.com>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>
Thread-Topic: [PATCH] ASoC: da7219: remove SRM lock check retry
Thread-Index: AQHVqaxDP6cBrmECm0aX2T25rtDQx6eoJvjggAAPtwCAAAQYEA==
Date: Tue, 3 Dec 2019 10:57:44 +0000
Message-ID: <AM5PR1001MB09946C295B8DAD5F9C8D191080420@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
References: <1575358265-17905-1-git-send-email-brent.lu@intel.com>
 <AM5PR1001MB0994EB497D3BC7D0F4C6FD9080420@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <CF33C36214C39B4496568E5578BE70C7403CA7B2@PGSMSX108.gar.corp.intel.com>
In-Reply-To: <CF33C36214C39B4496568E5578BE70C7403CA7B2@PGSMSX108.gar.corp.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.225.80.228]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ac2d88cd-086b-4d90-c5cb-08d777dfa070
x-ms-traffictypediagnostic: AM5PR1001MB1140:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR1001MB11407788D6C20771D3FF179CA7420@AM5PR1001MB1140.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 02408926C4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(396003)(39860400002)(346002)(366004)(376002)(199004)(189003)(99286004)(6506007)(25786009)(14454004)(76176011)(52536014)(316002)(966005)(8936002)(81166006)(110136005)(8676002)(478600001)(54906003)(4326008)(74316002)(86362001)(6246003)(81156014)(7736002)(305945005)(2501003)(76116006)(229853002)(5660300002)(446003)(3846002)(33656002)(66946007)(9686003)(6116002)(55016002)(6306002)(66556008)(6436002)(11346002)(66446008)(66476007)(186003)(64756008)(256004)(14444005)(2906002)(102836004)(71190400001)(55236004)(53546011)(7696005)(71200400001)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR1001MB1140;
 H:AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:0; MX:1; 
received-spf: None (protection.outlook.com: diasemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xTyDvUMwp1shUYml2fgCzU2RoFLuNpIYa2AiZ489gs5iSxbBhmyggZVLi7bQzcr7JXZzaD/uh5daFPiSfxROLXHL+0RNNyrsQDBJ9LPJwT+w5NKgoPA3ciDOiUzE2/UiiH0jsOcVsELvBOHDyzCnT2e/vPgMCoip18odfcSqtUCuQwfVer5m4fydWzkPmTrs+wWEkTzz+CaMky48sITdClvn95s0ZBEvvcHZq0XVR6YcxGyLUte1DPCqglNt1Te/Ox7xALNRLmMgQxNUCuEMQUHA6batrNphTbRhjmbGJEu7HBnRmRmiZ8AMSgk+EiYc/6tRX9BzYHxfvQSkywkdw+eBDHmnM2FkdBMx2PMGoVCA4n5qLZsaOntXoYcRbFhrN19tqrsgjYO1eVCztjMTb/ageoZWwJd3xgR8I3rjZ9eXIoIZ1xtQ3E/SYKT0HEcWg0hL3b7bbm9jrINIsg9ABvYvQnDaPjMi/cc0i72syUU=
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac2d88cd-086b-4d90-c5cb-08d777dfa070
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2019 10:57:44.7412 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QxWzkHEj0WRmqeYM4PQNKy38Floubko2VSDGbrhV5HCwhAgXleSI2RirS6fsn3BlOgxpSWGYOYnKeChPmPEy82Fd6Rlaw6CnG3VpGgY4knU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR1001MB1140
Cc: Support Opensource <Support.Opensource@diasemi.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: da7219: remove SRM lock check retry
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 03 December 2019 10:33, Brent Lu wrote:

> > We can potentially reduce the timings here for something shorter although
> > I'd need to speak with the HW team as to what, if any reduction is feasible.
> > However this is not a real fix as there's potential for audible noises when you
> > don't enable WCLK first. As far as I can tell the Intel platforms are capable of
> > enabling clocks early, as can be seen in this board file with early SCLK enable:
> >
> > https://elixir.bootlin.com/linux/latest/source/sound/soc/intel/boards/kbl_rt
> > 5663_max98927.c#L99
> >
> > I think there's a need to find some method to enable the WCLK signal
> > otherwise there's the potential for audible artefacts when SRM finally locks
> > which is not going to be pleasant.
> >
> 
> Hi Adam,
> 
> Thanks for reply. This patch is not fixing any bug. It just shorten the audio latency
> on our boards. Basically we are idling there for 400ms then print a warning
> message
> about SRM not being locked. It seems to me that 400ms is too much even for
> those
> platforms which are able to provide WCLK before calling snd_soc_dai_set_pll()
> function but it relies on your HW team to provide the number.

But on platforms where they can enable the WCLK early they shouldn't be looping
around here for anything like 400ms. In an ideal world when that widget is
run SRM should hopefully be already locked but the code does allow for some
delay. Actually, having a long delay also helps show the user that something
isn't right here so I'm somewhat loathed to change this.

Even if you do reduce the retry timings what you're still not protecting
against is the possibility of audio artefacts when SRM finally locks. You want
this to lock before the any of the audio path is up so I think we need to find
a way to resolve that rather than relying on getting lucky with a smooth
power-up.

> 
> On KBL platform we have interface to control MCLK and I2S clocks like the link
> you mentioned but WCLK seems not working on my board. I can try to ask if
> someone is working on it but since we are moving to SOF. The chance is slim for
> legacy firmware.
> 
> 
> Regards,
> Brent
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
