Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 011527104DC
	for <lists+alsa-devel@lfdr.de>; Thu, 25 May 2023 06:57:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ABB5184B;
	Thu, 25 May 2023 06:56:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ABB5184B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684990618;
	bh=X3jrfTcX9sZ0mJfA334R2cRnau6nF+rMqe41lrrJZG4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QycH2tRpWHOd5/Yb4X0i80A5N++QcFxfoDMSqCL2uTVPjVTKrve+qO1zkibGRDA1M
	 Ggo63rm914n+7ly9N+Q2HYb4GctB4xb7UgPfimkb4ni29+qaL6Kp0AoJlrtrYuIXGO
	 wyFIw+ioJ7NfdXPKFar3pYuqf/HgiJEWCEQDTBD0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 30C94F805B6; Thu, 25 May 2023 03:17:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E4C29F805B3;
	Thu, 25 May 2023 03:17:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 50AAAF805B4; Thu, 25 May 2023 03:17:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20720.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::720])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BA2DAF805B1
	for <alsa-devel@alsa-project.org>; Thu, 25 May 2023 03:17:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA2DAF805B1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=iGBjJ1Xn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IUihALbc7gDF8OUQ6j0Ezvo5/+OFj0nCXU5OqUwYp4d2etnC0Qp3qk8mfBIzL6+Lf6FIgwoadBfSEmXd1swCGXui+BCfUpI+CpQJPrAerL9gXD1Q0ZDfNX0Ob1lIvXpEjqZVDYbhy5E5Chl6/FPBuE1rqj2w306PSfmnQbBUquNpHq51j1+7DNOlrp8woJuTUNJd5MldrKI+euOKVzplydFox+jTbLhdFkC0C4MBMXN9NWP/7FVtYXg3YtN+ZupyIGFfp/+OaKK5LcxiNg3Q2NGD1xoFBlNqcAn6SjiBp0RrhAvf0mdQMp1+z7moSId824LuyK+c5EVMlS4qyYJgdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DcGT3aG4jCHW0zmifrgnFgdO6mu9JHx+TpmKcWKAM7A=;
 b=lmNRnZ4RFP/ishwDZtlK6aqG/QFYNu4pB6x3DzvMN00rVNHHanWhamg1xLtEfkdQKQyJKJ170O8l0RR/rTqZv8JfB9eOuMrrigCfg2ZtXfxtKlD2tO1QpyfvGh+khn4X6RsmJM48leZ4fiMdj/Ezfx5CU83zKpW9esRijklLOmNDLRoa4SxP1Af1rzUnXTqZf7+7794YwN7B8Q/okuhoN3jRViOUg0J6KpLHksa8FOdZjkGeAhhH9dXqlK2KhHYaCYy6tWhvUOWdVjqiY6g5jDCUB2aqnocAqAkJRF4oA1PrCbMyIhFIZWvBwlejkJdXOglLeXbN5VCu6yBIqBctfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DcGT3aG4jCHW0zmifrgnFgdO6mu9JHx+TpmKcWKAM7A=;
 b=iGBjJ1Xno9EIWaVt20r6zYJxKJwaEGUgBiA0lcSgle3KsOa4mAfubehA4q+63JCDfzv6zSIjo5vfh28CyLhZn++ZgiW/eY+5KjwWyJryj1IUd1u/7KdBVQB4vfIXQmBo92C9jynau4yzMTQ5Y0ASTvzmeqsn0E7t/516OIp06zs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com (2603:1096:400:15d::5)
 by TYCPR01MB8485.jpnprd01.prod.outlook.com (2603:1096:400:156::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Thu, 25 May
 2023 01:17:38 +0000
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::6c36:5ff9:24c9:e4f7]) by TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::6c36:5ff9:24c9:e4f7%6]) with mapi id 15.20.6433.016; Thu, 25 May 2023
 01:17:38 +0000
