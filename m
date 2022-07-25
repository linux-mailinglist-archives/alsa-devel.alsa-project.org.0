Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F6357FD75
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Jul 2022 12:28:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92BFF1F4;
	Mon, 25 Jul 2022 12:27:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92BFF1F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658744910;
	bh=YlcwYQsW+txi+9yQhdNiImuPfXdS2RWzx6MchuwMPFc=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hhAF319U3WZlpiiUzckIg2mReurs0wcVzk2pAJfJeStyqyYmunxKMX0OmPiRADmmZ
	 QNHjHbBjxITLTZVrVZaTo7yWTnQNob2/OqT9ppC9ipTa4ZctkrnPk++DPQ+UE0AKdZ
	 c6AJXTdapxLidvwFPbdGWMV5xIpmAdPGsgbO28+o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1953DF80088;
	Mon, 25 Jul 2022 12:27:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E831BF80163; Mon, 25 Jul 2022 12:27:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,PRX_BODY_135,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2049.outbound.protection.outlook.com [40.107.237.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 403F8F80088
 for <alsa-devel@alsa-project.org>; Mon, 25 Jul 2022 12:27:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 403F8F80088
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="e7c3qJgp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Km2Zaa7buSHMyEd2QHPScmYwXDbP3HG8Zmo0jDIEBCLbpux8/NwiAU99UP6xIDMarmNDV0NlNMJHdoaY2YvllBwvSWfvt37W9ZUnqTGUzDl6iknF4JssI7gThqwBV4PTv1zYoRBJVOQIVQ0ylCuWcxX9G4SGtbLde3av1hEGrFOB+tMorAZhzbsbbnopeR1UABULDuedzqTHuTAEY4crRyuukYuNZ5Dxz7QDjBFjo33Jp0Z7n3Mb/9pX5omhBzNcc+0vYJSnUQo4RNAjkMJoiOzJDbizkOXZlHiBKi1INXqo9PDQSFy4tBfQ74Hp5H8jAmqLeOEXKlLOWb+g6h5Opw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=huHVh+57Mzu/fgpWz/S76lrdtDJplBgG+GhIejocAsA=;
 b=Jprrqo4S58nn7ZKKurOdaauLpu50nFBkmq0I1GkzL41rcyIASqTPLYs5g9cbmYELOK1gsD6KM/YYSLJyX288Wh7FvXNBdgszOF0Lo/Sg6iiXfuxqvXG/SBc4HbKiKTHXb3yPIagwGgpzpocPUG0nE0mIxQ2O25L73PsF90v8iI8Bz67OD8DPeSuDNjquxs7XXE41IiD/q7siJPfPFRtrWq9EECzlliO/w5mzaK508thCM86nQD7Fy4pxRmgURF5fruN95DyxI6j1os/5Z4LhU4+l5Y6/DRHLInqVWxsOaEaS05omqdh1+GzbTpgQ0Onmq7X1DF+f46/UGMY03PKLIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=huHVh+57Mzu/fgpWz/S76lrdtDJplBgG+GhIejocAsA=;
 b=e7c3qJgpgjmqojMUufeK6j/+2Oz7p4yJWjJcfRTriYVFDMGTjJxEv8KcuEQN6arg2UWduBF+6emZXGL497cP27445jd5qTn9qxGpJqSa21aZpfdCgQT79hIvX9VDYIuedpc0txpQdIuMenfya/FTtfUtlIHX6JXus8Sm4EDuX4g=
Received: from PH7PR12MB5951.namprd12.prod.outlook.com (2603:10b6:510:1da::16)
 by DM8PR12MB5400.namprd12.prod.outlook.com (2603:10b6:8:3b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18; Mon, 25 Jul
 2022 10:27:19 +0000
Received: from PH7PR12MB5951.namprd12.prod.outlook.com
 ([fe80::ed9a:b809:1f3c:1e7f]) by PH7PR12MB5951.namprd12.prod.outlook.com
 ([fe80::ed9a:b809:1f3c:1e7f%7]) with mapi id 15.20.5458.020; Mon, 25 Jul 2022
 10:27:19 +0000
From: "Prasad, Prasad" <venkataprasad.potturu@amd.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: amd: acp: Modify dai_id macros to be more generic
Thread-Topic: [PATCH] ASoC: amd: acp: Modify dai_id macros to be more generic
Thread-Index: AQHYndVUOYYR3K2/p0yjSX84tGwSH62KeaoAgATIXIA=
Date: Mon, 25 Jul 2022 10:27:19 +0000
Message-ID: <PH7PR12MB595106BC93458F31B2D8C5A9E9959@PH7PR12MB5951.namprd12.prod.outlook.com>
References: <20220722141705.3340440-1-venkataprasad.potturu@amd.com>
 <Ytq5rlr/er0wDTae@sirena.org.uk>
In-Reply-To: <Ytq5rlr/er0wDTae@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2022-07-25T10:27:16Z; 
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=573dbc38-bb9d-424c-b17c-a1c3ca29030c;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=1
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_enabled: true
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_setdate: 2022-07-25T10:27:16Z
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_method: Standard
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_name: General
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_actionid: 1348f089-2f4e-4fb8-a7f2-006b61b39b0e
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_contentbits: 0
x-ms-exchange-imapappendstamp: PH0PR12MB7010.namprd12.prod.outlook.com
 (15.20.5458.006)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 73893815-a274-4ae9-8ddb-08da6e2840ca
x-ms-traffictypediagnostic: DM8PR12MB5400:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: I8q/L+Gi6nsVNoC8/d7omS/JpKT5SWd+gSeVqgbwzikqZGcvu5d27KCzaXvoqym4/kCrph5Y2RGTRe4g9CUVTJbyFW+upNYnBjDPPDsVunW+KiJAT3f8rKBSgWR7tC59rpG7LthmNMa8C5lzd8aw0mc35+sUrLKbSO4XxtOxAiNPq3HfAMZQgoKH6in6tGLuIGml8K2a0ZDbvI9vR/tQ8ANfez4p4M8dDmnhgTzT8KqYvnACF4XGqjgfYSonRNJ25WbCdV0IZTMSdP3e3xkMTNdX/iJZIeDue/dTkkiIQ0CQ7phRJ5ENdn2QKm83mFmGooeTFjH+MYmy8YbH9jcGFLESoYivg+pfReC2nSwqHXknbiHr95h9XQ3Ohy3uvS9lASXDpJDWZrPckaBPwskZ9KDmMzOemP7SxhFjZQ0MIh4t7eM+qFKVbGpDFyaMj6EjdXRdD77HoAxxKKy03UPpYEFAwHlYBc2FG/QNqsAClcaBgjMwSkMS/LTvUghuZ21R/IEy0fvEOmdAbRRkux2ETAFA1iRAfwVpFHt+7Qr1d40bXP1kUouu0eTWg3NBZjlPjfaCW1Y99Bb4q/D5U1IGp4U9Ts+8YR0u6QYyjbTr8JsTx9eIBX2fwu9QIGVbfsaBjQIWiV/u7GPto8RLrZfAO2ccaRFMOCw/R0ejO0jaYOZwEwdX7z3mYEulUchEC+D3e8MY8Sx5AqaU5SOY6xRkauNRxfoPmQjDDwtZwWaQSCBYGULJpV6SozyS+0+6rapNdUdj0jWlgdOMMNoUd3k5/J+o449p26O53p28ZpMp9Om5R3aWrYkZWGGKEAIcCwbs
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5951.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(366004)(396003)(136003)(39860400002)(376002)(478600001)(4326008)(71200400001)(5660300002)(6506007)(52536014)(83380400001)(33656002)(53546011)(86362001)(41300700001)(9686003)(26005)(186003)(2906002)(64756008)(8936002)(7696005)(4744005)(54906003)(6916009)(122000001)(66476007)(66446008)(38100700002)(76116006)(38070700005)(316002)(66946007)(8676002)(55016003)(66556008)(41533002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?DLvCCJoO1Ni75/xH7xKjWkdmsMipwhBCY2/4pHa0bSG0QqhmKq1lmwA3FBmU?=
 =?us-ascii?Q?Yg2Nr79SdY8SOpy0EJrn8cfYCESF33iS/0b5VGHmhnu6Ydd8kBIyUrgOMocQ?=
 =?us-ascii?Q?AJDJ0ccvJIctMFqCyt7LkY8HwEPfkUKeteyIi3mizgHvC8aHGEmdf5N/WvaS?=
 =?us-ascii?Q?e1iV3b1fc1u4fowap1RZicg4j9v/zK03laUMRLIOCFZZXtyQrBy/LR+CetTU?=
 =?us-ascii?Q?qdZGfdCnVR7iBsqDXonAMxBz95KxL6rarFF7e4wUj2Eym6ChF0UzAytUIeLu?=
 =?us-ascii?Q?pTwkRRl/B8UCQOVZF43ksZrEpDYunhAcXEjjJBUxbrM3WjO2DBfnRKcZQASv?=
 =?us-ascii?Q?d8K5hbydn24SxGReBGzgjD/8MJedDJQD0lpNBA3UONG5cyepZcvDOshYDG+J?=
 =?us-ascii?Q?1kOeVGao4DwP9VNLMhMA5U6IdhrIxq/At7S1fMqFSB00Sxc48EJSAV9Pdri5?=
 =?us-ascii?Q?+h1c7iFvWu0yvZhHeCzxxgnE1nImam8Xb44i2fE40d22KDPj/NEsGVtdqfhc?=
 =?us-ascii?Q?5Hc5IOjH367eSCaTbRp/v8sACCqgit7e7rEVk92Zwebf7T7yHbz3pac+VNbP?=
 =?us-ascii?Q?mfdlRUIhWEDtjVrteXNSANDyjz49xhehSjIXah56XImXTDxmW90GVExZKZBM?=
 =?us-ascii?Q?dA8ULkQ8ibGWAbRSo0LcvyxJvDW6KPZtFAp2YsuDoMxa7FiSpFxhmVHUi26J?=
 =?us-ascii?Q?NrBNFyOARouWFUkjevhGWuzMZWI15o9BUJg207ljucPfTbBJ5w3tsqakBVh+?=
 =?us-ascii?Q?hSsDB496gRMUfwgEfFF0je0d8E+NckkNgcBD4NnqOOWpRoKFhVy1tB52JyDm?=
 =?us-ascii?Q?np9RK3aOwqu20m+O4Ex4erzyGpPVo2pS4hrOqMy4EcpwJ9OS8TX53PeGX56T?=
 =?us-ascii?Q?t6CbONnYQC5gQcXVWQnrgHbtg3U4IR5jYdHL+wYRmYxVNvc31im/GufTnrjk?=
 =?us-ascii?Q?pGF7PGUEaBm6dY61D0KLez/taRVustbQIE+L0sNHsPOlCjtlAieSgFKN8pkz?=
 =?us-ascii?Q?XiohucF2bGu2cZAhxnDnGbSkYJ8sOZTn9qWY8t/Iu4KCeCf+i6uU8BvTkAgf?=
 =?us-ascii?Q?fVRQH6mjulv6G2+kMRIHt12d411WQ+NvWHV9HUGNhnzm2An/wz+4rZiuR/tB?=
 =?us-ascii?Q?vMR3P+0Z+BmH1qwWx0hCqbGb+zBNdxj69UsuyfUbenRAQh8tUbfw1f19JJNf?=
 =?us-ascii?Q?Tpa9wlzfpwIzks9uE+k2Td/ZaWOeRe5wVYTUI7WNYkZOqVqn46StWu80a8ej?=
 =?us-ascii?Q?oM4Wc4PU1g+RnJOQR8Ulq7UU0bgbkrt6ocSm0GsAS41ZfZoZtIRfWJxA0tAp?=
 =?us-ascii?Q?A+jq6Nw26wDMkJu/vUMDmOGZDkzaywOm+D8Lo9LxwA0EjmhgTERKutlQQyQU?=
 =?us-ascii?Q?fIQ+OZZ1WRvUKfktVYil+QhGtJWlhamxY4T56g7k8RWp071FeJYmjjINMwrn?=
 =?us-ascii?Q?xxk//2jdyfiAdfF1+YncgkpId/mfFvLzgRk8rHnj4rf9qkMuPT+8z6BSqefL?=
 =?us-ascii?Q?3SbQkE+peedv07YiUl8jLkQIPY4RDhzn/2LVO3g+0qVVU7ct8ZYNc88Wlbtz?=
 =?us-ascii?Q?6whWoBF7G9FS0fZWWluWMkUdiBDd/3obWvC7j61D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5951.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73893815-a274-4ae9-8ddb-08da6e2840ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2022 10:27:19.0797 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Cl+WJOVG+Li8CbZBaLETHF2Vt1m/JQvFaJTttKp1X9eaT0jeVOsg1FVPXw5/f4/JrR10BxrQhJXVVT9f3MEWPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5400
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "Dommati,
 Sunil-kumar" <Sunil-kumar.Dommati@amd.com>,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 open list <linux-kernel@vger.kernel.org>, "Hiregoudar,
 Basavaraj" <Basavaraj.Hiregoudar@amd.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, "Saba Kareem,
 Syed" <Syed.SabaKareem@amd.com>, "Mukunda,
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



On 7/22/2022 8:22 PM, Mark Brown wrote:
Thanks for your time.

On Fri, Jul 22, 2022 at 07:47:03PM +0530, Venkata Prasad Potturu wrote:

Update dai_id macros to make code generic for all platforms.

-#define I2S_SP_INSTANCE             0x00

-#define I2S_BT_INSTANCE             0x01

-#define DMIC_INSTANCE               0x02

+#define DMIC_INSTANCE               0x00

+#define I2S_SP_INSTANCE             0x01

+#define I2S_BT_INSTANCE             0x02

This looks like it's just an indentation/formatting change which isn't

what the changelog said?
We are changing dai_id macro numbers, as renoir platform has 2 I2S instance=
s and Rembrandt platform has 3 I2S instances.

To make I2S instances as order, change DMIC_INSTANCE to 0x00, I2S_SP_INSTAN=
CE to 0x01 and I2S_BT_INSTANCE to 0x02.
I2S_HS_INSTANCE is already 0x03.


