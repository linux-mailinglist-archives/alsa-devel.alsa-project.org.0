Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 344EB508BE3
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Apr 2022 17:15:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D5BD91AC8;
	Wed, 20 Apr 2022 17:14:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D5BD91AC8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650467731;
	bh=b5z0Z9kngGmiSLEXaDj/u2bdzsCzxTp7cwlIGKY/z9Q=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hNVJDf5ewnPZesNPJI99e5p3JgU8SHPrzaEEsggkSDC3V1p0gnM81diAyHue8aCZ8
	 Y9kjY0yS3dMh/lwwLaBLSjAK3sPz1Rxd4R3sXgsyjhbSw06F2232wEsxp2kdkNA9DR
	 UIyA7Z5r95P0CnAkl5mfUjRLBbteMKUHk3NA+JK4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42943F800F8;
	Wed, 20 Apr 2022 17:14:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0BE1AF80125; Wed, 20 Apr 2022 17:14:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20625.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e1b::625])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D9462F800F8
 for <alsa-devel@alsa-project.org>; Wed, 20 Apr 2022 17:14:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9462F800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=dialogsemiconductor.onmicrosoft.com
 header.i=@dialogsemiconductor.onmicrosoft.com header.b="jOOGC38c"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RzhcNWmAHtd8f7/oQAJif+sz7Qcus+DfEaEWwpuNcHRrEgZ6ZlNrP+47DprIuECiTQEMGgrpceXvkSqcmpe4TLgDxUjK/MPIdiuUswk7Bp7Nwn5VC37DhGszTrJhI5oF6Y3Wge3QYlBN306qBPPGjwcCWRFK6EcD1fqvS4t0LA7HmoDPSxQ5bIMLTsJ8A//Fesu4h/lystmg+MeWGcCtPLGGwxtWoqmKNwNyDMYMaidiZKzXiMBXptzaa8ZeSl2kjcX4pGbSU7VkVMADd1MN45oJLas+U5y5kqwHukHeBjegQtB83e17lg1fX+dH6DtP+PCherYjhH6kzz6oPhLOKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cMKsUo4yNTncp4U93Gfay7PsHFHnKWWYWOaS1qtiWKg=;
 b=GnI3aN05GYQVSEstxt9t3tNE9iSYznPlMG7r4dPok/wFzFN/IvnJocdZfhlS2FEfokb7hV85FeYRFsfKVzlzz33rXghQ8LFuGA4GRLoA/b68YnwP+Mj1tOxbz0mgtqV94WzEFU/aQC3cGkz0kzd6iGd+M6Mf1uBaTH/xf30G13p5FFDFkts1Coa/sRMBFy9KrXC8iElxs3jMsZhRCbHHyAAthn5qeNJV5NqOWf9afH9l9B/n6QLCOUXnq39sdfHpvifpY/oMi28HufUwvLvGJtVEqdFTo5HE3ELIwOkooe+waxqD8E/A00u0KxAtlE43p9Ox2ROt1cJBgi25c2bj1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cMKsUo4yNTncp4U93Gfay7PsHFHnKWWYWOaS1qtiWKg=;
 b=jOOGC38c7VeY83JeCpvV8NofKFe/Js5e2futlviaXPipkiPqx1JfYiA4uoYvbUF4Nxv8Gd9AgePAH3bA6VDJ0pM117/fVJzHlXqP4lz1Gy52KsF9pubYPs7HFZPV9zZkezioih/koT+Cq4Ta8w55HwYRFImROlFneF5SsaCZv9c=
Received: from GV1PR10MB6124.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:98::9)
 by DB6PR1001MB1303.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:ac::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Wed, 20 Apr
 2022 15:14:16 +0000
Received: from GV1PR10MB6124.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::492b:803f:c731:623b]) by GV1PR10MB6124.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::492b:803f:c731:623b%4]) with mapi id 15.20.5164.025; Wed, 20 Apr 2022
 15:14:16 +0000
From: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To: Mark Brown <broonie@kernel.org>, Support Opensource
 <Support.Opensource@diasemi.com>, Liam Girdwood <lgirdwood@gmail.com>
Subject: RE: [PATCH v3] ASoC: da7219: Fix change notifications for tone
 generator frequency
Thread-Topic: [PATCH v3] ASoC: da7219: Fix change notifications for tone
 generator frequency
