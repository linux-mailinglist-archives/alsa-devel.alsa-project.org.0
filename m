Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5F64D44A2
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Mar 2022 11:32:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A1D318A2;
	Thu, 10 Mar 2022 11:31:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A1D318A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646908323;
	bh=gLquDx1RI/q2ltZ7Z1rVx+fmybCc2BMxnQ638G4xrgo=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EnKwwHC7vFQSYnaHTKcN+qDPjSk1cs0pC53u+nV4XViwzVtUFGGlGJaPOoJkW2voJ
	 h4FW1MDs+Dxeopkva++g3VRpBhjqt/k0K/LKLMDrxXXfekDN9vp22xEIUjtMDR/Oxq
	 L0uaDDCi4FqFjpsCBh48VeXoV1TfkC9fY32orURE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9BEB4F8013C;
	Thu, 10 Mar 2022 11:30:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EF2DDF80137; Thu, 10 Mar 2022 11:30:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on061f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0d::61f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C740FF800D2
 for <alsa-devel@alsa-project.org>; Thu, 10 Mar 2022 11:30:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C740FF800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="k+R7md3Z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l8D4QEOG0FZA/psONPq0ijgyN7L7mX+F0LoBuuizDT/hwF2hVsS+QYIerS4HEh/HCP6Z2GyqMjgRxN3QV/vvH9raUMAUBegkld2Ysx0ON8i/aBAk5YKY88EcDm/pee+HbdgAzVs8Vx0FhEP/XMD8MhwQKVr/nix56s6TiOIzMovUw3AKRDLFETgL8mjBCRi7klMSGjQgQjGyjtG95s+GvVeZuXCbHQutG8NjKlYATQ90I/80KSXN4TAsdkGyJcdXD3hR1vAkNLutswzBpnm7OQPqpFR0su8G3vWHGjB4ATa6JuhH72JKyqzwiR+iRnjdDzNaI3Sbvax0qgBhxVBM/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H/9+OcLAGkO79Zgyb4DxDH6l/LyLpIv/SvZ4FWmVMbA=;
 b=PV6xLWY2SXMP4SfbSmyocaJvnv1EhE7AhqV/PDVi3Ttqcswr6Kqlzw13/G0MWDI1ExPUBAvM3M1W0FSOeMPjknw0HOBG1jYt9YwvNE8mO0Ai1YVBS2rgJZnjvrf4XL/kqenr4elrgLWs+VvWx8/BBEt9vw8EDYgbadU8YwtuayAXseXBivqaEK9v6s2AxwaXaGjrwd5uB6AWkdSOnq1lO4xHgdlxnzK42qcwGKF5Ze0kC/Zk9FqYbZzwZFqRDA8rj+z+CaqsTWMuO91fxDj5xo13m0RFOzUvahAQxXm0j/VzZWpHnOZcpBWthd4Iv93hpQLSrQNBLy9jUU/FkyBSQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H/9+OcLAGkO79Zgyb4DxDH6l/LyLpIv/SvZ4FWmVMbA=;
 b=k+R7md3ZwwypbEJ9+n/meVRcVLa+DYB1A1vYCxFNUnFcy73b3UWHhVDJlSCQo1LJ2E4GC592xOnVJmKStebQXzgJnPbGU2ZH5yi1POtiaJZyIfXi6YClvOF026oipTLcjRueHaC15ntaUto5l28zO80rilmvDqkwJDcuoFnZnek=
