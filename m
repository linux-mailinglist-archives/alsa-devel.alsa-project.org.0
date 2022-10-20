Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C506056D1
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Oct 2022 07:35:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ADF14AD3B;
	Thu, 20 Oct 2022 07:34:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ADF14AD3B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666244147;
	bh=2mQbzNHzhjKNQ+VJkeVQ06cJ1dhOMED6ex6BdbfcMfk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=O7M4NTLVtsTPVvncn+Its3SPiD7dSKVZizx2Co+lt0MrAKcc0cgZ9rJKYfitzFUf9
	 Y3dRvobMB+Bem23V2/AsOG3OcHchh2dZ599roYh6vZXZ/SB9xlOxMgpl4W8ZHDxv58
	 /On0iuH91tImbHSlWYBB2FCwvwj+QaO4MSvxiB78=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 11F4BF800B5;
	Thu, 20 Oct 2022 07:34:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4CD4DF804D8; Thu, 20 Oct 2022 07:34:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_ZEN_BLOCKED_OPENDNS, 
 SPF_HELO_PASS, SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from KOR01-PS2-obe.outbound.protection.outlook.com
 (mail-ps2kor01on2073.outbound.protection.outlook.com [40.107.128.73])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EF107F800EC
 for <alsa-devel@alsa-project.org>; Thu, 20 Oct 2022 07:34:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF107F800EC
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kKTSq7KsUUug25oHcj8QVj4HW+2ycQuDlj1QXJl4Jkc+ID/HARTW1Ln77wLCVLseyTLVsvzEA3YqDemhxA7CCu6PYrdGSb0biVG+VUB83+sfL3CGHb+PYafU+AAyz/1+8UI+kGf+KvxMB3K/GA0qPjCoFqO3Nv+pY5w6mkZ6IDlYXI9p7TELt97xDcieGYBYi32oHR3PEaeKBcUTphfEWzow5rj3+6Awdp0mbIt6jfM/AJV8qP8INyMoEB1uNYlA4Fw6OazMJujyP0ad2SFNHXbZIlmSX7SfLJ0K/zLtrXaWYoSIZQQ/valL80BLkUnkA4YQ/9NaOa1RRFgPCHhlRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q1dQ7hDMr48AyHcEOkNSpU4DiUP80WqlJa58cAqEv1s=;
 b=KjRVRlh2O+OQfQFsZc00mLie/FTd05ZPadU15d9m87ZGxCCSLYZ8Knro7vP3gd1eUKD+SkPL7ZBBlyvEli+AoL/Umysx7ab3fVKGEDYM/9W6HPw1NOlQWZCeWEKzDiuZQEppl5fD5SXHlftPyplZtBJkEkj8OwqrAfwsbr4i1XRR8Nj5bgsiOfjyXqk3OCL7TgMLEglyluJuwL886RycugbVpud2DDzbtGGHQO/TOp60gLfeSCNzrjhTsxjWoBjrDBvFejlhQ1yjxeyDPgAmp8OYSeSeyMs66yvPlFhvZUQDnGSFhi/pdz17Np9wB/j12ncvni8Pp02VEDwCKiNjug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=irondevice.com; dmarc=pass action=none
 header.from=irondevice.com; dkim=pass header.d=irondevice.com; arc=none
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM (2603:1096:100:7::23) by
 PSXP216MB0535.KORP216.PROD.OUTLOOK.COM (2603:1096:300:8::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.34; Thu, 20 Oct 2022 05:34:39 +0000
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::edf3:af9f:553b:6603]) by SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::edf3:af9f:553b:6603%7]) with mapi id 15.20.5723.034; Thu, 20 Oct 2022
 05:34:39 +0000
