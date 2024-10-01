Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8170598B1DD
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2024 03:42:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD8C6DE5;
	Tue,  1 Oct 2024 03:42:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD8C6DE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727746962;
	bh=SoqlRvpT8A97YD5/DxkECQEKegqskxT3GPls9mmMcwY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fpzynhf9BKA4pYyy3MnPDax16ZACA0qRi37wQgoJCgUuEptmoex3Ju37VhhT4/qAs
	 oPRpvaR26ujvcr7pV3nO0mn5f44c/qCSheVCgSc7ldA5mVgSt4cWkBGK/2QTJ+TM+g
	 T7L8roCsoxHnXQ9IShRaA8L8AvU3tJ0MSzEe2bXc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 59ECAF80618; Tue,  1 Oct 2024 03:41:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7013CF8060E;
	Tue,  1 Oct 2024 03:41:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 765CEF805EE; Tue,  1 Oct 2024 03:41:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c406::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 63E5DF805A9
	for <alsa-devel@alsa-project.org>; Tue,  1 Oct 2024 03:41:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63E5DF805A9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=QzkSXwsi
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nDevqb3WODISOjg06bI76NgHVYdwJnTZG4VBhnDCePdmpgw/+CsgLNAYMqkPU21BBF2pF1HqfAdvmoi/wuQ/7FFHbs0ZoVhaSsIxQ63Bn26E+OX3cyLhCtHvWDrNEmcGtCUsl/auZGqTiEzTiRslxhXecBWkfLfswlQqcSvSKLTN0mIuze1JkUy1k0L1s01SazgJ2gLvaEAJA0dWjehQExE1Ng9pwvi6wyfRj7ajzn86BDOEQcHdb9Dm4jOd275JswyuRjm8HO25Bht7pRkWevF+q64NWcvTKRinUS8b5qELAEPc+lkfdlbxBOlde6nz/qYbgC362bez0XHik5JXvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sWb24QbYDUDRkY8Vom8ra7HaFz9I46gMxQASpY9/BTU=;
 b=nNTDHkyu67oGQL0BtworEFvIUq49/z4CwMvn55pRRZB4aWSYHLXMbhqXoPR7t+llks8gDI++HtqAt7syrf1rULrrZyJuR5uBq7ipTzpKGRSAQs7WNiN+hybGLEu7MMd2tpTKLj+0Wv8mOmyWqCb74RMchNiMRHnrUVngED5YQGOBfpVR+i/Jn34LTqZceG3X1LjDZJi4IgvJGbhMrVXrmIaKPLpTCGf8IkGHbB3XcGRVzPK6vR6EUBPdqgO1CStmE/hlTbCSmBMv7A30ZZvAQT2Bsfn/fGzpw5zPaqv13XHzyC4EX8qua7L/vpnCDqZWRJSzgOBNaqy+PPZf8M4aWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sWb24QbYDUDRkY8Vom8ra7HaFz9I46gMxQASpY9/BTU=;
 b=QzkSXwsi378ez6l9BXXmM0PR7W5/A9vPluRywM1WIcvdqRLfOjZMzaC8NNYwZDLvWdGkt3groYc79doiJdTmz91xK18gQDA/jmJt/SozWQopo4fE60juz23u3f+ZDWDOG0veQ0qfAsl1Il3mvcnBeatnVyukTvCWgXkXfzxueSE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB13482.jpnprd01.prod.outlook.com
 (2603:1096:604:334::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.27; Tue, 1 Oct
 2024 01:41:32 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8005.026; Tue, 1 Oct 2024
 01:41:32 +0000
Message-ID: <87ttdwvbub.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 03/13] ASoC: sof: remove dpcm_xxx flags
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <87y138vbv7.wl-kuninori.morimoto.gx@renesas.com>
References: <87y138vbv7.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 1 Oct 2024 01:41:32 +0000
X-ClientProxiedBy: TYCP301CA0081.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7b::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB13482:EE_
X-MS-Office365-Filtering-Correlation-Id: 145857f0-d41f-485d-e610-08dce1ba2d84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?NxNKv88bAA1pU828TlmGnS+xeppV/Y/IaLMJ4Xx1XBxKYVy0hXjB9Xx/kr8l?=
 =?us-ascii?Q?NH2myM8FB3uI3iOrWkO9HX/t90OhwBIWwOEZdfPcKH5R56SPUWc95Ot0Mkiy?=
 =?us-ascii?Q?GvBtsaC5h1jJwCwRasQJABmHh2kvQX8nKfKfuyoNGqNg9OTTNpWucr6nmpB8?=
 =?us-ascii?Q?vSv59p49eDy7ck/6FKuTTjjQGvi/9nmNQuN0y4eUbHLQo/0e5xTdOn7aMdfN?=
 =?us-ascii?Q?lxHJ1D5pdvxxCTd4k1XqYQ4Q8pAJjVQjIs+ZEoXJFtfPw2X77HxOpjs3v61H?=
 =?us-ascii?Q?PjUU64pr8fKSbJJ9effj3TVXaiFODQAR3QlCijTC/OkhigdSv8xHZQtawyfM?=
 =?us-ascii?Q?zAlEI29n2/Ck8sifYv4fyHeDz0kprB09yIXTWVAx0x/eXvZDtam6+WweC0vp?=
 =?us-ascii?Q?pxSbP369UZWM0HIBGbvM2mDIwwKg6B7+guC4U+QoxAtzrimFTGfNElXyj/63?=
 =?us-ascii?Q?Ky7zYxSeRa6fFHrWE2LO1cFOlHcSQ6EQCZeCltpzkkdWcQ/YWTTYul251hW1?=
 =?us-ascii?Q?KosBt64ep48Pn5RVWiW2I9mqX1l09Y+8AjlhzLHSc6H/jNbhYDLNIc/jWGxZ?=
 =?us-ascii?Q?kLlprxko8mJm0aZyhxJfZX/eFXXkZon+zFUEefUKsZpiOYeN4Nn1d3msGwto?=
 =?us-ascii?Q?hGMp6JKFK9fjsVmwYKEhFOcaken8s/pW5Zutuq5+YRer+nk3xG2M8ZpDVKl0?=
 =?us-ascii?Q?k0fDL0DmkL57Ja+k0eAbOrrEUmulrLYZf5iEtrCfhcunZNa0cH90BR+fXFhY?=
 =?us-ascii?Q?UYrQjZTbkRaUUF6XnKutPf+YjNlMEUTRan646tewdPk3GkN2N4e4U99/lzp7?=
 =?us-ascii?Q?tOUHYrttR0+O399yKMVVnxkWzHLODJF8vb9pbB9Ut3ByiRMJvknltRZhlPUB?=
 =?us-ascii?Q?SRgt7ZBrrsXSTF21Nc6Reswodcbw9fXDelKmthFzuEb0DW+SYLbx//FhvFcM?=
 =?us-ascii?Q?bdEOTKnqYYZVW0+IILV6305ik/U5T/p8BYX2H+iJ+s+LF83jZ0eiMeTFMgtD?=
 =?us-ascii?Q?6KGHHKQgyVkv+KdtDUUFvcZXbi0V5Xbz0+7ocnSLwgWmTHsQ7yYdp0KqDKOf?=
 =?us-ascii?Q?+m59nHKf0iqijakUB1u0F9uojIx8zj10fyLsCflQr/HRFzTgOXzM5nD0o3xU?=
 =?us-ascii?Q?8vECj211VhlZW3eGfAiOyEsbAoMususLPm147ETyQNeD7FrL5ptn24wyAjXl?=
 =?us-ascii?Q?nLRv7gXTC8YyvtnlKa7aj0mZMuiY7ls1zf6AlSKvYHZEQjedeZ2HR6xiDIY/?=
 =?us-ascii?Q?FdqTzurqMV3xTsTPHAzrkTIIsWgc5b7ZY175FXn1arO3hFlB7ycao8Ls7byN?=
 =?us-ascii?Q?IPyNZVzh+hCK95WfR5coYhQgeNISDhmM5m72bJaRLu8rAQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?7lnlXo88jyiz9Ub9RLc9k2fKDgyatwQMbqy6h63cRod/ngZgb3xs898D3wN2?=
 =?us-ascii?Q?pQlbhiDMFpCjtILcNFT5CP4POY+k0V++ZFZgBI4PhoEeW/omLeXm4SqAOlz0?=
 =?us-ascii?Q?e2JrXi3xwGQ3jqZjlSc3D8JxGdrwws4Fxuf0J0pJDG0udJVahMUKU+8TyrLX?=
 =?us-ascii?Q?/Agt28pPD7M8RPqbC1M0piw1htaVu/wV2EuNr2qQw8SeXXpY5tb6u1yxrNKZ?=
 =?us-ascii?Q?EaWdoHmjG1IAaYM6VtQjLxsYyVDHwIprmm9B10nPxzNgujhnbVipLme0q6nT?=
 =?us-ascii?Q?GHENQNYZK+wfLdb3bq4aWa3NOXa99FH+Z/s3YcqSnW+3LMbabhKvLvt1FqcH?=
 =?us-ascii?Q?igX/5FEzDOgCe1VURDwF1p6Slkkk7JjiEpQuXHrDu4msJ2hg7MjskmgL/DRv?=
 =?us-ascii?Q?G1/vwrwSp559KYg7ItHTl9BTXcEdakxx04hjtturOJwhLUNhkTOMINGl/hHV?=
 =?us-ascii?Q?+A9ZmnOqxMRm9v5NJ2pPz3kcmhjPt+D5jVqXmSQGoxKJW8/hQQJtHbk0q+qv?=
 =?us-ascii?Q?iDTfbOgxMloAzXMEfOJ5qBuDQvdgMQc+F7fQB6VFlvz0KeKnCd6hJLctNR37?=
 =?us-ascii?Q?ib7sOcrzSBVuLdPijTqI5eGG5cDfFFXARqr4ejrsJhF8SQRt8ZG3ZdoOmjWj?=
 =?us-ascii?Q?WPsop/6FgIiyK8fqlE+1JFTRNEzQfEfOXkxIyOgXO4ZAeotpn+8MV0987NsA?=
 =?us-ascii?Q?KSsfzt/zE7CRmHOdUO9eAB0DjEQu7n57+CoQ5md6IspqHuVSeJXsrjNObibq?=
 =?us-ascii?Q?iobR9lF5E6SCgDCEixM3BzrzsgQak65bezPUZNdXof9LSHeOnUKhqkfWipWV?=
 =?us-ascii?Q?pp5USybh3+Sq6Gnk/cW8hdbVIjCCmKtbxaRakclRfs9wL0qiHoC8B28jt3Ys?=
 =?us-ascii?Q?KEDvqa77a0Yx8spBIGP5GjjhOvodyoH6EGGyzmEQu1tjMtGq+Da4c6z9DIHJ?=
 =?us-ascii?Q?J8B8wrAT3hNPRV31KD5QsnNuo384UovcgqaYs/1qJnbMLVOaRU/62to5HYUf?=
 =?us-ascii?Q?4TwbCCtXUpZZnj3XAumFqWza1j2DXDF2L8GRoLxA6atYlLUJBKCG5NkK/e+w?=
 =?us-ascii?Q?b+x0RGNLrd5l9+2ab3QwqBSNWQPxi2IW2/LwQhWNz1YPZUxfsxV69f35DwhL?=
 =?us-ascii?Q?BZa+dOTWBFtRsQJMd4tjSfp/HH9zi7++JZIfI71OVxHA1nf70pLlPCiZ4Hzi?=
 =?us-ascii?Q?oj4Nm43lDsKp6klzPrUCthVcx9BvJ8re1n1aE1SPxRymik8TCxQKy+rupUNF?=
 =?us-ascii?Q?Os5tbTNm2pXpGcOK1POkOIlWz7nCS7D1qbVYO/9MR/MLFzREhalmJL5nVOer?=
 =?us-ascii?Q?WagUdKgSTsV6+eeU+brunNdWn4ncaollJ6Xh/PXcQ/8Gnzcy1458zvnEmU2b?=
 =?us-ascii?Q?Bu9Mj2SiR1J2iyDnPJhqFsHTXqac/oIYb83k/FyxUZr+MFgozHXJ36l+wIgb?=
 =?us-ascii?Q?5FKBnX2185odWPyEsbvQ2mfg1CbGwoLZsVO0BCUmH5DCpkFaooLuxtG7RKo/?=
 =?us-ascii?Q?GR1W24BA5+13f3BLOsvYz8PMVYysSIEABI/A1oAPOuy5BpdMKrHNA2YEQkhq?=
 =?us-ascii?Q?FgObFLtjW/PLBCODqwYYjA8OX3ZC+dM7NCtopz3Gbr0jJ3YtYng2OvtMym57?=
 =?us-ascii?Q?xYhV7yFju1dr2gOxuN4Tfgw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 145857f0-d41f-485d-e610-08dce1ba2d84
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2024 01:41:32.4219
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 1q1WzRQSn6i9kns3jviA3qA2OquATzzvisLOat6wySqbVMMw7HsZRDhcb3gAyMpflQygvXeHHQrXV6S92hbWBT69qjS6LqtuN5ylglHHlhOwv5n8yvS5S/gJvI5UVhtU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13482
Message-ID-Hash: TROBBWDRUGZLKVZECUO4SZJL7YBO2HKA
X-Message-ID-Hash: TROBBWDRUGZLKVZECUO4SZJL7YBO2HKA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TROBBWDRUGZLKVZECUO4SZJL7YBO2HKA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

dpcm_xxx flags are no longer needed. It converts dpcm_xxx flag to
xxx_only if needed.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/sof/nocodec.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/nocodec.c b/sound/soc/sof/nocodec.c
index b12b3d865ae3..c0c906a78eba 100644
--- a/sound/soc/sof/nocodec.c
+++ b/sound/soc/sof/nocodec.c
@@ -55,10 +55,9 @@ static int sof_nocodec_bes_setup(struct device *dev,
 		links[i].no_pcm = 1;
 		links[i].cpus->dai_name = drv[i].name;
 		links[i].platforms->name = dev_name(dev->parent);
-		if (drv[i].playback.channels_min)
-			links[i].dpcm_playback = 1;
-		if (drv[i].capture.channels_min)
-			links[i].dpcm_capture = 1;
+
+		links[i].playback_only =  drv[i].playback.channels_min && !drv[i].capture.channels_min;
+		links[i].capture_only  = !drv[i].playback.channels_min &&  drv[i].capture.channels_min;
 
 		links[i].be_hw_params_fixup = sof_pcm_dai_link_fixup;
 	}
-- 
2.43.0

