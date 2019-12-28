Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F25F712BC32
	for <lists+alsa-devel@lfdr.de>; Sat, 28 Dec 2019 03:03:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6BE151775;
	Sat, 28 Dec 2019 03:02:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6BE151775
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1577498601;
	bh=zxMXoZ51fAweKdv4c1dOzCkFPvTAQxgiCC4ZVDhPpHY=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iUiVNiOyuSKDHGkT/+aP0FXBHCGTdKrNB1hoa0s0g5pxrbXaeW4Ugqdt+lHghOp1o
	 Kl8TfKw8KIjssfcZJPkDH+5hCR/Yv+9NU3JasCH0CIt98UIDCm2LkRU59aH1KsneQy
	 ZjMMB2QCQN/dsKqh/+I/NaQ6MTnsMcmEgV4RrPCM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D2C9AF80145;
	Sat, 28 Dec 2019 03:01:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EA139F80132; Sat, 28 Dec 2019 03:01:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,HTML_MESSAGE,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2043.outbound.protection.outlook.com [40.107.236.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6AD60F800AE
 for <alsa-devel@alsa-project.org>; Sat, 28 Dec 2019 03:01:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6AD60F800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="C4e48G01"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QIe1nrJ16mw4B9fxNaBgzQrFW6pSXW2fVhz9PM0CSykqvhzWhZqKDgkrHyu9Z+Sk9RYYh7GN+PVQ8gy3Xbmp9sFbjffaUuUPWLneZdPMKNDk1qx46UTqye5shzn60PRaOHsF+jXmwtEkwQZm++QgnnJAudYdQPvpgLbreFr6vdassWf5iK9msLW8ZDuvDxoz+/Wd8/zh2hM+efgHQcap9SCf7e+76fHuffawPVD4VCHzXaB9ykK617Hui2J8HVS4YC1TS1ypJuWLOD4+QyY6N4A9WdpOhZnARJimS6ja2cJge/hFJ0M2BqC1sMTA76bKF+xwGQQydaDBfGN4MwWx3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nh33SX++3lPfRwKN4FAL6KpFEuS3wdc4dp1s19d41j4=;
 b=PGc6keE9yHJLq1fcUeqTu9xU+GlnnXGhKL0Ll3yFh6TyeuRPHev0mvYzaFGqqpHmL27zFR3O3uMEm0A4gR/jO4HNerGmSU0wjH+WgfN4rOf9iuLGQQvBDK1uSbhu3Wr8pajgrFVMfkqnSuSsLAmWUD7GflEHYuA6/rgf63yj6xknQv4LyRPEhvXJEGJRc9gS3xMo7Zu05lmXBLEi1BypUP5ywXHrWDyaTij9r/TgNwxgf+m/masiJFOMQQd0xRvYvLCXPEBe5ACwpSqOR29FK09qq3E261Vax1RYuXzz2oICyPMzPUcYRF8T9R1NOBqtCLmY558h1NyFrT7lWzbP7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nh33SX++3lPfRwKN4FAL6KpFEuS3wdc4dp1s19d41j4=;
 b=C4e48G01L7NGK48D0/YfRCAFl/hIw4VaJCXlhhi2jWhzqp7jhq4+GMdMnn6U9w9NqRvROptf0NbNS485z1vC8RxvWizXnoZzPziaiUlK1rAHlbBZbuBj8E7XPnJCScyJyI/c7TJLHdbUIbYfkVENU8AEX693EsApV933iPgYYEs=
Received: from DM6PR12MB3868.namprd12.prod.outlook.com (10.255.173.213) by
 DM6PR12MB2953.namprd12.prod.outlook.com (20.179.106.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2581.11; Sat, 28 Dec 2019 02:01:27 +0000
Received: from DM6PR12MB3868.namprd12.prod.outlook.com
 ([fe80::b13a:2561:f1ed:c80f]) by DM6PR12MB3868.namprd12.prod.outlook.com
 ([fe80::b13a:2561:f1ed:c80f%7]) with mapi id 15.20.2581.007; Sat, 28 Dec 2019
 02:01:27 +0000
From: "RAVULAPATI, VISHNU VARDHAN RAO" <Vishnuvardhanrao.Ravulapati@amd.com>
To: Mark Brown <broonie@kernel.org>
Thread-Topic: [PATCH 1/6] ASoC: amd: Refactoring of DAI from DMA driver
Thread-Index: AQHVvLSViN6h4Te/+0+5WbRd50rpzafOmC2AgAAxEns=
Date: Sat, 28 Dec 2019 02:01:27 +0000
Message-ID: <DM6PR12MB3868304F748AD00C4AEF8688E7250@DM6PR12MB3868.namprd12.prod.outlook.com>
References: <1577451055-9182-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
 <1577451055-9182-2-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>,
 <20191227225555.GA3897@sirena.org.uk>
In-Reply-To: <20191227225555.GA3897@sirena.org.uk>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=True;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2019-12-28T01:51:31.4265872Z;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=0;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Privileged
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Vishnuvardhanrao.Ravulapati@amd.com; 
x-originating-ip: [27.59.166.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 1f756d9b-9e89-4434-46d7-08d78b39d99b
x-ms-traffictypediagnostic: DM6PR12MB2953:|DM6PR12MB2953:|DM6PR12MB2953:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB2953B89EA20F698FCC363ECBE7250@DM6PR12MB2953.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1751;
x-forefront-prvs: 02652BD10A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(39850400004)(346002)(376002)(396003)(189003)(199004)(76116006)(5660300002)(66446008)(33656002)(55016002)(478600001)(45080400002)(26005)(2906002)(52536014)(9686003)(66476007)(91956017)(7416002)(66946007)(64756008)(66556008)(71200400001)(86362001)(6916009)(8936002)(53546011)(7696005)(6506007)(81156014)(81166006)(4326008)(8676002)(54906003)(186003)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2953;
 H:DM6PR12MB3868.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qt1ImhJpVC6QCe9lUs/kkpEMFT+mzEIB4EXpd+ESV1n/v9nOTodFQFf5EHKHxb/A3Cqe5Y9/VUkQVgBl9WKpYgaPbZvmWrwuyYpApBhgixoiqAwMfl/KWFUeigiF3XUKrepeVOTbXkL8q1693M1Aj3KkO+Ce6IJ7J8vv7BHHEd38qkQ32zVpgZ4J/GKZ/blzXowysDMbUiT9HJ17okjH8GZoAGtNS5Qg8F1NY0EUjL37iVrWv8oh+TtBvv819gJ4McLNHuZsJHBavPyMQrTt+2tZyrfKIlyH57q8m676SOOBaZXl/fBxgiNkpbCgEG35mnwj6RKrmbc9d0jRtcTZ6GH54eguy1wiLg6TS2KZneMo/mmgysWFaYtJHwjuIxuUWPMlcw+8hCVsO61go6swFmdT6OwmKRnTF0SwJfD0buJBgJNVeSwtckyEzn1fRq1VhFLb5QlSv47vgJ3XDT/fwv591KZYqyyifQH0s+JB1Nw=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f756d9b-9e89-4434-46d7-08d78b39d99b
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Dec 2019 02:01:27.5094 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PjklCUFFp0OW9YtxWQ+OsiIPmSJx8YnfZUaoQsq8XDZkazSxS+bS+Vq2IsZEnHD7rZNeN1lXb5bXjzDAFxPqdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2953
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: "pierre-louis.bossart@linux.intel.com"
 <pierre-louis.bossart@linux.intel.com>,
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, open list <linux-kernel@vger.kernel.org>,
 YueHaibing <yuehaibing@huawei.com>, Takashi Iwai <tiwai@suse.com>,
 "djkurtz@google.com" <djkurtz@google.com>, "Mukunda, 
 Vijendar" <Vijendar.Mukunda@amd.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [alsa-devel] [PATCH 1/6] ASoC: amd: Refactoring of DAI from DMA
	driver
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
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

[AMD Official Use Only - Internal Distribution Only]



Get Outlook for Android<https://aka.ms/ghei36>

________________________________
From: Mark Brown <broonie@kernel.org>
Sent: Saturday 28 December 2019, 4:26 AM
To: RAVULAPATI, VISHNU VARDHAN RAO
Cc: Deucher, Alexander; djkurtz@google.com; pierre-louis.bossart@linux.inte=
l.com; Liam Girdwood; Jaroslav Kysela; Takashi Iwai; Mukunda, Vijendar; Yue=
Haibing; Kuninori Morimoto; Dan Carpenter; open list; moderated list:SOUND =
- SOC LAYER / DYNAMIC AUDIO POWER MANAGEM...
Subject: Re: [PATCH 1/6] ASoC: amd: Refactoring of DAI from DMA driver

On Fri, Dec 27, 2019 at 06:20:50PM +0530, Ravulapati Vishnu vardhan rao wro=
te:
> ASoC: PCM DMA driver should only have dma ops.
> So Removed all DAI related functionality.Refactoring
> the PCM DMA diver code.Added new file containing only DAI ops

This breaks the build:

It's unfortunate.i noticed but applied the same in 2/6 assuming that the sa=
me as 1/6.

  CC      sound/soc/amd/raven/acp3x-i2s.o
In file included from sound/soc/amd/raven/pci-acp3x.c:13:
sound/soc/amd/raven/acp3x.h: In function =91acp_get_byte_count=92:
sound/soc/amd/raven/acp3x.h:94:19: error: =91SNDRV_PCM_STREAM_PLAYBACK=92 u=
ndeclared (first use in this function)
  if (direction =3D=3D SNDRV_PCM_STREAM_PLAYBACK) {
                   ^~~~~~~~~~~~~~~~~~~~~~~~~
sound/soc/amd/raven/acp3x.h:94:19: note: each undeclared identifier is repo=
rted only once for each function it appears in

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
