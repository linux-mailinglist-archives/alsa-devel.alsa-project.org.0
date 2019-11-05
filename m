Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BEED3EF411
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Nov 2019 04:27:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E52511710;
	Tue,  5 Nov 2019 04:26:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E52511710
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572924470;
	bh=bd7DqONiYjQa1WHNKX23lAUo/eZdE5Bxhggov4bdaWY=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qQUoOtgicDL3aRDgn38nLwCpuoRv9oqQvc2edowdErzKwZaCs0t/E8VW/ryFYtilG
	 9RdHSRKf8bPDS4gjecwK9gKJDFDWwuIrgHF3ehWeF4vlB2RCZa7x0jv5YbHZ9rg6DI
	 wiHotDhg9ilK8svlFP3ILDZfDS8SRScmu6++Ruxo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B43BF8053B;
	Tue,  5 Nov 2019 04:26:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F717F8049B; Tue,  5 Nov 2019 04:26:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150049.outbound.protection.outlook.com [40.107.15.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3DE95F8015B
 for <alsa-devel@alsa-project.org>; Tue,  5 Nov 2019 04:25:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3DE95F8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="cgafbbDR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EvZf6bGYw6ulHvs8p1WfHyPRsGcmNGh2D7oq6omOGAy6Hsyv/omEJd09ir7zZY6oJ9W8VgioxNVqrYU9sFnosDco5IQsvqK58N3ovYhScwQMs7c6LKeGt22803lQHafqsWAlJkcMtTTMR2EkoTJMg1icwQrcXdftOq2Mu3znZloJpMdL7TWS4o+E6HsqDujKLIhZuKVpozISstI05GykPehVeY6xr66hb4oHFB/gQ2kfNVmBpDk6wvWDHN8eIv86urEIFinfP0/orUfm/hv5TZZZBAQWi7W1kXctowuOnpSUX58TXS5fktxeQjcg96t1RmNHOY18F6c3a13619+cBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1cE/9ZX6doIXfJknt8eLoV2lxEYLAvKzrh6gsZ4vS5U=;
 b=OxC7VqNaI0a/gIZAldQBMredHNMwa8VxMH6pijcJK2qIPUi46m1hYc8OBLQ4hoicD5u/a+WfthG9XkTdJ/1hvpirm13YJeQ4b3+KPT1uYv7bIWmCoo2hMeIvNt6Fnw8FSvh8xN/R52S7fsEA2gX6CwnWLErDBF5RUxYvRFm4f7kJSeAfQL9kaijYjKYBS8Rar5VWtReJAy6CYOrJsVxgs+BfIh0z4R2ZFx5H/GvX7Gh1PV8+eTyLgNdksfZ1JGdMC0Vmc9HG5b4n3pmC+r5QwR02PPDyH48zmqBtQInYluouz7U0Q4UhxLq0b+2Qamvizqw2uJbpPopxvmDUqUE5Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1cE/9ZX6doIXfJknt8eLoV2lxEYLAvKzrh6gsZ4vS5U=;
 b=cgafbbDR/1+IP/ocBL7OmGwsJAWTt0X3p8HhFCvJ+OLCquFfoCDS7e1kvEhVBBybXV9iGOZsuuACyG57i/Cm7xtG88Lkt0hyicEXyY0WWhgWfTlwEFZL0oOSfDkEt+fAF1MpbYmN5IY+oUdtZF4yCrhoPqLMOLNpAakHmmB4Ktg=
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com (20.179.232.225) by
 VE1PR04MB6656.eurprd04.prod.outlook.com (20.179.235.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2408.24; Tue, 5 Nov 2019 03:25:56 +0000
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::9c38:e113:f0b4:f9]) by VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::9c38:e113:f0b4:f9%7]) with mapi id 15.20.2408.024; Tue, 5 Nov 2019
 03:25:56 +0000
