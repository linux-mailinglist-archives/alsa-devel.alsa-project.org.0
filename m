Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB99867AA61
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Jan 2023 07:36:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D70D3E7A;
	Wed, 25 Jan 2023 07:36:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D70D3E7A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674628617;
	bh=hP9VrglJ01TFEQ9nMBpkiiEiTPhaB3wue2jeuJFC1C0=;
	h=From:To:Subject:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=T/L3muFWlJxwnwIjrD0qD9F24llCU/FdV0YeKI5/filhh8dEkDldQItQeZcayzTcU
	 ZckXJEItAoUybm7srAfU7z08AMdePMPeICnruN76lXKXrbKLHKMC+oM0T7BibOGTFc
	 y1RLJ1CeHMWH0zw3nbwKg+rq6o2H/aogPgmnrWG0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16DDFF804A9;
	Wed, 25 Jan 2023 07:36:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BD4AFF80424; Wed, 25 Jan 2023 07:35:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2110.outbound.protection.outlook.com [40.107.255.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C2CCAF800AE
 for <alsa-devel@alsa-project.org>; Wed, 25 Jan 2023 07:35:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2CCAF800AE
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=HqASNQDy
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d87hvNULL6vqDMJaDfswvA7Ts1nM/eOJhxw7uSsi9QaUDULJ7t/qRI8hO4hEFckH1pOXTbo0jzGUXpSf6LEXDbRSv3JE7faRCSGITs8lU2WdWD6l9+VURQ2su3HaNKGMK9/qafjdtSXmEYiQR2Cky9W2fYV98h7ipcAuKA9HvJvnMV8jVO+SzMi3fw2RaqKJxeAjxbw53xqQwBwA9UA3wsGIUnFbX8rMmf5WTMfnmVULt+qivLH/wsxCeSdaIt0Fk8KpCKxcM2Nv6Pqii/5z0Rly3RShsCuc0nJWm8wcKHRmGBNEv+EgAlr9Iquac+Mf3XNz1EA0Bcj7Bu4zW0w7Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hXbGweRExYFk/jhoAy0MHC7J9JMjw+ly4OiYoXMN0VE=;
 b=duysYEmZ8ZKDATLdyWPp8k62eiMDlM8eug9mmkMY9+Cr/2nKNbZ/oqf0ih3VIWiQyURGgAJeu8HXvPPHCrfWMmhGBEWKj2byChsQFXiJsNBmOJHXUOh9nDOLmpKOQ41sG36dEq/uLXkbJOhhp3zjnYwV9KwiegbSorqT2BinWc/3g5HeITKvOkEnic89vO0XkyoiFXb0esLdhPnORmoTL35uKUXgkhl9XDsPyzL4L545P9LIP2Q4aWtgddpZTn5jRnakLv3Wqf5Y4jE6Bm2YouWZDakIDEHJNoIabk/8Deo6oHUjwF9pBBXocldNZhq6XcTHlknmi5Yjy6qnJixkDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hXbGweRExYFk/jhoAy0MHC7J9JMjw+ly4OiYoXMN0VE=;
 b=HqASNQDyNVwKpCIXT5KkKQKvIdNtMyVWI2stoJkIkEd0b5MIL/349a3LPFPSdett1l15CpxTs4j4G3phPuVju7XMily994jK1x8ek3CkuMa1nh7AkH2iH4m1NhdupgN9eQeVGCWbJf8SttxxGAAmTTFKCzBuMGDEXXbaE0hkwbw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY3PR01MB9729.jpnprd01.prod.outlook.com (2603:1096:400:22c::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.17; Wed, 25 Jan
 2023 06:35:38 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860%4]) with mapi id 15.20.6043.017; Wed, 25 Jan 2023
 06:35:38 +0000
Message-ID: <874jsff7eu.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: soc-compress.c: fixup private_data on
 snd_soc_new_compress()
