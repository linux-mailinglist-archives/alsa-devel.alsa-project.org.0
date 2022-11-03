Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 043E461929A
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Nov 2022 09:19:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8FF891E4;
	Fri,  4 Nov 2022 09:18:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8FF891E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667549939;
	bh=O7hALah2G29BnIXRb8dzxodPReRxnrvTBzIYOhe4Om0=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BiICm+4tTpurmn+s1EBc+rTnsu5oIJSRg+1fkEyc8tt7HFhR0hgfcO1oJmrkOcuql
	 8iuhEeaIm+EDJTx4dJBEdujsxibIjsYwu2W+U/c6WyAqJzoxCsl92JqIDaloAwGIL4
	 ufODSsWtqz8dA3OylPq/ivrVavMRD4zmKK2hQGwc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7DEF1F8057E;
	Fri,  4 Nov 2022 09:16:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BDFFBF8051E; Thu,  3 Nov 2022 15:23:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mx07-002baa02.pphosted.com (mx07-002baa02.pphosted.com
 [185.132.183.154])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 52439F801D5
 for <alsa-devel@alsa-project.org>; Thu,  3 Nov 2022 15:22:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52439F801D5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmv.com header.i=@gmv.com
 header.b="WfvSFaJT"; 
 dkim=pass (1024-bit key) header.d=gmv0.onmicrosoft.com
 header.i=@gmv0.onmicrosoft.com header.b="QVXvU+I2"
Received: from pps.filterd (m0205085.ppops.net [127.0.0.1])
 by mx08-002baa02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2A35k4Gn007225; Thu, 3 Nov 2022 15:22:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmv.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 mime-version; s=gmvcom; bh=G1nU0jgO5z/wq0Ol8ykxyzekBgxVRc9GQg8KvA5vozg=;
 b=WfvSFaJT65S3RiTAMS4bqR3nSvLsDNj/+hqtHrkv1AjgE2luOct7rjrIHTLXLmUNiOgz
 akBcZSSjnx6zKhImQORBx/GADdWjChrbKOk6VQSEizEXRaNhcqwhSl006YTOp2qrAwGW
 KthJfcSztT3figd14e6hmAjrqwdl1K3wInTF/EV/WwiFPMN1fl9cLdA/KcIf+ylcDPR9
 R8hvxaBrccjvg8wINRtbU1KtwyFxvuw2ljmDe29FHQGoLt+4cGFf3D6V4ZNbOG4mH5Ts
 ClAZ1CawP45AF3Eyv/o+X32BiH1H8A91vzZPQKAv8+6F38Pubd/2GFJd45mMgbErAM7h 9g== 
Received: from eur01-he1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2051.outbound.protection.outlook.com [104.47.0.51])
 by mx08-002baa02.pphosted.com (PPS) with ESMTPS id 3kjhfe2ts7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Nov 2022 15:22:55 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YNx798KasGMt8K2kgnonXU3B3lshdAQOgbRISBhzku21AmZGmYgajCOLxxkjn+bJKSiohldS9B5nb3DOwUWUAJ/kMc6XcQy4QNw4Bl2xLgNeHOu5safMTVFx5AbcluwcENNB+xwtY+VwwF2jjPTYsF48opeB3PDN/Z2xCVzM7CaQq1gwMwCWgV5Ubk1JeRKhABxyrdkVmIpIqSwy+W0FRxnL3M0reuW9m1WMZoTKda6n1VZvR6cKK1mTkSqAs5yY4/gD3yW6ctz/zzTOMvLMpOMyK6Em1pwZsWO5CKMIkfga8feh7tZqyt+WA0Qkz4UsEVu02JdXIRDCfQWvr3KTYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G1nU0jgO5z/wq0Ol8ykxyzekBgxVRc9GQg8KvA5vozg=;
 b=jzgChD0F9xd4sMu79il1FmQhROzMhgUux4e9YEPwfYvxwtwLCgpA4DvmSA6tbxELockHo+01So0YBpD6GuENz48/eQAUk0IqJMWpkPeu0dTjqOf91lQNn98C+G6TpSY3yRFWZspHOSbpSE1rtpSME4+QQKjOr6+c3pvlzQLYtZcxJWID+QgdfkXcGrwX5isB4/ShB+HgexFVYJBYIzvbiZVpxbIYQyPhwYLEQCwHE3+ox6G4VeZI1sU7is+0v11UZ5ec590aZtA3nLlsYO91Q0EEnxNEOSvLa+MIFimj7VvntCS6XS/Ch0QaJFA9v7x6059WvSxR76l3NX/dkynkGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gmv.com; dmarc=pass action=none header.from=gmv.com; dkim=pass
 header.d=gmv.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmv0.onmicrosoft.com; 
 s=selector1-gmv0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G1nU0jgO5z/wq0Ol8ykxyzekBgxVRc9GQg8KvA5vozg=;
 b=QVXvU+I2QuaB7UNifmxDEDN0BaXoDuDrmdweCHC7V8KML6GQBVoPKCGaaCw9olGo8fKHpGnB3YPyvr5k/Gb7FmMbwDTqu9Ku7WDay1I2+R6KJgBYQZSvblJ9QCxiJMT79iPmrDygNUkwhJjg06tS4wmD1BOBKjN2aHLZGnSm8v8=
