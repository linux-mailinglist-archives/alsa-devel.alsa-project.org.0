Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 38433209FF8
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jun 2020 15:33:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BFF7618E5;
	Thu, 25 Jun 2020 15:32:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BFF7618E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593092002;
	bh=FtQ+f95E3VY+hogAg90reJHSMcjuVCrNC1EGFpEIfLI=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NS72Yrqrj62SarSakEt/Qb22F8WPpxgsKg57V8Y2bvhnjViYXJPQehnC508oDb9Cv
	 Xazwg9ZxMrd3bXgCgVg48R+u3FI7LbLpoUIfy1N3EMSrGZSMxlaYEhjpLe4tkSzpeR
	 B8/2/s6xnrzBr+a1XK69xcDiMTWZ4rCC+H2WRnis=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DF61AF800B2;
	Thu, 25 Jun 2020 15:31:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 68D59F80234; Thu, 25 Jun 2020 15:31:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2085.outbound.protection.outlook.com [40.107.94.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AA701F800B2
 for <alsa-devel@alsa-project.org>; Thu, 25 Jun 2020 15:31:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA701F800B2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="NixuBYY8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n76mH/xSwXdTnmH7SAmz4JL4s/BUbLXnnTVmeVUWUkz2bz4713NehLZV88Tom08Vc0Q68J6rTfOCySZXKpdrb6En9ilfKj6EQea4zaJxcwNauiaP2Sb4s35GY6AHqWhCus5ydBC/tnAFMiOs8gOlrYSCiaYMX3bVfysESN2ADe2GQ0xCNs/wM31CIPn9TED1y3X9JLZfiLBi4nT6+HP+1Q4zyur6tW037w1M59Ex3rqCIBuE/3/pIVvNBGLdkfbGN6SfL5cJNeuWlfNqSuZJgnZszhREAbZxTz+JxfoWUzyf7RzYA8irDDRC8G5ILWHJ3BjegorUl+4h5m89p/P0qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LYt/OFa32NNVhg8Zv7pTw9hLtGChQKxrPGGc+X8lhnM=;
 b=DcD7tWPuK9N8CLHgtQlBVVRB1avZ9dRt3coKx10fvdbc2pBjJ5pRqFTwccsAlVJQNkASElwsA0wWSsm3gEBEl1oa+H+rp9v0YaqWd/z6PR0Af7JaXf78oQCPmSuizCWcevCGnlkpBxaLQGJT7bdXuZ+Y5gS+NGpVtFcLY8/RgJycKCmt5qgo7MGuMKzr6WZuVjW6XN2UOMtGTLW2oWgyCFBxY2xpDZEhv6WpxAmiZbiwmd/U2xTG6cC7MWT+DSQAo342opT1bzI7is/WzGiKv7vfQ9Sa6CyrBUTdCg6k5bnWmGHuPZREQNlIL/YDyaMQVmEdIXNnnmTAOjwWGzVGCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LYt/OFa32NNVhg8Zv7pTw9hLtGChQKxrPGGc+X8lhnM=;
 b=NixuBYY8PM2EaHoXWPe4sb1SzL563i7Y7Z4eT1T0xrvrL6Gaj0BCth5O7mn3os9OsYmf+yBa/jpnK9Rpq9ekaUxv6TfaByGEa1BV4lMLsoPT122ovO0/lyHL96QczdFHg+9TfXPbIuD/7gnhwzov76IcJRET5tpYfaccGy8/l/c=
Received: from MN2PR12MB4488.namprd12.prod.outlook.com (2603:10b6:208:24e::19)
 by MN2PR12MB4256.namprd12.prod.outlook.com (2603:10b6:208:1d2::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.21; Thu, 25 Jun
 2020 13:31:29 +0000
Received: from MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::313c:e4d2:7dd2:2d72]) by MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::313c:e4d2:7dd2:2d72%4]) with mapi id 15.20.3131.024; Thu, 25 Jun 2020
 13:31:29 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: Jaroslav Kysela <perex@perex.cz>, ALSA development
 <alsa-devel@alsa-project.org>
Subject: RE: [PATCH] AsoC: amd: add missing snd- module prefix to the acp3x-rn
 driver kernel module
Thread-Topic: [PATCH] AsoC: amd: add missing snd- module prefix to the
 acp3x-rn driver kernel module
Thread-Index: AQHWSuf5Y9r77/JLr0+kfRfUFtPFHajpU8fg
Date: Thu, 25 Jun 2020 13:31:28 +0000
Message-ID: <MN2PR12MB44882B2936E59EF361C7A371F7920@MN2PR12MB4488.namprd12.prod.outlook.com>
References: <20200625115829.791750-1-perex@perex.cz>
In-Reply-To: <20200625115829.791750-1-perex@perex.cz>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Enabled=true;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SetDate=2020-06-25T13:31:17Z; 
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Method=Privileged;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Name=Public_0;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ActionId=e3ae3ab8-7e84-4547-b249-0000312bc0f9;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ContentBits=1
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_enabled: true
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_setdate: 2020-06-25T13:30:58Z
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_method: Standard
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_name: Internal Use Only -
 Unrestricted
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_actionid: 1b5a4d35-db00-4d72-90f0-00009b4743f6
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_contentbits: 0
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_enabled: true
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_setdate: 2020-06-25T13:31:26Z
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_method: Privileged
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_name: Public_0
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_actionid: 073cb538-9ee3-4143-b7d6-00009652d6ce
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_contentbits: 0
authentication-results: perex.cz; dkim=none (message not signed)
 header.d=none;perex.cz; dmarc=none action=none header.from=amd.com;
