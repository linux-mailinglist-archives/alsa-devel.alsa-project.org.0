Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B989EC2FA
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Dec 2024 04:11:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF7EB2341;
	Wed, 11 Dec 2024 04:11:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF7EB2341
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1733886686;
	bh=ava76Ve8aJqozawOgULm+0WWlEIDJuGJMeLj9SKdXBc=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=ltN4rhlCwVenBAd/+WWcuo46zAmMaGud3TMDZiCf3+TATv9pKIz19fUDSaRxLGu5d
	 wMhZx4nKAMSaVO1iMcZ0OIbXNITlDhWg48HMuwpP08+M4OXPV7y7Ly2fA8IkPNud63
	 9Z0eSNzSYIGYQBlq84AfpYSOTckGwnR52sIJZIxY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B702EF80602; Wed, 11 Dec 2024 04:10:27 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DF735F8060B;
	Wed, 11 Dec 2024 04:10:26 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AC49DF80482; Wed, 11 Dec 2024 04:10:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2046.outbound.protection.outlook.com [40.107.20.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 73A98F8016C
	for <alsa-devel@alsa-project.org>; Wed, 11 Dec 2024 04:10:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73A98F8016C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector1 header.b=kWIKoBZS
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TPahk7bU07VDsEmCBF5pQeBfEOURPE71xKzfBqXkoTBcRbBfXKRbkrxYjI+2VzUPRrxfa+XnGxOaMfSDsHRjjONUMBjNFoVt7xLmaWLuw/WwFdDigfEh1tUVRFEI0T7asgn4lN3jp3Ia5gKyTkJ3fv5+QSZgKFxQfiQk9k1hd5NzTLntAZUi5+bd0WfxKgjIB6vdja6spuDMxaNJH8QA6faKr5fS48xyYSdnPcWaYzCoQYpD+bCEuNwNETRAxyneOanHxF52uf9IkspOdslyFVFwQ09Rbm8bthOfaW06LRuTkVq87oygwD95KMwsQLAihdzL5qbOJdSrbkWgXieiZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8f6ttwYZXSGqEAL54j0qzoFjSj4HqsYoO6Te5HL+rSE=;
 b=ocyUaWxFps+FempKyvwZl+d06vu8H+wiLAE8k58CuQIsai6o0o5fLRKbnE6GhFPneosYtYMFCQHg2MatF41bHUre0OE+AI1Sie/e59P78Ax2fK0ZFv/h4SciW3QGM6Dds3V4NXIFk+Lb5L1uqX6v/HIKG7MGSkQzLiXZz9iv2hpQWRjXOtlt0Vs0upVcpobiD99gBq+IRsNPiATuDMtA9aTAvrzNOhhLQstqpCp0XeQWeAYbjCwAjd9lLv2qekqg+vvHqFdcRdyJPWbQOrol5RD6YF0LesnT5PYU/+LrSowMNou2p6KpXTFnOHCdwCEeuYFXZm84Zx9Xt2sQk3HhZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8f6ttwYZXSGqEAL54j0qzoFjSj4HqsYoO6Te5HL+rSE=;
 b=kWIKoBZSqpZzd2Twz9xcUmfMH7oYbfYLqOANbr+0Wjl+X84hgeTHMpd4fQNiHhAjBJLpAL5KaVfcJeU7f4RFXufiWHCRy5e68dLdhYZxF16SVHL9i1dXE+C7+AQ6ULvvlZAnKDKriIHMud5jp9wqh9CeGqmS/6z/q/17s3ze5PIUsNkfVVJAQ3XCpawIJNfmK7Otk+y/G3w7Xxa47/uVoxAn+gOz6k43BbWvksmahcnCshaeyS0Yx7m3rZvLqPsFuH3bn2pJbQld2O/CrcIBWrPtynmDJVw29QKaKaqVg+dCae4v37IWS+rM7YX0bA6aW18a4/7q7Takh3Kp2Wn5/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by AM8PR04MB8033.eurprd04.prod.outlook.com (2603:10a6:20b:234::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.19; Wed, 11 Dec
 2024 03:10:07 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%6]) with mapi id 15.20.8230.016; Wed, 11 Dec 2024
 03:10:07 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: vkoul@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 2/6] ASoC: fsl_asrc: define functions for memory to memory
 usage
