Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E946C69EF03
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Feb 2023 07:58:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ABC32E86;
	Wed, 22 Feb 2023 07:57:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ABC32E86
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677049114;
	bh=0imb45mPGwRmCoHXACN7jlkQis0feA4V256D9iEP4rU=;
	h=From:Subject:To:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=szyyASPypK7+jXEt2MlCwNX17G2fKvFgPhnsuzjQVkadZYSVyjj9s+aWzAwwrqPI9
	 lCxTfmFp4O4Cb3RsNxKjxDHwHhk0yk0R6HU11v+X2VPt1pCRvfmGwTE45FxN9077qu
	 8CeFdYLl9QXgUmn1bh0dZerc08Z14xLJ30k30FYA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 930ACF8025A;
	Wed, 22 Feb 2023 07:57:43 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8A77CF80266; Wed, 22 Feb 2023 07:56:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2070b.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::70b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 65CF0F80083
	for <alsa-devel@alsa-project.org>; Wed, 22 Feb 2023 07:56:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65CF0F80083
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=mK9wUx6g
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XwCPb23zE39q7iWKHEsqMeh8Zhg+oIBjBaF5Bg42jzHCM5MslglPhF/8yMvW421rpOccsAzWw/ZJcySO/A7zgTWKhKSk71dPq20WT0Ogni4pQupXH2xUW0ybkwpRSsDVQeBIE330lFoY5KdU2DgJPm5A3hawrlIK9j7twK3cg/wSTUnl1xk7+utMya017sZGA5B04MaTAFqNbl8AWpypyuoPCoNPD5AfTOg4QZtXy7AUrv8fz2GnLVlQpwh0h/Vg+Sl6Su0Y+BQFr8TF8GHunUH70NyJcvv/afS596DaH2mndy1untcP0z64zMn8DhtJC5/MicAslbRMmWQ6mS6lcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6z3zPCGS+sW0Cb5jceYdTbbNnp56ffDoT2ypiwMeIz0=;
 b=Xuz0umIFY938R9LlMzcBOwHZwQEvCKe9vNkd5c0MsEZslqlKQSg5uQGm6Amja1Zaz4XEaum7OU9CUZtSBBWvHqvDOy27QRKA16u3wYBdOizsR568zjfTxkCTAnriQJ+yS1yIzhftaftdq88cozpcKIwSH5Jo5NqsUtKttmqcUMmyr54RbDPmL4UGyQvTE7692OrgoBXAVCeKWaAwzPwG+Lg21xsLSYOiLvncbkQq4F9bWmVQYZiRkujbkMCsaXNfkeglW+1Qvy8TLA2RJwXT7JO71eUu8Ij0bKglLfv1LAgjHt7m6qaSQMQMVls05/k9too2AAD1Tu3IYKvMLf3sfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6z3zPCGS+sW0Cb5jceYdTbbNnp56ffDoT2ypiwMeIz0=;
 b=mK9wUx6gLPjbGM2mxAibt6io+U3268hcdDQJbvNzfIMB5Ydv/kcR77QNn/UJd7MHoCued4p1rTQ5z/zH+2Yqo5WhXUmC2kjrB/oG4xo9nzTpeDlAlZqfX0ke55vYm7qsyaQE/S8maeU0tz7EFFkBVvV/CtLLKY2vCNyZYsCzHpk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB8892.jpnprd01.prod.outlook.com (2603:1096:604:17d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19; Wed, 22 Feb
 2023 06:56:15 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e03e:1938:695b:f472]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e03e:1938:695b:f472%5]) with mapi id 15.20.6134.018; Wed, 22 Feb 2023
 06:56:15 +0000
Message-ID: <875ybuqjcg.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 0/2] ASoC: cppcheck fixups
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 22 Feb 2023 06:56:15 +0000
X-ClientProxiedBy: TYAPR01CA0100.jpnprd01.prod.outlook.com
 (2603:1096:404:2a::16) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB8892:EE_
