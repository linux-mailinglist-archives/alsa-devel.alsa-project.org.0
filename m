Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 002FA10AEC5
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Nov 2019 12:34:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 80E6F16FD;
	Wed, 27 Nov 2019 12:33:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 80E6F16FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574854487;
	bh=1rQHUyGPSKugMmn1ifsWYh39vZryPIXpj1HYLZ9Y/vM=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lvOVMX9Df8DT3OwC/uIUwDvKVecJmOlImUskU1gTua4zfp3qHnhKWggnKt1cMQGw4
	 eUZnZMqQCtrep1NufahO1U/DW6IQl7N70nuiIQ5fMuZ6h8FytlfXf0MBh/q1sbpPa3
	 jJoNeTvjcp7WEoNkdPgmlRRTLtass1JoaDRDT13A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 250B0F8013B;
	Wed, 27 Nov 2019 12:33:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5B37FF8014D; Wed, 27 Nov 2019 12:33:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.116])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 553EAF800CE
 for <alsa-devel@alsa-project.org>; Wed, 27 Nov 2019 12:32:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 553EAF800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=dialogsemiconductor.onmicrosoft.com
 header.i=@dialogsemiconductor.onmicrosoft.com header.b="we1Y6G7v"
Received: from [85.158.142.201] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-5.bemta.az-b.eu-central-1.aws.symcld.net id CF/72-19907-8EE5EDD5;
 Wed, 27 Nov 2019 11:32:56 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrCJsWRWlGSWpSXmKPExsWSoc9gpPsi7l6
 swfk/ShZXLh5ispj68AmbxeZzPawW3650MFlc3jWHzaJzVz+rxd3XfhYbvq9ldODw2PC5ic1j
 x90ljB47Z91l99i0qpPNY9/bZWwe67dcZfH4vEkugD2KNTMvKb8igTVj1vc7zAVnxSo2TlzA1
 sC4XKiLkYuDUWAps0TfnInMEM4xFonVM/uhnM2MEr97f7KBOCwCJ5glZv7/zQjiCAlMY5JYfX
 U6M4TzkFHi19wjQBlODjYBC4nJJx6wgdgiAhESHfcug7UzCzQxS7xftRSsSFjAWWJ2fxszRJG
 LxKHNTVAN4RIbv7WDxVkEVCUeXZgJFucVSJR4d72bFWLbGWaJjasmgyU4BYwkvvU1sYLYjAKy
 El8aV4M1MwuIS9x6Mp8JxJYQEJBYsuc8M4QtKvHy8T+o+lSJk003GCHiOhJnrz+BspUk5kF9I
 wE089L8bijbV+LC758sMPVbjs2HiltILOluBYpzANkqEv8OVUKECyT2N3xjg7DVJG686YA6QU
 ai/WsnlH2bVWL297IJjPqzkFwNYetILNj9iQ3C1pZYtvA18yxwUAhKnJz5hGUBI8sqRoukosz
 0jJLcxMwcXUMDA11DQ2NdE11jA73EKt0kvdRS3eTUvJKiRKCkXmJ5sV5xZW5yTopeXmrJJkZg
 gkspZJHbwTjp21u9Q4ySHExKorx+XvdihfiS8lMqMxKLM+KLSnNSiw8xynBwKEnwyscC5QSLU
 tNTK9Iyc4DJFiYtwcGjJML7HiTNW1yQmFucmQ6ROsWoyzHh5dxFzEIsefl5qVLivOuAqVtIAK
 QoozQPbgQs8V9ilJUS5mVkYGAQ4ilILcrNLEGVf8UozsGoJMy7GWQKT2ZeCdymV0BHMAEdwTT
 zFsgRJYkIKakGpoaAkIs9JXX77Se8PHlAOrjyhTHDkof3qw+Gveeymn98H/u1p7azvpz5Z8Qv
 amIeLbmtcVMZs8KbqnZe1Qb5t9lp6v9OaUb/EuKvPbCwwFhnd9+ypZ0+uTOmTXq0JGPpStcvm
 3Zn5TkevtFo/knO/ejm2MavF6JN/G4v8mdv3COWbrHtp9pSmStS93o+7ujs6l3+cx7jvA12Ab
 td9HOL65fPkNRdarn7sXWWvXSrXfrcS7NfGU1Z8/xv3fP/r/vZDfOuvZ3U+vOCh8hUjc99mYK
 nl/w/mW8rETCnIq+0cp9TPd+C4mkPTrr23/15p/P/Aw6bWNO6Bzv26bVvUTc1zxfOfJi9YcbL
 nB2ODcFr65RYijMSDbWYi4oTAVbXfBl3BAAA
