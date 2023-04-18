Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 023A46E6FF0
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Apr 2023 01:34:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D63EAE96;
	Wed, 19 Apr 2023 01:33:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D63EAE96
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681860886;
	bh=0x22Q8cnkwf8x4fsEnSdo4yG4nUUFIF1X40qZvjP6vg=;
	h=From:To:Subject:In-Reply-To:References:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Seu+UwhgOORVbWxNCNwGuClaLDU/e91yp7iBvz3n4QSFK8WC8EenbPt9Xmp/zQxFl
	 0nKvPs+AIc+vjFtuRfPq3EkDQFeEgEmJFRMpTcQgOQkn8ovRctCfM76Qc+Ea24/mFM
	 LWu+KMrMiH3bnog9Z88MIVw8tFOtFqY+VOjwLv90=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 29FC7F80149;
	Wed, 19 Apr 2023 01:33:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BE87CF80155; Wed, 19 Apr 2023 01:33:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20727.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::727])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 38F44F80053
	for <alsa-devel@alsa-project.org>; Wed, 19 Apr 2023 01:33:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38F44F80053
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Q/DrIR7d
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O6xY2tlRdohynccZuKb8PQya3woQHO2+NVbcpeeFk5cShIndyecjUxD/UEPG2/AgqvA9MVt1d7h6FVKGXfz0lc8tHg9sRL5sb+tyPc75/KnwqBpQBEuCXdIfhhIfbyRLGWtWPwNgIrCEdoNosoQn9ZAqxUnCUbxQcaRatYpa9qEnTChTJ1OHtlMyk9l3l885eprANy8aWRm1VfL47NHTvXXlVjDc9G24wn6Uldg3dNl9yfHFICNmyj0qymj34UUAMWZCkNYtkp2D4ZpDCeEVv8YlsqnXrrE9DbbDe+rLpbTMfwoOpANQlSEvJTJO9gO5OQ8O/B6DEB70Xx5axNW4XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OCAe9Gsaey87HVvRONROF7BS8Nz80CEPb+mYR9cEecA=;
 b=X29bCcHl0EK9Rc/4ns4n7wOoBixqRkUPsKNikow19SD4O67vuxLeJPCLGxruB0OMd/4wSrkcglEmhTW3PGXpBQucxmTg6Mbhfya45aLYpLDs9YN5UOuMHpc9J6K9AXZDWPuvgi3BLEPnpLjTq4693lyWT+w2gOBVcFGVK7rE8cbS1BdIpTIVQoZaLB7yNeUnAcbpKRRrqbkNTXG+suwdkddzEwjfZ6c7WbxeJ7eJ57lqWrRf/bT4boycOwFZU6fTOQMh8hXgozcVrUmIHGK8gVVQnpzlSpPrJL5cqEnqms00bCR17cRpCkIvLFh7Nb9xbbGUl/ZCQnxwf+6n42W1dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OCAe9Gsaey87HVvRONROF7BS8Nz80CEPb+mYR9cEecA=;
 b=Q/DrIR7dfnvFYq1NyzyQcb1xS5uG8X96Lvvag5izN/5lV5cMIyFVarji+qcxylWrjpiu0sxp8Y1s0zCqSbf+Mu5y6TbPwfZcYWKVYdVw26W5j0KtOkM0Pxa7RX7RjvmPd+smhTvDjswsHLwHmBUT8dgA9j4rMG/dcOZVP4uGhMU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com (2603:1096:400:15d::5)
 by TYCPR01MB7703.jpnprd01.prod.outlook.com (2603:1096:400:180::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 23:33:40 +0000
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::6c36:5ff9:24c9:e4f7]) by TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::6c36:5ff9:24c9:e4f7%8]) with mapi id 15.20.6319.020; Tue, 18 Apr 2023
 23:33:40 +0000
Message-ID: <87o7nksr3g.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: What is difference between snd_soc_xxx() vs asoc_xxx() ?
In-Reply-To: <542fab62-8434-4dca-9d23-04e4e7c9bf50@sirena.org.uk>
References: <87h6td3hus.wl-kuninori.morimoto.gx@renesas.com>
	<542fab62-8434-4dca-9d23-04e4e7c9bf50@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 18 Apr 2023 23:33:39 +0000
