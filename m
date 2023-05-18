Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D42EE7079CF
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 07:49:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1356A207;
	Thu, 18 May 2023 07:48:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1356A207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684388959;
	bh=MNhuZK0iNKGVkmtNQShhu8WMqtBQCgOI1M1H2nXNLvA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=o9LmFYOTMtQe3ND+kDXuuB3HH259vnEqTNSl1g+GfX862+uu4lHo7TC3hEzrdtsVU
	 CAfFLlLtYh6LZBsjc85PWkXXCw7yWe2RwMk9tXqPsVCp+WkjIImiJjHQwDJ0uwlVlm
	 a5LNnaejtitBo3LEtueX7hrwegZQ2uvKs1Wrat7o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4A029F805B6; Thu, 18 May 2023 07:47:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B8A15F805AF;
	Thu, 18 May 2023 07:47:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 73F4BF8057D; Thu, 18 May 2023 07:47:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20731.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::731])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4CEA2F80580
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 07:47:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4CEA2F80580
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=MET3RUjp
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KH/kVrnVd+MXE8KyOLrEuRGhxpHSlcizZvCv8hvZKf0iPc5ZbMK4CNJNsJnMTwiorTQF2ze2AAviF3yRfAUFL4EDeeqv+ACG+Ekz7JEAavyBH8Xpv7po1nZbQ7UM0bx2tMIqhnZyGF3Mr7mx19sKWAEfBg+fE85nUUnfU7x/04xdyRczdjW3p1kHcbTSdhKEmbrbc7wTDsEL+OsiUvlg4hWOs7NQSbJ9tXtEire9wOZamafrsTChDbGdwtm5WGAl8Lxlp64jFF6qvfZunuqDZJb5vMLg+TVETnOk3mNjibqQ3dlhKJtpV3Q+4xVZHlfJL/vAo+dRMqX5J+LhkCakkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PayZ0K5c3awKsZGIHI74qO75JWMp3PlYmTuDQ8ndc7M=;
 b=c/TUHSSEzQQnFOyuaCH+Adhm1mDx1ouWkLsAz8FESD3e2dYpFtzSGgkQ38kBTk6XKSxpc13NYefIG2SxwbFYwpdKtJlnSJGLO1oAQdYqxhJ2JGqk2wvOuFdO+f/XDbbazR/Lb/Zwk7WvZ1rr77Ipz4+EUGD+7hGcSCupSdo0F8lNOwJHJrZWBUt9hcXtBRKtyoOpvln6kEtfaIXGhMH74X3JyBES5DswzdCeB8mMEWuvWGdyNSMSseCIDha0/xcbLUDSX98hokEMTTrD6jeAxKA5V7x8sa7iBjfr7Sxib3QRn/TPBaClb22AHVkbpYhzyRLnVkSpnRB9fif9mssvsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PayZ0K5c3awKsZGIHI74qO75JWMp3PlYmTuDQ8ndc7M=;
 b=MET3RUjpg5MT+dPphmtF42IijywykvXjo3uYmZJyvsD09/prtMGlTdmEEdzppjXw0vj7400KY0Khd96UTjSAj/2+e5c710BHQzkKLF+X7m3+oWiDFdersbAeLberDMM6rpPtbmtmMvV80pWagMbBVVdsRoGcbQS0gSzULhvH6H4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB5591.jpnprd01.prod.outlook.com (2603:1096:604:b5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.18; Thu, 18 May
 2023 05:47:12 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%6]) with mapi id 15.20.6411.018; Thu, 18 May 2023
 05:47:12 +0000
Message-ID: <87v8gqp4ww.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
In-Reply-To: <87353uqjiu.wl-kuninori.morimoto.gx@renesas.com>
References: <87353uqjiu.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 05/20] ASoC: soc-pcm.c: tidyup playback/capture_only at
 soc_get_playback_capture()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 18 May 2023 05:47:11 +0000
