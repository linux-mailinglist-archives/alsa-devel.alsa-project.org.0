Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5806A79A100
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Sep 2023 03:42:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E989820;
	Mon, 11 Sep 2023 03:41:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E989820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694396555;
	bh=DQsHvm99QWat+9fitZIg0i0zescoAaiCMtVihVUnfyQ=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=oGrmmhhQLep++k9MQVWcioR2hp316Uozznw9xuzvUeBci0xFuhQbf5BAtjBg43oxj
	 oblfnm6b4FS/rYvNKdNgvrsLfrQKsLOChLZ+1VUWna6Emszcfy/W7MiMhDJdCa4Zwh
	 ifK59ECU2oXJJmMfFvHXFhoTPWQOfxK14v6DZupU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D80D9F80537; Mon, 11 Sep 2023 03:41:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8809FF80246;
	Mon, 11 Sep 2023 03:41:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3176BF80425; Mon, 11 Sep 2023 03:41:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-5.2 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20702.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::702])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 96C51F8007C
	for <alsa-devel@alsa-project.org>; Mon, 11 Sep 2023 03:41:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96C51F8007C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=XwhsRhlj
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=awIp2KZongmNuezssGGRHE+htv7IKTicnTMVVQNCMxfIsD4GNkm8eZ84gaKDqZzTBfPKLtHbfylSAIbBVKieHlKyCdGL7UYlC3O5taDW9BCMNoFEBgYo+KnllWyfi6mOkhfK4JJqxuWdnc1RCVSyJ7pQCdkdxZnYGo5acDrZPOWyHibzgXqaw47tuGmQV2VmqDq0KVnhq6BhXsNRO+YH+b/H1JXcgRNPNTw5WHmvKlKFRHej51lcfKEH29crPWOjeJ/fiJVlMFADNWfvZVTdbVek3rnFEVBJ2kCVKS60xBNDjT7N/Nm5JDzUQyEmYQssXs3orAsuh5D1a5YcIYUuVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yjzb1U5kMgMuRjTCFrD/2BSsGB+S3sHJ+0XYOhdKsbU=;
 b=CxkpbvbJNSHZGvlP/664GKFOP0ajrZfUZRzN+Qa1q40YtNcFSyAUj8UGz6Owk6GR3nvWWBPcKhwPXAGyZBmdmdcNvncjFqIhB6uWLPmvJwk9W6hunq5ox8ixr7cx0g5vQRLaPPBtAmrE0Cy4g+oWunyoE9Fdi7AECQwdImWEC0h1PwV3gwSt1aq0vupdCBRGlj8ghWa+tiPcvqN3nKn/qikBnaRMWkp+KXHYREBzhLxvUcETE2flcoDD7R9KfvYzIhyoWkJWm6IhQ2FJmOP26PeWia6TcQjiaeuVeYE9AqVGBDst9owKxleIOW+nRwrg4cwhD+LB8DTiQ4B9S0NUQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yjzb1U5kMgMuRjTCFrD/2BSsGB+S3sHJ+0XYOhdKsbU=;
 b=XwhsRhlj65A+SZAQHIV3A/Vo1sO98p+KnFDm8nUAL1wI2MC9McBobRvZ0P/65jzJqqxyR5yi36pp3Q2Xc4cFer0zZvpqltz+/hAGW46tH2kJtIDBZY5ZxSofuraMzcdroOPtDIT13P7t1zfxO4Srosi5kdXpE3UHbSJOb6MY6wA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS7PR01MB11516.jpnprd01.prod.outlook.com (2603:1096:604:246::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.34; Mon, 11 Sep
 2023 01:41:23 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d%6]) with mapi id 15.20.6768.029; Mon, 11 Sep 2023
 01:41:23 +0000
Message-ID: <871qf5ij0d.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Support Opensource <support.opensource@diasemi.com>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH 0/2] ASoC: da7213: add .auto_selectable_formats support
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 11 Sep 2023 01:41:23 +0000
X-ClientProxiedBy: TYXPR01CA0049.jpnprd01.prod.outlook.com
 (2603:1096:403:a::19) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS7PR01MB11516:EE_
