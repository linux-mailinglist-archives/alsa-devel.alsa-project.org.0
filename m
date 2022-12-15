Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EDD264E4CA
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Dec 2022 00:49:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9782193D;
	Fri, 16 Dec 2022 00:48:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9782193D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671148180;
	bh=cGEoq2FojyvkztRam9gDTCf2cDPPvcVzmBhh1gI6rnU=;
	h=From:To:Subject:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=XQ6J37fqx67Cs+cdeJBepRNGsIdpz7J4fEXnAnlyva0lVAmF0Z1jeU8CyT3aK9fBo
	 v1a25Cj3kTSiggQ+Kna/AGKFFG9MKm1/R8nMvffLJN6+BTmbYdvkGdW1VX+8Gbcntt
	 BzJVjqP0yheqc0uonwgls/+rcPuQkDBJCrjmZwQA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67061F80141;
	Fri, 16 Dec 2022 00:48:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A9F3F804ED; Fri, 16 Dec 2022 00:48:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2132.outbound.protection.outlook.com [40.107.113.132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4631F804CB
 for <alsa-devel@alsa-project.org>; Fri, 16 Dec 2022 00:48:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4631F804CB
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=aFLXki9f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IFVgr9eD0Sh3d1Wb3is/lLJUB18DE9sGLTxg6WEvHAxsNVXKc51IyMpy3OsA59lRO3nH3DxfEAYioheFd8bBDJlPjbGaxMy3gSvOduUnXoNivJs9fNMpUTutNQRKL8JmBCLAo0ZStgWoG94fp6LAunyRhFcDRA+ijPYqhayCLFPWp+vdW0LGd/tUR6Q+R6S/deW+Z7dIynmLgyWk96Abf5A7WTLCBba+SJZH3erJE4hzxTyooELyotf8p4Rw4arA+Qkq0S5oz+XyXnzVZEvBJFhHHtLkr52+K3dGx5SfnmzGUvKy0Eeh/fIipxkZ9DPNo53lCbrxKWJiUdL3IIQEYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1O6ELjC/4VcJ+/uJaqbd+44uutjN1fAnc4GqsEafQ7w=;
 b=LF3qrNblxG/5cnh1b3+teywyrR19lJGQLoKq5r3+N/SRLcNiAQhkn0ihvi53am522OMmRNrwvuoYZ/h+zm2q4QQkLPH/OuuFZZ3vzL/tQ1loXLbgSTEhgyi/7DCKH0n9Tm6AToShg0Mnq9MU62sBnxhA9xH4qXfDB13WWqmJTyEbKKw2GF5o/IgouiHL62QWRTybWq0WCz5fVdJYW6cAR0nk61ygGg8J/J50ggEuUbrTOcn8/s62djtJykrjzuk+oj08ihZY+s1L5oAy0RH5VTkHkrjVpLolOqMaIp3qE25QglZGwh9j7q7+jjr06O1WuYut+yig1A22iy799fJxMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1O6ELjC/4VcJ+/uJaqbd+44uutjN1fAnc4GqsEafQ7w=;
 b=aFLXki9fXz9BFM/NGorEjndPIh4KczaOWefJSB3Omkq29hz1dETAYq7W8xwPaT70lHac+YLYQzDAuJOhGtyz5FNkYGS6rpComgPOSUxfaHMgOHhmPhSIG9ynShUZ9/tS4FCMlg1l8LEyIh7s6gmznbc1rEju3OTtkiPVH5rKgtU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com (2603:1096:400:15d::5)
 by TYCPR01MB7869.jpnprd01.prod.outlook.com (2603:1096:400:182::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.12; Thu, 15 Dec
 2022 23:48:29 +0000
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::69b3:236b:223:a8f7]) by TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::69b3:236b:223:a8f7%5]) with mapi id 15.20.5924.012; Thu, 15 Dec 2022
 23:48:29 +0000
Message-ID: <87iliccjoz.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 06/11] ASoC: dt-bindings: ti,
 pcm3168a: Convert to json-schema
In-Reply-To: <Y5sVewc7ItFBZkn4@sirena.org.uk>
References: <87v8mepyoy.wl-kuninori.morimoto.gx@renesas.com>
 <87mt7qpylw.wl-kuninori.morimoto.gx@renesas.com>
 <CAMuHMdW=_-MyqAjRqaoPyWkoUmdB2VOE1t+wpym7eyOxkzc_7g@mail.gmail.com>
 <Y5sJV2KfX98KoMYZ@sirena.org.uk>
 <CAMuHMdWwP6QDUux62GZtCT7tsFhAhex=Fns5e=n_KTjGXHRy0Q@mail.gmail.com>
 <Y5sVewc7ItFBZkn4@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 15 Dec 2022 23:48:29 +0000