X-ClientProxiedBy: TYCP286CA0169.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::12) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB5591:EE_
X-MS-Office365-Filtering-Correlation-Id: 280f764e-7316-4d59-c098-08db576353a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	UQKrjXuj1PwziWk6n/qrhP+PdsOal2d8GbaFzR81XaeW51MxZIHKZdiH6WhqCWMLIEHGtQgfZsDiHmBTICjlIHTEwei0tdUu/Fi8FBn+A1oR4MA0EszX5qh581oaSQPwwAFdZlETHJk/YIWN6NmOKKo22HkX8na3Jzxx9v+Ep3Ff01DbLhcRBq18kNuRzpjfc8q8Qzcjhud1UWO5dw40I/AmOCtRcKeasR6wTCK0fdmodFnTmKVxT3VWmdBmyTeY3goiJ19/8N9pP9TwC2SVkyswgWFLNWrikQVTvYKvd8FD55u/IFBXNTYmWB1c3ejp+eazJcHRWKjCDkMB9+0Nld/WCA9Cpe1F0INs2re/gow+omdULWoBXY2qWX+bK71p+4c6WJ7lbm2D1J5pfp5CRrb/as9Fqb0N9ymoECkIIEIAxk+/qxP123ygQVq641vB7W/N53nVLAJZIiSKlWRWEIPJzFR+qEvekbOHxvpetaY2f4FygSTy3hf5ogUIPwzC23hJodOqG3ql8piFYhebVLY8BYxv+/TXNfWzifVXPokATn0A0wBBeEDzpZ2gVxwyz2EFXYA69iqUTX1fv2AemCH43+4VpJS+Lz+V+vg3GXYBgl5nsVXBpd9ODRleSl94
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(346002)(366004)(376002)(39860400002)(451199021)(316002)(4326008)(66946007)(66556008)(478600001)(66476007)(52116002)(110136005)(86362001)(36756003)(83380400001)(6506007)(26005)(6512007)(186003)(2616005)(41300700001)(6486002)(5660300002)(8676002)(8936002)(2906002)(38100700002)(38350700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?NQfg6J01rQnWGqOjmpwbsNs/jtYUwdBOL3ZPrxQQAy9hqbDx13TY72iWmmsp?=
 =?us-ascii?Q?zcWozxRPytLZ5cVFGSbG1P9SE/SBJJgsjqlbHwj7M7luNjxUDJ6vBD0eXsMW?=
 =?us-ascii?Q?ehD5+SnPdzF3fgjl0y/8FbqpnJSpaBmtAh1oVQ2wzBUAxwZ/EglZnkIoNN3i?=
 =?us-ascii?Q?lMkGQsIXcM31dE3QfpfV34h6N2s4i6CNaICS8wgcWQ1KZvUDk1zBWURU51hh?=
 =?us-ascii?Q?NN28AeiNwZ7+sLvcqgoEny/2nVtzh6tlAXfqvPo+cTc+fZ1hwvMX+NAgmWfE?=
 =?us-ascii?Q?H+3e5WsSY0owp3NTgsXa3HCM91pmtZpCUfnDWILyzgYHOXXEvj6yEcaDdUCO?=
 =?us-ascii?Q?ILYWInOwd3uXYCBsF+6lKmbJcNFX1UI5kvfuu+wK1TE7DuLp/yxEPLaGrTNk?=
 =?us-ascii?Q?VQABTWGUxrVlLRQDPA1SsHcy7MbsBZnTW/bW1wzKo+8lD9hWaN03fDFP2yCU?=
 =?us-ascii?Q?N0o6qUekwzN4wvxYVo4TjAjHD+Wcp2I3+eGqC7d0SK6qB2S2vFVvrVxQCojJ?=
 =?us-ascii?Q?K/EzsYc/mK8AH0QCWw69nfxOADJ/ZQVIo0aqKjmgd8G5AYZI2J8kkkRVi3tT?=
 =?us-ascii?Q?pq2Z1QCy/a6R5NSMfGOnVvHSo/o/Nn6QmAlLAUnqlgvAmzHCAwdI1d4yKeP4?=
 =?us-ascii?Q?QK7w1AlWB/cndyHjOMyR2NBkR9pSB2JTfjT/p6zaIWrnlmD8MD41rknyvEXI?=
 =?us-ascii?Q?t7IeN9KQVMEl212pnfNxp+0/955qklpTRUK5qsDLet03kjQgOZarXlxc1bOw?=
 =?us-ascii?Q?Zbe2np7hsIKkBzubVlUaSyst43PdjhBJNz8FOPFyQhUd2TyDUoGblY/LvZ8u?=
 =?us-ascii?Q?runMAasXtpo8LeuR8cBSxDKN7PHRKmQvE8OX+ovWYmB6AwXvRCTKVS0kp1Ot?=
 =?us-ascii?Q?WKuBJjKCcMZAI71l3wlejiJ21ncA8/W0FSIZYcdRQknhIb6w5WqxSa3C0T24?=
 =?us-ascii?Q?pxcenSvnGH1iYKVgG+O+9duQZH9B821HrN6YInGTroOeNy3FxO5+jd9LvG65?=
 =?us-ascii?Q?XfDYdDYcqfPjgORogAXFSxYwOs+CAdpRFBhb6NgFtXEBhwozIoYdOqgV2YDZ?=
 =?us-ascii?Q?awoV3fqNHDrRBNzidFBNSFMnBEXjd+/a6NUrSAWrlmkB6UGzKN084xR/AMtm?=
 =?us-ascii?Q?cC2ozo5TFRTNZYOswxsf635OfemDwyV8ofPfL6SXRucs4d3A6UmEJg3wS6gA?=
 =?us-ascii?Q?wV7lbHiTOJtrRBPjQYAErf5IfYR6wuSPacALq3erOHLCAyp1nNxhDgR49I1E?=
 =?us-ascii?Q?0gEJDPZfFJ6mZviCqUwZSjigOvSjLtOLUKJk2kNubJ9DJ7O0jykeQ9K6qivS?=
 =?us-ascii?Q?HhWB2BNMg/TvCm7BTKigqCSGuDk/5YOmiSzpEht7/qldtSTYXN1813wjprg2?=
 =?us-ascii?Q?LmnZSnDYIFraxiuk7Zd+1/8JHT3iDlvCFianTDN7HOP5E6zvYKY+dOQtFTE5?=
 =?us-ascii?Q?d2KILVg9U9CRossQQzvUPigMcDz7vRlsqGRx916H9BRj8Z6PDlfqVCycAPxo?=
 =?us-ascii?Q?u9DcVtg8kMLMtfkosKm7m1BFrhBMS1jx+st5CcEgNZZzfsBUp8KbnPxq5+vG?=
 =?us-ascii?Q?IjdUemXVNy6iM6pwjU6ocIWrnwFh0q1lpPTXRRS7cizSwOpHXKQq29Tm0/Cj?=
 =?us-ascii?Q?CRS0Yja/zbryMQduZMZJWaY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 280f764e-7316-4d59-c098-08db576353a5
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 05:47:12.0736
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 5cUaNM2ZqV/MKeeG21/nElk/GDf9j/HwT1IMRJa28woiOzxhqLykM1UVLZk4j9lU9JissMx/T7dPkM4nn2pzmhx24XznlvTPHsbN7yUPCceRbAIlQTAIqxsChGeZfZqD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5591
Message-ID-Hash: WZRSKYVICZUO4MURW7FXVCVQVA3RYA2I
X-Message-ID-Hash: WZRSKYVICZUO4MURW7FXVCVQVA3RYA2I
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WZRSKYVICZUO4MURW7FXVCVQVA3RYA2I/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

soc_get_playback_capture() (A) returns number of substreams for
playback/capture, and then, we can use playback/capture_only flag (X)(Y).

(A)     static int soc_get_playback_capture(...)
	{
		...
(X)		if (dai_link->playback_only) {
(*)			*playback = 1;
			*capture = 0;
		}

(Y)		if (dai_link->capture_only) {
			*playback = 0;
(*)			*capture = 1;
		}
		...
	}

But this flag should not have effect to opposite side stream (*).
This patch tidyup it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-pcm.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index c127ab9de61f..89416c127dca 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2807,15 +2807,11 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 		}
 	}
 
-	if (dai_link->playback_only) {
-		tmp_playback = 1;
+	if (dai_link->playback_only)
 		tmp_capture = 0;
-	}
 
-	if (dai_link->capture_only) {
+	if (dai_link->capture_only)
 		tmp_playback = 0;
-		tmp_capture = 1;
-	}
 
 	if (!tmp_playback && !tmp_capture) {
 		dev_err(rtd->dev, "substream %s has no playback, no capture\n",
-- 
2.25.1

