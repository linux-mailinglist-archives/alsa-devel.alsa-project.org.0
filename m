Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E86889E84E
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Apr 2024 04:55:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84FDE279F;
	Wed, 10 Apr 2024 04:55:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84FDE279F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712717736;
	bh=qH13Ftlaq9rVNZ6ulpcIp77m/IuziSCn9cBYUl59wmE=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=oGBVYnPJKEhRRd7CvzQDmBXNNs8hzEtOvZ+1RwggXPb01KuiF1wJbaxOAijrVPkka
	 de1GtaVGuHr1dI61TEnhIyMb+qo3/snAxzseUUxucFhC4YptW8s0rGmAuXBMDdlozY
	 PfyskwK9/wUYbHNKMuvRAR33Ke83Cy5xVQIPmS4E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8785EF8058C; Wed, 10 Apr 2024 04:55:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DC85EF8059F;
	Wed, 10 Apr 2024 04:55:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A3CC9F8026D; Wed, 10 Apr 2024 04:54:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.3 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazlp170100000.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 30070F8013D
	for <alsa-devel@alsa-project.org>; Wed, 10 Apr 2024 04:54:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30070F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=J9Vyv385
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AdbHpWmLQKsl6T4ZbM3W394x94ASla0BQ00DI55sVTF6d6SRcPGfbELIj6eqzfRRAq2ADFTXDB2Ugt4zmDGiWJlhQOZeZ0b1cp5p3Vh/I+wURf60sBxzNyw2tSq3zAAvOxC3M1tTT/Zq6hfjZNOGkZStrFOEDPa5rcV+mi0RmCNOAt4LFU8Rx1Qh5kbZ1l20ZldcrJy87yr1pKPra7GhBwIV5HNqPfkOsQLZLTQ3AXpIWBg+Vk+EUaETf/mIX3d8ICOZqg9DpxA3Uk+78eRwwKlYPiOo/i/TtChuo7e2fh0V9L7WB45LoEnOyeXcwh7S4W/hRxXF6i3NfNFcUp/+6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jc6EOoI7fARVp1qIqZRW3W+VK2vRt1EXj/GMYioEYxM=;
 b=QsuItWPV35HApVCEXOcXicx5zq5XGptAYZ1nHDOV/LdrNe0vC9KVr0ppTynzF0VJCv6oDdvWNMLlO5jCyCGvlJ0rlGcTgA8g4kcI8YVccrITcFm7i7ir/Z/DFlQ6oI0CJsVSDXGlzNX2aUguGws/ST77XwFBhjTlMvmSEwqG0mdOywSYG6x+zwMN9fy6IhXpaoQptTWQ76GUakmpOxX/ujpM4T0UgA/sgSOCfnQJ3qA+RnrSNMenzk50Iy/SWE/zK5J7iEl1H2467clHCg+sVjOtlcvf/1wSIK2txzx4fJTt49DpwWR5LeavmeRgRCEQPV/DixG3lQtY7AnmwzyALA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jc6EOoI7fARVp1qIqZRW3W+VK2vRt1EXj/GMYioEYxM=;
 b=J9Vyv385dW2yRh0kq52gGz2afDrabPK9GtyWLQ2RlG1Phs0IyoZe/JYLh06kGg4QuujmyKojUiBRapWxQTdaoSYJkiT3vHfeFoB5HqDiLd8gF22CbKoq+s4s2oknsjGHkKPjvRenXU0eKJ1aRldipunwY/zRT8Qj5fjhcIJXoaM=
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB9483.jpnprd01.prod.outlook.com
 (2603:1096:604:1c8::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.55; Wed, 10 Apr
 2024 02:54:20 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7386.025; Wed, 10 Apr 2024
 02:54:20 +0000
Message-ID: <87msq2kjvo.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: =?ISO-8859-2?Q?=22Amadeusz_S=B3awi=F1ski=22?=
 <amadeuszx.slawinski@linux.intel.com>, Jerome Brunet
 <jbrunet@baylibre.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2.5] ASoC: Replace dpcm_playback/capture to
 playback/capture_assertion
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 10 Apr 2024 02:54:20 +0000
X-ClientProxiedBy: TYCP286CA0302.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::14) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB9483:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/x5caxzJSLylo5HA1tug15/0kaPI1y+EPIb1OAr9ERP3s6ywwOKQsPjGbr7cBh6Oma3EL6SxEMryAfib7CkUutdZSpFiyRniR98n+OwqSLDJGY5GVHTcKIsQSTKoazQK+bC9lPFy/FWh4vc9Z7IBuCkhnpEI9i8h26vSTW5yGmOq6VS+5nWoclF+Apu1DQF7/7rrUuaZx+o4/HLHMR1+7L8CDmKcjGMd1ZvRtBCstLzUFqgCKO5SBBcYHrZQT73HEleJ/DwYXqt3Cxz1W+C2PkxWTXUOrJBZHIz3kyXnFT0VUWLZCuWSCH12iQPbQOutMErbmxJe94s+Tc1EtrgMfcbbWuPHW2+JZh883HrbZED1XW5lfft+1uYSO2okErOziSgU+V+PDp57eqIoDL1GPnqMhUfRT+yneXYf/HsoIlrWl7RtFOOYc9fVfylLG3HZ8QTUfEqY6sYxQT4SaEkJHLWFh2KTjNo6BVvMrIMBM7uL0/RbgZD3ULDFQz3wBVpQZ+VhF8JRBVBc9HznNbs2puGzjdmoA2PCgHqfdMdUqsdlzTQy/WW25NML8AxBbVqzB4J65LfVdUB3PvOcvqGrCrACB/A5OCNXja+xGR+u4JTr2d16ZGlJ5C6uYsHjHCj8vVDE8VKSY4e2VglYZlcEaUivzIIljrNFrDxj6xkYVS0MtbVYQwi0hyINEIKu71UHml65kOF1ARCBipuIssfGqxt9JKybDC7qR9s+IhTOHIw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(52116005)(366007)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?CPPf6chZ/UzdrzeZReuD9xfkzw3U99Jy7F0/Lww9Rc0BERqU6N33FdSzo//Y?=
 =?us-ascii?Q?LpDM3xf/fJjhZJ8C3e6HoP3cQRRoPHp/IsTg0TgwDQ6mm0WQYBWChLtph1ab?=
 =?us-ascii?Q?OpxfG18+4MELHctS3v4tEKD0Zc89vq46Vf/w9dNbpnNSZOIMF4fd9ei0Gc/C?=
 =?us-ascii?Q?r+5U409SuXfUXxKB0WvcD5yHoBuZFO4O9tD+oH5NqZ7IDF/V0QdBqqFCVIA6?=
 =?us-ascii?Q?65d0Iz3OdUhWlPra3aCCOqAiBcTot3lRfFyql9zUm7reRJSucbGZNOLzijDR?=
 =?us-ascii?Q?pgv0G+IVRtz2THHesL6f0EHLVQwXDQBLk4HWCrAHDtk/eJCKlv2qVz31ZCEu?=
 =?us-ascii?Q?fAkszzkpU7CN0KvDCrx26ogfbNZ0nj/ytY3vshQ2uLAhxT+UtsSeSQsWRc/P?=
 =?us-ascii?Q?Haj3Dbp70Jamogf6JfmxOcpblxJfD7OP4cSc3l2ANCFMLv+iDk8JOmlTFFxY?=
 =?us-ascii?Q?Xo/wr+8EtFLdjPvtjkCvUZ43KRJUenezak4c/jTzI+78clqmJgmxhM5nFAZI?=
 =?us-ascii?Q?wpqyYZriGeQwgy28IfRXtOY+lj3+aM3Rhfdc2sQY0ts+LDhEP0cD35Nkgu30?=
 =?us-ascii?Q?9jpRNfmtU5zil98DGQ/Glvn4euOvQyoNQsoWKiZh1GacYBG5fMwQTZcId9uS?=
 =?us-ascii?Q?kNU3AaXEB3njl+jrhXtyf0dEB6FuoMVFu4n9gcjO90C0VkMF7KuttrAaoe1e?=
 =?us-ascii?Q?01fb11LVBSq3lNPyPo93Ejk1M4FbVZc1+e7dszQByntlyUXQe0OOPhiYCqzY?=
 =?us-ascii?Q?JIwUCm4PCRVMrQqsJecLCPxw5jHpixyDT1sy4fL8T9o4ngRh+IfYFsnY6/HP?=
 =?us-ascii?Q?fjret/6FpUm92wfBIwyWDWtciCgtaA4u8yZAYYJDdLi/ii3RunFGX1jh8zwP?=
 =?us-ascii?Q?0Hl2VKq3cPPmDbfQwltSErNpMyZsW95cGpQbA6spo9u2y1zPDgWTRFeL1CM5?=
 =?us-ascii?Q?5ZbnaOsORE6NAZV6NgJKUwNrcFcQZH/ZUjBr6vA9dNWXCz/TfrpoLBWkdOu/?=
 =?us-ascii?Q?X2MekoKto9QyZasdhq8F7VkAr4ptflMV6z+dqnZRvo9f3C5Vd7du2F1KzzN+?=
 =?us-ascii?Q?8MFLLCnhnIoLE1xYG8NrdsykrZ9QJBA7Ow9Ft+H6ex4WsJ+uSu9axa9F0lPF?=
 =?us-ascii?Q?W1rD3/ip8iz8f4s4dm9IT39QyLGsrCJX0YHRjzvZ554OcJXxngMnNpK6Rob9?=
 =?us-ascii?Q?EE4vqdTcvWb8sA7BmIWx+Y2zgpfDzI44cn62Ny/Nn4GCB6XDOpalFcGtt0pU?=
 =?us-ascii?Q?CULOZr9+eVfxLfv3wguKzHygJESpXE49WRjkRUlzl+gsurIPu/FsI09q0BEU?=
 =?us-ascii?Q?X+chUCumX1alouKJ4u+aCGfMHOvUyTO4MAf37XrLtWJxneDAkl1zk2CM6vpp?=
 =?us-ascii?Q?LHdXZwha2Z0TODJ0qt7q1Q8t72R12ZZziw1RemdqZzLz8Atpc5W4WibujjxY?=
 =?us-ascii?Q?pL/prqwo7Lgzu7G6V9ygkQpizf9E7Vbozb9kIBnkujzkrIJb2zCY2X4ONiQz?=
 =?us-ascii?Q?ENQuJBVPL+V1oemXpEonLVYOHvWUKMs7u3+0gSD3TN/y8fDXAgNVSavaYDkr?=
 =?us-ascii?Q?SGeZ7rMAWczIhtrmO8BN2qKGw99Vih3EJtEjzwPZQ8jIURGHqshVZENIDVBT?=
 =?us-ascii?Q?CAtwnxoOMEbrmlcyPwDiH/M=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6a1bec31-642c-4ac6-183d-08dc5909851f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 02:54:20.5078
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 S0+Ir0mt/C4QD7D/dDx3+dHZyop/V51fDsPoK1rPSxBi76cRrIVShNf37jeIETn+PhF/hQ1x7+PbI/DU9gfaLfZZ2s1cicQqru8cd+j8SebYYGEwrwu4aWNGPaJ2bOdE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9483
Message-ID-Hash: JQSXKB4M5BTQTBRZZLRG2XIM7GU57Z6E
X-Message-ID-Hash: JQSXKB4M5BTQTBRZZLRG2XIM7GU57Z6E
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JQSXKB4M5BTQTBRZZLRG2XIM7GU57Z6E/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Mark, Amadeusz, Jerome, Pierre-Louis

