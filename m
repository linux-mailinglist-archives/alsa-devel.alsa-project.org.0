Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B64795A882
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2024 01:51:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC2BD823;
	Thu, 22 Aug 2024 01:51:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC2BD823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724284305;
	bh=Rjk7fV26ws25zgHTcuYZNWqKhcjk3D9WT92Hv9SNYOg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Rkgloj98q7XRR0lAoMIuY+kCxFxzdXR8Fovn1LufZNw+v94nFs5YMnspJBpwMU3fA
	 B9hyRiYWRZlBghija7BiQ2+DU/9Tg6i33yZDeH2XUMx4qNf4R2EotDeDvi9bU5K38K
	 8giJfRB+MJi+pM0GNDZ7xJ6ImqNMKXct97a5If50=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 12F54F80588; Thu, 22 Aug 2024 01:51:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FCAFF805AF;
	Thu, 22 Aug 2024 01:51:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A001EF80496; Thu, 22 Aug 2024 01:51:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazlp170110002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0D469F8025E
	for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2024 01:51:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D469F8025E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=WeyiP7Rf
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DXXMXTkTd+PPAT/q/Nw/oyYBnxh4nr+hEB5lv0lgRuv/Fjd0Rbe5M8IrEGW10dliD82ngKRtfzkYSfxSujVOEWtE0Fhxaz0StJscPBt/a4jjLuNiE1Wa+ZDbdIJ1zuYWmfgWRigEiNMCmp+CkBKxKFrvq8OmBYP7SR03K5b0fHES7aBon6Cq6RDvvWh9T0HaM/J2C2UVdugwyqCtwBS1da9rdQy5x0crAWWwp/tW0DX+XdsqzAVHTjfm1Ye1mjg0EqDc1N5dBiEuq+PowAb3PTISeAgqwABoWkKQWrZaphdGOEDXJLSZupG+w6U/aYv2vEatfS6r2oQwJSGQzb3P8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rjk7fV26ws25zgHTcuYZNWqKhcjk3D9WT92Hv9SNYOg=;
 b=kea1AZRngCsodhdu9bBxRieeK3k9hFQ25d7EowjwA+yKTWPWBP4tQSwdRWc443v/68zzPqPvM8S4JE0UzSAx+VGhTV5nU3HCpyzjZQyKo26eT6Hyp+UNAyMw5egWi/hC49UFvSgxNc5qRL79N3vE6HDJfAYAO5VhCRelcy4N8reXt9ziiGSCWLsKv6ec6Mt6fOfjYuKYorBoyUyyGWfKO76UXiRjOaoJX7nOpoSaMJ0kGopTwqlNPWxRGYnqLpjr3Ba0bmFhC3YhNKMmXkW4VcYCw6t2NZTMtJDubn1tEOPFCLYSpjQbFQFKm7Yw7ddhxlEUPCT2+23CXsvtZBq9xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rjk7fV26ws25zgHTcuYZNWqKhcjk3D9WT92Hv9SNYOg=;
 b=WeyiP7RfMrz5Q9gswDbpmq+N3nOjb1x8aSB22YIOxfr55pfyYB0DA14di/HQ1WMz/5h6X08SKv6aQaqbPtjh/rFjpkif+9uWqpbKAn/ERawoJ7jnQpWeCcnjbWwwS/7eGHn4gNtWd0fLkLWeOxbysAbqnR+pD4ebnWx+1284PE4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS0PR01MB6049.jpnprd01.prod.outlook.com
 (2603:1096:604:b7::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Wed, 21 Aug
 2024 23:50:56 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7875.016; Wed, 21 Aug 2024
 23:50:56 +0000
Message-ID: <87ttfdjuzj.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [PATCH v2 2/2] ASoC: soc-pcm: makes snd_soc_dpcm_can_be_xxx()
 local function
In-Reply-To: <a25ef02b-89ab-4f47-8174-b0bd67031955@sirena.org.uk>
References: <87le0qa9tc.wl-kuninori.morimoto.gx@renesas.com>
	<87ikvua9sf.wl-kuninori.morimoto.gx@renesas.com>
	<110f01db-f5e2-46ff-a3cf-90e1b00d289a@sirena.org.uk>
	<87v7ztjw9f.wl-kuninori.morimoto.gx@renesas.com>
	<a25ef02b-89ab-4f47-8174-b0bd67031955@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 21 Aug 2024 23:50:56 +0000
X-ClientProxiedBy: TYCPR01CA0199.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS0PR01MB6049:EE_
X-MS-Office365-Filtering-Correlation-Id: 478d38c2-5dc0-4ea6-3290-08dcc23c19c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?GncO42qRB9iEZ2WDGPwTOWho7Oo9QN9rmpzjQN9KfJxVJgkqvSQ8tIdkK1D3?=
 =?us-ascii?Q?vLFXxX148XZV/piKnu0IQr0lpbJTUS6HKkssv73W/FA0Fu4fj4rxdKNq0aJn?=
 =?us-ascii?Q?TdZVGpBj9KNG7mWB6590DlfaiV4QRMfxvovWDkmNYV9i9roIkXoLb1a9ko6R?=
 =?us-ascii?Q?gV1oiut2/nRn6JYqKv3NYL49dxP992sX63kaFHMd9C36VaW1ounS41OMSMWb?=
 =?us-ascii?Q?9wDf87anO0HA26lRZ+MLNdLFk8YpY44VQMKGQbn7GPIB5GGEBlEGy3jxGC1I?=
 =?us-ascii?Q?kEH19wVzPDIXfe5vBtzZEEpOjotg4FNReZCRfdr7fzL5jUl+wnNUVWQC9/kp?=
 =?us-ascii?Q?+gIocwlT99A2bFly562uN0rr/g7b+PLWS6sBiQixV52HqZ83v8vN4FcS4BiR?=
 =?us-ascii?Q?u8qpQlerP62DAGw5dsRZ/0ymLx6dPO3Pl6eERcLVJp0KWcnyLxykn+r3rIF6?=
 =?us-ascii?Q?UMUqJIA595HcHxmk8+if8gwz5IQeMhHZPgu38J8Tiv0EPcWJuSVfLxSo7MUz?=
 =?us-ascii?Q?SfbvAlwQE/6OuaQa+5ugmuCAjYUQZRHyerC/focGqjUvOD2v3fpoPJQ9We3y?=
 =?us-ascii?Q?oUKmlpbfUvLJIJYRflC8dsQ2QTswSUWi2gfBDTHXcr/FeKQNbRZcqQ5Z9mpF?=
 =?us-ascii?Q?y3qKHwZj/00mXCKZLdZRDVFIa1YkK2VdzhJyp/N0DPEBEPMqekEzkiQzSQWT?=
 =?us-ascii?Q?zZ+2EFygYNZIWMy6R5B0Q27ojv59jfDT1nfZqvxQJ06miD/MXgXtTrL7VSjJ?=
 =?us-ascii?Q?2tsTsmsKjDZ2IfRQRVl+umjSeIs4JjYNL9qRpMy+IllLJ1A4M4aohlaNcU+F?=
 =?us-ascii?Q?eFv17MO+dFagwhyRgEL7m46pCP0B9BT8Aav5NAq5LWBXmpeN8mZAJ7BWYp4H?=
 =?us-ascii?Q?a+CB0EuwqpOK9NSqf6TUkhqYu6wIjghhldQ5HFc/8CpAn+PRwhmJ3iSlphY6?=
 =?us-ascii?Q?y8883SCP6l2E9dFxhBQcWlGRFKzpiUKktPyV2ZkUkdAo8VH8dm26zmuJeGCZ?=
 =?us-ascii?Q?KY4XVZhMtRJnazF/2SEkUTkpk1+l3e8fTgeAPDFpsfU2xZgWX5VFdCgF4BjG?=
 =?us-ascii?Q?fuuzKXS2QRuWv0/aGHuv66aXOZDRT6woFXWJjy6wxMbV+sa59yDxfA31poYN?=
 =?us-ascii?Q?FdVoVRGRheSFtufm/jxsVsu79CJYtapkIt/Z+s2xOOrbRu9qflV6Ppx+Jsol?=
 =?us-ascii?Q?iOdN0P3W6V/AyIjZ9br0Bc+lfXKWZ9B7Z2W6R4zbDhKQVp1wGahuHsfDsPpR?=
 =?us-ascii?Q?Qd1ENurRB2EXnjNxQrIR2wzukI/PI/cVRd61xg5B3Y+NlFrU/QCDmYUDowbB?=
 =?us-ascii?Q?2vYb8LzTuox120IdT8+g1WjD8aw7DHdYv3UHzyUrgnnZU8ZmzDvIhg6cDvXP?=
 =?us-ascii?Q?vaMqjoaMxbHKqMHUewZFu4sMH6MQ+XnsMOMnk8NUMmC+OJ4I8A=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wA5w6RfFVbCNb7AP39V3HL2hIeTPvlI8uv6S0zEusbK6c34NpQOcquSHdFkG?=
 =?us-ascii?Q?UneNGCrRhWJQ9CWFAdEnErNQvdtmYlD6gmaJzymfLRcDvbW+V9zqANKwbnPM?=
 =?us-ascii?Q?eiko2J7T45mnlt7UJKpWtxmYfHEwBgnxRsj5gtm4sV5nb4h2zLK4Xb0+C+Jt?=
 =?us-ascii?Q?64gz16TSj/7+o2gnIXlf4c0Et0BtPIZv2TLwvIS+9VHvGzfJIXdD+RCqX0UA?=
 =?us-ascii?Q?9us6w+R25nY8KkBkwv8072e0ZhpTvo0AQ/CSYnd3P0xDYEghEGdneGl/r179?=
 =?us-ascii?Q?WJc6z2MZ358ge/jFtqevgX4dxqMV/Kvt7tcmKf3FZUXk8KDoLlk+e6ye8TyH?=
 =?us-ascii?Q?YuMzHnJs86vuG28Y4jQ6ZUgfBNwFniMU8bS/g96u/xt6tGIkB4UKkUJQ1Lxc?=
 =?us-ascii?Q?fJlWz/SBAs2KJk49p3YxKp56Ad7qQK67vXbADXFfI+MCTWT2vJT6/+eWsuiU?=
 =?us-ascii?Q?7J22pzeHG6Kje2niYbhiPn5rSL3nrZ5blG8DRZ2o3kcLJC5imRMWxe+3SSJg?=
 =?us-ascii?Q?Tojj9RoD1yGSTUUFq8x10W5+2I4GE3IidC4E7IrvTtFxgVAZSA1VtjT9XXjh?=
 =?us-ascii?Q?MGAxgCnCp4+z1busQrtXTS0lbVA+Y+JMIxHEtADoIsUzCnM0rZRiKcKoKFXF?=
 =?us-ascii?Q?95LEXVWSxGf2zFB45/pdwHSAVT9LHnuTFjGRe2M9j2r/WmkieXUGnu/op746?=
 =?us-ascii?Q?JHl76JyG+H150yCKInOt4h/1G5LsZy5N1pA5YXvFFt+SfDrhycYsJ0tIyJ7a?=
 =?us-ascii?Q?7uB/RFT+H5Jd/3Nr6AqPen6lZYvk1u6z6PZ32iOSe1UWCq01uqHd9v3gS8SK?=
 =?us-ascii?Q?e1+zJ1WnXmhD8HrVhwz5Suqsoiw5XCOVHRLlmNPROR1AmhdrlOaumetYqd2K?=
 =?us-ascii?Q?n7wv4auLS193fpY5uSohZlqeF0R3uWjLJ1He7VvGU+0VYyvDO6/kCuQLU8RD?=
 =?us-ascii?Q?b3Em0/OXbdGChh9wAWjM+xn/R2DWsB9LpN91Y3toI+WVfjggTSIhItvyxnwa?=
 =?us-ascii?Q?O01CYDg4/zPJUu/nc5EAuL6rPQD9n7aUF8ZUh/bpBhfwMIedtjcKBLlgsPUb?=
 =?us-ascii?Q?jUulhReDpgikqbQvwagcSzsHr7wWhgt7XaPuN9Ep60OQmkVuaGYVIvao4vVf?=
 =?us-ascii?Q?bysoZXqZQk3MmnPaT4xD0SXS/8gKCox94sYKbftgN3ZGBPoeOdcxa9h9cwI3?=
 =?us-ascii?Q?ErhRC6bnCmz++HSF2wCsQowQJMtFfojIbu547s6qhzvG7IqEB8zqGid5imVy?=
 =?us-ascii?Q?NGVd44rdVMZFAY0+awX9B7LjCP3crbC2mK9MkQoSIPwSE9Zc8vCvhTxGQsWW?=
 =?us-ascii?Q?jzJDWkcJwvhzFqzbJVxxKA/4jrYxLxgpulMH8iHc85E9zIuWWX3/uzbEPuEh?=
 =?us-ascii?Q?hLdYzbVBzidUg1l6ifcslhcO8WdGatDyeh5UCZVQ95HJH5/gBZD/E1UCPD26?=
 =?us-ascii?Q?GxAXtKy3HnDUHD1RymIlodBMgFOJRk0AIrMV3st+8Uonywxr4yVk+hzio6oJ?=
 =?us-ascii?Q?S36CEl6XUFCXAmrE+7u5Jf5BrrNkWoHoOKEO7w97AMIgOHJXvkWxiNBeD8tj?=
 =?us-ascii?Q?q5FQLMKKNxWLN1vHVcLXsQG/9nvcqnRdgZgZD5ortQZ3qArfZzzaw5Tj+gWJ?=
 =?us-ascii?Q?PcwBXlvt/WJrHOEOUxeyRRI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 478d38c2-5dc0-4ea6-3290-08dcc23c19c0
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 23:50:56.6389
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 HPbI7iyOZwNNEjg8N+jYey6TW0yLv9LR2Z/h5WMXll0/mNoJHApFCS4yEFs/t2yJY2fUyv6TADwhJt35dDqO+cGOvC54bkHh9x7HKcv8Mr7MDQrXYZdPn9KKKwuFjQ1/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB6049
Message-ID-Hash: M4FARULP25YSCL4OIW47FNTLKHR6CA6D
X-Message-ID-Hash: M4FARULP25YSCL4OIW47FNTLKHR6CA6D
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M4FARULP25YSCL4OIW47FNTLKHR6CA6D/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi

> > Of cource we can remove it and re-added later, but I'm afraid the person
> > who will re-add it might not noticed that there was a code before, and
> > re-add different determination methods, etc.
> > To avoid such things, this patch disables it by #if-endif.
(snip)
> I can see the symmetry argument, I don't know how other people working
> more with DPCM feel though?

Actually, I'm reading DPCM code, but unfortunately I still can't
understand details...

Thank you for your help !!

Best regards
---
Kuninori Morimoto
