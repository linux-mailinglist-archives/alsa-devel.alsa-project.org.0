Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DBB9B43C6
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Sep 2019 00:09:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E7A31669;
	Tue, 17 Sep 2019 00:09:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E7A31669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568671790;
	bh=zR3uGwaU77DSPM7CwJ77R7Ugkm0suHjnr9mZwrvK3Ho=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ajiAlCIQ04ScYiDFQq9RYqP2HFflH78FU1BuRJU/hhNxeawKppZm2N7RR41wkKAZC
	 d90SI2+L5jsbApMcRGLcQJGZ038qvi4cjSUAAfQe6roRUHlwdNYo247Kqkmq2ObHQT
	 ACR98lDlYoIgAphU7rkrY49X9OgMjVQoZBbhAwNk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C0E5FF80506;
	Tue, 17 Sep 2019 00:08:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5766AF80506; Tue, 17 Sep 2019 00:08:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FORGED_HOTMAIL_RCVD2,FREEMAIL_FROM,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-oln040092006046.outbound.protection.outlook.com [40.92.6.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 982D1F80148
 for <alsa-devel@alsa-project.org>; Tue, 17 Sep 2019 00:07:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 982D1F80148
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com
 header.b="OHv2QGvP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gqp0ZTLc7+0RiZPsZtg+d+pQ6ueEuE9aj78e/tjRLNdVQzlHK4aaTt1GNFo9oa0aQFs2Wgl1OjVXN3H7wBaCCI1rRy+pZYLU0I1y+2cjUAEtlAuvBFdo667L+r+9TynQoPAMcpTWjAPq44bTAScsfQxux1rAY7V8C2WWJXgaX/+CH+BdXmTBpIYmouE3ClrwvATaanwR2iUrA5AIkmOxRUrXc6M3oofKRW84Xi+pr/jYPXgHNv8wVLwksvBo/FA9D1XWQ53FObM7aOz4yH+63B/p91/VizYlxQ9lmvdvUDl/T/WrtDxi78kfwi1/fawAFueP7Z/Y1CutzRJlrxbXCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rniF7pdvw87e8exeMTo7SH7nkuW6b8l8+zjnqfF4nzE=;
 b=V2PL0x6V0l2yVJqXp+3eGkNc8YK141PlGz4meeKj+INQ0TkT9cxPH/DF7/AO9pizjqvBT4T2unVHe0xEr3Taf5PIH1VKFswZuA9RxMcujj9vawdxXGVlmexDIkYEUCLe5gDiUyWbibikLiFyCTcO0lToI/nJ1tNKWmbXITzkhcwB76Vm5+c1L2HnLF0VzQppFMU6pUtBD5lbDsBT2Ma8bBGOEsB9PFhWnZMECttTuuqt2BGConFI1nZUNr0GlRR2KQ7ThygzrjW6YllAddDSqWbhPb0ymBBHo7RLi8YnJgukW8gO1Cr7Zsb9+DZH6Y6BMDUK6Hhh4AfpLlMfq3wjdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rniF7pdvw87e8exeMTo7SH7nkuW6b8l8+zjnqfF4nzE=;
 b=OHv2QGvP0hpjPnouAPngyaFUxxu0hwvj/HjXhTXvzcrI+2dyWdoGk6UTRRzvp215aYW48AbEAott+SI88brB4OVLFqCeY/3gnQCUwAoSZ+P80PaSGU3sYdegOqJkVfo66NJT3BtknmSL0rqOWv8PYtHrB4oA19YbVGVHhyavpdcxKwYaQ866HQtz9HkMYom7mn/O2AGYb36ws2iq41woGEWg49C90NL4sYfrk8JqNMH0d4fZT3eC6nsh3hy3in4k7K6IXTFV5gnHGrE78LUtcT7S/RI0sUcxss9YiPJUF6CnbSOHPMMlo96JtOfExolMnMSDKmqAM29Di5fPXe6Vsw==
Received: from CO1NAM03FT050.eop-NAM03.prod.protection.outlook.com
 (10.152.80.52) by CO1NAM03HT222.eop-NAM03.prod.protection.outlook.com
 (10.152.80.204) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2263.14; Mon, 16 Sep
 2019 22:07:56 +0000
Received: from QB1PR01MB2337.CANPRD01.PROD.OUTLOOK.COM (10.152.80.58) by
 CO1NAM03FT050.mail.protection.outlook.com (10.152.81.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2263.14 via Frontend Transport; Mon, 16 Sep 2019 22:07:56 +0000
Received: from QB1PR01MB2337.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::15a9:a7c5:2cec:57e5]) by QB1PR01MB2337.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::15a9:a7c5:2cec:57e5%7]) with mapi id 15.20.2263.023; Mon, 16 Sep 2019
 22:07:56 +0000
