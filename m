Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 343DD97A9C9
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Sep 2024 01:51:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3502DE0F;
	Tue, 17 Sep 2024 01:51:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3502DE0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726530694;
	bh=BdRZB+qCOzpVeK2mJVUGrN8+SHZworLAhuks1Ch9NBk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UXiPS8Tpufd2F+v7rfYuyg7H95FiU8r+ejNGwpOmil1k1yFKHSVnqNERo1fFb+W2K
	 r1zNfKBAM9UW8OGQHpBq9qj7v4lkmdzYNgDjhnUWN8veUVCVOq7MzqOk49+3NiuOhF
	 0BHbE0XB00Pv6p74U6XgjXHiIJggi5n5c7oPvKjQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 52BC2F80518; Tue, 17 Sep 2024 01:51:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B7CD3F805B1;
	Tue, 17 Sep 2024 01:51:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BA4F7F8020D; Tue, 17 Sep 2024 01:50:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazlp170110002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C7E07F8010B
	for <alsa-devel@alsa-project.org>; Tue, 17 Sep 2024 01:50:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7E07F8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=aY0rKAt1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BvxtNcOAo0kiXvP5FenE6mZYPvbMOwCeGvyvTp3+oXo/7vpfnRv/5UUr1SItnvzPvRJmfxPoJAXAe/BpDVAkJSC96br84qZMdAVMCfj/LR6sDurohYjRKilz6Gcf/7TRovjIyBT9ZInQl02c20OWm/NTh/jNl4G5m3hLrm/lwXriCfMaSUKMVA801Ow2l+TDdVKArco9cKOSThndG8MACXkv74afHAN55hhwHEAPk8nUGpLmUWvSSmvwgApsC5MgNBqo4wzHySZg80xdzMZ1baKlPTaWhwCEw6JQg6ntZDVeaCDZQ5jauoWszYGRTSMsCUtbmAJQIW2LoElZkU6s+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UvxmagutfZqx/jvEM1o7MWPWcOlFJw053cAPHJf3V3I=;
 b=e4ngKT4uMkeUckRId9LJI7FEIjSgaXOWNWrjqwLAROiMjhDt1sbs4j6mVlDlW4eGPaErOVNmT2yldyF8Fy0zWARds50xt+iIMKC6bjNihDStVGAsKoxE8jSRWC+2u9gWqEtlctzBINcb5+DvpN5TmSwu2DZflP8AUJX7P9rUMj08S1Q9zRNPnDmTjHAsGeKJTMUWDxhfbwNm6lj0wrwf53beyZgwUB98xZETQJM1z9xYUZB+5lNIndFktSN253UyooQ3432GXbsfgW2kl4MZk7DYIPwToW3g/GlX2uednqTLFqSXSXtB4lPknSIANQ2OM6/UiN5RATUazw7qZf5uSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UvxmagutfZqx/jvEM1o7MWPWcOlFJw053cAPHJf3V3I=;
 b=aY0rKAt1l+vB8+hr+B1Io/rsDPjYidHfXGmts+ZzmIPGYywIgSLmNtkzAQxi/FJ/oo/hLafPyXmKd+JeKN4mGHXQfibycFmMvwTrpeO8fjErJs2/7z0q84AJAnqj9qhjEvmr3cROEY+ywJl5R22y90IYaHl97KYvrcvExP7qGuw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB11796.jpnprd01.prod.outlook.com
 (2603:1096:400:370::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Mon, 16 Sep
 2024 23:50:45 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7962.022; Mon, 16 Sep 2024
 23:50:45 +0000
Message-ID: <87r09j6tuz.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Mark Brown <broonie@kernel.org>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	hdegoede@redhat.com
Subject: Re: [PATCH] [RFC] ASoC: Conditional PCM support
In-Reply-To: <67b30310-6fbc-4d1d-926b-f4cc7bf68896@linux.intel.com>
References: <20240821101816.1494541-1-cezary.rojewski@intel.com>
	<83f81553-6dfa-46a3-9ca2-d42f54295eb1@linux.intel.com>
	<d5db8a15-64c9-45be-8f8c-977fd5ed282b@intel.com>
	<2ac45376-5df6-44e9-83d6-cdea49eea916@sirena.org.uk>
	<b95e8c62-db61-4678-8c2d-2224dfb1dd60@intel.com>
	<67b30310-6fbc-4d1d-926b-f4cc7bf68896@linux.intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 16 Sep 2024 23:50:45 +0000
X-ClientProxiedBy: TYCP286CA0374.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB11796:EE_
X-MS-Office365-Filtering-Correlation-Id: 72cd11c0-ba58-431e-eec7-08dcd6aa61b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?eBVKghHqvNKZKv+zBwEyaBGegDyTH3RED4i3vIlmSebElYieByW7iEIuRye+?=
 =?us-ascii?Q?/U92oOK9nztZsz0D4VOtxitBn26Xc/+FQoDNxoU63IapHK6a7wuCrJBArkuH?=
 =?us-ascii?Q?EInjXT2SLdfvJuhjaAQK7RWpgtPzxSyv+nX7trgF64C+kT0nNI5eLmqpNDc/?=
 =?us-ascii?Q?+jZpSm02oVmOPFpEaucyo61zo4jW1TXLJDME9C+8W6jPB5hnp7s+N49a85eh?=
 =?us-ascii?Q?RYCRJX+sWR3z1bjBY6qCvC0/Bunpwyc0s3Vk510K92ZZO0t5cgJizibqezKl?=
 =?us-ascii?Q?iOR/mSmXbkoa6ZiThK6zXAGlpg1DIKzszbmgfrpQDGsazabzMbFtnNvoZr/1?=
 =?us-ascii?Q?9Fb9xgncpdE8CzG7fh7tf4CddlIVncpo3dxMsmlTO3+TzThjjqliN8PRx4fq?=
 =?us-ascii?Q?7baQhYVYvIgUIM7w4XhnE2JA4KgK/Z2sCpecAzs2yWZDzm46uayMQm8p25mX?=
 =?us-ascii?Q?QkdwJ0pYSyulkc2pArG1Oj/4jEoml+Ev2isVeKvwpVbhUjD6EAsiqAHMOktD?=
 =?us-ascii?Q?y/VgbTXF45/vZqNPW0Xa2xnE/ywzUKzFBDoonDxp8e++ff8Rqr4nqyoWQE5u?=
 =?us-ascii?Q?2IVrE3f9RmBdMsiKARIe5sx6Z0iHsRKCLAJZSdN39wgenZKoWQpZGs/rJvxF?=
 =?us-ascii?Q?2ubnzYoXkklXfc3sE7+bZ2OtvNjS4ywtC4ue5IXuJWUROc+ep8HcocHKNRud?=
 =?us-ascii?Q?WR43de7QHsCrioACX2hUsZf/ua1iKxF+uUDJsbbcBAx6TX3FIBNufqo9IOEA?=
 =?us-ascii?Q?8tGyitbBb25KKllR7eVLpktEFGlA/7zFYApXbUBjGrriJwX/sLa7ZOpwMHfO?=
 =?us-ascii?Q?xWQd0kxOZwXYS7Ky2wp1EXzb1XH4D98TilJLm0Qbv/VqxBtHFqrzI3JUaubW?=
 =?us-ascii?Q?Eeg1AxCAcJunU/gR+yITrNkvA1VpkpwAtB8FDAKWKqguwUEkbWYqk16LqZKK?=
 =?us-ascii?Q?Z4ecRCKyBmiks9v/WBb3HsFXw80Fkh/ohwtwmj7U2pkTdzFC+C7HkYX7WOo3?=
 =?us-ascii?Q?AoMapVEChpkDjE5eeS3VoLgV6DI3I2U/Sj0prFfyfWFvrs/5tT8lXUDBnlf4?=
 =?us-ascii?Q?8HSpOg5u9TQ9583sRnTuJc9eyLsRTG/NZqBMr906+onY3Tk0K0MD3HrYytay?=
 =?us-ascii?Q?WpxqC0LpzQf9P4iop816zLYStq4nRFdEYunhX6PwWnZxqjZ7Ds8viRkRRmXR?=
 =?us-ascii?Q?etjblQN/JZ2kfPS+IlJtarc+EzqVNLXjjccxmUcoTVjaR4WKBUzaAo2ZfRu/?=
 =?us-ascii?Q?CKi7iPQjhQQIDYDvqr+fcY8QFQh660WGqSeC4PWLp25qfXBulll4t2X9GCCW?=
 =?us-ascii?Q?ZwMFy88N3/e3m1bfDqf9eY30bkkb/ry6n5sNIjS1pX78k+jrzK1T+0dqHzwS?=
 =?us-ascii?Q?mSpLcWoNTiJ9FvpTiQF8XysMxYNk8quz9bHK6tQ72VtooDBseA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?pxNaxjFAaPM2AXQth0Xtf3qf82gFY/tigOBPhpbJgFAwx5ro4s6tki+Vxr7u?=
 =?us-ascii?Q?k3m3/7m64/zbW0QtwqDnzCmeC/kECSfgVvFYUnHNtAPemau3zBPRjqcRoKpU?=
 =?us-ascii?Q?BQmejLXKMl10AXPJp7z7MRw+2EsCjTJ20ZVV76eyXDMmiJOND2+V09vwuI+o?=
 =?us-ascii?Q?SMhEzY4MXBdG9d/KoQyDTyvRG1rtRWQgyvdyxh3m4/j9/qX8tsBYlzUdHKh7?=
 =?us-ascii?Q?uZDRfk/CKbee4AYIupRO7QKP+M+JKbkyQcM8PX8A7E05Yike9nO/jVVersNc?=
 =?us-ascii?Q?C3VbTP0BxLUME+QfVTb63874NEncOgobX0Py5hh83CHr4eMWbZYQPkfO81Q1?=
 =?us-ascii?Q?euLF9sbaTO3Bib4yVLNiM+SfbhP5eSr0dhA8W/z4gru6nhPgslPjzQyK1Kdg?=
 =?us-ascii?Q?nMCOyBdZ/nEa+xEwm7Dy7101Oi/k/1k2Sl+eielyHojMZCyQlIQ/G1h9uzsi?=
 =?us-ascii?Q?ixhg+eG0VRxwW7TJO5CiI1KgC3D1psV39P9B22g+OWousq2W6h+EkW2fo0pK?=
 =?us-ascii?Q?h79ePtYXqb2GiX+NgwdUnJiLtdAxXzVwM5BKQg9tnFUAJnPX4ZQlKL6cvB+0?=
 =?us-ascii?Q?lIbkcf//5Q5tSbrqj+/BTxuxzZDgw8HzK0suyMWxxoorYhc5CA8X7wVmBm1z?=
 =?us-ascii?Q?6ahS4wNeC+dPkFZzQuYxmp+FGB3dQloxBZYxZk2pJQIhxNVzjXF5a6BB22du?=
 =?us-ascii?Q?dqRUJ9u2pom5wCHmnc18FeQ56J44iy2+qOufF47eDlPmMDHhrGhTuFHXbEkr?=
 =?us-ascii?Q?t5btfFmVWTnKRJ9bRjqgawg++vRvoR5NHglr3ZRHJNJne23Tznmc3h9Qh7ZA?=
 =?us-ascii?Q?K1hfna0T1rGhuZU59fGIOIMedqmX7zbM5coDv+s4FYve/yExZ8XIHJUIIoqA?=
 =?us-ascii?Q?l4uon5AHc82fb47rkVQT37zkEMWfXR2mhJp7361lWiR9aueHoPREo7EHHE9U?=
 =?us-ascii?Q?TtwyxU6uQZyBKERbaQwH+kN/ht3G1k8LCsDCSJ9NGIkDt9GuFBa6ye5271Vn?=
 =?us-ascii?Q?GDmCfVRPSMrrWcPthL/bRbjnC4g9XYizo54/5C5ItqQtzVQqwqw/hYgkql87?=
 =?us-ascii?Q?d9/uRcedYN5hDeVhLCpVQEMrgbvOpVp/Y5t0xcPB4E7E+1ilGtF5Z/pfYTu+?=
 =?us-ascii?Q?XDUPgTKzMSzPzQvBfTk+yCfUnaKqxysD26R4TGVRjf2ZdBmMzrwy/x702Hdz?=
 =?us-ascii?Q?y+fj9RRpg7Yg5VqOAeGeoQrF1s6g3u2SFzrnOkqs0VClcStj9401abgLjT9Z?=
 =?us-ascii?Q?29/wibfs/DBlHorYOvKxBEol4F7XSpuhIJ2vsJCJN8nvgPEZHR9eprLOzkHI?=
 =?us-ascii?Q?lS/yhIgw4lDO9/MjRGyaTUK1wnITNCFWhzylL7z1Hu36WBKuREWoPe/sfWNU?=
 =?us-ascii?Q?P/m7kQt7fvlthYfbPHJMs06f5OccrOdJgs+vW7ykEjpZjv9vXqQHAnGEvmlb?=
 =?us-ascii?Q?hRtsAj7zLR+BEdmihwt7s7vRCx/AqFZCBmeVfkCx0NjqV1cCieRiO84BJZPm?=
 =?us-ascii?Q?Hst2IBMVAtIjcod+CQFqZbeuIDFjj1J+50DKe+ZBqmJ19diAPz3TzxokXoRM?=
 =?us-ascii?Q?oWt5Q35CB15B7GpR7v/iPvgsiUxARwuE0n4a/A0M7PGFe+os4/VNlWpSSWCy?=
 =?us-ascii?Q?XyGgM2fdJsj1lAVteigZHww=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 72cd11c0-ba58-431e-eec7-08dcd6aa61b9
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2024 23:50:45.2950
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 +ODSJ+/oVSBJ7MDnmQyD1qlQ+0HdRc+5oraZeszdF9ChIVPi5AfZXUjnB3AygAsaKf7HHTo7JcBRcedaPH91ZiqSvbPQogs5Uz1mgjj/JwvzjVvzOjCy2OW3+mjKwIHE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11796
Message-ID-Hash: Q5F5WTX57J2LWUPP6YGBMOOVWBX7TALZ
X-Message-ID-Hash: Q5F5WTX57J2LWUPP6YGBMOOVWBX7TALZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q5F5WTX57J2LWUPP6YGBMOOVWBX7TALZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi

> > From my experience when it comes to redesigning/rewriting entire
> > project, the "upgrade an already running train" strategy does not work,
> > so I'd not recommend that.
> > 
> > Instead, I'd suggest to have a second, separate DPCM implementation
> > present next to the existing one and have users opt in during a so-
> > called deprecation period of the existing one. Once certain amount of
> > time passes, switch all of them. Clean slide also makes it easier for a
> > developer to be creative.
> > 
> > Do you view the second option as viable?
> 
> Classic problem without a good solution. In practice new features or
> corrections get added to the 'old' framework and the new one is not used
> by anyone just yet so it keeps running behind in terms of
> features/maturity. And due to limited validation resources or limited
> access to a wide variety of hardware, no one is quite ready to enable
> the new framework on 'old' platforms because that would break quite a
> few devices.
> 
> The other problem is that the 'switch' would mean a compatible solution,
> but the problem is to get rid of the very notion of front- and
> back-ends. Existing users of DPCM have undocumented hard-coded
> dependencies on the order in which callbacks are handled, it's not easy
> at all to change the routing engine.

I can agree that upgrading existing framework is not good idea.

My Idea is push exising "old" framework as v1, and create new framework as
v2. We can use both version in the same time. And we can add more new
version in the future (if needed).

I think we can use "${LINUX}/sound/soc/generic/test-component.c" to test
v2 framework which is dummy CPU/Codec. Everyone can use and test it without
HW. We already using it as Audio-Graph-Card2 sample.
(${LINUX}/sound/soc/generic/audio-graph-card2-custom-sample.dtsi)

Thank you for your help !!

Best regards
---
Kuninori Morimoto