From: "S.j. Wang" <shengjiu.wang@nxp.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Thread-Topic: [PATCH] ASoC: wm8524: Add support S32_LE
Thread-Index: AdWTh/O/b1+PZUkZSV2ZVOBuQ71qsg==
Date: Tue, 5 Nov 2019 03:25:55 +0000
Message-ID: <VE1PR04MB64790EF282B41CB04EA6707DE37E0@VE1PR04MB6479.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shengjiu.wang@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: bf241ae6-5e7c-45f2-dd23-08d7619fdec4
x-ms-traffictypediagnostic: VE1PR04MB6656:
x-microsoft-antispam-prvs: <VE1PR04MB66560503D3D814CB286AB995E37E0@VE1PR04MB6656.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1388;
x-forefront-prvs: 0212BDE3BE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(39860400002)(346002)(376002)(396003)(189003)(199004)(81166006)(66066001)(2906002)(26005)(6436002)(478600001)(7696005)(6916009)(102836004)(55016002)(316002)(54906003)(14454004)(229853002)(71190400001)(71200400001)(6246003)(52536014)(8676002)(256004)(5660300002)(486006)(305945005)(81156014)(6506007)(7416002)(3846002)(186003)(25786009)(86362001)(7736002)(74316002)(8936002)(9686003)(64756008)(76116006)(476003)(66476007)(66556008)(33656002)(66446008)(6116002)(99286004)(66946007)(14444005)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR04MB6656;
 H:VE1PR04MB6479.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9RswhFnNOYcIKjBMlpB+E/XCKq+ykOvt7Qbze/Q49PTTe1JJunrSfpq2pjYNjwseKMseBWcdIuNZEvouGedRdvUAAvdu3aA8rNulUZ4IOoqLgS1DOUinEYjD+/e6+05PEGFEQ0nwI5nw5+Xb6rknS8s2uEGUnLrmjqqTjHyiAsenW5aUYuiFHhLAz5tFMH2bvT6k8KuY029jRSOn5Sm+fzOTGCpPmme3ZpfK0v7UxPXW0Bi9/YWT2AFbUAl0wKUuCV/Txe+h8j1yoljG8Jwq+NzjlGgulPv+hYHf5uC08DZuBbweJ3Fx3rmZhXId8IHyhRIO3Kjf234W42szurwCad4uRujUvcIq1Vq4F278Q620Xwewd4vBq2FFPiCj/tEW5to7gKrQYWan0+DVdRW7mauXARi3N3xw00tQuLVHwJLsQtIoGvK6t4mkpNo79BNz
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf241ae6-5e7c-45f2-dd23-08d7619fdec4
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2019 03:25:55.9893 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fneqdZ5AeIGwTzCz+f43f4oPX+YFQX/u2SPHYzgIhnZ94IwlHURtmY9UxQ6MtheEjD5IC+Y5IPlIAZYFRd83WA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6656
Cc: "kstewart@linuxfoundation.org" <kstewart@linuxfoundation.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>,
 "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "tglx@linutronix.de" <tglx@linutronix.de>, "info@metux.net" <info@metux.net>,
 "allison@lohutok.net" <allison@lohutok.net>
Subject: Re: [alsa-devel] [PATCH] ASoC: wm8524: Add support S32_LE
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

Hi

> On Fri, Nov 01, 2019 at 06:34:54AM +0000, S.j. Wang wrote:
> > Allow 32bit sample with this codec.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  sound/soc/codecs/wm8524.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/sound/soc/codecs/wm8524.c b/sound/soc/codecs/wm8524.c
> > index 91e3d1570c45..4e9ab542f648 100644
> > --- a/sound/soc/codecs/wm8524.c
> > +++ b/sound/soc/codecs/wm8524.c
> > @@ -159,7 +159,9 @@ static int wm8524_mute_stream(struct
> snd_soc_dai
> > *dai, int mute, int stream)
> >
> >  #define WM8524_RATES SNDRV_PCM_RATE_8000_192000
> >
> > -#define WM8524_FORMATS (SNDRV_PCM_FMTBIT_S16_LE |
> > SNDRV_PCM_FMTBIT_S24_LE)
> > +#define WM8524_FORMATS (SNDRV_PCM_FMTBIT_S16_LE |\
> > +                     SNDRV_PCM_FMTBIT_S24_LE |\
> > +                     SNDRV_PCM_FMTBIT_S32_LE)
> >
> 
> The device doesn't actually support 32bit though, I guess it will ignore the
> extra LSBs so it should work. But is that really supporting 32 bit?
> 
I also think it may ignore the extra LSBs just as you said, but don't really
Support 32bit.  This change is to make driver accept S32_LE format.

Best regards
Wang shengjiu

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
