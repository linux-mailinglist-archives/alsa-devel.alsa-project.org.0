Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4565230E2B
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jul 2020 17:41:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 798E716D3;
	Tue, 28 Jul 2020 17:40:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 798E716D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595950905;
	bh=vsav9cprATkOEh2UX121hWnCFvQhjFnBGGdBVyypj1c=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=seKQr3Zp6+KBtmrDE3Apv9NgbOiZHBJoXKIYLaNqRYASHA0oq+D5uArK3u/7xiWFl
	 t0sGGWYnre8Ac0/JfEZS5z9FT8jFnHXZJebRUq75paP1N1+b4KpkpgzQ01Cc5wodQy
	 LKZj1402SEIdxjZqKJ5nQDRPgD3l23Uh9xWO04RI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98CE5F8021C;
	Tue, 28 Jul 2020 17:40:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A459DF8021E; Tue, 28 Jul 2020 17:40:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2044.outbound.protection.outlook.com [40.107.93.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03D7CF800DE
 for <alsa-devel@alsa-project.org>; Tue, 28 Jul 2020 17:39:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03D7CF800DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="jLx1yWiJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c7zas4DCq/jljCI0dwr3RbPXOmY/qgV8bHU4JJAGf6joiyG0hV9d/CVgoWlmpmBQ2z8V6h2p2jvQlHMpCKCiGHrtJei8+GuAKl3Q61aR5y2AB1A+68hXbKAO5P1eDart6CqWEIylmrvPrIN/kExJRUcYzkdTrOXJoptOCg10IRT4/whJpb77rOGZNB+FoOaE0x57CfTIrLp3rZflJvhEoBTtfvHRRBYHmv78UchQcDaAEqU+VNrzTAVO8GAuJ7xYJZnq/JU9OdhQvIomf7mrw8s/PskoxcT9UGIzzyPcFVh7b0U+Co3EAHvPyTGrdqHSuG/GHCOfZIiOpvqk+BL63w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/GT/E5PNQ9FctFLdB1TZ4waJAZXjj0A7pDyEau7hfn0=;
 b=QDE99dlkYmVFQrt+Say10Ekg6Nmo8feuXd/59/tnV5bS+NEwfpWJjxmjMfj9ghu2RRsProhWpai5A1SJiMCTmLqIgyatLV6kZtTOaRLV6mSMsm435i1drYEUwd2ZH3kGq1LOIL9PrdHssvF3b+2NrkRN+7TQxUxgEBybmjy9zoDAAYnkLu++TSJUB5k89eSukjc0gAPkFOLY/PtbRIDLQf0AkZa60kAZYl1uuajn3YrP7uJaxRaKDC1KXOk2EOsUtCjZhZZEs+n/zWeLj52NdmUgDIeer//BJYUPlcypp/wbflrl8cuACcx4vV51QlPPxWhHY1YPr6wR3C5gjFYohA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/GT/E5PNQ9FctFLdB1TZ4waJAZXjj0A7pDyEau7hfn0=;
 b=jLx1yWiJtil/vR/DtP0kA7HQwZCWE+zETUu01UP0QkVbeor6LRozNw9cZqmfyI1Z5+hThZEb5F3xNKIMQ4NlKZ/dTACMTg6tWatHbBer+teegbV1DjS2xZmhT0LcIf6eb1wVrjBMbOQB4bTkltABwpcXNFo9QrgX5QBzo3cx0R8=
Received: from DM5PR1201MB0139.namprd12.prod.outlook.com (2603:10b6:4:4e::8)
 by DM5PR12MB1372.namprd12.prod.outlook.com (2603:10b6:3:77::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.23; Tue, 28 Jul 2020 15:39:47 +0000
Received: from DM5PR1201MB0139.namprd12.prod.outlook.com
 ([fe80::213d:5180:d4b:467b]) by DM5PR1201MB0139.namprd12.prod.outlook.com
 ([fe80::213d:5180:d4b:467b%10]) with mapi id 15.20.3216.033; Tue, 28 Jul 2020
 15:39:47 +0000
From: "RAVULAPATI, VISHNU VARDHAN RAO" <Vishnuvardhanrao.Ravulapati@amd.com>
To: Mark Brown <broonie@kernel.org>
Subject: RE: [PATCH 3/6] ASoC: amd: SND_SOC_RT5682_I2C does not build rt5682
Thread-Topic: [PATCH 3/6] ASoC: amd: SND_SOC_RT5682_I2C does not build rt5682
Thread-Index: AQHWZCbm+DcS7P+G90ayphwZlFTok6kbjasAgAAKsoCAAPTPkIAAWbgAgAADLQCAADOsQIAAA3mAgAAAd6A=
Date: Tue, 28 Jul 2020 15:39:47 +0000
Message-ID: <DM5PR1201MB01391B60AEC0CAE461124DF7E7730@DM5PR1201MB0139.namprd12.prod.outlook.com>
References: <20200727145840.25142-1-Vishnuvardhanrao.Ravulapati@amd.com>
 <20200727145840.25142-3-Vishnuvardhanrao.Ravulapati@amd.com>
 <c467e2ee-727d-4bf5-8ceb-90c784245a43@linux.intel.com>
 <20200727160941.GE6275@sirena.org.uk>
 <DM5PR1201MB01393D93D69F1552408BFE79E7730@DM5PR1201MB0139.namprd12.prod.outlook.com>
 <20200728120700.GA5055@sirena.org.uk>
 <44e86246-516f-3a32-af66-e1c23f560e77@linux.intel.com>
 <DM5PR1201MB0139AC067DF7F2E2AB9FCC96E7730@DM5PR1201MB0139.namprd12.prod.outlook.com>
 <20200728153545.GA24701@sirena.org.uk>
In-Reply-To: <20200728153545.GA24701@sirena.org.uk>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_ActionId=ffc414ad-8c58-482f-b7a3-ce0ab5202190;
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_ContentBits=0;
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_Enabled=true;
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_Method=Privileged;
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_Name=Non-Business;
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_SetDate=2020-07-28T15:38:53Z;
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=amd.com;
x-originating-ip: [124.123.115.91]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: f8532e40-7397-4360-4f21-08d8330c7556
x-ms-traffictypediagnostic: DM5PR12MB1372:
x-microsoft-antispam-prvs: <DM5PR12MB1372ABA7A4E3C2EA85B47820E7730@DM5PR12MB1372.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YttZ7QRnTIkN8B2vdVulxj2fPUD4FBNvWFHxyyqEMwPS/Avy2xIRqPa6cgUz9FQuudGmiyIZwuRi3mFq5Pai9USSKLKwn3yY7xugD78CozYh+aYBYM194zpxu1Wl+ZOgfGbMwM6cm82V4ZuIdt/143rEnU52f1PL/seNpJ0RJhTw4PpiSuR07LuIhAjX2H9SfwbwBozQKCq9ZQ+zUISfTilocPnakox3btg2PMjIUlfKxqPy2kSvckZqzjENIVp8f45g5H4flNcvnRVdeM1Entef44sjBBYiNJgAkxnIueq3ZlwlK7tj2E0g+l551eTs
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR1201MB0139.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(136003)(366004)(376002)(346002)(39860400002)(53546011)(6506007)(55016002)(76116006)(52536014)(66446008)(64756008)(66556008)(316002)(9686003)(4326008)(478600001)(26005)(8936002)(83380400001)(86362001)(33656002)(2906002)(66476007)(8676002)(71200400001)(6916009)(54906003)(5660300002)(186003)(7696005)(66946007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: ZkUjlMgcnL8ZxJCyBD1UHYb8Gob6asJbErVLoiG2DQY0G49nrPSUCm9Ehs1YjJiHcH4UL9x5DiqeNxiVDkTent+ZMpgSXvMSQtiPzXrkzXycNJAE5bq83cFJWoX3Md2bKkda8miwExsZYoeLD/lCMJyznp+UyUHu7ADaa9MeOiWuCMYqDTM9HKftj/L5MI1OX5UkuizPplg56fm9LXXLJzN568m182iLZCpD68YiiOUHggL8o7I4SnulBKfAaCDmgJxHhh708x+hkfnN4y73ov3Z8vm0UYtwSrVr7X+fB/nG1RPGVihsn3hjm8Bt4YbJfKuvZtDn183IrlRWMlvOpFNsU6t5rhU5XN3avORYCZXgxejYr6s9zTKbNCGCHalJdNrE8KCRIaKzJL2VmeReuWq+L+4ZxgoFH4+KQJ7zDlVv8sox8SBv+R++og098X72OTZ5Ag/OC69le86rO6kw2RsTi25bGHu8Dxs62/XfHJRPe3uQeLcAPk1xyWFZ7QQV
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR1201MB0139.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8532e40-7397-4360-4f21-08d8330c7556
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2020 15:39:47.2750 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i8t/Tb0S404rzzUrBY/vQbK443bKEvsq4tbpV9abhni1AOVrHhjKNlm71InOL+mKNkP5dyW7qGyUzPOd8EGc/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1372
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Arnd Bergmann <arnd@arndb.de>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 YueHaibing <yuehaibing@huawei.com>, open list <linux-kernel@vger.kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
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

I will drop this patch series and will send new series.

Thanks,

-----Original Message-----
From: Mark Brown <broonie@kernel.org>=20
Sent: Tuesday, July 28, 2020 9:06 PM
To: RAVULAPATI, VISHNU VARDHAN RAO <Vishnuvardhanrao.Ravulapati@amd.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>; moderated =
list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM... <alsa-devel@alsa-pr=
oject.org>; Arnd Bergmann <arnd@arndb.de>; Liam Girdwood <lgirdwood@gmail.c=
om>; open list <linux-kernel@vger.kernel.org>; YueHaibing <yuehaibing@huawe=
i.com>; Takashi Iwai <tiwai@suse.com>; Deucher, Alexander <Alexander.Deuche=
r@amd.com>; Mukunda, Vijendar <Vijendar.Mukunda@amd.com>; Enric Balletbo i =
Serra <enric.balletbo@collabora.com>; Agrawal, Akshu <Akshu.Agrawal@amd.com=
>
Subject: Re: [PATCH 3/6] ASoC: amd: SND_SOC_RT5682_I2C does not build rt568=
2

On Tue, Jul 28, 2020 at 03:24:42PM +0000, RAVULAPATI, VISHNU VARDHAN RAO wr=
ote:
> [AMD Official Use Only - Internal Distribution Only]
>=20
> -----Original Message-----
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Sent: Tuesday, July 28, 2020 5:48 PM

I'm not seeing any new text in here?

> To: Mark Brown <broonie@kernel.org>; RAVULAPATI, VISHNU VARDHAN RAO=20
> <Vishnuvardhanrao.Ravulapati@amd.com>
> Cc: moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM...=20
> <alsa-devel@alsa-project.org>; Arnd Bergmann <arnd@arndb.de>; Liam=20
> Girdwood <lgirdwood@gmail.com>; open list=20
> <linux-kernel@vger.kernel.org>; YueHaibing <yuehaibing@huawei.com>;=20
> Takashi Iwai <tiwai@suse.com>; Deucher, Alexander=20
> <Alexander.Deucher@amd.com>; Mukunda, Vijendar=20
> <Vijendar.Mukunda@amd.com>; Enric Balletbo i Serra=20
> <enric.balletbo@collabora.com>; Agrawal, Akshu <Akshu.Agrawal@amd.com>
> Subject: Re: [PATCH 3/6] ASoC: amd: SND_SOC_RT5682_I2C does not build=20
> rt5682
>=20
>=20
>=20
> On 7/28/20 7:07 AM, Mark Brown wrote:
> > On Tue, Jul 28, 2020 at 06:59:50AM +0000, RAVULAPATI, VISHNU VARDHAN RA=
O wrote:
> >
> >> So Actually for rt5682 codec Now in 5.8 there are three flags :
> >> SND_SOC_RT5682
> >> SND_SOC_RT5682_I2C
> >> SND_SOC_RT5682_SDW
> >
> >> But till 5.7.8 we have
> >> SND_SOC_RT5682
> >> SND_SOC_RT5682_SDW
> >
> >> So in our design we were using SND_SOC_RT5682 which build=20
> >> snd_soc_rt5682.ko Creates the respective codec_dais as defined in=20
> >> that .ko
> >
> >> If we use SND_SOC_RT5682_I2C we get snd_soc_rt5682_I2c.ko , it is not =
creating the expected codec_dai links.
> >
> > Could you be more specific about the way in which "it is not=20
> > creating the expected codec_dai links" please?  What are you=20
> > expecting to happen and what happens instead?  Do you see any error mes=
sages for example?
> >
> >> As there are three flags defined in codecs, I expect that previous=20
> >> one which we were using(SND_SOC_RT5682) is not a wrong flag and I=20
> >> expect to use
> >> SND_SOC_RT5682 as it is still available.
> >
> > Given that the core module does not register with any bus it is=20
> > difficult to see how that could possibly work - the core module=20
> > doesn't contain a driver at all.  Have you tested this change?
>=20
> I share Mark's point. Have you tested this change on top of Mark's tree, =
or only on top of the stable kernel?
> Ok. I will drop that patch and send the other series.
>=20
> Thanks,
>=20
