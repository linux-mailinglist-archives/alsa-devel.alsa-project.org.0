Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 300AC1C7694
	for <lists+alsa-devel@lfdr.de>; Wed,  6 May 2020 18:35:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC93B178E;
	Wed,  6 May 2020 18:34:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC93B178E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588782899;
	bh=q64K6XOW7NaEHY4d3f9qDchnxMtVTWNtkMRHmirXklg=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=piC0viDleTN4tvHxQsGVcrcFFRT4tPrH4yoUbadDY7WjR3DNfmbvDNRMXGuMge88L
	 bUVQVmbJuF2LQ7otBLkRARayoVsFmkKngRsn+IsEbMWJmPLfvvmrxd3j8Ek8rm+Sx/
	 l7nFBGEv1GIKqlZV5iVMeqtejjlG7ERdpCPMFKdU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C5373F800AD;
	Wed,  6 May 2020 18:33:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B15BDF80249; Wed,  6 May 2020 18:33:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,PRX_BODY_30,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061.outbound.protection.outlook.com [40.107.94.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ED547F800AD
 for <alsa-devel@alsa-project.org>; Wed,  6 May 2020 18:33:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED547F800AD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="leKThqNB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aOm7icB2T0EO0pofG+4oeR7iMOCfACvDoM3N3WCOEEq/pmlQfEshhPMRYenciXbD0o3onh8JQ93QGXGiTx66Y1Jx4sDuHmjMvfAJDhefceZG72IUXYWgYHBtzNRKkkcPdl6kNJbyJAq+bGmli9uljoNUBBE7cD6YZMDtWqZoS7nwdYgrf/KiHlvCG1LVfAbDmvTBgwi/mrxIc3vQ7Z2LwxvwgucrxvJvRRaIRu735uyssazlUFzdHNq5NWDDVRN4TujTpK0adv28AsFIAachgutwVW2xiMKEkCdxmXhPtNRKMo473TovyIwiQ65rJ9izA7p0WgiR52F85jrhCiaAdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XaGIiKQOSh5bTmBiE2Lb4jtRuxo6MybdEqjOiYegPOM=;
 b=CUsi6GQOxFw1IAPvwcvQWhc4QoBHVgdUwQ5fGQiWxR9sgx6dDWaG8tdenbnJc4L3SvDrcU3phUecyiJgb50mN5uAe0p4k8BHmH0HgQNjTYqZ9qGiaaho1hxEyR8/Rv0+g2HC/qcP19bnJJcKYUDMldOflYvZmRsYkM1MtPSJ69HaAR+RB/0h+TEnb309HT7+w8VQ1V2qKRRjjfcWSnN6ZaWN2bEebflm2L2AjCharKDj/TiSbOeezCUffnijEr7Yo/jBY5ACXlkHZ7HkXIe09r3yJa2mbqsL6j2e3R1bZAiORoeOIUfHvjlU0FUEHufd24SXt0GFk0UOQJy3px1EIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XaGIiKQOSh5bTmBiE2Lb4jtRuxo6MybdEqjOiYegPOM=;
 b=leKThqNB/1r1ZZmefdb+w8QUDdwpfYTjr89X+0IC1/dviy61YETX99GQ0PSAgA/b3RAsum9rmslIVM+PU8sAtjWHpFDStNRkadmw+2aKmdIRqF9iqYY/h0VJSN000tfKetnfgalAYlr43p+jJRu/hztCUxougiYAg5LdVTYQI0k=
Received: from DM6PR12MB2633.namprd12.prod.outlook.com (2603:10b6:5:50::11) by
 DM6PR12MB3642.namprd12.prod.outlook.com (2603:10b6:5:11f::29) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2958.19; Wed, 6 May 2020 16:33:00 +0000
Received: from DM6PR12MB2633.namprd12.prod.outlook.com
 ([fe80::ecbc:404f:23ae:616b]) by DM6PR12MB2633.namprd12.prod.outlook.com
 ([fe80::ecbc:404f:23ae:616b%5]) with mapi id 15.20.2958.029; Wed, 6 May 2020
 16:33:00 +0000
From: "Mukunda, Vijendar" <Vijendar.Mukunda@amd.com>
To: Mark Brown <broonie@kernel.org>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>
Subject: RE: [PATCH 14/14] ASoC: amd: enable build for RN machine driver
Thread-Topic: [PATCH 14/14] ASoC: amd: enable build for RN machine driver
Thread-Index: AQHWIx9eubSxPmQRlEGSeiFcD8Q7b6iaBRqAgAE6+ACAAACSEA==
Date: Wed, 6 May 2020 16:33:00 +0000
Message-ID: <DM6PR12MB2633B92B19B337A72B64D0B397A40@DM6PR12MB2633.namprd12.prod.outlook.com>
References: <20200505205327.642282-1-alexander.deucher@amd.com>
 <20200505205327.642282-15-alexander.deucher@amd.com>
 <2a8891ec-d162-77ed-8093-6c7072b6b8f7@linux.intel.com>
 <20200506162656.GH5299@sirena.org.uk>
In-Reply-To: <20200506162656.GH5299@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=true;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2020-05-06T16:32:58Z; 
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal Use Only -
 Unrestricted;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ActionId=8bcbc65f-bdad-4007-81e3-00006716801d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=1
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_enabled: true
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_setdate: 2020-05-06T16:32:58Z
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_method: Standard
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_name: Internal Use Only -
 Unrestricted
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_actionid: 4bbad922-bd1e-4a3e-9902-0000d789eef6
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_contentbits: 0
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=amd.com;
x-originating-ip: [165.204.159.242]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b08efa88-cf7a-413b-7070-08d7f1db243e
x-ms-traffictypediagnostic: DM6PR12MB3642:|DM6PR12MB3642:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB364211F8522B88211622736097A40@DM6PR12MB3642.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 03950F25EC
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tfzkccKJ+FzHP4W+cWf4Gezysa0s1V0QAIpm0prnHh0HJJjH0Gr2+8TLXpvv/rz0ZcCeN9nw24Edw7JhNaCJwL7JFaRkqAx3Ati32NOucPZLWLgoEZcfKqN//wvFr+31jIanLQVT3O0Muj0/KPmRLgf46/LGBsxcqJMN/5A612rsvNwo+ujn/tlWpqj2wyoksxjb7tWEqiLXdMO2TxfW2QvZhc+Scr9FU5ZkNm13lbXiRJneDiLyJhc1TCQ7whVaihhp2wCeLYdZD+dl6Gx95nw9cUBEZAb+0MiMwc50OahcHwax1d95/JuaZHCspFiuSSvJzLWdq5kmZe1hXZ3udxs8gobSOOz4SYB6obn5aPYxqupkFaJg9Ngx7WqCSFGbQSQp0htGKZoUZbHr1/LuprcKUHFTV/Ng2sRkr4L4ay6aR+pleP8rEF8uJgxscfCkXmRBQjo/zHAoU3i7HdNaj76VkbxLXPYNyl4WWFFL1//bnFSO8upezyvhpZJUokTt/uJaG+mKlCU5GtbAW5w2jA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2633.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(396003)(39860400002)(376002)(346002)(366004)(33430700001)(4326008)(71200400001)(6506007)(186003)(26005)(7696005)(54906003)(9686003)(55016002)(110136005)(5660300002)(86362001)(66946007)(64756008)(66476007)(52536014)(53546011)(2906002)(8676002)(33656002)(66556008)(76116006)(66446008)(8936002)(478600001)(33440700001)(316002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: 28dtOB6GUrqb/vetEIPpKtbtuDWNijgrsh1Chbzua6552dkGr3gQnC4ovsZBvy3rsLVbqmhoXaP8EN/DTw4HE8ncmladQBjhwJzclhAAq5QHWoF1p4JpxE+mfFhjRxv/QzNHqBwGiqpEUHUaJLWxheJoXzFJgccKkK0ZDRhef4h4U7lsxiqnnJnGQhq1CO7Nx2oMuY+cqQ5u8i+2UC9AA/hb4EaZBtNT88I7+RhVHPpo0BPYfaw2pYGTANVuGrRn+b15s1BLfSn28H4YPmNIPqUw3NeXkwiYG7yB+0sPwBJ7qLFanvfTB0uB4soP83jeMd1J6F2+28D6L047N+ZOcO8atSi5dhKt27l51Oykr+k1BrIrFmXelXdapw3Ti06+gPUm+vIs+6tj5gKQT2PNZlnTMrJrJC7p6B59UZQjCWk/po6bnWL1l23xH31XdnQjtFFMAPGnV2oX66QBK8T/uQg+Zm6uEPvRxkzI2AZ2/BRTDRFNDodXZc/l22p6jQEsLil9rLTU8NkdZRqpW6bBhNHbu1seTodd4XzOpvuXszKoPC0kvV9eY0fwvARSNAjx1g3x6qCWScDg+Fy0zgn02pQivgOq7A9eYLghdWnbEdBRbcp2eaSPBOq4g9e8ip9pakdzoqWlK1RAptAtQzOFslA4rg+b/Um9tJxHitpXf6rBDc069YKOdFCc5smcx8zpWe3j9EwvxfZ7fP4KF1Mw/7cWQp8yV3z2WzaprubPuh2heTvo0xyiNBbQPF6F+4Bmj16SlVmBw+w8wdDHlXtji3ZOX3ijTEfNckpxNs5cFDm3cT8+VdHppVqNunn5QvAw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b08efa88-cf7a-413b-7070-08d7f1db243e
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2020 16:33:00.3178 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CMJLOOuzFhX8l4vUtxdXp4+Ijzu9TlrQcuIzs1H2GsmR3oLrMCD/wEEmA9196ghaop4cdBuccbD4z7hvZ4J+ZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3642
Cc: Alex Deucher <alexdeucher@gmail.com>, "tiwai@suse.de" <tiwai@suse.de>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "Deucher, 
 Alexander" <Alexander.Deucher@amd.com>
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

[AMD Official Use Only - Internal Distribution Only]



> -----Original Message-----
> From: Mark Brown <broonie@kernel.org>
> Sent: Wednesday, May 6, 2020 9:57 PM
> To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Cc: Alex Deucher <alexdeucher@gmail.com>; alsa-devel@alsa-project.org;
> Mukunda, Vijendar <Vijendar.Mukunda@amd.com>; tiwai@suse.de; Deucher,
> Alexander <Alexander.Deucher@amd.com>
> Subject: Re: [PATCH 14/14] ASoC: amd: enable build for RN machine driver
>=20
> On Tue, May 05, 2020 at 04:39:37PM -0500, Pierre-Louis Bossart wrote:
>=20
> > > +config SND_SOC_AMD_RENOIR_MACH
> > > +	tristate "AMD Renoir support for DMIC"
> > > +	select SND_SOC_DMIC
>=20
> > there could be a missing dependency if GPIOLIB is not selected
> (SND_SOC_DMIC
> > depends on it).
>=20
> That dependency is wrong, DMICs don't need GPIOs so while a given system
> might need DMIC the code should be fine with the stub gpiolib
> implementation.  It will mean it won't work on some boards though.

For our current implementation, we don't have any GPIOLIB dependency.
We just need a generic DMIC driver which should provide codec dai for
sound card registration.
