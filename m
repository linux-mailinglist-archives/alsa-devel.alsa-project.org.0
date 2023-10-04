Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB107B98B9
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Oct 2023 01:36:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 722C1DE5;
	Thu,  5 Oct 2023 01:35:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 722C1DE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696462582;
	bh=0L6avEQk0DoCZCrxxdcK2ZEASCrl5DGkUszENZcT4B8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=koa7ctdbe8nd+eC05DTCpdIRsP8mdixrUqS9IJ2U8icXpKhnZ0Tt2uaYBIO6HA1Du
	 vcDw/FPWfS/5Kj199ecJkPm3tLu1MGCtmQNdSWoCvAEKZH0bJDdwrxS7gRhRmtxDcC
	 R8A2hsZ0QJrOu4qMbDYwnK16iyyuJdNJAAyaoaPw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DA88DF800C1; Thu,  5 Oct 2023 01:35:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 829B5F80310;
	Thu,  5 Oct 2023 01:35:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0DB38F8047D; Thu,  5 Oct 2023 01:35:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20731.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::731])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E2DA5F800C1
	for <alsa-devel@alsa-project.org>; Thu,  5 Oct 2023 01:35:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2DA5F800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Wz2dzhgx
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XcO/jUziZWUoUGyFw46H6yZR57awKm8PVI+VSpnZ9izDQ9jO5ahDNU7lKR7CeWrwoSEAXjYA0ANQQpD2kcIMriSearVPBThGnCYyEyIgWCf/iR4VhT1GZkq2K6rushaQVOrIKGLxChiQGNPCYOnfOEPJ0dm8MtdGZV5TOHAhK6IunzpeDwDwbfELrqf3RT7WpqLBZyeSOufkl1P49b2YtmrgqJdUJiku5eeAHAOrLWvdJhNwWNozhWfdkMDrOPXoFn4PCC2n6Ss4r6s2esGgXvhDgxmxjlk4KhhspB4ai0nvprwJ7nkcE+3mc5Y72DrBWJ3nLJj8ydg6HXjW8al5qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0L6avEQk0DoCZCrxxdcK2ZEASCrl5DGkUszENZcT4B8=;
 b=HzK8aanf3iR6+b0zt8G9UGPrI6WwFsUtTCZMbF+wgNVZJITxdt0AHDf7SPkNsBT9F2Ux1HaKp8XGlM3NOVQnRYqc7yyzdx2Az/2ArTHrYX4GcIwrqiH4spq7QgBwM+pQ4PpNmeEzgrFmtR2dgp7rFESg1+CExrpGv6YMesJv4b94prmu7XmuvtsdA/QLmmhCv3w37QYrTBlVBbt8YR/myDsBpdQ+L+qiEOXM0gmfcGgmy/atMItigRasqIXPh1h7zVz9Mptfx4itlpanyz29+c3k0IXa4+Pb07FADDwsoXH57LNzsKw8s0b9s+UniuBn/UO/DuSYxBlpwT2azcwL2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0L6avEQk0DoCZCrxxdcK2ZEASCrl5DGkUszENZcT4B8=;
 b=Wz2dzhgxAWwdHBmXTejz26CSkHrnqYMoP6Byh041JZhTOr/vWQrRgV/hAychFUC11SkzxRXRbZ/JL2DSVO+Rc1jOcYCTzNDzXNno9R9HgYywiVsTVIaKf5/Az20YCnugVnpN8bpukH2BOU40uOLI/4YgsQW+2lM84181/nxnMo8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY3PR01MB10518.jpnprd01.prod.outlook.com (2603:1096:400:319::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.34; Wed, 4 Oct
 2023 23:35:10 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6838.033; Wed, 4 Oct 2023
 23:35:10 +0000
Message-ID: <87r0maezbn.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Mark Brown
 <broonie@kernel.org>,
	Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [PATCH 1/2] ASoC: soc-pcm.c: fixup validation check of multi
 CPU/Codec on soc_get_playback_capture()
In-Reply-To: <1jcyxuy002.fsf@starbuckisacylon.baylibre.com>
References: <87il7mg69z.wl-kuninori.morimoto.gx@renesas.com>
	<87h6n6g69d.wl-kuninori.morimoto.gx@renesas.com>
	<6c249580-ccdd-453f-9051-ca2a32dc4189@linux.intel.com>
	<1jcyxuy002.fsf@starbuckisacylon.baylibre.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 4 Oct 2023 23:35:10 +0000
X-ClientProxiedBy: TY2PR0101CA0042.apcprd01.prod.exchangelabs.com
 (2603:1096:404:8000::28) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TY3PR01MB10518:EE_
X-MS-Office365-Filtering-Correlation-Id: 5717b016-805a-4ed6-d015-08dbc5328cae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7eMxfkftupp0D0X52l08InIXbvV8W47eGw3uJO2QjxA9nrnWszzbzKywazXfx/sMUyQxx3joQ+HzyLwKbul6Q4WYne4yylOsoN58VgVOEO4UxRAA0HIHs93/5rdZhu8XZxzTqPheZaX/Q8L6BVxIZ8qx11CVR95d/TJR7SK+yiZ9Fx1TffqtmWJyGq5DhK/7JBIzk350ObJ5zmrC7mki2PVokbFNeRxefPtgWK4jk7n0paNpOSDu/YZO7tQCUraDwKNPKz/vQLXucOl3TH2RSk3V1eGu5EDhmH/kpBk1nWcZT+S0RDGUNzJUbiFvZ8zDYksBFSWwU8Q/nP3lB662KfWfLZJn/jmf5nfA4cCB0Y0+8JdvmSTL4uxzUYCaLmSPcBJQcYIMNCcSuuy+wJTuUQ0TVqTaIX/0Qsk8o6awxZpLVaiw9vIVHyo8CIO4jDGaZT0OVEXzylVeFsd0/yDqOksTLphJgJTD42mWWX9qI1Psa5cdVqMI2GZUGJWvy5AK5JcciNufkjip1aZ5VNeTuVitWVZgBNJku2otRPyYrGTkI/n+5gk4KqW8lfLUSe7V0qGnRUeqkUF9xPX38M7XB4ZbkZ0FKDo0HAbGEGXJPeAxIj4pVn+PUJl5wy/lImhA
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(366004)(39860400002)(376002)(136003)(230922051799003)(1800799009)(64100799003)(186009)(451199024)(6486002)(36756003)(6512007)(38350700002)(52116002)(6506007)(86362001)(478600001)(66946007)(66476007)(54906003)(316002)(66556008)(6916009)(41300700001)(2616005)(38100700002)(26005)(8936002)(4326008)(8676002)(5660300002)(83380400001)(4744005)(2906002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3TZDpSz0Rk68E7HlxDmb1bRJGH2eBJ0AULPAxFLqb42DYUAyFK/mRFdECznD?=
 =?us-ascii?Q?Ht7SxZG7728k6PtWeDYzt05yny+B7EPtmZeg/oiF+/ZjG9/WWUL+iO+WMaIx?=
 =?us-ascii?Q?nVArpsJqaKZvQdgHWLw9e7zf3p+7le8RA0POy6rTQ0SD/eUA0u8M1om4GaCl?=
 =?us-ascii?Q?q76PAyE3ALT6gumZwt/ac7rYCmeGDoIavl0z0z72VFQpNpa8+vCYAl82gtHY?=
 =?us-ascii?Q?+gMdkeOUCtpR0lndtIia9sZq2LoFgQSqaIbF2yq9vzuESKv1DB7X6A7XtQWg?=
 =?us-ascii?Q?5YYY1zhm3iMVCVh53jOMcOLExmCG8JOGMYQz3z1fRfcEvQmT2E7zAu4VwTx4?=
 =?us-ascii?Q?Q53M160Qof+h2+BZfp517708PsoebOx/8aZkxX5cV/Jt1Je1hd3UhGPobV3M?=
 =?us-ascii?Q?DRYginJ3h23c2MV15eY2ZAotdfn5BwCKUQYQHXZsnYUXjQY7J5Na8nQ2hoGm?=
 =?us-ascii?Q?gt5Lyw+cuGH4KJ2gThftMXt1elgJitNsgt+SDU33Ca2rdjEzYVKlWJpUrOz3?=
 =?us-ascii?Q?hAoW1DXWR0EBlEuQB20Ssskb9ZTAIJKiPJG+Wz1EKpdV3ZRYS/STV6LnPYkI?=
 =?us-ascii?Q?Qrm/KSnxFhqMMfAv1IQXzjWal3Wsx1LUL0eRD9N8y37obmVbNEqffXTnSUlp?=
 =?us-ascii?Q?4eG42PZ/5e1Mv6zk9pt70HuCh6pTwwuscQcyLC0CTe53i7mjTfpLilgrCdrY?=
 =?us-ascii?Q?P7ES9w5bsslu4g2I1Wt7KPXPBTLG/pcggr/5+Rqd5tOvFI2IvdQhPcUjF1Y+?=
 =?us-ascii?Q?jjGQn/b1TrUlCZ3nqeRNJYQvc6qVfC2uVl2OKut9poKaxSioY/yCAT/4veXs?=
 =?us-ascii?Q?tjqaOS2ujYjHZBefCc/Fq/MGK/oxhZOjM5FHIfvDWf1lrP69traf+rF2QQ+Y?=
 =?us-ascii?Q?fjtDwRsLxTKXQk/tGSm1YF3QH8tv9sltv0N2jRcZBpprnkTQliA9jQu6uMeQ?=
 =?us-ascii?Q?+ygHA8RcaTrfu50pIlKn7ilqAvVq27Mi6Ex6kZ3VtoxXy0roO3tEbk8FP68B?=
 =?us-ascii?Q?Lggq/huENQOEUCburhYA0cktr7IqwzBNSgQCWWOvbsOTtoMw6HKI3jwEXrL2?=
 =?us-ascii?Q?tVnhNYCYE7CD3mfbSUllpUOcQ70WVXmSDzMl9wLy86VD5UTjT7lZBnlwqvuw?=
 =?us-ascii?Q?M/svAPEXoCH5fr4hr+hzxFOpKHsMfAcihyK1ASsvvYhkiVaAu19halsU82Zn?=
 =?us-ascii?Q?fTA5cFf71kR+WsM8rH0NDCupO1SlxH7PwH12IBR7QmcAdfCX1O4pomLm8t9R?=
 =?us-ascii?Q?A1hhDMxSf50/uA+UWX3srysP9rXtkaO7VKXx+7cIbrqkGViKBtkrFtyS8AwG?=
 =?us-ascii?Q?DJsBq7BDVa/LY2BGOSCMRc25xSxtvzEa9MdikaU8kcsSW1C8qLGua8cy9bdG?=
 =?us-ascii?Q?iPjlWW38/E5hJwDxhcIh+emXpu966S0rA0s/AKH81nZ3VNF2qidERSHQWXk+?=
 =?us-ascii?Q?SJRWVgAhxFEaUmIn7vSERVf9m4xbSDsJDfLcYD4ZdX3uDUHGeGnIK/NeXE/N?=
 =?us-ascii?Q?09NL3JD/Ti2tU6kR2sP2k2DMX04KKa/EhZjK8qQs20jks62XV5PM6/S+KS/I?=
 =?us-ascii?Q?eHGRjIsvKg5Hmgdz35bPj0qnmffM45l3bS7QcfBNPx3ssEO6JUO6VTPLFb6x?=
 =?us-ascii?Q?vJFDewbSohAS1XHqYi7dUv0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5717b016-805a-4ed6-d015-08dbc5328cae
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 23:35:10.4115
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Jc7oZKnV+Donbf9g0nHs+if4TB/sCaequ8Rk6vJvgeU8V19pbc8lJsoprv0bdEmpSNnBOzUAETcailYUUOfo+2TMi1pDWt3xRr5+L+Tup3XdGAG6uIrHeI4a1iMM55fB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10518
Message-ID-Hash: PW4I4MSKFDKDKVJET2HITODZZGC6IWY7
X-Message-ID-Hash: PW4I4MSKFDKDKVJET2HITODZZGC6IWY7
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PW4I4MSKFDKDKVJET2HITODZZGC6IWY7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Jerome, Pierre-Louis

Thank you for your feedback

> Here is an example:
> 1 CPU - 1 dai link - 2 codecs:
> * 1 codec handles the playback and just that
> * the other does same capture
(snip)
> Going with 'all must be valid for the direction' makes this use case
> impossible. Each codec would disable the direction of the other one.

Ah..., OK, I see...

> Do you have an actual problem because/error because of this ?

CPU/Codec N:M support is added on ASoC, but the code is hackish,
so I want makes it more generic.
In the same time, this DAI validation check which is related to it
is too much complex for now.

I will re-consider around there.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
