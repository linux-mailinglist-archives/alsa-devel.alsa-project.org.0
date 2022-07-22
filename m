Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3041E57E262
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Jul 2022 15:34:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F0DB18CA;
	Fri, 22 Jul 2022 15:33:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F0DB18CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658496867;
	bh=9pUFo32lenMOE1CjBcZ2yy/WY3sHX7s9+iLV6rkcTQ0=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d6iBp6fFt/gvDoT0xICx7O88U4p6Cur1mbIj9LjwCtvV/d/OX+KIDlobTWasjC6gH
	 WglhH5CnJv3pdv/U2hO1w3vNOHcQdGOXduJPmFfwOAyH4fZkw4dqIpT554wbINYpuZ
	 ubcCULKQzKhSSFVAWJ30BkyXAZtJYHkkXMtl1THE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 36931F80537;
	Fri, 22 Jul 2022 15:33:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0EF8AF804FF; Fri, 22 Jul 2022 15:33:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,PRX_BODY_135,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2048.outbound.protection.outlook.com [40.107.223.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB229F80279
 for <alsa-devel@alsa-project.org>; Fri, 22 Jul 2022 15:33:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB229F80279
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="HacSESkc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lwi2ZkfHDlJcR3Kg3fnEmJqM9csbJ6sW+zJ2bSBVDz/5RFI+k7hbINtu1sDnpzD4XHTPlpd0hsM2IPND++z4aZ8XWRH6HR5KanRwPiEnz889O/kuxFxakykStbJLIFlY1QagPz0F+Xv7dtZZu9crbFL0b9r/Pid3rL5tRvxYmQ+cViZUp6hHM33eHne/AWoHMQ/0C+9lelBM5wmvLh05GXBMg+PGV2hc+g3ac9foOu5p7+Cc+r/GpF0dehxC+txT5p66oLzfRe8I4YOkn/Q+hFxDM0akr/smFGNUpicQZdwYENTRf9v2JJ0OZTR9tb+i0qw5lSMYM+scOBfDIqyzLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h2a/R880cdmYuHdHFgcczFnX3/R6sz3QSZjV3PuSE5Q=;
 b=X30lHq4ycqO9aip3K4G7yCDLkCrG9Pl5FaIYZ5x7F/zjZlENp/XOl1vldt9RNrzGbJptnjw/xrDQT/qHsl9XwG9B49Tqde4uHpteWBbv5gH5L9vCKwWVjD8rLk/IaBYkk3qO4BNTTM8eAhumlMvO8jZNFK/zcUqhZhL7nWadeVIVp6ah92BnJICbDRA7o3w7KiXwA9jPIMcIuAPcKX0LEdDuPpnMhJYUyIcliTg5z+wQJfp4F0+Z9aS0xW0MI+SDivXj2pJXUPcSAd1gV8O9HMX1Ml5mhDMP54FailRkN+CAxV77lkpMQuFWLQWG9LOMIbnBU4+XRfn/1JjwkamhxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h2a/R880cdmYuHdHFgcczFnX3/R6sz3QSZjV3PuSE5Q=;
 b=HacSESkcKoE+MJZUZ02aZvzpSXG+uCjFUdUS2VmCkhSBZ2Eg64hOYJ/1N3gnjBCGiqPDahUqUqHZ0o58VGX1o6uqwq8MUB5UcYy6j+mBvVZSkuLG6/hgtrMKL0VDocGIG8/3X9dAIm+ZWsQuOfrxSV722ot/2wQg3Hk2KdYfAlg=
Received: from PH7PR12MB5951.namprd12.prod.outlook.com (2603:10b6:510:1da::16)
 by DM6PR12MB3337.namprd12.prod.outlook.com (2603:10b6:5:118::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.17; Fri, 22 Jul
 2022 13:33:18 +0000
Received: from PH7PR12MB5951.namprd12.prod.outlook.com
 ([fe80::ed9a:b809:1f3c:1e7f]) by PH7PR12MB5951.namprd12.prod.outlook.com
 ([fe80::ed9a:b809:1f3c:1e7f%8]) with mapi id 15.20.5438.022; Fri, 22 Jul 2022
 13:33:18 +0000
From: "Prasad, Prasad" <venkataprasad.potturu@amd.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 3/5] ASoC: amd: acp: Initialize list to store acp_stream
 during pcm_open
Thread-Topic: [PATCH 3/5] ASoC: amd: acp: Initialize list to store acp_stream
 during pcm_open
Thread-Index: AQHYnMmwmzCNhLbF1k6pP35m834wvq2JZ12AgAFVV4A=
Date: Fri, 22 Jul 2022 13:33:18 +0000
Message-ID: <PH7PR12MB59517BD2A064AB3320370D61E9909@PH7PR12MB5951.namprd12.prod.outlook.com>
References: <20220721062043.3016985-1-venkataprasad.potturu@amd.com>
 <20220721062043.3016985-3-venkataprasad.potturu@amd.com>
 <YtnR05hxiWNKOGoC@sirena.org.uk>
In-Reply-To: <YtnR05hxiWNKOGoC@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2022-07-22T13:33:12Z; 
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=5a9988a5-3aa1-404c-a535-6533561679b3;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=1
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_enabled: true
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_setdate: 2022-07-22T13:33:12Z
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_method: Standard
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_name: General
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_actionid: 79f0f927-e35d-4f65-9912-cf7c5c929628
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_contentbits: 0
x-ms-exchange-imapappendstamp: PH7PR12MB6881.namprd12.prod.outlook.com
 (15.20.5458.006)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f60b75fd-e62e-497a-6c52-08da6be6bd20
x-ms-traffictypediagnostic: DM6PR12MB3337:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VUtTPARYlTupzVtSJa0T/EGw8CY1RXG/msQzempDn+Xf8k2HS6tEr/bXCq2doB9/zveoIlcgNbSO6HxWGG2Y23yacDvxwmeJ0diiY0H/FC6u9Ie1D0ao/ijS+N95JfbFlcWIYsKtjs/zkOPkypDdHVMbYEbcroWi6+Q56ATioK/5tWbt+OqObfjfVG6SIT2WAPhdyeQIROvsjGLfbb5UTzunS0IN1hUfz9hAQnQnuN6nYz01Ok+ed5OVYBW2upKLH5Nc9vLhoCngPbun35mjZQz5dklrO+WyrU3Kh0Euqn+hiLYyMdreoVZ0Sv71Ik4wNoSk4E90atyn9P9t3uKHmpx2UJ+JaoPmEqGpQ1jr6+DiC43YuGDg9P5vSib+dKN+umVTiBFjpI1nXPZ01YD6HtrPspYBDRfC908xsGyVW+55Wie3UGZADs0rMthxPf08IIyzaBvvlC+IcY3NXezp0v/eTR5vmT6ayNIQHPoZHvyqNWHjc2oMmf4qJka/8ZIsZOSCeyGkT9J5cObYx1K9t/IqwdiAypKAOKSP6g5pOJXpNeRacd9HbdTYrnmk1qaZImfngw9E+RfFTkMIl/NpJPm0NcNmp47mBDhsdk32jZ4+RUWbJWYVUWCV4G3dLOSrpgQgWh1906nmXGpcP8ve8W2GSV8QvQ6oV4R8Kh/Hn2go3YgH2YKC9HizBvBB29xvKu/2OV+5gwx+4R7jf0UhxTF2h+FOgSDmNlTZQxEYfx/tcVg6IKD1B6iNyO4GJjYPMdZcv7UIwaZuQ3vOmP5ymO8lIOjsjWyLV2pQvVioGpRAAd/RrBtLCqpl0DDI3fGW
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5951.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(39860400002)(366004)(396003)(376002)(346002)(66446008)(66556008)(122000001)(33656002)(186003)(55016003)(316002)(6916009)(76116006)(54906003)(8676002)(4326008)(66946007)(9686003)(2906002)(478600001)(26005)(7696005)(66476007)(5660300002)(71200400001)(38100700002)(64756008)(41300700001)(86362001)(52536014)(8936002)(53546011)(38070700005)(6506007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?GQW9keF5FtoFZE3zPjjB5wSI+dvkq+wbQf0CiCumJCygwe3lNTdyrp9es8GQ?=
 =?us-ascii?Q?mhcvPS9IPvo4cAsSDFujzDRLrl0lfs3ZMF3P7KzTvWxBxTqxT4X75QV25TCv?=
 =?us-ascii?Q?eBfe1JAKBl549M581nwGDJjcmyoJFIo4ycH4rvJZ24GRPXLLTiBhnxinVtQu?=
 =?us-ascii?Q?2kr2rzzIZvLvi4tfCoJ2v4IyUIj+AIZxvCZlL86dbI5vi4W3160k7sNrqR6S?=
 =?us-ascii?Q?HfM6esp0fc5iP0Th5plU1HmxeJvm8h65Mh3+cXX3gWj6awqRO3L7iYo4Cd5Y?=
 =?us-ascii?Q?Ei3nCAH8xuKhnp/7p2eZ0cvI+8okpIphpyxCGJdZytdGJgpDNONEQ0BVjbXw?=
 =?us-ascii?Q?pvhwn4U+bt2gJGuO/4KIZL+JqL0f0qxFZXIBVxzCG1lmXj5JwUtmIHY9Y/w6?=
 =?us-ascii?Q?KDZyJQRMgM2VcIKbdnqRMFVwmRkxVVFikR9iBurkYa2DPWAAnathJjtaCLX8?=
 =?us-ascii?Q?ldwpfg922aitb00V7fVyvompXy4mYqTuzTYgnxpke5E6AEtRhdFMObgWHgBi?=
 =?us-ascii?Q?CXpPsLXPpPt/a0+F+QnUYhhb3RUzNntII0ciCXRdKQ7S4T/Qi+McnE6em1rQ?=
 =?us-ascii?Q?RBYt0I+0m/Y4Vw0fgy0G0stTB0lzjxL071SvoJl77PMRnLsMuKyK+OjvNOxw?=
 =?us-ascii?Q?j//ziUxXNz5i3CQwG6scmyz22XLWdyhTk6EO8MYiPwjUz2QUpwHKOxHkh0Bt?=
 =?us-ascii?Q?1vx9qviyEwYrCQtBm8DuxlhRoYEknNRR0lRARQfz7IGb9wDHPVMZBUudGpGG?=
 =?us-ascii?Q?tv76AWZvZAlWxHzt3icP5FUgE7mxTdfaT3L/p+RrcHGizDMwxK0FwB5EmAfy?=
 =?us-ascii?Q?bDxMozWpF4T3ViYyCZ0FPSls8cgD8nxCoNjHMRFzfOb/ucytipIYjWOIZnBb?=
 =?us-ascii?Q?8liDebRrFPBm7mWNQbkFQgMs5Mj6oBfw06ZuJ//G6Y9AXCs8jedGm9TofLA0?=
 =?us-ascii?Q?O0hLeOa6q0D39FOCK+D1sV+lUWwCHQHSglOu7VFayDJ/maC0ydoUw8z1Uvko?=
 =?us-ascii?Q?asWJDAqLYkYWV3QOSImodxniwaYJzgKtudJQpdKz6mEkLqFiDVc92UKeojG6?=
 =?us-ascii?Q?Dp51uPUglw/Oas2vDLDlgcws549D24euaD4SbVP6jIGf1BZHffdyHnNN4oWg?=
 =?us-ascii?Q?bPvejjc2gHyPvBPhwamgS70LLIP+vfbUjcAKHwYHAvBNceCYYUh/CP70IrkD?=
 =?us-ascii?Q?WL5+RWoG6WVnH2Gz6yBlUV0Wf4TtjC2t2cyWGOpEM5ftNuoIJ2UoCkpHygV1?=
 =?us-ascii?Q?GNZTeR8CVBfJvpK2GQk5Lv2m2GjMSxCdW7YjUUYZs0LOgVOiQs+4Oh5YqwU0?=
 =?us-ascii?Q?OoWE2X9z27NKlfZ7/XhJ4g0gpu5WmMt8i+cKAADpz+6irgVnMNDf3VsgkyTh?=
 =?us-ascii?Q?YRZo8ZUQz4whg+1WHp2H/GLArDGHVvis4Ptz+6bklVBuMBbNT2+fSJV9DDjy?=
 =?us-ascii?Q?BJlzmmPLMW41fWTgwn7u0M6I+gh27qNcYuZiu3rjXKV3uhPHGOWQz39EnVIa?=
 =?us-ascii?Q?bp+8NZ1VCcvDuCjFj4rSexYzU6ygKLEpUqopW3N5YDF8IhOX9CiiJYrGZlqn?=
 =?us-ascii?Q?rokZ/p/sq9cG64i0Mr1wdeltA2kvZ+S9lIdJZv9q?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5951.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f60b75fd-e62e-497a-6c52-08da6be6bd20
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2022 13:33:18.5390 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /BzCi2ykUmdiEFjVu9kBXiRfOP69Th3guGLjzNAKGs8KPFs87WFPylgNLu6akQJjd0iq4FNnGdkc2HAd0EeP9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3337
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "Dommati,
 Sunil-kumar" <Sunil-kumar.Dommati@amd.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 open list <linux-kernel@vger.kernel.org>, "Hiregoudar,
 Basavaraj" <Basavaraj.Hiregoudar@amd.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Yang Yingliang <yangyingliang@huawei.com>,
 "Saba Kareem, Syed" <Syed.SabaKareem@amd.com>, "Mukunda,
 Vijendar" <Vijendar.Mukunda@amd.com>, "Reddy, V
 sujith kumar" <Vsujithkumar.Reddy@amd.com>
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

[AMD Official Use Only - General]



On 7/22/2022 3:53 AM, Mark Brown wrote:
Thanks for you time Mark.

On Thu, Jul 21, 2022 at 11:50:35AM +0530, Venkata Prasad Potturu wrote:

From: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com><mailto:AjitKumar.Pandey@=
amd.com>



We are currently allocating acp_stream during pcm_open and saving

it in static array corresponds to array index calculated based on

cpu dai->driver id. This approach will fail if we have single dai

linked to multiple pcm device as we will have same dai->driver id

or array index for multiple pcm open. Initialize new linked list

stream_list to store opened pcm stream info dynamically.

This breaks an x86 allmodconfig build:



/build/stage/linux/sound/soc/amd/acp/acp-platform.c: In function 'i2s_irq_h=
andler':

/build/stage/linux/sound/soc/amd/acp/acp-platform.c:108:31: error: 'struct =
acp_dev_data' has no member named 'stream'

  108 |                 stream =3D adata->stream[i];

      |                               ^~

make[5]: *** [/build/stage/linux/scripts/Makefile.build:249: sound/soc/amd/=
acp/acp-platform.o] Error 1
Okay, will fix and send in next version.