x-originating-ip: [165.204.84.11]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 7c97079f-9f49-4cbb-8058-08d8190c1129
x-ms-traffictypediagnostic: MN2PR12MB4256:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB42569BADAE70FA5245F6F6AEF7920@MN2PR12MB4256.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:323;
x-forefront-prvs: 0445A82F82
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: f4kbXUEXCgfZXUt0xLOugqkv4E5NcBCnrlwVHg6SeNS37ncgNu9QtHGP2W+qtNsUGjKkQlZd3cQZN+xn0xKMg8tNtv4t01MAz5p+//OXlsg20bQbYcTPpYkoDZOFc5lP/7Xn6t4FdDCPEfHz1QAcXbH1M1TNOzLZKCS1CfVrVKNygrthDakZD7fZ+6KiiTrE6A1ReoWXfkRF3LL6QA7QAhdPk1H7WMuWKfhsW9SPy5D8zTXM70wBHG6EOZnc3RjuKBA7VqroDDZPbEqnACxpE+1GxTuQdxiBgB0qUJ0u5qArnSwc1v0dZEC/e6wJQrTEjv76+FN2Vo/G+nE0+p7teUGNFKuJTI8xtHDMZzH/S6NGi88QWN3RAkFOT+mEJn77
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4488.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(376002)(39860400002)(136003)(366004)(396003)(76116006)(8676002)(66946007)(66556008)(33656002)(66446008)(66476007)(4326008)(478600001)(64756008)(316002)(5660300002)(8936002)(83380400001)(86362001)(186003)(52536014)(110136005)(53546011)(7696005)(9686003)(71200400001)(26005)(6506007)(54906003)(2906002)(55016002)(32563001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: s6EFaSGWFaP/qMFkWnkuzJAdPF29HG17d3VjsVnKuTMTVCKhBg2D1rhQRYCbrpRlgn7CH0tdOwew2tfvolUQ0lVEcXokjVaZ87Ql5lD1cEfavbhKdAno/B6L8ES8Rr66+CVaOvojhAZdYaQOAoY5m6sipgRmX8zCzKCSIP9ZUQ+2IJ6nFrbeZz1xxzUtPDjuHQH0DdxCfxJvSdBedfdZITAXniE54rT4hAaS+BBnJbMvNkYeh/uAiO46VfpjJEzyUCe7rW4ZzPIOQlW98cf9cJ8U8hzlkd6SQ62o6m99zXX1xYpB2L9mpBBMds2mREmXH8KVdhEYtEX89NcyihydcfnSpvwVSh+rUgK0UVh7v9lZwm+Bnj33AdDWtsu2WEMzm386lERqePLnxnu75Hijz/S4P7tmY+GcIEuhs4tI9QqIZhFbpGlj/k7/zSSy5fpk5dTq+vwWmWfyw5AypKPEupfJs9b9VIM06uUHomE8V1ef5p6k2IyP7s2lT9k23BTB
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c97079f-9f49-4cbb-8058-08d8190c1129
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2020 13:31:28.8929 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xiTXAoAB6/UU3booQeh43OUot+kAUU3yk1z6SnhJ6I0unHa8hcjWb0QM1XGLDp888TvA3xrfxfrL3gT1b7c9vQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4256
Cc: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>, "Mukunda,
 Vijendar" <Vijendar.Mukunda@amd.com>
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

[AMD Public Use]

> -----Original Message-----
> From: Jaroslav Kysela <perex@perex.cz>
> Sent: Thursday, June 25, 2020 7:58 AM
> To: ALSA development <alsa-devel@alsa-project.org>
> Cc: Takashi Iwai <tiwai@suse.de>; Jaroslav Kysela <perex@perex.cz>; Mark
> Brown <broonie@kernel.org>; Mukunda, Vijendar
> <Vijendar.Mukunda@amd.com>; Deucher, Alexander
> <Alexander.Deucher@amd.com>
> Subject: [PATCH] AsoC: amd: add missing snd- module prefix to the acp3x-r=
n
> driver kernel module
>=20
> Signed-off-by: Jaroslav Kysela <perex@perex.cz>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: vijendar.mukunda@amd.com
> Cc: Alexander.Deucher@amd.com

Acked-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  sound/soc/amd/renoir/Makefile | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>=20
> diff --git a/sound/soc/amd/renoir/Makefile
> b/sound/soc/amd/renoir/Makefile index e4371932a55a..4a82690aec16
> 100644
> --- a/sound/soc/amd/renoir/Makefile
> +++ b/sound/soc/amd/renoir/Makefile
> @@ -2,6 +2,7 @@
>  # Renoir platform Support
>  snd-rn-pci-acp3x-objs	:=3D rn-pci-acp3x.o
>  snd-acp3x-pdm-dma-objs	:=3D acp3x-pdm-dma.o
> -obj-$(CONFIG_SND_SOC_AMD_RENOIR)	 +=3D snd-rn-pci-acp3x.o
> -obj-$(CONFIG_SND_SOC_AMD_RENOIR)	 +=3D snd-acp3x-pdm-dma.o
> -obj-$(CONFIG_SND_SOC_AMD_RENOIR_MACH)	+=3D acp3x-rn.o
> +snd-acp3x-rn-objs	:=3D acp3x-rn.o
> +obj-$(CONFIG_SND_SOC_AMD_RENOIR)	+=3D snd-rn-pci-acp3x.o
> +obj-$(CONFIG_SND_SOC_AMD_RENOIR)	+=3D snd-acp3x-pdm-dma.o
> +obj-$(CONFIG_SND_SOC_AMD_RENOIR_MACH)	+=3D snd-acp3x-rn.o
> --
> 2.25.4