Received: from PAXPR04MB9089.eurprd04.prod.outlook.com (2603:10a6:102:225::22)
 by VI1PR0402MB2893.eurprd04.prod.outlook.com (2603:10a6:800:ba::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.16; Thu, 10 Mar
 2022 10:30:41 +0000
Received: from PAXPR04MB9089.eurprd04.prod.outlook.com
 ([fe80::bc25:a82e:ab71:84fb]) by PAXPR04MB9089.eurprd04.prod.outlook.com
 ([fe80::bc25:a82e:ab71:84fb%8]) with mapi id 15.20.5038.027; Thu, 10 Mar 2022
 10:30:41 +0000
From: "S.J. Wang" <shengjiu.wang@nxp.com>
To: Takashi Iwai <tiwai@suse.de>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>
Subject: RE: [PATCH alsa-lib v2 3/3] pcm: direct: Check xrun/suspend before
 the slave hwptr update
Thread-Topic: [PATCH alsa-lib v2 3/3] pcm: direct: Check xrun/suspend before
 the slave hwptr update
Thread-Index: Adg0adVaIdZ7vMpGSF+yKR+SnpdACA==
Date: Thu, 10 Mar 2022 10:30:40 +0000
Message-ID: <PAXPR04MB90899426B46947FC75147807E30B9@PAXPR04MB9089.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3d07d27b-b78a-4fa4-a41e-08da0281068f
x-ms-traffictypediagnostic: VI1PR0402MB2893:EE_
x-microsoft-antispam-prvs: <VI1PR0402MB2893BBC72007B11267E4FEDDE30B9@VI1PR0402MB2893.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0tABy6FeLNksohdwefN8BLShJD/HFiv5/2DON52mtDNrWVxiraT5lRJu2FpYQynheH1FTm1QvXOX61RUl4nOP/DKCgP6r2iC2dDycuWd2M5pCFgn01Un1nd1Jd6px5j4U5BTIj9GJ4fet9Gp8XYyPfMfnVZfX7OAsgRrn84ud7mN5q184boIM1umAUGpNkoCulyu5Aap3l363uWjjkSyFLbwa68Dxyvk3xsmZcjvm7WlLdIRxra0gt0VE6zOm0afWVO7+0jMrtK0w6ayF8Yb6njkCpUc8cDhy+ZGOI2i2R5rFf0HZRAgZvbLFBNfiuFoza5TRm/0GnPHky3lyR6csv2VYBnweOjaiDt35MClZCp4pTFewLMxoAu6VPAk6iOcQVO8CgLMt0sC0oNqC6bT0WVMR/kkmqDYXWNzzuNYBkUstFLlHHDS0ANg7ryEahVYGI86KucIDysuhXKay9F7MCzoWjLEQxnSExoKY3/+cdwyZiH9uUT817x3mj/BCih0vKESwns3cM5TsE/aUyOC9p0sjZaFG1wkVfIbCbysbJRutPUfSa8kvnWUT2ZNxYwPyZDyI2dhXyNVB3ZWhMvTGRueHSwMHMh2UbBFXM/rzn7nJhT2TwQFjL+eRpJiRTSBjpIPs0zNvr0gO8mIjnCCFF6mfOgy8d06VnJrbELf+w8PFqzDwbPlSZnd8LggYK3HjyGJBiBw3NivLk7z8xJzgQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9089.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(33656002)(38100700002)(2906002)(498600001)(71200400001)(7696005)(9686003)(186003)(76116006)(66946007)(15650500001)(52536014)(8936002)(8676002)(5660300002)(110136005)(122000001)(66556008)(55016003)(86362001)(66446008)(83380400001)(66476007)(64756008)(6506007)(26005)(38070700005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?74KmF8mS7NVGD98YIKL5OHhLrUZ/qGZLZU00XcQoUbOmLzgQy6cKG9KR+8H4?=
 =?us-ascii?Q?ffDNXnJZplVzPAhI1T2VeiyQ6pjz4EIKFELxryrfBJqF0U7WIMUyTLB0TXcs?=
 =?us-ascii?Q?6R8LT4dOeXmm2PlgtqVi9Aqb/HIUEkh+6KBt4QLVyhrru+em1GrivBaGAhoH?=
 =?us-ascii?Q?L4pD8fUv+KyFLa7c29sXU0N3eYK520wqtfta0RXY6/ify5F04aNzeq05AfUt?=
 =?us-ascii?Q?5jD5vjuvRk3BGt2TFxQn5lVuon7LQo0nVpv5Fj+/SydcW8OHX9/cWNXa31eR?=
 =?us-ascii?Q?RmBcnCvRJPjnXgaBvOD2qsIiCMfE+VXL6eHbdWjYAVo1n4W4Zi0hJ/znvL30?=
 =?us-ascii?Q?W6taXDGry9nuSIDQ8RwtQogN+TDkmBT3d4Br3tbzbyBdqgD4BDTqRV0l0T4Q?=
 =?us-ascii?Q?1VsL5SJAuuwN6D7Aw/kk3XFnr9tSfHzVnTM8G0zafBkoMy4rEE9Pg5hXyn/W?=
 =?us-ascii?Q?SOr61n2Wru0M+fh4SquGOdR4FeEob24c5XWdN9QPo0OHH9/TtfkEBpP4yj1S?=
 =?us-ascii?Q?vvt3jgbVTFjX1wOsa6XSzvgtKe2wW+5AeG/YyaPc7ePsdQ3EzwTMy7AAj6NM?=
 =?us-ascii?Q?2HlFCujRstRjat4zrQ2P4JAK0+agMemTMgcXJLVKL2Gvh7wAMKrQKoHjEB3c?=
 =?us-ascii?Q?iReSs5ZAjy5kieYloQQQ/B6Kkv3YpqiTEweBrhFc+XCGVn08kY3IGWgHiWrw?=
 =?us-ascii?Q?a9nzW4VNJsxIm3BDhu1hadLi95OxNa9LZPbuPOKVfLXv6S9XFwKlgjU6ZCuP?=
 =?us-ascii?Q?ZaAmcjg6KMAUNF53o1f35xGmwe1FL0R4jr3qCSsfv6mvqbBmdwu/yjjMOQKv?=
 =?us-ascii?Q?COzTiDOYx4+CgL9jbGyUvB1OccRJ7DSfFnHr1hY2lcWIrluCw9iPtIhF/mZZ?=
 =?us-ascii?Q?0001xyYYIQuwoVd2Ds3yGn1WmYVXfcMeSfyESMg58C/XLV53+WvTcukCAksW?=
 =?us-ascii?Q?h2nuY3dUmMjYpKs1BWftUnUbD/NsS0Rpc1vURzvspxNP2AiY20E34O3jvfTB?=
 =?us-ascii?Q?CENDAOUh2GnHmFY1JfgS6M3dZN5izsMvTPu4u7tjM9QnVa0Wa0aI6d2j2K7g?=
 =?us-ascii?Q?rdhLrHUhs8TsNe7AL7FwqfsfQAsyZ8cMNOmkhiJFRl1DNco5pBlVveEo39/G?=
 =?us-ascii?Q?FvX3rs4IcGWiYq0xN1GE2jBumJ1/q5au3idmt9GJFA0668mzdFINVJSW4cNc?=
 =?us-ascii?Q?14OYMA1rBkPZxWpnxDLt8OucstCQxA8TsiSrlADfD7xulv6N/yHp/SrGL5O9?=
 =?us-ascii?Q?Y6c97IAkLLkNZTG4IlU8G/pf7zTzW7bGry76XNmzBUObNcIBNIoXdyYsZhzZ?=
 =?us-ascii?Q?qr51mfZ02siHKGz6T0tgcY+j7R6oUtLbMqq5CSimKFnJr/OfAApNM/K1OhS/?=
 =?us-ascii?Q?WLft9p9tc/QfS+d6ScysejJ+kRY9UJHlLN2NrVtL3b94DfsnjI0WwMVMmVi2?=
 =?us-ascii?Q?gIPjquAC1tfs2/8S2gijXVnMeebOi3qlsLNMObYYbIaVyLzA8oposr/78yAm?=
 =?us-ascii?Q?nFKKvliQFT7sDUswIHFx0yNOEMKK1CulYXzox6rdkX6R14Ja0/K18ku9iyyp?=
 =?us-ascii?Q?RCVb6+0A3/LNxuVmDT5S3At6TtYyXtYBcIkuBZnO2NZQ8CuxDKzOD9e++GFL?=
 =?us-ascii?Q?UA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9089.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d07d27b-b78a-4fa4-a41e-08da0281068f
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2022 10:30:40.9678 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cZ8X/Nw8L7GAYUJhvcEGWBQjLjQEDfPrp8Sv3JV+CjR1w7lz9/K6LlitslLL3C+ovAegxAzSY/cFAefCh9vTPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2893
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

Hi

>=20
> The xrun/suspend may happen at any time and we should check it right afte=
r
> the slave hwptr update (but before the actual sync_ptr update in direct p=
cm
> side).  Otherwise the hwptr value may be screwed and get unexpected large
> read/write.
>=20
> Reported-by: S.J. Wang <shengjiu.wang@nxp.com>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

Acked-by: Shengjiu Wang <shengjiu.wang@nxp.com>

> ---
>  src/pcm/pcm_dmix.c   | 8 +++++---
>  src/pcm/pcm_dshare.c | 8 +++++---
>  src/pcm/pcm_dsnoop.c | 6 +++---
>  3 files changed, 13 insertions(+), 9 deletions(-)
>=20
> diff --git a/src/pcm/pcm_dmix.c b/src/pcm/pcm_dmix.c index
> d00d53bef604..c6cb47f0f840 100644
> --- a/src/pcm/pcm_dmix.c
> +++ b/src/pcm/pcm_dmix.c
> @@ -424,15 +424,17 @@ static int snd_pcm_dmix_sync_ptr0(snd_pcm_t
> *pcm, snd_pcm_uframes_t slave_hw_ptr  static int
> snd_pcm_dmix_sync_ptr(snd_pcm_t *pcm)  {
>         snd_pcm_direct_t *dmix =3D pcm->private_data;
> +       snd_pcm_uframes_t slave_hw_ptr;
>         int err;
>=20
> +       if (dmix->slowptr)
> +               snd_pcm_hwsync(dmix->spcm);
> +       slave_hw_ptr =3D *dmix->spcm->hw.ptr;
>         err =3D snd_pcm_direct_check_xrun(dmix, pcm);
>         if (err < 0)
>                 return err;
> -       if (dmix->slowptr)
> -               snd_pcm_hwsync(dmix->spcm);
>=20
> -       return snd_pcm_dmix_sync_ptr0(pcm, *dmix->spcm->hw.ptr);
> +       return snd_pcm_dmix_sync_ptr0(pcm, slave_hw_ptr);
>  }
>=20
>  /*
> diff --git a/src/pcm/pcm_dshare.c b/src/pcm/pcm_dshare.c index
> 0ff43a90d270..461adafc77f8 100644
> --- a/src/pcm/pcm_dshare.c
> +++ b/src/pcm/pcm_dshare.c
> @@ -199,15 +199,17 @@ static int snd_pcm_dshare_sync_ptr0(snd_pcm_t
> *pcm, snd_pcm_uframes_t slave_hw_p  static int
> snd_pcm_dshare_sync_ptr(snd_pcm_t *pcm)  {
>         snd_pcm_direct_t *dshare =3D pcm->private_data;
> +       snd_pcm_uframes_t slave_hw_ptr;
>         int err;
>=20
> +       if (dshare->slowptr)
> +               snd_pcm_hwsync(dshare->spcm);
> +       slave_hw_ptr =3D *dshare->spcm->hw.ptr;
>         err =3D snd_pcm_direct_check_xrun(dshare, pcm);
>         if (err < 0)
>                 return err;
> -       if (dshare->slowptr)
> -               snd_pcm_hwsync(dshare->spcm);
>=20
> -       return snd_pcm_dshare_sync_ptr0(pcm, *dshare->spcm->hw.ptr);
> +       return snd_pcm_dshare_sync_ptr0(pcm, slave_hw_ptr);
>  }
>=20
>  /*
> diff --git a/src/pcm/pcm_dsnoop.c b/src/pcm/pcm_dsnoop.c index
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

