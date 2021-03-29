Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C0934C587
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Mar 2021 10:02:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 276451616;
	Mon, 29 Mar 2021 10:01:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 276451616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617004945;
	bh=XMfKk+mH6hAvzb6p+g6V0IkIvhEdy/1Nv7qgYMBk2XU=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XLPhsohBlENiuADBzs9DsHwupq/rFKNBZT8le9q21FO+t8gdlON7AfE11JReM6g/Z
	 46taatYZQalLb6kO+N6c5QRylLmCP8HP305V//CPKAl964Nron/rAKjmlvll1/d4ac
	 F7J4MNcvdWuFloGrz4qdTBIf9IqV1mlupEn4nMcg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 79AE0F80157;
	Mon, 29 Mar 2021 10:00:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E6648F800DD; Mon, 29 Mar 2021 10:00:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PDS_BAD_THREAD_QP_64,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E645CF800DD
 for <alsa-devel@alsa-project.org>; Mon, 29 Mar 2021 10:00:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E645CF800DD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=st.com header.i=@st.com header.b="UyGlS34o"
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12T7w1VU002436; Mon, 29 Mar 2021 10:00:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=yIOLZdcWTg/i/hNAy7PCnYN7jCAFFNCKIJbaV9azq4c=;
 b=UyGlS34ozvlveaccKfqtwmSnjvW0+eHbE1PQppNKlmPoGv9YFwsgYRaNsHA/30+zDOyN
 BzRGRX2xE/S6A5VhbBx0mFm2vnKtb5niTj/5KJ/4AfvPZJYXd2uumHqoAD+wbzs2zbK0
 TyAgDqLAlqHVDTIABlVBtgqd/XgyzTHWxf5QcgKPhBz66YUUd7bExEcft6DlNkJwtZ8E
 5eX7apXUPP0re3mvc8yTIus8MZtyxv1Kf7jR2Suxltdt3Pcl0NJ5fnPUPFNEYdRO8ii1
 oFxgPJizjK2wKLX9c8dzIhFUkObGotJcsu+NH9lsemKktwDvYyechm3q5bCrfR/NPRIP eA== 
Received: from eur04-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2058.outbound.protection.outlook.com [104.47.14.58])
 by mx07-00178001.pphosted.com with ESMTP id 37jy132qyp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Mar 2021 10:00:38 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q6Pl8a2w0tO0//sXy2aKK2Bobo3eUgowE+6TWeyZxarTWZd9sa2I0EQ2lJH5epSnJ7K+svtrdqrjU5fu022UqVnf3m4NhZh540AS7250OBA8yI/LyOUUoD7b4Cjn7C+hP3Qzr0JziBVSkepAQ9gw4X2jE531NkQRs3Op6hSsea1mOPrF0A1z9rXraQmxb37FLEqbQW7DQ15al3RFqeyxQq9jEGNE9zifEBNSsmWjKpk77CLSwoh8qJiUE9QSkDEvGpNhSLaZa9t0qFt8NBeYnslMhPWgTdyN59Q4cwC1JG1N4eKK0Yxqun7uMNXxrsb1Q2WhF+We4zRQuKZRRpOm7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yIOLZdcWTg/i/hNAy7PCnYN7jCAFFNCKIJbaV9azq4c=;
 b=ercn/N2YUg8WKu/Az8cT7W9zzaHzb+mzH7tzNPhjSxqJgn4RNvFsgtj3ZGunfDYSpdj15ZUT7qNh+jgP+ytgLc0SSb7GLBASrNyAizkh+BGzJw1Iy/RdKHHzT+JFEKk7DPS/TIILXPMIR9ZtFAUSoqRvof5cc3jmBCGH3oWnrld+K3wC998SkX8+1Y8HVj9YPknDUMK2GvhFleRM0O05f+MG4guOXCg+nloud9LRZzvltfT4iU5qpG4Jow9SXykKVabuF65qowhRRv+hJAMboS031Mah+BlFtGDM70sh2VdAJwVm4+/24kM7IBBBM+t0EuA8jbpi/lbj6nFVpwTeHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=st.com; dmarc=pass action=none header.from=st.com; dkim=pass
 header.d=st.com; arc=none
