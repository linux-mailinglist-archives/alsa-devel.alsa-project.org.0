Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A12527AEC
	for <lists+alsa-devel@lfdr.de>; Mon, 16 May 2022 01:38:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE81D168D;
	Mon, 16 May 2022 01:38:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE81D168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652657933;
	bh=5K9KYIs9CwH/PqjQc2/7/FhRUudbVcxlnlc6FbQ4SGk=;
	h=From:To:Subject:In-Reply-To:References:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HzSpNAOCRKQzwAoyP2kFwzqPlBDhuFqBEUm4x/cdI2zkDEIzQIEeycL1VXMxYrgqZ
	 mQyJ2mCDhhsCt2dJ3mhSUMQTax9oNgQvyum+5hhji9G7+EtuOqMOOJ2VXbiy9yMxkB
	 H36N+ji54jUjwrgXLWYTFjllrugs6bI7DHeWvoRE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D907F801EC;
	Mon, 16 May 2022 01:37:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF434F8016D; Mon, 16 May 2022 01:37:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20707.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::707])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EE38AF8012C
 for <alsa-devel@alsa-project.org>; Mon, 16 May 2022 01:37:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE38AF8012C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="LuQEnra9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bS986XqntsQ1+/RgItzwnBJ8S6KWq12xL9sthhFfp4e3fkSsDT6BvJuKtF25sDBCsI764jNAJHfraNkawGIpYgdBCOPTcw6KGpdhOzYmWr8fco/KnSwmzj3bIlAes5tw9EhIKrUgq0I2RNmCKm6aB3h3D/GR/VsBAQx3eXxft6OEDVyo/ap30xnHRB3pbDLSgPhYxPixhVGUsaunqMafROPmBSZBASsXMxeG2w54txIbI/AsrgHO+ZIXElOwi127TNVAaBGbk1MBxUQJZHv7yL6iA99QQOBvaKTSuCG1RCp7jypgOPFZn6Y9tWKh7HiF4JEP2390JBI5oxQHndLQEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5K9KYIs9CwH/PqjQc2/7/FhRUudbVcxlnlc6FbQ4SGk=;
 b=nzI2PAlZ8369oyUUBOsdUaCmEck4ItCTbt4MLE/XIt+cpwst+kgwfaN+1VEaJmcSM35EICPpIYAWknKUYIyxSGNKahkM3/h+bk/s7TYTHGpsoVBW3HmNWHYYnQAvPIXqGqDHeKsAffghshtcC8i9kgyiReCUBowYSmTTSt8Rl9KZtaQovJOgKyhjQs/JS8ywy4cNlsuOjFw3VK/jWErtQO2XJ5QZ47Tlc2hZhLhVLIAkl12gHBU4LUtNFJQDT8qzgsfIrK75wNiPyWiP9cgYj342pfIvjy6sBBto9qZEwSxdpXZvoi5lOY/F2gtwbnvREDPKL0rK6vdHmY4rm3z/Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5K9KYIs9CwH/PqjQc2/7/FhRUudbVcxlnlc6FbQ4SGk=;
 b=LuQEnra9SErsKbh0BCU+dVcxIYcaWqAFNimBphcntlJjf2kP+fxHiFa+9Tpr2cyvK7I472py1auFBFIYBUuGWmoQmrX3uRz08hF4weSByUSQU7n2psEQsP7wDP83rUkmkT3DpIkZkdg4t8hcUZXZB47ekoG26ZtERJPPNmBS3Gk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYAPR01MB3087.jpnprd01.prod.outlook.com (2603:1096:404:89::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Sun, 15 May
 2022 23:37:37 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::f4d9:ee3d:e07b:171a]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::f4d9:ee3d:e07b:171a%7]) with mapi id 15.20.5250.018; Sun, 15 May 2022
 23:37:37 +0000
Message-ID: <87k0amxt8f.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH 1/3] ASoC: core: Correct spelling fliped -> flipped
In-Reply-To: <20220513090532.1450944-1-ckeepax@opensource.cirrus.com>
References: <20220513090532.1450944-1-ckeepax@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Sun, 15 May 2022 23:37:36 +0000
X-ClientProxiedBy: TY2PR02CA0005.apcprd02.prod.outlook.com
 (2603:1096:404:56::17) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a6a3ef64-6d87-4442-b022-08da36cbe4c4
