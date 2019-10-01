Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A76FC3E84
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2019 19:25:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7B41167B;
	Tue,  1 Oct 2019 19:24:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7B41167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569950743;
	bh=DdzXLYnXLrggdlQNFq+6kmuU+sX+1peGrNQJb4Uk4aY=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GpY1enrVGlWE2/sV6nhzXXbm2qi/GjEEBJdGiAvX1vvBD5MPXhJ1zu5FLbqpozp57
	 RijiFk4qOjD/Rx7KFj5TxS4sAlgEEAW3fFj9gGwuHIcgnP6Kw/AQOYtM9prkdBxQrf
	 xBRPqmS/OQeESdhvhsT++wtjdf1bi2i0x4GbqvFo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C9052F804FF;
	Tue,  1 Oct 2019 19:23:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE329F80506; Tue,  1 Oct 2019 19:23:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=2.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,PRX_BODY_30,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760085.outbound.protection.outlook.com [40.107.76.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E6E4F800DE
 for <alsa-devel@alsa-project.org>; Tue,  1 Oct 2019 19:23:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E6E4F800DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="KO0gvkzu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EpHLWxo3pAvbjzhdkTtWVIz+FV3u7bjE/QEG7KWvre1+1qCPEPj2FtQeUum6nifAy12QEyJeFRtE3scrpD9a74NKN4AI9sJRH/lL921Ltuj/gKmF/LK3+MnnuarWhXNLPkMItx2gxaUftMfyz4OAb+YOjFe7D/LAI0KGYTK1TR88fTgJuG9RLxYekFN/j+8YKnTCjD5jD1sHwMc1O7+SHA2WH7upeNXbtspxQ48XX/VuMyobU4NK9/CmfEuD2XRopspkDuQhZwMuO9o29DVfCoCUlTtU5BWCxaZvlgMrjK6lZYU+kk4t8D+UWwLsKPKNmpBYEycGPGHyjMLI4mnRfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DvpI6JiW8S029O9uMVE64R+dxC4VkgtzpqCTecQvjyY=;
 b=EEysCr+14T/KeITki4hzAbz74gVCQdbhWcejOWHlVryhW7ssAPWoWLY3RA0qyFhSrmY750A/nnEhnUKktHCjYFTFJKsDON7BFED20pVEC0rBJSG0nXeNXIBmoxRGtffQ4kUMP0bhIDSKg66YgNWtFqu10ftPTmT6hOg3bYjfSHmE3pqtI4wrI6E5NM1K+zVuRG06BrF5ZLSYim8ei55M+5HEMMU3CUm86fT8vVxJTl6UzdDakppfiOC6SC2EmjMPSlIw74XaCCmLOAht2bhU187UMjRFsdP/jGyMVx25eK1SCs+9+4x0DHTrIRESbXmCmg2wo7MEXBJ7OD/WDaveXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DvpI6JiW8S029O9uMVE64R+dxC4VkgtzpqCTecQvjyY=;
 b=KO0gvkzuo+JT/ONaHRp1M88knvT5RH08rBTUe742JKh9epGyFzxcdAgETwEuessqRM3FkWxP1nQv1FrdJexYICtHnI9eiMSpj0JDiDNAD+yNXFD2QJnh0zVfBkK8Wn05sMOq4+xytlDAbBYi3OtEmxd67nfDdm5iRmF4qfvjTwY=
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1539.namprd12.prod.outlook.com (10.172.19.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Tue, 1 Oct 2019 17:23:43 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::418d:e764:3c12:f961]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::418d:e764:3c12:f961%10]) with mapi id 15.20.2305.017; Tue, 1 Oct 2019
 17:23:43 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "RAVULAPATI, VISHNU VARDHAN RAO" <Vishnuvardhanrao.Ravulapati@amd.com>
