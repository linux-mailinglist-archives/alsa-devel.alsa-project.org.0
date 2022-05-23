Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 807C5531107
	for <lists+alsa-devel@lfdr.de>; Mon, 23 May 2022 15:29:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16E431718;
	Mon, 23 May 2022 15:28:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16E431718
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653312587;
	bh=i0RUf96P94ttFQKKZ/SwOoaskDg7c/bQmcJRoWRpitI=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y9gcdyX3D4XPrl9rCgEM6D/+dyYNFlbjzToRyOYVlh7HhrPlkAiiO5Qu777bsL05/
	 QUspe893/gWWC11Gc3mPaYvGDFYdzVLYLOoSK3WyODdXlhVMJzK0ViNvdQx0Kabh8G
	 5S3rntJCY3zP0MAastMzYPaJBkK8FbePoWE3Sm4Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 65A42F8025E;
	Mon, 23 May 2022 15:28:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8064CF80236; Mon, 23 May 2022 15:28:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::60c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D94E3F800CB
 for <alsa-devel@alsa-project.org>; Mon, 23 May 2022 15:28:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D94E3F800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="uc+yAFJy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BUISYHbhr0LfWzu3ZnidzLavUMySQMK50rh2KK2UR7zm8653CpUVVWqRj6+k4cinYyccYa6UM71S7a8PZ0gK8APL0DeHLoTPk8oFJH00p497qZi2hBZsK9g9ltepxLgwYFt14PlXA72os6qMfxRNUFf6TWpZywwQVRO62F4Hyqrb8ErnyvORJ26gYgPcHm3ufPm0nfHkmynzJqUBn0/JpE/2QIh40NUPo3OnR/RaE7qd6m1dIA1LCOaOUU9CG051QCujqcwIvl+V5MVpo0Miye1NrJPe5GzOFZ/WRnWcxzPF73PvOoc6NUhUmKNMw7UrVDmGh8rgQZlJbocNN9vnEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IrbsJAov31+/QU52eK32gRw0HvYpBrmuJ7dFfqgMEug=;
 b=fjZ0ognoUccN5esotxJ0lz0N6hAyR5X7UEHjD2/fJxYWhv6cqw0vEdP4z+pR/nU2jeX/k99kHFkpPRZEbkbAPvoY3l1pm5M3/nz4zxaoy0DAhh4SWpxIeSKvfINIExJakYtfuTQrMpRuHU8zKUY8IhF9CO+knxKv3Za5IuoVD6GBK6CCJHuiFU7OpM0VuMDGoyUaqHIIN57eW/6Phf17HfO/IacwcdJOY9Vq4AgaNiObUYRsd+ZeZ8QK6FFl4ZptyMCb1TeNxihnzFI8c5agZP9vniobW39ztDoaihFfj57mp72drWP/BCySsPIJBaV+uMDlE1CD80l1hBfBLMnBhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IrbsJAov31+/QU52eK32gRw0HvYpBrmuJ7dFfqgMEug=;
 b=uc+yAFJy1lGKZA2/vMCcDiK7g5expORU6K1W6+H0WCpoqNtdUE064zlDnx7KIxEGYW47SUFjyVpT9GbkLFoK1jybwTwyPm59BUgU8iuoLDezJUntLd+h2mY8SLwEkVW+edD1mc2oOnJi+q6uRnye75fFcjxVvuz+mU7Rw/FCKlw=
