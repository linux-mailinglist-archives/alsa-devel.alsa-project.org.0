Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D245A4D439E
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Mar 2022 10:36:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 656DE174D;
	Thu, 10 Mar 2022 10:35:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 656DE174D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646905006;
	bh=bXFBP421MCaR+YN82us3yGdC0XafwUUJcpdbRKKCZ4k=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NSB8CvNwBRix7fb8dN2wwamn53Dx/jvLk1liTDwDH1LiXTsvx+nYzbUW89c7Fbgfj
	 U+YJJc2ChjO5AVwvi1oCynC7lWqc7Q8EDWjd8PvTK5DK1WncYUXm2jXzs7DysH4cqs
	 0R4pzglPnU9aCXwA7uJlK0/J5r0zvFeiTp+O6nyc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CD545F8013C;
	Thu, 10 Mar 2022 10:35:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50B5AF80137; Thu, 10 Mar 2022 10:35:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on060d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0c::60d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D94D6F800D2
 for <alsa-devel@alsa-project.org>; Thu, 10 Mar 2022 10:35:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D94D6F800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="UTsWNKTF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZrLUd8dDhSaKjldWoKXsY3rjKMWOBB+sjBiMYQpJnjMXR6qrfsa71RdhtPo8FNKOS5emRSAO4C7QChoPllWsPyxKJokx3KLwojAK9JM7lfXWMo3YFtmZktu8GCbsghssm9JWnbqDmgJXUyVo8mRjh4rdbNOu0ox8lomh/TM4IszXIsbBwM1XjamP46ubFBgrQU2ugwHzBJYVx5eEC48wrOcg+kY/492WhH6n1demFPMBO2N65A43gM7lEX9dG5+Sf/E4jLPTt5jqI8fh9BtgJoEY786s3AFXgNBYydQWPN5ggtFx7BaMVHJIgNAD+WtgA0Roo3QAmbCQvwPme0VQvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7yW5/CHx1dVTRQVitICOYE0NqYeNPD50AdljmcxkYtE=;
 b=VZV3OZJXRx/A+GlB3BvNhemLELuQcBf6vN7boU3FRZjV63BmltxSixEJML1wSa2ClaQASX5r2ius4lTLz3gfa+Pgzs+Kosu94gcRDR3t4XweNrIUt3Pk1lY/2AKBnaduDlNbkMGoA9cH/2afLSeC7mazFMXhBgLa2jxQAEXSsMNryciSJvnZQcDuuUMV44aB50tL9LDB8X+sUf9nFbCmikh658I8kjL2J3TpFunGhSqLkfL+QXwOIpOBQaHKl8VCUhaK/Jx7lFVURvJOY0xyTFtc/fpSD4XmVWeaIuCoTs3cf/wDPzASFkscXtsj3kTSBqqBTEbWrN0ks47ilP9hSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7yW5/CHx1dVTRQVitICOYE0NqYeNPD50AdljmcxkYtE=;
 b=UTsWNKTFhEV0j2ielBQwzxlj5+TabGBVTWKDQ5kPFcxtPMBad1utN4CaIRhOWxWSeiOZz0ou+VkHRIj6DQoEj8x0OHlUdQpKP4zp37/GwjX2Mss1wUBi5qqv5zXy4/4q2FN0My9for6HOEKNGslFEM3TWMv1R6wzAiMvhKbg1N8=