From: James McDonnell <james_mcdonnell@hotmail.com>
To: Takashi Iwai <tiwai@suse.de>
Thread-Topic: [PATCH] ALSA: hda/realtek - Fix alienware headset mic
Thread-Index: AQHVbJ6G2Vunf/hRFEKA0G1tEh8Vvacu2FUA///SfAA=
Date: Mon, 16 Sep 2019 22:07:56 +0000
Message-ID: <QB1PR01MB2337BA2543740D9C07585D4E808C0@QB1PR01MB2337.CANPRD01.PROD.OUTLOOK.COM>
References: <QB1PR01MB2337D0367C2E3ADB0010134F808C0@QB1PR01MB2337.CANPRD01.PROD.OUTLOOK.COM>
 <s5hftkvykp9.wl-tiwai@suse.de>
In-Reply-To: <s5hftkvykp9.wl-tiwai@suse.de>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MW2PR2101CA0019.namprd21.prod.outlook.com
 (2603:10b6:302:1::32) To QB1PR01MB2337.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:3c::26)
x-incomingtopheadermarker: OriginalChecksum:631AE522AFEE436F5FF4E6AA2506BA3AAEB6D81857DBB75773A8F4734C7B039F;
 UpperCasedChecksum:0A499EE8775823F6100BE8A1619236723F237D069958C82BEB4E5C5DCC3764CA;
 SizeAsReceived:7469; Count:49
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [dT6abXy2bkM+Nsevu+l1Man/aYhJOJSt]
x-microsoft-original-message-id: <20190916190748.GA5126@manjaro.telus>
x-ms-publictraffictype: Email
x-incomingheadercount: 49
x-eopattributedmessage: 0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(5050001)(7020095)(20181119158)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031322404)(2017031323274)(2017031324274)(1601125500)(1603101475)(1701031045);
 SRVR:CO1NAM03HT222; 
x-ms-traffictypediagnostic: CO1NAM03HT222:
x-microsoft-antispam-message-info: oVthitGrU/nMw6K9yvjvpmVksToJcJo9LObobTEOS/dxIAk1fpzsuBPbemu05FJmEdcFwXEA8PDwHpr1xbqtCVcLkc0rJervP+gY4lfl8JMcdpFJfbLKFeYB+0kWab38gfzAbxsWAmKQ5KjtJwZmGZ9Xxn2rjpgJL3YZ0dpto2gFI+yWLHbr1sPglzZFBTWi
x-ms-exchange-transport-forked: True
Content-ID: <987F9B221CD6224BB7B63005D6D662A8@CANPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a87c135-422f-4c9a-c108-08d73af253e7
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2019 22:07:56.4036 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1NAM03HT222
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [PATCH] ALSA: hda/realtek - Fix alienware headset
	mic
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

On Mon, Sep 16, 2019 at 11:50:42PM +0200, Takashi Iwai wrote:
> On Mon, 16 Sep 2019 16:53:38 +0200,
> James McDonnell wrote:
> > @@ -7680,6 +7690,11 @@ static const struct snd_hda_pin_quirk alc269_pin_fixup_tbl[] = {
> >  		{0x17, 0x90170110},
> >  		{0x1a, 0x03011020},
> >  		{0x21, 0x03211030}),
> > +	SND_HDA_PIN_QUIRK(0x10ec0298, 0x1028, "Dell", ALC298_FIXUP_ALIENWARE_MIC_NO_PRESENCE,
> > +		{0x12, 0xb7a60140},
> > +		{0x17, 0x90170110},
> > +		{0x1a, 0x03a11030},
> > +		{0x21, 0x03211020}),
> 
> It's a slightly uncertain whether this is 100% safe to apply via the
> pin-quirk table, but also there is no big other reason to push back,
> so I applied it now.

I've been running with this patched to my kernel for a while now.
Any particular things I should do to test?

Some background on how I got to this patch was I couldn't get the mic
to work with a TRRS pinout headset. I discovered that if I set modprobe
options for laptop-amic and dell-headset-multi in a particular order
the mic would start working. I worked backwards to find this
solution.

> 
> 
> Thanks!
> 
> Takashi

Cheers,
James
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