Received: from VI1PR07MB5839.eurprd07.prod.outlook.com (2603:10a6:803:ca::15)
 by PAXPR07MB8445.eurprd07.prod.outlook.com (2603:10a6:102:2b9::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.9; Thu, 3 Nov
 2022 14:22:52 +0000
Received: from VI1PR07MB5839.eurprd07.prod.outlook.com
 ([fe80::4dc5:a2c4:279f:fdcd]) by VI1PR07MB5839.eurprd07.prod.outlook.com
 ([fe80::4dc5:a2c4:279f:fdcd%4]) with mapi id 15.20.5791.022; Thu, 3 Nov 2022
 14:22:52 +0000
From: Juan Alfonso Reyes Ajenjo <jareyes@gmv.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] Fix tas2562 volume table values
Thread-Topic: [PATCH] Fix tas2562 volume table values
Thread-Index: AdjvhFHMhYr2+umyTwml7qloa11uJgAAzbcAAAIE4pk=
Date: Thu, 3 Nov 2022 14:22:52 +0000
Message-ID: <VI1PR07MB583938C86519E34431A248F2BA389@VI1PR07MB5839.eurprd07.prod.outlook.com>
References: <VI1PR07MB5839C95198DD090316E87B78BA389@VI1PR07MB5839.eurprd07.prod.outlook.com>
 <Y2PA8Bo59YDKvlRG@sirena.org.uk>
