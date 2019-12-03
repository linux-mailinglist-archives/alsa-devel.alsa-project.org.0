Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7366711033F
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Dec 2019 18:17:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06844165E;
	Tue,  3 Dec 2019 18:16:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06844165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575393441;
	bh=c3FY9gU/srijaT7HZfqCpyz+/KW/NlVvyMDjoezkcMw=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=thYsz605NLwDGoBiE9ScCrCN5egkGxOaUuzVYt1FCGYM6fox48OuJ7fQ1U461mIN8
	 HYGJGQCJJuj4HbLiqzJ0NCIxShXHakFksAtTeTm5k1qhPCnveZDv4BAc1ATfQ7Xvu6
	 H54KaN5hrwvvJ0NG2iHuWK7RBEsVdxrNkJcj8JXA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CF3C3F8015A;
	Tue,  3 Dec 2019 18:15:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E1E03F80227; Tue,  3 Dec 2019 18:15:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com
 [195.245.230.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6FBAEF800ED
 for <alsa-devel@alsa-project.org>; Tue,  3 Dec 2019 18:15:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6FBAEF800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=dialogsemiconductor.onmicrosoft.com
 header.i=@dialogsemiconductor.onmicrosoft.com header.b="obXrp93+"
Received: from [46.226.52.104] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-5.bemta.az-a.eu-west-1.aws.symcld.net id E0/79-19910-F2896ED5;
 Tue, 03 Dec 2019 17:15:27 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrPJsWRWlGSWpSXmKPExsWSoc9roqs/41m
 swakLPBZXLh5isljT3MFkMfXhEzaLb1eArMu75rBZdO7qZ7XY8H0towO7x4bPTWweO2fdZfdY
 vOclk8emVZ1sHvveLmPzWL/lKovH501yAexRrJl5SfkVCawZDze3shec566YMfcdWwPjBs4uR
 i4ORoGlzBK3Ptxn7mLkBHKOsUicuaEDkdjMKPG79ycbiMMicIJZ4u2kVcwgjpDAVCaJtl+v2S
 CcB4wS9z7vZQPpZxOwkJh84gFYQkRgOqPE08lv2UEcZoEGJolVK04wgVQJC9hJfHjyGGyjiIC
 9xLLGb0BFHEB2tMSJdywgYRYBFYnGSZfYQWxegUSJm433mCC2zWeROPbzElgvp0CoxIY3Oxgh
 LpeV+NK4GizOLCAucevJfLBdEgICEkv2nGeGsEUlXj7+xwpRnypxsukGI0RcR+Ls9SdQtpLEv
 LlHoGxZiUvzu6FsX4kfhy6ww9Sf2viXBcK2kFjS3coCcr8E0NH/DlVChAskbp4/CdWqJnHjTQ
 fUCTISBy+tYAX5RULgJqvEs4fdzBMY9WchORvC1pFYsPsTG4StLbFs4WvmWeCwEJQ4OfMJywJ
 GllWM5klFmekZJbmJmTm6hgYGuoaGRrqGlqa6ZmZ6iVW6iXqppbrlqcUluoZ6ieXFesWVuck5
 KXp5qSWbGIFpLaXgsNMOxrdf3+odYpTkYFIS5f37+UmsEF9SfkplRmJxRnxRaU5q8SFGGQ4OJ
 QnemdOexQoJFqWmp1akZeYAUyxMWoKDR0mElx8kzVtckJhbnJkOkTrFqMsx4eXcRcxCLHn5ea
 lS4rxNIEUCIEUZpXlwI2Dp/hKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYd5QkCk8mXklcJt
 eAR3BBHTEgUqwI0oSEVJSDUz9LNv+73j5MrQ7deV21Z8t0eq3L+9+XWr8ScR9u0NqusvXK+9l
 z50I1wyK7gxcnfArmtlgHUdu3hy+UM2nnS+f3InsYFi2hyVx/2yXGQ2Or+Snlk2QU78aMu+w9
 cI7n07a6Uf9nXdOe1Np1FKmJ8eTlS5I8TlvfdC0v2J+6anFVzu2iVZGvo63dHP6q5y7YL5P8e
 tljgyf2aeyeYvn/etK4d4gYPU1KearwrvWuLN/X0bpKXKqiiWdnr5h+TNHAaOLh3Z2dDU6Xnl
 mrR6cIdqTnNlyxf4ec5J58RZtdSFzzyNpto1LNeYeLvTZveJojsHS319S/gbPW5/Z4lvNsXj9
 zEIfRabIO0ymRxhVzyuxFGckGmoxFxUnAgAslOk1cgQAAA==
X-Env-Sender: Adam.Thomson.Opensource@diasemi.com
X-Msg-Ref: server-12.tower-268.messagelabs.com!1575393326!977682!1
X-Originating-IP: [104.47.13.52]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.44.22; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13739 invoked from network); 3 Dec 2019 17:15:27 -0000
Received: from mail-he1eur04lp2052.outbound.protection.outlook.com (HELO
 EUR04-HE1-obe.outbound.protection.outlook.com) (104.47.13.52)
 by server-12.tower-268.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 3 Dec 2019 17:15:27 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qahw/2uzhrfeFXfWtnmbTraXpJ39EGyCfS0hogjnuTKsKkuYOaVBXWHj4WvOvGlvL/BvNWrkUVujlTRWmN0uYnNfOj571YM9Pg8TOSGUjThG9fZjdfbtBW4zY3lpdTZf0jzsWMmaVYFNQdxR/JPq0a2drbtmig7HtN3yZ+/YeEWRRVZk/NsqBaRt2FX6L3JXXo2ydoKStF8AExvXLL+XqqfNCU9A76fYfgSanfyW0MuGdWpnn5EA3slEbs7pTzcZpKWCRnqU+V6TVZF7PBzCMdLQHHn81gkuVvrSsRVwKdJvvEZe4+fKMw0p0isnavTkxrn/Spoyos2XUjAQJSOjKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M8tGdc/rXFvrxLFzpS7YjDcYuFmK8gSgEb/I5fCha6I=;
 b=YfAS0Np8r3KOje5LUT56+l2oVzXbExWm7lJFngS6/aiPXoYUuWsmmBeR1BWNO2uDipxRV6oXt5xJj9oTTWCIMPWstnBUjjwIHtJaF6T4Y5dsBzohQalFn0FElDLj9H+PcqZEQb780Edwt6hSQQ2NxJnda2VHkjpvvIHysxYKj+mOnAfxPOoNzSsEiaXd1bo5AyYclxbB2/NlxITxPdPGgCewBQMqICr2uPkLPNyfTWi398daLfD37EPl7KTc64Mt+MWKHZoCR95rLk4S2b8ev9JUgTLzxavOZAZNjvCITzcbtMyzCbrixGEizG4vScMOBKk29EfS+7dVeOq2A6qwUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M8tGdc/rXFvrxLFzpS7YjDcYuFmK8gSgEb/I5fCha6I=;
 b=obXrp93+fM1LYxeubRgC566fuZwObpCHD3QKOYyY0WKjP/jiljdce4WyKAtHoa/y6Wpd20sbEjLuYcrfePNScvPHMabcVYAgTUHZjqVuma6zcaWFrNHzc/vM0gA62IB1OXg0c04YzZ9xeit6ley/+E31bbiB3fxdcLTOUHxZEFE=
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM (10.169.154.136) by
 AM5PR1001MB1203.EURPRD10.PROD.OUTLOOK.COM (10.169.154.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.20; Tue, 3 Dec 2019 17:15:25 +0000
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5525:87da:ca4:e8df]) by AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5525:87da:ca4:e8df%7]) with mapi id 15.20.2495.014; Tue, 3 Dec 2019
 17:15:25 +0000