X-ClientProxiedBy: TYWPR01CA0012.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::17) To TYCPR01MB8440.jpnprd01.prod.outlook.com
 (2603:1096:400:15d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB8440:EE_|TYCPR01MB7703:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b628dcd-6b4a-432c-e220-08db4065570a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	VeW40d2+t98JGUbxKZlboWZ94k53WEHzB0G6k1SynGm94/kfzXsR3SKSXvAVgVXS70YH9ths2H4A1dVzmWYehwg61+hE7BUELLPgYyWYDGtw624p80W4t8d1UCj9Rj8heG/GBRDDqgfulHFv5TGfPIbp4duv8e+RrMV0kbUjqaLzjEx9g88RqJqxoKZFRtWyaWjz+VG1CogcsmMJj2Q3jpRwd6jEnIyXSrUXDd21Pv7avHnIkULI3X1zbC6rNWT2kJ0oZi7XjQZFGsoyUO9Ye2v+8hqZ1wCCSRWPVp+matlsPhySu+nr5HPKx3xPP4Iq3QCj/UcNQ/RItYfJlwQ4DCPpUgAdpujdL+rGlHobaOSXSBx2/s/OzTMTXcPZO0+fVUxlXIvFRUFi9YsKsoNVbfw4WXZims9RhrnGSDa8HKCTutG8jA+Zq28WHdsJYNXmyayUr7uBfpXCa2BFkfDVzpNtqRTzKZi7h/P/VPaB9Pw/cec3GmF/icr3Ney8HiRkQ9brALpv9WFOEfAby2pk523Ndg3yWqHQEXPMNX2KQX8c++BKzvGTwbylSIh7mkH2nNu/jeN05h+muqPAnEF1eaXojcLB1SlCBQu4tmkZDXYQCCdj4WwVkV6LlpJLilROsg5mR8KskjUv4OdBE363VA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB8440.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(136003)(39860400002)(376002)(346002)(451199021)(36756003)(38100700002)(38350700002)(2906002)(4744005)(66946007)(8936002)(8676002)(86362001)(66556008)(41300700001)(6916009)(4326008)(5660300002)(66476007)(2616005)(186003)(26005)(316002)(6506007)(6512007)(52116002)(478600001)(6486002)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?HN012grC6f7hjndH8ASqrd0kzzf6kln62e/2fL+ydd6AURe02Jk7RVG1+IzB?=
 =?us-ascii?Q?O52zV1WFL7I1SWz88B5LhYfwhiH1BKdEsz+fxOkz/NCOIEjZMwmCf+M9XRt5?=
 =?us-ascii?Q?4N8TgaSKToDVncerMLuemoV5qFEtvtWAa4fRtBJeoWxdTmMaNKyq/yGk1y5y?=
 =?us-ascii?Q?AxUgRP9P6Y+qxbj+MlJXW5rCGvWfDN0Y7ytnaTwfm3ssi6wz4mQFdr+Ss5Hu?=
 =?us-ascii?Q?bf/lZi5HbVXoeeZgO1CU4ondoI98cIXQZmrvltX06I6mKD+d70mDQXPTvA8Z?=
 =?us-ascii?Q?2uE1+0+gFVjdrxCLiXzBtLibSvhqT9UOo+HXHUODICeEFd0mG3aNsJtqG8jQ?=
 =?us-ascii?Q?pF6TJRF+yb26nrvWqnXiZ/lLCkuv/QqWp0VrzM+J0XW2LgtlFztgJphvFBSW?=
 =?us-ascii?Q?06pLIzuUQOYal9obbM+zFqNUI+efeV7BdyS76XSigLj3awt9HhBnXGFWYbt7?=
 =?us-ascii?Q?zjViKEPLnnqcfPdjC6rWOSlYahAGwkk8QZ1oQtA14f9HzdS83Alw2EpaDZoa?=
 =?us-ascii?Q?jUC29cakBB2Xec0FFWlu+Zp3d9quA5OwHk3CyZODP+1kbrcxNzC0fdBFTQ7f?=
 =?us-ascii?Q?cmmBHLp1e5k0z9dq4jRCN+L2NGmiNaGun7y/S/fNHrc9uCveRId+JUoNCdWd?=
 =?us-ascii?Q?xjr2I/Y8CPgPj7iq+lC1qnmP8SvM2ZPWIzDQsJ5dMaMMPVeWed0dbotezKbp?=
 =?us-ascii?Q?xPEvnF+IOXwFG8v/8X85bL5TySKrJsCIYDlvffOyU9lslhACooJmRUsQUACJ?=
 =?us-ascii?Q?twMx8IGCxK90jBVPxnz0JrlQWc0q5IrVU4l40zGJFuBdd7qBeTY7eTZxl+4e?=
 =?us-ascii?Q?5s4ab+vON8wD96d6KnTdExKOz5CrBjrE3bD2BFu6PPq8hzCtoWKONfR2138X?=
 =?us-ascii?Q?wC8dtzA3ke5TP8HcbHLLEKHV6FDQmWn9WKSy4PG9OG+dduPWNNRWo8zzecHa?=
 =?us-ascii?Q?reOrI9BdW8w6UuLBniuMoG1/L1RCZvG8G730mLJg3royZqwA+H1KOOiam60r?=
 =?us-ascii?Q?bw2nmIX2/LAQaRnBUE9ZF4u2HEMIHvZL3fHKmaMECNobw3U9rSZa91i0p/uI?=
 =?us-ascii?Q?Uw7gmiwaljehQbpNbdpxBj91Kt3k5do6yaIMGUGyn8OHUN5Re9/Ly3TBXc8a?=
 =?us-ascii?Q?Z1sa5M4Bp5YgrgvYovVsxGRW6westygtNT/NtSiDJoVGGsVeB4bSxA0bQWum?=
 =?us-ascii?Q?GK0BORUogdNcqjwJMKJUPDiHAM/2SfXh4h0/BdyQ43LMliQYRT+LqUa1r/n5?=
 =?us-ascii?Q?IPjaAH1kSNR14aHbynkVQuec/ImMGjjCMHwPF56kN3y+uCd6KOGLS3M4A4Ef?=
 =?us-ascii?Q?knh4T7nunOmxHUhhOXaTWgFdw3HD3YRwMUdxKUf9BLCZECPCschd30OIDf5B?=
 =?us-ascii?Q?1VNQkHP5cFJ10IlKiFDBGhhih7YZBvzD5wmQP3Is9rqpP8QUKTQMPyDgzNPj?=
 =?us-ascii?Q?F9J3JHSt9INCr5CDdccTMN0kPMPd25Kz8qlvyZYA3qx5IJWUcGVvM1N/gjvl?=
 =?us-ascii?Q?Z1bAxx2wQyUWicgW/53iyZvZs9WFHs2qGGi8NPc4JBAbUL2BkV13tDuZqkUD?=
 =?us-ascii?Q?BvZs54mNmstmXNf+sY7iKE9WFYu1McVKlSX0Xy01ml927zcxw6t9CIL9TsrT?=
 =?us-ascii?Q?DqSdtP/F6pxCI7zJl4b++tU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6b628dcd-6b4a-432c-e220-08db4065570a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8440.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 23:33:40.0281
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 uko9QAPYEMRw/Lfl8HD8c0TaNB0YG79gq//UbHLedWwVdeXkyIfyPporcNTAa0QLmmYCQo3rXhteGoAKUztjlVep0rF8JfgCqTlA8MRCgj3T6kWaPCToNhF14OeYVuQy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7703
Message-ID-Hash: 76XKK4KYVZBOTJSEGHZLRVZ4KOK5RLHJ
X-Message-ID-Hash: 76XKK4KYVZBOTJSEGHZLRVZ4KOK5RLHJ
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Linux-ALSA <alsa-devel@alsa-project.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/76XKK4KYVZBOTJSEGHZLRVZ4KOK5RLHJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Mark

> > 	snd_soc_xxx()
> > 	asoc_xxx()
> 
> > But, what is difference these two ?
(snip)
> No particular reason, standarding on snd_soc_ seems sensible.

Thank for your feedback.

Actually, I have many local patches which I want to post.
I will post above patch if my remaining all local patches
were posted (and hopefully accepted).

Thank you for your help !!

Best regards
---
Kuninori Morimoto
