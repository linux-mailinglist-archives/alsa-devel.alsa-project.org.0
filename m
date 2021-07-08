Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 168AD3C196F
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Jul 2021 20:53:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9147B85D;
	Thu,  8 Jul 2021 20:52:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9147B85D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625770394;
	bh=BMqZJPwjQ5e4R4ea5w0S85zHSd6QHGJv0qvT049etYE=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NCA+MjYTrTOZ/kg/OKUMu38TXNm8cqoIc3fKE81Th2MJfMebCCxiP4hTLYhYkTnUR
	 1RU5NwAWnEmeBcGyjVt1Tyyc58bA6RGVMszfa8rBrLNuN0WIz+DP1cxC3zFyUum2I9
	 Ch61dq+eWyv1aCN+q981kaQRGQhrbgp5GkiVQLgw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EBE28F80259;
	Thu,  8 Jul 2021 20:51:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AFFDAF80249; Thu,  8 Jul 2021 20:51:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PDS_BAD_THREAD_QP_64,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2084.outbound.protection.outlook.com [40.107.96.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F12B7F8012A
 for <alsa-devel@alsa-project.org>; Thu,  8 Jul 2021 20:51:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F12B7F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="CDkdx/pY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CJkWv3KIAlWHi4ljt6bjpS3cvLWcqqVefcdo3e14MnyuLWwcYG/qadT1k1w8zZl5DHzpsxxkMH18UOwjOv+inBWMrsCF5/3OZEB1rOBh9Zh68MkH/atBm2u4qaaQ6gt8DEi/HZmWG+4RXoaYh1hAqyaKXTwJ8GPs/FwtsQa8JV2yhuFF+pJBXnzDjUk0VToANcNjT53H+jZBW3vAggcLAgI77hdat8kuRog5zWoQxmhmsCDfXrM9ClT8evvBXEwboCsuIbw3e/o1YPVrdec9x/jSi6R6wwZIvEbIjljUvxHPPeYvwRlwSPikqJpiqPH2Gj+o03SeKwuieOIRhKkLxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5s07dK1jW8U0nnAGP3v46WAsnuceVJFhPefLyDb9IZE=;
 b=J0PNZ6URp3aH1PdfZh1ufAfqYxHfDo0Y9UvnSRa9WCgFDBBQI8aywJfot3SeHbMVwkSRM4YW+IGM4th1v1MWaw3Hhjc4lHA/qR+vtSg6TS1TTqpUFtfxorKT4YgRBnJTjRLpFTuZKgtcif02IgKdimOcLQMc3RuzFDhL20feUjEuAy8c0j+Eddlw42DNjis3TuPK4ZAYG5yK77BK7rNYcS+JuuJNUwUsH3AB535V69UzB5psM3deIAaILtpM2ecJCRQ5EnYwpykrLckU/HADM7mXUt2Lf8X+kmZ+SOgjJWJWRzdIS0x6PAQleTZBnSsrYzUI2BWRPKeeWsbdpx1QCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5s07dK1jW8U0nnAGP3v46WAsnuceVJFhPefLyDb9IZE=;
 b=CDkdx/pYw/PKxjRoeSmN6wsfsaOdeHCh0liGm0rj9qzZdJ89GQA2r0xEWvvvuoT9Ge4s9w/dtsNJxs/NkU9RCFAGfnBswSidqlOUS5Lp2lIMCBO3Xxqg540VaLJ8w4ZpLl15BOlaX2Kvp5fAWXCI3GOn9OSwrcAsOi1osGFOBnI=
Received: from BL1PR12MB5144.namprd12.prod.outlook.com (2603:10b6:208:316::6)
 by BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.22; Thu, 8 Jul
 2021 18:51:34 +0000
Received: from BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::8cb6:59d6:24d0:4dc3]) by BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::8cb6:59d6:24d0:4dc3%9]) with mapi id 15.20.4308.023; Thu, 8 Jul 2021
 18:51:34 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Mukunda, Vijendar" <Vijendar.Mukunda@amd.com>, "broonie@kernel.org"
 <broonie@kernel.org>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>
