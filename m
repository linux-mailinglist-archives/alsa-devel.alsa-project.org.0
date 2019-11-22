Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10522107686
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Nov 2019 18:38:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88F77180B;
	Fri, 22 Nov 2019 18:37:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88F77180B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574444326;
	bh=JEMXk+b9s2FL+rFAIQqWoVJc64O4i7cuJlLo/bapemw=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QPWeTqv0i8lymGDDXwrdQ9vgFHzCYcHOD4/UU+SkLLMY+rA/N6V0MhWt9j5kv/Wbb
	 gpl/ri7+qw3bEF39gY4bTdola1pTEWSYBgpUnI7mF4miBUY2GlYkkzGx1JjJQOX4fZ
	 B95D18DA+nYDQgPYLa3V7ew7izCpT9sE8l6n+vHc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F2D3FF800EE;
	Fri, 22 Nov 2019 18:37:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 82F3BF8014A; Fri, 22 Nov 2019 18:36:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,HTML_MESSAGE,SPF_HELO_PASS,SPF_NONE,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700089.outbound.protection.outlook.com [40.107.70.89])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EBCDEF8013F
 for <alsa-devel@alsa-project.org>; Fri, 22 Nov 2019 18:36:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EBCDEF8013F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="ZphR0X08"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G01iMf44inKjarSfQQNHG2R/IsZ9bhvX3hZVCzPAkHKDwESMbmcXV66xmyxMwGYiYArud3MsUG/i9vh2Xox9iyOLTIiNF50Qdspqc0UYVrBlkUzrToWsoPpHperqOpc+k2eIuiMb1fIpRn8Wy4TFLG77xUpkOwH0tCxlT01RkNnXFWgBvjQ7vgQaGbF0MQopWHtnQIYScrX0RHcp7UfaN9qW3WTT7vqdXt2y52xcISeiRLv5zrIDfVyVxFjDROLGZ/G3KeUDt3Df4PX4yZV4qGxT24of2l8CW1mli4xrRcsDzxcJwqe01EFz3//Ipcr0AAYDqnf1E9HgXIgzJtnWbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o4XydS+t1sAULUYAyK13kJ/u/SRSVdlPNTU+8xhFT8o=;
 b=caKzU8D0ccaCfQflv3efngiqRVvg/Nr5YxaDgOi19Ocp4nbh/oHLpu4I1RgNHjd49EO7XXf18BjrEy/Pln5C3ushcCwmUwU8J4dmewg23d1YvDSKKqq7bpvBDfPzHQg2m45oAv3Q+isT0rnrgf9TfYwhNHGi/GCIl7vFW21jsKFmhXLrWQLRNlIGDIQ1/h+VnYUHzWb20N2oGXp/mCBNoJaagD1geRs94oHV14Q+Bw4jtZGpCz0feY2S9UWYtId5sJ95LlfMA0w7fyVbcI790r1QwEQI7rkrSz1dJujW7SOD9D/JQoNEXTrCa2VkaYDWJ7qgPpMp6jFTzGgZK8e6DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o4XydS+t1sAULUYAyK13kJ/u/SRSVdlPNTU+8xhFT8o=;
 b=ZphR0X08h6qDvdDauhjis0moUo/8ILqSt5uOZB5keFdiJsAs06ToAvLQQXqKd1a5cDJX5igf5MK6wHGdTrPUgI09SosG4LUy8LG6xZBpGNEJvlUPnO2qFNFO1pVlW3HKOlpaSj1wALaHHnwwAdfeiX3Tf5uSgpJia1KT1pSHZi0=
