Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 192794EBC3F
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Mar 2022 10:02:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA7A0174A;
	Wed, 30 Mar 2022 10:01:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA7A0174A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648627322;
	bh=EUGok2qGnNf/8bLLpRO9pXutwm+wxStTvaL17/QWOpk=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R0NZ9m38AwFuEYaau+1Bet+jfS3c8lLunPHU+uLuua9af4F6+2GrYAhJeB7txRXID
	 /DV+Vj7zPTWGe85Av8QPqgKKYO7K0qvOgWVqbgnmHx44iVjnPKvHyGdIP19oHQWbNR
	 GMssAVHe7chwfjrAp/Oz7CK6WMvE0FMHOaJT6fFw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 166DFF804E4;
	Wed, 30 Mar 2022 10:00:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DB2ACF8025A; Wed, 30 Mar 2022 10:00:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2071b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e1b::71b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5D580F8025A
 for <alsa-devel@alsa-project.org>; Wed, 30 Mar 2022 10:00:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D580F8025A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=bang-olufsen.dk header.i=@bang-olufsen.dk
 header.b="AsGDymc/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=huLQ3dAASP5XzpAxXMMj0sfQKnYNS3aWaKBeoF2M4Khe4tcw9Ncndy0K3l9guos30Bn/kBVtlqFAU8QSxAjVjkwjvzpOdlgL932AmgQERtnru7YiNaza6tpSTcbZXOyr0PZna8pXEFPBMM95DFtBLw3MUSn0VEz6bJr02Mpll5bxP29vK88P8gLu1YaqRQu23xfZm6XQS0SKHUD2jMvKXc3fPwi0Ua+TOWfr9xAuRVbxGPF2XsggtkvaGxCyebnqfA35RubnrirPMZEGcfu+VsmEDtCBgD7ZAfjC5S0741Wq9zobMTPaEHGK6oPLy2TcSQ0UR4bUFGgPXOVNORTkHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EUGok2qGnNf/8bLLpRO9pXutwm+wxStTvaL17/QWOpk=;
 b=dOWolVICt1w/dncNm5PqCTTXbjm14S5jIjc1d0BRIebvLJlrMVAJ0DyRlxpAbwA3DvwUijEbb0OTB0ZqWvasJgu2hj8qTQW6Qg7vy7xesKd3I8nTABzbWKrXqIkuKDEb5WpVpVdiztILsVsJUkIsSqjB+sGzlPw9htsy5vYZishoxHK9RsMoJ48EIr2s44JuQ3hm4Aui5eFzsLspDad0OsT4Ss/wlCmmxndwO0eUueyB4p/VS/Oz/676T9osi5JW2d4O9d6RXSMJKglDasX2nnicTl/SIMcDfSoKfCnnnqW2yVQ6l105/yGjx2O844cSLxj1qShZhXedekYCWu8Zng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bang-olufsen.dk; dmarc=pass action=none
 header.from=bang-olufsen.dk; dkim=pass header.d=bang-olufsen.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bang-olufsen.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EUGok2qGnNf/8bLLpRO9pXutwm+wxStTvaL17/QWOpk=;
 b=AsGDymc/FAQkUm4j9Mp8/ujXsIf47xMzhMz2ynTH/EdXjybaBjigbK9aKrlUaEjfS9IuTEzJu3YVsIhTa860uStqFmOODY2jMnsLqquhEww+7fEjxbIA33BrU9qhS2oh+Z44uDuWs7eJNnPx8djAfu2Ak4rXd4E8zftsciPuIe8=