Subject: RE: [PATCH V3] ASoC: add a flag to reverse the stop sequence
Thread-Topic: [PATCH V3] ASoC: add a flag to reverse the stop sequence
Thread-Index: AQHXdB/6HEHmc54rmk+tVDXa3KeHvas5a2nA
Date: Thu, 8 Jul 2021 18:51:33 +0000
Message-ID: <BL1PR12MB51449540FAC514FC19EE115EF7199@BL1PR12MB5144.namprd12.prod.outlook.com>
References: <20210708175529.13313-1-vijendar.mukunda@amd.com>
In-Reply-To: <20210708175529.13313-1-vijendar.mukunda@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Enabled=true;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SetDate=2021-07-08T18:51:30Z; 
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Method=Privileged;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Name=Public_0;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ActionId=72815fa9-2c5f-4d3b-9ebc-b81447d54a8d;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ContentBits=1
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 488ac769-885c-45ff-1277-08d942416852
x-ms-traffictypediagnostic: BL1PR12MB5176:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL1PR12MB51764A6912140086C994D1A4F7199@BL1PR12MB5176.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mumReqmDUmpTFETaXm4Wf5Cbmr5/olVxsCGElx4gEjFq6eQoC60wkUsHDTxYc8KhotQoUA/rmsJc6YxwM5E/Jw8HqkDNHlBBhC3E5GTgLgdwHryjZTigcWpMlRjtn9+eTpA5XEUIDsmJws42vawfFeUkKsbnMvh4eI53FYc4Xkit/ZgOzKFXlealmRFxSCQ33WmFpQMMKMw/szUxT4cwkmfPwwxJVqX013D5mb2JHjXR+TpO2O52H46m+io6Qr1vHpTzUsCrsoiACUgs2RqkyBRIjkpgI0l/aT1xtxVZB5+cEMAhUqX3fpeNB8kycd8256EpbS8QSFx9K/kZ2i5o6lALqh7PsaWJWFax+95qfHLTqYEodJsn/qaqOh4tOQ8+Zr/jvrAca7OMHlvzgNg57dBQOEOEaygzUcMbwtsaRVWvEofBVCtRY2Mhy9q5SpML5Esc9i9WeBln7edql86Ploj00Pwklhsi8VbPnsHbb+e54WXyHv6laQWMw6XYkMxLWK2DdXbEfVOVpZ4TK/JbQw9/x3OD7FX3wL1obIh6HLvFg3Y87XwHAV1XJjP13rRx8JhoZp1BA6//vZ2M1bIPip6ZMY7zuVvG6Y19ZQ8bFvA0yVFeeSkFfAVPc278pjYZFnpyBdZDV3uDC46D3xIIjw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5144.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(396003)(39860400002)(136003)(366004)(7696005)(2906002)(5660300002)(71200400001)(83380400001)(110136005)(54906003)(55016002)(53546011)(8936002)(8676002)(6506007)(316002)(64756008)(66476007)(66556008)(66446008)(478600001)(66946007)(7416002)(76116006)(9686003)(122000001)(26005)(33656002)(4326008)(186003)(52536014)(38100700002)(86362001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Jbog7hr4tpXPFLg+6X9SDxiXa5Hiw/9J7RJC9mNF3ir5ze4CGyrnrg+Xyc0b?=
 =?us-ascii?Q?SfSfyG5nXbAGMOvXBVpwFDVyx6jcS7GEwtXOzh3oZy1QHEx25jgakyGTox9A?=
 =?us-ascii?Q?hFfDEcSQNTHglb4Mu3KdphOqVYVS9aKp/n96djoMPhFZqoWG1JPwtM7M67sf?=
 =?us-ascii?Q?N/UlqUZU3kMHMLsrNHM2LyMvnlMIQthmQ5ge7tghmpT9vFOBHI4v6HGZyy9W?=
 =?us-ascii?Q?xlFyH2drPk9o/EKvCebt454lVNkZ50ta8hzZRJc++cufagjooFtZTf+WvAFs?=
 =?us-ascii?Q?Zk+vS9peyCHhuDWSr1e8loTz/GreKf3S38CyxrZ7z95mK/j9tXMy8nNQIIcT?=
 =?us-ascii?Q?RDtuaOq5js3Th16QWwnfJeD+lEYd4ONQR68ky5Kt7TQYPJgGaLOsg2od0L/s?=
 =?us-ascii?Q?qL2oM00GL35Mc5y2bWgs9mZPq88kmPdfI6CgPDpjgWMaVkzDkaxEmx+hq2B6?=
 =?us-ascii?Q?uGzPAmH4/JSBR2qZ0wM0jmdBdrJuKThCws08keD4F/eZ95cSgCfIF5qmdQ91?=
 =?us-ascii?Q?+AFXhuCj7jk3v/ZZA0CWHDTbUVFbxjaIAwUzuTf2H51Y/QTksEUlUdwY04eZ?=
 =?us-ascii?Q?k6sXXPLPZvhWZvvvjbxFFLn5bt7flrbroKMh0xJJbmmNZ7T8tRPkrkuMubht?=
 =?us-ascii?Q?iZhTCe58QD2LRgJ6MHufBWyZB9ozWHuMN95mEgVdskdtg6UIuLABWn2f+Kzj?=
 =?us-ascii?Q?VQc0i0jV6BPjlbmgZbP5sdhsb7VV6lAWZ1/smk0CceUF/Jsbh6kq+BKtPT19?=
 =?us-ascii?Q?Tqw6QnlnS3LimYBCj2KaC0mMz2M+2D7FbMqvNbOpUFH9igV1f8NmgUCeNhYu?=
 =?us-ascii?Q?0xydR/3N3AIoySe/DAextSEaElrm0CBByluD8kyVvptXB2UrU9jJyr8CtVRN?=
 =?us-ascii?Q?9PArwemHl5P8+4PNvlyLHDyo6Whc+Zr9/VgYHP0Haf9udfEETY5z20Tpm+aP?=
 =?us-ascii?Q?Wr5RQT4d8bIJTv9eO9qb/n2unBpZ5hOsj6eO566MFGNFczt1T08yCikKhCp9?=
 =?us-ascii?Q?5sFIrNIykjF7bPtzPZWkFIApvHLVoK1JKIPQNflELTOncCfEtWw0JC/q17oc?=
 =?us-ascii?Q?3j9HuAIyJ2F47aleyIamn/9AXtxogxYMkin+LVS0VCBdwZZrMbiZV9rfwDXj?=
 =?us-ascii?Q?F+FfxcdVLs0nwAmUsfz5Al2OGVQViZwXcd858vwdfWXZspDrB4f7bu2tT1gk?=
 =?us-ascii?Q?/2Os39MXtgoKgL//p9vkqIs47BlXNs3rwuttdZ5STfSQicwgcLVFNsgo0lgA?=
 =?us-ascii?Q?UZ3a7Z2aKVXLpOWXwZByBSa2y4Wv0s18T3Mq4rOnWdVW2JPtGz+G356UfUCI?=
 =?us-ascii?Q?F78zmlsBYe8zIwrR72djgq/t?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5144.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 488ac769-885c-45ff-1277-08d942416852
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2021 18:51:33.8907 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +qh3Eaw+o2DjhyI7ENqoqFdRLW7A5w/iP3TksU1of4dOMvQ9zOSL1LT/A5sTrBIc74jOvXXeWGosm1QoYTFWlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5176
Cc: "Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>,
 "amistry@google.com" <amistry@google.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 open list <linux-kernel@vger.kernel.org>, "Hiregoudar,
 Basavaraj" <Basavaraj.Hiregoudar@amd.com>, Takashi Iwai <tiwai@suse.com>,
 Chuhong Yuan <hslester96@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 "Mukunda, Vijendar" <Vijendar.Mukunda@amd.com>,
 "nartemiev@google.com" <nartemiev@google.com>
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
> From: Vijendar Mukunda <vijendar.mukunda@amd.com>
> Sent: Thursday, July 8, 2021 1:55 PM
> To: broonie@kernel.org; alsa-devel@alsa-project.org
> Cc: amistry@google.com; nartemiev@google.com; Deucher, Alexander
> <Alexander.Deucher@amd.com>; Hiregoudar, Basavaraj
> <Basavaraj.Hiregoudar@amd.com>; Dommati, Sunil-kumar <Sunil-
> kumar.Dommati@amd.com>; Mukunda, Vijendar
> <Vijendar.Mukunda@amd.com>; Liam Girdwood <lgirdwood@gmail.com>;
> Jaroslav Kysela <perex@perex.cz>; Takashi Iwai <tiwai@suse.com>;
> Chuhong Yuan <hslester96@gmail.com>; Kuninori Morimoto
> <kuninori.morimoto.gx@renesas.com>; open list <linux-
> kernel@vger.kernel.org>
> Subject: [PATCH V3] ASoC: add a flag to reverse the stop sequence
>=20
> From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
>=20
> On stream stop, currently CPU DAI stop sequence invoked first followed by
> DMA. For Few platforms, it is required to stop the DMA first before stopp=
ing
> CPU DAI.
>=20
> For Stoneyridge platform, it is required to invoke DMA driver stop first =
rather
> than invoking DWC I2S controller stop.
> Introduced new flag in dai_link structure for reordering stop sequence.
> Based on flag check, ASoC core will re-order the stop sequence.
>=20