X-Env-Sender: Adam.Thomson.Opensource@diasemi.com
X-Msg-Ref: server-24.tower-246.messagelabs.com!1574854375!471260!1
X-Originating-IP: [104.47.0.50]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.44.22; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29109 invoked from network); 27 Nov 2019 11:32:56 -0000
Received: from mail-he1eur01lp2050.outbound.protection.outlook.com (HELO
 EUR01-HE1-obe.outbound.protection.outlook.com) (104.47.0.50)
 by server-24.tower-246.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Nov 2019 11:32:56 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mPU/zu7anjvvRigIVnXoI9MseCc62ZT2VJwPnAgShkhm9yMD2S4gM4qqMFXwJDELf6lrbRMLu5uQziKRb86XoC9jOy/a9Lky0H/BdiaWHpUztIeLF8YzRokWU475qXZKr5HWvj+SqmhFHnVwtUhc3mZIcNy0uxHagO/ndoi7BAeZRKneIizK4EakYjJzzAJiGJnsQAj/FyBM3Dkx7vlCIvd4y6rMgxKB2rg1RfUrU/rCDtkgVOy49G7JMBPZodoVEYevcDlgVbSI5KRsPerXXKRYDnKjQ8v7NAKHL45qCLST1bXKE/iNYaXh9oxfQgwC8qLEZSl7dtaUC6rnXg5zZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tx2hcpfJVjWHulvkEPPsM+H8fYSVJC342hIC/bZ6X9w=;
 b=K/SoGZ2FGYQEbmOtk8C139BXG0Jl098LXNNT8wAD8H7FYJuJ1wCLq/tgxltvkWG3AIPLJ3/rdJdKefxreEqhm7tSbzaG8gjI+QljwB1wkj16ue0FzOjacSOiErnEbHtfIbSrzgpzJDR5Wf+S6jVnnBohoBjJVOAecVgsq24rTqtoylWMG2lzavEG5L/TrOdSQju+c0Ty0snQafjw8ut1CwXL1VeDFcWe79nW4nhG9ylI+3WxeYNu6cXuQDlC29vip4+MYt0x9NfpWBky1n/OgcwtimMNYGy/Wswnw1uya1IyhneCFLUZ2p0MTs3PG4lctp5TMZkWXTeNQ4AqM2INdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tx2hcpfJVjWHulvkEPPsM+H8fYSVJC342hIC/bZ6X9w=;
 b=we1Y6G7vetIA022Qb1lSBr2HLzf/VKI7kOC4fZV7VPyMgyHRY2c1yIJZyndhDi6urIEQAHkbBHvq3c8JTW3a1lBtcHUKUd1lwj5PP/YTpyDFuQUCijg+GIah/N+XIN74lH/64HA7SWViFmx7LNCoGCNOmEkTC4YGtZvBgDd+zhA=
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM (10.169.154.136) by
 AM5PR1001MB1121.EURPRD10.PROD.OUTLOOK.COM (10.169.154.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.19; Wed, 27 Nov 2019 11:32:54 +0000
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5525:87da:ca4:e8df]) by AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5525:87da:ca4:e8df%7]) with mapi id 15.20.2474.023; Wed, 27 Nov 2019
 11:32:54 +0000
From: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To: Mark Brown <broonie@kernel.org>, Adam Thomson
 <Adam.Thomson.Opensource@diasemi.com>
Thread-Topic: [PATCHv2 6/6] ASoC: da7213: Add default clock handling
Thread-Index: AQHVn7aXMyQuMXvm70+jyJLut64noaeWIihwgAeSgICAAAQ4gIAACJ3wgAADHgCAARqUMA==
Date: Wed, 27 Nov 2019 11:32:54 +0000
Message-ID: <AM5PR1001MB09940CF764711F1F13A6B37E80440@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
References: <20191120152406.2744-1-sebastian.reichel@collabora.com>
 <20191120152406.2744-7-sebastian.reichel@collabora.com>
 <AM5PR1001MB0994720A0D615339A978E35C804E0@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <AM5PR1001MB0994E628439F021F97B872D480450@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <20191126170841.GC4205@sirena.org.uk>
 <AM5PR1001MB09949D557742E8817545637F80450@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <20191126175040.GD4205@sirena.org.uk>