Thread-Index: AQHYVLtl370RZFV1WUKWQuKjFGImh6z46GcQ
Date: Wed, 20 Apr 2022 15:14:16 +0000
Message-ID: <GV1PR10MB6124C4725691FF2CC0A5981A80F59@GV1PR10MB6124.EURPRD10.PROD.OUTLOOK.COM>
References: <20220420133437.569229-1-broonie@kernel.org>
In-Reply-To: <20220420133437.569229-1-broonie@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=diasemi.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8666be77-94e1-4292-865a-08da22e06f78
x-ms-traffictypediagnostic: DB6PR1001MB1303:EE_
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-microsoft-antispam-prvs: <DB6PR1001MB1303B116D87213C7190E9AE4A7F59@DB6PR1001MB1303.EURPRD10.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lt9+ZO8O8FO4zdrGS9jpSu2KWZ+2zZd9P2eU0aahCF+LvfzCws2e6aGdfzuNeaoDwX4IvbjtbkXC36WO3F5xj1M2fdU9L4n/tDEREkNRC4EnUJXCDIGORN9L8m8fH94QTwhWEsDd5XGI6RX2cSQwwKvt1Pb97mq6+xL1dWsqw2YMn6akBm0MLMGshkgm2rY9Bwtz1NP3oWja1Yrwwicr/+w1wEjFpn7wm/oScLK+Q+MtYL6YEDUdpkCmP8bbzx8bft44e2U9WrM5ZIgA2/yGKaU3lrdZWl28Ws8ga6iqkkxwL8mtmWD77UFGBqzZTrAF1fW3N4n/2O3Z+1dhJDA6xxkU5Dw9zGoKJ0nAcKsEk9mZdO3/UYyu2+LiTGKZaRl0AJeiBpLIgEHYLVS9GqTGM6AVkEmSVad93tXbbvk19wJA/kyCSQq76HrxbEfifl2KIG4c3EnchLLdu9sUXMuYkhIqzSG7XJrzah3gARUvEhbkP5edUU0XcOfPyVpt6krt4iuiJcjFitLgRR/18uChlLTpDxf8sNsqq7Rup9ULcAoVx1pmkJkb2KxC2lVTLsSgDCcp50iJ3dPalnhlExAUQ9SLtStUFZwXEmXt9jOTQ/R/V2P0V8iJP3ZZe+a1rq19nkOB3esw5Gsjp71/RiPJhg06wpeDuoYomMwN/73uaZYyYeGyPWJdjUbWrgodIOXgnOp9HiQLkECRcxrJi/L/Fw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GV1PR10MB6124.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(26005)(52536014)(508600001)(86362001)(186003)(55016003)(7696005)(33656002)(71200400001)(9686003)(8936002)(2906002)(5660300002)(53546011)(15650500001)(6506007)(83380400001)(110136005)(4744005)(66476007)(76116006)(8676002)(4326008)(64756008)(66556008)(66446008)(38070700005)(66946007)(122000001)(38100700002)(316002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?90UELCckr00wOPVPJ0p8S4ZidtSc2oFUwBmsV6pnBlKNCJPB6PFva0rUtL8+?=
 =?us-ascii?Q?KrfKDro14Wkm+Pw1DEgNw/C+pTkS9cY4FWqrvaYWjFATKeU9BW64qRIFVgoa?=
 =?us-ascii?Q?+HmLFz5orFhCU7bKBk78r0c9CjRjqRwr8ewSZrpyijOTxS9sJxdYTCflYRop?=
 =?us-ascii?Q?l/kMjww0Xxo5wXad+KEvszWqQ6yLkV+FZTDPGfIbLh4jNyX0b8/lj7xOHLPj?=
 =?us-ascii?Q?MrR7DqPBHV2c2HnNp/2BkWZnrqF5LIkWUkj1gmFd6T0P0E4UD75lRgFyaofr?=
 =?us-ascii?Q?swKOwoPpKddJYRI9Au8LCvOvFq6twOghOK3dYSd5lnnuIwp0QEVDnBXl3a2B?=
 =?us-ascii?Q?wyU1jUYOvEA7BzOI0KMrJb+92ShJlniDK0x18zI3wPLTeMIjcNSOtc4OrfyO?=
 =?us-ascii?Q?hNWSH7nZpOJQTDzHt36AFQmtnBdq86WWF+SULx99+m+kAtIadaYfmDXLBzA2?=
 =?us-ascii?Q?B/6LDhULnUI/drdP7vLny7afoFZX8qS7Fv0eekirdbkEBctPT9rhzGKfRxMq?=
 =?us-ascii?Q?O8NkNhjeqeUjpABsByWSv22fRMOqNZFW03BVdOIx4Vgn+pwZTX4ZPugEARgh?=
 =?us-ascii?Q?usdjF+sNvZDm5uyQqZqmMHM6xJ69o5Bp4xxQfXHPOTDcMq9SBj7NSoa9uCxG?=
 =?us-ascii?Q?Jo59nuJQe7ltHzGodmFVa42kVAtOwcwWpnmXlZhwaMZA8amFyGN+XgDWTeQe?=
 =?us-ascii?Q?QK/b3ro0vW7t4eMKOBAIx8LptXlgZWokGtV8Q1Ra4CY/7TB+sKgzfVxxl8pp?=
 =?us-ascii?Q?8AMbfXwpTba7MmrkwGAzhnHFq0XyrfFX2u1zyzJXC+Mf5huQECzyZgn+12KO?=
 =?us-ascii?Q?y1nygC+BuR5UlvE22xxKb8T8Z0xUIryBvLWU3zOMGrlRRi2pmt3FBB9LvifO?=
 =?us-ascii?Q?UI/niO9ZBB4M/bHfcShBO40e+rte7bj7x/7kvIX4/nqjX6o7eNHSQqADX7Z3?=
 =?us-ascii?Q?8AnQLIdrsXHyCp+iH77YXo6I8btmEOzQCGlD7wt7gQotusNDdfbmNQj8PJmY?=
 =?us-ascii?Q?fSQCy93SbVFnUNXtTQ2U+pM1hpvmI9TiI2jAiUv2PcjWYMEgnXZKgR8vpr8K?=
 =?us-ascii?Q?0ZgSCdMgmZY/RrcHc6AaQJhfwJnG3uYr8TiEfHzGKFRYD/PW2R4oNj6c1tNE?=
 =?us-ascii?Q?PILBfGCj3gclveQYDY6RaP4br0r3gHLxgNB56lIwp2N6CsosprK2B91qBgWz?=
 =?us-ascii?Q?wlGDdJKrOJrwv8emj3W4wc0exjZZTpAhyrNHk/bTmB33ybvureUvvAI16x4I?=
 =?us-ascii?Q?uzwFg41aJG9KuKXCTbJDzyVX+JdSEYlNmwefUbJe70h/XQXavludkMwJOOgL?=
 =?us-ascii?Q?97PtSKTEDZiqgyiLC6mD4Q9q7hWwXDiNjYN1JwTbhucVMusRmUPr74S9DXf6?=
 =?us-ascii?Q?NyThLa5ytiKpMOKdAE4xdFo00hQK5uLxtIKH/JqSkTX+M/+VeAEUlHzkJf2d?=
 =?us-ascii?Q?DnngQYJYAaxBDGr4qDMxcFHWs0+lWY6R3IgfBiF9saqc+V5SfiCddxvBs3Jr?=
 =?us-ascii?Q?igkF8WUjyp3CychcJyhcKHjaRuYF09H/QGcd731NdLPdzK3AKBhQbHMZWRF0?=
 =?us-ascii?Q?iOZcJml2fltmZDthp5kgbf+pfNg0ZhTZzs68JqMvAVdOg0CuXGlM9KwAlK5c?=
 =?us-ascii?Q?/UzYJm31Ui2ImmzKxYgs1XhE66gTfAeclLv8n7OmCiugAREqApOOPqABuJv/?=
 =?us-ascii?Q?Lr710bPnzGvlIqn1/qcDsffOGGh9XspAzupBSNIGu48JRL33alwLHYbxP1bt?=
 =?us-ascii?Q?NKzwS1uutQ4D+cvt+JLcyK93elQbgZA=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR10MB6124.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8666be77-94e1-4292-865a-08da22e06f78
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2022 15:14:16.2816 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D/XJAFsoQdj9+8sNDBuvxVi75218cNcDGBuhP5P4Ks1Mq8jH6FqF089nbBz2cPGE/ujw7MBZ1fmc7sl6AuXkaTF58XVNgb7XWFMoH1+RJjA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR1001MB1303
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
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

On 20 April 2022 14:35, Mark Brown wrote:

> The tone generator frequency control just returns 0 on successful write,
> not a boolean value indicating if there was a change or not.  Compare
> what was written with the value that was there previously so that
> notifications are generated appropriately when the value changes.
>=20
> Signed-off-by: Mark Brown <broonie@kernel.org>

Reviewed-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