Thread-Topic: [PATCH 1/7] ASoC: amd: No need PCI-MSI interrupts
Thread-Index: AQHVd5goxXKghNLRDkOKQUyI++DOdKdGClsQ
Date: Tue, 1 Oct 2019 17:23:43 +0000
Message-ID: <BN6PR12MB18093C8EDE60811B3D917DEAF79D0@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <1569891524-18875-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
In-Reply-To: <1569891524-18875-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Alexander.Deucher@amd.com; 
x-originating-ip: [71.219.73.178]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 172c7345-53ef-4076-6b91-08d746941c01
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: BN6PR12MB1539:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR12MB1539BA27E633847BA309B94CF79D0@BN6PR12MB1539.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 0177904E6B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(366004)(376002)(136003)(346002)(396003)(13464003)(189003)(199004)(102836004)(256004)(486006)(54906003)(11346002)(446003)(476003)(7736002)(305945005)(33656002)(4326008)(2906002)(74316002)(14454004)(8936002)(64756008)(66446008)(66476007)(66946007)(186003)(6246003)(76116006)(66556008)(81156014)(6116002)(229853002)(25786009)(81166006)(3846002)(8676002)(6506007)(26005)(478600001)(99286004)(7696005)(71190400001)(316002)(6862004)(6636002)(71200400001)(66066001)(76176011)(6436002)(55016002)(5660300002)(9686003)(52536014)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1539;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3fmu5b9NDCQdTyhAbiGlsTzaidlwKDX98TceKJAVSVMOFPyBDc95lgxYkBZ6z5Ra5ozuAtt3gUDyZOoeIidl3iOt9ztSTwAG/bx31xdjejrq0uv/81gt+CRrwnxxlrkTOVs8sOvXJR2TdouowEnaZI1Fu0OX/u3duRAh9X5kMNoEKv+TwKD/ZAEwwN0p3abEqSXMhL3SIsAa25joZPA1C+8Ub3/Tn7pl/yEBY/wt2N++eZzjH6r1Kdqnmos+IXPX1xJiWlceTNjHKOafEEAHeXVajt9g8zl7BeEQkBTJDx26K7ZP5Kl33k/a908E63hYaoxAtVpTVtGGpiFXpMXEPKj7UVQ++s9WfJlpVyZHbm8hVKsaNI44QmJMnX5EoFvdWyW6pwNNORHi1aGfzFP9cfPgyEX2UFCQhPrFJbAPMvs=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 172c7345-53ef-4076-6b91-08d746941c01
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2019 17:23:43.4124 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iAAy3VBWHbOfW6LPcbfC9ROFpELqwhp8vdPB3Yre7BFaiM5MA5qholxTSWxVzbmRBf0nEJOn0m7mYh5zX9Qrhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1539
Cc: "moderated list:SOUND - SOC LAYER /
 DYNAMIC AUDIO POWER MANAGEM..." <alsa-devel@alsa-project.org>,
 Maruthi Srinivas Bayyavarapu <Maruthi.Bayyavarapu@amd.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "Mukunda,
 Vijendar" <Vijendar.Mukunda@amd.com>, "RAVULAPATI,
 VISHNU VARDHAN RAO" <Vishnuvardhanrao.Ravulapati@amd.com>,
 Colin Ian King <colin.king@canonical.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [alsa-devel] [PATCH 1/7] ASoC: amd: No need PCI-MSI interrupts
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

> -----Original Message-----
> From: Ravulapati Vishnu vardhan rao
> <Vishnuvardhanrao.Ravulapati@amd.com>
> Sent: Monday, September 30, 2019 8:58 PM
> Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; RAVULAPATI,
> VISHNU VARDHAN RAO <Vishnuvardhanrao.Ravulapati@amd.com>; Liam
> Girdwood <lgirdwood@gmail.com>; Mark Brown <broonie@kernel.org>;
> Jaroslav Kysela <perex@perex.cz>; Takashi Iwai <tiwai@suse.com>;
> Mukunda, Vijendar <Vijendar.Mukunda@amd.com>; Maruthi Srinivas
> Bayyavarapu <Maruthi.Bayyavarapu@amd.com>; Deucher, Alexander
> <Alexander.Deucher@amd.com>; Colin Ian King
> <colin.king@canonical.com>; Dan Carpenter <dan.carpenter@oracle.com>;
> moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM...
> <alsa-devel@alsa-project.org>; open list <linux-kernel@vger.kernel.org>
> Subject: [PATCH 1/7] ASoC: amd: No need PCI-MSI interrupts
> 
> ACP-PCI controller driver does not depends msi interrupts.
> So removed msi related pci functions which have no use and does not impact
> on existing functionality.

In general, however, aren't MSIs preferred to legacy interrupts?  Doesn't the driver have to opt into MSI support?  As such, won't removing this code effectively disable MSI support?

Alex

> 
> Signed-off-by: Ravulapati Vishnu vardhan rao
> <Vishnuvardhanrao.Ravulapati@amd.com>
> ---
>  sound/soc/amd/raven/pci-acp3x.c | 11 +----------
>  1 file changed, 1 insertion(+), 10 deletions(-)
> 
> diff --git a/sound/soc/amd/raven/pci-acp3x.c b/sound/soc/amd/raven/pci-
> acp3x.c index facec24..8f6bf00 100644
> --- a/sound/soc/amd/raven/pci-acp3x.c
> +++ b/sound/soc/amd/raven/pci-acp3x.c
> @@ -46,14 +46,7 @@ static int snd_acp3x_probe(struct pci_dev *pci,
>  		goto release_regions;
>  	}
> 
> -	/* check for msi interrupt support */
> -	ret = pci_enable_msi(pci);
> -	if (ret)
> -		/* msi is not enabled */
> -		irqflags = IRQF_SHARED;
> -	else
> -		/* msi is enabled */
> -		irqflags = 0;
> +	irqflags = 0;
> 
>  	addr = pci_resource_start(pci, 0);
>  	adata->acp3x_base = ioremap(addr, pci_resource_len(pci, 0)); @@ -
> 112,7 +105,6 @@ static int snd_acp3x_probe(struct pci_dev *pci,
>  	return 0;
> 
>  unmap_mmio:
> -	pci_disable_msi(pci);
>  	iounmap(adata->acp3x_base);
>  release_regions:
>  	pci_release_regions(pci);
> @@ -129,7 +121,6 @@ static void snd_acp3x_remove(struct pci_dev *pci)
>  	platform_device_unregister(adata->pdev);
>  	iounmap(adata->acp3x_base);
> 
> -	pci_disable_msi(pci);
>  	pci_release_regions(pci);
>  	pci_disable_device(pci);
>  }
> --
> 2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
