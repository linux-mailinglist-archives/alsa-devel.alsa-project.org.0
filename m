Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 611FB1DE562
	for <lists+alsa-devel@lfdr.de>; Fri, 22 May 2020 13:30:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2563188F;
	Fri, 22 May 2020 13:29:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2563188F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590147022;
	bh=Gg6pm27zJmanKrXUk9rAuGGmwWfiIRnBf/LwfsagsRY=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=t8l2mFWZOWmweShjD8t+FTpgidoNNF7KYDZQJQBDsr/D6fWcc101F+uqVb3VedtDn
	 0Z0xjhpjj9lhBQ1sElXo+zZb5Sh+OP2losJL2dvyHp1f6V51Z7k9BcWRPEGL8TY8SY
	 bD+/VNdtirAfdTHgB8OE4TlW7LZMizZ1ItbF6Sp0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0702F801F9;
	Fri, 22 May 2020 13:28:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3FD63F801F9; Fri, 22 May 2020 13:28:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2049.outbound.protection.outlook.com [40.107.94.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4A177F80111
 for <alsa-devel@alsa-project.org>; Fri, 22 May 2020 13:28:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A177F80111
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="vPJ0yBjW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c+QUMPL9+Aww0yghpgbtln0kSvWcUGX5T1ZjSk8aa7YeJ74qykTh82R97hTyriAmLGOl9Gn6Qb/TSafI17m8ddvkuVZGzlZ/VWIbtG98LaeDif4ZmP1jkHu1RCDy9oMllYXgHn7coA6++C/hkfmPqZ2KaV9SeYvh1T+GA1905WXTLfYBIovVSgsJeCsyERibfH+A6ZKo4qusTYASPcG7MQWoXKgqDBJj5XktXKXIxFjIcXVNSquaX6+R2NF9y3haadcmzD9OhAKd+TTaVStKBJEO5Kk+UYz/GmdWQ8aCIykhYD81bw8+9X9SOPMIvulxwq37lSnG/OrIOcAwB+GsKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LldDpptiq3/aKxcp5b5P+APtPt1iRLkXD7O5YqaMHGw=;
 b=Howg/DG3LkLed2N9Olo4PcV2NeYmLu3nJDW/y7daeMWYfnQXGWSZvI/zGGuazkEPjgTEHrHqBgTMME4Y/d71RrKJl93DYQCpHhQuyFyDqX2HTqX+eT6rrpmkJBDZzsZVhdf0PcCR8lNRcpkoab1bbodeUazNTBT3CqFLrCqAP3cQzBB5/g9DVNBdMEsD0wog5jHFa9c2ssoJhhCwmuQ+xo//JpZVnluC2PbyQKgeYzjUILtmyGKu/GXysf+obixg9KyXfBGful/uPvoTZSOVmRVXcdiA/yHOMYarTOjlaqZ6BKIqXXPt6oD2xMNfCJvIlAG5Y0vjLMd9vCH8vKiTbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LldDpptiq3/aKxcp5b5P+APtPt1iRLkXD7O5YqaMHGw=;
 b=vPJ0yBjWfsGkxk2F/NBmluRAKGCjX4AhEldHERBXWHiW5bf636tddflAPYVt63G3qwdqSNiokGOQ7enidE8b1J4yOuXYUTGmNHSqueIhhHG6fcduIjeWtvgM4O4laZdFlDgmGVAVSz1DWnr2g3bEkGUjgJO+qRxTFm97R3BjScQ=
Received: from DM6PR12MB2633.namprd12.prod.outlook.com (2603:10b6:5:50::11) by
 DM6PR12MB3323.namprd12.prod.outlook.com (2603:10b6:5:11f::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3021.24; Fri, 22 May 2020 11:28:24 +0000
Received: from DM6PR12MB2633.namprd12.prod.outlook.com
 ([fe80::ecbc:404f:23ae:616b]) by DM6PR12MB2633.namprd12.prod.outlook.com
 ([fe80::ecbc:404f:23ae:616b%5]) with mapi id 15.20.3000.034; Fri, 22 May 2020
 11:28:24 +0000
From: "Mukunda, Vijendar" <Vijendar.Mukunda@amd.com>
To: Mark Brown <broonie@kernel.org>
Subject: RE: [PATCH v2] ASoC: amd: put off registering mach platform_dev to
 avoid -517 err
Thread-Topic: [PATCH v2] ASoC: amd: put off registering mach platform_dev to
 avoid -517 err
Thread-Index: AQHWMBGAxjoSFfw9qEKCikUbd/uKQqiz8myAgAAAyuCAAAM0AIAAADWg
Date: Fri, 22 May 2020 11:28:24 +0000
Message-ID: <DM6PR12MB26337FD48A99D14814EB32F097B40@DM6PR12MB2633.namprd12.prod.outlook.com>
References: <20200522081738.11636-1-hui.wang@canonical.com>
 <20200522110811.GB5801@sirena.org.uk>
 <DM6PR12MB2633D541378EB715AC18531C97B40@DM6PR12MB2633.namprd12.prod.outlook.com>
 <20200522112228.GD5801@sirena.org.uk>
In-Reply-To: <20200522112228.GD5801@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_Enabled=true;
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_SetDate=2020-05-22T11:27:23Z; 
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_Method=Privileged;
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_Name=Non-Business;
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_ActionId=9f95cebf-7030-4acd-8f1d-000010077c09;
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_ContentBits=0
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_enabled: true
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_setdate: 2020-05-22T11:28:21Z
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_method: Privileged
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_name: Non-Business
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_actionid: f382d32d-4c59-4007-be4c-0000bd2be8bf
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_contentbits: 0
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=amd.com;
x-originating-ip: [165.204.159.242]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: bf0758c0-b3f8-41aa-7ae1-08d7fe433d6c
x-ms-traffictypediagnostic: DM6PR12MB3323:
x-microsoft-antispam-prvs: <DM6PR12MB3323828306D652D902D5DEC297B40@DM6PR12MB3323.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 04111BAC64
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZIu7bKVs9n44uvHUf8nkuJLhNbsgj03r2UNmeWASNZX/D361FJZwO+WTTNYeo2qn9XQOhpb3Q7dcZBKfbb66WFh0jZ7J/PF3qj9wlfuHdH8FoYeToQ2JyFE2zvykYgrppD1oqPkJ7VDPHdQbC2Xp2wfFnd+cZgxt5cfCxr5SOO9UstuNdQBzSDZ3RmL/9Kc+WZDqB9VLq0q2wLgAxJzD/xXiWDUjHaQlZcp+JNKcfFZrwsPYalGVJZ82k74GtveQ52cT/EDDfxI11XkvcmVBLmsJWS+XidZUswnRplD0W7iImhpHEDfgYnvyO1uVe7R1Jhs9sLZlWEpFfoXf/Dj7XA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2633.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(136003)(366004)(376002)(346002)(396003)(8676002)(9686003)(55016002)(8936002)(6916009)(52536014)(478600001)(86362001)(66446008)(64756008)(66476007)(53546011)(71200400001)(2906002)(316002)(4744005)(54906003)(76116006)(4326008)(33656002)(6506007)(66556008)(26005)(66946007)(186003)(7696005)(5660300002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: rgdtsKZcBSpqed2Vuhq+IHfOdr9oMhhUVHz+niqpgzvg1AzNrZ5tJcoPYWwd8bWWA0XP5snEZEb16yPsvkC4FESUtqGhyZSNonTFCDG7kgmpUFqk54+2/vXBJx5QKfAbgC8ViI91gPbbkP53mLxn/7rlLHyECsY0cXCBYFBHClWKYUR2Xq7NAMRCPMdQQ0Y30vCadDhSicfv6DswTd0H8KLtw/mNeldOnzH23SdGkiKXMi+11JMsnlFWTVexoiG4eyKCMRFJsuQyl8YnN/xdWfEbPEM3w6EeuWdjXW7r7fiR9KsET0GTdhGK3bTT4uqOgL9Ooudu4A6vqp8CbYy+D2dBArNXjsnPDseiFTmL7GgQpUEc8lTXO6Qxxgm6cE0YActqRvaHCrfHTyLyfu9n8KM2B0mhyaj0csAyVspZEQwKC35eutHkYdcXgp1OPvFeKoOht5JjCdFzTTIc2nuJJRL5JKyBbudx0V6C08TIHWwPQWhQjimKbXgCqF7G0UzN
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf0758c0-b3f8-41aa-7ae1-08d7fe433d6c
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2020 11:28:24.2038 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sTf1qoHJxkUjKKG0T/X8U4pbqSKRn/HZewqRtDpEB+Cqz/53D5vih0I0lWQldeTuqai/pz1j6LPVbCdh/7Vgeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3323
Cc: Hui Wang <hui.wang@canonical.com>,
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
> Sent: Friday, May 22, 2020 4:52 PM
> To: Mukunda, Vijendar <Vijendar.Mukunda@amd.com>
> Cc: Hui Wang <hui.wang@canonical.com>; alsa-devel@alsa-project.org
> Subject: Re: [PATCH v2] ASoC: amd: put off registering mach platform_dev =
to
> avoid -517 err
>=20
> On Fri, May 22, 2020 at 11:13:43AM +0000, Mukunda, Vijendar wrote:
>=20
> > Does sound card registration failure at boot time due to modules loadin=
g
> order can be considered as bug ?
>=20
> No, this is totally normal.  If it failed to bind ever then that'd be a
> problem but this is just deferring.

In that case, we don't need this work around I guess.
At maximum during boot time, we may see few sound card registration failure=
 logs,
Which is normal.

With this change, our concept of ACP parent device which will create platfo=
rm devices
for DMA driver, Generic DMIC driver and Machine driver will be changed.
We implemented same design for Raven I2S driver as well which got productiz=
ed.