From: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To: "Lu, Brent" <brent.lu@intel.com>, Adam Thomson
 <Adam.Thomson.Opensource@diasemi.com>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>
Thread-Topic: [PATCH] ASoC: da7219: remove SRM lock check retry
Thread-Index: AQHVqaxDP6cBrmECm0aX2T25rtDQx6eoJvjggAAPtwCAAAQYEIAAP/KAgAAFyUCAAAdBgIAAHw+Q
Date: Tue, 3 Dec 2019 17:15:25 +0000
Message-ID: <AM5PR1001MB09946850D64829B34BDA89EB80420@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
References: <1575358265-17905-1-git-send-email-brent.lu@intel.com>
 <AM5PR1001MB0994EB497D3BC7D0F4C6FD9080420@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <CF33C36214C39B4496568E5578BE70C7403CA7B2@PGSMSX108.gar.corp.intel.com>
 <AM5PR1001MB09946C295B8DAD5F9C8D191080420@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <CF33C36214C39B4496568E5578BE70C7403CACC7@PGSMSX108.gar.corp.intel.com>
 <AM5PR1001MB0994921AE80726BAC59C552B80420@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <CF33C36214C39B4496568E5578BE70C7403CAFAE@PGSMSX108.gar.corp.intel.com>
In-Reply-To: <CF33C36214C39B4496568E5578BE70C7403CAFAE@PGSMSX108.gar.corp.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.225.80.228]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f0e68229-42ca-499e-6993-08d778146329
x-ms-traffictypediagnostic: AM5PR1001MB1203:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR1001MB12035FDF116B8A7B52988B16A7420@AM5PR1001MB1203.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 02408926C4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(396003)(346002)(136003)(366004)(39860400002)(199004)(189003)(7696005)(52536014)(76176011)(2501003)(11346002)(55016002)(229853002)(7736002)(66446008)(86362001)(305945005)(74316002)(2906002)(66946007)(5660300002)(6436002)(9686003)(64756008)(3846002)(66556008)(66476007)(6116002)(76116006)(25786009)(4326008)(6246003)(110136005)(33656002)(81166006)(8676002)(81156014)(186003)(478600001)(55236004)(71200400001)(446003)(8936002)(71190400001)(6506007)(53546011)(102836004)(99286004)(14444005)(256004)(26005)(316002)(14454004)(54906003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR1001MB1203;
 H:AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:0; MX:1; 
received-spf: None (protection.outlook.com: diasemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MyCQiEW0nYPtH4VKwKDqIXBUhAqZy8rRzisK4aWjcyC3+9MOCFF0ih2U0VpY173cjcfNST0+B/MoaVSH/VdVCCM2+Az4S3p7WpL6uPvA8iG0uI/7VNCqpnqKvj+W766keLNgW3V1EH/vtzPqbS/99/VDvZAVUDMvVGECyFvy0YjYGM7pSVtVjadaUZbrcv3hngJAwKbzzNrZJvnWgEzmlGff7BvPzngH9ELm1BS3ejp+B4Qhbasy8ZqU0KBM2bVqRq69C5qGnz75FAemMUKi7y5TFRwwjCbYejrSEPjv65oZF8TlGa97hTdmagZOxf6JBYLyletkrDeY6K5OpWVY6+tYPSnk16xP63bSKZ84h/88kl6utYfSPhVm5acVScHzFmYfb7nIAc+U4FhaUy2ffvpXuOkcMYR8auZr98WMQP979igGlbDnAX13U0R+Vwn6
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0e68229-42ca-499e-6993-08d778146329
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2019 17:15:25.3332 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IcpNPWgLX2IleRVSUAmIYSLh1OGBekVdfX11MYS0fpL0p7lyDVbXXh7ZEp3KKjvfz6ySXfndWH5mSgweLo1BmsY1VW0/6ebVC/Syxsfs1bA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR1001MB1203
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

On 03 December 2019 15:23, Brent Lu wrote:

> > Yes, that's right. I have put in a request with our HW team to again clarify
> > timings, but still awaiting feedback.
> >
> > The driver already warns via the kernel logs when SRM lock fails as follows:
> >
> > 	dev_warn(component->dev, "SRM failed to lock\n");
> >
> > What else do you think is needed?
> >
> 
> Hi Adam,
> 
> Let's say that the SRM locks in the second loop. The 50ms delay was applied
> but there is no kernel log message about it because the value of srm_lock is
> already true when exiting the loop. If we can print every SRM lock fail before
> msleep() call, it would be a helpful for people resolving timing issues like Cold
> latency.
> 
> do {
> 	pll_status = snd_soc_component_read32(component,
> DA7219_PLL_SRM_STS);
> 	if (pll_status & DA7219_PLL_SRM_STS_SRM_LOCK) {
> 		break;
> 	} else {
> 		++i;
> 		dev_warn(component->dev, "SRM failed to lock, retry in
> 50ms\n");
> 		msleep(50);
> 	}
> } while (i < DA7219_SRM_CHECK_RETRIES);

I have no real problem in providing debug like this, although this is probably
dev_info() rather than dev_warn(). Also I'd suggest the debug message should be
something like the following if we were to add anything here:

	dev_info(component->dev, "Waiting for SRM lock\n");

Timings can be ascertained from the kernel log (assuming timestamping is on) so
I don't think we need to explicitly state the delay information.

> 
> 
> Regards,
> Brent
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
