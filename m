Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0152364E4EE
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Dec 2022 01:02:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 98416187A;
	Fri, 16 Dec 2022 01:01:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 98416187A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671148965;
	bh=U5ofymzFYj7RXsNEYKuimdYvvqW/+Sbe/ybKK/crSgM=;
	h=From:To:Subject:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=An+xOMJBNh5qQEQEFBG7ajPYpvIvPfTHUQCuGNI7ysiJGToJn+uNPqTbwSgLTL/hb
	 2hx3BgrljXiWQJ4UEo/1hJUOWyvtBruOB4ewlcwfzeRRi4afdI9/FWqjhks1+PRavv
	 WcXs8B7drYxDdaJMJXw5K0qGUUJt9xKi+9+Bx7qU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 31E6DF804F3;
	Fri, 16 Dec 2022 01:01:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 83B40F804ED; Fri, 16 Dec 2022 01:01:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2129.outbound.protection.outlook.com [40.107.114.129])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 77109F804CB
 for <alsa-devel@alsa-project.org>; Fri, 16 Dec 2022 01:01:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77109F804CB
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=d2oWxHUf
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iof093/tTEqoBDFphyO41/WXWyWP9zoNcNshkngdoxo8I9TDEM1bwoE610OfVPD6mocDgROKISmclqBSXaBU2BC1Fr5tS65AjQ6UUD3mVXS8pOo98Dyt//tcPRba7cLYJUg4uf03jdbJnnDsLo4SGk7eeLa0ZQtKl/Tg7W+KxVdW9yQo7hDKC2wEZdbK7kniH7/N3A42JLCb4nP/vv3duvJT8yj3RyhvQVf5yTueAzsLkrYRrgIHvYgEzlJg9CELvt0Vs8atiDzS9NheU9Yzpk6zT4b1AmKSbZMz1XhktsDeA2BylnEfaaU19pb37j7IQdrMFT4ufBZhnDFofWAJiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dx/uU2VKx5Ol7nmtsmQC7rE7SBarZUbG1iL3o31qwV0=;
 b=PVa8Jxw9NqtIItKZLMrLNGHdpyb8l55NvHmXGLC48P98o46/aBs45fP5FdXcE2SXLY60x5j2I4xOqYzoX4svDx3mbI2g3ErGHM+QH4Y/LBmJos33S+MOxTLR4eCaSM69zaSi0JnKT1+HLFNNkUNKaMjWmqZzk3qT15EMFqIO1buKdcj67ZBzeQK+rPBSvdN3e64KGT+AStErI+v05PAICnBl51MQ5NZWR21DRscz4WM7FPhzBdMb41v2/Iwl3EGpAtPVMh4DI6jm7XAdJe8a128ZrjiQKQxCjPzGY8wQmjUekYyxbVGTu4MN1yxAhFFPsKMiL8v1ud4x8maTg9fWOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dx/uU2VKx5Ol7nmtsmQC7rE7SBarZUbG1iL3o31qwV0=;
 b=d2oWxHUfItxMbgl3OAJagJTVE29zrNfEse7Q6VzsF5eVYWlL5s+MLu1RxMrHQeD4gKRVCUp1cCX1DaHGwesFq2MJ253Db+8XBSasZrO0raohfsjWasAVpNpeba5QzOl2o+qhuBQkQin46X1dFVdzpzysRoPrLkc2Siiq4llrfqs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com (2603:1096:400:15d::5)
 by TYAPR01MB5355.jpnprd01.prod.outlook.com (2603:1096:404:803f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Fri, 16 Dec
 2022 00:01:37 +0000
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::69b3:236b:223:a8f7]) by TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::69b3:236b:223:a8f7%5]) with mapi id 15.20.5924.012; Fri, 16 Dec 2022
 00:01:36 +0000
Message-ID: <87h6xwcj33.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 06/11] ASoC: dt-bindings: ti,
 pcm3168a: Convert to json-schema
In-Reply-To: <87iliccjoz.wl-kuninori.morimoto.gx@renesas.com>
References: <87v8mepyoy.wl-kuninori.morimoto.gx@renesas.com>
 <87mt7qpylw.wl-kuninori.morimoto.gx@renesas.com>
 <CAMuHMdW=_-MyqAjRqaoPyWkoUmdB2VOE1t+wpym7eyOxkzc_7g@mail.gmail.com>
 <Y5sJV2KfX98KoMYZ@sirena.org.uk>
 <CAMuHMdWwP6QDUux62GZtCT7tsFhAhex=Fns5e=n_KTjGXHRy0Q@mail.gmail.com>
 <Y5sVewc7ItFBZkn4@sirena.org.uk>
 <87iliccjoz.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 16 Dec 2022 00:01:36 +0000