Date: Wed, 11 Dec 2024 11:08:45 +0800
Message-Id: <20241211030849.1834450-3-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20241211030849.1834450-1-shengjiu.wang@nxp.com>
References: <20241211030849.1834450-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0032.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::12) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|AM8PR04MB8033:EE_
X-MS-Office365-Filtering-Correlation-Id: a1401054-f104-4951-97ca-08dd19915082
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014|921020;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ovGX0uTV4tDPrQUizrmnh3dhgxJhekMHFm/CWQSVzJOV8is1TBNLZrtSHmG1?=
 =?us-ascii?Q?Q9UQAvhTvxB6TviQy+ZWwzQuDeufmhZA+swpZzTFKKb1aCUXy1r3IlOdhL5V?=
 =?us-ascii?Q?v0jjFXd8E78vpig4apVLa1vDYNb5IpvGHIc9oMMIdl9rdnFf09lhoPcpc0T2?=
 =?us-ascii?Q?G5pOLE9mQM2QBUl5m/ZKUdOroz6yKGovKqG8j5q6QcEZuD8GHN7FM73kXrcO?=
 =?us-ascii?Q?DKHSa45sefcrl+k7SYwcsFNjmOOwDMDA5EpOTyLKGtuptKhxO7RN3uTJJu7D?=
 =?us-ascii?Q?JhBzFbgzhAhBKPktnxhaIyt4t+O3+e8SQu+e+bCN869bPaCh4GgJxeMrSk3M?=
 =?us-ascii?Q?0eiTPwU71S7RTv4GPEyDvLh6OLcg+AuPLwvyq9F7PdZbQc0kIzEiSFU0H9eU?=
 =?us-ascii?Q?kVj0H3S7MwZ4CVa4OdgdbYDOBgWZ8M1NvYLWq6f4pOi+4pF5G9Rf5Iolc8VE?=
 =?us-ascii?Q?bdSxb6kUlusFoZsUIerm9zi9T/0LYh9L2ICwoY8qYZ1OXNX8vlWaJc5PllxS?=
 =?us-ascii?Q?+a5q3P012j7bVcXtULg6Lif33QbF9c6ZsQotZsR5YMB74WZHVSJ2vka11eCf?=
 =?us-ascii?Q?dFnGiPNky+V4j3/tuW/dTtteHfP+t1gk3ZWXG96ki4jb5aakh1botvuHcpNp?=
 =?us-ascii?Q?klWjyg4/4OXdG53ZZ06/y0+eGT8YUCflLCLG9LX3woI/5IzxQFbV4gscGPNR?=
 =?us-ascii?Q?ZnpZ9opK22HXhh0V6tHLuC6gBoTXjCDtNvwxhUVgRWEnQtQSFvAmB45sQTms?=
 =?us-ascii?Q?B692s4HGoETHoJql3b4QtBwO9Owa7F3B7CBrRllFgFdXD0HoE1eqp3BTaQAn?=
 =?us-ascii?Q?6pwCvd6CxHkNyzAY0z5N+5Jw86hb7rtgz8AMUbDBReTDRuAqnO1C1nbY2fzN?=
 =?us-ascii?Q?05kwJnczGKb1suyQZGZgILSnXmao0CYACxJPZZqSuWpbS96YZdFoXsOPK6d0?=
 =?us-ascii?Q?+StrvXm+MijEcUeP/u00QYOq5j3sySv1bU+JEScD5S/TmD9NeSg3INVaHK+c?=
 =?us-ascii?Q?cXqIcn7taWU3oFrityUrTKhl8DeT+45nB/Wj5zld7q8F3J7H8IWlw4W/CFRn?=
 =?us-ascii?Q?NBNhwWBqypcaNkBPbRt/7BRYPvmo5uq8cUVU1z3x6D8FsN33qILZKortIMXW?=
 =?us-ascii?Q?WlJMiyAiJnYYCOcSRdgoO3jr3e/BctCV/NnEo+Tywu07nCMihEJC/r5NWxfq?=
 =?us-ascii?Q?MgVc4CazYQY3rlrPF5v9/dDM4s3IB2zO6AkqQpaMC/TwUR/7z8VcvQSRSgQx?=
 =?us-ascii?Q?5Z9FKt7iBacCxMovU8FzjOn1h3q7AhkLJRpdeQbcijnEN1vICV8RXTL62QSZ?=
 =?us-ascii?Q?QZrOKECx+GvIPzS96+KCvurSMDrs6/yAMnRqcV3tPE371sothUJEavyRntKf?=
 =?us-ascii?Q?5rjd/OftT9pOI1Dfl0VNRq08Nf73K6O4rsiQcN3c0HRJtx40QOi22tX2cFx+?=
 =?us-ascii?Q?573JsWWGjC8=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ewXg+I89ywdvU+DTbV5jKSgTlSDdGdFDVE9n57reLG3NADU1eLIQZ6c895l9?=
 =?us-ascii?Q?6BhNLbyMCW/8b0G6e5+yvxqoElewOKRe0FYAQLXad6h7etkbLoGncIXa4wVv?=
 =?us-ascii?Q?oyDu05hmZnvYo63mDhUBC6Xa6YYd7THya6ma17cDgepaet0f1AGsyzyADMO1?=
 =?us-ascii?Q?4YGQylLaS7cBzYnxfJBT9NrxpOhwk8HGPnEwlfxqsJ6ocpFCwuNYiCkagoVJ?=
 =?us-ascii?Q?6suljsj7byXIff+f+43frqZi7XKNA9SZDFgOFmkwKVNv5BeddkK9fmKgovOW?=
 =?us-ascii?Q?pj4smpgsTDDcJR9inI5EjBVoRqkVRvlS9hHt37peHDgTji4mMIRVhTrR/S7S?=
 =?us-ascii?Q?8w1Pts6/1KdIrEeGMjO1rf/IxP6QyvQgScUEL1wc7BBHYDVhSfucD4aC4mMm?=
 =?us-ascii?Q?3n0HKtZCamTI4Am0FE+Y0i6bkiwXUzVm1z0FmcgeNZsUJzMPZ++b2VMaQNFP?=
 =?us-ascii?Q?2xok8G/RnBJcHHl9BpPa7cLWQvdnjHuj4D8xsKdcwsEU3fTKM1IHj+2Z+C6N?=
 =?us-ascii?Q?zz4ZaPVJAvXcHBIYYypssis0PWdeFHmpT4Ck6RLjQd1AFDJ+cuSza3ssOMXF?=
 =?us-ascii?Q?q8ldqF+TOZbX5JEDVMCb2BU3ABxRPw0T9HuJsZsoW6G12TCqd0JqLx+zG6Oc?=
 =?us-ascii?Q?2uCKRjMb+7kGaGrt7ddsBzOfs6XVmzZqy8W1WhDZRaquHKMG/6FIkmgxCK35?=
 =?us-ascii?Q?oJeBTCSfOAmN3A35f1i6iO7miLe5BcbeS48g0/T1JjOFKc/h/bEpu+OVVt7o?=
 =?us-ascii?Q?baYpRUTqWk+14qb/FVv+NsWVQbf0P5LuQBtC4SpedrmsjuBoiZ3fpxM12kgA?=
 =?us-ascii?Q?qXdyaiwG0TcS2lWGJqG5sdse/FDXkew5RCJ9boInffsBn/CvSXWg+2h0812E?=
 =?us-ascii?Q?fxefOSXbDjA75Vbsn6YdZ/8uDseq3BsRqsd7B9V/WGGrNXswR0IlZocgywvM?=
 =?us-ascii?Q?4CWC4BOb1U+z4uCCsbvC7anvYCT1CKAksI5jpmu3MHeq0zLu8cbeS2rUVZ5P?=
 =?us-ascii?Q?EERYkWLe5F7VogWJO0PeSCT7v4jDBXG29SejQodF4fXW7kSeAt1Fgg2xxEum?=
 =?us-ascii?Q?W/5lfMpro25Hi32o0ZfX2XBJEt3IjCLFZPhkxcYPI+JgBm72/GjUG64eIivt?=
 =?us-ascii?Q?uxqW0neoimGEh0rRixrwhQLc66f/xHnwt6Zwt+6OS+M+K6ZSwqfVQ49efdqg?=
 =?us-ascii?Q?GH9ojQ9o5hMfGBX7Mme/GmotuYBNN4z+EIZ5yo5eVA7HdPPoVVWTpcfaEHeA?=
 =?us-ascii?Q?8xzlIhh3C0qqAMsRG/ReXEAltr51rmY0HzHAh9hx2iSHtBvJCb0ubn/lXOZ7?=
 =?us-ascii?Q?BvTzC870Fk/Y0scuU+COcWrWEpnOk0dm5Es++rjlclSgWVCLyvgW6XlDceRQ?=
 =?us-ascii?Q?YEg8ed1A7eHO0gx4iIDIwL/cRRmGbbAyItD5XzVU5o/dD4xXgiB2e72Y8sZF?=
 =?us-ascii?Q?Nw40F8NAQiQzzNXXuhVpRz4W+WlUSqDEK2T5WD1g0Xg6GOzKwEnyfok1JfJs?=
 =?us-ascii?Q?lkfwcsDcE/4CaoxSNq4IdTGNjNN9xLBo7fsS9to0tlg3pqsR1Gdz+jwkTZa8?=
 =?us-ascii?Q?oE1/oDYOS2xDOpoAwworeE0oQPw7WZ9GuoM9mka/?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a1401054-f104-4951-97ca-08dd19915082
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2024 03:10:07.1815
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 SO0cPH+ghHPt/qYG+KBe24tMBZtoePITY3ALWQW+X3bQNLAuXJC6AAa1P06pnran5D21sNhDOQVNOCKRQqQWcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB8033
Message-ID-Hash: GVTN54DCPWTXZTSQMFE3ZEQG7QTITUSD
X-Message-ID-Hash: GVTN54DCPWTXZTSQMFE3ZEQG7QTITUSD
X-MailFrom: shengjiu.wang@nxp.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GVTN54DCPWTXZTSQMFE3ZEQG7QTITUSD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ASRC can be used on memory to memory case, define several
functions for m2m usage.

