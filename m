Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D61E79B24E
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 01:58:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C8C3EC1;
	Tue, 12 Sep 2023 01:57:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C8C3EC1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694476706;
	bh=+2GXE/nA+K/mnqT6UvReuUoPQ59+iWTUCQvkW4V1KFg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Gw15zQrQRLdxFlF3TlPQlApjsH6Rrk8+nsMj5Dh5GI4mAlsOrElzv5pNWn6CBr261
	 NG04OFsEbNADGUdYl2xLH3QIjnhLbK29X13E3WRi643MbGs9hTx4wFS5/04ltq/FA8
	 pt6yApRfBWpqHwAv1dn3vQR5g35GrvnptXlM0qQM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 242F0F806D3; Tue, 12 Sep 2023 01:52:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 67C23F80610;
	Tue, 12 Sep 2023 01:52:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 60F8BF8059F; Tue, 12 Sep 2023 01:52:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2072f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::72f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 89439F80571
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 01:50:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89439F80571
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Q6HUeh2g
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SD8xTX2RqZ/Dab5oGy3m6aAUgJOJ13msk4D7un82OLWkukca0DRC+ZYlzSZga9h7t2so1s+k7Vv7ZPWbCfSdeKXgAiTK3jpndcZxzmG6hX3eoJEGsBaX/Mlf6eGRwjr0g1TXRsZZ3wAwShTSNXU9gVnS4TatA45HMnwpbZeYZ63e6dXjupB+Zg6VIe4ms+HWVU2oi0CHG6dPTcPY34DjgiUaFkHh3Hx77XOxnK0yJiCIif6LUGx9eDlzs/ok97mVcNVo5t/WMuSnII1TIPZ1SP0yV8bAEqgtTITCKP81Z9KDFQM3NP7A0FKfyRyulpJQ14rVe9tNkh2UjsvVGQ8a5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C2NPmvmV7pQElnrZUo1G2r1JAjzSTE8xJ6cCzVYOy9A=;
 b=aN0L/7la+Y9WSQOvN1XFbTq/TUk5B/ezmvAuvA+KxbpUpGQ+u9GZ7su1pjNLvv4oL0G19GqyrdVx2Nc+vJIgcrAjT2HEAG8Mafw7eK6RMf4rhQt41vyMctktj+oiDO9caeD5+aTOLu1dhULT9DMa9I6SGev8xIFdWdy1lrBG8axUzp8rApwv1YV0cmPeqPPkusgEZaWLoWD9v61ZnaZOCgz6IfF7fXj43UVxGdPPEtbjlJ0JC8wPSRclSF1YJfuY5gI97NFV2UrAHRGvC2i6VjpFRtWG/cbhuhJZNe5bmiAdiqRRS7+Hl6mHXb8cvT7uhF2oLp/+4Z203Zhk5Km8CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C2NPmvmV7pQElnrZUo1G2r1JAjzSTE8xJ6cCzVYOy9A=;
 b=Q6HUeh2gdklZTkfHSnptPVv8kLru3jJND3/1IuqIXx7zW7p11qd8E99Xb5sqj93LMJDIxlbnJxiDK7XpUZe4g6FRWacQulbRAfccYRStC1S27I5jMOq3W1YtuEicY5rW0OEE1aCtYxTEFrxy6Au+qlgel89M15soD1tU4+TFDNo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB9445.jpnprd01.prod.outlook.com (2603:1096:604:1ce::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.37; Mon, 11 Sep
 2023 23:50:35 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d%6]) with mapi id 15.20.6768.036; Mon, 11 Sep 2023
 23:50:35 +0000
Message-ID: <8734zkqng5.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Bard Liao <yung-chuan.liao@linux.intel.com>,
 Brent Lu <brent.lu@intel.com>, Cezary Rojewski <cezary.rojewski@intel.com>,
 Curtis Malainey <cujomalainey@chromium.org>,
 Jaroslav Kysela <perex@perex.cz>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Yong Zhi <yong.zhi@intel.com>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
In-Reply-To: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
References: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 35/54] ASoC: intel: convert not to use asoc_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 11 Sep 2023 23:50:35 +0000
X-ClientProxiedBy: TYWP286CA0031.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::19) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB9445:EE_
X-MS-Office365-Filtering-Correlation-Id: 7984847c-5bbd-4143-d3a8-08dbb321e4c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	VE5E3XXIjLVp9qTCSWa5tpSd6Us5hQ1eDkjlWqRdZAatmzZlTVsYV6GR8x/5KiRincvIyE425xg5rWa+LtZ6TUVYyYTE4oG88sGPNefPtMxuwAXNaiBNiBiYMWZMsH5YIFePSE1x5tvjDaJ1BvnE6mwnju7ClDy4giVc8y43N0Zrm65Gbyqsqxav+XX2Fq8qbpM7fCt/KgZOmPGZUuXA78sCehtn4NQ3NnB24ALVN/7unAOn5lBQzafB+bXeGZ9dLV/YWG0Akw6+Ym8/MuWL+OLWcE4ROoUhaO50Ph1ef8SfYLuCWTKnn+Xn4JUBWddda1If41U3PpqVxsL6q+YZINR+a70YsJj/JThs+l8G7OsCK3QtnyE8mesGHj4FwAkUtA/9PSTwmJxVnNpVmr0Kibn09RCIuzcQmcsJOLzpy4dWlhBf4MdGFGS3G7AkZ+kvRZ4/9rHnoL6uVCQqZ6F9FeFMmy7fqgBJlyEygToJpEkrjmFq71SmPJX5KZ4lGdZa2pTTExhMxkGyZq9t6FbwZvC9XIFvnYs7w67ECjUBYUl0kDSQWIdg3AQDP8/dr++hX/v7iMgAsJCV+NFRxXIdDVYBNIDinuV9BxO2lG1PeQGjcxtPbYTaa/pzVXroVQRt4NPeWbO//B6ZhGkb3L3cgKYSPJUkIF++cU6nlGt+dGU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(376002)(136003)(39860400002)(396003)(1800799009)(186009)(451199024)(83380400001)(66556008)(110136005)(38100700002)(36756003)(38350700002)(86362001)(316002)(66476007)(66946007)(8936002)(4326008)(8676002)(921005)(41300700001)(5660300002)(6506007)(6486002)(52116002)(6512007)(7416002)(2906002)(478600001)(30864003)(2616005)(26005)(21314003)(559001)(579004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+t2yXBoo805EoWX98Jzt5DCf8nGOFpnZeCJtd4FYinr3TO+DjAra2u/hpvJA?=
 =?us-ascii?Q?OS3RHZWwoMbipLw3XhezPn4gbTXRicwVxlJRvFhbH+X5VmxZkcFGxDOFbqFE?=
 =?us-ascii?Q?9hSV3vfSoWMoGAkDpOT7zMc5ZPjEHwUM+GB5/4bf/HaE7WfZPFdo0+Ol1HB+?=
 =?us-ascii?Q?9xoqaEOqSanvbS3Pt2u3DFnx0TEyztVrCg9UDOwXO55WO9zfILqU7jyfZSxY?=
 =?us-ascii?Q?yM2jAy7HOUWF8svRlnYWmQ1DRKd1k9akKNPNe8K2IPe6VlzJWUiSAhjtFsdd?=
 =?us-ascii?Q?rfSUBJ5sR4/O7M9pfOPx/BKSg8x7GUYNw4pNmvFHIXHw6zL1E5fRoFObfqO5?=
 =?us-ascii?Q?yUgPJ/7l/ZWP4ehURyKa1rFTB5aGR+N+FiyJ8HqgbMXyDovh1LSU1pfP/mET?=
 =?us-ascii?Q?vmXCNXsUFOhM5uyxfQ78kYPwTmls27k/QgXGImucRTEwMaHNhAooXR0i5JTO?=
 =?us-ascii?Q?YR+2s+FPiPkgeyekqz9KMZaKtV623i1x0XCUY5xcZJltBxDYvfQPknyiSP+2?=
 =?us-ascii?Q?jlHIszwLv81yCnb+L3FexGnpnzaYEVfx0iBr3nMxiAbNau1F6j1DQyroAFtn?=
 =?us-ascii?Q?719acDskT1x8vpNMFIxJIpeFFyUe6HbTXKHmR8jd0s5c9vSIacCKcgwigelY?=
 =?us-ascii?Q?DitYf16TlGV8GSCPPYNA0b9NqrTKkIJ6c6krzMJHNRjuDeusNMgxxlnGytm4?=
 =?us-ascii?Q?pfawDBjBkfDfroo8nO0euRGuK7dnwzAWrHo5s8iAojFkvtJEvSxfCP/uGJpu?=
 =?us-ascii?Q?DEmdlQVQ+7ofegkqVj0v8LQnpvUQsu+UooznFENi3lk6vPiFH/rfSci9pcst?=
 =?us-ascii?Q?Zs45nIYCDAgz+rksXrHt/Q7u4VLRgX3hSAlB6CP7PglXvXEKdNreNRinjlMq?=
 =?us-ascii?Q?oFIcCy+BEOWCUb9COjhHV42838LIASsDYSrlk+A39OF6ddfAmUOIVzcQwl3b?=
 =?us-ascii?Q?XVQSprKS6eHGSJt9kn5ORnz8juWtiUiwBiv0EfGak0RFEuf3uUSobgmz+XQy?=
 =?us-ascii?Q?Cw8/FiiBTBQzDv4L+anqXKG+PJ4sXuy0NBFFeYD+qz3qXQq9+A5t04mKsIlQ?=
 =?us-ascii?Q?/xbuP/zOqtiQ3muwi5MktbmsHuAAxYo7pCB2yPfqsrsKyaZG1QKxKrbBZ3y3?=
 =?us-ascii?Q?dr022ARpOgjqrSgYZ9WtA4ZhQRi3ZBtJyb+YhkG5AUhscoEBAAO7WDGLAD91?=
 =?us-ascii?Q?ABBLKx4fo1kx/t0zcK2M6WyfgbCHf02VHrBp6WG4zL5Aexk+3zhah1n+iO9a?=
 =?us-ascii?Q?IKozYAooktSJRywmF2HvfZZtyksIxivdfV9fU7LpGwCgatxjdM/Q9Hcm97SR?=
 =?us-ascii?Q?i+e5XoZlJw4FoXgJtx8ROLWr3Q9GEGOs5Ikv4USzhsqZYTvSvX2SsAw4yubq?=
 =?us-ascii?Q?nfArgk3qOehlaSJ6c7aHelWXtsRvFah6Oxtcxq3cZeM28xaM57BaZVpkockG?=
 =?us-ascii?Q?rNBgMCWdfFv0Dhw8mrpIe+TN6KKxLjm0FGx4qO5bR8Qttj7Wx/J6HOy6rqZi?=
 =?us-ascii?Q?mTiQJ79IvUw1hM8waEqfDcNFiOMZj1YekT+HOVcHk80SjDZHyQQ6kfoymYMM?=
 =?us-ascii?Q?le1dWNjhu0YMmVU91/0CnF8y7LTFV2q2jtj7FnJwxYC6WLTiwGyeSJLjxDKr?=
 =?us-ascii?Q?42oOlwpn2eoKk3PcrkHaNQk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7984847c-5bbd-4143-d3a8-08dbb321e4c2
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 23:50:35.7799
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 wKYEmzJU7Lma+qas8gFq7SlduSN3A/Z2JOOfCIhvtAMclaMVymJcDiQ/0DdZW0uR7TaflcVLPNEFodsx/3+E7DyPiHNRQTgK1XaF01q4JJemNXeejTPmSXpan/YMcvy9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9445
Message-ID-Hash: F56QLM25XRKT7QVLPDOO6KYJCQNL2EMF
X-Message-ID-Hash: F56QLM25XRKT7QVLPDOO6KYJCQNL2EMF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/F56QLM25XRKT7QVLPDOO6KYJCQNL2EMF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ASoC is now unified asoc_xxx() into snd_soc_xxx().
This patch convert asoc_xxx() to snd_soc_xxx().

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/intel/atom/sst-mfld-platform-pcm.c   | 12 ++++++------
 sound/soc/intel/boards/bdw-rt5650.c            |  6 +++---
 sound/soc/intel/boards/bdw-rt5677.c            | 10 +++++-----
 sound/soc/intel/boards/bdw_rt286.c             |  8 ++++----
 sound/soc/intel/boards/bxt_da7219_max98357a.c  |  8 ++++----
 sound/soc/intel/boards/bxt_rt298.c             | 10 +++++-----
 sound/soc/intel/boards/bytcht_cx2072x.c        | 10 +++++-----
 sound/soc/intel/boards/bytcht_da7213.c         | 12 ++++++------
 sound/soc/intel/boards/bytcht_es8316.c         |  8 ++++----
 sound/soc/intel/boards/bytcht_nocodec.c        |  4 ++--
 sound/soc/intel/boards/bytcr_rt5640.c          | 10 +++++-----
 sound/soc/intel/boards/bytcr_rt5651.c          | 10 +++++-----
 sound/soc/intel/boards/bytcr_wm5102.c          |  6 +++---
 sound/soc/intel/boards/cht_bsw_max98090_ti.c   |  8 ++++----
 sound/soc/intel/boards/cht_bsw_nau8824.c       |  8 ++++----
 sound/soc/intel/boards/cht_bsw_rt5645.c        | 16 ++++++++--------
 sound/soc/intel/boards/cht_bsw_rt5672.c        | 10 +++++-----
 sound/soc/intel/boards/cml_rt1011_rt5682.c     | 12 ++++++------
 sound/soc/intel/boards/ehl_rt5660.c            |  8 ++++----
 sound/soc/intel/boards/glk_rt5682_max98357a.c  | 12 ++++++------
 sound/soc/intel/boards/hsw_rt5640.c            |  4 ++--
 sound/soc/intel/boards/kbl_da7219_max98357a.c  |  8 ++++----
 sound/soc/intel/boards/kbl_da7219_max98927.c   | 10 +++++-----
 sound/soc/intel/boards/kbl_rt5660.c            |  8 ++++----
 sound/soc/intel/boards/kbl_rt5663_max98927.c   | 12 ++++++------
 .../intel/boards/kbl_rt5663_rt5514_max98927.c  | 12 ++++++------
 sound/soc/intel/boards/skl_hda_dsp_generic.c   |  4 ++--
 .../soc/intel/boards/skl_nau88l25_max98357a.c  | 14 +++++++-------
 sound/soc/intel/boards/skl_nau88l25_ssm4567.c  | 18 +++++++++---------
 sound/soc/intel/boards/skl_rt286.c             | 10 +++++-----
 sound/soc/intel/boards/sof_cirrus_common.c     |  2 +-
 sound/soc/intel/boards/sof_cs42l42.c           | 12 ++++++------
 sound/soc/intel/boards/sof_da7219_max98373.c   |  8 ++++----
 sound/soc/intel/boards/sof_es8336.c            | 14 +++++++-------
 sound/soc/intel/boards/sof_maxim_common.c      |  8 ++++----
 sound/soc/intel/boards/sof_nau8825.c           | 12 ++++++------
 sound/soc/intel/boards/sof_pcm512x.c           | 14 +++++++-------
 sound/soc/intel/boards/sof_realtek_common.c    |  8 ++++----
 sound/soc/intel/boards/sof_rt5682.c            | 16 ++++++++--------
 sound/soc/intel/boards/sof_sdw.c               | 18 +++++++++---------
 sound/soc/intel/boards/sof_sdw_cs42l42.c       |  2 +-
 sound/soc/intel/boards/sof_sdw_hdmi.c          |  2 +-
 sound/soc/intel/boards/sof_sdw_maxim.c         |  4 ++--
 sound/soc/intel/boards/sof_sdw_rt5682.c        |  2 +-
 sound/soc/intel/boards/sof_sdw_rt700.c         |  2 +-
 sound/soc/intel/boards/sof_sdw_rt711.c         |  2 +-
 sound/soc/intel/boards/sof_sdw_rt_amp.c        |  4 ++--
 .../intel/boards/sof_sdw_rt_sdca_jack_common.c |  2 +-
 sound/soc/intel/boards/sof_ssp_amp.c           |  8 ++++----
 sound/soc/intel/boards/sof_wm8804.c            |  4 ++--
 sound/soc/intel/catpt/pcm.c                    | 12 ++++++------
 sound/soc/intel/keembay/kmb_platform.c         |  4 ++--
 sound/soc/intel/skylake/skl-pcm.c              | 18 +++++++++---------
 53 files changed, 233 insertions(+), 233 deletions(-)