Received: from DM6PR12MB4171.namprd12.prod.outlook.com (2603:10b6:5:21f::18)
 by MWHPR12MB1200.namprd12.prod.outlook.com (2603:10b6:300:9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.17; Mon, 23 May
 2022 13:28:32 +0000
Received: from DM6PR12MB4171.namprd12.prod.outlook.com
 ([fe80::e5c4:675:d32a:a949]) by DM6PR12MB4171.namprd12.prod.outlook.com
 ([fe80::e5c4:675:d32a:a949%8]) with mapi id 15.20.5273.023; Mon, 23 May 2022
 13:28:30 +0000
From: "Reddy, V sujith kumar" <Vsujithkumar.Reddy@amd.com>
To: "broonie@kernel.org" <broonie@kernel.org>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>
Subject: Re: [PATCH v3 0/2] Add Machine driver support for nau8825, max98560
 and rt5682s,rt1019
Thread-Topic: [PATCH v3 0/2] Add Machine driver support for nau8825, max98560
 and rt5682s,rt1019
Thread-Index: AQHYbqhLMkxpHN+sLEegGeP2l9pTSa0sdHT5
Date: Mon, 23 May 2022 13:28:29 +0000
Message-ID: <DM6PR12MB4171799F238BCB72590BB10A92D49@DM6PR12MB4171.namprd12.prod.outlook.com>
References: <20220523132353.1767614-1-Vsujithkumar.Reddy@amd.com>
In-Reply-To: <20220523132353.1767614-1-Vsujithkumar.Reddy@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=True;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2022-05-23T13:28:28.852Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard; 
suggested_attachment_session_id: 39a72ac3-ef0f-9b1b-63c7-d00cedffbecc
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a791db45-165b-43aa-466d-08da3cc02015
x-ms-traffictypediagnostic: MWHPR12MB1200:EE_
x-microsoft-antispam-prvs: <MWHPR12MB12008C40148C3C58DB401EE592D49@MWHPR12MB1200.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ODWXCFG89uGdVFmJGNcyykqFRFd4XPgBq9wNYMPPxyBLO5njPHA/Zw1iBuXreR65FQC2nuTAaXJCk4MoAUAk0utNj0sIYV+Hi6WNKwqPsZHMtu24pz0kteIcFH1kIkY5mLDJMzqq5Iuuwr/BnpKST02gcSgy69BgbasTUR4ETeB6njdsma0qiwZHmU8oqtBH6xRmk8OwTFgboPM5h2puG3o089HA/Cwlx1Y/p2TWNAlsy/CDfkhRV0fqJj827eV8s0TwmR0iQGbDKbsSSms7FkAJYF3fXyh4EseQfDAgFuXEax9Yr46TjwFx8IlD7SMlLpfK0SYL6yNhpjNvVShRoZfbpbWiV8g1dZSoIdeRsU2KbP5KC56+4OAJs84F+DVaUsHpCJLK2gKw5Krd0606tgr+FXyvR0q1+qxLgqcxESAqcPM2/3WMwIxIjoKhKtMo0YG/CYgrN2Pay0ITRJkIJIOgfjeJ3QJQ6Avj9Ux99lT1ts1LzRjaLYIMMD7RIUYEWx0ZfMa+BpQUzvKMSOiK0TESS6CCW95OX4eOSi7rnHRxL0C4lN18tEz8bf9PiIUzA1IxFFmtejx6ABvf+T9XVMD5Yhy8AA1nWw+qfSVjFzvXliw0xnM098KxVJ2ABE70GXepuTZMIjBHkr2bDQkqROsCcGq2ceq9vCyg36QzX1Cs3AdcuQdTD2W6V/aywfo/vMDqztRzVcR6KBLJ4UNdR4z7v160WquPDVXeoQyFrV2GFVrbthDxt0y0cV1GU24px/7ag+vGQoZ5BGHjfKFWilpErw1Hgd77XDm394IFqZRAW2zM5a/GVzF/npf9xjg5xsdkkuh19eTmwTzKSN6hhw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4171.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2906002)(55016003)(122000001)(508600001)(33656002)(83380400001)(7696005)(5660300002)(54906003)(110136005)(38100700002)(38070700005)(52536014)(316002)(8936002)(53546011)(76116006)(66946007)(66556008)(66476007)(66446008)(64756008)(4326008)(8676002)(91956017)(9686003)(26005)(19627405001)(86362001)(6506007)(71200400001)(186003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?SsysCMW+MkObffovhORUoJ0siXCb7OrLZGdAlPfDbblwRoH8OauMXIkT?=
 =?Windows-1252?Q?V6kwmBlUgyyynJOByb/BuwIinfyvjn9cw1mmm8TgNsl11kr7deK5Kh7/?=
 =?Windows-1252?Q?TX+HPHAAaSZovXQn6X+V06db1WbR+88dPIbroclhqXJZexKRFseQfebs?=
 =?Windows-1252?Q?eru6VkZL1q6SO3PQyQkjBnI5YqEb39SHmUfMQz7yYRqX7pCMTo204T7S?=
 =?Windows-1252?Q?Za4xJe9nvt2vlLk3vN9Bc2w5SkI1xbZ8PBSwF/wwKQU0kJFUUvzfARna?=
 =?Windows-1252?Q?mil5nCWRF0GuBWqPELoc3p1DxZko0XahsvG3gg+NOHoBuUA+I4c/vF4q?=
 =?Windows-1252?Q?3HzDkXn3V7/ZyMz1McHFYrJnIwswmpo6sR1AgvU0xzgHot15fMjE/fY9?=
 =?Windows-1252?Q?4bYb2Ip/bBTUwy9p6QODaUyyPVKpeDDYPI8PNOKweIdZrnjYwZZSt6zc?=
 =?Windows-1252?Q?MJWhyIehkFqq0SjLkzO6EoI+QVQqk0sEDrwiTixY+KfZb6Z9kdRpJQn5?=
 =?Windows-1252?Q?fCT9jCYioK0LjT1Y9CcsYuUa4mHHLTHyfNxroxzVdYbyVDjdxpmZEbo+?=
 =?Windows-1252?Q?sgktRTKgkMwTZUMTsKr9g4inryH5itLZkNSOQwaiMvT4k4KQHqAgJciz?=
 =?Windows-1252?Q?rZhuWc7+O2sTN7mKIun/fJzOBu/M7Gx6OZAZHSMk6j3a/stSnHOHFH7o?=
 =?Windows-1252?Q?1N91P2IrERfwhHzsza2RZA3O3u0pQmmVm0N1jDDanqbR8bzDQ/VD7ZMW?=
 =?Windows-1252?Q?2tC0v/KBzwJS5yftLAJOtLOpaCPIx+Y0Ts3k4vyXgAZgXz7I+N/E+3Yz?=
 =?Windows-1252?Q?Ss3nXor3aY32nrU83hnhOsgaOORM4K1IaCgVkglbZ5BMDKaBL9RwZh/e?=
 =?Windows-1252?Q?LobjcBuK7PSFuxNF1mbnzpTUBCrHWYcQkLazHWJ0zbYDCq+jHexiW9Dp?=
 =?Windows-1252?Q?JcamnGNZAupT84jET8XevDa1LkOoKZXGYqx07GEgk0L+t5LlWS09yyKE?=
 =?Windows-1252?Q?1q7qHNMQhDFeK5q/0/2Wv95wC1mJlSD3hygY+YABWyt7kDT+s5Ww5741?=
 =?Windows-1252?Q?xp8/BxwSHdQ6iiGLWpaUFDNqrd6rWMztLizK8il8mbdRYGs7nmboap4t?=
 =?Windows-1252?Q?yW9v1gUWZsB2y7GQ22JoOHMV5XiOssBJLRIx9gbZUTkmgD1qyDurMolP?=
 =?Windows-1252?Q?LlygeOWXdHWuOlgtf1FsTsohavBtr43E4YxLaDUGJn6ZOAe+/Jwy4qHe?=
 =?Windows-1252?Q?1wAesuNfYoBGgFBtoMYj7PdLO1somTMfAxA30jVhWsI/IOJ992ZDE9Sx?=
 =?Windows-1252?Q?G2qiIl/hckgBig5RcCFWLrUVRpDoFSBOiJywLq4Xu+dWczN+VYeja2yj?=
 =?Windows-1252?Q?1DtjdQJV+0gN0JotTvDINQerJwFTblqPflh3SulYCJmXtg6Bkro9YX+u?=
 =?Windows-1252?Q?cas2uCMxseV9LIGOjpa2HAwhxVNyugKAmddLks4kx+POq2UFfeS6YUJV?=
 =?Windows-1252?Q?YA5EzurE/2ZkbCWEI5KMVJp5GtuIVXxzW+UeKzOVZpASi2+2a8rJP+s6?=
 =?Windows-1252?Q?/hmjJrE7EHRvICsCjS8ZlKHaPFjDYi7osvoW9GUUJZhtRhW6BUOx+OIW?=
 =?Windows-1252?Q?ZkBtjd7XSHLD3Bjif3s5M0ICyD6sTo2dyexeIhUR2/xiPjdWE5c+KHzq?=
 =?Windows-1252?Q?ncOaLVQFswDuWTTuQHErO4InXtdTfpMc8L+ZLzntzu2ugBOQ+EzKeBwF?=
 =?Windows-1252?Q?WlZtxAioGgrXESFad/fBZ9xIOstgXlijotJj1ZFcC9aAGuaDRe5q3MrP?=
 =?Windows-1252?Q?ySs/OaJVsKOsV9XGAVgda4p1/it99HOjWdreO0JsCu+TMX90?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4171.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a791db45-165b-43aa-466d-08da3cc02015
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2022 13:28:29.5842 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Fcm6JNzBHhSuQZ2schueqKrbgPjGg9oe6C0fR3HdOZoNjf2H8/TB/6q/fJNRkn2j
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1200
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: "Hiregoudar, Basavaraj" <Basavaraj.Hiregoudar@amd.com>, "Dommati,
 Sunil-kumar" <Sunil-kumar.Dommati@amd.com>, "Pandey,
 Ajit Kumar" <AjitKumar.Pandey@amd.com>, "Mukunda,
 Vijendar" <Vijendar.Mukunda@amd.com>
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



________________________________
From: V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>
Sent: Monday, May 23, 2022 6:53 PM
To: broonie@kernel.org <broonie@kernel.org>; alsa-devel@alsa-project.org <a=
lsa-devel@alsa-project.org>
Cc: Mukunda, Vijendar <Vijendar.Mukunda@amd.com>; Hiregoudar, Basavaraj <Ba=
savaraj.Hiregoudar@amd.com>; Dommati, Sunil-kumar <Sunil-kumar.Dommati@amd.=
com>; Pandey, Ajit Kumar <AjitKumar.Pandey@amd.com>; Reddy, V sujith kumar =
<Vsujithkumar.Reddy@amd.com>
Subject: [PATCH v3 0/2] Add Machine driver support for nau8825, max98560 an=
d rt5682s,rt1019

This patch set depends on:
        --gpio patch
        --https://patchwork.kernel.org/project/alsa-devel/patch/20220516160=
619.17832-1-Vsujithkumar.Reddy@amd.com/
        --https://patchwork.kernel.org/project/alsa-devel/patch/20220516160=
619.17832-2-Vsujithkumar.Reddy@amd.com/

Resolved  compilation error:

/build/stage/linux/sound/soc/amd/acp/acp-mach-common.c: In function =91acp_=
card_nau8825_init=92:
/build/stage/linux/sound/soc/amd/acp/acp-mach-common.c:479:15: error: too m=
any arguments to function =91snd_soc_card_jack_new=92
  479 |         ret =3D snd_soc_card_jack_new(card, "Headset Jack",
      |               ^~~~~~~~~~~~~~~~~~~~~
In file included from /build/stage/linux/include/sound/soc.h:1362,
                 from /build/stage/linux/sound/soc/amd/acp/acp-mach-common.=
c:20:
/build/stage/linux/include/sound/soc-card.h:18:5: note: declared here
   18 | int snd_soc_card_jack_new(struct snd_soc_card *card, const char *id=
, int type


>>>Resolved compilation error and pushed v3 patchset
V sujith kumar Reddy (2):
  ASoC: amd: acp: Add support for nau8825 and max98360 card
  ASoC: amd: acp: Add support for rt5682s and rt1019 card with hs
    instance

 sound/soc/amd/acp-config.c          |  30 ++++
 sound/soc/amd/acp/Kconfig           |   1 +
 sound/soc/amd/acp/acp-mach-common.c | 235 ++++++++++++++++++++++++++--
 sound/soc/amd/acp/acp-mach.h        |   3 +
 sound/soc/amd/acp/acp-sof-mach.c    |  30 ++++
 sound/soc/amd/mach-config.h         |   1 +
 6 files changed, 283 insertions(+), 17 deletions(-)

--
2.25.1