Message-ID: <87sfblgqfh.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 01/21] ASoC: soc-pcm.c: indicate error if stream has no
 playback no capture
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87ttw1gqgn.wl-kuninori.morimoto.gx@renesas.com>
References: <87ttw1gqgn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Thu, 25 May 2023 01:17:38 +0000
X-ClientProxiedBy: TYAPR01CA0099.jpnprd01.prod.outlook.com
 (2603:1096:404:2a::15) To TYCPR01MB8440.jpnprd01.prod.outlook.com
 (2603:1096:400:15d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB8440:EE_|TYCPR01MB8485:EE_
X-MS-Office365-Filtering-Correlation-Id: d619da73-95ef-4409-155b-08db5cbdd45f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Qg1cU34Qur41ha9CmdK6ijWIC3UAF0/9wQ26+QVzh8gGmbTJSQFO5tgjbiyPzUwpxtEWl/Dffa9xdNI8Xh2PDSv1XlbRiwAd4zgVJBXNAu6mSkCzJC/2VCVCn1IIh9/BhBv0JuIvT5GX5T+gm72Oaenq8DaXS8yTOPRIsVNUR1aQvzwzUM2lxm2t7OgzEggqg6Yw1X2mIuPY1LT/wWSDgeFsvQaWSpAqN1/I5h4AUYoIZigRheH9Ch+LxVBNRglol8aCKNXp9udAYZd8B2efv6lYuw5H6Qq0dILVp/M+GVrIGU1jwr5VYcaeLJpdSc3cDaaGqTEOWXLYV1BgrgIiVGrZOhy3C2NBFdKAuITKBibzpHDFAS/k8ope1l30HM5Ut7JQj/ZwIbQJheb5yS9Pu9Eobka+X9KOJyqKSwzTjKW5wVDj1eVNDwNeaxX1Wsdk89HofIXDLE9UmzWxCj5FFIcZPPk9LdzG/Uz3EHN6uH0uAuIb80WZ733xE0a6qhZInLsgvXb7AwXe0vqNlWdZQciaZqhfIKmQyri5XQZvHM1dSnYPDrhxd3jG2K90iHOjWxETa4fasLdRJ46699vUrG1wDd0mL4kUoA0DiR6rDKGHZccBQsC28Z12/NOqV0Rx
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB8440.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(376002)(39860400002)(366004)(346002)(451199021)(66574015)(4326008)(83380400001)(66556008)(52116002)(66476007)(66946007)(6486002)(110136005)(2616005)(6512007)(26005)(6506007)(186003)(86362001)(2906002)(478600001)(8676002)(8936002)(5660300002)(36756003)(38350700002)(41300700001)(38100700002)(316002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-8859-2?Q?HWfzAS3tXTgG6OqnZhXdD8ZhVoXWXEH97FgY47J5g3vWqdkVBmObIWsGs1?=
 =?iso-8859-2?Q?DrZxUJXUdvM9mqAOHu1j8hTpGoV712zoPgoNhv31ioeVYQpAdLz9dOLmwT?=
 =?iso-8859-2?Q?bReFFggInFHOqRx3E87S12CwOz0LnS0FKN83dg2k+tL8A3uiBvX8RtV1rg?=
 =?iso-8859-2?Q?MokeGaswsWVNifhfKpVqXZpRY9jkmPrE3Wthb+t/f3QFLOOdfe6Vt/6Cti?=
 =?iso-8859-2?Q?c5LhV7aHxsLWYCI7vipIxaYdHJltuKs97k0+HkgLPaqmqRJZsznT3GGmqB?=
 =?iso-8859-2?Q?G/b8n+K6QQrU2Ot1+RRk5c/9PMdWps03mQl8bGeeIIb60Enz/Ku2VCIKWN?=
 =?iso-8859-2?Q?9ycISb9iUjl4ojiCPgWfaMuc2KMKuF+DDjEW4HfvYQWOK2nFQsC5ZpNFvN?=
 =?iso-8859-2?Q?Ujhsi2+1uxzc7eQV3tkt6ErGSRAIE8PgLdy3X2owtK0v1W+Fhe+n3cPVQz?=
 =?iso-8859-2?Q?Q1KnrlL2rw32QWobMflFXJpspEeOteXG1QW1VF00uVioM8blQ8eVYFno7N?=
 =?iso-8859-2?Q?VammoJ2w07On4JxL/UbWUn56RRuDS2+YOu8eVy25SC3QDPSqpXn9FIg9Gv?=
 =?iso-8859-2?Q?rmUA+/x5Py+Hhu2yoEm6bNm7mZJBcI/NGjTlq7B5gHwh0IfwDe26WELanA?=
 =?iso-8859-2?Q?vpXz7Sg34WHjdzNai0ucqjT132nSRty34DlTHKhaf/f4p5ZAqo/x2lbw5u?=
 =?iso-8859-2?Q?sIGleul4bSNSh4rl5BE6CE9xoyemX7mvHS4qKnsWXK2Hx9WbCpxAqnCCO4?=
 =?iso-8859-2?Q?q2MJQ9IMXoq+WdUq4z9DCMJeY5tIzLWJBDPpTMuHCrxPpd+c+beUHd9lVQ?=
 =?iso-8859-2?Q?OoBMNOrhcjH1cNlta8OFoE+PyQtLNLVZxlogzxfBG/tji8YDMhFPMx967W?=
 =?iso-8859-2?Q?q0YV5dARiBgP2S/BaNGz4/+SreK8dMrqd0Ky304yro/bpkO8UNdngz6Re4?=
 =?iso-8859-2?Q?SSIp9zvjHgPNDCKw85lkyKDMvcuvUKXlqsvukpRjAN3V+4aFdVAwljMTC7?=
 =?iso-8859-2?Q?PhHi7bvQXkygpGLgdmtlWLxZuHLounYgHUWfSKxPCfRC90+cy4AmunTag5?=
 =?iso-8859-2?Q?vjk0lfEBy7QxuDk1A3xz6FNxu+R4kiwq6REz5zkst+FKgLE+4OZXLIr7O8?=
 =?iso-8859-2?Q?RdZWOCeMBcuc1SgFNOUojxZu9hs1+ndhMtPBqr0o9txdkxkFAM/lEDYUyW?=
 =?iso-8859-2?Q?l7Uf6o/R2HCpftE9gxKfDmFkCC30cHTbzAE9VfIJ8dzjlG136QWgVfc/1m?=
 =?iso-8859-2?Q?wruu8LXyG5STa79tF6ZoT6iN95kI2tK3HHP/FKb34JByL+ZdsP3/vyTR4s?=
 =?iso-8859-2?Q?ORWkqgOYg11utj85IKRDfvIWQCXN7KeOTUlDB33tNNDWrG29zUcPiPS6L3?=
 =?iso-8859-2?Q?oLOKds8I31Fb6m8OfT0iwyPMa8dq1IiI7Sj89zKzcBNZDFPgWKatjXJZe5?=
 =?iso-8859-2?Q?LOLdYZFbo6wFs+0OJnjOIrsAOBMuwwayXZst5OQZMhetDQoX7z8t7T+JD3?=
 =?iso-8859-2?Q?IjzU7ca+EhASHu7/3zyfzpwY0NVOwyy82wWJfLV7tHznozqr46BHR2+fWx?=
 =?iso-8859-2?Q?tTmEheZD51t0b6nKMgfULFxW7f7t75dsEv3UmaxK/H6h9/RWCdNS7n2mTc?=
 =?iso-8859-2?Q?mWiHQ64l0MpCbnEkoStD09G4xwKIXSIttbaYC8hEU/SWZ+J2AE9QJ1b6Tz?=
 =?iso-8859-2?Q?yUvdh6UoaRcQDwDxOPs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d619da73-95ef-4409-155b-08db5cbdd45f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8440.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 01:17:38.6484
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 CjV5fEs/tr+GaJbcKxEbw2bJqvTv6/5Rlc7irVtOhyWSNiuK0LHXPW7LsmYN+PQtBZUQCSfLtjfICLK4+HOLtEZ5m0QdkQy+rvpbx7K+Yb3LgUoMpMJzSDw/sYA1VaLR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8485
Message-ID-Hash: 5AAZSQ5HDC3KS2ZZJVWRMU6ME7FUOTPS
X-Message-ID-Hash: 5AAZSQ5HDC3KS2ZZJVWRMU6ME7FUOTPS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5AAZSQ5HDC3KS2ZZJVWRMU6ME7FUOTPS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

soc_get_playback_capture() (A) returns number of substreams for
playback/capture (B).
ASoC will probe the Sound Card and mapps CPU<->Codec pair.

(A)	static int soc_get_playback_capture(...,
(B)				    int *playback, int *capture)
	{
		...
		if (rtd->dai_link->playback_only) {
			*playback =3D 1;
			*capture =3D 0;
		}

		if (rtd->dai_link->capture_only) {
			*playback =3D 0;
			*capture =3D 1;
		}
(C)
		return 0;
	}

But it might be no playback no capture if it returns playback=3D0, capture=
=3D0.
It is very difficult to notice about it. This patch indicates error at (C)
then.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Amadeusz S=B3awi=F1ski <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/soc-pcm.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 7247f44faa1c..fe65994485f8 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2815,6 +2815,13 @@ static int soc_get_playback_capture(struct snd_soc_p=
cm_runtime *rtd,
 		*capture =3D 1;
 	}
=20
+	if (!*playback && !*capture) {
+		dev_err(rtd->dev, "substream %s has no playback, no capture\n",
+			rtd->dai_link->stream_name);
+
+		return -EINVAL;
+	}
+
 	return 0;
 }
=20
--=20
2.25.1

