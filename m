Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9226C1C77E2
	for <lists+alsa-devel@lfdr.de>; Wed,  6 May 2020 19:29:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45F99179D;
	Wed,  6 May 2020 19:28:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45F99179D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588786180;
	bh=AQ2PW+T/H1FxQK0RtcPw2J7DPQnn26tz1Mkd216Yicg=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JHMAfZjU6K1cSVBbHEzYSa8LXTJfMfU7KzHsoP301lFFK6J2AIpQzS2XnEG7JF4qV
	 AY9VvwxLfffN7X52Q3ToxD5Gyile1BB+3prF+84Ckje6xF6YBrH7y7iUL5WfsdG2zr
	 FjNQxPQ/WhtW4Hu1MG1FSqw7Np4PsoBi4Ya/TT+g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 079EBF800DF;
	Wed,  6 May 2020 19:27:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 91C74F80249; Wed,  6 May 2020 19:27:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2069.outbound.protection.outlook.com [40.107.223.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 83DB8F800DF
 for <alsa-devel@alsa-project.org>; Wed,  6 May 2020 19:27:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83DB8F800DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="FsKuXvgw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EAlJa89jDu/Ld6/YVcQ18JoRxKukd3mnqvOsbLruIIouRpbd8mgNuGWjVP+DSiVh1LnYerAv6cNIB2AMdmNKa2ourpftfK4LGntal6ZLe1CeoIzEHZdjMBvXadiUiVWJ0193WcSpTbCBZ4l8lfTm/YKADHY0Aq0hMUd3k1UU8UVLjmNMkXzxM8N+rIWbN2gbd4+Gp0nCIZzAgCpH9bO6pUtp7S5bunwwhnZWOeKsy2M+tZyQsndQPyKOTVyU5lZg3I+YvRgAV08PxKu2M23bvhT7xFddg/4YSEjIAInFSQryiIiCExIxZXInCvWJFi0w5/P2tPFLRF+4vzVqEG0/Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oGR2rvNlZYpleBg/Dm7OOvmNXZ1dYHB1jSqKhbuTwjk=;
 b=XYTKp/77mbr4yF1je2DQ866vR7bmE2oovqCH5oNh+yY/60RhTgm0BVlQqZ6XR+XX4Dd1Gf8RkTOUXdQFiuvcqF0f/qsGM7EKxQDcFmJ6XnO0x7Ftkm8weGxNrUIm1ybiC3kX6gP0wy5kEA98CTgJn+x0Fl63FdrDbImK2vAnd894hqXdlorUO0/6SY5r/NmbQez4hZs5odbgESeHpodFxuJ1mgFbszc6NMPx4FCuKYIg0ctCu4KfYSp59emMJk02WlVIifUGTJmlffpSvJnpriP88tfX2UfhHtxQdBxGMnftIMOAIILE54GV33P4EwPFqYxnVVOLb4dsVOAeToUI7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oGR2rvNlZYpleBg/Dm7OOvmNXZ1dYHB1jSqKhbuTwjk=;
 b=FsKuXvgw26nbXLAX59Nu6aBNdQdPr7ix8B/2q7ZCP6zm9ueq3+aTRB0AaFWICnzldELt++TesZJLvl7XwPbeh/rNtUfV54z8M0o4zeiuO7SnxQ2r7JDr18yZPB1B2h3/Pqfp+8baZ881EVX7rZWeA4wdEfxWflaO+UdV4yUwOxE=
Received: from DM6PR12MB2633.namprd12.prod.outlook.com (2603:10b6:5:50::11) by
 DM6PR12MB2652.namprd12.prod.outlook.com (2603:10b6:5:41::25) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2958.21; Wed, 6 May 2020 17:27:37 +0000
Received: from DM6PR12MB2633.namprd12.prod.outlook.com
 ([fe80::ecbc:404f:23ae:616b]) by DM6PR12MB2633.namprd12.prod.outlook.com
 ([fe80::ecbc:404f:23ae:616b%5]) with mapi id 15.20.2958.029; Wed, 6 May 2020
 17:27:37 +0000
From: "Mukunda, Vijendar" <Vijendar.Mukunda@amd.com>
To: Mark Brown <broonie@kernel.org>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>
Subject: RE: [PATCH 14/14] ASoC: amd: enable build for RN machine driver
Thread-Topic: [PATCH 14/14] ASoC: amd: enable build for RN machine driver
Thread-Index: AQHWIx9eubSxPmQRlEGSeiFcD8Q7b6iaBRqAgAE6+ACAAACSEIAABCGAgAAJTYCAAAJQgIAAACzQ
Date: Wed, 6 May 2020 17:27:37 +0000
Message-ID: <DM6PR12MB2633E5D7857EC3D379F8B3FD97A40@DM6PR12MB2633.namprd12.prod.outlook.com>
References: <20200505205327.642282-1-alexander.deucher@amd.com>
 <20200505205327.642282-15-alexander.deucher@amd.com>
 <2a8891ec-d162-77ed-8093-6c7072b6b8f7@linux.intel.com>
 <20200506162656.GH5299@sirena.org.uk>
 <DM6PR12MB2633B92B19B337A72B64D0B397A40@DM6PR12MB2633.namprd12.prod.outlook.com>
 <20200506164345.GI5299@sirena.org.uk>
 <2061b12a-cc4b-558f-6fc1-b6bf548e7603@linux.intel.com>
 <20200506172519.GJ5299@sirena.org.uk>
In-Reply-To: <20200506172519.GJ5299@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=true;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2020-05-06T17:27:35Z; 
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal Use Only -
 Unrestricted;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ActionId=77be2cd7-db2d-42a3-a676-00006898fcc5;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=1
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_enabled: true
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_setdate: 2020-05-06T17:27:35Z
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_method: Standard
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_name: Internal Use Only -
 Unrestricted
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_actionid: 916a440c-d7ae-4b68-9963-0000ac1b196b
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_contentbits: 0
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=amd.com;
x-originating-ip: [165.204.159.242]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 3727661b-2066-4745-e950-08d7f1e2c586
x-ms-traffictypediagnostic: DM6PR12MB2652:|DM6PR12MB2652:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB2652B1EA7A4BFE9C3F88257B97A40@DM6PR12MB2652.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 03950F25EC
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZLxfUaRegTe50wO6hnYxtOvYTGU2GezM4GiyWd7kcYaDCEUpkej+GHHtXUI8x+cY/WC9TjcD263wgNlIjMykLZQNXoi6RkSqK1wCT7dk2wgfJnubG203fWg7VbV22QlBP5aa39jHBdVZT9K5da1Zl/mDJDqE7xCYp8RMf9N2bohYrczQQnbe2TeP2Nh8IQyx0Unf0FfbOB8SW45JUsJE+brjN20O4WKENdUKtd6CzztZkmB9CV7r7qXUe2OSf50UK87KncRGfbk+y1luUl99rUZArMenlomYspFfdK/HnyNha6+siyWDchu3yD6AWq2ko4tSHm9xLPKKETmuKJZbyEG/vrjMZH7csL/8ICZ2v8nX0SL+HS6jkYmk13p56xvjmG52AB0KkNUqoZNbxcZNy4ASf1mYIQAsjtkoHGeXknh/bzqLj7mHHAaWJ7r4qtzHm90ZLh+xrOYLlkpBN31AdwZCXl3eVoS1Nq1J69JD3ddYDYKfuRHb0XgZinoEknA2sJAaOpbda1BO0TCRlVc0ZA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2633.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(136003)(366004)(376002)(39860400002)(346002)(33430700001)(316002)(64756008)(66476007)(66556008)(33440700001)(5660300002)(110136005)(66446008)(2906002)(66946007)(8936002)(76116006)(8676002)(54906003)(26005)(52536014)(71200400001)(478600001)(7696005)(186003)(6506007)(33656002)(86362001)(9686003)(55016002)(4326008)(53546011);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: Efzc9xGeIsXrwzROOaGZeVPk70S74LyCMLHk+KZPJw0gtXFOrsDvpI+SAF7ah5H9sdDnlV2+OWZoFJCgrfjyV0oD4TWGLSprtcaneEJSfbVffxv4gQ7+L27FIoQOnhMqULCXsTvHp0KEHNcnPkgsIg6/EnHbQORKVmSRBm5YEBDflXMInVs+UxnYdJk2/LrH6jsLC4pC7vIwvak3S7WCGMuJ3WrUz15BQms+7/ju222509YpmibU5SiuqcxdfbziO0CS5bYHdifMzSdTA6gsTA7tFwQ9T/xFUeNhybxqNgvixGgtYGPN27fuOUxZD89GTvjighYdRfW5V3h4DJGMft6jTU9qwXhw9Zy7XpbeL/td2OWZvtdLmN6iRAza5mu4q+3akJUNo5fwzNzzjQisxI48avsbLNB2v9Vx0eJRxA/2356KmEt/YVnWb2oXhySHf1iIVT9YwcRs0jkXf4Y8bUHWVN2a4D9/aX/allp0L+YKsDMGy9MXsixrotGdnYO6u+4i5A1WHIBt8opTZdhLkfXmg6J3yV15eoGzTb0MIg8++FRsNZMHz9UGCY2bAwYq9Zm9wXhLNYJhacZFA1wiOvrftiI1/faqeKoPqQS41LbBtEME3Ujm0laDUVz+j/U7NYRBy0FgZ9Xm3ZsACx8I86QhyWS8SIzIgtqRWT32jQc15fr21jVQeqVd9uZ5xqmMNrF+b//mNTBQbO519MLF0tgukJhvx7ucA0i4NRfrBoNu2QXt68BYE5O66WpxGcDhLyL3CFa6zQmJfvCkIayptk4CO/C+0T9o4UAfTqim/i+rIt+WU9czcJvBSswKMHLR
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3727661b-2066-4745-e950-08d7f1e2c586
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2020 17:27:37.3821 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: muc9kUZu97QtxeFhwF7gfb2M8NnCZ/aAoPjeTIoppAodsK3p+/7pztqpVXJWWViTkOcUTYZK0qkvn/9BV5cHnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2652
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
> Sent: Wednesday, May 6, 2020 10:55 PM
> To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Cc: Mukunda, Vijendar <Vijendar.Mukunda@amd.com>; Alex Deucher
> <alexdeucher@gmail.com>; tiwai@suse.de; alsa-devel@alsa-project.org;
> Deucher, Alexander <Alexander.Deucher@amd.com>
> Subject: Re: [PATCH 14/14] ASoC: amd: enable build for RN machine driver
>=20
> On Wed, May 06, 2020 at 12:17:03PM -0500, Pierre-Louis Bossart wrote:
> > On 5/6/20 11:43 AM, Mark Brown wrote:
>=20
> > > What you've got should be fine then, you should test with a !GPIOLIB
> > > build just to be sure though and ideally submit a patch fixing the
> > > SND_SOC_DMIC Kconfig.
>=20
> > if you don't care about gpios, then the only reason to use the dmic cod=
ec
> > would be the modeswitch and wakeup delays properties. If you don't care
> then
> > a dummy codec would be just fine.
>=20
> Yes, it just decays to a dummy eventually if you don't use enough of the
> features - the constraints aren't particularly useful here.  Still it
> doesn't hurt to explicitly say what the device is.

Our requirement is more are like instead of going with  a dummy codec drive=
r,
We want to stick to existing generic dmic driver .