You should add a fixes tag as well for stable:
Fixes: 4378f1fbe92405 ("ASoC: soc-pcm: Use different sequence for start/sto=
p trigger")

Alex

> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> ---
> v2 -> v3: moved "stop_dma_first" flag from card structure
> 	  to dai_link structure and modified code to use
>           "stop_dma_first" flag.
> v1 -> v2: renamed flag as "stop_dma_fist"
>           fixed build error by removing extra + symbol
>           sound/soc/soc-pcm.c:1019:3: error: expected expression before '=
struct'
>           1019 | + struct snd_soc_card *card =3D rtd->card;
>=20
>  include/sound/soc.h                  |  6 ++++++
>  sound/soc/amd/acp-da7219-max98357a.c |  5 +++++
>  sound/soc/soc-pcm.c                  | 22 ++++++++++++++++------
>  3 files changed, 27 insertions(+), 6 deletions(-)
>=20
> diff --git a/include/sound/soc.h b/include/sound/soc.h index
> 675849d07284..8e6dd8a257c5 100644
> --- a/include/sound/soc.h
> +++ b/include/sound/soc.h
> @@ -712,6 +712,12 @@ struct snd_soc_dai_link {
>  	/* Do not create a PCM for this DAI link (Backend link) */
>  	unsigned int ignore:1;
>=20
> +	/* This flag will reorder stop sequence. By enabling this flag
> +	 * DMA controller stop sequence will be invoked first followed by
> +	 * CPU DAI driver stop sequence
> +	 */
> +	unsigned int stop_dma_first:1;
> +
>  #ifdef CONFIG_SND_SOC_TOPOLOGY
>  	struct snd_soc_dobj dobj; /* For topology */  #endif diff --git
> a/sound/soc/amd/acp-da7219-max98357a.c b/sound/soc/amd/acp-da7219-
> max98357a.c
> index 84e3906abd4f..9449fb40a956 100644
> --- a/sound/soc/amd/acp-da7219-max98357a.c
> +++ b/sound/soc/amd/acp-da7219-max98357a.c
> @@ -576,6 +576,7 @@ static struct snd_soc_dai_link cz_dai_5682_98357[] =
=3D {
>  				| SND_SOC_DAIFMT_CBM_CFM,
>  		.init =3D cz_rt5682_init,
>  		.dpcm_playback =3D 1,
> +		.stop_dma_first =3D 1,
>  		.ops =3D &cz_rt5682_play_ops,
>  		SND_SOC_DAILINK_REG(designware1, rt5682, platform),
>  	},
> @@ -585,6 +586,7 @@ static struct snd_soc_dai_link cz_dai_5682_98357[] =
=3D {
>  		.dai_fmt =3D SND_SOC_DAIFMT_I2S |
> SND_SOC_DAIFMT_NB_NF
>  				| SND_SOC_DAIFMT_CBM_CFM,
>  		.dpcm_capture =3D 1,
> +		.stop_dma_first =3D 1,
>  		.ops =3D &cz_rt5682_cap_ops,
>  		SND_SOC_DAILINK_REG(designware2, rt5682, platform),
>  	},
> @@ -594,6 +596,7 @@ static struct snd_soc_dai_link cz_dai_5682_98357[] =
=3D {
>  		.dai_fmt =3D SND_SOC_DAIFMT_I2S |
> SND_SOC_DAIFMT_NB_NF
>  				| SND_SOC_DAIFMT_CBM_CFM,
>  		.dpcm_playback =3D 1,
> +		.stop_dma_first =3D 1,
>  		.ops =3D &cz_rt5682_max_play_ops,
>  		SND_SOC_DAILINK_REG(designware3, mx, platform),
>  	},
> @@ -604,6 +607,7 @@ static struct snd_soc_dai_link cz_dai_5682_98357[] =
=3D {
>  		.dai_fmt =3D SND_SOC_DAIFMT_I2S |
> SND_SOC_DAIFMT_NB_NF
>  				| SND_SOC_DAIFMT_CBM_CFM,
>  		.dpcm_capture =3D 1,
> +		.stop_dma_first =3D 1,
>  		.ops =3D &cz_rt5682_dmic0_cap_ops,
>  		SND_SOC_DAILINK_REG(designware3, adau, platform),
>  	},
> @@ -614,6 +618,7 @@ static struct snd_soc_dai_link cz_dai_5682_98357[] =
=3D {
>  		.dai_fmt =3D SND_SOC_DAIFMT_I2S |
> SND_SOC_DAIFMT_NB_NF
>  				| SND_SOC_DAIFMT_CBM_CFM,
>  		.dpcm_capture =3D 1,
> +		.stop_dma_first =3D 1,
>  		.ops =3D &cz_rt5682_dmic1_cap_ops,
>  		SND_SOC_DAILINK_REG(designware2, adau, platform),
>  	},
> diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c index
> 46513bb97904..d1c570ca21ea 100644
> --- a/sound/soc/soc-pcm.c
> +++ b/sound/soc/soc-pcm.c
> @@ -1015,6 +1015,7 @@ static int soc_pcm_hw_params(struct
> snd_pcm_substream *substream,
>=20
>  static int soc_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
> {
> +	struct snd_soc_pcm_runtime *rtd =3D
> asoc_substream_to_rtd(substream);
>  	int ret =3D -EINVAL, _ret =3D 0;
>  	int rollback =3D 0;
>=20
> @@ -1055,14 +1056,23 @@ static int soc_pcm_trigger(struct
> snd_pcm_substream *substream, int cmd)
>  	case SNDRV_PCM_TRIGGER_STOP:
>  	case SNDRV_PCM_TRIGGER_SUSPEND:
>  	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
> -		ret =3D snd_soc_pcm_dai_trigger(substream, cmd, rollback);
> -		if (ret < 0)
> -			break;
> +		if (rtd->dai_link->stop_dma_first) {
> +			ret =3D snd_soc_pcm_component_trigger(substream,
> cmd, rollback);
> +			if (ret < 0)
> +				break;
>=20
> -		ret =3D snd_soc_pcm_component_trigger(substream, cmd,
> rollback);
> -		if (ret < 0)
> -			break;
> +			ret =3D snd_soc_pcm_dai_trigger(substream, cmd,
> rollback);
> +			if (ret < 0)
> +				break;
> +		} else {
> +			ret =3D snd_soc_pcm_dai_trigger(substream, cmd,
> rollback);
> +			if (ret < 0)
> +				break;
>=20
> +			ret =3D snd_soc_pcm_component_trigger(substream,
> cmd, rollback);
> +			if (ret < 0)
> +				break;
> +		}
>  		ret =3D snd_soc_link_trigger(substream, cmd, rollback);
>  		break;
>  	}
> --
> 2.17.1
