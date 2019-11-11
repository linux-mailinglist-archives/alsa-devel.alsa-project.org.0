Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 59DD8F79A0
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Nov 2019 18:18:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE5D1166C;
	Mon, 11 Nov 2019 18:17:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE5D1166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573492701;
	bh=jfEf/svefNmwy7N+W2nCo9O1L/MEkKK+lgRt4iSv95o=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UMUA8Qjc+1s2CoMDE6eiC6vV8nZW/jiCHXF3xHKprkN6nODGxhnd+vsNCs5hYbRgO
	 OXdUw/WhmjJgt0DPrAVeseowi+NpOtu/UzTdG1wEkZD1W0evLQCDBNSWGjld8gLYWI
	 pLAhbnYfGFRIk+aORDthuvZVfhU++T4ECNVhi7lw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A862F8015C;
	Mon, 11 Nov 2019 18:16:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0A459F804FF; Mon, 11 Nov 2019 18:16:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,HTML_MESSAGE,SPF_HELO_PASS,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760049.outbound.protection.outlook.com [40.107.76.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9CEF6F80275
 for <alsa-devel@alsa-project.org>; Mon, 11 Nov 2019 18:16:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9CEF6F80275
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="z/tTlau6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ivYYIQZmbVJXHsZWOU6W0Z5YiqxS/EdHzN4Xt6CMCZKRW4aNZ4nHouiOlDOYb3mwkE/zDpHIitSN0/PMRyi++KDbQKeA65WnasCTBSH00zLp5IwiheOkotEm3PRyKThgcK2NiGEy3vNQpcL8nuhL3iTd5t3E3LpO6ZpoVJ32XDbfE7HB+mr+Fghf2pNAfiMQkM/P7sE1Hp7mBEdyPwDtcAApWPkBeeJuKPqO8HcYagflP6/y1kDmr8lTHVUTtX81ubGWXGAp1fFxVJgA1EksAJfBw+WpPzL9O2iynAhjKptpbsRomtZF6DeyZNmg6ZGSshF7MriSe09PgGmmamIR7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Svi0PE+UyF5uTatvGe+q6Ej8vTS9XBXGK9S/eFLGIk8=;
 b=HLVaBXeMGM3HOs++B/3ddbgefYGBksm36k0ybz/mDZrzPsd02jPNUA1MCAD5G6qPx9fIwjd79d2KJoloEe6sbumlGN77G2b8zoYg/kbOxyjSpoA0bIxjGrqT6ZmQBjAzC9qpK9xNZYeRc2fjROasBTYy89B41z1/VoRZkwkNGzCfz3lO6gdubHC9QVx+mG7p3eBXtti2cbLb09uTmGgcCuAyokU3QWBfQEJsAgf0pUNQBGmvwn/v9qWIf2x0KfNjfM7B3nIeQhpoWPCha7DqwCjZfdcDPehDmTq4qgl/FjYdwjx+FwJaHWMlL8Iv5eb9EyXymkUYJ6hm/1bDhMt4MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Svi0PE+UyF5uTatvGe+q6Ej8vTS9XBXGK9S/eFLGIk8=;
 b=z/tTlau6ot0ftqo4nB2CadLvSndMuuQlr8gVGQPa/s84TJOvJqtXT4FHFsW56bH2gZHAU9MqfLYkfqdrVeanIXg3hQj7ccEaYXhrpWSUu7K4gxpjTtuenr/WUwEm/bs5DodEW15w8yRJ5R0Fjedt+6riuaDWMpjZ+CzEYvx8tFE=
Received: from DM6PR12MB3868.namprd12.prod.outlook.com (10.255.173.213) by
 DM6PR12MB3307.namprd12.prod.outlook.com (20.179.71.80) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.25; Mon, 11 Nov 2019 17:16:25 +0000
Received: from DM6PR12MB3868.namprd12.prod.outlook.com
 ([fe80::ac0a:4c84:7bb:2843]) by DM6PR12MB3868.namprd12.prod.outlook.com
 ([fe80::ac0a:4c84:7bb:2843%5]) with mapi id 15.20.2430.023; Mon, 11 Nov 2019
 17:16:25 +0000
From: "RAVULAPATI, VISHNU VARDHAN RAO" <Vishnuvardhanrao.Ravulapati@amd.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Thread-Topic: [alsa-devel] [RESEND PATCH v4 1/6] ASoC: amd:Create multiple I2S
 platform device Endpoint
Thread-Index: AQHVmJ9+9jKOwokSakevbn7dMoCfyaeGHKWAgAAYnCM=
Date: Mon, 11 Nov 2019 17:16:25 +0000
Message-ID: <DM6PR12MB3868D380B280936C902FF67BE7740@DM6PR12MB3868.namprd12.prod.outlook.com>
References: <1573483794-8921-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
 <1573483794-8921-2-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>,
 <1e64b725-0f0f-0db6-677d-41a3ea564167@linux.intel.com>
In-Reply-To: <1e64b725-0f0f-0db6-677d-41a3ea564167@linux.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Vishnuvardhanrao.Ravulapati@amd.com; 
x-originating-ip: [27.59.133.215]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c7f6fafe-af58-489c-6243-08d766cae202
x-ms-traffictypediagnostic: DM6PR12MB3307:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB3307D8BC414EF0472A651627E7740@DM6PR12MB3307.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:449;
x-forefront-prvs: 0218A015FA
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(346002)(376002)(366004)(39860400002)(189003)(199004)(26005)(7696005)(91956017)(76116006)(76176011)(53546011)(476003)(4326008)(74316002)(6436002)(25786009)(14454004)(486006)(86362001)(71190400001)(71200400001)(5660300002)(66946007)(6506007)(66446008)(6246003)(9686003)(64756008)(99286004)(256004)(55016002)(66476007)(11346002)(66066001)(229853002)(66556008)(446003)(6306002)(54896002)(236005)(102836004)(33656002)(3846002)(6116002)(186003)(6916009)(8676002)(81156014)(45080400002)(81166006)(8936002)(478600001)(316002)(52536014)(606006)(7736002)(54906003)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3307;
 H:DM6PR12MB3868.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rOIcemkH6cEQ2AV3WKdVF6z7mh2/wShLPWu8WBejj1h0947wkbMA1NvEgMUgGrroJK9VdQnsMThAHstbMgh8Q1uDgF5LpLlOHPeibiZ9GvdTUUb/9hq1z8cqMNu3SRQUAnq9K37XjhENkuRrSXNkOxKfUnYBg53Hv3EC7AtwHJ1UgfZrUKh/Hvi0PWQXsRztlCxuZ33IfrtvX0BwDcn2quuaja6QSgzoKRLYR5C0TO0nrW3gWWYkgF3abXmLFSdYXjd0mxfYT9f7C8dUTp/giOwBGKYluuzx/6Nwm8QU+c27N8vsaVL/GzhtUBMlbl/0zvPnzTrEaxqVdmofTm8HhkYB0u0VmY12XS3AwbpbV8luOv6NPs9e01XhcHm4uVlAv6LdnSGhNxuTSl6od3T4BEh0TErVeL0yGeWIkWSH4Nodd6Ja1wDns75KiCVR58IF7p2ErdPjXkx5s3XfCTYGRvHILCJ0e90Gbq+lVtyJyNM=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7f6fafe-af58-489c-6243-08d766cae202
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2019 17:16:25.6309 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Mc9Z0lMVAX+0y1qh1k+IxgwVbj5smAt0aTV1sRTVRh+pKYcPA87YxDudevuy/T56IE0IrWYKogjzCtdMYZasuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3307
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 Maruthi Srinivas Bayyavarapu <Maruthi.Bayyavarapu@amd.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, "Agrawal, 
 Akshu" <Akshu.Agrawal@amd.com>, Mark Brown <broonie@kernel.org>,
 "djkurtz@google.com" <djkurtz@google.com>, "Mukunda,
 Vijendar" <Vijendar.Mukunda@amd.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 Colin Ian King <colin.king@canonical.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [alsa-devel] [RESEND PATCH v4 1/6] ASoC: amd:Create multiple
 I2S platform device Endpoint
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



Get Outlook for Android<https://aka.ms/ghei36>



From: Pierre-Louis Bossart
Sent: Monday, 11 November, 10:11 PM
Subject: Re: [alsa-devel] [RESEND PATCH v4 1/6] ASoC: amd:Create multiple I2S platform device Endpoint
To: RAVULAPATI, VISHNU VARDHAN RAO
Cc: moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..., Maruthi Srinivas Bayyavarapu, open list, Takashi Iwai, Liam Girdwood, Agrawal, Akshu, Mark Brown, djkurtz@google.com, Mukunda, Vijendar, Deucher, Alexander, Colin Ian King, Dan Carpenter



> +             pdevinfo[2].name = "acp3x_i2s_playcap";
> +             pdevinfo[2].id = 1;
> +             pdevinfo[2].parent = &pci->dev;
> +             pdevinfo[2].num_res = 1;
> +             pdevinfo[2].res = &adata->res[2];
> +             for (i = 0; i < ACP3x_DEVS ; i++) {
> +                     adata->pdev[i] =
> +                             platform_device_register_full(&pdevinfo[i]);
> +                     IS_ERR(adata->pdev[i]) {

how does this even compile?

I have not faced any issue of compilation.
Can I know what is wrong with it please so that it can be re checked.

> +                             dev_err(&pci->dev, "cannot register %s device\n",
> +                                     pdevinfo[i].name);
> +                             ret = -ENODEV;
> +                             goto unmap_mmio;
> +                     }


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