X-MS-Office365-Filtering-Correlation-Id: c8d253b8-6f8f-4a30-9903-08dbb26834ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/1mMqfdVg+j5sp/UjlqE/lN1sp7aESEEgylFhMQEAIWFVSb7WppiQH9STHFEctbGITz4ljWYc7AxzA9DddBh1A/zKdkKnIoqZvyf4ykJseQ9SRGsQWTZA5Dmw9aNJ5K9sCC0rrBy6+BpvQDBPktPWGL+DJ1uJ7f4NXn+/WuWw4rdGrjIN4ddjcs0mNsTuACdAATzY9NfdtmD8+2i54fIRjw6SxEQHSWyjQZGHux/+WcRqveonLy5uI+cR+z6/Nix2J2U1LhCOqtkRwWiMjn63xtUVHdkhDuZhqZG+w+8SiFbGLKTBos2bEHYORP2AWYQI/7FwCJAv4wSkkz+xK61HkUUeSDij0Ny7bJtU9okjk/hWiuU6pVOszI0qrbJvMJpWkaig6PEc5nn+SL/IssKZiITq6lO35njt0M0vcZ2uoPwJvnUQzqKYh7/ZvdAkgvpH27PWQc+Qrt1/uoTVci+Y+1smTQA8zOPAaVxNCWKgetjFMXb35AH1PzIzMeh35r1E9MSk1ztiOqbMBawJ54ahPpdb5w0vImRAv287wVHRGyOg/Dipws01gLJ5sNoRuOw7XNnq8IFUp5mAow5NB+H+NzXeBhBqMvqMBCzmnMgd6Ii7mwbupcqCXOlcTgUvD1uxREXD17YfedStDLLDDxsD1c9oMHvAygWP8dAwhpwoWk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(376002)(136003)(39860400002)(396003)(1800799009)(186009)(451199024)(6506007)(52116002)(6486002)(6512007)(478600001)(83380400001)(26005)(2616005)(4744005)(2906002)(66476007)(66556008)(66946007)(110136005)(316002)(41300700001)(5660300002)(4326008)(8676002)(8936002)(86362001)(36756003)(38100700002)(38350700002)(142923001)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?oiDq8K9JZv49HwTx4f6jaWjKBo6HlVCzbxR9GwMSCIEIO3esN1BMflI9nUM+?=
 =?us-ascii?Q?uyEysXyGHocHtXWVfkqIUMs4e4rjCmISbZtZD6nYRLoSf4ro2XiO/9TJ/w94?=
 =?us-ascii?Q?zLusIF1Q8DSWONirGYEfbzoOkTEzzuDbbfA9onjBgwjVvBAJeh6jsKlW2gK2?=
 =?us-ascii?Q?DmUnomZgrn3CHDtS6fzhp/pjGKRLOZ7nDR19oLXQqc+3gt0e5mtI9ci0silR?=
 =?us-ascii?Q?GeesGXiGlAafxrdEp20j3nJRDyVU23fGAUYEJqb7ZUv3gftXGHz88G3naEY/?=
 =?us-ascii?Q?sPyaNbOeawM92jKqScu7eRF6DKEP54712dMqIqqzqLvkZSMWVeeA/dfzCJZy?=
 =?us-ascii?Q?RnmSofXWCDs9fhC7xNX4fcgAqPSuYCpMkcHulCeQk7evLvMpDpkQVlh9FTPr?=
 =?us-ascii?Q?43heoQNtnTW5tOt+5aEng3mi7srJqTirkjIdgzccNZ6/B63Zq/pmtwbgkK5X?=
 =?us-ascii?Q?SQepda0747mkME4lxCZ5Ex+rgEA3aCUlrBRrDnptBtcMqZ5f/yB6PMsmtK7j?=
 =?us-ascii?Q?hc7/zKMYW6glPn41vBWJawhEDQvRw+7LCBIKPynzRt6kXgPWPXRfKlY+Nx8D?=
 =?us-ascii?Q?oC1OkIjhSlNC2qnx3D/1+rGURTBToWEumEZ0rHQPhr2UI18hVkSCCt1ddHsE?=
 =?us-ascii?Q?DV9/dD69o4F/4lsUVL0X7MoEvc6FOucwcPpqFSn7tc0C0fOKLa0txtyHA4Rh?=
 =?us-ascii?Q?5Au0f+H2uWBYg6rHq6riuoZ+Nv7X5tfQoFwUrihoxiDzFz8Q5J0sBb7SNu1i?=
 =?us-ascii?Q?bcHKT0kssLZZVSyejdujetxqdJC2IzhRON5qRfWJvAxuMOENsegGIVUao/g+?=
 =?us-ascii?Q?PP5aoI4B9//4DfhDTod+LqU92eQW/gbw2RJQRET+uacw6OzxOoHwImWLwSiU?=
 =?us-ascii?Q?SpY4Dp93X9db8sfBG1JzZVsmMg3Tdsp8SX7eusghL084sHKPdfhzmHKqauY/?=
 =?us-ascii?Q?PYDCf9be6cEwq1pKKOXc3I9t+sh17nqzun239zbbsJ7beBcI5J3K0NficWYF?=
 =?us-ascii?Q?wqPTKCnKV8vLIYnHPeAGf9eKNg7Z51W6cd77TppJ80CFOy/9Cj8iyjTEfwTj?=
 =?us-ascii?Q?VeQMnioiKgh7AvHQMkHhK+VMvQgrR3OqOZnagxLI2kxDNxv9EguLKDtIJcqS?=
 =?us-ascii?Q?rLZTPtzGvhd+vArUs8veGc9dIhGEwzLfBzG1KYaYDXbbIlGiDxhxID74CzWt?=
 =?us-ascii?Q?y5GdoC6DPHqaN2FLEb7HlitsAFKV72Xe4f05MRTmKp2Wwl6w/OSwJsnJmhbP?=
 =?us-ascii?Q?vrrRioReqHwykJdy31yNrm2+5ghz9dDZIVR4+QwjHdH4mxYXt8UapvpIvSke?=
 =?us-ascii?Q?AjQy99sDGHh/zEYbCuDuZ9rHwKv03m3soBotSz9S+DZzO6i30x46NXYa6xIK?=
 =?us-ascii?Q?3xkvo8GYIh0oWFF1IhzvnGW39zSFRsMBCiKigw0EGB1r2YusAxibyxRpf5p5?=
 =?us-ascii?Q?vVClZdrDo+Env+gjYuX8dMBkM2Urb3iGfPtMFXiOHMA/gaIye4SUpFEFkPKJ?=
 =?us-ascii?Q?JX/UzSL+iom1CAgix83zbdP9IpuJfQ5tgje0PwAdsdBXKaTmixYgeXMY34Cb?=
 =?us-ascii?Q?YhGfTUrsInmiDFUj6+oxqiBEBJ01N5xfpgK96t9pxaS4MY+3TwrKDSZ13gMV?=
 =?us-ascii?Q?2b0rs7ksuwuTzRkCI3H8Epg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c8d253b8-6f8f-4a30-9903-08dbb26834ae
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 01:41:23.4325
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 U+5rdJQiIx10WMf0EGQNA8AfEJJQl6zPbS72Tnj+kPDyBMV/6roBcVtR/5KtjaEsfEhoOWRVLuxul84YPekc8C6tZ6XwDw7fWYLV1XC/JVvZJ+/IdsonlURuUFyzbreV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11516
Message-ID-Hash: DUKFNIVTG3JVNKKZGBQ4Y6KV4TZV6OXL
X-Message-ID-Hash: DUKFNIVTG3JVNKKZGBQ4Y6KV4TZV6OXL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DUKFNIVTG3JVNKKZGBQ4Y6KV4TZV6OXL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Mark

da7213 is still using M/S instead of P/C for SND_SOC_DAIFMT_CBx_CFx.
[PATCH 1/2] will update it.
[PATCH 2/2] will enable DAI format automatic select.

Kuninori Morimoto (2):
  ASoC: da7213: tidyup SND_SOC_DAIFMT_xxx
  ASoC: da7213: add .auto_selectable_formats support

 sound/soc/codecs/da7213.c | 30 ++++++++++++++++++++++++------
 1 file changed, 24 insertions(+), 6 deletions(-)

-- 
2.25.1

