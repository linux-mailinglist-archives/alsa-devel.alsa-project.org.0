Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B9D7031A5
	for <lists+alsa-devel@lfdr.de>; Mon, 15 May 2023 17:35:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 70D801EF;
	Mon, 15 May 2023 17:34:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 70D801EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684164929;
	bh=B5dXmf5fTZ+KF5il3hmu6qBpbOxhGBGYwKuGSuIUgdE=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=bbapK7PoHfZ0E2wTPCtGnGxHDn80q6YoGsTR/dqzjeEKYZ+jjRqc+Dem1jiC4tmiB
	 0+/jzy9D+n+DC2iqngLWA3Hs6cqcp2CwFQsWzePZwU4Q/UEvzF68ag3nPgjiJC/ae6
	 85QXpVvARULAW5Rgi+UgucgnRF81uPet9tT7iIJc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F2647F8055B; Mon, 15 May 2023 17:34:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6156AF80272;
	Mon, 15 May 2023 17:34:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 71BCFF80551; Mon, 15 May 2023 17:34:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0318AF802E8
	for <alsa-devel@alsa-project.org>; Mon, 15 May 2023 17:34:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0318AF802E8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=Y+tgvU+h;
	dkim=pass (1024-bit key,
 unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com
 header.b=Cj2ZkgHz
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34F2ni9Y012887;
	Mon, 15 May 2023 10:34:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : content-type : mime-version;
 s=PODMain02222019; bh=UmVFr8MeWQ8x+DhAVywK8THcaecKNUsN7ozuuZm9GJc=;
 b=Y+tgvU+hHMkLgEkM8U/32wqvMPfrFebkoIG/GSj3lXUsBrEoQzzan9fC45j75botDjVA
 Ho38jg7qmlJXXusQr8rmcpyhFzknnctgRu05+KNld1qCZroIFjvNcpfthXS8NSgpf+Kt
 By8WP12pOpoWAVb4Qgaxzcefh6EAVinQanMHg8g4741FYo0f4sQVGRQvR6BkqvHmQzu0
 Dx7uuNVuBi4Rb416g5VFM1krIf/+64MEGyu58Vh1DA9A4Pei3AU8f9M6lFDCYSIuL5vx
 u62hvY5jAsGCyOeaM1GzKile287HLmd/AHJffBN6u2CDDzk0Leeme5yR0bsVI0zvJqG1 hA==
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3qj6ymu37h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 May 2023 10:34:19 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nuozVPIUntfSavJMrMrJR2MWtOyAD/pB/ezlMuaWSCBuT/0WREiCz0EUyXtmD6RvmYI/ZL5ohoCNSBMA3ZWzAMdzZP4vQwxG/c8UasknqVk0E3bH1/2GpFyKFMTsTNnhdv5dbBzlplbBCoztIf7Kw3Bki9M6mDk0FnKsiuKF29gTu/mtC/Dx5ZIYEQ4l0veZ7hw3Ud+xv04D+yitDyOQzJ0Wlrhid1nGIHWQD6qC58u1boTURQFHxkrPAwWbkbDkLYkRboQzu75Uay2Olga45XUo/mDX82u8Fhjymh/CZKFRI3iYLiN31JCul8d8KaJkaS7XyyvrcJSF0BvsKGljnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UmVFr8MeWQ8x+DhAVywK8THcaecKNUsN7ozuuZm9GJc=;
 b=FY5Xe+TW9banzqA6/pV5xCsokS9LYKEEPyzvASKL728BWlPcc43JWZYLFIQ0K8JkEqzttcGUmmANxrEc36gyMIayiRdHsl+DKBW605RtMyiHEQk1AhZTSfonsb/MlKkSYUhBCXBM/3mQ2d2b8hZ3yz8omN6RF2X0HBJRDJBHcKKEkp7Z8uXAR1+C9vtvLhfr/0nWrH5BbAd0duOwjmYZFHMPIIM81Ick7bD5pLS/kssQg6mE7jiu/QbzyANj3uUyHwYMLzfY8uaVD3eNOsg8jwlRWwZ9Sb92ctzCbqyF/7IvieL46gQUXgN6ryD0r1Ua3hOmb9jFyJWIm6Gv/CaAZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cirrus.com; dmarc=pass action=none header.from=cirrus.com;
 dkim=pass header.d=cirrus.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UmVFr8MeWQ8x+DhAVywK8THcaecKNUsN7ozuuZm9GJc=;
 b=Cj2ZkgHzWtTu7W4zjz/iX04KSnogxt/d22ytyYdfOoQV10bgT6cLWo6OkKvzJsEBr5FDke1rFLwTxu7JBQnZwBMrC97Gy1d0fOMUdmNPcXHq8emx07xafnNg7NyNJv7dOLDGhh5CeOE+6KgUtEdTdwUfudtVZaLjYu9OHs9VndA=
Received: from PH0PR19MB5148.namprd19.prod.outlook.com (2603:10b6:510:77::19)
 by SJ0PR19MB4622.namprd19.prod.outlook.com (2603:10b6:a03:28b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.14; Mon, 15 May
 2023 15:34:12 +0000
Received: from PH0PR19MB5148.namprd19.prod.outlook.com
 ([fe80::dd45:58a7:9363:bad6]) by PH0PR19MB5148.namprd19.prod.outlook.com
 ([fe80::dd45:58a7:9363:bad6%4]) with mapi id 15.20.6411.014; Mon, 15 May 2023
 15:34:11 +0000
From: James Schulman <James.Schulman@cirrus.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>,
        "broonie@kernel.org"
	<broonie@kernel.org>
CC: "pierre-louis.bossart@linux.intel.com"
	<pierre-louis.bossart@linux.intel.com>,
        "u.kleine-koenig@pengutronix.de"
	<u.kleine-koenig@pengutronix.de>,
        "rf@opensource.cirrus.com"
	<rf@opensource.cirrus.com>,
        "vkarpovi@opensource.cirrus.com"
	<vkarpovi@opensource.cirrus.com>,
        "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>,
        "patches@opensource.cirrus.com"
	<patches@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs35l45: Relicense to GPL only
Thread-Topic: [PATCH] ASoC: cs35l45: Relicense to GPL only
Thread-Index: AQHZh0Kyp89mSgr0MUCOIV2xMu4ciw==
Date: Mon, 15 May 2023 15:34:11 +0000
Message-ID: 
 <PH0PR19MB5148914C7DB129CA88E0511CE4789@PH0PR19MB5148.namprd19.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR19MB5148:EE_|SJ0PR19MB4622:EE_
x-ms-office365-filtering-correlation-id: 99372928-f986-4973-aa06-08db5559d4d6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Ci7PaI8JKoM0gEEncNdHpHOaVpZmOR2equNjmqw3nkP+gADyCcK9ZQxV06p28ndlQApyrpgNVWZthvEKfjVJoV3rXsPj2X/5VR92wq4pfhtXPPTBN71ywmClF3N5Gy3wzQ6iNOfRIl3WvAoD+q/5VxrYSbpXKpAAf8MB4TRT+k3ZQIGW/to8N4elEWCTVVE+FFPOetPOLh6ZwkFsq/Vl/tArX+1nMCkWJ1u0AaTjRKXo4r7pXoA7jSWfLsMZ4dbEG92cwAhXpaFCGbcrwnXiDZ9ctMSXmGFMQagfuYB21+DCTUl6ve1ta9tNp/oRpBAgpZKVFPXTh7ywJAhFEproz7lSr/0jnKSTKPBfdbS+pkydvbqrX+O7x75zrDcUucWY1R6M3t+8HmMrpeul20H92y+QjrRLAqhsOJWfExAc2WVifFh62zEDdQZUitOhssGoNMTcYQPn+XKEyh01bJ09zwymrpJcUjefWuqHlyHVZxxrT2uIV7LMQt7waWfBIoqTfKhje4HpQrCPdGcF4Q3h1ZwDFwQsc1PMlXGlvIOSQJWhmzDV3v2sGoBSHq6tcpzH76ZGfw4VgGydVZz3jQkIN5uus0umS+s3/ZnmEH3eGC48ZhUVOqrPCWDBuyQwogzF
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR19MB5148.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39850400004)(396003)(346002)(366004)(136003)(451199021)(54906003)(110136005)(38070700005)(478600001)(8936002)(8676002)(316002)(76116006)(66556008)(66946007)(38100700002)(66476007)(91956017)(66446008)(64756008)(4326008)(41300700001)(122000001)(52536014)(5660300002)(4744005)(2906002)(55016003)(26005)(53546011)(6506007)(107886003)(9686003)(186003)(86362001)(33656002)(19627405001)(83380400001)(7696005)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?RQq6QkBquvsbM2mfsgPvleR8IzwnNO5jLymir6Yte+Q+89QemxP8zPbJEr?=
 =?iso-8859-1?Q?v4JPIbXHY/G3qzYgaOMrwyiN5rSpaOGGi6KYEMOB9yfoQQJIzgjv8LSxpe?=
 =?iso-8859-1?Q?kU94OQJaU8j86zoSnPTyJoa7eSAPnc5Y9EvMII9lmxbhSjXDMVDULEwTCk?=
 =?iso-8859-1?Q?qmXuMZCFtTTIjGUx0OmIYOfuqCPzMKs/6xe3okunZXnKUt1PKz8VcfABZT?=
 =?iso-8859-1?Q?091eI7bCQfCiP68JPaqxM2P8WEn5d2Y23mIOxC7Bjp2mX0/IS7HWwRxCti?=
 =?iso-8859-1?Q?BOIsszQVxITyPYxNA0ReScRh2MTyLxjDQYlZ934sebYYkNguwZZYspon+N?=
 =?iso-8859-1?Q?FrsEAJwvigWnnzNGEy6fjOKuOddhJkGMGhqxL6LMa0o5V8O+sgNQ0qLNQW?=
 =?iso-8859-1?Q?79S8eLLUKn5iCRimp8aY9VnVCMV6YVGL0bA3ao9X6ebVMeHaOAsJW+FwKc?=
 =?iso-8859-1?Q?GAyhejEwKNPMwmZg0GpfO+c2DDLGNzNSntcgubyED5IqxkSZPWMGZVpKYK?=
 =?iso-8859-1?Q?GBQ6CYQppL46RGtWXFmAWS9c9N9gW3UeJl/KZH9fd0sQCZiifYrOemROWT?=
 =?iso-8859-1?Q?1NuZ+l9uyn7PlwY5OjqUyhWZDRh+2l1EQr05W4uQDUdusiN3Sg1GfRucSm?=
 =?iso-8859-1?Q?unrblrYQWRHuNWPAQJ7mTM84CpxXoyGkatC4l7I0lp3L0Kdv4LmGhPg6La?=
 =?iso-8859-1?Q?fxcSIFbEAZXGyOegzyN56l2bvdBDVdWjzVRFVf4/AmyWUS9tkjbHytXjSL?=
 =?iso-8859-1?Q?i1fdcwrYfX6LKPRwPJ0PQITafUNobwyZ+Wjn7xDgLqL80yteAi3i6N4m4g?=
 =?iso-8859-1?Q?Dd8bqYk3SDNWrwZj128mpXK5uBgz6PpQALKjIhdb1kW0kvcm1yeAhNj6Fi?=
 =?iso-8859-1?Q?UGyTyKoh9LPORAk3xNGBYvDgKl29RTYb5aFDtI3AiQMB7qQwGfGu/g/qG1?=
 =?iso-8859-1?Q?5GFJRM01ZCQBtKyh16fj+Tl/b9nsYR7t0fr7cUqiJmxI0tTAmaYjFZBCzD?=
 =?iso-8859-1?Q?owPnxO921Q/RbB98zpzun4WLYAJsvCBqYTbCB7RgsaUWgKPlWEedpFwZSD?=
 =?iso-8859-1?Q?XPimdRKnm2A/CFvarOKsRf4PQz1/p5SrN9qMhzZwdSC4aNXlrTvAkIbhgi?=
 =?iso-8859-1?Q?e0P85nN0isCHI4GkrRaw5pfo8B2gGqzyM3frg1bzntQ+jd4Irbm1illQjO?=
 =?iso-8859-1?Q?DpjJ05524aPpqNI26Fu2fvescz85qxiq7PBdN15Ra+LBwzep+c00ChsMwL?=
 =?iso-8859-1?Q?UleaS3EMog6KOPt1NOIV+At7uH541JeJfKPgZNtGd+xoHJ5a9K8WeKKi/L?=
 =?iso-8859-1?Q?63VqCexQt6XmyvQKBPCkSJTIW27XwmJDy8dgV3dUCqBwGM/XHz4hIUwcSN?=
 =?iso-8859-1?Q?jYLl8lm/b3yllYknTVKpB/ZkPjpQvtybV/5YTAsYZu/MQ2OsF4TQsaDQJK?=
 =?iso-8859-1?Q?70WD9SRXhhrkU4MxcyHIvQd00RjuTITt1rudt2CQum7Px7jCnKmd0F1pPj?=
 =?iso-8859-1?Q?1leVhPa9gqQZMaimyVRmfQduYv7QIsQkIkLIAcTBIQWVLo54yGqdLwhl9b?=
 =?iso-8859-1?Q?qBYESRqMKEvoHamq5B39Yt0WSu6+m+HK8IeS/LQhLFMpG0hQ9nt9UB3Zdg?=
 =?iso-8859-1?Q?CDDPI2VCAb4F/CMDBzyZpxV3I/cAUH5tFJ?=
MIME-Version: 1.0
X-OriginatorOrg: cirrus.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR19MB5148.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 99372928-f986-4973-aa06-08db5559d4d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2023 15:34:11.3925
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 +z9W7phSkJznDCJmabpoVDDHfhn6cAjjy3tY6uJplat3nafH2FFsTUN3m2xoQKkSmjKfbtdiIDahXktppSy4fjhK58a0mB/3T25eeHj/7y4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR19MB4622
X-Proofpoint-GUID: bvBiWphrTQ_OowGlHGm-b_16-zf9phkp
X-Proofpoint-ORIG-GUID: bvBiWphrTQ_OowGlHGm-b_16-zf9phkp
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: HXVHPYFJAADBICOP77A5MKBWDHACOHF4
X-Message-ID-Hash: HXVHPYFJAADBICOP77A5MKBWDHACOHF4
X-MailFrom: prvs=0499c092f5=james.schulman@cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Content-Filtered-By: Mailman/MimeDel 3.3.8
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SJAAB4XGHY6CXFFTZTSWVJHLOHWEEDF5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 10/05/2023 10:25, Charles Keepax wrote:
> Cirrus never intended to upstream dual licensed code, convert to
> GPL only.
>
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
>
> Apologies for this but this was never our intention and I believe that
> it can be a little legally involved maintaining dual licensed kernel code.
> Fortunately not that many people outside of Cirrus have contributed to
> the files in question. I have CCed everyone who has contributed both
> internally and externally.
>
> Thanks,
> Charles
>
>   sound/soc/codecs/cs35l45-i2c.c    | 4 ++--
>   sound/soc/codecs/cs35l45-spi.c    | 4 ++--
>   sound/soc/codecs/cs35l45-tables.c | 2 +-
>   sound/soc/codecs/cs35l45.c        | 4 ++--
>   sound/soc/codecs/cs35l45.h        | 2 +-
>   5 files changed, 8 insertions(+), 8 deletions(-)
>
Reviewed-by: James Schulman <james.schulman@cirrus.com>