Received: from DB9PR03MB7794.eurprd03.prod.outlook.com (2603:10a6:10:2bf::13)
 by PR2PR03MB5163.eurprd03.prod.outlook.com (2603:10a6:101:21::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.23; Wed, 30 Mar
 2022 08:00:27 +0000
Received: from DB9PR03MB7794.eurprd03.prod.outlook.com
 ([fe80::8e5:532a:a95d:f7e9]) by DB9PR03MB7794.eurprd03.prod.outlook.com
 ([fe80::8e5:532a:a95d:f7e9%9]) with mapi id 15.20.5123.016; Wed, 30 Mar 2022
 08:00:27 +0000
From: Claudio Cabral <CLCA@bang-olufsen.dk>
To: ZTube <ztube@gmx.de>
Subject: Re: Focusrite Scarlett 8i6 silent input stream
Thread-Topic: Focusrite Scarlett 8i6 silent input stream
Thread-Index: AQHYQ5ExACfskOYFukq57BvhZLLGZqzXkUyA
Date: Wed, 30 Mar 2022 08:00:27 +0000
Message-ID: <20220330080027.ciznr32w6ghgy7wx@akura>
References: <9146b00d-42c8-d965-4374-8b6689fd948f@gmx.de>
In-Reply-To: <9146b00d-42c8-d965-4374-8b6689fd948f@gmx.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bang-olufsen.dk;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 80058a6f-7a2b-4258-c5d9-08da12235a57
x-ms-traffictypediagnostic: PR2PR03MB5163:EE_
x-microsoft-antispam-prvs: <PR2PR03MB516383BC572CF860F8179F11991F9@PR2PR03MB5163.eurprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5wu1euWJF92YIf5dsIllUEeQElARltWnB6Id4Ld+FPyG+mnWAhg4Noh8CDuXo4DvQz9dMK8ZXxkNHF8/3h0u0pBUG/athD4N45Sv08JSiHcSR4PBpiuDTBtCWeD2q0UfxLCUbnp9jhoro+hM/qsmrHiIHNrJZdPe80TJsz6bdc3BsnlJ4PLRCy1oZ74B3TYIURqCq8gQHvH9xGzbLW/LvEMHWXPsA6BQqA3BOPLhkTzLTdxY9eNUD4zDgXGwOWlPyF4gKrJ0tFrC4/AmcIeMMPdm6892GBSYZXVMyAyEqVPqScsoBgYqFoUBknY1HwndtWc1EEAzMRZxKqghZ0tC3HCBPRP8yL1dBHyBkpPSFpxuJtkO0k7QttMe+1e7FYQRDGsfuj7MD2rWtjJq3jhWDGjBFor4NlOPQInMKUPU8VDGuj02El9h0Fzh0nuNNdiUJwACOxfqt0DHiABNwuKgJywy4Qm4iXYHXBOwrr/Z81ADMevimKMcq0EmoyzAYxOs/ZFMd0jmvc2NPXuPllfSREo/RihqPYdn6SuN5JLDdqQN/5ZgMuywlU4XWG6Hxs6gCgg6SYKpIMYF5Di8BByX+EnRaLWsDYg6q6+dPhlvP6y7/sCqvCIxV+WaX6QoKMPuwg+ETe3pEzSDUlDyC4R8bl543FgkHv3YrX4VmVktF0/HgY/ueMd1wg4A2T9YUQWXtD+yMKMmr/0vDBtv/6zF4ycyeOlEMQPAqEgCsBEz0QI6WoqyKikuMOe/FSP4XuXm2JkHGIB9cChpW2OuAk/R2jcAYXETL3a+QA/a6jB5BVI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR03MB7794.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(7916004)(366004)(122000001)(9686003)(6512007)(86362001)(1076003)(316002)(38070700005)(8936002)(5660300002)(6916009)(186003)(33716001)(26005)(66476007)(66556008)(66446008)(64756008)(66946007)(508600001)(38100700002)(45080400002)(2906002)(71200400001)(83380400001)(8676002)(4326008)(91956017)(6506007)(76116006)(966005)(6486002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?SLh/wNq3Hli8idkh1MchdesNvE1jHR6TWyyFm2gVdXQ3h8rgPSgxe7mLLmGp?=
 =?us-ascii?Q?5+5rAklrjJ+a9j1/GB07GFeFxbIKaGR3QWuDK9vlH4EXC49zV7dkOdLVUmyt?=
 =?us-ascii?Q?HqSVw4xL5I0tg6nQaUNGz0wdYSi75cKwo90uLV2Xh11RpggHjq2rCdZHNnjX?=
 =?us-ascii?Q?q4+nA5LdiRfGzAoQLwwgO5yRxcVGIqOe7R7g7Vb316GHwRqPDLeMWbZ0LSp+?=
 =?us-ascii?Q?9n5aoVmZ45J6Is+mAUwRRVrArUVOgcRFtfJIqxBbXNjNKYXGothC4LXHIiYH?=
 =?us-ascii?Q?92GvVh+n6pdkiZ5cLZrALrNT0z5R/QUYpqduxr4KRyxkyVa2X/5XkJ4k5hJZ?=
 =?us-ascii?Q?kpLEd7B+BmM2uMdf+XLX5Um3z0vuzXPT9bMns9LDsMUapVjOAtRtUIjegDKh?=
 =?us-ascii?Q?cylBV8WaI4J18WOWZowtFjGSeZOcll5mKWSd2V4/PhsLFCWrm7J3k5a4k7Aw?=
 =?us-ascii?Q?A3b9pNeRhSnEURIrl3d6gZgexB7LlbYWTKEjeWDBEOzfivrIy0py7QAG3rMI?=
 =?us-ascii?Q?DNRBGZLmX4q7vPatJB//78dOpemcGDypkhar4lS1kkBHN6qwOzOSCh30nKst?=
 =?us-ascii?Q?b0tQ6RqmJHaaNezun/hehFs4LMazN4XZuQVdbCsbsqVs8G0cmvE8mEW62hgc?=
 =?us-ascii?Q?mdWvbS8zegMKnK5uqZgAJLZ3H3VjAhMTEPN8/Sov1JEMcLrIC8Sbz6IUZ65/?=
 =?us-ascii?Q?Rm1KKCXaPGpaP56M1ElFOqZThPp8Hrs/JMO7LBcgSgj94PF/+XwNcycwHyO5?=
 =?us-ascii?Q?DOyYtWtKFkSQxaMJZf6XhFLp7geS29+Nnfncu2lAE6dNah4ohz0/l3CQ97+a?=
 =?us-ascii?Q?H81XNPXXxC5nbb6OM6A8I/rVLEp/UK5FhHLaAcT9Ez+0n3AeeyrZ2KPZkcKK?=
 =?us-ascii?Q?a+pg4nsIidJBmcDE3ep1VH5/pukG+ju2+1nD8M6HXhTManbZ/wa3/Z8VohVN?=
 =?us-ascii?Q?6v9JfdKs+tLx6d5/2/4deAKUESLFyyweZGElJZmDFZybJhqQjk3HbJCSdJvC?=
 =?us-ascii?Q?/eEqhup/zD7BjVGC9PV8rbPMbhY81xv8vIZs2tInK/G0o+1lmUh098jcETqm?=
 =?us-ascii?Q?Q/q00acZxdK3lByMrlkPlIWKcjzluzI98EQfKn1GYCJBv+UsJ7B3D3YkN9b9?=
 =?us-ascii?Q?ku0aambTa7U21F7Z5argfH4IQ2IqUrZCN8kARSQxh8T5y1l251dJaroI2SpV?=
 =?us-ascii?Q?8FdLJZJcedJOZDMV/mbvPBffuUv0Nq1FmlYoshk56/MYUiMcyuJFQp+8+cDJ?=
 =?us-ascii?Q?j511/EtKG3La6uSPNpD1yNrEFUgorWyRE0+N6atgKjp4ztBVkE9psYNx+Hf8?=
 =?us-ascii?Q?bWp6xmi3ruk1H0eFMXK1cS69hwtvMDkWGj+HO0nAQTqmDv4u1PZ0dxok3lSJ?=
 =?us-ascii?Q?id4jXKn1QDZa+4D8ZSXtOe/l0FVEgUoD5cPqFi5xNVSCvR3/7tHyX/nrVLN1?=
 =?us-ascii?Q?Cb698rJECxvL8iOJPfXSgtnbycWDIuw7586kBDy9mqPLMbpsOCFvxscHeAY6?=
 =?us-ascii?Q?9svpmeN2Z3oF1C7aSvIL7T2GZIUldaeJdz3B81AGDe6R17cY0Avx/yvmAELP?=
 =?us-ascii?Q?e/r5hXNFwXdedSCwccUcBSLPFinKxk4THeCeIR7S69t08e0FmKDym5YMDRto?=
 =?us-ascii?Q?g0H4cNuk/b9qpCeWMsGpTyrISJqQNbWd8Nmq3gpoCEsl0mNq7JctCxSDBqS9?=
 =?us-ascii?Q?aQu1lojO4LNJC/Mq6xYhAk9sayaac4mEX6T18k2/vy1JxxLsZN5lWgMA5ZZp?=
 =?us-ascii?Q?5ZpPimELe2XToAud5a8moVes/hUn5M8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <EB3E6D440670E04993BE93A7AE0F5AB3@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bang-olufsen.dk
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR03MB7794.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80058a6f-7a2b-4258-c5d9-08da12235a57
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2022 08:00:27.4578 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 210d08b8-83f7-470a-bc96-381193ca14a1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I+fLd1A6dZXJFhG1wUyUGL9e061loJhEP4UPQNs0h3SrtSdOm+DwJHyigiAJjYXGVw+vjRr391xsmYT8KpyVQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR03MB5163
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

On Tue, Mar 29, 2022 at 07:18:11PM +0200, ZTube wrote:
> I'm trying to get my Focusrite Scarlett 8i6 to run with alsa, however
> while the sound output to the device works fine, the input does not and
> merely delivers a silent stream. Since I can't find any reason for the
> input stream to be completely silent I suspect this might be a driver bug=
.
Hi ZTube,

did you follow the setup instructions described here?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/sou=
nd/usb/mixer_scarlett_gen2.c

There's also a bug with the saffire range currently that prevents
a record stream to be started after a playback stream.
I suspect the bug is related to the usb audio driver and the
handling of implicit feedback mode, but I haven't had the=20
to confirm this yet.

Best,
Claudio Cabral
>=20
> $ arecord -D hw:0,0 -f S32_LE -r 48000 -c 10 | aplay
>=20
> just results in complete silence
>=20
>=20
> I'd be happy to provide more logs/detail if needed. Any idea what might
> be going on?
>=20
> Thanks,
>=20
> ZTube
>=20
> [alsa-info.sh] https://eur02.safelinks.protection.outlook.com/?url=3Dhttp=
s%3A%2F%2Fpaste.debian.net%2F1236037%2F&amp;data=3D04%7C01%7Cclca%40bang-ol=
ufsen.dk%7Cf4e40b9d3b5f495e60a208da11a84759%7C210d08b883f7470abc96381193ca1=
4a1%7C0%7C0%7C637841711889888530%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMD=
AiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C2000&amp;sdata=3Di5LZbJ9=
LT13EfOoMl5khr37s1aurziKkMLEl1dqPI5w%3D&amp;reserved=3D0
> =
