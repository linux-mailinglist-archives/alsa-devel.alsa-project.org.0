Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69531539D15
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Jun 2022 08:14:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F2ADE18BF;
	Wed,  1 Jun 2022 08:13:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F2ADE18BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654064068;
	bh=JyTJFzfFwmFaPsuM9oaxu+QoxreMknNeyaEg9T2UEbE=;
	h=From:To:Subject:In-Reply-To:References:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hRn1dLaY7CRjZgHX7hciO4Ve4prWpcQilV+qeEnFMnlwKVEAd0p/PBaKU0+/yaBXO
	 VcfogkIKaABQCx409yNDw65lwnOOjtD9vX08B1Gv6oidq5Cz7ji2UDqY6PRu5i7iY1
	 CT97xZGGNUAb7Kir9dt1kxckMRDvl/vaBAGmDkLs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6DEC4F8025A;
	Wed,  1 Jun 2022 08:13:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9EB62F80238; Wed,  1 Jun 2022 08:13:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20728.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::728])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 16B0BF80149
 for <alsa-devel@alsa-project.org>; Wed,  1 Jun 2022 08:13:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16B0BF80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="gaA9noxG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bul2lkgIKvnrVyk+b/uobwU5/prucZaZ6aWzgeGDYNQMLAkCOyXdo1pLbMR1pQPVOoUFloBs9tV+6PI6dlRY4MifqXsuzact4aERxKLjSQk0696fCgFEGVwWXkRJe3SKfQhQNuieYcPEdlZ8N6dAIO+XnIKEzxeOWI0gPQ99hdckpz+z4HsoPJbVy/w6KxqT3+4XuJ0eio8CLLqHT96UGqyz17Fwmkz8Vp9GxG1codUdbgHJRMaMqBZa0Ba+pEpmbh1WcTUegZeGmtkh/HbFoH1n2AzG4SRdeHdM1R+8oqwPGi8bJMd7jBwdIn9jHBS29FQddde4Bsu7RtY856nyWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3v6ze10Ks/R97kGZzPRCnTXKoaMxUn9GxufPU0oS3po=;
 b=R20aHcrszIfFKDBruZjT1O/qzg4MrqNo70DQWQBEo+pbVctq7qGLl/7jtyfFbfrLPRvgt/2gHXM+tbUZpCzZlHDbTZa7QnQKTOin+2XC1zA6TH/SwfztqqC/mNG+4Fmp8CSPYLGOLfm2jYC0A2ZdweCCgEJ+FgtVeDQLNJ4z2sWCucg/SLQKEIRCscfjStevpwPo7fPc9hLMRMkqRLNRSmOYQjVhb3zA8Kje11iuE0iA/OChUc1/0N110/sKQn5m0aXsEFmNQtidzfgusb6fDYiDIhwHVqabvZyQ7mmtjIoOo2WXdyW7/xCMTss1cnSd9Ale4B0757FNis70niPAjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3v6ze10Ks/R97kGZzPRCnTXKoaMxUn9GxufPU0oS3po=;
 b=gaA9noxGXMy5qexiTWmI1zm7rUtwzATjU+dhiZr1rl/IlbdD3pw3jlsh8ZuejsZ02OQuZ2Tu2KsjXo48Mg4c9FMtioJVfKcD8P9fxlRxYespgXRYEU215qaHMHGgtyGjHGa46s3XlriC/KuL/UWt276LOLKNvttvpX1eEljxk+A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYAPR01MB2286.jpnprd01.prod.outlook.com (2603:1096:404:5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12; Wed, 1 Jun
 2022 06:13:15 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::f4d9:ee3d:e07b:171a]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::f4d9:ee3d:e07b:171a%9]) with mapi id 15.20.5314.012; Wed, 1 Jun 2022
 06:13:15 +0000
Message-ID: <87wne06hdw.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: About Cleanup ASoC
In-Reply-To: <YpYJSy4h8mvPSnGh@sirena.org.uk>
References: <db3b90d3-d356-9a2a-7411-ccf487b25416@linux.intel.com>
 <a5e3c40c-ea84-c2c4-54f9-70b4c509567e@intel.com>
 <87a6b6cofh.wl-kuninori.morimoto.gx@renesas.com>
 <349ddb89-6f1e-f087-2399-795cf82b92b3@linux.intel.com>
 <87ilptqbvx.wl-kuninori.morimoto.gx@renesas.com>
 <021e4cc3-f67e-865f-0d8b-5b07fce97623@linux.intel.com>
 <2f60063a-4c99-89f4-4e14-938bb9383844@linux.intel.com>
 <498833ad-dd6a-8952-d569-d1ed726f4eed@intel.com>
 <3861ca9a-6444-6f23-f447-64cd610b4d34@linux.intel.com>
 <87a6b3a2px.wl-kuninori.morimoto.gx@renesas.com>
 <YpYJSy4h8mvPSnGh@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 1 Jun 2022 06:13:15 +0000