X-MS-Office365-Filtering-Correlation-Id: ce51610c-8092-47db-ca3f-08db14a1e45d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	IhfqSKPkrlhxRhHxDiI1NqrsqIAMbrel52Jdnyk1mTY0HhgbdhagYemWouQurhWEaXHrdJRjNSEsm+nKxCFyJ5zY/OhHGkGPLY1Vmp1knRmRZTN3P6TwFosbBW7393EZTptM+HS8dqg0c8/cww/kjhp0RTFisHlHU7rec3shKZxXsVcJvifhaqoqbF+wTl9iAX5IZ8RtJm2IPJQPorZLAZ4GQvEhrXrUiMJ6qIjmZq23/77hW/PTBq5cDko72jNFOTT2ABRBDQcRvkGblG24DzVXd46/yIaME//C7R8TFfmFQkjDeeeuy3d/k2qdukMRd3ThgIf8xxW0Wb6NIT9UV/q1/pMWbJkGZs7h7LtX3yuG0mlfVzzgYbvvH3zDBHBSzrAh78uqx7z2GFVm5k6Lri/RxklygKiatqAZe/OD+1PPWZEPuluw6foIXv2B84CR/M6r6Zkk5uzCO3dnS/KQ9BfJJctxjSksaG//D252+sHPO9vfl15rxoiVKq99+IGV0/hQes9yIdX3CC8QlR4rDALDe1yp9Ktqi94BOCWjhZk/+aSCIrWip3VOt3nlNaKmSpYQrbLXBDDQ8IXGyVLd4RAF0/ZO80oBSvnV6FMY/r4J7XMiqDL6h9eerqOq5yqH+St/IW7zJtnphwWvMuCQ1b3dqXS3jEPqZKF5+kzuyiW39xnzCDl2PcktlNrcnJbSfoGyfE9fX11Kqg7RjmlMQw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(396003)(376002)(346002)(136003)(39860400002)(451199018)(5660300002)(54906003)(8936002)(2906002)(41300700001)(2616005)(6486002)(52116002)(316002)(4326008)(6916009)(6512007)(478600001)(8676002)(66946007)(26005)(186003)(6506007)(66556008)(66476007)(38100700002)(38350700002)(86362001)(36756003)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?PcAcaa4NxMa8W8O2x+ki/Tyq/UmNqy2Z7HAPqKKXuytT2pB76p9IJ90wt3VX?=
 =?us-ascii?Q?DWUTDyDP8x7o2XitBy+ciyEOjmfI+0z4chsnGJWF4GiV8zIlUdyIpdaNMlzJ?=
 =?us-ascii?Q?hek6/8ogbGes47wT+2eWBWI7uT2LIMcY3hkcMghGVrJRpPjikvjtqp6OZR9Z?=
 =?us-ascii?Q?au6z+Szlv0l18dXL8e28c206X160xrsb77t9c32d/Ve+EWuFOdOV9BmA7Dtg?=
 =?us-ascii?Q?e08yMo/ILr/BEhfspfMd3Ul6dbSbeCuZhJK+TQaRf2mjY1WyQYUHi0/djh6M?=
 =?us-ascii?Q?9Fuh6VOYSdLHLYmQWilI2RA9xA9y+D1NthBK8Wxk8gPqo+RE1a9LbkBoLk8E?=
 =?us-ascii?Q?zfVAYMTPNrMzL5OftUxow71huIMmLi3MaoKkJzIR9JJM8U7izzZ/2inJ44VL?=
 =?us-ascii?Q?kgJxJtofwhFIQS6V3NByxhZvTVi6C6bLlI4Vg6hz9Euje7aux06L+YqFlMPE?=
 =?us-ascii?Q?g0Z1oc7iZEstYulygXC46CbEhg6JlDOaSLy5cpddIs3T2FyZ+08e39G0FAdR?=
 =?us-ascii?Q?QY4MVinpjw4HDO2cWqB+hz6Qqt9E/7Hijt73LLd9HxhoaQz+n5jpgdyDjeUj?=
 =?us-ascii?Q?yD3p2D2Uhu63NDOFbuPgkqFK6tN6UlCRlN3Jkwn4Uc7lhaVMj7sRXxEpLK2z?=
 =?us-ascii?Q?IfTA0VeKjjm1LDGDNkwlS8HFZzylmFGm6faxr9OOgCrXV14FIqQKHAKZcbPg?=
 =?us-ascii?Q?zweC+nbC08rG6dYTK6Y1/VNv6tKQiX42ZvTC7tQwg5gLvcTlyY4+uLrrvd4s?=
 =?us-ascii?Q?1o6+lDRcF7o481N4747D/bPxoSpgEKvojIKTRxWVvoiLzIW1J5VLwp64m9ul?=
 =?us-ascii?Q?Nha/t/Zmepp7CD2j7dDno4qojSiO8d5TEha0C4I6MJrPDjR/9voHW6wC5ErO?=
 =?us-ascii?Q?PUkauxtt71roiUgh7ADlE5hgDp5m3n8a9E+zkB8ExohQcp7HeE2jwRKMDQib?=
 =?us-ascii?Q?m55f6/TJIEtHak9RvkIl2jr+QcRvgWTZ/v75eBRHmkuFR4g3ysnLw6W7v/Nl?=
 =?us-ascii?Q?UgxLw6/bjDeKCwD6Ufqdh8tg9ou2toQvFxDUEHS/Emn6ZPI/V/kozTKYhb7u?=
 =?us-ascii?Q?FzAN1X+wTI3eh1Kma/7YRtV5o4sNE/YEhyXBe2EZcx8EwFPk6I5w3m/c5Of2?=
 =?us-ascii?Q?0RLZAjFBe+83oIBCLwvBuIpl+R1LMN9Op8QKz+1VB33vz3wjEuC/zB2gq8KV?=
 =?us-ascii?Q?wQgThA/ENpk0pqCcoWOxxQKBXknrUZyS6Q5WVpbEaE/w5x2iL/+RGRSxAfFS?=
 =?us-ascii?Q?ozp3u3CLLUZEh1ePLAie11U0w/GfNYejhJ01imVvhP1iasDg+GWD6w8Fzngv?=
 =?us-ascii?Q?ThVrC7lcWPZD3RP0GPA5pHEUHeAFzgfE2/+H4gs6EeMeklR4hMhSPWLB7aUK?=
 =?us-ascii?Q?4uyOVFuN3PNDxWYG6XoGYgPJAhC6PIag2Hv3sF45gWOSYPnK2StOgVxmE5z+?=
 =?us-ascii?Q?/oe3brx42KaQ3P7tO4KSAxS5QWBQ7mQVqm9nuDBP9f/pVg321hpncPttX+PK?=
 =?us-ascii?Q?eGDPZkLkCm1WNqkXrfcm6HGFhztpTDvFDuNN6B1X8XJEL4NgEf7HTtRBOSyg?=
 =?us-ascii?Q?D5ykehiSu6Iim/knOl1SWB0+D/aqxj1Qtyj+M2u6E/7SebfkZAO9njXlipYG?=
 =?us-ascii?Q?dOriqVokkYMBHftXyBHLEio=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ce51610c-8092-47db-ca3f-08db14a1e45d
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2023 06:56:15.7792
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 /5iko5XPTozfpbNgpel61yk5khzxKIZNzTjzOtHRhaR7HfKLOWyEZZkd4B5MgMldnmDg0BgtoRIiF0Q3zmUSCLju8j4lw8iyMSD7AhmYrekaa//Zhp3DkwAHGtWJ9nk6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8892
Message-ID-Hash: XMFAJ4BMIUUV5B6AYWX3BJTWMGZH7H2R
X-Message-ID-Hash: XMFAJ4BMIUUV5B6AYWX3BJTWMGZH7H2R
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Linux-ALSA <alsa-devel@alsa-project.org>, Takashi Iwai <tiwai@suse.de>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XMFAJ4BMIUUV5B6AYWX3BJTWMGZH7H2R/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Mark
Cc Takashi

