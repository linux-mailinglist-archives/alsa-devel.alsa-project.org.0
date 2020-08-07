Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 228C023E899
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Aug 2020 10:11:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A82D51663;
	Fri,  7 Aug 2020 10:10:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A82D51663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596787908;
	bh=rJ1T4R3RwIAp69L4yHyAEzgH36rNaTVsHZLyqp15j+g=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J23MkXCa2qbkWj6wTTPjIP3416yBerG15ztmG9Vj+XlVquIkU0fKEemR4cCis+mLm
	 QYQUuAV8SafLcP8sAGdbIm/WtxqbeEcYz9n1xxZTijoQcHbn/mKfIGbONLLUI63Ip8
	 lgLRETJI0OyNKV0pkhxtU7ZgjMO+M9Vk9wxkGR7U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D128DF80259;
	Fri,  7 Aug 2020 10:09:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DD951F80246; Fri,  7 Aug 2020 10:09:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680068.outbound.protection.outlook.com [40.107.68.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8EA2CF80234
 for <alsa-devel@alsa-project.org>; Fri,  7 Aug 2020 10:09:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8EA2CF80234
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="cTODl5Vt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PBvMiwIiyCC/pFH4FPjiO2bt2b8vBETVrTC+EPINHDwPClwmPpDgWD+7CqNQ5VMJXSfor2ZRaa1498Z7AoA+XJAJGWqWFy5MdVqLTS1H7fbI5szZLCxCmhtcCI8adP8Ko1WUA3E4U4kC+cyX3uJYZ5bcebOF5fWZb8mVbb6NURT2ijgTjHLIu+SaXyyvucGfDLTii+XUAbDqi/AYYRr+AYBxLzt603ZRthS8i67CgXk7kdDupTkt2ksvPSAt5SYt2MMfYAsNQOYv70PFhTIAEMSDq8Zvo2e0u5a9IBN7VQyXOIKqaqLSzk68rk1vD2bCIeWmXfmR6+ZKzC1LVYqO3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rJ1T4R3RwIAp69L4yHyAEzgH36rNaTVsHZLyqp15j+g=;
 b=h/KPGW51qSbl5iJv+r5J8RkW0qcOZccSs8i3WaxkCpoEEXpOy6ua1Y03vkvipfnFwC/zgmY2FOuG/lziIwM71XrmyFeAJ4pKSlDRNalflfqiZR9PneqYBLScNRJwXzIf76nQg7q/lu7MUldFClzkHFrp4d7oNq+I1yI9CY8y2PGU3lOLq/rOGNkBdjdVyMaUHBP4uTj0nLfmkoNJQCRyXNBgQyC2oswLpGuDcmQiIlFFSxyqLCjQhbjnkYN6juJS2IpJ3nNRvHljyWZOZvjB7A2cfnpAo94Dzouwggx+Vm+rXVEWmJyN0RbgwYCQClC8gBbjBv1zbdr0JQmu19Q7yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rJ1T4R3RwIAp69L4yHyAEzgH36rNaTVsHZLyqp15j+g=;
 b=cTODl5Vtt7fMP3Zv57DtWCz7gvfZJl+rQxvCVdP+GD2m7SUHMSqrUIv+2FUwTvJ9serF8JSO5NdFJYIiHmgq/qu91KYu9fC4GV6XmhaWMZV1/q+rOXrz17oIu7cRP85/cpvUEHW016ioW6zCUuMnKpwPTmSvJoF2TukVDlWPeaw=
Received: from BY5PR12MB4292.namprd12.prod.outlook.com (2603:10b6:a03:212::12)
 by BYAPR12MB3510.namprd12.prod.outlook.com (2603:10b6:a03:13a::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.20; Fri, 7 Aug
 2020 08:09:35 +0000
Received: from BY5PR12MB4292.namprd12.prod.outlook.com
 ([fe80::31da:c8c6:10f7:3181]) by BY5PR12MB4292.namprd12.prod.outlook.com
 ([fe80::31da:c8c6:10f7:3181%5]) with mapi id 15.20.3261.019; Fri, 7 Aug 2020
 08:09:35 +0000
From: "RAVULAPATI, VISHNU VARDHAN RAO" <Vishnuvardhanrao.Ravulapati@amd.com>
To: Mark Brown <broonie@kernel.org>
Subject: RE: [PATCH] ASoC: amd: Replacing component->name with codec_dai->name
Thread-Topic: [PATCH] ASoC: amd: Replacing component->name with codec_dai->name
Thread-Index: AQHWa9sxjTkuG6r2KEqc7oVyF8d+LKkq8baAgAFZjKA=
Date: Fri, 7 Aug 2020 08:09:35 +0000
Message-ID: <BY5PR12MB4292C19FB56A631E63FB85E7E7490@BY5PR12MB4292.namprd12.prod.outlook.com>
References: <20200806101451.7918-1-Vishnuvardhanrao.Ravulapati@amd.com>
 <20200806112831.GA6442@sirena.org.uk>
In-Reply-To: <20200806112831.GA6442@sirena.org.uk>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=amd.com;
x-originating-ip: [165.204.159.242]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b5b79ba0-9f9e-4874-ffff-08d83aa9394e
x-ms-traffictypediagnostic: BYAPR12MB3510:
x-microsoft-antispam-prvs: <BYAPR12MB3510C216F89985B53AD02FAFE7490@BYAPR12MB3510.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /on9mpGf7ytu2IifVNBush3ON1Yar/9vVXW3xYIMPUmJKCDMaoFs3DSqPBn+6Z+ggFIc3rR+rm5XeSlYQwCCHKoJqW9z+YXjtlmMqoKBscgXljKaeTcI5AH96H0VjD8iw4Y9sWr90dSkOK0k6YqQNL7joal7EMRdAQA8Uuw2WwOZBmvnCb2c/OvdPbYykRUH9rnDF24TxD7xyMcCXOkjwXOSXX3XFSayvM/1Zi7tkJvDKmNjaElZ/dlrt1yH4yRPqAWXQKietkAOY7jA14T6JVtfucCKpY+66g1lFQIC/wRv5MoZ0N/gUcEUYqxKYxvfCP2d8y1jUM3O/m3k4W7i1Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4292.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(396003)(136003)(366004)(346002)(376002)(83380400001)(316002)(8936002)(478600001)(53546011)(6506007)(66446008)(7696005)(71200400001)(9686003)(64756008)(66556008)(54906003)(86362001)(76116006)(66476007)(66946007)(55016002)(2906002)(4744005)(6916009)(26005)(52536014)(8676002)(186003)(33656002)(5660300002)(4326008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: Smac61EHGRyH1et9C8OjC82Ao9Rkg+FdTSX7snf+eQG+Vf5v94Q18e3Dowdr80xd2EZqTF86GX4LAoBDbh0wSYTw/mqcdbZhC2n480u92mNf/jbKnUu/XvkDN3ZMGBHE5PKt8ab/zUpZgXI32bsgl1E37yDFSWFik4cWp0oWyTDGcFaB6OuYb0cBSNiiWO8oXI+lmBh86E4WrNA/p8c78OH11WVDRUou9e1FgvD4mEGvEeQrP7tWUDzhyEuHTNrzZT0QUnlYjUurnfWEIqwBXuwPhGzricWIOLKQB7X6kRR1Gz/ZVfQApCADO23GaXXUAKDcbNmOKXtEhpDtg2dtDCfrZ2CyXMGnm7eZ3/DMbVfuuDAE7xnlURIeNsrtETw6fRhc5m1oDhk12rV5cV8NBe5BmsKvonRgKYkL05mniYVVSyhYTa7M8EsC0PXmwLASbalNKz4ZMZu3GtAv82okQXAWDxQVi/32FaeVchIg5Dhm4zCNGfNfZ4+8emHAiGLF3xRxNWS8MXA1moAH0mXw2BN76+lAAsxb2QhN9zcCoxl7Tq3TiiFHk5x3VrmiK9FmJo6nqL5ttN7pMt4abOD9DTtZomv0ESO9S4xhmHM8fxlJZE4PvpwD28UlFxuXoMop5fkKBqOf/TOASaaRiQ/RoA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4292.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5b79ba0-9f9e-4874-ffff-08d83aa9394e
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2020 08:09:35.6296 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jM3/euk5nMHhiE1beeURRCZQqPgTt0WUVa6GDs0qF6phZWjhevHkbuUwcEMPzxO+3enPdvT8p51HnhgdVYgWUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3510
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 open list <linux-kernel@vger.kernel.org>, YueHaibing <yuehaibing@huawei.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



-----Original Message-----
From: Mark Brown <broonie@kernel.org>=20
Sent: Thursday, August 6, 2020 4:59 PM
To: RAVULAPATI, VISHNU VARDHAN RAO <Vishnuvardhanrao.Ravulapati@amd.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>; Jaroslav Kysela <perex@perex.cz>; =
Takashi Iwai <tiwai@suse.com>; Agrawal, Akshu <Akshu.Agrawal@amd.com>; Kuni=
nori Morimoto <kuninori.morimoto.gx@renesas.com>; YueHaibing <yuehaibing@hu=
awei.com>; moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..=
. <alsa-devel@alsa-project.org>; open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ASoC: amd: Replacing component->name with codec_dai->n=
ame

On Thu, Aug 06, 2020 at 03:44:12PM +0530, Ravulapati Vishnu vardhan rao wro=
te:

> Replacing string compare with codec_dai->name instead of comparing=20
> with codec_dai->component->name in hw_params.

>Why?

Here the component name for codec RT1015 is "i2c-10EC5682:00" and will neve=
r be "rt1015-aif1"
As it is codec-dai->name so the strcmp always compares and fails to set the=
 sysclk,pll,bratio of expected codec-dai

Thanks,
Vishnu