X-ClientProxiedBy: TYCPR01CA0079.jpnprd01.prod.outlook.com
 (2603:1096:405:3::19) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e2d9667f-08a9-4bdd-115b-08da4395d0b7
X-MS-TrafficTypeDiagnostic: TYAPR01MB2286:EE_
X-Microsoft-Antispam-PRVS: <TYAPR01MB22866D09C91E1CC4CFA2EF28D4DF9@TYAPR01MB2286.jpnprd01.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +QhzcyzbhlFQk28r4PeSxhjH4yfTLfcCUnzxQtFhpaHTGhx9OEvfIS2cCASEfQh3dC7sLRCj/+REY+PcgqfTvOyi/8G8K9iwOrpkHOzl1lKTy8UgLk902Sx0u64QhlBgh7ZSRSSW/HYiBAPjCLDiUExij4bXhVU5S25HvCFhwdLXO6Hg+3IZzx6z29yPuRtEBTUbFipwBhKMNOh6iQZe0FT+qoK0Siq8MCqCTO0PJ+m1Vrn0K8ef/MEkq1e6yJvB7kw+z03lplhf1x21pfaxKOoQkrotplGTx77RJLNzOypZbMc43nqFekid3+06LJ9Ea2cG8bej5LcplyqJJYm5nJTaSszsvzHOwDJwohiGwkd3b9AoRPpy7MgbJfCd11ntFzQp+ntEBbu9yB91FSVpHnM/94evypEMNMZxSJrVcGAyVs4A1mQ8WL+z3OOppz055vBxZOPRgt8OFUUAgUS2Ws1/7aw8GeGgQjChtJo0rU6/qwTiXS9dZ9Guz4i3uQvv20iX7m2HBJfxsBtscfvRyTIXZRUJ7xtzBMFwTgN/PedQgbSRPW9Uwe81az52WfoTdus6DGgm254VX6NVOABjOWli1DULfxXnX926JiUjJI7MdAG7nZRJK7n+YW2//4T3UJgWH9//ZT/jp9rAhKOGV/YwbrOrBQ9mrH1eG/Fsqb3d3Na2aUIJPrznZ2inHJMkBec5/Mn6GKkBwDpJPEvYnw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(186003)(26005)(86362001)(52116002)(6512007)(2616005)(6506007)(83380400001)(3480700007)(38350700002)(38100700002)(2906002)(36756003)(316002)(508600001)(5660300002)(6486002)(8936002)(66556008)(66946007)(4326008)(7116003)(8676002)(66476007)(6916009)(54906003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CXkYyMSJI77b9+EW7qDjyc+jie546Ygobksnr+2ZvEv0QRV+LxiwYMo2+GNS?=
 =?us-ascii?Q?8oAdlQOMDmu5Nlo6nWihe43u7vPGMOIBvb3jlbO5LD64DlWZ+CSJskMk+GcA?=
 =?us-ascii?Q?k/ykJm8qGfG3Qa2xbCk22EDR9vdBbAKsU0zyAhqYIyemSUMCmL4XmxhoWAom?=
 =?us-ascii?Q?G8RH01wq+bu17SSw6fd8UUNDm2rzqByLwKGGtD1eoPJUxNrOv67R8pVE2OCQ?=
 =?us-ascii?Q?Z+1jg2iLq2UHbc4OtAf6BaddkwSLelO3FRN+cKLoT4Be5jXyQ8lVA/ryqaR4?=
 =?us-ascii?Q?YjpuNcMUFC4ucPllJOLVSDsFRHElNL5ualzTEqGwdEjzis54zTlj4RNPk5VI?=
 =?us-ascii?Q?B+B2Z8q2Qh+EYXOUrMsh44GwCCGjrzi3XDnRHv9JFZSTovf0uvhRkGX90Bt2?=
 =?us-ascii?Q?BYHqEVUMSCd4oHi4/9pupSoNaRlLOVM+Axs7Y8clI7ke1sRnSmLXAuwkY3RE?=
 =?us-ascii?Q?A1mp/q88zMFr57aYvgK39RE5jOS/2wpjoS3aOaLSLNmg1xKGSKEHOBSXMmJK?=
 =?us-ascii?Q?emJYJNM4JItK1sUp813iHtQTpWEKtlQgIOc9MJwDP8s3Yy4INcN6kVA2e8ES?=
 =?us-ascii?Q?+yQDFVc4WXkGLvUY/QkmlVfxHmJA8TlaOGOsQQQDNJE+7+M0dZX+ev9oUEIS?=
 =?us-ascii?Q?0e0MVECq5ewvOehEXAfAEz1yJy1BnnRfm3DAOXn7iYGv4cSnlk78azakG3Gx?=
 =?us-ascii?Q?hxi+4bDUE5519BMJgZrc1Rlt4BS8/Gs8O1pvx/YfCHe7hTCCs9GktXely3lk?=
 =?us-ascii?Q?TqE6BTKBiAt+cfgiURH4syZYQsx9x8dEPklytUZMpHiN4rBXaOoDO82zcskU?=
 =?us-ascii?Q?uv2eLhiCJt1nq4AJFXIuDyjFrzvlGeYz2GdyMaKDPRhCxFTUOPpHhcmsBsdD?=
 =?us-ascii?Q?EUxcMdfI4ynPdt0GXGXbTZ5/3iqv1mgVhtgB5ozIivTydg5R1xV+NfawlvzB?=
 =?us-ascii?Q?1IKo/acSjfzoP01xYCimHpcAxWL+8ML0fKIqN95e8oHDR/Rbwmor0JM719St?=
 =?us-ascii?Q?DG5w/RsAHylXXfXJk4el5p6W25Fc7GoFz3VdzoSd7U9VKe7roa7Ch1MyKH3A?=
 =?us-ascii?Q?bmM0O8mSIfK7vO7omNecBCGpgYvaoMi7dH+6IBFOBsZqgrLrJL3HMRwz8lf3?=
 =?us-ascii?Q?ZOHEPyjuCZXFc+tcRzMTMdZlkzw/OSK2oSBpIOOieDztMuYftf/atgo0ogHP?=
 =?us-ascii?Q?kXM0rWcCKFkV3RfTGCozvcdhkgzWr7AOYXf6SHJ2AUOjERRFkcbqYDN11mpl?=
 =?us-ascii?Q?GaMLuagsh6juzusYfEWDnZiXwFMjbmIdDp8j5tfe7bdQQyHc+dsPzBSbRSHv?=
 =?us-ascii?Q?WrhWn2GXSDGFSzma7mnzhePtV/1MYWm1YuRBIg7Sjm8LlScbfipdE0/c87Hw?=
 =?us-ascii?Q?S5rRIh+/2ym9+xs/H4QsdQHdVdBPwhrnHF+sLQwkH1z+sLuBRa9iaIULJ3O8?=
 =?us-ascii?Q?q5LOE3oyTmr1Yntbyrk3J61nlrAJ3IObJufuyoWmZ6cBkB6AMlLGcAcIjz7B?=
 =?us-ascii?Q?w+PYfZ3vYjz2qDx5I6rBBAEIM/UoG9TX5tv4kgb9DhNrNYe5m2bsSjOThRFz?=
 =?us-ascii?Q?z8dnWckHpiI8nI8ixopXpVmvggoGC0PwkeoTFiKd13+TUY6DX++J0Ypz7A0d?=
 =?us-ascii?Q?n/9EkWH1UeUZM+ueuogvAmIUte8MtX6Pb/W9/rkpRv5ci3e/uJmTKxPIef7v?=
 =?us-ascii?Q?BO9V0VteQmaVUD3RPjAAb4kfAuUkJYjz+kThnox/cR083ScfKTzgG97D2UYf?=
 =?us-ascii?Q?E3pwjSCtu2oCtKGIvfYdYEuhMwnzlnQHwmolbGUxV2X6jDgsTeZN?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2d9667f-08a9-4bdd-115b-08da4395d0b7
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2022 06:13:15.8599 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f28vlIuaGDJxkWThOAv9hvieDcOotfZ19WOefnjptSRUWLTnQ7VAxyguOBmJJ45oZLor0nHkSLGNBIQP9tP8KKESI8c5N40xSv0+jPOdDDQYpz04vXh4W31OOjJ97AN4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB2286
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Amadeusz =?ISO-8859-2?Q?S=B3awi=F1ski?= <amadeuszx.slawinski@linux.intel.com>
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


Hi Mark

> > If [DeviceA] doesn't need complex DAPM/clocks control,
> > my indicated style can be one of the solution for it (?).
> > But in such case, *general* DAPM/clock solution is difficult.
> > One note is we can still use AVS style on this style.
> 
> It can definitely work for some simpler cases, but working out
> which cases and making sure that for example things don't break
> if someone improves the driver for a piece of hardware gets fun -
> things might not be linked up with current code, but the hardware
> might actually have more features that cause some cross
> connection.

Yes, I agree about this.
No one want to dive into the mess :)
If I work for it, loosen little-by-little, step-by-step, and deep test
is my style, not a one big change patch ;)

> On the one hand there does seem to be some demand for it, on the
> other hand I do worry that it will end up eventually just running
> into things that mean we're effectively pulling everything back
> together into a single card again, even if what's exposed to
> userspace looks like multiple cards somehow.

Hmm... I have no idea about this.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
