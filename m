Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 935841D956C
	for <lists+alsa-devel@lfdr.de>; Tue, 19 May 2020 13:39:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E1DB1174C;
	Tue, 19 May 2020 13:38:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E1DB1174C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589888372;
	bh=5CQcoYxj/2WRLhLbD8848tsUsTIlM3kz62fq7smJ+uM=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n+D+3XkyJiQhq2LcIPDj9HIV0H8UMxg7XoNaqScRT9gk9rITFekT8ucgcBrzObYT2
	 TVtjGA4luugTR87tpIomuSgQnvgh5+GRPgj4ZL0xzTLuTaNw+QUyBbRILEA7FCQ6Fp
	 HSvp+SQ3MtJ9xBtboI8SCAUBN1ITlS25M4q1aVdI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A243F801F8;
	Tue, 19 May 2020 13:37:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24808F801A3; Tue, 19 May 2020 13:37:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2083.outbound.protection.outlook.com [40.107.237.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8DBD6F80132
 for <alsa-devel@alsa-project.org>; Tue, 19 May 2020 13:37:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8DBD6F80132
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="LCAX9NP6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kdToXIMT8vJ39Bis/Cu2gp3S7xDTZGsm07olNk11MoyB/M0o+Y7P9msxLMtRbxEx74EBshec3oiIJhHorhiUbVXEzwU/mUjeu9PiAIgXouf/s3ZER63trT8Woqd8PcO6Ezb0Ca95OMioS8o4d7uYbBxhCX/E+h9KXVQYq4K281KoRWHh6Wx0+cd0T6Qv8OnSUh9/Tc7HPP1MGPN2WGZkkLxM+bxBLHnfRadYiW3kduh4yAG65kM39F3cN8R0T7lbQo0V0f13rjo5KJT/E2JMoUGijHTPfGe+f1IeACvpkV7dkF3wsZRkx0vM1KAfth3iqtpGEw/ab1jGZycAvLyE9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v+OtcP1MZRr/eSOd1/rDkC1JEI0fOdYQWjGoxGNrb7I=;
 b=B3eWrIN5yCXtBNqr7QBLTbKAuOYhdf8gB7y8CHNxF4yXKx3bHdgc8weJfr9xdL3r9v4AwqoLLrp8QffoFC3Agc0U8bilOX+3mntypaZrWsvgCNpzsI/F4Dk4lE4PIcYhqdGtyz7GEbh9esP5WxHbpWBL4cVX6lOBURMzxUUj5oIIma0CP3iIoqZv+1KWmfTdg+87PhbgciDC9s//P50pECgQsLb5bWaLtqPmpJJikceifo462Bmg3q++0UOOZeOFhWWtvOgVinccsdd/Lf2BiEPqbVuCSOKSwfG5XHzuPtU9iGTg3vi9PWzLD0W3TSOEUZ+23Lt7y9VMwe0p33ltcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v+OtcP1MZRr/eSOd1/rDkC1JEI0fOdYQWjGoxGNrb7I=;
 b=LCAX9NP6I0VdqXrTFhcC0U+soJQ2ilUoBGe3En/nEvAVWARfE8wqci1Vd8CwZi3oHS/Rdaq8U6+eF+aqV+jtT53iBW5AGhxm6ROXCbm+agId/M/7ipFttuXYj+3fuil1Qt0NkGeH3lm/Vn9wdHav7Q+N6IdIQmt+4R38BJWQm7U=
Received: from DM6PR12MB2633.namprd12.prod.outlook.com (2603:10b6:5:50::11) by
 DM6PR12MB3690.namprd12.prod.outlook.com (2603:10b6:5:149::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3000.26; Tue, 19 May 2020 11:37:39 +0000
Received: from DM6PR12MB2633.namprd12.prod.outlook.com
 ([fe80::ecbc:404f:23ae:616b]) by DM6PR12MB2633.namprd12.prod.outlook.com
 ([fe80::ecbc:404f:23ae:616b%5]) with mapi id 15.20.3000.034; Tue, 19 May 2020
 11:37:39 +0000
From: "Mukunda, Vijendar" <Vijendar.Mukunda@amd.com>
To: Mark Brown <broonie@kernel.org>
Subject: RE: [PATCH v3 08/14] ASoC: amd: add ACP PDM DMA driver dai ops
Thread-Topic: [PATCH v3 08/14] ASoC: amd: add ACP PDM DMA driver dai ops
Thread-Index: AQHWLTg89daDZ+DNCUWdMtLWrSoGoqivRC6AgAAAl6A=
Date: Tue, 19 May 2020 11:37:39 +0000
Message-ID: <DM6PR12MB2633954F20E044F44CA89D5497B90@DM6PR12MB2633.namprd12.prod.outlook.com>
References: <20200518171704.24999-1-Vijendar.Mukunda@amd.com>
 <20200518171704.24999-9-Vijendar.Mukunda@amd.com>
 <20200519111907.GD4611@sirena.org.uk>
In-Reply-To: <20200519111907.GD4611@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_Enabled=true;
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_SetDate=2020-05-19T11:21:19Z; 
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_Method=Privileged;
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_Name=Non-Business;
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_ActionId=c4237311-7f07-4089-b0db-0000493c6a1b;
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_ContentBits=0
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_enabled: true
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_setdate: 2020-05-19T11:37:37Z
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_method: Privileged
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_name: Non-Business
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_actionid: 381bd59a-8a8e-4679-82a1-00009b282616
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_contentbits: 0
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=amd.com;
x-originating-ip: [124.123.31.218]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 6f725035-b300-4ebd-4d3d-08d7fbe9091b
x-ms-traffictypediagnostic: DM6PR12MB3690:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB36902D0C111F55B9AB5E749497B90@DM6PR12MB3690.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 040866B734
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GyQwgs0CeXF2WYy/y1uFbV4zDrQbh+tT2nS3Kta5ZnE+919tsQ8JE6BJxdicyoX4TOrCqz9O3okLpY7Rad3dRVenixz10hLsXGam3EPkE4mejBQVQncFUfh2xZqLsYOkGn2/cg6hL5SVO0wJcbTyb77ZtQ5f1r8ZBgH7aO+ZkaH0+f6dgzljyArgkY+MMj5QmCp/AisfTG8+N5uVI7zSM5z8fPhFW8XZRaeEnQnvo5Vg2Rtsi+6qWavclPJTfIfOkDbdjTWTKfk0UDTNJgKdpjscNlOHOR6hc8TPE1LHUYLJs6PAvysb2v3GpU0fcm+sVzzveg3v1313OLKXdF80LTxT2Ig6Wb1BtwrXBqxInhl/AcSSgwxbxnf9Igkf6iDs/TuBb0i5yxsG2TpAvJRAhq7+R9Vwe64lxfV/27EWrl7jfEOf9PmNC/SmyBcJO/Zt
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2633.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(376002)(396003)(366004)(136003)(39860400002)(26005)(52536014)(5660300002)(8936002)(71200400001)(54906003)(316002)(66946007)(76116006)(86362001)(66476007)(66556008)(66446008)(64756008)(186003)(478600001)(53546011)(33656002)(4326008)(6506007)(55016002)(8676002)(2906002)(6916009)(9686003)(7696005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: VZGYwbKloHMO2NtkRmXQs4eTQVFvwuYka+vw4M8NhqrAx9wu03NON4iNx5EvhNBc4YBdapA0kWl87iDHHulBF4wGYEGCyEf/XwYWhXWW6ZWBId0gvNzNrrpR8roKa8ICXGnvD3NqxlU66+UbAllQkUDwlINiYVmo5yCsS6R43xcrQs6ni+u3IdsNAwxrSTPxLsr5HN7TaQs+TUISazZKEwn1MAWOQGw2YgI5lEfb0oK1hW5LTMgo4YrsFqEl/7ohZjiQv643jyY/KMxWCdyEzuG87joTRv4dQJcyy5sxuhA0BKYUbYdJpuVpDlsYeRE0BMa9VpigJ1t1rktjg+T8dlzERAI1wROlu4SFXW/x+GLAOeUrdQTW96wE1OpBFrY/Edx9592bVJf+8WGSetCustzc7cTB0CgEDY8zmpXHvZ3yfY8uMrQVGPX1Gp+rvUw8Ua0i9vy6PrCjj32ZmXpeJlt7mtV04pLhhZDSMGVf8PL90KB/+pkT3K616RvCXFjH
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f725035-b300-4ebd-4d3d-08d7fbe9091b
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2020 11:37:39.3581 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OewIY1h5eDEreqOJT+EGdkDUmr7a7i2PjYlfbkaz6wz7K/sUsGHWQ3xQ/WZDwunYudl/C9Iv+33XnO4gfId+jQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3690
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



> -----Original Message-----
> From: Mark Brown <broonie@kernel.org>
> Sent: Tuesday, May 19, 2020 4:49 PM
> To: Mukunda, Vijendar <Vijendar.Mukunda@amd.com>
> Cc: alsa-devel@alsa-project.org; tiwai@suse.de; Deucher, Alexander
> <Alexander.Deucher@amd.com>
> Subject: Re: [PATCH v3 08/14] ASoC: amd: add ACP PDM DMA driver dai ops
>=20
> On Tue, May 19, 2020 at 01:16:58AM +0800, Vijendar Mukunda wrote:
>=20
> > +static int acp_pdm_dai_hw_params(struct snd_pcm_substream *substream,
> > +				 struct snd_pcm_hw_params *params,
> > +				 struct snd_soc_dai *dai)
> > +{
> > +	struct pdm_stream_instance *rtd;
> > +	unsigned int ch_mask;
> > +
> > +	rtd =3D substream->runtime->private_data;
> > +	switch (params_channels(params)) {
> > +	case TWO_CH:
> > +	default:
> > +		ch_mask =3D 0x00;
> > +		break;
> > +	}
>=20
> The TWO_CH define isn't adding anything, and I'd expect there to be
> invalid channel configurations this is rejecting - at the minute this
> just boils down to an assignment.

Currently we have added two channel support.=20
As of today, as we restricted no of channels to 2 , there is no point=20
to check invalid configuration.
It kept for future expansion to support more than two channels.

>=20
> > +	config_pdm_stream_params(ch_mask, rtd->acp_base);
>=20
> Does this function have any other callers - is there a need for it to be
> a separate function?
Current ask is only to support 48Khz, 2 Channel streams.
This is kept for future reference.
This API works as place holder to expand the logic to support multiple
sample rates and no of channels.
Even we can discard this API , do in it calling API itself.

