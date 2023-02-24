Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B326A1AB7
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Feb 2023 11:57:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 703E9207;
	Fri, 24 Feb 2023 11:56:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 703E9207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677236242;
	bh=I973BTAUxyJ8RN5ntMmZyx+IAjdiPQNZ9oFVPtc3/NM=;
	h=From:To:Subject:Date:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tdNrfJPnpgtLIgB0fjRvdjdYtHdZpBLpHbST3TMKjY583Tk1U/2jhBPoxlws09een
	 JiQfalRxho5ujVUA9wQJkvEx9kNN5J2w0bFZw4htC9A3MGKJ3CT5EBT4HNPA/aGLDK
	 S9TvEEZVlXYP7YBZyG4aw8mI3LJR3DFzZ4wC0bc8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E217F80116;
	Fri, 24 Feb 2023 11:56:32 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 34B6AF80125; Fri, 24 Feb 2023 11:56:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,T_SPF_PERMERROR,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20616.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7d00::616])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E2CACF800DF
	for <alsa-devel@alsa-project.org>; Fri, 24 Feb 2023 11:56:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2CACF800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=Zc9FRaVK
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oOusMKA356rFY0KYrm4Bhl+z9wQ4pjA+wksNvqYJyKNDJgcxDJKvH1B3244IuJz23JOQjonACPXQQDzYQuofGllRLYSBtPyMD5+jcsEWe7xhjH589FTGptGABKuKADz9fToGtAeGTQ4nk6OOqrK4RSgdGWAcJytgp6ItEYgrmuIYl9ym5fJl5L9JbO9rVX8Gz3Qceccl7za9s7aoNLobYd7FFhPbCs+ZeK6LPoUX4Y/1mtTpZqZIUFRwo57UASHMeyQhm7we8Hq6huYJeXyj+7EZ2FRMOTpX9onAcoHYGF0xWu1xxZcQLUxaMV/NVzz3gg80+ZHtHdruXRyTi0jpyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I973BTAUxyJ8RN5ntMmZyx+IAjdiPQNZ9oFVPtc3/NM=;
 b=EPvS2BtDk6hkJBknkxhXUef5Q/CwfrBJcTHFMWa7468t5jhbuqX98RDBk2A5KNEHf0mJ4RXiaU+j5fK0JbypC2YATQeE3a4UbYGVhR7L7odKU1pRRxIXIwRnuMyInAgVv/r27tcihVZisMXrGOyx6R1ttDZrRfEbIZjdhP+PhO8+NAeXxWaz6j9Z4fCPv0MT1FqyGSv0hwd/3k3nPJ6p2YivKtEZwfKHxJNOuxlRbwXr0krgwKKVp9RRAYTdd5sqXydan+/2fOIFu8hUwfLHL36H9kVyH+jctV3rVC7s3+kEcu7rwy1yT3Ge3mbjV9M3PskKGmeUYbSjjLdhU9FFnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I973BTAUxyJ8RN5ntMmZyx+IAjdiPQNZ9oFVPtc3/NM=;
 b=Zc9FRaVKCcJgCNP6TKkobSOHdidTWtS9U3MxDPou/jXfGZWIYhK0QGIYNKgnMHMY6PdfPkn3mZp15T6Lc4E7SarKwZ2iQssUeMp+bvSEDPncidLYfoi20UxHUTzTI1u1hPLVBN4s6TAq7YQNM04O612jy8yzmAEk6SPcvE+fbmY=