In-Reply-To: <20191126175040.GD4205@sirena.org.uk>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.225.80.228]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 205f5c81-623d-41ad-78b4-08d7732d8b65
x-ms-traffictypediagnostic: AM5PR1001MB1121:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR1001MB11213FC510B010BFA3E4072FA7440@AM5PR1001MB1121.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 023495660C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(136003)(39860400002)(396003)(346002)(366004)(199004)(189003)(76116006)(6436002)(52536014)(76176011)(71190400001)(25786009)(2906002)(66946007)(8936002)(561944003)(66476007)(229853002)(55016002)(9686003)(8676002)(71200400001)(4326008)(81166006)(81156014)(33656002)(3846002)(6116002)(55236004)(102836004)(7736002)(7696005)(316002)(26005)(11346002)(5660300002)(54906003)(66066001)(6246003)(256004)(110136005)(66556008)(14454004)(305945005)(478600001)(74316002)(446003)(186003)(64756008)(66446008)(99286004)(6506007)(53546011)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR1001MB1121;
 H:AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:0; MX:1; 
received-spf: None (protection.outlook.com: diasemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6AflO4P05V98+QydAbvR3MYDV5dueQwTKINHOABSS6tVWxeapLY5F1KzS3MsK237icyoz8GvcXlwvlwPUGMOHWQyg6sHUjH3Er2vWyNN+j4NO4nNSY2rj0paQsjm5GacGnMfls8wQsCIHnqMtOFidJFULkRzitcy1ZB4s0qRQdrTjpT2/pCRbugUMxNFny9Bf0JdrkLx95v12JQG2HEoY0WhpUhjdokybVcZqRNr5pmFmOlSo4e73YxehnCB8lqEWexPOS+jc0hAXNALtOR6xnqqfBaoqH3qL6/NE2M5sYyiL6N2HK6IeverxYog18CE1MgjCZib3acxbArwDVHLsYeWyMvBbcdW/EQSObi50I6RbtydmMGb+kKUmS8U7vZ9PhtqMVSJb7ezrS8oZWCxmwK47eg1gEBMDZ72sv9CCpdaoGeQvuLjkktrlJraZBhq
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 205f5c81-623d-41ad-78b4-08d7732d8b65
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2019 11:32:54.4070 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V+V5RceZJB1yBV7l32XgOY7m9JEE+rV0Vejfn6c1bOIohAxMdRBAkGD3PB1hcsvVOm2cV45kK7nIeUVtqYlJaYoFfUumeJXO3JnlceAuL3s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR1001MB1121
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "kernel@collabora.com" <kernel@collabora.com>,
 Support Opensource <Support.Opensource@diasemi.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [alsa-devel] [PATCHv2 6/6] ASoC: da7213: Add default clock
	handling
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

On 26 November 2019 17:51, Mark Brown wrote:

> On Tue, Nov 26, 2019 at 05:39:45PM +0000, Adam Thomson wrote:
> > On 26 November 2019 17:09, Mark Brown wrote:
>
> > > If we're special casing simple-card we're doing it wrong - there's
> > > nothing stopping any other machine driver behaving in the same way.
>
> > Ok, what's being proposed here is for the codec to automatically control the PLL
> > rather than leaving it to the machine driver as is the case right now. In the
> > possible scenario where this is done using a card level widget to enable/disable
>
> Wasn't the proposal to add a new mode where the machine driver *could*
> choose to delgate PLL selection to the CODEC driver rather than do so
> unconditionally?

Yes, but by default the assumption is the codec will do things automatically
until the machine driver calls the relevant PLL config code.....

>
> > the PLL we will conflict with that using the current suggested approach for the
> > da7213 driver, albeit with no real consequence other than configuring the PLL
> > twice the first time a stream is started. It's a case of how to determine who's
> > in control of the PLL here; machine driver or codec?
>
> The patch looked like the idea was that as soon as the machine driver
> configures the PLL the CODEC driver will stop touching it which looked
> like a reasonable way of doing it, you could also do it with an explicit
> SYSCLK value (which would have to be 0 for generic machine drivers to
> pick it up) but this works just as well and may even be better.  Perhaps
> I misread it though.

...so yes you're right in your comment here. However the bias_level code is
called prior to the DAPM paths being sequenced. If a dedicated machine driver
were to want to control the PLL via a DAPM widget at the card level (which is
done for other codecs for example on Intel platforms), the code in the
bias_level() function of the codec to auto configure the PLL would always be
called the very first time a path is enabled before the relevant DAPM widget for
the card is called, so you'd have two configurations of the PLL in succession. I
don't expect that would cause issues, but it's not ideal. The other approach
would be to have something in the machine driver like a dai_link init function
to default the PLL config using the codec's PLL function which then prevents
any chance of auto configuration subsequently. However that requires the person
implementing the machine driver to know about this behaviour.

As I said it's a small thing and requires a specific use-case to occur, but
having the PLL configured twice for the very first stream in that scenario
seems messy. Regarding the SYSCLK approach you mention, I'm not clear how that
would work so I'm obviously missing something. If we had some init stage
indication though that auto PLL was required then we're golden.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