X-ClientProxiedBy: TYBP286CA0048.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:10a::36) To TYCPR01MB8440.jpnprd01.prod.outlook.com
 (2603:1096:400:15d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB8440:EE_|TYAPR01MB5355:EE_
X-MS-Office365-Filtering-Correlation-Id: 77298cfe-8319-4b54-f472-08dadef8b34d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Kooifkli2Or6h5QZUCbaqNCaBIQWlkJygo9Zn6utwvD4zCCYWw4PYbEOWdVfZx0gbBkCyEV/ty3WlsmtK549ojkapLEoRsCoblxwOriOt2Rq9BpTtkTGh6DwmjHXCh1KY66oH4y8D7YN+k/0JAZZlp7tYlL98YwipyAQrHyeDvJwEQ3WykoB08HkDeizI10KR397rJvLqg3/zOX1iaoT62Ymu/OGLiYq8HD3dw3rxX4PbXiygoleEuGygOPGwxgPtJTY10m83DWYY1ZVZpGdpTvvG+W6ZgSkCl8Xt5SUCVNrQhTrfCFKQxUiXeQF0l5jaIlBur1oSyrmHkKuN6rRrmfXPKp40yjXBW73ztcuCseFZ12R/6zpGuUkmAUlmghI9wICSsPtahIkWWGRDbck07a295tAmomgj7yxKUaPsUk/ute9lqYqBDs5y7RubqI4NVSd23BvaloTlIOkaQc9EiMpcCJKNuGd+doHnHV1vVJHTmmCkK+K4r78q7aOXbtitpH4aUgNkoPF+jEDH3p44WcBbxwRI242H5IAWMd9INXHTD9HjcNRiAGqyfabwmSrKTdJj1F5bugVP77CVVM5WPXRz3svLrNDJfXmGp2eHm60JD2bDYmq4u6VTYLJ8X4K8eAWcDlLGt7fesrzXOmQ3Fll5tDZ2OpTiq3e9WEW4WEc17/q8/kTGwj1TRDLNQtju7Nc38jLFAB6D0vpKDmuow==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB8440.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(366004)(376002)(346002)(396003)(136003)(451199015)(38350700002)(86362001)(4326008)(5660300002)(4744005)(6506007)(26005)(2616005)(8676002)(6486002)(66476007)(66556008)(54906003)(6512007)(2906002)(38100700002)(41300700001)(66946007)(478600001)(186003)(52116002)(316002)(8936002)(36756003)(7416002)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GHSJaI0KC7UeBHgB4GYJHVa42e6PvOpb+2G6J/YOMMyFfZoyZVwJHAMRVUeE?=
 =?us-ascii?Q?1wxDc8Runy84nOll/qA3HGHJX6RO94GS8UzBkBpRZnFcsDTTjE6r4FiF4Epd?=
 =?us-ascii?Q?8BhvbDrI7dtHckSYwrgq7BYdsEwkETXN7o+vS0mzT3qxfYKh2W+OQuwR5r8+?=
 =?us-ascii?Q?zq5MRTgafwZoNLzoAjKagSUblGvZbXRiBtFNY73gRej4eyWcCUTxRzNFQFWh?=
 =?us-ascii?Q?E2H8eOpahM5HljApP3PTB0FYvG1EtdW074828ecP3SxTc1TFFA/f13LkMK2/?=
 =?us-ascii?Q?cmWD7NeVF03/nNOvEpy1Zd27nmPKwy3Z7zHHesCErBFsU3K4oYdhaCkFsQpR?=
 =?us-ascii?Q?4Cs3IDaqEte1vSx6CevTiIB3RX67gp6ulh3m2clBoTMMlNFRajg1qWmZTjId?=
 =?us-ascii?Q?H+28Nlnw97cEElEZXJV7U2FPpeslnULtrnVDrxgzZKup+/dyQfzolZd7NiHK?=
 =?us-ascii?Q?qXb0y2wClTrEFcME6RTV7cwihfFxY44r6N39yTeHJbYJq+iMS8ARHsoozzVu?=
 =?us-ascii?Q?vFcE/0Xsb5eHwb/VkmOe9oL4/FvdVd3Qt6G0GnmozNfwQbOJyPIgyUjXv35x?=
 =?us-ascii?Q?3TvpkrGYCCUWwS0SiF/ZXluytKt9SOLEvfvkXLGmFwB0tdxmgklH0nF5Oy6g?=
 =?us-ascii?Q?TWc2QuKXfr360CrowA0zzh8dbrPTqJxt26HF1dDerRluvPSo0mGHthyNw5XK?=
 =?us-ascii?Q?9VUeXhO91yjvC7JiSdnH39gCGZbVbTAq1KM2WodKppQ/kblHns/5ODxD7fW+?=
 =?us-ascii?Q?dwRn9/TNUzGCW/IlIg/UgGCqiNXNKcB2I8fCslQwZ1JRqa/kC3Y1BFy2a0FT?=
 =?us-ascii?Q?kjJRlDa0CM36PY/bVvY5zpww2ysQJ4XtD1Xn1Ms3UAGa5c2TNhSc3XVzyy6Z?=
 =?us-ascii?Q?1FGSfBcRUsplCOWw1h9BTPxf38rOJyDrBYZvo3z1A1OpuUkVyQ0in9F2JDb8?=
 =?us-ascii?Q?Pm5ig/EArvwYAe14WbWpfXox7puRNqChaUN4fcZAeLja417XvfbSQZFrLuKV?=
 =?us-ascii?Q?vp4TEG9Wn03xRv7S4vhPdJaH3dFxH7CXooPeoHQnLgHJEdLsO4VKO2lMDs4r?=
 =?us-ascii?Q?/7BLVx79pmo83dSwufGwuQL0iYywAB9yxZGmcvPQdqtp8gXwo+LG2tsloKS8?=
 =?us-ascii?Q?TrNkX0+l5CdgJ7bWeZkzoGUG3JKEQ4mSYbjVAOlfGQH9R5qT4FHqZlBMcuuc?=
 =?us-ascii?Q?l3azWpWTNEZk0zrR9G5hJJlgCQjf69S5HDOsZmOMXUk8ETYL7uUJmgtF/6IM?=
 =?us-ascii?Q?T9w86ZJBqLvxXTsNZtZS+KM1VakP3mhv6ZsoHxbOtobsSmwbBJRw0WgtXZtk?=
 =?us-ascii?Q?gMolWEU5zrWhThnMjBGRGem99KbmmRssPtIM9k01qGb9KNMgRIzIQ4sK/NDc?=
 =?us-ascii?Q?OAH5omQbSPz/aDXrzv2VcbCBnmpXZKp7gEYW1WiAtgU/KNbFNAQ1Ryg/3szd?=
 =?us-ascii?Q?nCAGesR1EI2KEG/pBC92mmD1qZl3dkAm0+Y63pyeg8BDfQGGGQrKPIXibD9S?=
 =?us-ascii?Q?aEpl4iWyY51DXV9pHMNWmi/dRrAoCSFpex/mY51felo7swASamXLiyly9njg?=
 =?us-ascii?Q?q31oUfpH8KMkNtMoOPpPZszJt7qXmbv+vSzldQMmRjjx4pmCO6zgBKwqV5m8?=
 =?us-ascii?Q?u3/6/aVdrOsUVsleNYNU0is=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77298cfe-8319-4b54-f472-08dadef8b34d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8440.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2022 00:01:36.8926 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p1jmA8Vl7vDNs396VN0UZPths0ViGka+P4Fcb6OMB9hoVtghJbdW0mq4wvfhXF3/TMsT/yLAvFgCpx1W57AgFlukn9rmys3eDH8Qq7SNQdKIWpCkg6GOvmWtU/YaZ4ip
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5355
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Rob Herring <robh@kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>,
 devicetree@vger.kernel.org, Sameer Pujar <spujar@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mohan Kumar <mkumard@nvidia.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


Hi Geert

> > You forgot to list the changes you made to my patch:
> >  - Refer to audio-graph-port.yaml instead of describing ports and
> >   port@[01] subnodes explicitly.
> 
> Oops, thank you for pointing it. It was my fault.
> One note is that the port@x which it can use is depends on its connection style.
> Not only [01]. I will fix it.

Grr, my fault again.
pcm3168a port are indeed fixed.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