Received: from CH2PR12MB3862.namprd12.prod.outlook.com (52.132.231.219) by
 CH2PR12MB4280.namprd12.prod.outlook.com (20.180.7.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.16; Fri, 22 Nov 2019 17:36:49 +0000
Received: from CH2PR12MB3862.namprd12.prod.outlook.com
 ([fe80::3d47:8737:20c4:1834]) by CH2PR12MB3862.namprd12.prod.outlook.com
 ([fe80::3d47:8737:20c4:1834%7]) with mapi id 15.20.2451.031; Fri, 22 Nov 2019
 17:36:49 +0000
From: "RAVULAPATI, VISHNU VARDHAN RAO" <Vishnuvardhanrao.Ravulapati@amd.com>
To: Mark Brown <broonie@kernel.org>
Thread-Topic: [RESEND PATCH v11 1/6] ASoC: amd:Create multiple I2S platform
 device endpoints
Thread-Index: AQHVoGFvooLcAR9FbkWxmTM8r5BbBqeXc0qAgAACk4M=
Date: Fri, 22 Nov 2019 17:36:48 +0000
Message-ID: <CH2PR12MB38623593EDE0846854AC8BEDE7490@CH2PR12MB3862.namprd12.prod.outlook.com>
References: <1574336761-16717-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
 <1574336761-16717-2-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>,
 <20191122172651.GF6849@sirena.org.uk>
In-Reply-To: <20191122172651.GF6849@sirena.org.uk>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Vishnuvardhanrao.Ravulapati@amd.com; 
x-originating-ip: [27.59.189.152]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 78eec788-b83e-42d0-b49a-08d76f728dae
x-ms-traffictypediagnostic: CH2PR12MB4280:|CH2PR12MB4280:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR12MB42808240E85D049EB9F23C6DE7490@CH2PR12MB4280.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 02296943FF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(366004)(396003)(39860400002)(346002)(189003)(199004)(316002)(6436002)(606006)(2906002)(54906003)(74316002)(6506007)(91956017)(66476007)(66556008)(64756008)(446003)(66446008)(26005)(6116002)(3846002)(236005)(76176011)(55016002)(14454004)(186003)(76116006)(4326008)(102836004)(6246003)(7696005)(52536014)(53546011)(256004)(229853002)(81166006)(66946007)(33656002)(81156014)(5660300002)(7736002)(478600001)(11346002)(71200400001)(99286004)(6306002)(54896002)(8676002)(66066001)(6916009)(25786009)(9686003)(8936002)(86362001)(45080400002)(71190400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB4280;
 H:CH2PR12MB3862.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: =?us-ascii?Q?TVq7bxWKwKH/hEEEIepAR6nkXPgwN07UnQu8kqW7E7rhO3wcpAc9/Xiy3KLM?=
 =?us-ascii?Q?tZ+ooXmO5MRCXHs6kV3S1VfYf0PtbeyMhbVd8KzOGStrzIdNcP+UesPGOCL9?=
 =?us-ascii?Q?+wByHPnHGqfWZy4ktACoXDa13H7j8GdQIRk+Qnd6YyMVae+GRXQ5RgaXF5o6?=
 =?us-ascii?Q?mdvq/fWWOOsnV1fGlpy0K4erA9KE6cUjfLl23V2eWKKcwJL/5aB9tNLKXezK?=
 =?us-ascii?Q?gyxqYZtVrMDrNFvMVpLw7dGIzRKR8HLyGsIBlPGpm9kGjaDQeDw5Yksv6/zj?=
 =?us-ascii?Q?VpwAKSvLUZZIf7S+fBTXa6zPGO8IOuNTsomnQgtxkw4SiILLfu1/p7goaK3/?=
 =?us-ascii?Q?icLuNqjwxZV6z1de0A1FBSQ7S6Q3068W2EpeIDK+XQ8MdYa627Ex73oAreNH?=
 =?us-ascii?Q?NvmPMT9wHXTrxUiylG58dzPssX8SCFgEJuyDgBhwjjQj3KxxsdpeSza/PmV2?=
 =?us-ascii?Q?MToDksz2b0NtqsEusTwjbGoKzra+OapDZgBCtkhPop/lplOB2yIg7WqMJLcI?=
 =?us-ascii?Q?DsOzDZWuOb4XHMjKBIFm+0DDaAoIjxc0idsDIiHiryaM9zZpJb4FD+hWXQX8?=
 =?us-ascii?Q?8V8igE2FYykuzRuZX2zAtXA0QOtBDWCrC52wcsvxv0scuo2CpBXvV5A268Nt?=
 =?us-ascii?Q?RZDrxrWa+TI40TKY71DOZIwIuzbaU0+/NZCKNn+zYZl6wQOa3QTBUNgZvh8t?=
 =?us-ascii?Q?a60xfWGBHAzUlWxV9f9UPpSeoMchvrk4HCuiLXYFBX5EbjD4+pTKtoOcX8Sa?=
 =?us-ascii?Q?vYA0xQAN1o64/lbpYXj3P8vUA7Lo1iqytH2JbDrk1WCR2WGeqTCWDz4ySwvC?=
 =?us-ascii?Q?bQAOU6AoSztHtpQd+foQZRcFS47d8MHKrJenajJ+IRZNWWAOlnIw+q3TOSzH?=
 =?us-ascii?Q?P0QPvFSZqy3op5Us/IaAwRhEenjkJMwK3WNyND8tF2/enigneSkhwsz//TFT?=
 =?us-ascii?Q?xJlW8r8fXgoGMyo5ZPCTCfrID0uRebnBwz8SZLH2k5eHRfPce5J6VOP6mQsU?=
 =?us-ascii?Q?HRS7YhNT5kOSCPMSJWhsBE086qRtXCzFqw4dyH66hgqzq//i/cQxKMS6+k8O?=
 =?us-ascii?Q?chpMNsFjktfCIOrsdHbUWmxdnbiIhjqv8ScWrkC5of8drKxPxGjUnMAukSrr?=
 =?us-ascii?Q?LtGiMRCLsoUSWZgtErszYfmen3gXtmtJwLAlnEitxLM6ws7njBapBJ+LDzAC?=
 =?us-ascii?Q?GODbx+xbNA1rXZi23JShcbpLyMjCcXpRHzeLXH97UHkNQoW4t1uY8+KNrmAc?=
 =?us-ascii?Q?ylm/TP0JA8yopIYu+eeHEKQMTDy+cueiSJxeQoJjEhkiiVVZiUCnqv64YidW?=
 =?us-ascii?Q?OUeuwCny0Cet6G55FnUpXpFzY/N6a2LMUmibYlmpextrDNRON8SzxrBQq4EG?=
 =?us-ascii?Q?9qZsE5EqNGg5fzvX19g/ssC3fjZeaWJ2Nc/O27pZi4UY9XqAk+Nfhurlhjum?=
 =?us-ascii?Q?SIjk2Ou34kdRHz1ABEOCkMgIGf0ICg0a/Mb6VmmjLBoAC0iF+vjyuUxPFslo?=
 =?us-ascii?Q?PX7sUORDc5VcOYOPcnoyRBgDGa6Grjbx4VGU4EGaxn4owXnPbG9VxkxwL6/b?=
 =?us-ascii?Q?QT7wCmjtYBbnH3Gq+q613NwYrMLtK1whh7ya6pSyBNFJPzJ0Dvuc3QFqFgb+?=
 =?us-ascii?Q?LbcERYj8vl1hZ0NsJoxU9ILMb9A0vaT5NS3RMvWAoysOi/cwFQzGcsM6KooG?=
 =?us-ascii?Q?Z6kOY/aB3xqoTXIE3SpWVuO6iDqeKrUSXDGYHcizJQWNFxqg6CVpJaEHOZKh?=
 =?us-ascii?Q?N6o2JiOzY9jK5kTJnEmexL6Z+kno9ii4X3EtP0iPQ5WA5KmM3MeM4lqkFdZa?=
 =?us-ascii?Q?6hOTXOGi/eeTa3mNfrNVBI5jeOKYhE+14lmiv+ZdPwIxpPj2L+t4BKk9DHxj?=
 =?us-ascii?Q?JwMivXbkOqZqST5UfQ=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78eec788-b83e-42d0-b49a-08d76f728dae
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2019 17:36:48.8437 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Pal7VGvly3+BuI/KixeWsx4qfUXogobDHDtD9/seeKQzKBN2u8UevSU3XxVsakqh1fQap5WiEBXVq+cUwmH2hA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4280
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: "pierre-louis.bossart@linux.intel.com"
 <pierre-louis.bossart@linux.intel.com>,
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO
 POWER MANAGEM..." <alsa-devel@alsa-project.org>,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, "djkurtz@google.com" <djkurtz@google.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Agrawal,
 Akshu" <Akshu.Agrawal@amd.com>, Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [alsa-devel] [RESEND PATCH v11 1/6] ASoC: amd:Create multiple
 I2S platform device endpoints
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

Ok Mark.

Thank you,
Vishnu

Get Outlook for Android<https://aka.ms/ghei36>

________________________________
From: Mark Brown <broonie@kernel.org>
Sent: Friday, November 22, 2019 10:56:51 PM
To: RAVULAPATI, VISHNU VARDHAN RAO <Vishnuvardhanrao.Ravulapati@amd.com>
Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; djkurtz@google.com <djkurtz@google.com>; pierre-louis.bossart@linux.intel.com <pierre-louis.bossart@linux.intel.com>; Agrawal, Akshu <Akshu.Agrawal@amd.com>; Liam Girdwood <lgirdwood@gmail.com>; Jaroslav Kysela <perex@perex.cz>; Takashi Iwai <tiwai@suse.com>; Dan Carpenter <dan.carpenter@oracle.com>; moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM... <alsa-devel@alsa-project.org>; open list <linux-kernel@vger.kernel.org>
Subject: Re: [RESEND PATCH v11 1/6] ASoC: amd:Create multiple I2S platform device endpoints

On Thu, Nov 21, 2019 at 05:15:56PM +0530, Ravulapati Vishnu vardhan rao wrote:
> Creates Platform Device endpoints for multiple
> I2S instances: SP and  BT endpoints device.
> Pass PCI resources like MMIO, irq to the platform devices.

Please when you're posting stuff don't put these RESEND tags on some
patches in the series, they're not helpful - having them in some but not
all patches is inconsistent, you're sending a new version of the series
here.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