This patch-set fixes the issues which is reported by cppcheck.

 sound/pci/asihpi/hpi6205.c   | 2 +-
 sound/pci/hda/patch_ca0132.c | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

It still reports about sound/pci/ice1712/wm8766.c (A)
that there is a case that "val2" might be used with uninitialized.
But I'm not sure what is the good solution for it.
So, I can do is only

Reported-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

	static int snd_wm8766_ctl_get(struct snd_kcontrol *kcontrol,
					  struct snd_ctl_elem_value *ucontrol)
	{
		struct snd_wm8766 *wm = snd_kcontrol_chip(kcontrol);
		int n = kcontrol->private_value;
		u16 val1, val2;

		if (wm->ctl[n].get)
			wm->ctl[n].get(wm, &val1, &val2);
		else {
			val1 = wm->regs[wm->ctl[n].reg1] & wm->ctl[n].mask1;
			val1 >>= __ffs(wm->ctl[n].mask1);
			if (wm->ctl[n].flags & WM8766_FLAG_STEREO) {
				val2 = wm->regs[wm->ctl[n].reg2] & wm->ctl[n].mask2;
				val2 >>= __ffs(wm->ctl[n].mask2);
				if (wm->ctl[n].flags & WM8766_FLAG_VOL_UPDATE)
					val2 &= ~WM8766_VOL_UPDATE;
			}
		}
		if (wm->ctl[n].flags & WM8766_FLAG_INVERT) {
			val1 = wm->ctl[n].max - (val1 - wm->ctl[n].min);
			if (wm->ctl[n].flags & WM8766_FLAG_STEREO)
(A)				val2 = wm->ctl[n].max - (val2 - wm->ctl[n].min);
		}                                        ^^^^
		ucontrol->value.integer.value[0] = val1;
		if (wm->ctl[n].flags & WM8766_FLAG_STEREO)
			ucontrol->value.integer.value[1] = val2;

		return 0;
	}


--
2.25.1

