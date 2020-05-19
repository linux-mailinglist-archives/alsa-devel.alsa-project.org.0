Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 285591D9579
	for <lists+alsa-devel@lfdr.de>; Tue, 19 May 2020 13:44:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9DF4C1753;
	Tue, 19 May 2020 13:43:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9DF4C1753
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589888649;
	bh=b7t6ca+cw8K2e5sg2NMQcbLQS9DFysWhOZI+08FjgYs=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EluhoZBG/dcoPHGQBwmLS4qzR2vPCqFXuNHKVWsDv63dNA+gxpysLWqbDixlaZqm0
	 2SxEBy8lplrvRYkOdrx/SWo9vqxYQUM2Fi4urp4jL4BlK8QmU5+5r08QwfeXxqb+q8
	 XQnEplrFysHfKne8Lp72vPCmVCDE8c3vAHrNtRwU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CB3C8F801F8;
	Tue, 19 May 2020 13:42:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C28B5F801A3; Tue, 19 May 2020 13:42:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2087.outbound.protection.outlook.com [40.107.93.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5AB87F800C9
 for <alsa-devel@alsa-project.org>; Tue, 19 May 2020 13:42:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5AB87F800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="wrL9CTHP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UGWudvvlQ4JHfiVmefFrwz8ZORa1ZTHIa+NpQ72FldongIhXN2trafCzGRsKHeeOGfz80PO6h7VJ42E3HuwNVubYG1odHtaGLxtqJ3YryfHpio5oxz1wLHcO8G8XnqoMs0A5ihq+SSov3QJLWZKobLqOVpsc8KHmvJ+FqkXpRUQsOFmMstpUgS4t/AIBvjBeiZTomjAzG7e8eNfAfE7phg/CSfV/0pDXjlwg3j4QENG3WWn6PDp0Cr5PdfO8UkCKInEEky/br17FpgNkwt2W38ar2xBtkP+T5cduFTOEY3xwl6Adc7+sr2j21scPDwUllII9ZfWkMC079Dk9017CjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3T+Yq1Bywae1oCrSBZzeg6GMFeh3JmT1oKpUQqvKlT8=;
 b=D4NZ/SrhyIKjZMm6r5pGqBJRQm9tFVQjDtAkubrBux1O3maphIJQX23dvBh3kd2WnOAOKnTihIhjPbtrUsqh5rMvlIa5bXZ4FQ06mB4e292bcDbN+DH2HdcfsQR9WrAeB2we/88iiMJAhFykSFpRrNjZLeK4SeBRB44b8wZCKF5o8sMW2wzj8qUNooRzgVWGATEAfe/jTNqB08jBp90iUc5W2Eg0VifyUihz/e17FB7CKyNBhjaotvLJ9yjPwklzg/NB/pZtN886Hvp3XLMifUE13R/wMRGdf/7goTZ8e1yg1BD7TY/YhOZV97PzXJ7qNvStqVd0FImixM5FdEAD1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3T+Yq1Bywae1oCrSBZzeg6GMFeh3JmT1oKpUQqvKlT8=;
 b=wrL9CTHPcYOva+K+q6syo8trjRw2a+TX5+b1fjf2ArJ4AytGSmvwLpqrc8HVZCI0SCBK7nPTLMkLsIq7gL8IWRwLxzxFRoy+/vTCZ5N88GgnbqBkxSMXl8VDDlH5014izvFSh+vDR32tjx5aj/KVoSTUS9tpUbtwCLF1f9mnCG8=
Received: from DM6PR12MB2633.namprd12.prod.outlook.com (2603:10b6:5:50::11) by
 DM6PR12MB4417.namprd12.prod.outlook.com (2603:10b6:5:2a4::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3000.20; Tue, 19 May 2020 11:42:18 +0000
Received: from DM6PR12MB2633.namprd12.prod.outlook.com
 ([fe80::ecbc:404f:23ae:616b]) by DM6PR12MB2633.namprd12.prod.outlook.com
 ([fe80::ecbc:404f:23ae:616b%5]) with mapi id 15.20.3000.034; Tue, 19 May 2020
 11:42:18 +0000
From: "Mukunda, Vijendar" <Vijendar.Mukunda@amd.com>
To: Mark Brown <broonie@kernel.org>
Subject: RE: [PATCH v3 08/14] ASoC: amd: add ACP PDM DMA driver dai ops
Thread-Topic: [PATCH v3 08/14] ASoC: amd: add ACP PDM DMA driver dai ops
Thread-Index: AQHWLTg89daDZ+DNCUWdMtLWrSoGoqivRC6AgAAAl6CAAAVNAIAAAEjw
Date: Tue, 19 May 2020 11:42:18 +0000
Message-ID: <DM6PR12MB2633BB525EAA8BF6448E867A97B90@DM6PR12MB2633.namprd12.prod.outlook.com>
References: <20200518171704.24999-1-Vijendar.Mukunda@amd.com>
 <20200518171704.24999-9-Vijendar.Mukunda@amd.com>
 <20200519111907.GD4611@sirena.org.uk>
 <DM6PR12MB2633954F20E044F44CA89D5497B90@DM6PR12MB2633.namprd12.prod.outlook.com>
 <20200519114012.GH4611@sirena.org.uk>
In-Reply-To: <20200519114012.GH4611@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=true;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2020-05-19T11:42:14Z; 
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal Use Only -
 Unrestricted;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ActionId=739c9284-717a-4261-8fac-0000da83075c;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=1
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_enabled: true
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_setdate: 2020-05-19T11:42:14Z
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_method: Standard
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_name: Internal Use Only -
 Unrestricted
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_actionid: dfc7a94e-de36-4022-8148-000033cfd22f
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_contentbits: 0
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=amd.com;
x-originating-ip: [124.123.31.218]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: fe1e20ce-8536-429c-2511-08d7fbe9af31
x-ms-traffictypediagnostic: DM6PR12MB4417:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB441789B8B1A07B55E024FE0297B90@DM6PR12MB4417.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 040866B734
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1Pb3Ifpax+a4CKJovSp2pc08Lg30GG5iXIf6fmBzXRzZDQQbbN84dLgMiPLErKOOgf9MOuK6cpD3o7b6qdEaV5xw5AQWB7MReID3iT7/jLWWYFuT7+x24obTPGYlDS+eKIG7275kRcUj6+GaqMUzcqptdyJ9BCsSB2qH8m7qroJY0R/2ZPWw1de5m7vRCVCuGc9CttS75xE6YeHaK/s/rmf05QBoMReTyDPlsToqQKIjfzZ14T51n7DyX40DFKRmKEqQwQ9XFLPnSD3KD2TbHOwsLNxtF4srxdQoH49CE/ZjubXxAgxEiMi8PjAJ/3Bh/WDEr/BdaNZTTSShYcMyhT6QCuVSwcpC39aGqSFXUNxQX9ZU3kunfPuzM7uabP9yZLcJcvwDJZ0tc6MyUK+Zuga4KcxL0CyCoet4uaA1CUB3y+FSJRF/CwVS3iGdQZI4
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2633.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(396003)(136003)(39860400002)(346002)(366004)(66946007)(66476007)(52536014)(66556008)(64756008)(66446008)(5660300002)(76116006)(6916009)(478600001)(33656002)(86362001)(26005)(54906003)(8676002)(6506007)(55016002)(71200400001)(53546011)(8936002)(4326008)(9686003)(186003)(2906002)(316002)(7696005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: gRqG99Rbgpx97p9Rm8iprXjQ7EFjCY7LO1Uh2WNiMqK/EhY0cDFduGjIlArVNzLUXlPFq6XdQ8fuZnweHch+qAwDFGhJp58FUoYQZMJJfBcsRBjv66tCbs9QHnnSCiSN5PM4/vRVhh/4jvec4q6MJ1eiWM+gYiXzj3bMnaNA5vS8UBYgk662u/JRYiNZ3Zpvr+vO1t7yll52rlY+8B3Y1pTevUMY+XhCW/tB6h0Vq7NciNcPsH2GBu/1lHkz7cKgpBYcw642Sq6qF7f3E02hsxtf0B4A9eSTPNhI3AcawDVnVL1mUiC/M2f1fgvpYmWvXtJyqg7cNk7QbRc9AAyTEXUuCUjcnSg013VcmHdJhnNlRSiYyDdfSspoUS+W3hbPHB6VhxuhBMNazj4Dkv9Zplz+8fUkQ7614iSK1FeksVXQqkEPkWhQBsYhTbyKZYWeDQPL7XSuKG2ImrNDzRGM4i12vI8kNqpLjq4dbT1pTjuoSnRrwgmkVCQNs6WGy5UW
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe1e20ce-8536-429c-2511-08d7fbe9af31
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2020 11:42:18.0700 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dFzSthsLzGWGD7ye3lLnKM9gnYbwLrQkGw+z9pFSAxmHqeEofMqH7LCO6iVwVV8xG9G7pPoULxvRoa+Xcab/HA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4417
Cc: "tiwai@suse.de" <tiwai@suse.de>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
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
> Sent: Tuesday, May 19, 2020 5:10 PM
> To: Mukunda, Vijendar <Vijendar.Mukunda@amd.com>
> Cc: alsa-devel@alsa-project.org; tiwai@suse.de; Deucher, Alexander
> <Alexander.Deucher@amd.com>
> Subject: Re: [PATCH v3 08/14] ASoC: amd: add ACP PDM DMA driver dai ops
>=20
> On Tue, May 19, 2020 at 11:37:39AM +0000, Mukunda, Vijendar wrote:
>=20
> > > > +	case TWO_CH:
> > > > +	default:
> > > > +		ch_mask =3D 0x00;
> > > > +		break;
> > > > +	}
>=20
> > > The TWO_CH define isn't adding anything, and I'd expect there to be
> > > invalid channel configurations this is rejecting - at the minute this
> > > just boils down to an assignment.
>=20
> > Currently we have added two channel support.
> > As of today, as we restricted no of channels to 2 , there is no point
> > to check invalid configuration.
> > It kept for future expansion to support more than two channels.
>=20
> You should still return an error here, if nothing else it ensures that
> this gets updated when support for other configurations is added.

Will fix it and submit the incremental patch.
>=20
> > > > +	config_pdm_stream_params(ch_mask, rtd->acp_base);
>=20
> > > Does this function have any other callers - is there a need for it to=
 be
> > > a separate function?
>=20
> > Current ask is only to support 48Khz, 2 Channel streams.
> > This is kept for future reference.
> > This API works as place holder to expand the logic to support multiple
> > sample rates and no of channels.
> > Even we can discard this API , do in it calling API itself.
>=20
> Even when you support more configurations these will be configured from
> hw_params().

Agreed. Will fix it and post a incremental patch.