X-MS-TrafficTypeDiagnostic: TYAPR01MB3087:EE_
X-Microsoft-Antispam-PRVS: <TYAPR01MB3087AA219BF1E1FC7D024915D4CC9@TYAPR01MB3087.jpnprd01.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ykXFbSVtrCx9gU170c2ETIGtXRdFqtrrLOMdJ6xZZjjq4eSBi+ZWv2ZIpOGBOy14/IYgTS+rnTn6PldFJ10oS/uFl5RuhJ6IHSq58ITc1gl4u8C5EpgiFoLnTayTiGrVTg7e7xAMbA8a19rk6DcW4c+6vTR6WsvwdejjSu9YEiLvu8L2QFzqYJkf3yz1b7LTKT0zmNgJKL6FJnJxRbkAkEwyrdEj/J2KPCVhKdeajTPgCm5T1fkttkXzxG7Tya8KZFj2elZflY4qr1bi3IGnyyz/eZjnZR5VBMp4OrUrim3Mo4SdwYF7RkdTVRnXZr1rrIf36eeuT3/FUxhhpSsmniT9IpNXxgHQoifLRf3U+hyJB76q3FJnpvourE+JSl1x3fZMOvt8lpQ/iQ0GASDLvxDHpkvtwmLjye6n2TgUA2N43e8B5guClz20CciE3jK/E+YJ+odYsDczFR+LodJC4eCsoLIv2b7u8jQMTlDoW8CcCFqdcP2UumF4ecB3o6mDVauw1F91j+xZTlw7CmAebbbwwDKvf9DbQSIj4uN2YRpKjAiPvBeT+TfZzCD5Rr4YLUDTYjz2I5BSFcSrbvgPWOsOdjYnr0M/mRX1/PprZobwUy+vUSw6XEXMaGX3BA4QuBIMfByzrhY68P7xLsJyqJ+0cpaHSFx8EukdATUczp6XleqrjeGxRfxHjxewQPXZsEr8N55P1xgWlfCplwi4ZtOfhq+sFoVEwQ2wB2bpUl6YOYTk9Sc4wKEIqyqpbQ9L
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66556008)(26005)(8676002)(86362001)(4326008)(66476007)(66946007)(52116002)(8936002)(508600001)(5660300002)(38350700002)(6506007)(38100700002)(6486002)(558084003)(2906002)(6916009)(6512007)(316002)(2616005)(83380400001)(36756003)(54906003)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?d5lH6usA9nCRa2GgWE/bNEHBRdOhgcSHqUAAYZ49zv8LvBuIDJ8Q6BVvDGxV?=
 =?us-ascii?Q?VdNyFnI2YyGCxbvHycfHIg9M3v8FtLhp2eS/hTETxpFFtNCUEFItPW1hJxpl?=
 =?us-ascii?Q?6dymsvRq9Qwzct/56kLtx8H3d+Yo6Ijf+qVlLm0FR+NaHDzSrL8pLvCziaWX?=
 =?us-ascii?Q?cGQZN3LDIYmXuLJYZJRex9Wb2fNeNjIq96oEhWZT/8EwxOB5k7wLvU+doEOx?=
 =?us-ascii?Q?rs3gxLuKmX+SphmDRgicezmpv3Vf6ujMHUxDsHAwyUrCwtgngg+3AcjKUovE?=
 =?us-ascii?Q?RZSGIwZCorPv7KrfWltAb4xSkKqid1KRx3qlIZ2D02JG4iXiw7BhSpeokvZE?=
 =?us-ascii?Q?TttJQD3c6SgMXlEeaaNnu53aWzFtiMQsGdx771ApljsND+yeoAVYZjpocWmR?=
 =?us-ascii?Q?qomru/DubH4Jc9LadJuAbnad4wXXYZsseVCRmJSLK65wBAYVMgtgoncC87zU?=
 =?us-ascii?Q?PSOV6/mjrfOtdoTBuog6V4un3gYSIS3GOn2bAZ/jNZb7S6RTl694S0tubQ8e?=
 =?us-ascii?Q?i8gDIjDmIbaiRWsnNEMSzi6DBh4YEvbR6Vb/Bh/nDnBt5OSOQ0Deu02l2Sdx?=
 =?us-ascii?Q?VSdyEQ1SXwC1kSNoDJRASeHe6UTt23lXCea0ho58FZA29nTkDLvQEzXGydKT?=
 =?us-ascii?Q?KVJbRXscyIGgjEoYP/hycAWn3ROlzBUA9GyOXTbTyk0xv14hJwiougi93YCK?=
 =?us-ascii?Q?UEFFG5GaeYTYqgiLc93AFb3q4a6mLu/TZYQsffhadIxsMgLUSrN1wu4T65tn?=
 =?us-ascii?Q?VzTdhP8zCtvr3ot5qp/z1+DFfUGn9YcmUuCC6vNe8RnQ45oziZm11B5KZI/m?=
 =?us-ascii?Q?TLfwvqFvVGz+ZL1EtE8K07Aa5nBe/oPCM6l24wWy+2+kkeLPwtxfrEb5An8p?=
 =?us-ascii?Q?z7EI8oL2vOhtGKSgf58onqS/aDT6bQohnZs0zgX7/wVcUamQgqh5E32aiQ6r?=
 =?us-ascii?Q?kC0qwb3kWC5Nf7ZomWR3QdXLHUYvZw41pEPTyIlDP63t/DFQxOocrKnL77fe?=
 =?us-ascii?Q?H1p7ElU2SszAto/L2LEzvwF4yMiS73UVtpRn3OC5EwBVM8xdPYi7Vtogbixr?=
 =?us-ascii?Q?deF7YrZlfa32ddfua/bc554aImP4tt9sZhW96q0quCHq3iqUMHjKhprfginh?=
 =?us-ascii?Q?KvpX2RxGHvXFD8Ys7RT6zt0yhG0eD1Xu7pic9q9CA49VHMntVecbDMDzJad3?=
 =?us-ascii?Q?Y364HlZWhnsVHefnT+TZKVfRbFXikEX5wIkCZblDQ3pgPmI8L2j/khNzNPyx?=
 =?us-ascii?Q?25ZEx882LWjh8zZqP19j0lQoMr5TreJgaadbpmf5gEZp398a+Hny+DljdTR1?=
 =?us-ascii?Q?Hwqbtlnr17vSAM7OtSdtnTEEZJuz6sCgsHbhpLlcQIn9fM5uJ5iOIOm/UTqj?=
 =?us-ascii?Q?zVA9I3ckdYZzbLM+8BO2aTT0YrO6hG0zDjy/20ekWT/BTZ7GAm1LeR9mlpev?=
 =?us-ascii?Q?tG9qp2Lq+6uI+fQk2DuhqaHp7lFd8lY+6hsHgNSXi6cJWIOdnpOX/UJ8MHyz?=
 =?us-ascii?Q?WaHiZNBKizGsSismluQoLtyeLBydd1YV29ytSH+esSZrsRcKiH4Lil78W79Z?=
 =?us-ascii?Q?1f8p+23mDBZ/C103y9zN7/RA8whg0kTdzMQOcschVWoMdLxi1YTcdOM042gB?=
 =?us-ascii?Q?dpME3sc7+BzJaMm5l+Gl85tCYrd6lXweZdOAF9iNDjGeOjo2mARJuR9vY9UD?=
 =?us-ascii?Q?jqx/g+cj3ey19bcxP+qKvqPVaP3iYpl1OzqFWTPn2y0ejt4tfCbeDjNFU3YL?=
 =?us-ascii?Q?iJKB3JUYYMINZ7sHHXUXSMHbNjDyZPdjBDXH9qL/8kUps7zz12Hs?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6a3ef64-6d87-4442-b022-08da36cbe4c4
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2022 23:37:37.1952 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VC7+IGS0yD9kvNFa0H8Wy0DPH7bAPMeL3tlgA0m/dkdHJZzYUcQQDhBM4jxWC69azhAm07panexwJeP2jE7ORtUZiAXlUsZyar2O0MT77W72wJ9y4pKSvRMO5SokFxHT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB3087
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 broonie@kernel.org, lgirdwood@gmail.com
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


Hi

> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Oh, yes, indeed.

Fixes: b44a67f893665973646 ("ASoC: soc-core: add snd_soc_daifmt_clock_provider_fliped()")
Reviewed-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thank you for your help !!

Best regards
---
Kuninori Morimoto