From: Ki-Seok Jo <kiseok.jo@irondevice.com>
To: "alsa-user@lists.sourceforge.net" <alsa-user@lists.sourceforge.net>
Subject: Name prefix
Thread-Topic: Name prefix
Thread-Index: AdjkRY041S5tcFW0QIajfahpW/wUWA==
Date: Thu, 20 Oct 2022 05:34:38 +0000
Message-ID: <SLXP216MB0077125B8D4AC887A86BC7018C2A9@SLXP216MB0077.KORP216.PROD.OUTLOOK.COM>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=irondevice.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SLXP216MB0077:EE_|PSXP216MB0535:EE_
x-ms-office365-filtering-correlation-id: 3b377386-86cb-47a8-af45-08dab25cc80b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eyXS7rthnSf8QOd+T+Bd3HlUAcwSwyK6RoD43chNoh5r95/yfVhsHMfMABw1xK+nWhqf7zgsxZRKASxya1Mc2iRMiOD1094KDSYE/z+vpxBIqvlQ3kD18mIdDnA6l5+p50rKcvNef1kysAGEOCtKKPy/BFkimhmAnc51hPJD8vLRUN/ueHOg8e09H3dE1v2lauRX94Alg2ca5i2lL7lk4KHoRoEMatCKmFST8MzT6SZajXQkmbrzEsuFbuJNUKkI+K17AQehL9OcTqRrYt3xKoSuv+di2AZ1/Dtu+cv3P1/GxFWU+TGGQihbSAcUbrmqKjvPfkkW2M3QZMlYr50ucg00woXcvpCpxXEnxYRxSGoYU8YeG0f2fUkKAIrRHec38BdimsJfLmypx+A4p/VgWY62fJZa8qj93eYvK9JuzsscSKaphv0g8Pknd/KDljd0HL0ryPztV4l+Ss4PX7rlKgPjleWUZ3c17pBqHYr1036BxUThHaGwd7tZOIPhSTtzgmwrky2j4OZD3qf6U+VWpr9ygjm9v0Ai6fb6tpCOgygAZGbL8MB6eufpt3yE0W25ehx7wye9aDF3YegMa+MNKKTk1LrpVSsq2ZbK1nU/yU2gG2WUTpEjKrHFwUOA3BnR+OxhKQKJXnYaQqC0WAXSi10qkNhF37Uy1zBmwiJdwTEZPB8FNKtg4S+NepAdYlXDXg6/9tYDOsvqQ4G5pQE9i95KaeXePebYFxfYUU//SIdW2rKbis3yDiZEzszUBMyQ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SLXP216MB0077.KORP216.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(396003)(346002)(39840400004)(376002)(366004)(451199015)(38100700002)(122000001)(478600001)(55016003)(8936002)(9686003)(52536014)(316002)(6916009)(41300700001)(54906003)(83380400001)(7696005)(107886003)(66946007)(86362001)(3480700007)(38070700005)(71200400001)(186003)(6506007)(2906002)(8676002)(33656002)(66556008)(26005)(64756008)(5660300002)(76116006)(7116003)(66446008)(4326008)(66476007)(4744005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?M/rbK3Xnvw9VrPcBWSQ5fE+YzZDoMwez5QWrZZs20v0VD6KBSj58g8WhvWFb?=
 =?us-ascii?Q?NvuDPMeBNmLJageQs2+9RN5H+NKT6M1vU3VIYBiJHYF9bPfINsKEFiGMiCfD?=
 =?us-ascii?Q?OXYwZqmxZgTnj1ZY1I8AaRwZSagZ6BMkSRYGosTgzX46GdiVmPrUlSUMlbTr?=
 =?us-ascii?Q?D/COhmj4t4us4id5B8zT1kAdcBSutyqbjkv84eCUpv45NIaXwA0bYUCCDkud?=
 =?us-ascii?Q?h1EosTtyX67AgZsXHnqtdwcwYjHuhHFlpregZVlu7vsEh8ntYHwsIW+FtKSn?=
 =?us-ascii?Q?4QYEvHwMDAzOI+3ewjL5fveDy7s4ATp36NVo3XBJxbHTl1c8onJ6DftK6l7I?=
 =?us-ascii?Q?xTcnWQglv8AO9AsAZ3VPYJSg8ufkuZx0WQRpNJ65JRpDCXB91T3OvxWs224i?=
 =?us-ascii?Q?/Ar9b2m7lgu+iYBLwrL+ouxdqgLOpHnB+qoz/OxR/OdDdvXwBGfc1blB855L?=
 =?us-ascii?Q?6vVeUbPZixS1KxeasLwmyZX6J8IXQ6Q7HfUYjxxhlO9OqUGUoAm8NC+7XuKG?=
 =?us-ascii?Q?LluHprn6CP+C4A+PL00HLiy7+a2KOGUowzTMmQdn4IaUn3MUPEFqMag9w4zu?=
 =?us-ascii?Q?O0WHaILCZjhAAy1ihQU9AfaQRr+76DLGTcqIznJ1rhralaoWzb44nCzGKcBz?=
 =?us-ascii?Q?Zul53Q75ECc5DyM8iiShSnNbAsgZjSA9QrEMSOSSqAnTHnrNbCEIw+1cOhb1?=
 =?us-ascii?Q?6dUSuKM28adXYLwbIlF2O/h8Hgx81SW7ONqzETMwl5Wty+mXkip5XIwhGuHN?=
 =?us-ascii?Q?6NT0+T3bExClWRKe2/Byz+xgodEq9pIs8+lbjuUZJiH5oH0a18KX2fFMS0C1?=
 =?us-ascii?Q?j5wP0KT/jTOd1z7pKT79Wq1tRZXi41ovsW/VQ4EDyQ7LOBdINSqhPXeSsLu9?=
 =?us-ascii?Q?A/Ygc6P3UisVY83JS9WcfLgd+5SUgm9Jm3gOqztk70eHVKlejRuqRYrcPohZ?=
 =?us-ascii?Q?BuLgmO3ZQk++XHrtpkZGpPVT0InXFBGx9XRmbWgMuJY9xXFr+9nIGtfh/IWx?=
 =?us-ascii?Q?r/QI4w0L6Ea6BE8iu1Gs96s3pKKC9JjlMNlR2NPpMfKbP2DQS+orvOKuQbXB?=
 =?us-ascii?Q?VF25c6//78ji2UBTSMdrIbw2qbYnKFLGkzK988oOXfe1g/3sTIt2h3OLRLFt?=
 =?us-ascii?Q?SYqDUU6OWu7wJ+3MOfBa6Q5k6FtJB4HpdrneTpA535I00dR3gydV0ylTTFNL?=
 =?us-ascii?Q?k8yf5odp4kDWGhg1CnXy/83gv4Kg+2grKZui30Mj5Ch5fKl9Bw7ljRCsjwS5?=
 =?us-ascii?Q?gT7vEtgv6aXlYP1RI9EBReiCzayL/3wOSYhSpqaShbfed7JABAFtZ4eSS/sI?=
 =?us-ascii?Q?KJ4fj12l3a3nhZ4jJgm+BobB9fxT9gnpqCVm3Pb2bRqAofKfDFlc0qbW2RQF?=
 =?us-ascii?Q?hwrujv67hm9UPBg8Ob7DTTfh72i+NnWADXUpsfjqpLj6oyORzKzwAD7QHcMd?=
 =?us-ascii?Q?g7di0LsfHGK178CD0QZAHrl6MFDn936XRyeFn/uzBXgWCUBh8UTnSfLZ46x9?=
 =?us-ascii?Q?qSarAXQjOmh9JYYYDxhRN8Rx2naVRsseFf9xMkfi9EoTeJFT2PXSiOSu5rDi?=
 =?us-ascii?Q?kef2mdhEJgkvYPo/DQu2hdg+l3eJnD7LA3F3cjiC?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: irondevice.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b377386-86cb-47a8-af45-08dab25cc80b
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2022 05:34:38.8665 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b4849faa-3337-494e-a76a-cb25a3b3d7d1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UAbdfw46rxskNaGu9Ff83uO0E5QAOeRr/jNVaNQJol+ZmfzBq56tEjkwLcQGK6QqJJuOP8OQyqz2FjeJytu7XkUq1hU17eXK3el5FobQOyg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSXP216MB0535
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Application <application@irondevice.com>
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

Dear all,

I've difficulty using the name prefix in component, so I want to ask for he=
lp.
The purpose of using the 'name_prefix' is to put i2c driver name before kco=
ntrol's name.
As you all know, the name of the registered kcontrol is defined const, so I=
 couldn't modify direct.

So I've thought of some ways, but I don't know which one is good.
First, as mentioned above, the name value was take from the struct of drive=
r(snd_soc_component_driver) and the value was added to the name_prefix amon=
g the members of the snd_soc_component.
Then, the error occurred on the dapm widgets and route.

  ASoC: no source widget found for CLK_SUPPLY
  ASoC: Failed to add route CLK_SUPPLY -> direct -> DAC

I've registered the 'CLK_SUPPLY' on snd_soc_dapm_widget using macro(SND_SOC=
_DAPM_SUPPLY).
However, with the addition of the name_prefix, the registered widget could =
not be found.

Is thee a way to change the name of kcontrol or dapm widget? or the way use=
 the name_prefix, or an example code?

Thanks.