Received: from PAXPR04MB9089.eurprd04.prod.outlook.com (2603:10a6:102:225::22)
 by VI1PR04MB5181.eurprd04.prod.outlook.com (2603:10a6:803:62::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.26; Thu, 10 Mar
 2022 09:35:25 +0000
Received: from PAXPR04MB9089.eurprd04.prod.outlook.com
 ([fe80::bc25:a82e:ab71:84fb]) by PAXPR04MB9089.eurprd04.prod.outlook.com
 ([fe80::bc25:a82e:ab71:84fb%8]) with mapi id 15.20.5038.027; Thu, 10 Mar 2022
 09:35:25 +0000
From: "S.J. Wang" <shengjiu.wang@nxp.com>
To: Takashi Iwai <tiwai@suse.de>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>
Subject: RE: [PATCH alsa-lib 3/3] pcm: direct: Check xrun/suspend before the
 slave hwptr update
Thread-Topic: [PATCH alsa-lib 3/3] pcm: direct: Check xrun/suspend before the
 slave hwptr update
Thread-Index: Adg0YJuSGnaS97zZR/iZBgXjukB8XA==
Date: Thu, 10 Mar 2022 09:35:25 +0000
Message-ID: <PAXPR04MB9089D25D61D0ECB4CBD1005DE30B9@PAXPR04MB9089.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8b578ed2-9929-4b54-7e0b-08da02794e80
x-ms-traffictypediagnostic: VI1PR04MB5181:EE_
x-microsoft-antispam-prvs: <VI1PR04MB5181BF9E943B90799D55A520E30B9@VI1PR04MB5181.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BAFX2CIeN39hqWNYIHq9Xc8BHAmFdevsYkMTBHhXoKS1FeEMHF6xwOhaJjrDPA+owjgGIz1G0K1ZfRoqXaIShwtOiW02lkPHQy4Hn6Q549h6JAXtCMyU/yMiLHkhH+KWXHi8i2gzjuY8CpG/ESu/X/62WZh43iOu7XW+ubFYJtYpHyJjOh5VVnhVfVRC87eC828sbyHQNSHHCUhvFoR4i1rPCFggMThZhX8rpvKXAAL/O4yrxjrv3gwZRiWY0jIMGjxrVGf5PnwBSyFJud8Q/gUmYBXH9fXKBiGdE5cYGNqxfSzyrE4mgqKWUQeWd438+x7yCz+sd8WfDPpqh0qaygI1MTkJIsUOmRJ8fLGfIdjCc3PCPXS05eXPc+dWP8zWDHzIVSXSGgFo6Ti/fp1aE+HjV/FqfPjctbPcic1mwAMhe3joQG8mgjqRwUfXp9F8OhUbyJQdmiVFnZAM+Vm0Iu2Tc4msXbRpQ/cTi8FELN+R6HSiciWFmfnOkA2JMGx7DZq2f6Rxn9SR9TwiP5cTR7pDuRqh0iHVjDkFKp3P2cfwOcXZzqrDTjZvr6zJkr293X8Vrwfg7hxljUY7x4a+Xbn7CKyb7zm8+Fg/XjZ6D3vSUhhlruJwnwYc79YKSQetwpHHF9E4P1sZudkb+2u+12OsnoMOVah4BWa2UcT7+nInHiVjrvYSUR0t62NzRePTKv6TuRhqoj2GNzfzcge65A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9089.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(26005)(15650500001)(33656002)(2906002)(55016003)(5660300002)(6506007)(9686003)(38100700002)(7696005)(83380400001)(122000001)(8936002)(316002)(186003)(66446008)(64756008)(66556008)(38070700005)(110136005)(71200400001)(86362001)(508600001)(52536014)(66946007)(76116006)(8676002)(66476007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?7/s3ApiORZWlIqwN3X0gRHmJ7ag5OU6wGWpjXvyamq/01+fC8N0WM3U5eBu+?=
 =?us-ascii?Q?2I66WTseOFHwaqmeqXiNKTirWOb3Sn21mNiIfRFJhMF6LSMvClUhkiWHjDRr?=
 =?us-ascii?Q?Mv+bPEMJGcRUTWXd2oGd8zVqrYA5S5ng7StVRebZVf805SCSKEf6noOyIY2w?=
 =?us-ascii?Q?ClGovd+m06OFXxIBcsMED0KmXJfmtoS70mVzs4jWJJqtrdmQ2A2Uhh+dxIZp?=
 =?us-ascii?Q?DsvesO+iN8O+t57vVkzi4JMF7zMm5KSvGYOQxjRyOkSc89qx0VzqdDDb4Sfr?=
 =?us-ascii?Q?l3UMWvhL4U6kPdfPBQVK3I+ZJe9NX9C6kLAKxn2YYhnSalBzkuGOWAYvimW9?=
 =?us-ascii?Q?vm6umAvxmO0yFPiyOd2FJDsfrxLPDlPEjfX7ZP+UTOeZZ6lYxzn94zPB2g72?=
 =?us-ascii?Q?mPbHiHVkvgQpNd6CxMJhCWbzGP4bjVBuJoen4Mxh3o20ADs2wsvM05LGOnyT?=
 =?us-ascii?Q?Zdvncmjclt7SKTT9vFGWtPSX3cfh8otbw4JZ5eVt8+/rs2u3vH5QRxBd3nNB?=
 =?us-ascii?Q?4SNlZ3bxrbAItfRIBMOoZLDxn6V4B5T55TCwi2OhaW3HtBIeHG86vrA3HYjz?=
 =?us-ascii?Q?w/eMVdE3aTvTBUHE9CbluKahm9Ct3tKJoAes9F6SGMw3GEcKTjNRds1bzhfe?=
 =?us-ascii?Q?HCPur86qMka86a5cdYuqsW1jgYf2B/3XUhJB5A/3v9+i68753h+VidnryGMb?=
 =?us-ascii?Q?P/yhQVS7Dix8jBcPIbkTZOdP0qW4MAP1Znxuk1xgG13GtRzEwFi5WBbouwPG?=
 =?us-ascii?Q?ymUS/6TUm0I1p/9ctbNB8+eTSysvrjZ0SpsUXZbNJq857AqzApMpYTpYfzKv?=
 =?us-ascii?Q?XzZVa+AEnKPzLWFLpCdjPGUXfnCRtIHCSUoePauXFIcYWp2QZOYjUfzkSMnF?=
 =?us-ascii?Q?GLYf0wfqXN4jrf7rmE+mr5Vhl2gUAvdE11a/mTmxP+oHSw8dh3KaTGjl2zWo?=
 =?us-ascii?Q?pAOvVOhv4GflVGEirNeOLsvwOol4UWe/L1iqOMYCvRHJXu9MMuj1wisFA7+y?=
 =?us-ascii?Q?7aD6dtbfjGKI+RjJ//X8zqcHvN8+duhBXga1I5kK3NYG8kE3mHzABW9LSuTc?=
 =?us-ascii?Q?pd541phGDEfcXOnzP8fXZ88CJfB5k8kH41lkDFZI4I2VUSYefLRJGAKpKUli?=
 =?us-ascii?Q?MWvrFDUvF4+fU8M/yAZMgRwUnCqEkkQPxNjcv4r23pp6uiwiw9HBS7Mduttt?=
 =?us-ascii?Q?pQujTd+40THMtUuQK9JyWiMwwFmnvL5oj3mcXv2fq3/xfo84uyQrAag34Tgn?=
 =?us-ascii?Q?Oc8EQuO+M8Q+i6wU052ZZ270iMiuaotNw6ccqf2LFbjlhCh/llZrd+z4uQxT?=
 =?us-ascii?Q?5iBSNgPkJPSi17rLY/Jg6nPNUmTvm5jNGkIp83riPJTDDqhg+W6gxg3CzHk2?=
 =?us-ascii?Q?CxIxxNXzWta6vm0v6d5hCaLcUDsvBy9n4hjxI+hL1r3afxx9O4h+p+mc5cBw?=
 =?us-ascii?Q?SjY3NYsiET/S4oXyLptA11b0XEp2UYAjseZkFfwv1TU6K1Vtq6K+ADaWRfN1?=
 =?us-ascii?Q?tf5HXV/nYwvL9dC99Kid65YQWoJMThlKqKHKetIJ5tBtQ/bJqp/yevFkZQ56?=
 =?us-ascii?Q?83ACz80l5XvaZsS/As+ztgYTBJv2a9skaP/PXG7XinVw5VW/X6Csy5JGx3Ro?=
 =?us-ascii?Q?Gw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9089.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b578ed2-9929-4b54-7e0b-08da02794e80
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2022 09:35:25.6907 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7VvBGtcp+AN9oLM+IIGhNArDiFq4Fks1rhOE5Gm34XKXmMM7BSCD3MCjCgRZOAqKUejnXqdRKzxh+bZhn7+I2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5181
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

Thanks.

>=20
> The xrun/suspend may happen at any time and we should check it right
> before the slave hwptr update.  Otherwise the hwptr value may be screwed

I think should be "after the slave hwptr update".  If hwptr is screwed,  me=
ans
Suspend happened then check_xrun() can return.

> and get unexpected large read/write.
>=20
> Reported-by: S.J. Wang <shengjiu.wang@nxp.com>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  src/pcm/pcm_dmix.c   | 4 ++--
>  src/pcm/pcm_dshare.c | 4 ++--
>  src/pcm/pcm_dsnoop.c | 6 +++---
>  3 files changed, 7 insertions(+), 7 deletions(-)
>=20
> diff --git a/src/pcm/pcm_dmix.c b/src/pcm/pcm_dmix.c index
> d00d53bef604..111fea157228 100644
> --- a/src/pcm/pcm_dmix.c
> +++ b/src/pcm/pcm_dmix.c
> @@ -426,11 +426,11 @@ static int snd_pcm_dmix_sync_ptr(snd_pcm_t
> *pcm)
>         snd_pcm_direct_t *dmix =3D pcm->private_data;
>         int err;
>=20
> +       if (dmix->slowptr)
> +               snd_pcm_hwsync(dmix->spcm);
>         err =3D snd_pcm_direct_check_xrun(dmix, pcm);
>         if (err < 0)
>                 return err;
> -       if (dmix->slowptr)
> -               snd_pcm_hwsync(dmix->spcm);
>=20
>         return snd_pcm_dmix_sync_ptr0(pcm, *dmix->spcm->hw.ptr);  } diff =
--

Better to get slave_hw_ptr before check_xrun(), like this:

--- a/src/pcm/pcm_dmix.c
+++ b/src/pcm/pcm_dmix.c
@@ -424,15 +424,17 @@ static int snd_pcm_dmix_sync_ptr0(snd_pcm_t *pcm, snd=
_pcm_uframes_t slave_hw_ptr
 static int snd_pcm_dmix_sync_ptr(snd_pcm_t *pcm)
 {
        snd_pcm_direct_t *dmix =3D pcm->private_data;
+       snd_pcm_uframes_t slave_hw_ptr;
        int err;

        if (dmix->slowptr)
                snd_pcm_hwsync(dmix->spcm);
+       slave_hw_ptr =3D *dmix->spcm->hw.ptr;
        err =3D snd_pcm_direct_check_xrun(dmix, pcm);
        if (err < 0)
                return err;

-       return snd_pcm_dmix_sync_ptr0(pcm, *dmix->spcm->hw.ptr);
+       return snd_pcm_dmix_sync_ptr0(pcm, slave_hw_ptr);
 }


> git a/src/pcm/pcm_dshare.c b/src/pcm/pcm_dshare.c index
> 0ff43a90d270..c46e8d6a53da 100644
> --- a/src/pcm/pcm_dshare.c
> +++ b/src/pcm/pcm_dshare.c
> @@ -201,11 +201,11 @@ static int snd_pcm_dshare_sync_ptr(snd_pcm_t
> *pcm)
>         snd_pcm_direct_t *dshare =3D pcm->private_data;
>         int err;
>=20
> +       if (dshare->slowptr)
> +               snd_pcm_hwsync(dshare->spcm);
>         err =3D snd_pcm_direct_check_xrun(dshare, pcm);
>         if (err < 0)
>                 return err;
> -       if (dshare->slowptr)
> -               snd_pcm_hwsync(dshare->spcm);
>=20
>         return snd_pcm_dshare_sync_ptr0(pcm, *dshare->spcm->hw.ptr);  } d=
iff

--- a/src/pcm/pcm_dshare.c
+++ b/src/pcm/pcm_dshare.c
@@ -199,15 +199,17 @@ static int snd_pcm_dshare_sync_ptr0(snd_pcm_t *pcm, s=
nd_pcm_uframes_t slave_hw_p
 static int snd_pcm_dshare_sync_ptr(snd_pcm_t *pcm)
 {
        snd_pcm_direct_t *dshare =3D pcm->private_data;
+       snd_pcm_uframes_t slave_hw_ptr;
        int err;

        if (dshare->slowptr)
                snd_pcm_hwsync(dshare->spcm);
+       slave_hw_ptr =3D *dshare->spcm->hw.ptr;
        err =3D snd_pcm_direct_check_xrun(dshare, pcm);
        if (err < 0)
                return err;

-       return snd_pcm_dshare_sync_ptr0(pcm, *dshare->spcm->hw.ptr);
+       return snd_pcm_dshare_sync_ptr0(pcm, slave_hw_ptr);

> --git a/src/pcm/pcm_dsnoop.c b/src/pcm/pcm_dsnoop.c index
> 729ff447b41f..9abbbef2c1b6 100644
> --- a/src/pcm/pcm_dsnoop.c
> +++ b/src/pcm/pcm_dsnoop.c
> @@ -134,14 +134,14 @@ static int snd_pcm_dsnoop_sync_ptr(snd_pcm_t
> *pcm)
>         snd_pcm_sframes_t diff;
>         int err;
>=20
> -       err =3D snd_pcm_direct_check_xrun(dsnoop, pcm);
> -       if (err < 0)
> -               return err;
>         if (dsnoop->slowptr)
>                 snd_pcm_hwsync(dsnoop->spcm);
>         old_slave_hw_ptr =3D dsnoop->slave_hw_ptr;
>         snoop_timestamp(pcm);
>         slave_hw_ptr =3D dsnoop->slave_hw_ptr;
> +       err =3D snd_pcm_direct_check_xrun(dsnoop, pcm);
> +       if (err < 0)
> +               return err;
>         diff =3D pcm_frame_diff(slave_hw_ptr, old_slave_hw_ptr, dsnoop-
> >slave_boundary);
>         if (diff =3D=3D 0)          /* fast path */
>                 return 0;
> --
> 2.34.1