X-ClientProxiedBy: TYCP286CA0042.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::18) To TYCPR01MB8440.jpnprd01.prod.outlook.com
 (2603:1096:400:15d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB8440:EE_|TYCPR01MB7869:EE_
X-MS-Office365-Filtering-Correlation-Id: c3ce0be2-5a69-467f-1ab7-08dadef6de2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IJSq1hTxh9v4Obqrc+X0aHS/tvjDQHQjgxtXWs3C8kA9/4Rs3qyk3KnEZ3DueuJ1Laikf5wllpZv+2bNojcF7w0cO9rlvniERZzdyvXg7gp7p8hejej+8gSMRWZCVOLfB3/bKGIR096fh2LJpo77PcMSB9Fqvjpfy7xF2vKhneDIeBNpPotN6DJJTU1ackyrU91s9ca5JD3T6mG/WTRr3pGgE86+MwCSsljfAv8/lNBfVvfARAZkXBcimCX8xha90KvDzFhi9Ei5WAcGohVmZUzO/IzzgZncQrQfe8CzzyrRgURB/vH/JKgjbWBTYbKNZBqlFpZTdvHwYWKH0JwY1ZI2ciOMs4aLHvlkFqND7dLy8YAIWknN+xZ6nEqEMga9iNm+QHr3UkDSLRq/PBL0Ec2C160MP9SeBKXQT/Phbx6m+dQ8DmVKslyJwReT3BT3/Hi9LCHR8jADGfGkJOS/JFRxH8usGhgSIi50hS6ZvO6VkH1MNN5Y5FJW46wi0gYDvrG+/eHVKc/9ake5GajRK5ANXGM925/35Lq2gb4CxlwHLxBWmzo2IPbweNmk+gtFxy/ybnZWhemRBV87E+oihPa2b0vbrqjdyQ2l7NduTQJ0BJmEyvvM/Pii2YswHaUxJBF13Msd4FvzhVfy3pQFjAnlH5yI1Y8LnWlI+uL+yn0uE9nZzfXI58rX5RY41Jsz2tGRBemRQ7m4bzF65Ne9Lg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB8440.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(366004)(136003)(346002)(396003)(39860400002)(451199015)(83380400001)(316002)(6916009)(4744005)(38350700002)(38100700002)(8936002)(36756003)(5660300002)(41300700001)(7416002)(66556008)(66476007)(2616005)(4326008)(8676002)(66946007)(6486002)(478600001)(6512007)(26005)(86362001)(54906003)(52116002)(186003)(6506007)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UUGDZDRNa/9A0RkSCQuEax1np+Bl2AqHjVwzGZdPOR6Ke6tbjG5FYwGbP3PO?=
 =?us-ascii?Q?ilZvEr7XMlaLdsMT8eEEUYT12GqRA4a43vuUysppe/qJwLHLcMwcP2Ed0IO3?=
 =?us-ascii?Q?yVSu5pSVIMAxRJt33bfT+a7IhAWgPAuDrWaDVbdnwSBoCTuNafv8MylwKwqt?=
 =?us-ascii?Q?6ewZ4OvWLvbOzChYf+HCkJNifG4siDlohfh1idDejuI5BPa8G18JvJoJjz/q?=
 =?us-ascii?Q?ODC5L0s3QeSbiCKfO5rBniKK6QAO6YFZ23f/659nGqOTg8bfdgk/7/bE2cOT?=
 =?us-ascii?Q?mnkGJzT1WPjjevtpJthaI7RzbQqDx3pN8GEvNBmPAJMkPt7Y17Gx3qvhBP+7?=
 =?us-ascii?Q?4lD7buqWJFCr4iFAjFh8kGcdtuql4dYAn3oKq9SZ62rrweXaMlyQZJpj2SWR?=
 =?us-ascii?Q?DE9daIqNnSYUNng5S0DtIIuh8j0QgsD04M1nsnrPmd+6+TcVFJ76K7iKZ3up?=
 =?us-ascii?Q?7xDDgUX1XvTx5Ol87HKuBuHLjYXv7H5CShH1E4tOKcEpfM8K1oeZ9ryQRLOJ?=
 =?us-ascii?Q?UfN4JNQxgjZK974IOcRsr7OnbYCdfYiX9G4ZZaL7HnqHwyLaDuNtDw9WCQCD?=
 =?us-ascii?Q?BVCfAN4osTDfENP2LcabIXVuq9XezaifFM7i2MD3TV+EkHTh3j5YTI79m9en?=
 =?us-ascii?Q?rvfzvAYSX5hbYoQLbD3gempDTBY/mhBpW6mILMtvC7NXikMolXE+Qt4q5FhP?=
 =?us-ascii?Q?UvaGWgYHGF7laTDVQQ4ccZTUe4/B/pHMDg/psoJDhidxUEzBvOvn2+4xVwVA?=
 =?us-ascii?Q?CmYFUPBZxlxwXvGdAfAN3OrGqLBul1oLURT+jhhB+wspWHIz4A0WJ6CZ6Qud?=
 =?us-ascii?Q?TvQRCKa+X0vAyoOteleFmY7xS19PWnLwtMN64R9+kR8PhWpA23hgY6H6SweB?=
 =?us-ascii?Q?i9kOfWJQc0JJTtLUD19+VkpPJ+S0lNR1UZOe+NPCzS1k8zt7WJ2O+DXp/hHQ?=
 =?us-ascii?Q?osEAgEzJi4rE2CddB8gqz8LbnLfDy1u7W6bcw9wiFLiIEAZ31DQKxIDrrGqt?=
 =?us-ascii?Q?2na3seq9YXoTh4feGsf1Kf8Lmmz5V385iejD6zUa9/BNYlpp9Mosw6zLlUkl?=
 =?us-ascii?Q?ehxoK9ewv3LYGkrYzp9CcIF+RORot1xoRgREtwr8nawx0R0nWSToLbu6D+Sq?=
 =?us-ascii?Q?Bdt14jUFGEvizoseRa/QXoZkgyCn+6SPEsRvIW3t6MwhFFN8iVN50Y5E4I19?=
 =?us-ascii?Q?fij+ruv0px8k6343WYXyvQtyOEk2YaGOGwwsSgsrCScX4KfjpPxfy9zCvDNj?=
 =?us-ascii?Q?5Yyh19koGLBA8xVIC+NTXPa7sz9WuGWw+WqhKSj/xEaK+2pN/NKcp7S1Z7PT?=
 =?us-ascii?Q?YwPtkXl37hiGi8RufHoJJ2mpLUpAsRyhOPEHP1xdEnZkkPcp0cxNBXfDaReJ?=
 =?us-ascii?Q?Tvunby02WeSj9WIqG1XPjQ4chTprIVH+qKup4dY+EqzFBamY3Db0KlxSK066?=
 =?us-ascii?Q?7zJNpR9DBKk6wA4+tEYWquxQgxmij4/sKWxFKfjfBjdvq2Vt/bVoYS2Kx0sj?=
 =?us-ascii?Q?Kk3DaWMv2HW6wgocxJNXkoaHaxhekNNqQBKhDUFFASnyRQJNF7vzyCzZ0jRY?=
 =?us-ascii?Q?25q375UMUKiGS3NLgSBlwplbNFUGr7CMcWvX8igHZPjahVEMI8/1VCyIvDop?=
 =?us-ascii?Q?IXUzctDBdyhWqrd/dKBouuQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3ce0be2-5a69-467f-1ab7-08dadef6de2e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8440.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2022 23:48:29.8480 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rn2zD7JLmLHGHIX6PNYlHZY9k/ITcHEjojNfGRvxpLTMhGQH+8Egmjz2xwHBD2SfPJB3bwbnUGKkb3E+DUurYVeVzZsjVDNWrAWBMWDr2Ybbf+hl/HbrlAFk+Dj/eBLM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7869
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

> You forgot to list the changes you made to my patch:
>  - Refer to audio-graph-port.yaml instead of describing ports and
>   port@[01] subnodes explicitly.

Oops, thank you for pointing it. It was my fault.
One note is that the port@x which it can use is depends on its connection style.
Not only [01]. I will fix it.

> > Sure.  But how can they (still) care, if we cannot reach them?
> > There's no email message from Damien to be found during the past
> > 7 years.
> 
> The most sensible thing seems to be to allow bindings with no maintainer
> TBH.

Hmm.. so I will keep current maintainer, so far.
We can update it later if need ?

BTH Mark, this patch is included in this patch-set, but it can be
stand alone patch if other patch-set were accepted.
Is is possible to post this v2 patch as [1/1] ? or do I need [PATCH v2 11/11] ?

Thank you for your help !!

Best regards
---
Kuninori Morimoto