In-Reply-To: <871qnkvo1s.wl-kuninori.morimoto.gx@renesas.com>
References: <871qnkvo1s.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 25 Jan 2023 06:35:38 +0000
X-ClientProxiedBy: TYCP286CA0163.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::10) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TY3PR01MB9729:EE_
X-MS-Office365-Filtering-Correlation-Id: cb38f9bc-34ef-4237-ed8b-08dafe9e5f29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fLp562LnphReXMHyk5rOeAx9nZes986jPI97V6AfHz+IziYaEEyRpylAN7LMiyr1FNQIOGrrujl+ZDV1qVvM/KcE5Po8izivSjXTHS5Nkxh3VuoBCZmvWn23pbZoKPRG/Ne8NPUYuT5Jj3prwTDjwCegckz/KweIZX2hbLSHWsEPd/H+Xz03WsGOqPZ7sDifhznQyP+W0e4b6Jnph+qP8YB7KxGr+t2jB0XCrwPUuor0OS3eyx/Q94jv0Yj5E1qNQQGdY+i7dSfxTBG3G+gT/8CSdbnDMA3j6zk6GuWLR/PtEdXJbWx0JfXjNFMXHRBTMz7WmhUpUXBlw5HVnKcLwseBBYNfxjnJuUE0v//7tWNK3Px1o8eY+xDx9T1nGm6Fz7PdCQ+o3jVl8ffzQi32UIamgJFSHMEfTofMRRCqG9KkJXx9jmVSUGZfXlpWgrp0Azz2fJwvGp2swW3jIl+SGQavrR8BfZbiEH6DRoEq/7cFCcfHy4GFNX9g3LPJKH/ptTr4bMol+f46eN0G7xaCKXnJz3i+pL+6UF7vFVQcvpMNyYaqQ0tfR4PZgn5RblwzNvl76z3p6Vhx16Ny/gsWRHN24+tuF7G5YGelAG/jKurZw0Qsl4grpHdCGRc+4OmMXjXhWWsNwIcEtk7+9UGYrZS9BBE50Iy4v8515WSRheuk33kWfJi7n5CVKI/mgaQwYOT67xXKP1awOn+GdT/l+eFXaveq+b+C1xy9MaMlnUg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(39860400002)(366004)(136003)(396003)(346002)(451199018)(4744005)(6486002)(478600001)(5660300002)(2906002)(26005)(186003)(966005)(6512007)(52116002)(36756003)(8936002)(54906003)(66556008)(66476007)(66946007)(8676002)(4326008)(6916009)(316002)(6506007)(2616005)(41300700001)(38100700002)(86362001)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3guXEjSB5Jb90GhjUQ7BB52Om+AtdfH6edtve7Np8Zf2ScvkAs+ljDWMWyEk?=
 =?us-ascii?Q?IHo+cbQAlcfCYrBYl4FazsrtBHj+GmkR/V62lhVBHDRUNYbjJsUSv7WaTrwS?=
 =?us-ascii?Q?r7213/YRujEtydc5sA9w0ajqOovh5zPidx25r0hmdjOoWrFjHBvJG/2WJ2V3?=
 =?us-ascii?Q?xm3EsA4oT67++HXZWBQv/v7mEegHUmePMrh7maExBvYG9G593EPOUhEtLfAP?=
 =?us-ascii?Q?3sVSkBQr0mxa6CUvFdi6e5FksO7+AJCHI6xpTUTsDsh2CxkmAwtyZheVp0kP?=
 =?us-ascii?Q?FBTHOAZrbTYoUE/UHtRqABa6UP4lhZ+6pX5s9wOLbgCr4bIZUIqJCc0+fFv+?=
 =?us-ascii?Q?3uNQPNgaFh1whc9EGaJ4hg7nos3S3X2i0mVr0Eu7Cc4E3olWCpwZ+qjMmJJ6?=
 =?us-ascii?Q?AYLUfAMxsbPtTd5Hx5VId3U8v8ViRxqRUCgI8RAX08FgURC3QoxUv8P3UJ9F?=
 =?us-ascii?Q?WdGf4PxiZVHgWnxGDvikrkmFFktb4mXtg7Jl1xlrHh5j6Y/tzSw23QCSB6tC?=
 =?us-ascii?Q?OkFpG8upUcgc64ffI5mZNZlYkgpIVhCfZS+smh9RqNVntWEpXHiWxum10+a3?=
 =?us-ascii?Q?d18kA5YEcEaELE3T3ssjhghFyGB0oJi1M6h8dmiIE3ykiRPuYJYeYYMxpORB?=
 =?us-ascii?Q?4DhXABHqDPWeL8oOc/Z2X2OGFtmYCh6YLPnEtFz38M4q0Mdzpk3kt07+gs1s?=
 =?us-ascii?Q?CUDgnrL7yK3MGqdN5V6NPVSt5UipZ27SlfLNry2owrtiGOY7ZWU/jzdYRjml?=
 =?us-ascii?Q?vB5fqN2qb0VRo2TmDpZi8ytugmk9M2kL9imAEskay2bPjxOZbvMvlpxnydga?=
 =?us-ascii?Q?C2QDKFtaVv9OarQafMYUHnYqvPLp2Vr8xVFV7kH6SMg+KJD9UvM4tq+nlHx+?=
 =?us-ascii?Q?dQIPOBKsu37mNOgSdE49lIbMwvbN/7wnNQCTJF5bfZTuc7Toljm+f4ZsAxk7?=
 =?us-ascii?Q?f4pX86bJN9ag6NxEcm8C/ghl76VeW6Qu1El+G132zTvPa2OLOjZqFxxep+oI?=
 =?us-ascii?Q?3dOKZ301CKPuukc6GM4Yt3+bD/xcmKW2c3Na5Xa3suFoAh2xJGaXWxGRkg7K?=
 =?us-ascii?Q?x1fL85MXM/Gii8P9XsEZofsk2w4njQzsVsuPoyISKtU1IKXCPJU5i7nR6gAo?=
 =?us-ascii?Q?G0DslQxNl6sveCXLw65Qyd4NUZ9HS4rRFcjXmlNm3biC2BQlTSTwW4l6BYaX?=
 =?us-ascii?Q?g8GtpbRx7oVzFE6Yw1SEHhjXdVioee890IDuu2NirbB1HPrWW/YZw1efI4gi?=
 =?us-ascii?Q?S/KM/otvo9P/5DN9jkBbwMbLhTkEW7q+fYPWUHxcXbXIWH8SJ2Z1gNWBeLqw?=
 =?us-ascii?Q?M6Vpm3RFF7t1qzyxWBaq6+IzuaPX9TG0XnxkUQZaM+ifojqzQ8CqfsVb9dOC?=
 =?us-ascii?Q?qfhefYPRsQvDWobiFcEmxPVlE8vlxtUqCOqu3k5ydixs7VjeiFluzFO5ZRyW?=
 =?us-ascii?Q?9u+rq3j4YXEsoUQMc4uxIpxuJE0e8fyLtxOICpZ9W2q6+vkw8NZaY2xviUtJ?=
 =?us-ascii?Q?c9B4oohnKiqTXxV64+kbZ4NuoBFhBtRc8G56GIbdveqZc7Buhb+GNtU2Ez/x?=
 =?us-ascii?Q?Llsy/X3wWKZkxh9P8OLTjgoDiIvxeIqtJc1EO5KODDXIavQoskHjzcZizY1A?=
 =?us-ascii?Q?lslcnkZFFF6knNLSfkW7Uxg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb38f9bc-34ef-4237-ed8b-08dafe9e5f29
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 06:35:38.3404 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LbUcdhPwRtQdwyyNs/oUVitqWDsZmRuGpH3lCGncFsXADy3E+/F2ftSALc6cUxlEv9s9+XgLEJ1nSBdQSqEGQkYB0LiBPHQDiStL45HOfcH3lsQ4N9gbPjt1WxvOCZkJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9729
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
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


Hi

> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> commit d3268a40d4b19f ("ASoC: soc-compress.c: fix NULL dereference")
> enables DPCM capture, but it should independent from playback.
> This patch fixup it.
> 
> Fixes: d3268a40d4b1 ("ASoC: soc-compress.c: fix NULL dereference")
> Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---

Please add this if possible

Link: https://lore.kernel.org/r/87tu0i6j7j.wl-kuninori.morimoto.gx@renesas.com


Thank you for your help !!

Best regards
---
Kuninori Morimoto
