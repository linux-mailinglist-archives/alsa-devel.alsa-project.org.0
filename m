Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5A4F95E1
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Nov 2019 17:43:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 226F2166A;
	Tue, 12 Nov 2019 17:42:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 226F2166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573577020;
	bh=amfz2FuROB6ho/hgZHJQWIrbaFz8B5F61wo77F4H/wA=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WuULCi6LvHyfvIsRAB0eReyjIZmVgh/OpdqkAiHJo2SH5go9R0gx38LGghwbEndYt
	 DU0h8FCMZ/m0g39OUrqWDfYKhg8tKL9pMhQRMOyU/OUn0nK/hFW/0JqrGhGHukLS8e
	 XJmq2jCBnmHSismR5aTUY5j8Qcmv7jKYr5VwiOSc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 68F90F8044C;
	Tue, 12 Nov 2019 17:41:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A76DF80483; Tue, 12 Nov 2019 17:41:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from nat-hk.nvidia.com (nat-hk.nvidia.com [203.18.50.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0474AF802E0
 for <alsa-devel@alsa-project.org>; Tue, 12 Nov 2019 17:41:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0474AF802E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="ZkoDdEbn"
Received: from hkpgpgate101.nvidia.com (Not Verified[10.18.92.9]) by
 nat-hk.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dcae0c90000>; Wed, 13 Nov 2019 00:41:46 +0800
Received: from HKMAIL101.nvidia.com ([10.18.16.10])
 by hkpgpgate101.nvidia.com (PGP Universal service);
 Tue, 12 Nov 2019 08:41:46 -0800
X-PGP-Universal: processed;
 by hkpgpgate101.nvidia.com on Tue, 12 Nov 2019 08:41:46 -0800
Received: from HKMAIL101.nvidia.com (10.18.16.10) by HKMAIL101.nvidia.com
 (10.18.16.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 12 Nov
 2019 16:41:45 +0000
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (104.47.49.50) by
 HKMAIL101.nvidia.com (10.18.16.10) with Microsoft SMTP Server (TLS)
 id
 15.0.1473.3 via Frontend Transport; Tue, 12 Nov 2019 16:41:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZnYN0GUINQnaEcKfijC3kSStHXiYRk4dP2xa0CjCOnnqOvTRX3dHXy+OQrCGpfgZpwVo3eGcuTgkeKcGb/JPBH3xg95/89gPZeMjzz2WPi9YI7QFiqygcWB+fRC0p4E1/ikthm20KC+16Y1uxmg9JWZFajI5a64ydyv9wcHsmwmej1YT+NNLAtO21vttHPP1wqx8r008N5B2WMBLXRqGlSyv775KGzOMXbdbdC8n7RPdD6D+zOnOrOsvxMIj4WxOPFn6SjJ2hjGa1b9UKlmcV4onORFbA2idZHyFteSqFUp+k30tfHjdtZF9IwfaH4wPs24xsnNTSomzj5F1eSp6kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jh+SZoFTf+k9Z4+jVn7Q5BXJM6Qgd/skb+oxPwWk5sc=;
 b=lBQyig7bA1eg4NZlqIa5vR9ddz7myzJNSX0tCDjKj0t4U0iBFU9TW9/b16T6Wlsqw45i9ZUU7gxtatrgBRJlg0E+62Mzb0R2ItHoRf25r176wMGmGtZmQRmzFmXBb5KP8KDTmXKqXWEOoCqH8iy45n3fOrtEm9e6qVnsQbKPqAmIMCTaBlKwk367JvaZLDQvTXXan7X/HR4hjhtAJOhfnZsS5KCIaWiDwUlGQJ+vGWriZDx6wxVhs8ghUjUNri1nzaGeWuy9JckHY++1npap0uzitOcvuxE6NtFRFKpZnyTfEocpJRvKm1Fw2Tz9BIc65FrGHSAjd7ogq+eUZdslCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from MN2PR12MB3389.namprd12.prod.outlook.com (20.178.242.161) by
 MN2PR12MB3294.namprd12.prod.outlook.com (20.179.81.208) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.25; Tue, 12 Nov 2019 16:41:43 +0000
Received: from MN2PR12MB3389.namprd12.prod.outlook.com
 ([fe80::457a:dc11:397f:d4ce]) by MN2PR12MB3389.namprd12.prod.outlook.com
 ([fe80::457a:dc11:397f:d4ce%7]) with mapi id 15.20.2430.027; Tue, 12 Nov 2019
 16:41:43 +0000
From: Henry Lin <henryl@nvidia.com>
To: Takashi Iwai <tiwai@suse.de>
Thread-Topic: [PATCH] usb-audio: not submit urb for stopped endpoint
Thread-Index: AQHVmSWhBIS3uSZfiEG540j5JX9w96eHJDUAgACGuveAAA5KgIAAAjtg
Date: Tue, 12 Nov 2019 16:41:42 +0000
Message-ID: <MN2PR12MB33899EA399AF4338AA882F1DAC770@MN2PR12MB3389.namprd12.prod.outlook.com>
References: <20191112065108.7766-1-henryl@nvidia.com>,
 <s5hzhh1njti.wl-tiwai@suse.de>
In-Reply-To: <s5hzhh1njti.wl-tiwai@suse.de>
Accept-Language: en-US, zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=henryl@nvidia.com; 
x-originating-ip: [59.124.78.18]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8225c756-7f94-4443-f4fc-08d7678f3319
x-ms-traffictypediagnostic: MN2PR12MB3294:
x-microsoft-antispam-prvs: <MN2PR12MB3294C45E448EC9FEA1FA19B2AC770@MN2PR12MB3294.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1247;
x-forefront-prvs: 021975AE46
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(366004)(39860400002)(136003)(396003)(189003)(199004)(4744005)(71200400001)(99286004)(186003)(14444005)(229853002)(8676002)(486006)(8936002)(6436002)(11346002)(86362001)(71190400001)(476003)(478600001)(446003)(81156014)(81166006)(7696005)(256004)(6916009)(52536014)(74316002)(33656002)(54906003)(5660300002)(26005)(316002)(76176011)(6506007)(102836004)(2906002)(66556008)(7736002)(305945005)(6116002)(3846002)(14454004)(6246003)(64756008)(76116006)(25786009)(66476007)(9686003)(91956017)(66946007)(66446008)(55016002)(4326008)(66066001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3294;
 H:MN2PR12MB3389.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nvidia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WMFRb/8W+vXKdWZ7HFa9MdcQuNpFNzvf5zcJufRbIa21aJPFpytIO6dYjbLoCJ4w2kty+tkjRSS+LAx4PQR3vkac6cgmm4OiDBKQeam3Cswlga0bcNgSH46G5ZZAB27ODTCIiWK6uzFg3LX4cJFUc0gr/WMwj0vvPS+bpyNGrsaJTQesH0BB3kJBJ+zZHkOwuAunN8e2noMIXaQd8JcWiqXGAu7Vfp5YpRr9tZWn8T8zlPcnd3k2uMr92ZcKpIFLCUOQEJeD468MG3T3sSNHEeg/eAx7tLm2XkBh/70kTgvPGpQBrPEeI2JlX5H3wmIGBxvoOURZ9BtkR/ZzmNN4BJdBou4ioUh0iZTcjJqqevluSGpxMt8VVbAF4xXxvkyfzaq1F7+alGVhB+hxE5hUCHcVNmKGijJagDoMFFVCu/0mQeboyaWdNrDrc6zQlcdd
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 8225c756-7f94-4443-f4fc-08d7678f3319
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2019 16:41:43.0158 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gzKKXLnKej218YczdyIVEY1WwvzF0emTDIMIJKJnHG0PqfmjCmD6LMxqAI0ob3WXXXGbBbTsPObgRdry5m4Sgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3294
X-OriginatorOrg: Nvidia.com
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1573576906; bh=jh+SZoFTf+k9Z4+jVn7Q5BXJM6Qgd/skb+oxPwWk5sc=;
 h=X-PGP-Universal:ARC-Seal:ARC-Message-Signature:
 ARC-Authentication-Results:From:To:CC:Subject:Thread-Topic:
 Thread-Index:Date:Message-ID:References:In-Reply-To:
 Accept-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
 authentication-results:x-originating-ip:x-ms-publictraffictype:
 x-ms-office365-filtering-correlation-id:x-ms-traffictypediagnostic:
 x-microsoft-antispam-prvs:x-ms-oob-tlc-oobclassifiers:
 x-forefront-prvs:x-forefront-antispam-report:received-spf:
 x-ms-exchange-senderadcheck:x-microsoft-antispam:
 x-microsoft-antispam-message-info:x-ms-exchange-transport-forked:
 MIME-Version:X-MS-Exchange-CrossTenant-Network-Message-Id:
 X-MS-Exchange-CrossTenant-originalarrivaltime:
 X-MS-Exchange-CrossTenant-fromentityheader:
 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
 X-MS-Exchange-CrossTenant-userprincipalname:
 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg:
 Content-Language:Content-Type:Content-Transfer-Encoding;
 b=ZkoDdEbnWeuef3uC16McFt9Ha0tSiJpMFpGeEyPHVHrfTpBkaLW2/dRY4KT4/OAao
 Uk2oZNhn8+C+JOvJELyb7PW6lsz0sh91sLFXSw0VzEb2wCsfJ2mtX//kOUii0U9u1z
 quh2uRzAiO+Z44i54nE8y16uDPpfasfnR+ccKDGASixfYdpo9IoU4OnH4m7r+rDXoh
 EMIf3GSOarmSq4A0fVZfGV2JsAmqe/XXygTgzgLUTZzKIfLZFF4Dq7jMKUROv+IQ+r
 E0/c/FPV0w/RzuUXPmt5aVQleHPa3fGQVKYapEvqi3Ii37lGPVxiXlEkV1gIO97fqg
 MmcqPhedVTZ6Q==
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Richard Fontana <rfontana@redhat.com>, Thomas
 Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>
Subject: Re: [alsa-devel] [PATCH] usb-audio: not submit urb for stopped
	endpoint
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

> Ah, I see.  Then you don't have to write up the full stack trace like
> the above.  It's confusing as if it were some kernel Oops or WARNING.
Got it. Should I post another patch set here for removing these confusing description in commit message? Or you can help to remove them before merging?

> BTW, with your patch, is the error in the first line ("timeout: still
> 1 active urbs on EP #1") also fixed?
Yes, "timeout: still 1 active urbs on EP #1" will be fixed as well.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