In-Reply-To: <Y2PA8Bo59YDKvlRG@sirena.org.uk>
Accept-Language: es-ES, en-US
Content-Language: es-ES
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR07MB5839:EE_|PAXPR07MB8445:EE_
x-ms-office365-filtering-correlation-id: 3c78fa7e-33f2-48f0-5ffa-08dabda6e4d2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ta1invTsPR95l03hsouTK3zy7KtJ5H7pJ4kVwaJrZwQWy4i1eVNV8kgJTYyytJ1kfan3bCaRzIR/8W6it9zR39Wv89MMM4LGgr6GU1OvQ6qcTpwl46pZoRUSUGGeVEPV1sPIKTs51wJvj0iNiFk86sbCyR163NN5yOjZvQSNM2WYnlzt6H5airzuM5vlmZxx00iOrFoXiD3nzuwOWi1RbzS2O1ah3vXsdBnWpzk9ouvjL7Gpg0m5eiauV90KBN+hvlS1HSSJJxszRKmwBw77g9kV7Fo+ByETWcNkiPiSDArC1a0qGQG4aBlB/fDklJVeO3yFbZFOsT7saptEFPZFiHhUJM8rueNZeygP9jgrUccSHMG2/X713Yst3TIv96KSVXcpkvaHhFQiyLUSUbs9x9woQhDdwRdg/e6nF50Xc8iWgX+IzvZXgJfxA9H98jyO6S7zlEn1LO0y/+J+t3G8biF/sGnTK+Lgs0BU/0P7Z6LElO5+Ys41FUUwQkMGtOd1U6M1RKTYAyp66NphIjhQz4vOUK7JXhAMCht7GkF7hM1h0QENKFz1rPYEx2NcSfMXhBmpF9n9HtOYLH/vnLmQUauIR4770HQYQlYJH7XnG4t3MmWwL72EZ/4xPt0DyBkylSXvwkr4QuqxroQw+YvQAQHh6cBMOciW1E4JT18Dbla7z+6yWvbdv8wp1mu2MOON99S360CDWz8Ltw64aYarCvzcCvlw3zldpVzHuL27AGAO5NI/b8B6ehNgIbc4XLCGM/WaBEEP82LMQQ59jJDbUssg1rOD0n5aiPo1LpEhc0I=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR07MB5839.eurprd07.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(366004)(136003)(396003)(39860400002)(346002)(451199015)(7696005)(6916009)(26005)(86362001)(38070700005)(55016003)(166002)(41300700001)(33656002)(4326008)(9686003)(66446008)(66556008)(5660300002)(6506007)(64756008)(76116006)(66476007)(8676002)(8936002)(54906003)(91956017)(71200400001)(66946007)(52536014)(316002)(478600001)(186003)(122000001)(66574015)(45080400002)(38100700002)(2906002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?ZT5U/y4fC5znezTVQq0iY0w7f8i09+eu83z7FBsVrb+yG0jWSPXwuXC7?=
 =?Windows-1252?Q?BW1BcPAmiCMAaWXhli5cHD/SN8d5gE1CybasDJZh+7S2Hvf+gzfVKXne?=
 =?Windows-1252?Q?9PMhhPb5Ye52gJf2aL+5u48CJDw2FAvMrBgENTdM/tTzZUlkvqEgqPK/?=
 =?Windows-1252?Q?/Oc5BrVJmeyQa1AB47ssNNmboS8KBVauYOXgjFqmfFFM8qGHc9n7rdfz?=
 =?Windows-1252?Q?7LvUEDmX61/Fjc8omnbncNPYSm4LwsI59aEQdTERuV0sLhv+PY/C6tMd?=
 =?Windows-1252?Q?TVtKZTmC22pLOtMmTK7hTzI6t3CKKMmYdQWAxFG9evwGfcrrIAZD5YBg?=
 =?Windows-1252?Q?4rt2gtucmsLd6Bqtl5qPTfjhbVKOYaDQir5uof1YdN1thPOhT/4BpXB7?=
 =?Windows-1252?Q?olGQjIfeNZf4YWqT/CzQDhIIOfkXBf7NvgK6Un3duinVJwQdUA0zV9tk?=
 =?Windows-1252?Q?I6gpz7PxLxhH/ajikw3duUVM5egUW1uPQxxXgIBsuFG1vo7DSiOiqAB3?=
 =?Windows-1252?Q?DfOGpAHIG8Tl9mAirqLjcmCWiry9SSKLuU+sBRkQy3OuHhhuvENkRaKB?=
 =?Windows-1252?Q?OXJ1YAGd5wwfCoOpygGwsGKIz7VVSjAJCP7wCuAyvnB3jXzLKGWOyDdp?=
 =?Windows-1252?Q?C5WV1314lXmof7Cp8aNIqUHlk3eSi+Z6jnKWTKOF2/gc+lW6mlqug/Ct?=
 =?Windows-1252?Q?Tal0tUZ6wmvc+9bjWzzEw+37Cz8vrzRqeHAhOTi2LmS0sWxdACI607sR?=
 =?Windows-1252?Q?/YFuVdGPtHreyu0Omiysgw4g+PZ2ZftH7FV/BJXaelip2x9+KILqzz0W?=
 =?Windows-1252?Q?L8RZjSkQvPlv+6yq7lHYqlZ5Yq+W/WShT+qtVHIvYSkxAtFnYoctCeJr?=
 =?Windows-1252?Q?pWJ4EKEXcAW8ZHmHYOI+A62ZXWvjX7VcFThCY7peQp3m0DNO2dz/gOCH?=
 =?Windows-1252?Q?ATnvSCVUvhuYn+lE4CV2H0kjVAe0+PGoEbI4gEQBnnAHW6+z36c0cCxH?=
 =?Windows-1252?Q?lZ6YJ/ZVSewtJeW3GAAIwEfwgsX9XxH7ejDNaUlV1f7h6fl4/YqJZVdG?=
 =?Windows-1252?Q?ztOBgzQZJZinZvO+RaZF7R4Rnfs8YOBdkropWRoSOQThFjzk1tTUtrbu?=
 =?Windows-1252?Q?JZ7fkpt+4JhzBB6TJr0WlZflVVtMhbvmUS44FOHOu4pY7EM28gPciUq5?=
 =?Windows-1252?Q?SYDWzbpAmF673tG7czmUxTo7tvRaOyXQHV38ZTWiwlT0iZpDoiPJ95Jb?=
 =?Windows-1252?Q?g7FJbE3MJDN+0rHCz4EY6ryHncif4VhE1syb83U1AJlZacw0g2h67vGY?=
 =?Windows-1252?Q?8CC2dOppqtnxIfnYwDsizVGbNFkscXnDslPxU6NceA93fXhD8tTWOjNv?=
 =?Windows-1252?Q?tz487GTY178oXp/cNuPH1tzF7nAlitW22jZi571yW0/ttHHLsxzL53ah?=
 =?Windows-1252?Q?p3XUSBNAsjB/JFTS3D3TNgWgqj9p290sN8RykZEIs/iP0PhnqBTBAlpV?=
 =?Windows-1252?Q?vZXNRVCOh7zVQHcotAHECwRpMdgE9D/Sl9LHNyysDCNuyKUTrKFZaQ/T?=
 =?Windows-1252?Q?1JAFoC1aby2y+SOdCMPOAFFqdgUfnnjxBxIYSK3qCicLcTPoR2ecGfNe?=
 =?Windows-1252?Q?yLa7RFnjCrikPufpW+9PsHE4LR1wWeNScfkfr5rB7WdIpbr9hzeZptFq?=
 =?Windows-1252?Q?RFa8rQe3dSh41gcu3fq7cgPKBuOhL5qw?=
MIME-Version: 1.0
X-OriginatorOrg: gmv.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR07MB5839.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c78fa7e-33f2-48f0-5ffa-08dabda6e4d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2022 14:22:52.7247 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a91f586d-1511-4f1f-988d-fd1461dd5916
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7AhDd70A0xW6M8f97MQdOnHAkzZOTde9K28poE0kXeNFcfUIrxT6gFoaTQdv87lP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR07MB8445
X-Proofpoint-ORIG-GUID: 7lpx4jfqm9GmAS6akR2UYkarUbXNtXMY
X-Proofpoint-GUID: 7lpx4jfqm9GmAS6akR2UYkarUbXNtXMY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-03_04,2022-11-03_01,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
X-Mailman-Approved-At: Fri, 04 Nov 2022 09:16:02 +0100
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Fabio Estevam <festevam@denx.de>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Gustavo Plaza Roma <gplaza@gmv.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 =?Windows-1252?Q?=22Martin_Povi=9Aer=22?= <povik+lin@cutebit.org>
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

Sorry,
maybe outlook is doing some weird things. I will try again with send-email =
as suggested.

Best regards

Obtener Outlook para Android<https://aka.ms/AAb9ysg>

________________________________
De: Mark Brown <broonie@kernel.org>
Enviado: jueves, 3 de noviembre de 2022 14:24
Para: Juan Alfonso Reyes Ajenjo <jareyes@gmv.com>
CC: Liam Girdwood <lgirdwood@gmail.com>; Jaroslav Kysela <perex@perex.cz>; =
Takashi Iwai <tiwai@suse.com>; "Martin Povi=9Aer" <povik+lin@cutebit.org>; =
Charles Keepax <ckeepax@opensource.cirrus.com>; Fabio Estevam <festevam@den=
x.de>; alsa-devel@alsa-project.org <alsa-devel@alsa-project.org>; linux-ker=
nel@vger.kernel.org <linux-kernel@vger.kernel.org>; Gustavo Plaza Roma <gpl=
aza@gmv.com>
Asunto: Re: [PATCH] Fix tas2562 volume table values

On Thu, Nov 03, 2022 at 01:03:01PM +0000, Juan Alfonso Reyes Ajenjo wrote:
> This patch fixes -90dB value (0x84a3 instead of 0x695b)
> This patch adds missing -20dB value (0x06666666)
> float_vol_db_lookup must have 56 values as volume is from 0 to 55 (0-110d=
B)
>
> Signed-off-by: Juan Alfonso Reyes Ajenjo jareyes@gmv.com<mailto:jareyes@g=
mv.com>
> Signed-off-by: Gustavo Plaza Roma gplaza@gmv.com<mailto:gplaza@gmv.com>

It looks like this got mangled a bit by your mail client - the signoffs
are rather confused and...

> static const unsigned int float_vol_db_lookup[] =3D {
> 0x00000d43, 0x000010b2, 0x00001505, 0x00001a67, 0x00002151,
> 0x000029f1, 0x000034cd, 0x00004279, 0x000053af, 0x0000695b,
> -0x0000695b, 0x0000a6fa, 0x0000d236, 0x000108a4, 0x00014d2a,
> +0x000084a3, 0x0000a6fa, 0x0000d236, 0x000108a4, 0x00014d2a,
> 0x0001a36e, 0x00021008, 0x000298c0, 0x000344df, 0x00041d8f,

...there's what looks like a lot of whitespace damage which means the
tooling won't be able to understand it. I usually recommend git
send-email for sending patches, it will avoid most issues.

Also I'd expect Juan's signoff to be last if it's him sending the patch
(possibly Gustavo should be a Co-developed-by or something?).

