Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 394711442BC
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jan 2020 18:05:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 717DB167F;
	Tue, 21 Jan 2020 18:04:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 717DB167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579626337;
	bh=7n4Mg4nCAhvS3tXyljw7SVgRaRwly0XQTaK58u9PCEU=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TZjY0urHCML1Xh8RC0B57a8TNVQyWmzrsBAd1E+WNbEJX+ymRp49r7IDC2xKnT7vn
	 uhftWo1Ge3zUPI4jQrtEASRwH2/hb5pyI0WJfASci3/WgNI8u5B0yoDBm1YJhBhC9R
	 Tlt3h14+zC41BXsNdLZu4s+e/pmrgvc0LLdm3IO4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 360C8F8015B;
	Tue, 21 Jan 2020 18:03:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2981EF800CB; Tue, 21 Jan 2020 18:03:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,HTML_MESSAGE,SPF_HELO_PASS,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2044.outbound.protection.outlook.com [40.107.236.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C7AB9F800CB
 for <alsa-devel@alsa-project.org>; Tue, 21 Jan 2020 18:03:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7AB9F800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="pxyA3Ly0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Grcn99wzsPQd2SV1Hje+JCiOmRi8t90Q4mBIchbOx/dcJCZIIjuxeteZY+daE2Mtc6Ix6Ei3M0ff0ynh/HasQjMSMDKKvBzFgn2V9C5lP56dCCaqyE85JisGeZ/LBHnKRHI8B1Nz4ef+DxGJjtNPXkAGEFVPOo/XA9YaELlGFc/rZv1d7dOqBmSFwWu3cYyAfD/ce8GhfQuRArSX5JInusJ5hy2z2QPuzlfWuZtOANqI0LyWdNvDiyz9L+qyAyRXcWtWfwhp/vAfzPUKsDrca5XY19nPal25WQXsosHtSgEuGXlAKXKLnJ5WHAGe1sj5yquPX/rJ6uE0Omvjf9qe8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lf9CNL36FV/QqtTKm6aVnAmztckuby3LGEbx46zUZY0=;
 b=j2IqD9rvZk4HlRo7oGweqhLGreyz8fAKAT4V00jlpIX7FE9EUIu40kcmk8yANjeRphDoFYAZu4Ac+gdWyjNAXCUks1BCp12hm6oVT4eyI33RRwCtBw3OrNhHnAb7+b0CHZkRjidyfivpqnw6I4hUSPdINybxTGNfKyIWpsYWVa2RoCihpekSfcYUeoBpVsJD/AkCAgMWckcJ2eOVInEsnDnOl1ZtfeOta9W0uAQSZXlgxh3AbXG0Q7fvWrwHBZvyoLR2bSPxsSaZfZ1F+Dd7wJiQOQpOgDBKFPZWbi8CwnWpxDdNgczcb2zg8U6mTiyks4Y7wMBQXfHN+W4k9TbesQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lf9CNL36FV/QqtTKm6aVnAmztckuby3LGEbx46zUZY0=;
 b=pxyA3Ly0UrmBEJNHPlxBLR3r5mbzf3eePgkp7UgkdMVGm4izFWGIHWqFz74ZhwYSWOadwxJvu/yL2Zbnb8yU6ZNoOm59B5GTtT/13dRvyEJC0M5P8lDC7LgUf86o4efAiZ+YB1N0iLu7QQW3kSYA1CgPRuOYfA90/PxBqIzQemc=
Received: from DM6PR12MB3868.namprd12.prod.outlook.com (10.255.173.213) by
 DM6PR12MB4201.namprd12.prod.outlook.com (10.141.185.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.20; Tue, 21 Jan 2020 17:03:44 +0000
Received: from DM6PR12MB3868.namprd12.prod.outlook.com
 ([fe80::b13a:2561:f1ed:c80f]) by DM6PR12MB3868.namprd12.prod.outlook.com
 ([fe80::b13a:2561:f1ed:c80f%7]) with mapi id 15.20.2644.027; Tue, 21 Jan 2020
 17:03:43 +0000
From: "RAVULAPATI, VISHNU VARDHAN RAO" <Vishnuvardhanrao.Ravulapati@amd.com>
To: Mark Brown <broonie@kernel.org>
Thread-Topic: [PATCH] ASoC: amd: Fix for Subsequent Playback issue.
Thread-Index: AQHV0EfsVd5C9JnYNketUgdMPFpokaf1V7WAgAAAa9M=
Date: Tue, 21 Jan 2020 17:03:43 +0000
Message-ID: <DM6PR12MB3868B9744A40D41450155534E70D0@DM6PR12MB3868.namprd12.prod.outlook.com>
References: <1579603421-24571-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>,
 <20200121165925.GH4656@sirena.org.uk>
In-Reply-To: <20200121165925.GH4656@sirena.org.uk>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=True;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2020-01-21T17:00:54.8379459Z;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=0;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Privileged
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Vishnuvardhanrao.Ravulapati@amd.com; 
x-originating-ip: [27.59.140.138]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 488081e7-8abc-4bef-56fe-08d79e93df4a
x-ms-traffictypediagnostic: DM6PR12MB4201:|DM6PR12MB4201:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB420190C8F2A8FDBFE160F478E70D0@DM6PR12MB4201.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0289B6431E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(346002)(39860400002)(376002)(396003)(189003)(199004)(6506007)(316002)(54906003)(53546011)(7696005)(86362001)(81156014)(8676002)(81166006)(8936002)(4326008)(9686003)(5660300002)(64756008)(76116006)(186003)(33656002)(52536014)(91956017)(66446008)(6916009)(26005)(66556008)(478600001)(71200400001)(66946007)(66476007)(55016002)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB4201;
 H:DM6PR12MB3868.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ocfRE3wsfGH4EJAHnwJBtX84qzHWt+B6uSPndcVTtL4OrMnm4yVoPL4DvtD3Etbn8P4S6iB5MsJDQRu3lGNJoGLdrkaD2Phyhpjhs+Qe6+kiffSWBrghtl28E3yhVvmjg/M4slbz79RW2KjRC7BM6r718Fy7h6Sp/FvkSa3JOZx6uowKiXC3i47SO7n9n2BgrP/eLbaPwiTi8UzwVpsAW90XP4i4NBq+2iC4okOopWt1znxzFjqZFdw2Xc5vQEYUbGNmuSto4aC6WkztIS8Lal9PWrDISY2cju3v87bpf2AtW7pPpNyiJ/Bm7SH8co/vtQs19mNM7D8kkOD5ellWHBQJuccSFFiEyuNfA047iAkH1MdBuNOlPbcmBvM3GOGiHjKeque0BFDmVtUQhSKItRlAacm+FFnV+S9typ78MHcC3b7IdF29cV+mdSJemxW/
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 488081e7-8abc-4bef-56fe-08d79e93df4a
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2020 17:03:43.8637 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /1KFvoutnt1nF1m3+d+AsFEKQmnAmOVdXHQoogqRlvX2v6JNxXloYtaWo6QUyoMLXS54SGoaYpewWVYyEVeRug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4201
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: "moderated list:SOUND - SOC
 LAYER / DYNAMIC AUDIO POWER MANAGEM..." <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 open list <linux-kernel@vger.kernel.org>, YueHaibing <yuehaibing@huawei.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, "Mukunda,
 Vijendar" <Vijendar.Mukunda@amd.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 Colin Ian King <colin.king@canonical.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: amd: Fix for Subsequent Playback
	issue.
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

[AMD Official Use Only - Internal Distribution Only]


________________________________
From: Mark Brown <broonie@kernel.org>
Sent: Tuesday 21 January 2020, 10:29 PM
To: RAVULAPATI, VISHNU VARDHAN RAO
Cc: Deucher, Alexander; Liam Girdwood; Jaroslav Kysela; Takashi Iwai; Mukunda, Vijendar; Colin Ian King; YueHaibing; Kuninori Morimoto; moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM...; open list
Subject: Re: [PATCH] ASoC: amd: Fix for Subsequent Playback issue.

On Tue, Jan 21, 2020 at 04:13:35PM +0530, Ravulapati Vishnu vardhan rao wrote:

> If we play audio back to back, which kills one playback
> and immediately start another, we can hear clicks.
> This patch fixes the issue.

>        /* Disable ACP irq, when the current stream is being closed and
>         * another stream is also not active.
>         */
> +     kfree(rtd);

This free looks like a separate change which seems good and useful but
should be in a separate patch?

No Mark,

That is part of the fix. please let this be included in this patch.

Thanks for your cooperation.

Regards,
Vishnu

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