Received: from VI1PR04MB4222.eurprd04.prod.outlook.com (2603:10a6:803:46::19)
 by DU2PR04MB8567.eurprd04.prod.outlook.com (2603:10a6:10:2d6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.24; Fri, 24 Feb
 2023 10:56:23 +0000
Received: from VI1PR04MB4222.eurprd04.prod.outlook.com
 ([fe80::8562:affc:e0c:c610]) by VI1PR04MB4222.eurprd04.prod.outlook.com
 ([fe80::8562:affc:e0c:c610%7]) with mapi id 15.20.6134.024; Fri, 24 Feb 2023
 10:56:22 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: Mark Brown <broonie@kernel.org>
Subject: RE: Re: [PATCH 2/4] ASoC: dt-bindings: wlf,wm8524: Add a property to
 specify power up sequency time
Thread-Topic: Re: [PATCH 2/4] ASoC: dt-bindings: wlf,wm8524: Add a property to
 specify power up sequency time
Thread-Index: AQHZSD6iKP3DVcsE70eUS5M7nhJXLA==
Date: Fri, 24 Feb 2023 10:56:22 +0000
Message-ID: 
 <VI1PR04MB4222996DB8494FD14A1D5FCEE3A89@VI1PR04MB4222.eurprd04.prod.outlook.com>
References: <20230222113945.3390672-1-chancel.liu@nxp.com>
 <20230222113945.3390672-2-chancel.liu@nxp.com>
 <Y/YPkgOreByREmOz@sirena.org.uk>
In-Reply-To: <Y/YPkgOreByREmOz@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR04MB4222:EE_|DU2PR04MB8567:EE_
x-ms-office365-filtering-correlation-id: c7fcf3ff-6fe2-4b59-a5c5-08db1655c48e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 0/MxNEg2MAS1e6TChMU9xa959f0AMxuZ+kJOuE54bhHegue8YyurfKdMNhEKBvJ8i3o2VjyVAUcNWMb6J/4Rw8QZULyR6Lhw3peRgnHoI45Drjmn8gVfKseyCpSIKuePsgwl9hK77lXk6FwCf4psEi6HVrMeOWe89p4Y+4TddlSGuHlAyp2yy1ueyRDvug3PXN2bXlKYqwF3EVkEA9kODIkT0jTgcGbRfPvVfJ7GIYfJkXs4HUDBtdAcRZoC7u8M9pWQv1SD6XdpKA+pRM3cyNW946u4n7ribLMdGD1rTbCnkbiWfAN2ppgErc3BFaANBSrptPdMKQmSn8jR6oN1R38Iu+vLGxmrCr6nLhwzysYH18SZfV14Zfdh0tvLIYS1+kVyQzDYEzSu7KoHcKgDK4Ogdi8AjbnLtqtskR4bA31oNTLxoGMMZ6/GAFbObSIwxbOSOs7CL1hh83wElnGS5chgxum3/sN3ID6EEUQynykqJ4uX/iv3tcaib2e1+DT+t94+2Br8ULwlNu/a50vRyXArZTp6MCNBKdZE9IdxiXIW+Xg0cKa7MddV6rGsRPjPK4vsOm6zWlEZZ9ECYlGyCAgSeRtxTLGf4jh30HNwN15arDom+/vLEMGpPKeAYGOINn+lnYUlg1MCoG5n0FK0Bqh3DtqDNPTgAIFiez7oxhtJwqIu2+R0WSjk5QjcKlcC
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4222.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(39860400002)(136003)(376002)(346002)(396003)(451199018)(6506007)(76116006)(66946007)(66556008)(316002)(52536014)(8936002)(66476007)(64756008)(66446008)(6916009)(8676002)(41300700001)(4326008)(54906003)(186003)(9686003)(26005)(966005)(478600001)(71200400001)(7696005)(38070700005)(55016003)(86362001)(33656002)(2906002)(44832011)(7416002)(122000001)(38100700002)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?gkU44iJrU/C62/PpZ1IkPjeGxK6t5qseA+bfUOUhGTqer0DVMS3Tsk5+G8W7?=
 =?us-ascii?Q?Nuw8VjQMbgws3jHJoKVVEqta4t6bni/ReoNdk8HFkocpMLOTyHmI8J6LWSJv?=
 =?us-ascii?Q?v02EuW8h6Yl6/Pv6dH2p/g4M/zUI2m3/r3wYP5zfECnfSOFVCeJOFSujCVnF?=
 =?us-ascii?Q?gi+ROj5uTPOSVizHJi2gDHrgLtg2hn7ollpIr+fx8eXd28IUO7iq0e36qwEM?=
 =?us-ascii?Q?fl6BNT48+IJrgH8H4RojyVbnNpd0qr5JP1wXqlCp9W/ercREL6LNXjokvvn6?=
 =?us-ascii?Q?6ShoiMC+SSYHX+jSV+vJ+iEI1X5Jj+lz33YaZ1Anb7dMOgXrSxAV/mMxovDP?=
 =?us-ascii?Q?1rSrKaURQU3RCBIDEvSFdj+b64ZDtpeHkLwvxFtxsIat+w6IunQhtRaoLbe+?=
 =?us-ascii?Q?ZZglqdZYgGswoHI00aFBBegnKp4xS833vIyPRShuhUWVebYEuuDfabunAM39?=
 =?us-ascii?Q?0AsofFqx1DYZS/pGdSbEeJdsapJASEguOEV5WaoH/yePn926zyvz00nj3VWq?=
 =?us-ascii?Q?pdZnVSh8P1ToPykR1WOvhESkt8A/7+c5LhRucsLIpCCuRJTMcJ/INyKvi+OD?=
 =?us-ascii?Q?6qBWKRIV74q1LkRCsQO/7OnCGaOnyNo7kz3/bdAQLPrQmasi7MsM2b3/CW8Z?=
 =?us-ascii?Q?l01PnJ8UnkK7BLOxZq33MIA3/yuGPj8b93nbVghMqqoJrPAB7nYq7jDyHyJH?=
 =?us-ascii?Q?ap3obSVGhTtztdlsB2t8mwraPpo5hqkYsme9fUl/Pq5mRijEhcdtz+15gvnO?=
 =?us-ascii?Q?aESPhgxN13P7lRyY3No+y/wx07eVz9nXYVdFmIou1p4fnBUJo+qL7lEmmYwT?=
 =?us-ascii?Q?+8rOvMtXLql4/2p8JtmBo/MehTMpb/ad91b07Xs1Wn8Wo4A9d9P9ktwXWv2X?=
 =?us-ascii?Q?aTubdaCAFd3RBTdAnGunntySYENJqzx4yjYAyc1sLKb8r684WHmzv5caYWH2?=
 =?us-ascii?Q?qCTn/gXMxNjUrri2wVPe1JdAkbVlZDZrM++4Yak8zoCUx9eRzi33baczcOTb?=
 =?us-ascii?Q?wdMKxpVdk+j7JGhhM8fWJRDPNGaDKlRlgyYB58e/2wI4q1KkRLyK1Zn11Z/M?=
 =?us-ascii?Q?qyXw9uAgGfyANTQOox9KNNAm3vYsaKDU+bAsKwCAA/V9MNcPSIR2a053xtY4?=
 =?us-ascii?Q?P4jbaWY745jvEVgtAO2yUUS3mT7ohNgMxSkDyxsPr1YHC24+bqpmdx/4kFly?=
 =?us-ascii?Q?cc6rK4ks2eZyprjYzFFAuxSiSmE/G8fEtGCyCf/eIP+/Ohgp4rrm/g+8iDdS?=
 =?us-ascii?Q?OKll+4zFTGvK/j6DZHn53+GkVB/OAvEXW3mxgKv5Ad3gzuyrDesDRq2KlGS8?=
 =?us-ascii?Q?rZJgFp0+OdQukcV9h8lwQ8ZxxOmPRNnWRyrM+COB+NoKG4Svj8/LNFGescik?=
 =?us-ascii?Q?0Q/8g7okMvki5NW3JfMOzSKuY4cfZ0Mrv9gjb7Vl7A6k9rclf5BLyhE2HISq?=
 =?us-ascii?Q?PxcbIrCbEh+sLRHzxcTvMvRwMNwMEkJsyAIfpzAyP6uMdfOnpED5/rllQPXV?=
 =?us-ascii?Q?8Rnrz9t4jRiEUOsqnc8D0QR++jotw62OpBmEogcz8AAAJUtXRLEz4AlUnt1N?=
 =?us-ascii?Q?00DakjLwJ85Lhl5lFK/K9oK+WOE6GS/k17OTKgka?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4222.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c7fcf3ff-6fe2-4b59-a5c5-08db1655c48e
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2023 10:56:22.8146
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 XNuG9SfGHaaOrVKGkkaCU+7QWHWKtBsw0/4Z4jDCpPhGxv8JIHevJPhIVUToZVeA8aw/70wudWL+Iwd+4m4vPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8567
Message-ID-Hash: ZITNDYL5DRL3S5RMEN5M3QE6SZTZ2JJK
X-Message-ID-Hash: ZITNDYL5DRL3S5RMEN5M3QE6SZTZ2JJK
X-MailFrom: chancel.liu@nxp.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "tiwai@suse.com" <tiwai@suse.com>,
 "ckeepax@opensource.cirrus.com" <ckeepax@opensource.cirrus.com>,
 "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4SZSCBMDAHF6PR7T4A2YXFIOQIYPFZ4V/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

> On Wed, Feb 22, 2023 at 07:39:43PM +0800, Chancel Liu wrote:
> > This property specifies power up to audio out time. It's necessary
> > beacause this device has to wait some time before ready to output
> > audio after MCLK, BCLK and MUTE=3D1 are enabled. For more details about
> > the timing constraints, please refer to WTN0302 on
> > https://www.cirrus.com/products/wm8524/
>=20
> According to that the delay is a property of MCLK and the sample rate rat=
her
> than a per board constant, it shouldn't be in DT but rather the driver sh=
ould
> figure out the required delay on each startup.

I can't agree with you more. From the power up to audio out timing table in
WTN0302, the delay depends on sample rate and MCLK. Driver should calculate=
 it
rather than read it from DT. However as I mentioned in my last email, value=
s in
the table seem not accurate for all systems. It's a kind of compromise to g=
et
the value from DT. Do other codecs have a similar situation?

Thank you very much for your suggestions!

Regards,=20
Chancel Liu