diff --git a/sound/soc/intel/atom/sst-mfld-platform-pcm.c b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
index 6f986c7bbc8bc..8652b4a200206 100644
--- a/sound/soc/intel/atom/sst-mfld-platform-pcm.c
+++ b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
@@ -273,7 +273,7 @@ static int sst_platform_init_stream(struct snd_pcm_substream *substream)
 {
 	struct sst_runtime_stream *stream =
 			substream->runtime->private_data;
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	int ret_val;
 
 	dev_dbg(rtd->dev, "setting buffer ptr param\n");
@@ -593,7 +593,7 @@ static int sst_soc_trigger(struct snd_soc_component *component,
 	int ret_val = 0, str_id;
 	struct sst_runtime_stream *stream;
 	int status;
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 
 	dev_dbg(rtd->dev, "%s called\n", __func__);
 	if (substream->pcm->internal)
@@ -641,7 +641,7 @@ static snd_pcm_uframes_t sst_soc_pointer(struct snd_soc_component *component,
 	struct sst_runtime_stream *stream;
 	int ret_val, status;
 	struct pcm_stream_info *str_info;
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 
 	stream = substream->runtime->private_data;
 	status = sst_get_stream_status(stream);
@@ -671,7 +671,7 @@ static snd_pcm_sframes_t sst_soc_delay(struct snd_soc_component *component,
 static int sst_soc_pcm_new(struct snd_soc_component *component,
 			   struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_dai *dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct snd_pcm *pcm = rtd->pcm;
 
 	if (dai->driver->playback.channels_min ||
@@ -762,7 +762,7 @@ static int sst_soc_prepare(struct device *dev)
 
 	/* set the SSPs to idle */
 	for_each_card_rtds(drv->soc_card, rtd) {
-		struct snd_soc_dai *dai = asoc_rtd_to_cpu(rtd, 0);
+		struct snd_soc_dai *dai = snd_soc_rtd_to_cpu(rtd, 0);
 
 		if (snd_soc_dai_active(dai)) {
 			send_ssp_cmd(dai, dai->name, 0);
@@ -783,7 +783,7 @@ static void sst_soc_complete(struct device *dev)
 
 	/* restart SSPs */
 	for_each_card_rtds(drv->soc_card, rtd) {
-		struct snd_soc_dai *dai = asoc_rtd_to_cpu(rtd, 0);
+		struct snd_soc_dai *dai = snd_soc_rtd_to_cpu(rtd, 0);
 
 		if (snd_soc_dai_active(dai)) {
 			sst_handle_vb_timer(dai, true);
diff --git a/sound/soc/intel/boards/bdw-rt5650.c b/sound/soc/intel/boards/bdw-rt5650.c
index d0682bc543c9a..3ae26f21458f3 100644
--- a/sound/soc/intel/boards/bdw-rt5650.c
+++ b/sound/soc/intel/boards/bdw-rt5650.c
@@ -103,8 +103,8 @@ static int broadwell_ssp0_fixup(struct snd_soc_pcm_runtime *rtd,
 static int bdw_rt5650_hw_params(struct snd_pcm_substream *substream,
 	struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	int ret;
 
 	/* Workaround: set codec PLL to 19.2MHz that PLL source is
@@ -167,7 +167,7 @@ static int bdw_rt5650_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct bdw_rt5650_priv *bdw_rt5650 =
 		snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct snd_soc_component *component = codec_dai->component;
 	int ret;
 
diff --git a/sound/soc/intel/boards/bdw-rt5677.c b/sound/soc/intel/boards/bdw-rt5677.c
index f3e08d258ac17..304af3d06d017 100644
--- a/sound/soc/intel/boards/bdw-rt5677.c
+++ b/sound/soc/intel/boards/bdw-rt5677.c
@@ -153,8 +153,8 @@ static int broadwell_ssp0_fixup(struct snd_soc_pcm_runtime *rtd,
 static int bdw_rt5677_hw_params(struct snd_pcm_substream *substream,
 	struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	int ret;
 
 	ret = snd_soc_dai_set_sysclk(codec_dai, RT5677_SCLK_S_MCLK, 24576000,
@@ -170,8 +170,8 @@ static int bdw_rt5677_hw_params(struct snd_pcm_substream *substream,
 static int bdw_rt5677_dsp_hw_params(struct snd_pcm_substream *substream,
 	struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	int ret;
 
 	ret = snd_soc_dai_set_sysclk(codec_dai, RT5677_SCLK_S_PLL1, 24576000,
@@ -227,7 +227,7 @@ static int bdw_rt5677_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct bdw_rt5677_priv *bdw_rt5677 =
 			snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
+	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
 	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
 	int ret;
 
diff --git a/sound/soc/intel/boards/bdw_rt286.c b/sound/soc/intel/boards/bdw_rt286.c
index 036579331d8fb..7f20159c23e54 100644
--- a/sound/soc/intel/boards/bdw_rt286.c
+++ b/sound/soc/intel/boards/bdw_rt286.c
@@ -61,7 +61,7 @@ static const struct snd_soc_dapm_route card_routes[] = {
 
 static int codec_link_init(struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_component *codec = asoc_rtd_to_codec(rtd, 0)->component;
+	struct snd_soc_component *codec = snd_soc_rtd_to_codec(rtd, 0)->component;
 	int ret;
 
 	ret = snd_soc_card_jack_new_pins(rtd->card, "Headset", SND_JACK_HEADSET | SND_JACK_BTN_0,
@@ -75,7 +75,7 @@ static int codec_link_init(struct snd_soc_pcm_runtime *rtd)
 
 static void codec_link_exit(struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_component *codec = asoc_rtd_to_codec(rtd, 0)->component;
+	struct snd_soc_component *codec = snd_soc_rtd_to_codec(rtd, 0)->component;
 
 	snd_soc_component_set_jack(codec, NULL, NULL);
 }
@@ -98,8 +98,8 @@ static int codec_link_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 static int codec_link_hw_params(struct snd_pcm_substream *substream,
 				struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	int ret;
 
 	ret = snd_soc_dai_set_sysclk(codec_dai, RT286_SCLK_S_PLL, 24000000, SND_SOC_CLOCK_IN);
diff --git a/sound/soc/intel/boards/bxt_da7219_max98357a.c b/sound/soc/intel/boards/bxt_da7219_max98357a.c
index cbfff466c5c86..816fad8c1ff0e 100644
--- a/sound/soc/intel/boards/bxt_da7219_max98357a.c
+++ b/sound/soc/intel/boards/bxt_da7219_max98357a.c
@@ -226,8 +226,8 @@ static int broxton_ssp_fixup(struct snd_soc_pcm_runtime *rtd,
 static int broxton_da7219_codec_init(struct snd_soc_pcm_runtime *rtd)
 {
 	int ret;
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
-	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
+	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
 	int clk_freq;
 
 	/* Configure sysclk for codec */
@@ -275,7 +275,7 @@ static int broxton_da7219_codec_init(struct snd_soc_pcm_runtime *rtd)
 static int broxton_hdmi_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct bxt_card_private *ctx = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_dai *dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct bxt_hdmi_pcm *pcm;
 
 	pcm = devm_kzalloc(rtd->card->dev, sizeof(*pcm), GFP_KERNEL);
@@ -293,7 +293,7 @@ static int broxton_hdmi_init(struct snd_soc_pcm_runtime *rtd)
 static int broxton_da7219_fe_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_dapm_context *dapm;
-	struct snd_soc_component *component = asoc_rtd_to_cpu(rtd, 0)->component;
+	struct snd_soc_component *component = snd_soc_rtd_to_cpu(rtd, 0)->component;
 
 	dapm = snd_soc_component_get_dapm(component);
 	snd_soc_dapm_ignore_suspend(dapm, "Reference Capture");
diff --git a/sound/soc/intel/boards/bxt_rt298.c b/sound/soc/intel/boards/bxt_rt298.c
index bf89fe80423d0..4631106f2a282 100644
--- a/sound/soc/intel/boards/bxt_rt298.c
+++ b/sound/soc/intel/boards/bxt_rt298.c
@@ -155,7 +155,7 @@ static const struct snd_soc_dapm_route geminilake_rt298_map[] = {
 static int broxton_rt298_fe_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_dapm_context *dapm;
-	struct snd_soc_component *component = asoc_rtd_to_cpu(rtd, 0)->component;
+	struct snd_soc_component *component = snd_soc_rtd_to_cpu(rtd, 0)->component;
 
 	dapm = snd_soc_component_get_dapm(component);
 	snd_soc_dapm_ignore_suspend(dapm, "Reference Capture");
@@ -165,7 +165,7 @@ static int broxton_rt298_fe_init(struct snd_soc_pcm_runtime *rtd)
 
 static int broxton_rt298_codec_init(struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
+	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
 	int ret = 0;
 
 	ret = snd_soc_card_jack_new_pins(rtd->card, "Headset",
@@ -186,7 +186,7 @@ static int broxton_rt298_codec_init(struct snd_soc_pcm_runtime *rtd)
 static int broxton_hdmi_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct bxt_rt286_private *ctx = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_dai *dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct bxt_hdmi_pcm *pcm;
 
 	pcm = devm_kzalloc(rtd->card->dev, sizeof(*pcm), GFP_KERNEL);
@@ -224,8 +224,8 @@ static int broxton_ssp5_fixup(struct snd_soc_pcm_runtime *rtd,
 static int broxton_rt298_hw_params(struct snd_pcm_substream *substream,
 	struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	int ret;
 
 	ret = snd_soc_dai_set_sysclk(codec_dai, RT298_SCLK_S_PLL,
diff --git a/sound/soc/intel/boards/bytcht_cx2072x.c b/sound/soc/intel/boards/bytcht_cx2072x.c
index 9942a2de6f7a0..10a84a2c1036e 100644
--- a/sound/soc/intel/boards/bytcht_cx2072x.c
+++ b/sound/soc/intel/boards/bytcht_cx2072x.c
@@ -70,7 +70,7 @@ static const struct acpi_gpio_mapping byt_cht_cx2072x_acpi_gpios[] = {
 static int byt_cht_cx2072x_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
-	struct snd_soc_component *codec = asoc_rtd_to_codec(rtd, 0)->component;
+	struct snd_soc_component *codec = snd_soc_rtd_to_codec(rtd, 0)->component;
 	int ret;
 
 	if (devm_acpi_dev_add_driver_gpios(codec->dev,
@@ -80,7 +80,7 @@ static int byt_cht_cx2072x_init(struct snd_soc_pcm_runtime *rtd)
 	card->dapm.idle_bias_off = true;
 
 	/* set the default PLL rate, the clock is handled by the codec driver */
-	ret = snd_soc_dai_set_sysclk(asoc_rtd_to_codec(rtd, 0), CX2072X_MCLK_EXTERNAL_PLL,
+	ret = snd_soc_dai_set_sysclk(snd_soc_rtd_to_codec(rtd, 0), CX2072X_MCLK_EXTERNAL_PLL,
 				     19200000, SND_SOC_CLOCK_IN);
 	if (ret) {
 		dev_err(rtd->dev, "Could not set sysclk\n");
@@ -97,7 +97,7 @@ static int byt_cht_cx2072x_init(struct snd_soc_pcm_runtime *rtd)
 
 	snd_soc_component_set_jack(codec, &byt_cht_cx2072x_headset, NULL);
 
-	snd_soc_dai_set_bclk_ratio(asoc_rtd_to_codec(rtd, 0), 50);
+	snd_soc_dai_set_bclk_ratio(snd_soc_rtd_to_codec(rtd, 0), 50);
 
 	return 0;
 }
@@ -123,7 +123,7 @@ static int byt_cht_cx2072x_fixup(struct snd_soc_pcm_runtime *rtd,
 	 * with explicit setting to I2S 2ch 24-bit. The word length is set with
 	 * dai_set_tdm_slot() since there is no other API exposed
 	 */
-	ret = snd_soc_dai_set_fmt(asoc_rtd_to_cpu(rtd, 0),
+	ret = snd_soc_dai_set_fmt(snd_soc_rtd_to_cpu(rtd, 0),
 				SND_SOC_DAIFMT_I2S     |
 				SND_SOC_DAIFMT_NB_NF   |
 				SND_SOC_DAIFMT_BP_FP);
@@ -132,7 +132,7 @@ static int byt_cht_cx2072x_fixup(struct snd_soc_pcm_runtime *rtd,
 		return ret;
 	}
 
-	ret = snd_soc_dai_set_tdm_slot(asoc_rtd_to_cpu(rtd, 0), 0x3, 0x3, 2, 24);
+	ret = snd_soc_dai_set_tdm_slot(snd_soc_rtd_to_cpu(rtd, 0), 0x3, 0x3, 2, 24);
 	if (ret < 0) {
 		dev_err(rtd->dev, "can't set I2S config, err %d\n", ret);
 		return ret;
diff --git a/sound/soc/intel/boards/bytcht_da7213.c b/sound/soc/intel/boards/bytcht_da7213.c
index a3b0cfab17b05..7e5eea690023d 100644
--- a/sound/soc/intel/boards/bytcht_da7213.c
+++ b/sound/soc/intel/boards/bytcht_da7213.c
@@ -78,7 +78,7 @@ static int codec_fixup(struct snd_soc_pcm_runtime *rtd,
 	 * with explicit setting to I2S 2ch 24-bit. The word length is set with
 	 * dai_set_tdm_slot() since there is no other API exposed
 	 */
-	ret = snd_soc_dai_set_fmt(asoc_rtd_to_cpu(rtd, 0),
+	ret = snd_soc_dai_set_fmt(snd_soc_rtd_to_cpu(rtd, 0),
 				  SND_SOC_DAIFMT_I2S     |
 				  SND_SOC_DAIFMT_NB_NF   |
 				  SND_SOC_DAIFMT_BP_FP);
@@ -87,7 +87,7 @@ static int codec_fixup(struct snd_soc_pcm_runtime *rtd,
 		return ret;
 	}
 
-	ret = snd_soc_dai_set_tdm_slot(asoc_rtd_to_cpu(rtd, 0), 0x3, 0x3, 2, 24);
+	ret = snd_soc_dai_set_tdm_slot(snd_soc_rtd_to_cpu(rtd, 0), 0x3, 0x3, 2, 24);
 	if (ret < 0) {
 		dev_err(rtd->dev, "can't set I2S config, err %d\n", ret);
 		return ret;
@@ -105,8 +105,8 @@ static int aif1_startup(struct snd_pcm_substream *substream)
 static int aif1_hw_params(struct snd_pcm_substream *substream,
 			  struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	int ret;
 
 	ret = snd_soc_dai_set_sysclk(codec_dai, DA7213_CLKSRC_MCLK,
@@ -126,8 +126,8 @@ static int aif1_hw_params(struct snd_pcm_substream *substream,
 
 static int aif1_hw_free(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	int ret;
 
 	ret = snd_soc_dai_set_pll(codec_dai, 0,
diff --git a/sound/soc/intel/boards/bytcht_es8316.c b/sound/soc/intel/boards/bytcht_es8316.c
index 7a30d2d36f199..8a0b0e864fbb4 100644
--- a/sound/soc/intel/boards/bytcht_es8316.c
+++ b/sound/soc/intel/boards/bytcht_es8316.c
@@ -157,7 +157,7 @@ static struct snd_soc_jack_pin byt_cht_es8316_jack_pins[] = {
 
 static int byt_cht_es8316_init(struct snd_soc_pcm_runtime *runtime)
 {
-	struct snd_soc_component *codec = asoc_rtd_to_codec(runtime, 0)->component;
+	struct snd_soc_component *codec = snd_soc_rtd_to_codec(runtime, 0)->component;
 	struct snd_soc_card *card = runtime->card;
 	struct byt_cht_es8316_private *priv = snd_soc_card_get_drvdata(card);
 	const struct snd_soc_dapm_route *custom_map;
@@ -212,7 +212,7 @@ static int byt_cht_es8316_init(struct snd_soc_pcm_runtime *runtime)
 	if (ret)
 		dev_err(card->dev, "unable to enable MCLK\n");
 
-	ret = snd_soc_dai_set_sysclk(asoc_rtd_to_codec(runtime, 0), 0, 19200000,
+	ret = snd_soc_dai_set_sysclk(snd_soc_rtd_to_codec(runtime, 0), 0, 19200000,
 				     SND_SOC_CLOCK_IN);
 	if (ret < 0) {
 		dev_err(card->dev, "can't set codec clock %d\n", ret);
@@ -262,7 +262,7 @@ static int byt_cht_es8316_codec_fixup(struct snd_soc_pcm_runtime *rtd,
 	 * with explicit setting to I2S 2ch 24-bit. The word length is set with
 	 * dai_set_tdm_slot() since there is no other API exposed
 	 */
-	ret = snd_soc_dai_set_fmt(asoc_rtd_to_cpu(rtd, 0),
+	ret = snd_soc_dai_set_fmt(snd_soc_rtd_to_cpu(rtd, 0),
 				SND_SOC_DAIFMT_I2S     |
 				SND_SOC_DAIFMT_NB_NF   |
 				SND_SOC_DAIFMT_BP_FP
@@ -272,7 +272,7 @@ static int byt_cht_es8316_codec_fixup(struct snd_soc_pcm_runtime *rtd,
 		return ret;
 	}
 
-	ret = snd_soc_dai_set_tdm_slot(asoc_rtd_to_cpu(rtd, 0), 0x3, 0x3, 2, bits);
+	ret = snd_soc_dai_set_tdm_slot(snd_soc_rtd_to_cpu(rtd, 0), 0x3, 0x3, 2, bits);
 	if (ret < 0) {
 		dev_err(rtd->dev, "can't set I2S config, err %d\n", ret);
 		return ret;
diff --git a/sound/soc/intel/boards/bytcht_nocodec.c b/sound/soc/intel/boards/bytcht_nocodec.c
index 7fc03f2efd356..4a957d1cece35 100644
--- a/sound/soc/intel/boards/bytcht_nocodec.c
+++ b/sound/soc/intel/boards/bytcht_nocodec.c
@@ -58,7 +58,7 @@ static int codec_fixup(struct snd_soc_pcm_runtime *rtd,
 	 * with explicit setting to I2S 2ch 24-bit. The word length is set with
 	 * dai_set_tdm_slot() since there is no other API exposed
 	 */
-	ret = snd_soc_dai_set_fmt(asoc_rtd_to_cpu(rtd, 0),
+	ret = snd_soc_dai_set_fmt(snd_soc_rtd_to_cpu(rtd, 0),
 				  SND_SOC_DAIFMT_I2S     |
 				  SND_SOC_DAIFMT_NB_NF   |
 				  SND_SOC_DAIFMT_BP_FP);
@@ -68,7 +68,7 @@ static int codec_fixup(struct snd_soc_pcm_runtime *rtd,
 		return ret;
 	}
 
-	ret = snd_soc_dai_set_tdm_slot(asoc_rtd_to_cpu(rtd, 0), 0x3, 0x3, 2, 24);
+	ret = snd_soc_dai_set_tdm_slot(snd_soc_rtd_to_cpu(rtd, 0), 0x3, 0x3, 2, 24);
 	if (ret < 0) {
 		dev_err(rtd->dev, "can't set I2S config, err %d\n", ret);
 		return ret;
diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index 630784b6cb6d3..ed14d9e4aa533 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -525,8 +525,8 @@ static int byt_rt5640_hp_elitepad_1000g2_jack2_check(void *data)
 static int byt_rt5640_aif1_hw_params(struct snd_pcm_substream *substream,
 					struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *dai = snd_soc_rtd_to_codec(rtd, 0);
 
 	return byt_rt5640_prepare_and_enable_pll1(dai, params_rate(params));
 }
@@ -1229,7 +1229,7 @@ static int byt_rt5640_init(struct snd_soc_pcm_runtime *runtime)
 	struct snd_soc_card *card = runtime->card;
 	struct byt_rt5640_private *priv = snd_soc_card_get_drvdata(card);
 	struct rt5640_set_jack_data *jack_data = &priv->jack_data;
-	struct snd_soc_component *component = asoc_rtd_to_codec(runtime, 0)->component;
+	struct snd_soc_component *component = snd_soc_rtd_to_codec(runtime, 0)->component;
 	const struct snd_soc_dapm_route *custom_map = NULL;
 	int num_routes = 0;
 	int ret;
@@ -1447,7 +1447,7 @@ static int byt_rt5640_codec_fixup(struct snd_soc_pcm_runtime *rtd,
 	 * with explicit setting to I2S 2ch. The word length is set with
 	 * dai_set_tdm_slot() since there is no other API exposed
 	 */
-	ret = snd_soc_dai_set_fmt(asoc_rtd_to_cpu(rtd, 0),
+	ret = snd_soc_dai_set_fmt(snd_soc_rtd_to_cpu(rtd, 0),
 				  SND_SOC_DAIFMT_I2S     |
 				  SND_SOC_DAIFMT_NB_NF   |
 				  SND_SOC_DAIFMT_BP_FP);
@@ -1456,7 +1456,7 @@ static int byt_rt5640_codec_fixup(struct snd_soc_pcm_runtime *rtd,
 		return ret;
 	}
 
-	ret = snd_soc_dai_set_tdm_slot(asoc_rtd_to_cpu(rtd, 0), 0x3, 0x3, 2, bits);
+	ret = snd_soc_dai_set_tdm_slot(snd_soc_rtd_to_cpu(rtd, 0), 0x3, 0x3, 2, bits);
 	if (ret < 0) {
 		dev_err(rtd->dev, "can't set I2S config, err %d\n", ret);
 		return ret;
diff --git a/sound/soc/intel/boards/bytcr_rt5651.c b/sound/soc/intel/boards/bytcr_rt5651.c
index 805afaf47b290..f9fe8414f454f 100644
--- a/sound/soc/intel/boards/bytcr_rt5651.c
+++ b/sound/soc/intel/boards/bytcr_rt5651.c
@@ -344,8 +344,8 @@ static struct snd_soc_jack_pin bytcr_jack_pins[] = {
 static int byt_rt5651_aif1_hw_params(struct snd_pcm_substream *substream,
 					struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	snd_pcm_format_t format = params_format(params);
 	int rate = params_rate(params);
 	int bclk_ratio;
@@ -563,7 +563,7 @@ static int byt_rt5651_add_codec_device_props(struct device *i2c_dev,
 static int byt_rt5651_init(struct snd_soc_pcm_runtime *runtime)
 {
 	struct snd_soc_card *card = runtime->card;
-	struct snd_soc_component *codec = asoc_rtd_to_codec(runtime, 0)->component;
+	struct snd_soc_component *codec = snd_soc_rtd_to_codec(runtime, 0)->component;
 	struct byt_rt5651_private *priv = snd_soc_card_get_drvdata(card);
 	const struct snd_soc_dapm_route *custom_map;
 	int num_routes;
@@ -703,7 +703,7 @@ static int byt_rt5651_codec_fixup(struct snd_soc_pcm_runtime *rtd,
 	 * with explicit setting to I2S 2ch. The word length is set with
 	 * dai_set_tdm_slot() since there is no other API exposed
 	 */
-	ret = snd_soc_dai_set_fmt(asoc_rtd_to_cpu(rtd, 0),
+	ret = snd_soc_dai_set_fmt(snd_soc_rtd_to_cpu(rtd, 0),
 				  SND_SOC_DAIFMT_I2S     |
 				  SND_SOC_DAIFMT_NB_NF   |
 				  SND_SOC_DAIFMT_BP_FP
@@ -714,7 +714,7 @@ static int byt_rt5651_codec_fixup(struct snd_soc_pcm_runtime *rtd,
 		return ret;
 	}
 
-	ret = snd_soc_dai_set_tdm_slot(asoc_rtd_to_cpu(rtd, 0), 0x3, 0x3, 2, bits);
+	ret = snd_soc_dai_set_tdm_slot(snd_soc_rtd_to_cpu(rtd, 0), 0x3, 0x3, 2, bits);
 	if (ret < 0) {
 		dev_err(rtd->dev, "can't set I2S config, err %d\n", ret);
 		return ret;
diff --git a/sound/soc/intel/boards/bytcr_wm5102.c b/sound/soc/intel/boards/bytcr_wm5102.c
index 5c9e06ed1a535..643f1d0094c4c 100644
--- a/sound/soc/intel/boards/bytcr_wm5102.c
+++ b/sound/soc/intel/boards/bytcr_wm5102.c
@@ -201,7 +201,7 @@ static int byt_wm5102_init(struct snd_soc_pcm_runtime *runtime)
 {
 	struct snd_soc_card *card = runtime->card;
 	struct byt_wm5102_private *priv = snd_soc_card_get_drvdata(card);
-	struct snd_soc_component *component = asoc_rtd_to_codec(runtime, 0)->component;
+	struct snd_soc_component *component = snd_soc_rtd_to_codec(runtime, 0)->component;
 	int ret, jack_type;
 
 	card->dapm.idle_bias_off = true;
@@ -269,7 +269,7 @@ static int byt_wm5102_codec_fixup(struct snd_soc_pcm_runtime *rtd,
 	 * with explicit setting to I2S 2ch 16-bit. The word length is set with
 	 * dai_set_tdm_slot() since there is no other API exposed
 	 */
-	ret = snd_soc_dai_set_fmt(asoc_rtd_to_cpu(rtd, 0),
+	ret = snd_soc_dai_set_fmt(snd_soc_rtd_to_cpu(rtd, 0),
 				  SND_SOC_DAIFMT_I2S     |
 				  SND_SOC_DAIFMT_NB_NF   |
 				  SND_SOC_DAIFMT_BP_FP);
@@ -278,7 +278,7 @@ static int byt_wm5102_codec_fixup(struct snd_soc_pcm_runtime *rtd,
 		return ret;
 	}
 
-	ret = snd_soc_dai_set_tdm_slot(asoc_rtd_to_cpu(rtd, 0), 0x3, 0x3, 2, 16);
+	ret = snd_soc_dai_set_tdm_slot(snd_soc_rtd_to_cpu(rtd, 0), 0x3, 0x3, 2, 16);
 	if (ret) {
 		dev_err(rtd->dev, "Error setting I2S config: %d\n", ret);
 		return ret;
diff --git a/sound/soc/intel/boards/cht_bsw_max98090_ti.c b/sound/soc/intel/boards/cht_bsw_max98090_ti.c
index 850310de774be..f43bc20d6aae4 100644
--- a/sound/soc/intel/boards/cht_bsw_max98090_ti.c
+++ b/sound/soc/intel/boards/cht_bsw_max98090_ti.c
@@ -112,8 +112,8 @@ static const struct snd_kcontrol_new cht_mc_controls[] = {
 static int cht_aif1_hw_params(struct snd_pcm_substream *substream,
 			     struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	int ret;
 
 	ret = snd_soc_dai_set_sysclk(codec_dai, M98090_REG_SYSTEM_CLOCK,
@@ -258,7 +258,7 @@ static int cht_codec_fixup(struct snd_soc_pcm_runtime *rtd,
 	int ret = 0;
 	unsigned int fmt = 0;
 
-	ret = snd_soc_dai_set_tdm_slot(asoc_rtd_to_cpu(rtd, 0), 0x3, 0x3, 2, 16);
+	ret = snd_soc_dai_set_tdm_slot(snd_soc_rtd_to_cpu(rtd, 0), 0x3, 0x3, 2, 16);
 	if (ret < 0) {
 		dev_err(rtd->dev, "can't set cpu_dai slot fmt: %d\n", ret);
 		return ret;
@@ -266,7 +266,7 @@ static int cht_codec_fixup(struct snd_soc_pcm_runtime *rtd,
 
 	fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_BP_FP;
 
-	ret = snd_soc_dai_set_fmt(asoc_rtd_to_cpu(rtd, 0), fmt);
+	ret = snd_soc_dai_set_fmt(snd_soc_rtd_to_cpu(rtd, 0), fmt);
 	if (ret < 0) {
 		dev_err(rtd->dev, "can't set cpu_dai set fmt: %d\n", ret);
 		return ret;
diff --git a/sound/soc/intel/boards/cht_bsw_nau8824.c b/sound/soc/intel/boards/cht_bsw_nau8824.c
index af2d9a78465d6..7651b83632fa4 100644
--- a/sound/soc/intel/boards/cht_bsw_nau8824.c
+++ b/sound/soc/intel/boards/cht_bsw_nau8824.c
@@ -72,8 +72,8 @@ static const struct snd_kcontrol_new cht_mc_controls[] = {
 static int cht_aif1_hw_params(struct snd_pcm_substream *substream,
 	struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	int ret;
 
 	ret = snd_soc_dai_set_sysclk(codec_dai, NAU8824_CLK_FLL_FS, 0,
@@ -96,7 +96,7 @@ static int cht_codec_init(struct snd_soc_pcm_runtime *runtime)
 {
 	struct cht_mc_private *ctx = snd_soc_card_get_drvdata(runtime->card);
 	struct snd_soc_jack *jack = &ctx->jack;
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(runtime, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(runtime, 0);
 	struct snd_soc_component *component = codec_dai->component;
 	int ret, jack_type;
 
@@ -145,7 +145,7 @@ static int cht_codec_fixup(struct snd_soc_pcm_runtime *rtd,
 	params_set_format(params, SNDRV_PCM_FORMAT_S24_LE);
 
 	/* TDM 4 slots 24 bit, set Rx & Tx bitmask to 4 active slots */
-	ret = snd_soc_dai_set_tdm_slot(asoc_rtd_to_codec(rtd, 0), 0xf, 0x1, 4, 24);
+	ret = snd_soc_dai_set_tdm_slot(snd_soc_rtd_to_codec(rtd, 0), 0xf, 0x1, 4, 24);
 	if (ret < 0) {
 		dev_err(rtd->dev, "can't set codec TDM slot %d\n", ret);
 		return ret;
diff --git a/sound/soc/intel/boards/cht_bsw_rt5645.c b/sound/soc/intel/boards/cht_bsw_rt5645.c
index 875bc0b3d85da..df23a581c10e5 100644
--- a/sound/soc/intel/boards/cht_bsw_rt5645.c
+++ b/sound/soc/intel/boards/cht_bsw_rt5645.c
@@ -207,8 +207,8 @@ static struct snd_soc_jack_pin cht_bsw_jack_pins[] = {
 static int cht_aif1_hw_params(struct snd_pcm_substream *substream,
 			     struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	int ret;
 
 	/* set codec PLL source to the 19.2MHz platform clock (MCLK) */
@@ -252,7 +252,7 @@ static int cht_codec_init(struct snd_soc_pcm_runtime *runtime)
 {
 	struct snd_soc_card *card = runtime->card;
 	struct cht_mc_private *ctx = snd_soc_card_get_drvdata(runtime->card);
-	struct snd_soc_component *component = asoc_rtd_to_codec(runtime, 0)->component;
+	struct snd_soc_component *component = snd_soc_rtd_to_codec(runtime, 0)->component;
 	int jack_type;
 	int ret;
 
@@ -359,7 +359,7 @@ static int cht_codec_fixup(struct snd_soc_pcm_runtime *rtd,
 		 * with explicit setting to I2S 2ch 16-bit. The word length is set with
 		 * dai_set_tdm_slot() since there is no other API exposed
 		 */
-		ret = snd_soc_dai_set_fmt(asoc_rtd_to_cpu(rtd, 0),
+		ret = snd_soc_dai_set_fmt(snd_soc_rtd_to_cpu(rtd, 0),
 					SND_SOC_DAIFMT_I2S     |
 					SND_SOC_DAIFMT_NB_NF   |
 					SND_SOC_DAIFMT_BP_FP
@@ -369,7 +369,7 @@ static int cht_codec_fixup(struct snd_soc_pcm_runtime *rtd,
 			return ret;
 		}
 
-		ret = snd_soc_dai_set_fmt(asoc_rtd_to_codec(rtd, 0),
+		ret = snd_soc_dai_set_fmt(snd_soc_rtd_to_codec(rtd, 0),
 					SND_SOC_DAIFMT_I2S     |
 					SND_SOC_DAIFMT_NB_NF   |
 					SND_SOC_DAIFMT_BC_FC
@@ -379,7 +379,7 @@ static int cht_codec_fixup(struct snd_soc_pcm_runtime *rtd,
 			return ret;
 		}
 
-		ret = snd_soc_dai_set_tdm_slot(asoc_rtd_to_cpu(rtd, 0), 0x3, 0x3, 2, 16);
+		ret = snd_soc_dai_set_tdm_slot(snd_soc_rtd_to_cpu(rtd, 0), 0x3, 0x3, 2, 16);
 		if (ret < 0) {
 			dev_err(rtd->dev, "can't set I2S config, err %d\n", ret);
 			return ret;
@@ -393,7 +393,7 @@ static int cht_codec_fixup(struct snd_soc_pcm_runtime *rtd,
 		/*
 		 * Default mode for SSP configuration is TDM 4 slot
 		 */
-		ret = snd_soc_dai_set_fmt(asoc_rtd_to_codec(rtd, 0),
+		ret = snd_soc_dai_set_fmt(snd_soc_rtd_to_codec(rtd, 0),
 					SND_SOC_DAIFMT_DSP_B |
 					SND_SOC_DAIFMT_IB_NF |
 					SND_SOC_DAIFMT_BC_FC);
@@ -403,7 +403,7 @@ static int cht_codec_fixup(struct snd_soc_pcm_runtime *rtd,
 		}
 
 		/* TDM 4 slots 24 bit, set Rx & Tx bitmask to 4 active slots */
-		ret = snd_soc_dai_set_tdm_slot(asoc_rtd_to_codec(rtd, 0), 0xF, 0xF, 4, 24);
+		ret = snd_soc_dai_set_tdm_slot(snd_soc_rtd_to_codec(rtd, 0), 0xF, 0xF, 4, 24);
 		if (ret < 0) {
 			dev_err(rtd->dev, "can't set codec TDM slot %d\n", ret);
 			return ret;
diff --git a/sound/soc/intel/boards/cht_bsw_rt5672.c b/sound/soc/intel/boards/cht_bsw_rt5672.c
index daa630a0efc18..f6da24f3c466e 100644
--- a/sound/soc/intel/boards/cht_bsw_rt5672.c
+++ b/sound/soc/intel/boards/cht_bsw_rt5672.c
@@ -155,8 +155,8 @@ static const struct snd_kcontrol_new cht_mc_controls[] = {
 static int cht_aif1_hw_params(struct snd_pcm_substream *substream,
 					struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	int ret;
 
 	/* set codec PLL source to the 19.2MHz platform clock (MCLK) */
@@ -188,7 +188,7 @@ static const struct acpi_gpio_mapping cht_rt5672_gpios[] = {
 static int cht_codec_init(struct snd_soc_pcm_runtime *runtime)
 {
 	int ret;
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(runtime, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(runtime, 0);
 	struct snd_soc_component *component = codec_dai->component;
 	struct cht_mc_private *ctx = snd_soc_card_get_drvdata(runtime->card);
 
@@ -297,7 +297,7 @@ static int cht_codec_fixup(struct snd_soc_pcm_runtime *rtd,
 	 * board. Since we only support 2 channels anyways, there is no need
 	 * for TDM on any cht-bsw-rt5672 designs. So we use I2S 2ch everywhere.
 	 */
-	ret = snd_soc_dai_set_fmt(asoc_rtd_to_cpu(rtd, 0),
+	ret = snd_soc_dai_set_fmt(snd_soc_rtd_to_cpu(rtd, 0),
 				  SND_SOC_DAIFMT_I2S     |
 				  SND_SOC_DAIFMT_NB_NF   |
 				  SND_SOC_DAIFMT_BP_FP);
@@ -306,7 +306,7 @@ static int cht_codec_fixup(struct snd_soc_pcm_runtime *rtd,
 		return ret;
 	}
 
-	ret = snd_soc_dai_set_tdm_slot(asoc_rtd_to_cpu(rtd, 0), 0x3, 0x3, 2, bits);
+	ret = snd_soc_dai_set_tdm_slot(snd_soc_rtd_to_cpu(rtd, 0), 0x3, 0x3, 2, bits);
 	if (ret < 0) {
 		dev_err(rtd->dev, "can't set I2S config, err %d\n", ret);
 		return ret;
diff --git a/sound/soc/intel/boards/cml_rt1011_rt5682.c b/sound/soc/intel/boards/cml_rt1011_rt5682.c
index 20da83d9eeced..679a09b63ea59 100644
--- a/sound/soc/intel/boards/cml_rt1011_rt5682.c
+++ b/sound/soc/intel/boards/cml_rt1011_rt5682.c
@@ -135,7 +135,7 @@ static struct snd_soc_jack_pin jack_pins[] = {
 static int cml_rt5682_codec_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct card_private *ctx = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
+	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
 	struct snd_soc_jack *jack;
 	int ret;
 
@@ -175,7 +175,7 @@ static int cml_rt5682_codec_init(struct snd_soc_pcm_runtime *rtd)
 
 static void cml_rt5682_codec_exit(struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
+	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
 
 	snd_soc_component_set_jack(component, NULL, NULL);
 }
@@ -212,8 +212,8 @@ static int cml_rt1011_spk_init(struct snd_soc_pcm_runtime *rtd)
 static int cml_rt5682_hw_params(struct snd_pcm_substream *substream,
 				struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	int clk_id, clk_freq, pll_out, ret;
 
 	clk_id = RT5682_PLL1_S_MCLK;
@@ -245,7 +245,7 @@ static int cml_rt5682_hw_params(struct snd_pcm_substream *substream,
 static int cml_rt1011_hw_params(struct snd_pcm_substream *substream,
 				struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *codec_dai;
 	struct snd_soc_card *card = rtd->card;
 	int srate, i, ret = 0;
@@ -369,7 +369,7 @@ static int sof_card_late_probe(struct snd_soc_card *card)
 static int hdmi_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct card_private *ctx = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_dai *dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct hdmi_pcm *pcm;
 
 	pcm = devm_kzalloc(rtd->card->dev, sizeof(*pcm), GFP_KERNEL);
diff --git a/sound/soc/intel/boards/ehl_rt5660.c b/sound/soc/intel/boards/ehl_rt5660.c
index fee80638cba27..686e603212243 100644
--- a/sound/soc/intel/boards/ehl_rt5660.c
+++ b/sound/soc/intel/boards/ehl_rt5660.c
@@ -74,7 +74,7 @@ struct sof_hdmi_pcm {
 static int hdmi_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct sof_card_private *ctx = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_dai *dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct sof_hdmi_pcm *pcm;
 
 	pcm = devm_kzalloc(rtd->card->dev, sizeof(*pcm), GFP_KERNEL);
@@ -109,8 +109,8 @@ static int card_late_probe(struct snd_soc_card *card)
 static int rt5660_hw_params(struct snd_pcm_substream *substream,
 			    struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	int ret;
 
 	ret = snd_soc_dai_set_sysclk(codec_dai,
@@ -267,7 +267,7 @@ static void hdmi_link_init(struct snd_soc_card *card,
 	 * hdmi codec is not supported
 	 */
 	for (i = HDMI_LINK_START; i <= HDMI_LINE_END; i++)
-		card->dai_link[i].codecs[0] = asoc_dummy_dlc;
+		card->dai_link[i].codecs[0] = snd_soc_dummy_dlc;
 }
 
 static int snd_ehl_rt5660_probe(struct platform_device *pdev)
diff --git a/sound/soc/intel/boards/glk_rt5682_max98357a.c b/sound/soc/intel/boards/glk_rt5682_max98357a.c
index cf0f89db3e204..657e4658234ce 100644
--- a/sound/soc/intel/boards/glk_rt5682_max98357a.c
+++ b/sound/soc/intel/boards/glk_rt5682_max98357a.c
@@ -152,8 +152,8 @@ static int geminilake_ssp_fixup(struct snd_soc_pcm_runtime *rtd,
 static int geminilake_rt5682_codec_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct glk_card_private *ctx = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct snd_soc_jack *jack;
 	int pll_id, pll_source, clk_id, ret;
 
@@ -215,8 +215,8 @@ static int geminilake_rt5682_codec_init(struct snd_soc_pcm_runtime *rtd)
 static int geminilake_rt5682_hw_params(struct snd_pcm_substream *substream,
 	struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	int ret;
 
 	/* Set valid bitmask & configuration for I2S in 24 bit */
@@ -236,7 +236,7 @@ static struct snd_soc_ops geminilake_rt5682_ops = {
 static int geminilake_hdmi_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct glk_card_private *ctx = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_dai *dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct glk_hdmi_pcm *pcm;
 
 	pcm = devm_kzalloc(rtd->card->dev, sizeof(*pcm), GFP_KERNEL);
@@ -253,7 +253,7 @@ static int geminilake_hdmi_init(struct snd_soc_pcm_runtime *rtd)
 
 static int geminilake_rt5682_fe_init(struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_component *component = asoc_rtd_to_cpu(rtd, 0)->component;
+	struct snd_soc_component *component = snd_soc_rtd_to_cpu(rtd, 0)->component;
 	struct snd_soc_dapm_context *dapm;
 	int ret;
 
diff --git a/sound/soc/intel/boards/hsw_rt5640.c b/sound/soc/intel/boards/hsw_rt5640.c
index 050c53ebd6ba8..2a2fe27dff0e8 100644
--- a/sound/soc/intel/boards/hsw_rt5640.c
+++ b/sound/soc/intel/boards/hsw_rt5640.c
@@ -47,8 +47,8 @@ static int codec_link_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 static int codec_link_hw_params(struct snd_pcm_substream *substream,
 				struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	int ret;
 
 	ret = snd_soc_dai_set_sysclk(codec_dai, RT5640_SCLK_S_MCLK, 12288000, SND_SOC_CLOCK_IN);
diff --git a/sound/soc/intel/boards/kbl_da7219_max98357a.c b/sound/soc/intel/boards/kbl_da7219_max98357a.c
index 97149513076f9..a5d8965303a88 100644
--- a/sound/soc/intel/boards/kbl_da7219_max98357a.c
+++ b/sound/soc/intel/boards/kbl_da7219_max98357a.c
@@ -179,8 +179,8 @@ static int kabylake_ssp_fixup(struct snd_soc_pcm_runtime *rtd,
 static int kabylake_da7219_codec_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct kbl_codec_private *ctx = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct snd_soc_jack *jack;
 	int ret;
 
@@ -225,7 +225,7 @@ static int kabylake_da7219_codec_init(struct snd_soc_pcm_runtime *rtd)
 static int kabylake_hdmi_init(struct snd_soc_pcm_runtime *rtd, int device)
 {
 	struct kbl_codec_private *ctx = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_dai *dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct kbl_hdmi_pcm *pcm;
 
 	pcm = devm_kzalloc(rtd->card->dev, sizeof(*pcm), GFP_KERNEL);
@@ -258,7 +258,7 @@ static int kabylake_hdmi3_init(struct snd_soc_pcm_runtime *rtd)
 static int kabylake_da7219_fe_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_dapm_context *dapm;
-	struct snd_soc_component *component = asoc_rtd_to_cpu(rtd, 0)->component;
+	struct snd_soc_component *component = snd_soc_rtd_to_cpu(rtd, 0)->component;
 
 	dapm = snd_soc_component_get_dapm(component);
 	snd_soc_dapm_ignore_suspend(dapm, "Reference Capture");
diff --git a/sound/soc/intel/boards/kbl_da7219_max98927.c b/sound/soc/intel/boards/kbl_da7219_max98927.c
index a1f8234c77bd2..98c11ec0adc01 100644
--- a/sound/soc/intel/boards/kbl_da7219_max98927.c
+++ b/sound/soc/intel/boards/kbl_da7219_max98927.c
@@ -194,7 +194,7 @@ static const struct snd_soc_dapm_route kabylake_ssp1_map[] = {
 static int kabylake_ssp0_hw_params(struct snd_pcm_substream *substream,
 	struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *runtime = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *runtime = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *codec_dai;
 	int ret, j;
 
@@ -239,7 +239,7 @@ static int kabylake_ssp0_hw_params(struct snd_pcm_substream *substream,
 
 static int kabylake_ssp0_trigger(struct snd_pcm_substream *substream, int cmd)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *codec_dai;
 	int j, ret;
 
@@ -354,7 +354,7 @@ static int kabylake_ssp_fixup(struct snd_soc_pcm_runtime *rtd,
 static int kabylake_da7219_codec_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct kbl_codec_private *ctx = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
+	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
 	struct snd_soc_jack *jack;
 	struct snd_soc_card *card = rtd->card;
 	int ret;
@@ -406,7 +406,7 @@ static int kabylake_dmic_init(struct snd_soc_pcm_runtime *rtd)
 static int kabylake_hdmi_init(struct snd_soc_pcm_runtime *rtd, int device)
 {
 	struct kbl_codec_private *ctx = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_dai *dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct kbl_hdmi_pcm *pcm;
 
 	pcm = devm_kzalloc(rtd->card->dev, sizeof(*pcm), GFP_KERNEL);
@@ -439,7 +439,7 @@ static int kabylake_hdmi3_init(struct snd_soc_pcm_runtime *rtd)
 static int kabylake_da7219_fe_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_dapm_context *dapm;
-	struct snd_soc_component *component = asoc_rtd_to_cpu(rtd, 0)->component;
+	struct snd_soc_component *component = snd_soc_rtd_to_cpu(rtd, 0)->component;
 
 	dapm = snd_soc_component_get_dapm(component);
 	snd_soc_dapm_ignore_suspend(dapm, "Reference Capture");
diff --git a/sound/soc/intel/boards/kbl_rt5660.c b/sound/soc/intel/boards/kbl_rt5660.c
index 2c7a547f63c90..30e0aca161cd5 100644
--- a/sound/soc/intel/boards/kbl_rt5660.c
+++ b/sound/soc/intel/boards/kbl_rt5660.c
@@ -157,7 +157,7 @@ static int kabylake_rt5660_codec_init(struct snd_soc_pcm_runtime *rtd)
 {
 	int ret;
 	struct kbl_codec_private *ctx = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
+	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
 	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
 
 	ret = devm_acpi_dev_add_driver_gpios(component->dev, acpi_rt5660_gpios);
@@ -222,7 +222,7 @@ static void kabylake_rt5660_codec_exit(struct snd_soc_pcm_runtime *rtd)
 static int kabylake_hdmi_init(struct snd_soc_pcm_runtime *rtd, int device)
 {
 	struct kbl_codec_private *ctx = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_dai *dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct kbl_hdmi_pcm *pcm;
 
 	pcm = devm_kzalloc(rtd->card->dev, sizeof(*pcm), GFP_KERNEL);
@@ -255,8 +255,8 @@ static int kabylake_hdmi3_init(struct snd_soc_pcm_runtime *rtd)
 static int kabylake_rt5660_hw_params(struct snd_pcm_substream *substream,
 	struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	int ret;
 
 	ret = snd_soc_dai_set_sysclk(codec_dai,
diff --git a/sound/soc/intel/boards/kbl_rt5663_max98927.c b/sound/soc/intel/boards/kbl_rt5663_max98927.c
index 2d4224c5b1520..9071b1f1cbd00 100644
--- a/sound/soc/intel/boards/kbl_rt5663_max98927.c
+++ b/sound/soc/intel/boards/kbl_rt5663_max98927.c
@@ -259,7 +259,7 @@ static int kabylake_rt5663_fe_init(struct snd_soc_pcm_runtime *rtd)
 {
 	int ret;
 	struct snd_soc_dapm_context *dapm;
-	struct snd_soc_component *component = asoc_rtd_to_cpu(rtd, 0)->component;
+	struct snd_soc_component *component = snd_soc_rtd_to_cpu(rtd, 0)->component;
 
 	dapm = snd_soc_component_get_dapm(component);
 	ret = snd_soc_dapm_ignore_suspend(dapm, "Reference Capture");
@@ -275,7 +275,7 @@ static int kabylake_rt5663_codec_init(struct snd_soc_pcm_runtime *rtd)
 {
 	int ret;
 	struct kbl_rt5663_private *ctx = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
+	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
 	struct snd_soc_jack *jack;
 
 	/*
@@ -324,7 +324,7 @@ static int kabylake_rt5663_max98927_codec_init(struct snd_soc_pcm_runtime *rtd)
 static int kabylake_hdmi_init(struct snd_soc_pcm_runtime *rtd, int device)
 {
 	struct kbl_rt5663_private *ctx = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_dai *dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct kbl_hdmi_pcm *pcm;
 
 	pcm = devm_kzalloc(rtd->card->dev, sizeof(*pcm), GFP_KERNEL);
@@ -472,8 +472,8 @@ static int kabylake_ssp_fixup(struct snd_soc_pcm_runtime *rtd,
 static int kabylake_rt5663_hw_params(struct snd_pcm_substream *substream,
 	struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	int ret;
 
 	/* use ASRC for internal clocks, as PLL rate isn't multiple of BCLK */
@@ -510,7 +510,7 @@ static int kabylake_dmic_fixup(struct snd_soc_pcm_runtime *rtd,
 static int kabylake_ssp0_hw_params(struct snd_pcm_substream *substream,
 					struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *codec_dai;
 	int ret = 0, j;
 
diff --git a/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c b/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
index 2c79fca57b19e..178fe9c37df62 100644
--- a/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
+++ b/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
@@ -217,7 +217,7 @@ static struct snd_soc_codec_conf max98927_codec_conf[] = {
 static int kabylake_rt5663_fe_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_dapm_context *dapm;
-	struct snd_soc_component *component = asoc_rtd_to_cpu(rtd, 0)->component;
+	struct snd_soc_component *component = snd_soc_rtd_to_cpu(rtd, 0)->component;
 	int ret;
 
 	dapm = snd_soc_component_get_dapm(component);
@@ -232,7 +232,7 @@ static int kabylake_rt5663_codec_init(struct snd_soc_pcm_runtime *rtd)
 {
 	int ret;
 	struct kbl_codec_private *ctx = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
+	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
 	struct snd_soc_jack *jack;
 
 	/*
@@ -268,7 +268,7 @@ static int kabylake_rt5663_codec_init(struct snd_soc_pcm_runtime *rtd)
 static int kabylake_hdmi_init(struct snd_soc_pcm_runtime *rtd, int device)
 {
 	struct kbl_codec_private *ctx = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_dai *dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct kbl_hdmi_pcm *pcm;
 
 	pcm = devm_kzalloc(rtd->card->dev, sizeof(*pcm), GFP_KERNEL);
@@ -407,8 +407,8 @@ static int kabylake_ssp_fixup(struct snd_soc_pcm_runtime *rtd,
 static int kabylake_rt5663_hw_params(struct snd_pcm_substream *substream,
 	struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	int ret;
 
 	/* use ASRC for internal clocks, as PLL rate isn't multiple of BCLK */
@@ -431,7 +431,7 @@ static struct snd_soc_ops kabylake_rt5663_ops = {
 static int kabylake_ssp0_hw_params(struct snd_pcm_substream *substream,
 	struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *codec_dai;
 	int ret = 0, j;
 
diff --git a/sound/soc/intel/boards/skl_hda_dsp_generic.c b/sound/soc/intel/boards/skl_hda_dsp_generic.c
index a06e05154ae1f..6c6ef63cd5d9e 100644
--- a/sound/soc/intel/boards/skl_hda_dsp_generic.c
+++ b/sound/soc/intel/boards/skl_hda_dsp_generic.c
@@ -155,7 +155,7 @@ static int skl_hda_fill_card_info(struct snd_soc_acpi_mach_params *mach_params)
 		card->num_dapm_widgets = ARRAY_SIZE(skl_hda_widgets);
 		if (!ctx->idisp_codec) {
 			for (i = 0; i < IDISP_DAI_COUNT; i++) {
-				skl_hda_be_dai_links[i].codecs = &asoc_dummy_dlc;
+				skl_hda_be_dai_links[i].codecs = &snd_soc_dummy_dlc;
 				skl_hda_be_dai_links[i].num_codecs = 1;
 			}
 		}
@@ -179,7 +179,7 @@ static void skl_set_hda_codec_autosuspend_delay(struct snd_soc_card *card)
 	for_each_card_rtds(card, rtd) {
 		if (!strstr(rtd->dai_link->codecs->name, "ehdaudio0D0"))
 			continue;
-		dai = asoc_rtd_to_codec(rtd, 0);
+		dai = snd_soc_rtd_to_codec(rtd, 0);
 		hda_pvt = snd_soc_component_get_drvdata(dai->component);
 		if (hda_pvt) {
 			/*
diff --git a/sound/soc/intel/boards/skl_nau88l25_max98357a.c b/sound/soc/intel/boards/skl_nau88l25_max98357a.c
index e13a5a4d8f7e9..0e7025834594a 100644
--- a/sound/soc/intel/boards/skl_nau88l25_max98357a.c
+++ b/sound/soc/intel/boards/skl_nau88l25_max98357a.c
@@ -168,7 +168,7 @@ static int skylake_ssp_fixup(struct snd_soc_pcm_runtime *rtd,
 static int skylake_nau8825_codec_init(struct snd_soc_pcm_runtime *rtd)
 {
 	int ret;
-	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
+	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
 
 	/*
 	 * Headset buttons map to the google Reference headset.
@@ -194,7 +194,7 @@ static int skylake_nau8825_codec_init(struct snd_soc_pcm_runtime *rtd)
 static int skylake_hdmi1_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct skl_nau8825_private *ctx = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_dai *dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct skl_hdmi_pcm *pcm;
 
 	pcm = devm_kzalloc(rtd->card->dev, sizeof(*pcm), GFP_KERNEL);
@@ -212,7 +212,7 @@ static int skylake_hdmi1_init(struct snd_soc_pcm_runtime *rtd)
 static int skylake_hdmi2_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct skl_nau8825_private *ctx = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_dai *dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct skl_hdmi_pcm *pcm;
 
 	pcm = devm_kzalloc(rtd->card->dev, sizeof(*pcm), GFP_KERNEL);
@@ -230,7 +230,7 @@ static int skylake_hdmi2_init(struct snd_soc_pcm_runtime *rtd)
 static int skylake_hdmi3_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct skl_nau8825_private *ctx = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_dai *dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct skl_hdmi_pcm *pcm;
 
 	pcm = devm_kzalloc(rtd->card->dev, sizeof(*pcm), GFP_KERNEL);
@@ -248,7 +248,7 @@ static int skylake_hdmi3_init(struct snd_soc_pcm_runtime *rtd)
 static int skylake_nau8825_fe_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_dapm_context *dapm;
-	struct snd_soc_component *component = asoc_rtd_to_cpu(rtd, 0)->component;
+	struct snd_soc_component *component = snd_soc_rtd_to_cpu(rtd, 0)->component;
 
 	dapm = snd_soc_component_get_dapm(component);
 	snd_soc_dapm_ignore_suspend(dapm, "Reference Capture");
@@ -307,8 +307,8 @@ static const struct snd_soc_ops skylake_nau8825_fe_ops = {
 static int skylake_nau8825_hw_params(struct snd_pcm_substream *substream,
 	struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	int ret;
 
 	ret = snd_soc_dai_set_sysclk(codec_dai,
diff --git a/sound/soc/intel/boards/skl_nau88l25_ssm4567.c b/sound/soc/intel/boards/skl_nau88l25_ssm4567.c
index 575604dc8936d..fadc25a536b4b 100644
--- a/sound/soc/intel/boards/skl_nau88l25_ssm4567.c
+++ b/sound/soc/intel/boards/skl_nau88l25_ssm4567.c
@@ -172,12 +172,12 @@ static int skylake_ssm4567_codec_init(struct snd_soc_pcm_runtime *rtd)
 	int ret;
 
 	/* Slot 1 for left */
-	ret = snd_soc_dai_set_tdm_slot(asoc_rtd_to_codec(rtd, 0), 0x01, 0x01, 2, 48);
+	ret = snd_soc_dai_set_tdm_slot(snd_soc_rtd_to_codec(rtd, 0), 0x01, 0x01, 2, 48);
 	if (ret < 0)
 		return ret;
 
 	/* Slot 2 for right */
-	ret = snd_soc_dai_set_tdm_slot(asoc_rtd_to_codec(rtd, 1), 0x02, 0x02, 2, 48);
+	ret = snd_soc_dai_set_tdm_slot(snd_soc_rtd_to_codec(rtd, 1), 0x02, 0x02, 2, 48);
 	if (ret < 0)
 		return ret;
 
@@ -187,7 +187,7 @@ static int skylake_ssm4567_codec_init(struct snd_soc_pcm_runtime *rtd)
 static int skylake_nau8825_codec_init(struct snd_soc_pcm_runtime *rtd)
 {
 	int ret;
-	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
+	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
 
 	/*
 	 * 4 buttons here map to the google Reference headset
@@ -213,7 +213,7 @@ static int skylake_nau8825_codec_init(struct snd_soc_pcm_runtime *rtd)
 static int skylake_hdmi1_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct skl_nau88125_private *ctx = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_dai *dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct skl_hdmi_pcm *pcm;
 
 	pcm = devm_kzalloc(rtd->card->dev, sizeof(*pcm), GFP_KERNEL);
@@ -231,7 +231,7 @@ static int skylake_hdmi1_init(struct snd_soc_pcm_runtime *rtd)
 static int skylake_hdmi2_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct skl_nau88125_private *ctx = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_dai *dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct skl_hdmi_pcm *pcm;
 
 	pcm = devm_kzalloc(rtd->card->dev, sizeof(*pcm), GFP_KERNEL);
@@ -250,7 +250,7 @@ static int skylake_hdmi2_init(struct snd_soc_pcm_runtime *rtd)
 static int skylake_hdmi3_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct skl_nau88125_private *ctx = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_dai *dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct skl_hdmi_pcm *pcm;
 
 	pcm = devm_kzalloc(rtd->card->dev, sizeof(*pcm), GFP_KERNEL);
@@ -268,7 +268,7 @@ static int skylake_hdmi3_init(struct snd_soc_pcm_runtime *rtd)
 static int skylake_nau8825_fe_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_dapm_context *dapm;
-	struct snd_soc_component *component = asoc_rtd_to_cpu(rtd, 0)->component;
+	struct snd_soc_component *component = snd_soc_rtd_to_cpu(rtd, 0)->component;
 
 	dapm = snd_soc_component_get_dapm(component);
 	snd_soc_dapm_ignore_suspend(dapm, "Reference Capture");
@@ -359,8 +359,8 @@ static int skylake_dmic_fixup(struct snd_soc_pcm_runtime *rtd,
 static int skylake_nau8825_hw_params(struct snd_pcm_substream *substream,
 	struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	int ret;
 
 	ret = snd_soc_dai_set_sysclk(codec_dai,
diff --git a/sound/soc/intel/boards/skl_rt286.c b/sound/soc/intel/boards/skl_rt286.c
index 4f3d655e2bfa8..c59c60e280916 100644
--- a/sound/soc/intel/boards/skl_rt286.c
+++ b/sound/soc/intel/boards/skl_rt286.c
@@ -112,7 +112,7 @@ static const struct snd_soc_dapm_route skylake_rt286_map[] = {
 static int skylake_rt286_fe_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_dapm_context *dapm;
-	struct snd_soc_component *component = asoc_rtd_to_cpu(rtd, 0)->component;
+	struct snd_soc_component *component = snd_soc_rtd_to_cpu(rtd, 0)->component;
 
 	dapm = snd_soc_component_get_dapm(component);
 	snd_soc_dapm_ignore_suspend(dapm, "Reference Capture");
@@ -122,7 +122,7 @@ static int skylake_rt286_fe_init(struct snd_soc_pcm_runtime *rtd)
 
 static int skylake_rt286_codec_init(struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
+	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
 	int ret;
 
 	ret = snd_soc_card_jack_new_pins(rtd->card, "Headset",
@@ -143,7 +143,7 @@ static int skylake_rt286_codec_init(struct snd_soc_pcm_runtime *rtd)
 static int skylake_hdmi_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct skl_rt286_private *ctx = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_dai *dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct skl_hdmi_pcm *pcm;
 
 	pcm = devm_kzalloc(rtd->card->dev, sizeof(*pcm), GFP_KERNEL);
@@ -228,8 +228,8 @@ static int skylake_ssp0_fixup(struct snd_soc_pcm_runtime *rtd,
 static int skylake_rt286_hw_params(struct snd_pcm_substream *substream,
 	struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	int ret;
 
 	ret = snd_soc_dai_set_sysclk(codec_dai, RT286_SCLK_S_PLL, 24000000,
diff --git a/sound/soc/intel/boards/sof_cirrus_common.c b/sound/soc/intel/boards/sof_cirrus_common.c
index 8b8b07e4f2feb..e71e09124b34e 100644
--- a/sound/soc/intel/boards/sof_cirrus_common.c
+++ b/sound/soc/intel/boards/sof_cirrus_common.c
@@ -91,7 +91,7 @@ static const struct {
 static int cs35l41_hw_params(struct snd_pcm_substream *substream,
 			     struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *codec_dai;
 	int clk_freq, i, ret;
 
diff --git a/sound/soc/intel/boards/sof_cs42l42.c b/sound/soc/intel/boards/sof_cs42l42.c
index e6695e77d5943..f378e0fd1ff7a 100644
--- a/sound/soc/intel/boards/sof_cs42l42.c
+++ b/sound/soc/intel/boards/sof_cs42l42.c
@@ -88,7 +88,7 @@ struct sof_card_private {
 static int sof_hdmi_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct sof_card_private *ctx = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_dai *dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct sof_hdmi_pcm *pcm;
 
 	pcm = devm_kzalloc(rtd->card->dev, sizeof(*pcm), GFP_KERNEL);
@@ -107,7 +107,7 @@ static int sof_hdmi_init(struct snd_soc_pcm_runtime *rtd)
 static int sof_cs42l42_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct sof_card_private *ctx = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
+	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
 	struct snd_soc_jack *jack = &ctx->headset_jack;
 	int ret;
 
@@ -143,7 +143,7 @@ static int sof_cs42l42_init(struct snd_soc_pcm_runtime *rtd)
 
 static void sof_cs42l42_exit(struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
+	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
 
 	snd_soc_component_set_jack(component, NULL, NULL);
 }
@@ -151,8 +151,8 @@ static void sof_cs42l42_exit(struct snd_soc_pcm_runtime *rtd)
 static int sof_cs42l42_hw_params(struct snd_pcm_substream *substream,
 				 struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	int clk_freq, ret;
 
 	clk_freq = sof_dai_get_bclk(rtd); /* BCLK freq */
@@ -503,7 +503,7 @@ static int create_bt_offload_dai_links(struct device *dev,
 		goto devm_err;
 
 	links[*id].id = *id;
-	links[*id].codecs = &asoc_dummy_dlc;
+	links[*id].codecs = &snd_soc_dummy_dlc;
 	links[*id].num_codecs = 1;
 	links[*id].platforms = platform_component;
 	links[*id].num_platforms = ARRAY_SIZE(platform_component);
diff --git a/sound/soc/intel/boards/sof_da7219_max98373.c b/sound/soc/intel/boards/sof_da7219_max98373.c
index bbd47e7e43430..eb1e0748cca1d 100644
--- a/sound/soc/intel/boards/sof_da7219_max98373.c
+++ b/sound/soc/intel/boards/sof_da7219_max98373.c
@@ -160,7 +160,7 @@ static struct snd_soc_jack headset;
 
 static int da7219_codec_init(struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct snd_soc_component *component = codec_dai->component;
 	struct snd_soc_jack *jack;
 	int ret;
@@ -202,11 +202,11 @@ static int da7219_codec_init(struct snd_soc_pcm_runtime *rtd)
 static int ssp1_hw_params(struct snd_pcm_substream *substream,
 			      struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *runtime = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *runtime = snd_soc_substream_to_rtd(substream);
 	int ret, j;
 
 	for (j = 0; j < runtime->dai_link->num_codecs; j++) {
-		struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(runtime, j);
+		struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(runtime, j);
 
 		if (!strcmp(codec_dai->component->name, MAXIM_DEV0_NAME)) {
 			/* vmon_slot_no = 0 imon_slot_no = 1 for TX slots */
@@ -247,7 +247,7 @@ static struct snd_soc_codec_conf max98373_codec_conf[] = {
 static int hdmi_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct card_private *ctx = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_dai *dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct hdmi_pcm *pcm;
 
 	pcm = devm_kzalloc(rtd->card->dev, sizeof(*pcm), GFP_KERNEL);
diff --git a/sound/soc/intel/boards/sof_es8336.c b/sound/soc/intel/boards/sof_es8336.c
index f8a3e8a91761a..4cafe20b14fef 100644
--- a/sound/soc/intel/boards/sof_es8336.c
+++ b/sound/soc/intel/boards/sof_es8336.c
@@ -126,7 +126,7 @@ static void pcm_pop_work_events(struct work_struct *work)
 
 static int sof_8336_trigger(struct snd_pcm_substream *substream, int cmd)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_card *card = rtd->card;
 	struct sof_es8336_private *priv = snd_soc_card_get_drvdata(card);
 
@@ -251,7 +251,7 @@ static int dmic_init(struct snd_soc_pcm_runtime *runtime)
 static int sof_hdmi_init(struct snd_soc_pcm_runtime *runtime)
 {
 	struct sof_es8336_private *priv = snd_soc_card_get_drvdata(runtime->card);
-	struct snd_soc_dai *dai = asoc_rtd_to_codec(runtime, 0);
+	struct snd_soc_dai *dai = snd_soc_rtd_to_codec(runtime, 0);
 	struct sof_hdmi_pcm *pcm;
 
 	pcm = devm_kzalloc(runtime->card->dev, sizeof(*pcm), GFP_KERNEL);
@@ -269,7 +269,7 @@ static int sof_hdmi_init(struct snd_soc_pcm_runtime *runtime)
 
 static int sof_es8316_init(struct snd_soc_pcm_runtime *runtime)
 {
-	struct snd_soc_component *codec = asoc_rtd_to_codec(runtime, 0)->component;
+	struct snd_soc_component *codec = snd_soc_rtd_to_codec(runtime, 0)->component;
 	struct snd_soc_card *card = runtime->card;
 	struct sof_es8336_private *priv = snd_soc_card_get_drvdata(card);
 	const struct snd_soc_dapm_route *custom_map;
@@ -308,7 +308,7 @@ static int sof_es8316_init(struct snd_soc_pcm_runtime *runtime)
 
 static void sof_es8316_exit(struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
+	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
 
 	snd_soc_component_set_jack(component, NULL, NULL);
 }
@@ -355,8 +355,8 @@ static const struct dmi_system_id sof_es8336_quirk_table[] = {
 static int sof_es8336_hw_params(struct snd_pcm_substream *substream,
 				struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	const int sysclk = 19200000;
 	int ret;
 
@@ -565,7 +565,7 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 			if (!links[id].name)
 				return NULL;
 			links[id].id = id + hdmi_id_offset;
-			links[id].codecs = &asoc_dummy_dlc;
+			links[id].codecs = &snd_soc_dummy_dlc;
 			links[id].num_codecs = 1;
 			links[id].platforms = platform_component;
 			links[id].num_platforms = ARRAY_SIZE(platform_component);
diff --git a/sound/soc/intel/boards/sof_maxim_common.c b/sound/soc/intel/boards/sof_maxim_common.c
index 628b6d5d3ee42..3c00afc328050 100644
--- a/sound/soc/intel/boards/sof_maxim_common.c
+++ b/sound/soc/intel/boards/sof_maxim_common.c
@@ -59,7 +59,7 @@ EXPORT_SYMBOL_NS(max_98373_components, SND_SOC_INTEL_SOF_MAXIM_COMMON);
 static int max_98373_hw_params(struct snd_pcm_substream *substream,
 			       struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *codec_dai;
 	int j;
 
@@ -78,7 +78,7 @@ static int max_98373_hw_params(struct snd_pcm_substream *substream,
 
 int max_98373_trigger(struct snd_pcm_substream *substream, int cmd)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *codec_dai;
 	struct snd_soc_dai *cpu_dai;
 	int j;
@@ -88,7 +88,7 @@ int max_98373_trigger(struct snd_pcm_substream *substream, int cmd)
 	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
 		return 0;
 
-	cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	for_each_rtd_codec_dais(rtd, j, codec_dai) {
 		struct snd_soc_dapm_context *dapm =
 				snd_soc_component_get_dapm(cpu_dai->component);
@@ -223,7 +223,7 @@ static const struct {
 static int max_98390_hw_params(struct snd_pcm_substream *substream,
 			       struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *codec_dai;
 	int i, ret;
 
diff --git a/sound/soc/intel/boards/sof_nau8825.c b/sound/soc/intel/boards/sof_nau8825.c
index 46b7ecf6f9f1a..61a18c32b4e70 100644
--- a/sound/soc/intel/boards/sof_nau8825.c
+++ b/sound/soc/intel/boards/sof_nau8825.c
@@ -67,7 +67,7 @@ struct sof_card_private {
 static int sof_hdmi_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct sof_card_private *ctx = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_dai *dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct sof_hdmi_pcm *pcm;
 
 	pcm = devm_kzalloc(rtd->card->dev, sizeof(*pcm), GFP_KERNEL);
@@ -97,7 +97,7 @@ static struct snd_soc_jack_pin jack_pins[] = {
 static int sof_nau8825_codec_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct sof_card_private *ctx = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
+	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
 
 	struct snd_soc_jack *jack;
 	int ret;
@@ -136,7 +136,7 @@ static int sof_nau8825_codec_init(struct snd_soc_pcm_runtime *rtd)
 
 static void sof_nau8825_codec_exit(struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
+	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
 
 	snd_soc_component_set_jack(component, NULL, NULL);
 }
@@ -144,8 +144,8 @@ static void sof_nau8825_codec_exit(struct snd_soc_pcm_runtime *rtd)
 static int sof_nau8825_hw_params(struct snd_pcm_substream *substream,
 				 struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	int clk_freq, ret;
 
 	clk_freq = sof_dai_get_bclk(rtd); /* BCLK freq */
@@ -525,7 +525,7 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 		links[id].name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d-BT", port);
 		if (!links[id].name)
 			goto devm_err;
-		links[id].codecs = &asoc_dummy_dlc;
+		links[id].codecs = &snd_soc_dummy_dlc;
 		links[id].num_codecs = 1;
 		links[id].platforms = platform_component;
 		links[id].num_platforms = ARRAY_SIZE(platform_component);
diff --git a/sound/soc/intel/boards/sof_pcm512x.c b/sound/soc/intel/boards/sof_pcm512x.c
index 9f673ccf81b54..b01cb23295425 100644
--- a/sound/soc/intel/boards/sof_pcm512x.c
+++ b/sound/soc/intel/boards/sof_pcm512x.c
@@ -71,7 +71,7 @@ static const struct dmi_system_id sof_pcm512x_quirk_table[] = {
 static int sof_hdmi_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct sof_card_private *ctx = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_dai *dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct sof_hdmi_pcm *pcm;
 
 	pcm = devm_kzalloc(rtd->card->dev, sizeof(*pcm), GFP_KERNEL);
@@ -89,7 +89,7 @@ static int sof_hdmi_init(struct snd_soc_pcm_runtime *rtd)
 
 static int sof_pcm512x_codec_init(struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_component *codec = asoc_rtd_to_codec(rtd, 0)->component;
+	struct snd_soc_component *codec = snd_soc_rtd_to_codec(rtd, 0)->component;
 
 	snd_soc_component_update_bits(codec, PCM512x_GPIO_EN, 0x08, 0x08);
 	snd_soc_component_update_bits(codec, PCM512x_GPIO_OUTPUT_4, 0x0f, 0x02);
@@ -101,8 +101,8 @@ static int sof_pcm512x_codec_init(struct snd_soc_pcm_runtime *rtd)
 
 static int aif1_startup(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_component *codec = asoc_rtd_to_codec(rtd, 0)->component;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_component *codec = snd_soc_rtd_to_codec(rtd, 0)->component;
 
 	snd_soc_component_update_bits(codec, PCM512x_GPIO_CONTROL_1,
 				      0x08, 0x08);
@@ -112,8 +112,8 @@ static int aif1_startup(struct snd_pcm_substream *substream)
 
 static void aif1_shutdown(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_component *codec = asoc_rtd_to_codec(rtd, 0)->component;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_component *codec = snd_soc_rtd_to_codec(rtd, 0)->component;
 
 	snd_soc_component_update_bits(codec, PCM512x_GPIO_CONTROL_1,
 				      0x08, 0x00);
@@ -331,7 +331,7 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 				devm_kasprintf(dev, GFP_KERNEL,
 					       "intel-hdmi-hifi%d", i);
 		} else {
-			idisp_components[i - 1] = asoc_dummy_dlc;
+			idisp_components[i - 1] = snd_soc_dummy_dlc;
 		}
 		if (!idisp_components[i - 1].dai_name)
 			goto devm_err;
diff --git a/sound/soc/intel/boards/sof_realtek_common.c b/sound/soc/intel/boards/sof_realtek_common.c
index 6c12ca92f3713..80c8687cd1da5 100644
--- a/sound/soc/intel/boards/sof_realtek_common.c
+++ b/sound/soc/intel/boards/sof_realtek_common.c
@@ -68,7 +68,7 @@ static const struct {
 static int rt1011_hw_params(struct snd_pcm_substream *substream,
 			    struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *codec_dai;
 	int srate, i, ret = 0;
 
@@ -264,7 +264,7 @@ static const struct {
 static int rt1015_hw_params(struct snd_pcm_substream *substream,
 			    struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai_link *dai_link = rtd->dai_link;
 	struct snd_soc_dai *codec_dai;
 	int i, clk_freq;
@@ -423,9 +423,9 @@ static int rt1308_init(struct snd_soc_pcm_runtime *rtd)
 static int rt1308_hw_params(struct snd_pcm_substream *substream,
 			    struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_card *card = rtd->card;
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	int clk_id, clk_freq, pll_out;
 	int ret;
 
diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index fae091b9b55c5..ed0b86a228c8b 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -262,7 +262,7 @@ static const struct dmi_system_id sof_rt5682_quirk_table[] = {
 static int sof_hdmi_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct sof_card_private *ctx = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_dai *dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct sof_hdmi_pcm *pcm;
 
 	pcm = devm_kzalloc(rtd->card->dev, sizeof(*pcm), GFP_KERNEL);
@@ -292,7 +292,7 @@ static struct snd_soc_jack_pin jack_pins[] = {
 static int sof_rt5682_codec_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct sof_card_private *ctx = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
+	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
 	struct snd_soc_jack *jack;
 	int extra_jack_data;
 	int ret;
@@ -381,7 +381,7 @@ static int sof_rt5682_codec_init(struct snd_soc_pcm_runtime *rtd)
 
 static void sof_rt5682_codec_exit(struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
+	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
 
 	snd_soc_component_set_jack(component, NULL, NULL);
 }
@@ -389,9 +389,9 @@ static void sof_rt5682_codec_exit(struct snd_soc_pcm_runtime *rtd)
 static int sof_rt5682_hw_params(struct snd_pcm_substream *substream,
 				struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct sof_card_private *ctx = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	int pll_id, pll_source, pll_in, pll_out, clk_id, ret;
 
 	if (sof_rt5682_quirk & SOF_RT5682_MCLK_EN) {
@@ -797,7 +797,7 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 			if (!idisp_components[i - 1].dai_name)
 				goto devm_err;
 		} else {
-			idisp_components[i - 1] = asoc_dummy_dlc;
+			idisp_components[i - 1] = snd_soc_dummy_dlc;
 		}
 
 		links[id].codecs = &idisp_components[i - 1];
@@ -887,7 +887,7 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 		links[id].name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d-BT", port);
 		if (!links[id].name)
 			goto devm_err;
-		links[id].codecs = &asoc_dummy_dlc;
+		links[id].codecs = &snd_soc_dummy_dlc;
 		links[id].num_codecs = 1;
 		links[id].platforms = platform_component;
 		links[id].num_platforms = ARRAY_SIZE(platform_component);
@@ -914,7 +914,7 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 			if (!links[id].name)
 				return NULL;
 			links[id].id = id + hdmi_id_offset;
-			links[id].codecs = &asoc_dummy_dlc;
+			links[id].codecs = &snd_soc_dummy_dlc;
 			links[id].num_codecs = 1;
 			links[id].platforms = platform_component;
 			links[id].num_platforms = ARRAY_SIZE(platform_component);
diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 5a1c750e6ae6a..25d1cd78cbb95 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -515,12 +515,12 @@ int sdw_startup(struct snd_pcm_substream *substream)
 
 int sdw_prepare(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct sdw_stream_runtime *sdw_stream;
 	struct snd_soc_dai *dai;
 
 	/* Find stream from first CPU DAI */
-	dai = asoc_rtd_to_cpu(rtd, 0);
+	dai = snd_soc_rtd_to_cpu(rtd, 0);
 
 	sdw_stream = snd_soc_dai_get_stream(dai, substream->stream);
 	if (IS_ERR(sdw_stream)) {
@@ -533,13 +533,13 @@ int sdw_prepare(struct snd_pcm_substream *substream)
 
 int sdw_trigger(struct snd_pcm_substream *substream, int cmd)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct sdw_stream_runtime *sdw_stream;
 	struct snd_soc_dai *dai;
 	int ret;
 
 	/* Find stream from first CPU DAI */
-	dai = asoc_rtd_to_cpu(rtd, 0);
+	dai = snd_soc_rtd_to_cpu(rtd, 0);
 
 	sdw_stream = snd_soc_dai_get_stream(dai, substream->stream);
 	if (IS_ERR(sdw_stream)) {
@@ -573,7 +573,7 @@ int sdw_trigger(struct snd_pcm_substream *substream, int cmd)
 int sdw_hw_params(struct snd_pcm_substream *substream,
 		  struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	int ch = params_channels(params);
 	struct snd_soc_dai *codec_dai;
 	struct snd_soc_dai *cpu_dai;
@@ -621,12 +621,12 @@ int sdw_hw_params(struct snd_pcm_substream *substream,
 
 int sdw_hw_free(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct sdw_stream_runtime *sdw_stream;
 	struct snd_soc_dai *dai;
 
 	/* Find stream from first CPU DAI */
-	dai = asoc_rtd_to_cpu(rtd, 0);
+	dai = snd_soc_rtd_to_cpu(rtd, 0);
 
 	sdw_stream = snd_soc_dai_get_stream(dai, substream->stream);
 	if (IS_ERR(sdw_stream)) {
@@ -1769,7 +1769,7 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 			if (!idisp_components[i].dai_name)
 				return -ENOMEM;
 		} else {
-			idisp_components[i] = asoc_dummy_dlc;
+			idisp_components[i] = snd_soc_dummy_dlc;
 		}
 
 		cpu_name = devm_kasprintf(dev, GFP_KERNEL,
@@ -1800,7 +1800,7 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 
 		cpus[cpu_id].dai_name = cpu_name;
 		init_dai_link(dev, dai_links + link_index, be_id, name, 1, 1,
-			      cpus + cpu_id, 1, &asoc_dummy_dlc, 1, NULL, NULL);
+			      cpus + cpu_id, 1, &snd_soc_dummy_dlc, 1, NULL, NULL);
 	}
 
 	card->dai_link = dai_links;
diff --git a/sound/soc/intel/boards/sof_sdw_cs42l42.c b/sound/soc/intel/boards/sof_sdw_cs42l42.c
index ad130d913415e..436f41086da69 100644
--- a/sound/soc/intel/boards/sof_sdw_cs42l42.c
+++ b/sound/soc/intel/boards/sof_sdw_cs42l42.c
@@ -50,7 +50,7 @@ static int cs42l42_rtd_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
 	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct snd_soc_component *component = codec_dai->component;
 	struct snd_soc_jack *jack;
 	int ret;
diff --git a/sound/soc/intel/boards/sof_sdw_hdmi.c b/sound/soc/intel/boards/sof_sdw_hdmi.c
index d47d8bf528c13..7e07aa685573d 100644
--- a/sound/soc/intel/boards/sof_sdw_hdmi.c
+++ b/sound/soc/intel/boards/sof_sdw_hdmi.c
@@ -24,7 +24,7 @@ struct hdmi_pcm {
 int sof_sdw_hdmi_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct mc_private *ctx = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_dai *dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct hdmi_pcm *pcm;
 
 	pcm = devm_kzalloc(rtd->card->dev, sizeof(*pcm), GFP_KERNEL);
diff --git a/sound/soc/intel/boards/sof_sdw_maxim.c b/sound/soc/intel/boards/sof_sdw_maxim.c
index 414c4d8dac777..e36b8d8c70c9c 100644
--- a/sound/soc/intel/boards/sof_sdw_maxim.c
+++ b/sound/soc/intel/boards/sof_sdw_maxim.c
@@ -64,7 +64,7 @@ static int spk_init(struct snd_soc_pcm_runtime *rtd)
 
 static int mx8373_enable_spk_pin(struct snd_pcm_substream *substream, bool enable)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *codec_dai;
 	struct snd_soc_dai *cpu_dai;
 	int ret;
@@ -74,7 +74,7 @@ static int mx8373_enable_spk_pin(struct snd_pcm_substream *substream, bool enabl
 	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
 		return 0;
 
-	cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	for_each_rtd_codec_dais(rtd, j, codec_dai) {
 		struct snd_soc_dapm_context *dapm =
 				snd_soc_component_get_dapm(cpu_dai->component);
diff --git a/sound/soc/intel/boards/sof_sdw_rt5682.c b/sound/soc/intel/boards/sof_sdw_rt5682.c
index 3a9be8211586f..7b7c9def398be 100644
--- a/sound/soc/intel/boards/sof_sdw_rt5682.c
+++ b/sound/soc/intel/boards/sof_sdw_rt5682.c
@@ -49,7 +49,7 @@ static int rt5682_rtd_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
 	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct snd_soc_component *component = codec_dai->component;
 	struct snd_soc_jack *jack;
 	int ret;
diff --git a/sound/soc/intel/boards/sof_sdw_rt700.c b/sound/soc/intel/boards/sof_sdw_rt700.c
index c93b1f5b94409..a1714afe85155 100644
--- a/sound/soc/intel/boards/sof_sdw_rt700.c
+++ b/sound/soc/intel/boards/sof_sdw_rt700.c
@@ -49,7 +49,7 @@ static int rt700_rtd_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
 	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct snd_soc_component *component = codec_dai->component;
 	struct snd_soc_jack *jack;
 	int ret;
diff --git a/sound/soc/intel/boards/sof_sdw_rt711.c b/sound/soc/intel/boards/sof_sdw_rt711.c
index 2b05e2a707dec..38782fdfcf154 100644
--- a/sound/soc/intel/boards/sof_sdw_rt711.c
+++ b/sound/soc/intel/boards/sof_sdw_rt711.c
@@ -73,7 +73,7 @@ static int rt711_rtd_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
 	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct snd_soc_component *component = codec_dai->component;
 	struct snd_soc_jack *jack;
 	int ret;
diff --git a/sound/soc/intel/boards/sof_sdw_rt_amp.c b/sound/soc/intel/boards/sof_sdw_rt_amp.c
index 26bf9e0dd3d24..436975b6bdc17 100644
--- a/sound/soc/intel/boards/sof_sdw_rt_amp.c
+++ b/sound/soc/intel/boards/sof_sdw_rt_amp.c
@@ -251,9 +251,9 @@ static int all_spk_init(struct snd_soc_pcm_runtime *rtd)
 static int rt1308_i2s_hw_params(struct snd_pcm_substream *substream,
 				struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_card *card = rtd->card;
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	int clk_id, clk_freq, pll_out;
 	int err;
 
diff --git a/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c b/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c
index 623e3bebb8884..ef62ac5fdf553 100644
--- a/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c
+++ b/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c
@@ -78,7 +78,7 @@ static int rt_sdca_jack_rtd_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
 	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct snd_soc_component *component = codec_dai->component;
 	struct snd_soc_jack *jack;
 	int ret;
diff --git a/sound/soc/intel/boards/sof_ssp_amp.c b/sound/soc/intel/boards/sof_ssp_amp.c
index 5aa16fd3939b9..8647d6c4572f7 100644
--- a/sound/soc/intel/boards/sof_ssp_amp.c
+++ b/sound/soc/intel/boards/sof_ssp_amp.c
@@ -170,7 +170,7 @@ static struct snd_soc_dai_link_component dmic_component[] = {
 static int sof_hdmi_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct sof_card_private *ctx = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_dai *dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct sof_hdmi_pcm *pcm;
 
 	pcm = devm_kzalloc(rtd->card->dev, sizeof(*pcm), GFP_KERNEL);
@@ -226,7 +226,7 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 			if (!links[id].name)
 				return NULL;
 			links[id].id = id;
-			links[id].codecs = &asoc_dummy_dlc;
+			links[id].codecs = &snd_soc_dummy_dlc;
 			links[id].num_codecs = 1;
 			links[id].platforms = platform_component;
 			links[id].num_platforms = ARRAY_SIZE(platform_component);
@@ -324,7 +324,7 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 				if (!idisp_components[i - 1].dai_name)
 					goto devm_err;
 			} else {
-				idisp_components[i - 1] = asoc_dummy_dlc;
+				idisp_components[i - 1] = snd_soc_dummy_dlc;
 			}
 
 			links[id].codecs = &idisp_components[i - 1];
@@ -352,7 +352,7 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 		links[id].name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d-BT", port);
 		if (!links[id].name)
 			goto devm_err;
-		links[id].codecs = &asoc_dummy_dlc;
+		links[id].codecs = &snd_soc_dummy_dlc;
 		links[id].num_codecs = 1;
 		links[id].platforms = platform_component;
 		links[id].num_platforms = ARRAY_SIZE(platform_component);
diff --git a/sound/soc/intel/boards/sof_wm8804.c b/sound/soc/intel/boards/sof_wm8804.c
index 17224d26d9d6b..4cb0d463bf404 100644
--- a/sound/soc/intel/boards/sof_wm8804.c
+++ b/sound/soc/intel/boards/sof_wm8804.c
@@ -49,9 +49,9 @@ static const struct dmi_system_id sof_wm8804_quirk_table[] = {
 static int sof_wm8804_hw_params(struct snd_pcm_substream *substream,
 				struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct sof_card_private *ctx = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct snd_soc_component *codec = codec_dai->component;
 	const int sysclk = 27000000; /* This is fixed on this board */
 	int samplerate;
diff --git a/sound/soc/intel/catpt/pcm.c b/sound/soc/intel/catpt/pcm.c
index f1a5cb825ff1f..3daf5eb37f7ba 100644
--- a/sound/soc/intel/catpt/pcm.c
+++ b/sound/soc/intel/catpt/pcm.c
@@ -74,8 +74,8 @@ static struct catpt_stream_template *catpt_topology[] = {
 static struct catpt_stream_template *
 catpt_get_stream_template(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtm = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtm, 0);
+	struct snd_soc_pcm_runtime *rtm = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtm, 0);
 	enum catpt_stream_type type;
 
 	type = cpu_dai->driver->id;
@@ -593,7 +593,7 @@ static int catpt_component_pcm_construct(struct snd_soc_component *component,
 static int catpt_component_open(struct snd_soc_component *component,
 				struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtm = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtm = snd_soc_substream_to_rtd(substream);
 
 	if (!rtm->dai_link->no_pcm)
 		snd_soc_set_runtime_hwparams(substream, &catpt_pcm_hardware);
@@ -604,8 +604,8 @@ static snd_pcm_uframes_t
 catpt_component_pointer(struct snd_soc_component *component,
 			struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtm = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtm, 0);
+	struct snd_soc_pcm_runtime *rtm = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtm, 0);
 	struct catpt_stream_runtime *stream;
 	struct catpt_dev *cdev = dev_get_drvdata(component->dev);
 	u32 pos;
@@ -631,7 +631,7 @@ static const struct snd_soc_dai_ops catpt_fe_dai_ops = {
 static int catpt_dai_pcm_new(struct snd_soc_pcm_runtime *rtm,
 			     struct snd_soc_dai *dai)
 {
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtm, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtm, 0);
 	struct catpt_ssp_device_format devfmt;
 	struct catpt_dev *cdev = dev_get_drvdata(dai->dev);
 	int ret;
diff --git a/sound/soc/intel/keembay/kmb_platform.c b/sound/soc/intel/keembay/kmb_platform.c
index 6b06b7b5ede86..e929497a5eb5d 100644
--- a/sound/soc/intel/keembay/kmb_platform.c
+++ b/sound/soc/intel/keembay/kmb_platform.c
@@ -252,10 +252,10 @@ static int kmb_pcm_open(struct snd_soc_component *component,
 			struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct kmb_i2s_info *kmb_i2s;
 
-	kmb_i2s = snd_soc_dai_get_drvdata(asoc_rtd_to_cpu(rtd, 0));
+	kmb_i2s = snd_soc_dai_get_drvdata(snd_soc_rtd_to_cpu(rtd, 0));
 	snd_soc_set_runtime_hwparams(substream, &kmb_pcm_hardware);
 	snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIODS);
 	runtime->private_data = kmb_i2s;
diff --git a/sound/soc/intel/skylake/skl-pcm.c b/sound/soc/intel/skylake/skl-pcm.c
index ac3dc8c63c260..9f7b0a944bb13 100644
--- a/sound/soc/intel/skylake/skl-pcm.c
+++ b/sound/soc/intel/skylake/skl-pcm.c
@@ -545,8 +545,8 @@ static int skl_link_hw_params(struct snd_pcm_substream *substream,
 {
 	struct hdac_bus *bus = dev_get_drvdata(dai->dev);
 	struct hdac_ext_stream *link_dev;
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct skl_pipe_params p_params = {0};
 	struct hdac_ext_link *link;
 	int stream_tag;
@@ -633,7 +633,7 @@ static int skl_link_hw_free(struct snd_pcm_substream *substream,
 		struct snd_soc_dai *dai)
 {
 	struct hdac_bus *bus = dev_get_drvdata(dai->dev);
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct hdac_ext_stream *link_dev =
 				snd_soc_dai_get_dma_data(dai, substream);
 	struct hdac_ext_link *link;
@@ -643,7 +643,7 @@ static int skl_link_hw_free(struct snd_pcm_substream *substream,
 
 	link_dev->link_prepared = 0;
 
-	link = snd_hdac_ext_bus_get_hlink_by_name(bus, asoc_rtd_to_codec(rtd, 0)->component->name);
+	link = snd_hdac_ext_bus_get_hlink_by_name(bus, snd_soc_rtd_to_codec(rtd, 0)->component->name);
 	if (!link)
 		return -EINVAL;
 
@@ -1070,10 +1070,10 @@ int skl_dai_load(struct snd_soc_component *cmp, int index,
 static int skl_platform_soc_open(struct snd_soc_component *component,
 				 struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai_link *dai_link = rtd->dai_link;
 
-	dev_dbg(asoc_rtd_to_cpu(rtd, 0)->dev, "In %s:%s\n", __func__,
+	dev_dbg(snd_soc_rtd_to_cpu(rtd, 0)->dev, "In %s:%s\n", __func__,
 					dai_link->cpus->dai_name);
 
 	snd_soc_set_runtime_hwparams(substream, &azx_pcm_hw);
@@ -1217,8 +1217,8 @@ static snd_pcm_uframes_t skl_platform_soc_pointer(
 static u64 skl_adjust_codec_delay(struct snd_pcm_substream *substream,
 				u64 nsec)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	u64 codec_frames, codec_nsecs;
 
 	if (!codec_dai->driver->ops->delay)
@@ -1272,7 +1272,7 @@ static int skl_platform_soc_get_time_info(
 static int skl_platform_soc_new(struct snd_soc_component *component,
 				struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_dai *dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct hdac_bus *bus = dev_get_drvdata(dai->dev);
 	struct snd_pcm *pcm = rtd->pcm;
 	unsigned int size;
-- 
2.25.1