m2m_prepare: prepare for the start step
m2m_start: the start step
m2m_unprepare: unprepare for stop step, optional
m2m_stop: stop step
m2m_check_format: check format is supported or not
m2m_calc_out_len: calculate output length according to input length
m2m_get_maxburst: burst size for dma
m2m_pair_suspend: suspend function of pair, optional.
m2m_pair_resume: resume function of pair
get_output_fifo_size: get remaining data size in FIFO

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Acked-by: Jaroslav Kysela <perex@perex.cz>
---
 sound/soc/fsl/fsl_asrc.c        | 142 ++++++++++++++++++++++++++++++++
 sound/soc/fsl/fsl_asrc.h        |   2 +
 sound/soc/fsl/fsl_asrc_common.h |  61 ++++++++++++++
 3 files changed, 205 insertions(+)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index bd5c46d763c0..471753276209 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -1063,6 +1063,139 @@ static int fsl_asrc_get_fifo_addr(u8 dir, enum asrc_pair_index index)
 	return REG_ASRDx(dir, index);
 }
 
+/* Get sample numbers in FIFO */
+static unsigned int fsl_asrc_get_output_fifo_size(struct fsl_asrc_pair *pair)
+{
+	struct fsl_asrc *asrc = pair->asrc;
+	enum asrc_pair_index index = pair->index;
+	u32 val;
+
+	regmap_read(asrc->regmap, REG_ASRFST(index), &val);
+
+	val &= ASRFSTi_OUTPUT_FIFO_MASK;
+
+	return val >> ASRFSTi_OUTPUT_FIFO_SHIFT;
+}
+
+static int fsl_asrc_m2m_prepare(struct fsl_asrc_pair *pair)
+{
+	struct fsl_asrc_pair_priv *pair_priv = pair->private;
+	struct fsl_asrc *asrc = pair->asrc;
+	struct device *dev = &asrc->pdev->dev;
+	struct asrc_config config;
+	int ret;
+
+	/* fill config */
+	config.pair = pair->index;
+	config.channel_num = pair->channels;
+	config.input_sample_rate = pair->rate[IN];
+	config.output_sample_rate = pair->rate[OUT];
+	config.input_format = pair->sample_format[IN];
+	config.output_format = pair->sample_format[OUT];
+	config.inclk = INCLK_NONE;
+	config.outclk = OUTCLK_ASRCK1_CLK;
+
+	pair_priv->config = &config;
+	ret = fsl_asrc_config_pair(pair, true);
+	if (ret) {
+		dev_err(dev, "failed to config pair: %d\n", ret);
+		return ret;
+	}
+
+	pair->first_convert = 1;
+
+	return 0;
+}
+
+static int fsl_asrc_m2m_start(struct fsl_asrc_pair *pair)
+{
+	if (pair->first_convert) {
+		fsl_asrc_start_pair(pair);
+		pair->first_convert = 0;
+	}
+	/*
+	 * Clear DMA request during the stall state of ASRC:
+	 * During STALL state, the remaining in input fifo would never be
+	 * smaller than the input threshold while the output fifo would not
+	 * be bigger than output one. Thus the DMA request would be cleared.
+	 */
+	fsl_asrc_set_watermarks(pair, ASRC_FIFO_THRESHOLD_MIN,
+				ASRC_FIFO_THRESHOLD_MAX);
+
+	/* Update the real input threshold to raise DMA request */
+	fsl_asrc_set_watermarks(pair, ASRC_M2M_INPUTFIFO_WML,
+				ASRC_M2M_OUTPUTFIFO_WML);
+
+	return 0;
+}
+
+static int fsl_asrc_m2m_stop(struct fsl_asrc_pair *pair)
+{
+	if (!pair->first_convert) {
+		fsl_asrc_stop_pair(pair);
+		pair->first_convert = 1;
+	}
+
+	return 0;
+}
+
+/* calculate capture data length according to output data length and sample rate */
+static int fsl_asrc_m2m_calc_out_len(struct fsl_asrc_pair *pair, int input_buffer_length)
+{
+	unsigned int in_width, out_width;
+	unsigned int channels = pair->channels;
+	unsigned int in_samples, out_samples;
+	unsigned int out_length;
+
+	in_width = snd_pcm_format_physical_width(pair->sample_format[IN]) / 8;
+	out_width = snd_pcm_format_physical_width(pair->sample_format[OUT]) / 8;
+
+	in_samples = input_buffer_length / in_width / channels;
+	out_samples = pair->rate[OUT] * in_samples / pair->rate[IN];
+	out_length = (out_samples - ASRC_OUTPUT_LAST_SAMPLE) * out_width * channels;
+
+	return out_length;
+}
+
+static int fsl_asrc_m2m_get_maxburst(u8 dir, struct fsl_asrc_pair *pair)
+{
+	struct fsl_asrc *asrc = pair->asrc;
+	struct fsl_asrc_priv *asrc_priv = asrc->private;
+	int wml = (dir == IN) ? ASRC_M2M_INPUTFIFO_WML : ASRC_M2M_OUTPUTFIFO_WML;
+
+	if (!asrc_priv->soc->use_edma)
+		return wml * pair->channels;
+	else
+		return 1;
+}
+
+static int fsl_asrc_m2m_get_cap(struct fsl_asrc_m2m_cap *cap)
+{
+	cap->fmt_in = FSL_ASRC_FORMATS;
+	cap->fmt_out = FSL_ASRC_FORMATS | SNDRV_PCM_FMTBIT_S8;
+
+	cap->rate_in = supported_asrc_rate;
+	cap->rate_in_count = ARRAY_SIZE(supported_asrc_rate);
+	cap->rate_out = supported_asrc_rate;
+	cap->rate_out_count = ARRAY_SIZE(supported_asrc_rate);
+	cap->chan_min = 1;
+	cap->chan_max = 10;
+
+	return 0;
+}
+
+static int fsl_asrc_m2m_pair_resume(struct fsl_asrc_pair *pair)
+{
+	struct fsl_asrc *asrc = pair->asrc;
+	int i;
+
+	for (i = 0; i < pair->channels * 4; i++)
+		regmap_write(asrc->regmap, REG_ASRDI(pair->index), 0);
+
+	pair->first_convert = 1;
+	return 0;
+}
+
 static int fsl_asrc_runtime_resume(struct device *dev);
 static int fsl_asrc_runtime_suspend(struct device *dev);
 