This is v2.5 patch which is preparation for v3.
Because full-patch-set has over 20 patches, to avoid posting huge
patch-bomb, I try to post main patch only for preparation.

In v2.5, it will use xxx_assertion flag, and exising dpcm_xxx
and xxx_only flags will be converted to it. I think it can keep
compatibility and possible to indicate link error same as before
which was conserned by Pierre-Louis. Please let me know if it still
not good match.

One of my big consern is Amadeusz/Jerome's idea which uses "XXX | YYY"
style. To avoid confusion, let's name each style as below here.

[Flag style]
	unsigned int flags;
	#define SND_SOC_FLAGS_ASSERTION_PLAYBACK	BIT(x)
	#define SND_SOC_FLAGS_ASSERTION_CAPTURE		BIT(x)
	...

[BitField style]
	unsigned int playback_assertion:1;
	unsigned int capture_assertion:1;
	...

This v2.5 patch is using [BitField style] and I think it is not a big
problem from "code point of view", but I think [Flag style] is
better for "human understandable point of view", because we can define like
below, for example.

	#define SND_SOC_FLAGS_AVAILABLE_PLAYBACK			/* no flag is needed */
	#define SND_SOC_FLAGS_AVAILABLE_PLAYBACK_WITH_ASSERTION		SND_SOC_FLAGS_ASSERTION_PLAYBACK
	#define SND_SOC_FLAGS_AVAILABLE_CAPTURE				/* no flag is needed */
	#define SND_SOC_FLAGS_AVAILABLE_CAPTURE_WITH_ASSERTION		SND_SOC_FLAGS_ASSERTION_CAPTURE
	#define SND_SOC_FLAGS_AVAILABLE_BIDIRECTIONAL			/* no flag is needed */
	#define SND_SOC_FLAGS_AVAILABLE_BIDIRECTIONAL_WITH_ASSERTION	(SND_SOC_FLAGS_ASSERTION_PLAYBACK | SND_SOC_FLAGS_ASSERTION_CAPTURE)
	#define SND_SOC_FLAGS_AVAILABLE_PLAYBACK_ONLY			SND_SOC_FLAGS_ASSERTION_PLAYBACK
	#define SND_SOC_FLAGS_AVAILABLE_CAPTURE_ONLY		 	SND_SOC_FLAGS_ASSERTION_CAPTURE

Switch to [Flag style] is OK for me, but one consern is that in such
case, people will wonder "why ASoC is using both [Flag style] and
[BitField style] in the same time ?", because we are using
[BitField style] for other flags.

So, my suggestion is that next v3 patch uses [Flag style].
And after that, post new patch-set to switch
[BitField style] to [Flag style] for other flags.
But I wonder is this good approach ?

v2 -> v2.5
	- use xxx_assertion flag
	- dpcm_xxx -> xxx_assertion
	- xxx_only -> xxx_assertion
	- only [01/xx] patch

v1 -> v2
	- based on latest ASoC branch
	- keep comment on Intel
	- tidyup patch title
	- tidyup DPCM BE warning output condition
	- Add new patch for Document

Link: https://lore.kernel.org/r/87o7b353of.wl-kuninori.morimoto.gx@renesas.com
Link: https://lore.kernel.org/r/87zfuesz8y.wl-kuninori.morimoto.gx@renesas.com

Thank you for your help !!

Best regards
---
Renesas Electronics
Ph.D. Kuninori Morimoto