Received: from DB9PR10MB4746.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:23d::22)
 by DB6PR1001MB1429.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:b5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.30; Mon, 29 Mar
 2021 08:00:31 +0000
Received: from DB9PR10MB4746.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::81ed:3852:ada8:9b98]) by DB9PR10MB4746.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::81ed:3852:ada8:9b98%6]) with mapi id 15.20.3977.033; Mon, 29 Mar 2021
 08:00:31 +0000
From: Arnaud POULIQUEN <arnaud.pouliquen@st.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: RE: [PATCH 09/17] ASoC: sti: uniperif: align function prototypes
Thread-Topic: [PATCH 09/17] ASoC: sti: uniperif: align function prototypes
Thread-Index: AQHXIotsEijZJQHh4E+llmTFXyVB9aqanZQA
Date: Mon, 29 Mar 2021 08:00:31 +0000
Message-ID: <DB9PR10MB4746BFA99998CD92D43521BAF17E9@DB9PR10MB4746.EURPRD10.PROD.OUTLOOK.COM>
References: <20210326215927.936377-1-pierre-louis.bossart@linux.intel.com>
 <20210326215927.936377-10-pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20210326215927.936377-10-pierre-louis.bossart@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=st.com;
x-originating-ip: [165.225.76.79]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1de9be7b-c681-41d5-e72f-08d8f288b9a7
x-ms-traffictypediagnostic: DB6PR1001MB1429:
x-microsoft-antispam-prvs: <DB6PR1001MB1429389E1049BDA259D2D771F17E9@DB6PR1001MB1429.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:449;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NFpZ840wp1n4ueqhNC/z6UeKv1bcbUdX57gIWbw+UGE5JQ4ekGg6wftPe3zvixkGemIuo54CqbQ37np5IaKtIwPjtxZgN3DoMEd9oEPLiFZlE3qSTup4q79KpZSvot1IZI1zat2bWYcFlyCSo1tmsQGCvCjBodwLiGwBQ9l5R/E9Evu4VgjsRl0gqr1EEMtJD+PU2RTLDpjFGqOKX6EUMy0mkmRQyaVv/LGGXAd+rH1RNEiyHiAj2cv1nYMLgUs4zfhFEtfkFrBDbf6AjZGQWAur65qeJCLf0EbrjVKm/9xo1bFF9QPG/rVBHYrX5t4O7cVq693cpn2e6T4uOGrLWM0ynXTwW24cfMUT0hcV9P7bw3kpFH/Wla9OBNfiSzCtzSbI7lE2KNn2j6/vsnMr2ACZqpO479IObzmYoTtaKWz7FuzPddbjWwwBkNUxWeLTK/seHEgUn/YWqMX7KUa0NH2537iedb5VdrEKwiLGXtkKIDE5q+PDOhuMaViqPyO/ooeGo1+CMqOU8n7wBmzySq8vsk7UgqkMHirenvdQun7ETWJnpj5XGEi/uuy71gmlRubJqEmd0JR1xpNgvdr/2PYjgufSEwInIKsZPs633lsc1X7vQ8m2grvaOWcNiIAT4RM3jlbB7qsa6agGpBZAOg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR10MB4746.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(376002)(366004)(396003)(136003)(478600001)(86362001)(5660300002)(4326008)(38100700001)(110136005)(54906003)(66946007)(6506007)(316002)(53546011)(83380400001)(8936002)(55236004)(26005)(9686003)(52536014)(7696005)(76116006)(64756008)(66556008)(66446008)(66476007)(2906002)(186003)(71200400001)(8676002)(55016002)(33656002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?7dSc54ZYX+pi1Z7jxDlVJfUAWtHHKLMd343T3JEDc3MHMBc5w+Fm+NX5lUyk?=
 =?us-ascii?Q?1rnvICjINSmCG6LVCiNtJw4xBshJdPafo/tbaauEpX6W3Y9QVfODXvvmJefi?=
 =?us-ascii?Q?P0uq5357gtv/YT8Q+ptGR8XKoV0dS5bNHubYJhen25Xf22AeUuCMhD9bYi1C?=
 =?us-ascii?Q?epCjDcfhczYpILAOVyWdG/oAFJRf67D5P+8gQ2jhfiI5wLWLpjjjTMKj8flg?=
 =?us-ascii?Q?9JqqZcP+nS8hx7VkKWhX3N2NiPBrSqZFKldZ4kMAiM9a7ftec/xRQya9iMoR?=
 =?us-ascii?Q?9wkzqrJ01fagskyvniSRpoKiXW6rG3vJBF46ewSUuB/PUiCl6IQ5pee908y8?=
 =?us-ascii?Q?tcGUF0LOKHBSCb7Mp4lhVQNnF8mEBaJG7zW6Wq3LtL+klEG5VJ+hQMtbcCcU?=
 =?us-ascii?Q?W20flDd2JXWKCcEG1RhnuuoSC83Hqic1VMTvTVbI4h0gzLWTyDOLkTfPvL1O?=
 =?us-ascii?Q?0QtYEnPmgtR2n8N1ezRka1UZxwDplmBypyU6yUXdwpHiTXMyHmVQ7lNKvu41?=
 =?us-ascii?Q?a7Rbr9QhObUxb45tnw+dfYv79ObS64sTC9mh+JLGmvx6fSJNnRa5hPVdQ79Y?=
 =?us-ascii?Q?Tsd+qJz2i3Gir8G+sX/2EQy5dO61zn1mhWrnuYF+SoQ9ADKPsnBFuUjdTgnr?=
 =?us-ascii?Q?xVQA0uSyX+2CGnpRkx5jsGwLQxZdMEFYiXthEmQ76U/cOwz1S9zx7cAXltw5?=
 =?us-ascii?Q?8hJt35Gy9oXkwKLahgiGRufz3BIQUxPq61XXjor1zVWF/9SHDMtGUgKMtBhO?=
 =?us-ascii?Q?I9ydkTwsWeDE7tiewdYdjLem6o9w0vI7Tzjq0A9OH7/pjrbHKxdxWF2ldPTl?=
 =?us-ascii?Q?6oxTvy/kXTW2uo4m+mevawWYP4KrcfC1ivPm90oziUk0o5Vq+8Jm9pbZflMz?=
 =?us-ascii?Q?+rc2nc1iZ+OBABYJuTuZwbXXkFxXImNJgX2i90s9pz/hcSI4x1FSynfgYq7R?=
 =?us-ascii?Q?+mOeQE/MrKXnYun3qeg147ZxJ5BPTvdllxM2MHR4MYfvBPtgJYPcmyrZ6DhZ?=
 =?us-ascii?Q?cR43u3Bo5bhNOVy+241KEIvcREc1kQT5okLuemwElQPHNd0Qpqgqyef4zpMz?=
 =?us-ascii?Q?gcExDhVXlhPMw079UodcfotDszru3/SL+YZVvVfr3VMHLH5GMI1cnEBd/1+Z?=
 =?us-ascii?Q?gcO8GYat+2SF0VX9SqxRc0WQwcu0U/fk5nksTmUC5YZl3qhD5GipusNsW+sL?=
 =?us-ascii?Q?PwWQ8bEz15GeZDWr64ZjtJWHbuPTf3l8kdhl2CpMxZLHlwY3jyQUF40NCwMH?=
 =?us-ascii?Q?T7WT9fzZrnvyn9XUSNqZhoSUEgRl0LPkkj/ASJ4uX3ZQtPvP8H/Xhqv9Td2V?=
 =?us-ascii?Q?MTw=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: ST.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR10MB4746.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1de9be7b-c681-41d5-e72f-08d8f288b9a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Mar 2021 08:00:31.4629 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bEjRkS2mWTw5CK408oi/53kpDUiUP+RLVZqP+jf9pAfhqeRXWKdA57FvqLskbHcdcnh8UeQSg0BYGL657kNSQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR1001MB1429
X-Proofpoint-GUID: JCQx20V0OoNtLXLBD5y0nlS1K_wYNuZo
X-Proofpoint-ORIG-GUID: JCQx20V0OoNtLXLBD5y0nlS1K_wYNuZo
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-29_04:2021-03-26,
 2021-03-29 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 impostorscore=0 adultscore=0
 phishscore=0 suspectscore=0 mlxlogscore=999 clxscore=1011 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2103250000
 definitions=main-2103290061
Cc: Liam Girdwood <lgirdwood@gmail.com>, "tiwai@suse.de" <tiwai@suse.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, "broonie@kernel.org" <broonie@kernel.org>
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

Hi,

> -----Original Message-----
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Sent: vendredi 26 mars 2021 22:59
> To: alsa-devel@alsa-project.org
> Cc: tiwai@suse.de; broonie@kernel.org; linux-kernel@vger.kernel.org; Pier=
re-
> Louis Bossart <pierre-louis.bossart@linux.intel.com>; Arnaud POULIQUEN
> <arnaud.pouliquen@st.com>; Liam Girdwood <lgirdwood@gmail.com>;
> Jaroslav Kysela <perex@perex.cz>; Takashi Iwai <tiwai@suse.com>
> Subject: [PATCH 09/17] ASoC: sti: uniperif: align function prototypes
>=20
> cppcheck warning:
>=20
> sound/soc/sti/uniperif_player.c:1049:24: style:inconclusive: Function
> 'uni_player_init' argument 2 names different: declaration 'uni_player'
> definition 'player'. [funcArgNamesDifferent]
>       struct uniperif *player)
>                        ^
> sound/soc/sti/uniperif.h:1375:24: note: Function 'uni_player_init'
> argument 2 names different: declaration 'uni_player' definition 'player'.
>       struct uniperif *uni_player);
>                        ^
> sound/soc/sti/uniperif_player.c:1049:24: note: Function 'uni_player_init'
> argument 2 names different: declaration 'uni_player'
> definition 'player'.
>       struct uniperif *player)
>                        ^
> sound/soc/sti/uniperif_reader.c:411:24: style:inconclusive: Function
> 'uni_reader_init' argument 2 names different: declaration 'uni_reader'
> definition 'reader'. [funcArgNamesDifferent]
>       struct uniperif *reader)
>                        ^
> sound/soc/sti/uniperif.h:1380:24: note: Function 'uni_reader_init'
> argument 2 names different: declaration 'uni_reader' definition 'reader'.
>       struct uniperif *uni_reader);
>                        ^
> sound/soc/sti/uniperif_reader.c:411:24: note: Function 'uni_reader_init'
> argument 2 names different: declaration 'uni_reader'
> definition 'reader'.
>       struct uniperif *reader)
>                        ^
>=20
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com=
>

Reviewed-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>

Thanks
Arnaud

> ---
>  sound/soc/sti/uniperif.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/sound/soc/sti/uniperif.h b/sound/soc/sti/uniperif.h index
> a16adeb7c1e9..2a5de328501c 100644
> --- a/sound/soc/sti/uniperif.h
> +++ b/sound/soc/sti/uniperif.h
> @@ -1372,12 +1372,12 @@ static __maybe_unused const struct
> snd_pcm_hardware uni_tdm_hw =3D {
>=20
>  /* uniperiph player*/
>  int uni_player_init(struct platform_device *pdev,
> -		    struct uniperif *uni_player);
> +		    struct uniperif *player);
>  int uni_player_resume(struct uniperif *player);
>=20
>  /* uniperiph reader */
>  int uni_reader_init(struct platform_device *pdev,
> -		    struct uniperif *uni_reader);
> +		    struct uniperif *reader);
>=20
>  /* common */
>  int sti_uniperiph_dai_set_fmt(struct snd_soc_dai *dai,
> --
> 2.25.1