@@ -1147,6 +1280,15 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 	asrc->get_fifo_addr = fsl_asrc_get_fifo_addr;
 	asrc->pair_priv_size = sizeof(struct fsl_asrc_pair_priv);
 
+	asrc->m2m_prepare = fsl_asrc_m2m_prepare;
+	asrc->m2m_start = fsl_asrc_m2m_start;
+	asrc->m2m_stop = fsl_asrc_m2m_stop;
+	asrc->get_output_fifo_size = fsl_asrc_get_output_fifo_size;
+	asrc->m2m_calc_out_len = fsl_asrc_m2m_calc_out_len;
+	asrc->m2m_get_maxburst = fsl_asrc_m2m_get_maxburst;
+	asrc->m2m_pair_resume = fsl_asrc_m2m_pair_resume;
+	asrc->m2m_get_cap = fsl_asrc_m2m_get_cap;
+
 	if (of_device_is_compatible(np, "fsl,imx35-asrc")) {
 		asrc_priv->clk_map[IN] = input_clk_map_imx35;
 		asrc_priv->clk_map[OUT] = output_clk_map_imx35;
diff --git a/sound/soc/fsl/fsl_asrc.h b/sound/soc/fsl/fsl_asrc.h
index 86d2422ad606..1c492eb237f5 100644
--- a/sound/soc/fsl/fsl_asrc.h
+++ b/sound/soc/fsl/fsl_asrc.h
@@ -12,6 +12,8 @@
 
 #include  "fsl_asrc_common.h"
 
+#define ASRC_M2M_INPUTFIFO_WML		0x4
+#define ASRC_M2M_OUTPUTFIFO_WML		0x2
 #define ASRC_DMA_BUFFER_NUM		2
 #define ASRC_INPUTFIFO_THRESHOLD	32
 #define ASRC_OUTPUTFIFO_THRESHOLD	32
diff --git a/sound/soc/fsl/fsl_asrc_common.h b/sound/soc/fsl/fsl_asrc_common.h
index 7e1c13ca37f1..3bdd6ea07c09 100644
--- a/sound/soc/fsl/fsl_asrc_common.h
+++ b/sound/soc/fsl/fsl_asrc_common.h
@@ -21,6 +21,26 @@ enum asrc_pair_index {
 
 #define PAIR_CTX_NUM  0x4
 
+/**
+ * struct fsl_asrc_m2m_cap - capability data
+ * @fmt_in: input sample format
+ * @fmt_out: output sample format
+ * @chan_min: minimum channel number
+ * @chan_max: maximum channel number
+ * @rate_in: minimum rate
+ * @rate_out: maximum rete
+ */
+struct fsl_asrc_m2m_cap {
+	u64 fmt_in;
+	u64 fmt_out;
+	int chan_min;
+	int chan_max;
+	const unsigned int *rate_in;
+	int rate_in_count;
+	const unsigned int *rate_out;
+	int rate_out_count;
+};
+
 /**
  * fsl_asrc_pair: ASRC Pair common data
  *
@@ -34,6 +54,13 @@ enum asrc_pair_index {
  * @pos: hardware pointer position
  * @req_dma_chan: flag to release dev_to_dev chan
  * @private: pair private area
+ * @complete: dma task complete
+ * @sample_format: format of m2m
+ * @rate: rate of m2m
+ * @buf_len: buffer length of m2m
+ * @dma_buffer: buffer pointers
+ * @first_convert: start of conversion
+ * @ratio_mod: ratio modification
  */
 struct fsl_asrc_pair {
 	struct fsl_asrc *asrc;
@@ -49,6 +76,15 @@ struct fsl_asrc_pair {
 	bool req_dma_chan;
 
 	void *private;
+
+	/* used for m2m */
+	struct completion complete[2];
+	snd_pcm_format_t sample_format[2];
+	unsigned int rate[2];
+	unsigned int buf_len[2];
+	struct snd_dma_buffer dma_buffer[2];
+	unsigned int first_convert;
+	unsigned int ratio_mod;
 };
 
 /**
@@ -72,6 +108,17 @@ struct fsl_asrc_pair {
  * @request_pair: function pointer
  * @release_pair: function pointer
  * @get_fifo_addr: function pointer
+ * @m2m_get_cap: function pointer
+ * @m2m_prepare: function pointer
+ * @m2m_start: function pointer
+ * @m2m_unprepare: function pointer
+ * @m2m_stop: function pointer
+ * @m2m_calc_out_len: function pointer
+ * @m2m_get_maxburst: function pointer
+ * @m2m_pair_suspend: function pointer
+ * @m2m_pair_resume: function pointer
+ * @m2m_set_ratio_mod: function pointer
+ * @get_output_fifo_size: function pointer
  * @pair_priv_size: size of pair private struct.
  * @private: private data structure
  */
@@ -97,6 +144,20 @@ struct fsl_asrc {
 	int (*request_pair)(int channels, struct fsl_asrc_pair *pair);
 	void (*release_pair)(struct fsl_asrc_pair *pair);
 	int (*get_fifo_addr)(u8 dir, enum asrc_pair_index index);
+	int (*m2m_get_cap)(struct fsl_asrc_m2m_cap *cap);
+
+	int (*m2m_prepare)(struct fsl_asrc_pair *pair);
+	int (*m2m_start)(struct fsl_asrc_pair *pair);
+	int (*m2m_unprepare)(struct fsl_asrc_pair *pair);
+	int (*m2m_stop)(struct fsl_asrc_pair *pair);
+
+	int (*m2m_calc_out_len)(struct fsl_asrc_pair *pair, int input_buffer_length);
+	int (*m2m_get_maxburst)(u8 dir, struct fsl_asrc_pair *pair);
+	int (*m2m_pair_suspend)(struct fsl_asrc_pair *pair);
+	int (*m2m_pair_resume)(struct fsl_asrc_pair *pair);
+	int (*m2m_set_ratio_mod)(struct fsl_asrc_pair *pair, int val);
+
+	unsigned int (*get_output_fifo_size)(struct fsl_asrc_pair *pair);
 	size_t pair_priv_size;
 
 	void *private;
-- 
2.34.1

