Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F176714185
	for <lists+alsa-devel@lfdr.de>; Mon, 29 May 2023 03:07:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21D1283B;
	Mon, 29 May 2023 03:06:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21D1283B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685322453;
	bh=4RPy0dDdZdLQggfTVQW0tsnOvk/Irshtn2QIoq9etu0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KDxTnEC4IHWGESWO1Gcq/cOUQUMS9BNAMConYajfQvjm397CnA0ZDhxgbC8PfJcY7
	 RgTH9MpvDPhTyBGinK4XembBzShAI3C64tUjx19JLLza58hVyaj4AtyExpWZPiOsRH
	 AGjtT8ULmaRIc7vGSzi5hzhDkQMJ78yfaGhxwMOs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D8DBFF8055A; Mon, 29 May 2023 03:05:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E0FEF80542;
	Mon, 29 May 2023 03:05:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 92899F80557; Mon, 29 May 2023 03:05:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2071b.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::71b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ECA83F80579
	for <alsa-devel@alsa-project.org>; Mon, 29 May 2023 03:05:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ECA83F80579
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=XzPHZKkE
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JfvWGWSOQc58yyaarZZllGPydx3doIgWTIbjN1pvVlM9W5ac/kcourybwlpksaTUI1uYql3gRKqQeoQnlEpPl3JDjbxKm4X6Br924jyTJa3xPJXJ+RQa+Hq/Xhbo01VNgESDBPV+z6dkNiUGnPbdxqXcGsTbDgRaZmec3aZLnxM8pBD0qhcrj58x7FSmHiRsBLNMY3gNZ9E/DOFOReTdCZ7+CM8rGZ/D13JZe+SJYOWqlxFms3oco+3T7g/T4JPlIfSRGONbVCw4h4vjncqj/oyD2V7NjETHlMlw3SOoB7qVwkEcM6VSrCyzx67KhnZCDHse6LiNcao6uFoRQxw5Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nS23yPI+YuADLQB4NhLFWnxUm7aKnkF0SlrBhyMY0MQ=;
 b=PbS31PytH9qNbSLrKlh/QeYyrSgdkjbchbOycu+05h2HjOC/Ee8kcZDb7kSrzBHsOfzmvVcjsjgQ4KRyzXFzfLTphl9zNpyDLF5cyZVcMgofeXN5WJAY960+QgnYGnXbw6smY92An0YUntttSNn5LU/sThMpRZ0mV6aFDhvzYtDpd0Id1MeV45ppnL4nh9iOyuvcVPBUu4IjERSqAQkIBfHGRN/Zt4rzmXojIibSFedk93Z0OlFwpFR6EoegFA5jE9cCwhSMEF1SpTc82b+kS2C5k7hnbHFWSvnnSuyHmcz0+Ax+6UFobFOULxUY4A64uLrzjw8Or/55F+QPDkHHlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nS23yPI+YuADLQB4NhLFWnxUm7aKnkF0SlrBhyMY0MQ=;
 b=XzPHZKkE7PptjCWqPTn+s3vSXKn3H4xmPhG82OjcuCklumGqJ3PgyVI+GdW7WGlkryqOs+ipkOWD4suG+inFFXIj8Di137bLwN7uQ59PiPsot7e/rYbCyJBnVwAUw9ygYVUpCNw1IHzAvGmaC3lENcTteqUuHlr2FgCW5iX8fz0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYYPR01MB7952.jpnprd01.prod.outlook.com (2603:1096:400:fe::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.22; Mon, 29 May
 2023 01:04:58 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%7]) with mapi id 15.20.6433.022; Mon, 29 May 2023
 01:04:58 +0000
Message-ID: <875y8clzgm.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: =?UTF-8?B?IkFtYWRldXN6IFPDhYJhd2nDhYRza2ki?=
 <amadeuszx.slawinski@linux.intel.com>, Bard Liao
 <yung-chuan.liao@linux.intel.com>, Brent Lu <brent.lu@intel.com>, Cezary
 Rojewski <cezary.rojewski@intel.com>, Hans de Goede <hdegoede@redhat.com>,
 Jaroslav Kysela <perex@perex.cz>, Kai Vehmanen
 <kai.vehmanen@linux.intel.com>, Liam Girdwood
 <liam.r.girdwood@linux.intel.com>, Mark Brown <broonie@kernel.org>, Peter
 Ujfalusi <peter.ujfalusi@linux.intel.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
In-Reply-To: <87o7m4lzl3.wl-kuninori.morimoto.gx@renesas.com>
References: <87o7m4lzl3.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 13/21] ASoC: Intel: replace dpcm_playback/capture to
 playback/capture_only
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 29 May 2023 01:04:57 +0000
X-ClientProxiedBy: TY2PR0101CA0021.apcprd01.prod.exchangelabs.com
 (2603:1096:404:92::33) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYYPR01MB7952:EE_
X-MS-Office365-Filtering-Correlation-Id: b4fade02-b825-4598-d756-08db5fe0b8c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	l5lyovgDYgVLqacWYWAyEFlipQKtGj3H/PhT0sfpL+fhQYc2gN0vC1A03PZUXRdV8VXIEHcbSIAVvyzJxKykIoRD5TxXxKIHojIonjBtrvV8UvEScuA6ViaksnsZ0C98u2k82HDa0HhTd5ETtFaOgDDCOBMPXvtgfFB/IltwVuYIaunOulkh99upydnFUuJpQuPb9GcPFUqafMMQeltg8CYuEv388vZB1OU/TBHE5W14k7XA3vSduIWMKD+1K0vbUqNLLh5P/OvNgdIDH3TcNx1d/d9yjLD7ngL+Uoey4l/tUomgVlh7cDzYCjKdlyq78BvxVp+YiWcTgVvC9I4oYokvrXveqTryFjBvXkvOUtSzj10VJQVj1ABsmjkO/6+D0Wn4bErrZSEmktc8xb9ahbCyWYzfU+QS+SquIk3Wnu49l9HWFMVR1uq3CNbWhWOTlfDt+wBmXFUZhF0EKd+n2OAgOl1gcB/1I90iUnaieEmN/6MU9VblE8rRinTReuLCPInAWcL+97TNYxI40J3ZGbca2Xz1DtObMK1XF2gf3FNWLUtsT9GbACDLaB4WslURGBJZqFN2MReB9Y0qiPxRKXG40FEwJBZtsPdN6T5UZNv4QaEH+E0T1zF8WBp3Lv33gUTaHcWgJO5atrOmyCGX+Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(136003)(376002)(39860400002)(396003)(451199021)(2906002)(30864003)(186003)(6506007)(6512007)(26005)(5660300002)(478600001)(8936002)(921005)(110136005)(8676002)(38350700002)(83380400001)(2616005)(38100700002)(52116002)(6486002)(41300700001)(86362001)(316002)(66946007)(7416002)(36756003)(66476007)(66556008)(4326008)(579004)(559001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?uOK++ijh0btLJ70B6Z7mQvRzd+4PQYIN6KCwuf8AEcf90HouFqMvi/H4zfdK?=
 =?us-ascii?Q?GcxfWJrAsQEK3eJOQi0UOb7dD0o9ReScrwc4mizamjpBk8eaRAsVCqm8VSnW?=
 =?us-ascii?Q?o0wl7gAXEwRPqQmQGewNG9wODvrR1yZIUVgasu/LJUwjpgVAyynQps3c/yYe?=
 =?us-ascii?Q?6b+nr5aPzy/RQbc/e3ETSCzjdVWQBcyDqWx2emX7SeSc9c/J60As1Mi8Q/F0?=
 =?us-ascii?Q?zyEOky/R2FYfs1RfKi4oYKLxy2xDDODng1njNiKJm59gyRVMi9B9NTrsH00b?=
 =?us-ascii?Q?EuQ/Tt7YE3+aSCzQVe374pZ9IFJjXnl4t7iNbpRrkbkelZWEoQi3D/KyRbax?=
 =?us-ascii?Q?STZpHjN/dwWYX1xwNobQwYnOReukeRZnqfn579X+iGUgRVnrueSiqPWnWam7?=
 =?us-ascii?Q?MZsA02WjmGsNOSJXul0cISSkCd0is/D48l+j+sXPjVaeDTtAAZ5VKJloyFhF?=
 =?us-ascii?Q?qyyWw5bJHoNiJCForKC3B7shXx6gJO9jf7kVOlxqZYhgpK7N3V/D0IgR8tnb?=
 =?us-ascii?Q?AQN6AKDLekWsuyscqu+qIgOOfx+ccB20c9OYY8r9EWxHGX2rLnRl9bYdLaxq?=
 =?us-ascii?Q?LvqijFirUX/eGbA+0e7P7q7CPY7sEae6ZJrjLiazAjoj2PbramV5kY97e4b1?=
 =?us-ascii?Q?CamsztD9MFwCqfOxO7y5bOjlhDcUhqrHtJL/ueFNdQcLCN/Z6k/uwYB0ScMr?=
 =?us-ascii?Q?q3LMX7IkKwGOScFX1nQoZ+M+wMM7on3HDqpD9PX7Ev3MixAtnyg0qkLG4LUe?=
 =?us-ascii?Q?B2Qlcf7Xqa2pQfFsFSDG/pEim0K+k30FL3hxsCy16T9BKYCb+dWELgiNcZKF?=
 =?us-ascii?Q?uBd0J0yPXmEyVycaVgApub6U7b+oKX1HQJIYJ3KJXshG/HKSjQmGXUqOk0aS?=
 =?us-ascii?Q?xROwzyjNMaAFXDpcjkCbw6srrKHvkZqCvQ/UWkrtqexVszibX+05rE6CZqk6?=
 =?us-ascii?Q?bzjVpl4yna8ThfYOdojncjWc4DdnsDAo73Yzh6HTBJEtUqvt3QIWnxvhpC4D?=
 =?us-ascii?Q?+cP4BtR/yWYdeo3MbNi/H1DOi8h4A9vGUNhnJVzmLOwHF2kpupJExCUIbaWV?=
 =?us-ascii?Q?eG3qq70wnHRV5dkejYgSotcTe6FQwn+AAuAWM2YF0GoFASaWJyap/JV2M91R?=
 =?us-ascii?Q?ZQKVF4CEubnejnzJqDUnxtGWrCLcLY6KWlVqNdSJq/7aw4Mh+e0g0YTdSaP1?=
 =?us-ascii?Q?wwXAKSyfIDDKL4Uu3qh415LC72YC5kOy+7W4oSWzj7LLe0k5F0T0f5mzwfWA?=
 =?us-ascii?Q?8/X0+rx2LZXgoA+vJbKxuBIbXirOzBUwuVpbve3nErxf6lYBdFUv5US/qGKo?=
 =?us-ascii?Q?zAyc61EcNk1Ki4JK6v3LFHZJF+adHLx60vIyAr03jY7efvgKx0JPRgAwpsBP?=
 =?us-ascii?Q?zsMGEjlDKyAlNwyAu3ubmUuG382AiZ6aw5fd36qEkTQlt7vpHmkIfCf0MDO6?=
 =?us-ascii?Q?yZ/w61c8oxjtSRvsY1nOvEJaqVqaow7wSIi07vFi8NNR3YKEioegrOtc/POE?=
 =?us-ascii?Q?Lx0XIySDUR00jmIod7zYs1BWMdvH3z2zycP4TsqN7wO2ISyPhvU4F6tSD8GC?=
 =?us-ascii?Q?COpu3xfJAGxyutUv4HKQ3oupwGIVCSrzHDTlxNgLJaaYxx7tYk0pSl9OwKj2?=
 =?us-ascii?Q?NRS7k11pyS5+nYzklkWY8p8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b4fade02-b825-4598-d756-08db5fe0b8c3
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2023 01:04:58.1585
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 VaiqXJylMXNLWrsTm2tp+lqfaWTl9IN8lt5mfYRjcAzJqXZ6YcOvvYD/yrYxx44e+DDWgFleQuTKDVuvStd1w6EMMvRjBoZnt2XM79ZtngsRFxkBT+jAmQamvUJIwt4Q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB7952
Message-ID-Hash: IP5TMAPWKCAM3QCMSNBXUIP3C3U2VDIM
X-Message-ID-Hash: IP5TMAPWKCAM3QCMSNBXUIP3C3U2VDIM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IP5TMAPWKCAM3QCMSNBXUIP3C3U2VDIM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

soc_get_playback_capture() is now handling DPCM and normal comprehensively
for playback/capture stream. We can use playback/capture_only flag
instead of using dpcm_playback/capture. This patch replace these.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/intel/boards/bdw-rt5650.c           |  4 --
 sound/soc/intel/boards/bdw-rt5677.c           |  4 --
 sound/soc/intel/boards/bdw_rt286.c            | 10 ++--
 sound/soc/intel/boards/bxt_da7219_max98357a.c | 32 ++++++-----
 sound/soc/intel/boards/bxt_rt298.c            | 26 +++++----
 sound/soc/intel/boards/bytcht_cx2072x.c       |  6 +--
 sound/soc/intel/boards/bytcht_da7213.c        |  6 +--
 sound/soc/intel/boards/bytcht_es8316.c        |  6 +--
 sound/soc/intel/boards/bytcht_nocodec.c       |  6 +--
 sound/soc/intel/boards/bytcr_rt5640.c         |  6 +--
 sound/soc/intel/boards/bytcr_rt5651.c         |  6 +--
 sound/soc/intel/boards/bytcr_wm5102.c         |  6 +--
 sound/soc/intel/boards/cht_bsw_max98090_ti.c  |  6 +--
 sound/soc/intel/boards/cht_bsw_nau8824.c      |  6 +--
 sound/soc/intel/boards/cht_bsw_rt5645.c       |  6 +--
 sound/soc/intel/boards/cht_bsw_rt5672.c       |  6 +--
 sound/soc/intel/boards/cml_rt1011_rt5682.c    | 14 ++---
 sound/soc/intel/boards/ehl_rt5660.c           | 14 +++--
 sound/soc/intel/boards/glk_rt5682_max98357a.c | 30 +++++------
 sound/soc/intel/boards/hsw_rt5640.c           | 10 ++--
 sound/soc/intel/boards/kbl_da7219_max98357a.c | 26 +++++----
 sound/soc/intel/boards/kbl_da7219_max98927.c  | 54 +++++++++----------
 sound/soc/intel/boards/kbl_rt5660.c           | 18 +++----
 sound/soc/intel/boards/kbl_rt5663_max98927.c  | 44 +++++++--------
 .../intel/boards/kbl_rt5663_rt5514_max98927.c | 22 ++++----
 sound/soc/intel/boards/skl_hda_dsp_common.c   | 14 ++---
 .../soc/intel/boards/skl_nau88l25_max98357a.c | 26 +++++----
 sound/soc/intel/boards/skl_nau88l25_ssm4567.c | 26 ++++-----
 sound/soc/intel/boards/skl_rt286.c            | 26 +++++----
 sound/soc/intel/boards/sof_cs42l42.c          | 12 +----
 sound/soc/intel/boards/sof_da7219_max98373.c  | 16 +++---
 sound/soc/intel/boards/sof_es8336.c           |  8 ++-
 sound/soc/intel/boards/sof_nau8825.c          | 12 +----
 sound/soc/intel/boards/sof_pcm512x.c          |  8 +--
 sound/soc/intel/boards/sof_rt5682.c           | 12 +----
 sound/soc/intel/boards/sof_sdw.c              |  4 +-
 sound/soc/intel/boards/sof_ssp_amp.c          | 11 ++--
 sound/soc/intel/boards/sof_wm8804.c           |  2 -
 38 files changed, 206 insertions(+), 345 deletions(-)

diff --git a/sound/soc/intel/boards/bdw-rt5650.c b/sound/soc/intel/boards/bdw-rt5650.c
index d0682bc543c9..38bc48e64086 100644
--- a/sound/soc/intel/boards/bdw-rt5650.c
+++ b/sound/soc/intel/boards/bdw-rt5650.c
@@ -239,8 +239,6 @@ static struct snd_soc_dai_link bdw_rt5650_dais[] = {
 			SND_SOC_DPCM_TRIGGER_POST,
 			SND_SOC_DPCM_TRIGGER_POST
 		},
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(fe, dummy, platform),
 	},
 
@@ -256,8 +254,6 @@ static struct snd_soc_dai_link bdw_rt5650_dais[] = {
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = broadwell_ssp0_fixup,
 		.ops = &bdw_rt5650_ops,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.init = bdw_rt5650_init,
 		SND_SOC_DAILINK_REG(ssp0_port, be, platform),
 	},
diff --git a/sound/soc/intel/boards/bdw-rt5677.c b/sound/soc/intel/boards/bdw-rt5677.c
index f3e08d258ac1..04beee7f7865 100644
--- a/sound/soc/intel/boards/bdw-rt5677.c
+++ b/sound/soc/intel/boards/bdw-rt5677.c
@@ -329,8 +329,6 @@ static struct snd_soc_dai_link bdw_rt5677_dais[] = {
 			SND_SOC_DPCM_TRIGGER_POST,
 			SND_SOC_DPCM_TRIGGER_POST
 		},
-		.dpcm_capture = 1,
-		.dpcm_playback = 1,
 		.ops = &bdw_rt5677_fe_ops,
 		SND_SOC_DAILINK_REG(fe, dummy, platform),
 	},
@@ -356,8 +354,6 @@ static struct snd_soc_dai_link bdw_rt5677_dais[] = {
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = broadwell_ssp0_fixup,
 		.ops = &bdw_rt5677_ops,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.init = bdw_rt5677_init,
 		.exit = bdw_rt5677_exit,
 		SND_SOC_DAILINK_REG(ssp0_port, be, platform),
diff --git a/sound/soc/intel/boards/bdw_rt286.c b/sound/soc/intel/boards/bdw_rt286.c
index b7687a93a923..5cc2f1e6992b 100644
--- a/sound/soc/intel/boards/bdw_rt286.c
+++ b/sound/soc/intel/boards/bdw_rt286.c
@@ -133,8 +133,6 @@ static struct snd_soc_dai_link card_dai_links[] = {
 		.nonatomic = 1,
 		.dynamic = 1,
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(system, dummy, platform),
 	},
 	{
@@ -143,7 +141,7 @@ static struct snd_soc_dai_link card_dai_links[] = {
 		.nonatomic = 1,
 		.dynamic = 1,
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(offload0, dummy, platform),
 	},
 	{
@@ -152,7 +150,7 @@ static struct snd_soc_dai_link card_dai_links[] = {
 		.nonatomic = 1,
 		.dynamic = 1,
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(offload1, dummy, platform),
 	},
 	{
@@ -161,7 +159,7 @@ static struct snd_soc_dai_link card_dai_links[] = {
 		.nonatomic = 1,
 		.dynamic = 1,
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(loopback, dummy, platform),
 	},
 	/* Back End DAI links */
@@ -177,8 +175,6 @@ static struct snd_soc_dai_link card_dai_links[] = {
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = codec_link_hw_params_fixup,
 		.ops = &codec_link_ops,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(ssp0_port, codec, platform),
 	},
 };
diff --git a/sound/soc/intel/boards/bxt_da7219_max98357a.c b/sound/soc/intel/boards/bxt_da7219_max98357a.c
index c593995facaa..23f85d3ff728 100644
--- a/sound/soc/intel/boards/bxt_da7219_max98357a.c
+++ b/sound/soc/intel/boards/bxt_da7219_max98357a.c
@@ -497,7 +497,7 @@ static struct snd_soc_dai_link broxton_dais[] = {
 		.init = broxton_da7219_fe_init,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &broxton_da7219_fe_ops,
 		SND_SOC_DAILINK_REG(system, dummy, platform),
 	},
@@ -509,7 +509,7 @@ static struct snd_soc_dai_link broxton_dais[] = {
 		.nonatomic = 1,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ops = &broxton_da7219_fe_ops,
 		SND_SOC_DAILINK_REG(system, dummy, platform),
 	},
@@ -520,7 +520,7 @@ static struct snd_soc_dai_link broxton_dais[] = {
 		.nonatomic = 1,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &broxton_da7219_fe_ops,
 		SND_SOC_DAILINK_REG(system2, dummy, platform),
 	},
@@ -529,7 +529,7 @@ static struct snd_soc_dai_link broxton_dais[] = {
 		.name = "Bxt Audio Reference cap",
 		.stream_name = "Refcap",
 		.init = NULL,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.nonatomic = 1,
 		.dynamic = 1,
 		.ops = &broxton_refcap_ops,
@@ -540,7 +540,7 @@ static struct snd_soc_dai_link broxton_dais[] = {
 		.name = "Bxt Audio DMIC cap",
 		.stream_name = "dmiccap",
 		.init = NULL,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.nonatomic = 1,
 		.dynamic = 1,
 		.ops = &broxton_dmic_ops,
@@ -550,7 +550,7 @@ static struct snd_soc_dai_link broxton_dais[] = {
 	{
 		.name = "Bxt HDMI Port1",
 		.stream_name = "Hdmi1",
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.init = NULL,
 		.nonatomic = 1,
 		.dynamic = 1,
@@ -560,7 +560,7 @@ static struct snd_soc_dai_link broxton_dais[] = {
 	{
 		.name = "Bxt HDMI Port2",
 		.stream_name = "Hdmi2",
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.init = NULL,
 		.nonatomic = 1,
 		.dynamic = 1,
@@ -570,7 +570,7 @@ static struct snd_soc_dai_link broxton_dais[] = {
 	{
 		.name = "Bxt HDMI Port3",
 		.stream_name = "Hdmi3",
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.init = NULL,
 		.nonatomic = 1,
 		.dynamic = 1,
@@ -587,7 +587,7 @@ static struct snd_soc_dai_link broxton_dais[] = {
 			SND_SOC_DAIFMT_CBC_CFC,
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = broxton_ssp_fixup,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(ssp5_pin, ssp5_codec, platform),
 	},
 	{
@@ -600,8 +600,6 @@ static struct snd_soc_dai_link broxton_dais[] = {
 			SND_SOC_DAIFMT_CBC_CFC,
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = broxton_ssp_fixup,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(ssp1_pin, ssp1_codec, platform),
 	},
 	{
@@ -609,7 +607,7 @@ static struct snd_soc_dai_link broxton_dais[] = {
 		.id = 2,
 		.ignore_suspend = 1,
 		.be_hw_params_fixup = broxton_dmic_fixup,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(dmic_pin, dmic_codec, platform),
 	},
@@ -617,7 +615,7 @@ static struct snd_soc_dai_link broxton_dais[] = {
 		.name = "iDisp1",
 		.id = 3,
 		.init = broxton_hdmi_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp1_pin, idisp1_codec, platform),
 	},
@@ -625,7 +623,7 @@ static struct snd_soc_dai_link broxton_dais[] = {
 		.name = "iDisp2",
 		.id = 4,
 		.init = broxton_hdmi_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp2_pin, idisp2_codec, platform),
 	},
@@ -633,7 +631,7 @@ static struct snd_soc_dai_link broxton_dais[] = {
 		.name = "iDisp3",
 		.id = 5,
 		.init = broxton_hdmi_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp3_pin, idisp3_codec, platform),
 	},
@@ -641,7 +639,7 @@ static struct snd_soc_dai_link broxton_dais[] = {
 		.name = "dmic16k",
 		.id = 6,
 		.be_hw_params_fixup = broxton_dmic_fixup,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(dmic16k_pin, dmic_codec, platform),
 	},
@@ -824,7 +822,7 @@ static int broxton_audio_probe(struct platform_device *pdev)
 				if (ctx->spkamp == SPKAMP_MAX98390) {
 					broxton_dais[i].codecs = max98390_codec;
 					broxton_dais[i].num_codecs = ARRAY_SIZE(max98390_codec);
-					broxton_dais[i].dpcm_capture = 1;
+					broxton_dais[i].playback_only = 0;
 				}
 			}
 			/* DIALOG_CODEC is connected to SSP0 */
diff --git a/sound/soc/intel/boards/bxt_rt298.c b/sound/soc/intel/boards/bxt_rt298.c
index bf89fe80423d..4e306b95918e 100644
--- a/sound/soc/intel/boards/bxt_rt298.c
+++ b/sound/soc/intel/boards/bxt_rt298.c
@@ -394,7 +394,7 @@ static struct snd_soc_dai_link broxton_rt298_dais[] = {
 		.dynamic = 1,
 		.init = broxton_rt298_fe_init,
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &broxton_rt286_fe_ops,
 		SND_SOC_DAILINK_REG(system, dummy, platform),
 	},
@@ -405,7 +405,7 @@ static struct snd_soc_dai_link broxton_rt298_dais[] = {
 		.nonatomic = 1,
 		.dynamic = 1,
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ops = &broxton_rt286_fe_ops,
 		SND_SOC_DAILINK_REG(system, dummy, platform),
 	},
@@ -414,7 +414,7 @@ static struct snd_soc_dai_link broxton_rt298_dais[] = {
 		.name = "Bxt Audio Reference cap",
 		.stream_name = "refcap",
 		.init = NULL,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.nonatomic = 1,
 		.dynamic = 1,
 		SND_SOC_DAILINK_REG(reference, dummy, platform),
@@ -424,7 +424,7 @@ static struct snd_soc_dai_link broxton_rt298_dais[] = {
 		.name = "Bxt Audio DMIC cap",
 		.stream_name = "dmiccap",
 		.init = NULL,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.nonatomic = 1,
 		.dynamic = 1,
 		.ops = &broxton_dmic_ops,
@@ -434,7 +434,7 @@ static struct snd_soc_dai_link broxton_rt298_dais[] = {
 	{
 		.name = "Bxt HDMI Port1",
 		.stream_name = "Hdmi1",
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.init = NULL,
 		.nonatomic = 1,
 		.dynamic = 1,
@@ -444,7 +444,7 @@ static struct snd_soc_dai_link broxton_rt298_dais[] = {
 	{
 		.name = "Bxt HDMI Port2",
 		.stream_name = "Hdmi2",
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.init = NULL,
 		.nonatomic = 1,
 		.dynamic = 1,
@@ -454,7 +454,7 @@ static struct snd_soc_dai_link broxton_rt298_dais[] = {
 	{
 		.name = "Bxt HDMI Port3",
 		.stream_name = "Hdmi3",
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.init = NULL,
 		.nonatomic = 1,
 		.dynamic = 1,
@@ -472,8 +472,6 @@ static struct snd_soc_dai_link broxton_rt298_dais[] = {
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = broxton_ssp5_fixup,
 		.ops = &broxton_rt298_ops,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(ssp5_pin, ssp5_codec, platform),
 	},
 	{
@@ -481,7 +479,7 @@ static struct snd_soc_dai_link broxton_rt298_dais[] = {
 		.id = 1,
 		.be_hw_params_fixup = broxton_dmic_fixup,
 		.ignore_suspend = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(dmic_pin, dmic_codec, platform),
 	},
@@ -490,7 +488,7 @@ static struct snd_soc_dai_link broxton_rt298_dais[] = {
 		.id = 2,
 		.be_hw_params_fixup = broxton_dmic_fixup,
 		.ignore_suspend = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(dmic16k, dmic_codec, platform),
 	},
@@ -498,7 +496,7 @@ static struct snd_soc_dai_link broxton_rt298_dais[] = {
 		.name = "iDisp1",
 		.id = 3,
 		.init = broxton_hdmi_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp1_pin, idisp1_codec, platform),
 	},
@@ -506,7 +504,7 @@ static struct snd_soc_dai_link broxton_rt298_dais[] = {
 		.name = "iDisp2",
 		.id = 4,
 		.init = broxton_hdmi_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp2_pin, idisp2_codec, platform),
 	},
@@ -514,7 +512,7 @@ static struct snd_soc_dai_link broxton_rt298_dais[] = {
 		.name = "iDisp3",
 		.id = 5,
 		.init = broxton_hdmi_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp3_pin, idisp3_codec, platform),
 	},
diff --git a/sound/soc/intel/boards/bytcht_cx2072x.c b/sound/soc/intel/boards/bytcht_cx2072x.c
index 9942a2de6f7a..3f54f01e599c 100644
--- a/sound/soc/intel/boards/bytcht_cx2072x.c
+++ b/sound/soc/intel/boards/bytcht_cx2072x.c
@@ -175,8 +175,6 @@ static struct snd_soc_dai_link byt_cht_cx2072x_dais[] = {
 		.stream_name = "Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &byt_cht_cx2072x_aif1_ops,
 		SND_SOC_DAILINK_REG(media, dummy, platform),
 	},
@@ -185,7 +183,7 @@ static struct snd_soc_dai_link byt_cht_cx2072x_dais[] = {
 		.stream_name = "Deep-Buffer Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &byt_cht_cx2072x_aif1_ops,
 		SND_SOC_DAILINK_REG(deepbuffer, dummy, platform),
 	},
@@ -198,8 +196,6 @@ static struct snd_soc_dai_link byt_cht_cx2072x_dais[] = {
 					      | SND_SOC_DAIFMT_CBC_CFC,
 		.init = byt_cht_cx2072x_init,
 		.be_hw_params_fixup = byt_cht_cx2072x_fixup,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(ssp2, cx2072x, platform),
 	},
 };
diff --git a/sound/soc/intel/boards/bytcht_da7213.c b/sound/soc/intel/boards/bytcht_da7213.c
index a3b0cfab17b0..47344a5fb553 100644
--- a/sound/soc/intel/boards/bytcht_da7213.c
+++ b/sound/soc/intel/boards/bytcht_da7213.c
@@ -174,8 +174,6 @@ static struct snd_soc_dai_link dailink[] = {
 		.stream_name = "Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &aif1_ops,
 		SND_SOC_DAILINK_REG(media, dummy, platform),
 	},
@@ -184,7 +182,7 @@ static struct snd_soc_dai_link dailink[] = {
 		.stream_name = "Deep-Buffer Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &aif1_ops,
 		SND_SOC_DAILINK_REG(deepbuffer, dummy, platform),
 	},
@@ -197,8 +195,6 @@ static struct snd_soc_dai_link dailink[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 						| SND_SOC_DAIFMT_CBC_CFC,
 		.be_hw_params_fixup = codec_fixup,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &ssp2_ops,
 		SND_SOC_DAILINK_REG(ssp2_port, ssp2_codec, platform),
 	},
diff --git a/sound/soc/intel/boards/bytcht_es8316.c b/sound/soc/intel/boards/bytcht_es8316.c
index 7a30d2d36f19..9b39420ff3b8 100644
--- a/sound/soc/intel/boards/bytcht_es8316.c
+++ b/sound/soc/intel/boards/bytcht_es8316.c
@@ -314,8 +314,6 @@ static struct snd_soc_dai_link byt_cht_es8316_dais[] = {
 		.stream_name = "Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &byt_cht_es8316_aif1_ops,
 		SND_SOC_DAILINK_REG(media, dummy, platform),
 	},
@@ -325,7 +323,7 @@ static struct snd_soc_dai_link byt_cht_es8316_dais[] = {
 		.stream_name = "Deep-Buffer Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &byt_cht_es8316_aif1_ops,
 		SND_SOC_DAILINK_REG(deepbuffer, dummy, platform),
 	},
@@ -338,8 +336,6 @@ static struct snd_soc_dai_link byt_cht_es8316_dais[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 						| SND_SOC_DAIFMT_CBC_CFC,
 		.be_hw_params_fixup = byt_cht_es8316_codec_fixup,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.init = byt_cht_es8316_init,
 		SND_SOC_DAILINK_REG(ssp2_port, ssp2_codec, platform),
 	},
diff --git a/sound/soc/intel/boards/bytcht_nocodec.c b/sound/soc/intel/boards/bytcht_nocodec.c
index 7fc03f2efd35..94a7c022d181 100644
--- a/sound/soc/intel/boards/bytcht_nocodec.c
+++ b/sound/soc/intel/boards/bytcht_nocodec.c
@@ -119,8 +119,6 @@ static struct snd_soc_dai_link dais[] = {
 		.ignore_suspend = 1,
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &aif1_ops,
 		SND_SOC_DAILINK_REG(media, dummy, platform),
 	},
@@ -130,7 +128,7 @@ static struct snd_soc_dai_link dais[] = {
 		.ignore_suspend = 1,
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &aif1_ops,
 		SND_SOC_DAILINK_REG(deepbuffer, dummy, platform),
 	},
@@ -144,8 +142,6 @@ static struct snd_soc_dai_link dais[] = {
 						| SND_SOC_DAIFMT_CBC_CFC,
 		.be_hw_params_fixup = codec_fixup,
 		.ignore_suspend = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(ssp2_port, dummy, platform),
 	},
 };
diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index 630784b6cb6d..d2019f82d9e8 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -1505,8 +1505,6 @@ static struct snd_soc_dai_link byt_rt5640_dais[] = {
 		.stream_name = "Baytrail Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &byt_rt5640_aif1_ops,
 		SND_SOC_DAILINK_REG(media, dummy, platform),
 	},
@@ -1515,7 +1513,7 @@ static struct snd_soc_dai_link byt_rt5640_dais[] = {
 		.stream_name = "Deep-Buffer Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &byt_rt5640_aif1_ops,
 		SND_SOC_DAILINK_REG(deepbuffer, dummy, platform),
 	},
@@ -1527,8 +1525,6 @@ static struct snd_soc_dai_link byt_rt5640_dais[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 						| SND_SOC_DAIFMT_CBC_CFC,
 		.be_hw_params_fixup = byt_rt5640_codec_fixup,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.init = byt_rt5640_init,
 		.exit = byt_rt5640_exit,
 		.ops = &byt_rt5640_be_ssp2_ops,
diff --git a/sound/soc/intel/boards/bytcr_rt5651.c b/sound/soc/intel/boards/bytcr_rt5651.c
index 805afaf47b29..43985721777d 100644
--- a/sound/soc/intel/boards/bytcr_rt5651.c
+++ b/sound/soc/intel/boards/bytcr_rt5651.c
@@ -770,8 +770,6 @@ static struct snd_soc_dai_link byt_rt5651_dais[] = {
 		.stream_name = "Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &byt_rt5651_aif1_ops,
 		SND_SOC_DAILINK_REG(media, dummy, platform),
 	},
@@ -780,7 +778,7 @@ static struct snd_soc_dai_link byt_rt5651_dais[] = {
 		.stream_name = "Deep-Buffer Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &byt_rt5651_aif1_ops,
 		SND_SOC_DAILINK_REG(deepbuffer, dummy, platform),
 	},
@@ -793,8 +791,6 @@ static struct snd_soc_dai_link byt_rt5651_dais[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 						| SND_SOC_DAIFMT_CBC_CFC,
 		.be_hw_params_fixup = byt_rt5651_codec_fixup,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.init = byt_rt5651_init,
 		.ops = &byt_rt5651_be_ssp2_ops,
 		SND_SOC_DAILINK_REG(ssp2_port, ssp2_codec, platform),
diff --git a/sound/soc/intel/boards/bytcr_wm5102.c b/sound/soc/intel/boards/bytcr_wm5102.c
index f2382d4cb76f..571ec2586bcc 100644
--- a/sound/soc/intel/boards/bytcr_wm5102.c
+++ b/sound/soc/intel/boards/bytcr_wm5102.c
@@ -320,8 +320,6 @@ static struct snd_soc_dai_link byt_wm5102_dais[] = {
 		.stream_name = "Baytrail Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &byt_wm5102_aif1_ops,
 		SND_SOC_DAILINK_REG(media, dummy, platform),
 
@@ -331,7 +329,7 @@ static struct snd_soc_dai_link byt_wm5102_dais[] = {
 		.stream_name = "Deep-Buffer Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &byt_wm5102_aif1_ops,
 		SND_SOC_DAILINK_REG(deepbuffer, dummy, platform),
 	},
@@ -351,8 +349,6 @@ static struct snd_soc_dai_link byt_wm5102_dais[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 						| SND_SOC_DAIFMT_CBC_CFC,
 		.be_hw_params_fixup = byt_wm5102_codec_fixup,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.init = byt_wm5102_init,
 		SND_SOC_DAILINK_REG(ssp0_port, ssp0_codec, platform),
 	},
diff --git a/sound/soc/intel/boards/cht_bsw_max98090_ti.c b/sound/soc/intel/boards/cht_bsw_max98090_ti.c
index 850310de774b..e0fb44f6cab4 100644
--- a/sound/soc/intel/boards/cht_bsw_max98090_ti.c
+++ b/sound/soc/intel/boards/cht_bsw_max98090_ti.c
@@ -351,8 +351,6 @@ static struct snd_soc_dai_link cht_dailink[] = {
 		.stream_name = "Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &cht_aif1_ops,
 		SND_SOC_DAILINK_REG(media, dummy, platform),
 	},
@@ -361,7 +359,7 @@ static struct snd_soc_dai_link cht_dailink[] = {
 		.stream_name = "Deep-Buffer Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &cht_aif1_ops,
 		SND_SOC_DAILINK_REG(deepbuffer, dummy, platform),
 	},
@@ -374,8 +372,6 @@ static struct snd_soc_dai_link cht_dailink[] = {
 					| SND_SOC_DAIFMT_CBC_CFC,
 		.init = cht_codec_init,
 		.be_hw_params_fixup = cht_codec_fixup,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &cht_be_ssp2_ops,
 		SND_SOC_DAILINK_REG(ssp2_port, ssp2_codec, platform),
 	},
diff --git a/sound/soc/intel/boards/cht_bsw_nau8824.c b/sound/soc/intel/boards/cht_bsw_nau8824.c
index af2d9a78465d..2515ca7d75e0 100644
--- a/sound/soc/intel/boards/cht_bsw_nau8824.c
+++ b/sound/soc/intel/boards/cht_bsw_nau8824.c
@@ -193,8 +193,6 @@ static struct snd_soc_dai_link cht_dailink[] = {
 		.stream_name = "Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &cht_aif1_ops,
 		SND_SOC_DAILINK_REG(media, dummy, platform),
 	},
@@ -203,7 +201,7 @@ static struct snd_soc_dai_link cht_dailink[] = {
 		.stream_name = "Deep-Buffer Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &cht_aif1_ops,
 		SND_SOC_DAILINK_REG(deepbuffer, dummy, platform),
 	},
@@ -217,8 +215,6 @@ static struct snd_soc_dai_link cht_dailink[] = {
 			| SND_SOC_DAIFMT_CBC_CFC,
 		.init = cht_codec_init,
 		.be_hw_params_fixup = cht_codec_fixup,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &cht_be_ssp2_ops,
 		SND_SOC_DAILINK_REG(ssp2_port, ssp2_codec, platform),
 	},
diff --git a/sound/soc/intel/boards/cht_bsw_rt5645.c b/sound/soc/intel/boards/cht_bsw_rt5645.c
index 875bc0b3d85d..e15cfff3f6f3 100644
--- a/sound/soc/intel/boards/cht_bsw_rt5645.c
+++ b/sound/soc/intel/boards/cht_bsw_rt5645.c
@@ -449,8 +449,6 @@ static struct snd_soc_dai_link cht_dailink[] = {
 		.stream_name = "Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &cht_aif1_ops,
 		SND_SOC_DAILINK_REG(media, dummy, platform),
 	},
@@ -459,7 +457,7 @@ static struct snd_soc_dai_link cht_dailink[] = {
 		.stream_name = "Deep-Buffer Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &cht_aif1_ops,
 		SND_SOC_DAILINK_REG(deepbuffer, dummy, platform),
 	},
@@ -471,8 +469,6 @@ static struct snd_soc_dai_link cht_dailink[] = {
 		.no_pcm = 1,
 		.init = cht_codec_init,
 		.be_hw_params_fixup = cht_codec_fixup,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &cht_be_ssp2_ops,
 		SND_SOC_DAILINK_REG(ssp2_port, ssp2_codec, platform),
 	},
diff --git a/sound/soc/intel/boards/cht_bsw_rt5672.c b/sound/soc/intel/boards/cht_bsw_rt5672.c
index daa630a0efc1..a8050a0937f0 100644
--- a/sound/soc/intel/boards/cht_bsw_rt5672.c
+++ b/sound/soc/intel/boards/cht_bsw_rt5672.c
@@ -354,8 +354,6 @@ static struct snd_soc_dai_link cht_dailink[] = {
 		.stream_name = "Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &cht_aif1_ops,
 		SND_SOC_DAILINK_REG(media, dummy, platform),
 	},
@@ -364,7 +362,7 @@ static struct snd_soc_dai_link cht_dailink[] = {
 		.stream_name = "Deep-Buffer Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &cht_aif1_ops,
 		SND_SOC_DAILINK_REG(deepbuffer, dummy, platform),
 	},
@@ -377,8 +375,6 @@ static struct snd_soc_dai_link cht_dailink[] = {
 		.no_pcm = 1,
 		.init = cht_codec_init,
 		.be_hw_params_fixup = cht_codec_fixup,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &cht_be_ssp2_ops,
 		SND_SOC_DAILINK_REG(ssp2_port, ssp2_codec, platform),
 	},
diff --git a/sound/soc/intel/boards/cml_rt1011_rt5682.c b/sound/soc/intel/boards/cml_rt1011_rt5682.c
index 20da83d9eece..759c1e9149fb 100644
--- a/sound/soc/intel/boards/cml_rt1011_rt5682.c
+++ b/sound/soc/intel/boards/cml_rt1011_rt5682.c
@@ -443,8 +443,6 @@ static struct snd_soc_dai_link cml_rt1011_rt5682_dailink[] = {
 		.exit = cml_rt5682_codec_exit,
 		.ignore_pmdown_time = 1,
 		.ops = &cml_rt5682_ops,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(ssp0_pin, ssp0_codec, platform),
 	},
@@ -452,7 +450,7 @@ static struct snd_soc_dai_link cml_rt1011_rt5682_dailink[] = {
 		.name = "dmic01",
 		.id = 1,
 		.ignore_suspend = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(dmic_pin, dmic_codec, platform),
 	},
@@ -460,7 +458,7 @@ static struct snd_soc_dai_link cml_rt1011_rt5682_dailink[] = {
 		.name = "dmic16k",
 		.id = 2,
 		.ignore_suspend = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(dmic16k_pin, dmic_codec, platform),
 	},
@@ -468,7 +466,7 @@ static struct snd_soc_dai_link cml_rt1011_rt5682_dailink[] = {
 		.name = "iDisp1",
 		.id = 3,
 		.init = hdmi_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp1_pin, idisp1_codec, platform),
 	},
@@ -476,7 +474,7 @@ static struct snd_soc_dai_link cml_rt1011_rt5682_dailink[] = {
 		.name = "iDisp2",
 		.id = 4,
 		.init = hdmi_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp2_pin, idisp2_codec, platform),
 	},
@@ -484,7 +482,7 @@ static struct snd_soc_dai_link cml_rt1011_rt5682_dailink[] = {
 		.name = "iDisp3",
 		.id = 5,
 		.init = hdmi_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp3_pin, idisp3_codec, platform),
 	},
@@ -496,8 +494,6 @@ static struct snd_soc_dai_link cml_rt1011_rt5682_dailink[] = {
 		 */
 		.name = "SSP1-Codec",
 		.id = 6,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1, /* Capture stream provides Feedback */
 		.no_pcm = 1,
 		.init = cml_rt1011_spk_init,
 		.ops = &cml_rt1011_ops,
diff --git a/sound/soc/intel/boards/ehl_rt5660.c b/sound/soc/intel/boards/ehl_rt5660.c
index fee80638cba2..118d72fab256 100644
--- a/sound/soc/intel/boards/ehl_rt5660.c
+++ b/sound/soc/intel/boards/ehl_rt5660.c
@@ -178,8 +178,6 @@ static struct snd_soc_dai_link ehl_rt5660_dailink[] = {
 		.name = "SSP0-Codec",
 		.id = 0,
 		.no_pcm = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &rt5660_ops,
 		SND_SOC_DAILINK_REG(ssp0_pin, rt5660_codec, platform),
 	},
@@ -187,7 +185,7 @@ static struct snd_soc_dai_link ehl_rt5660_dailink[] = {
 		.name = "dmic48k",
 		.id = 1,
 		.ignore_suspend = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(dmic_pin, dmic_codec, platform),
 	},
@@ -195,7 +193,7 @@ static struct snd_soc_dai_link ehl_rt5660_dailink[] = {
 		.name = "dmic16k",
 		.id = 2,
 		.ignore_suspend = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(dmic16k, dmic_codec, platform),
 	},
@@ -203,7 +201,7 @@ static struct snd_soc_dai_link ehl_rt5660_dailink[] = {
 		.name = "iDisp1",
 		.id = 5,
 		.init = hdmi_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp1_pin, idisp1_codec, platform),
 	},
@@ -211,7 +209,7 @@ static struct snd_soc_dai_link ehl_rt5660_dailink[] = {
 		.name = "iDisp2",
 		.id = 6,
 		.init = hdmi_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp2_pin, idisp2_codec, platform),
 	},
@@ -219,7 +217,7 @@ static struct snd_soc_dai_link ehl_rt5660_dailink[] = {
 		.name = "iDisp3",
 		.id = 7,
 		.init = hdmi_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp3_pin, idisp3_codec, platform),
 	},
@@ -227,7 +225,7 @@ static struct snd_soc_dai_link ehl_rt5660_dailink[] = {
 		.name = "iDisp4",
 		.id = 8,
 		.init = hdmi_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp4_pin, idisp4_codec, platform),
 	},
diff --git a/sound/soc/intel/boards/glk_rt5682_max98357a.c b/sound/soc/intel/boards/glk_rt5682_max98357a.c
index cf0f89db3e20..a9ee83dfd2be 100644
--- a/sound/soc/intel/boards/glk_rt5682_max98357a.c
+++ b/sound/soc/intel/boards/glk_rt5682_max98357a.c
@@ -413,7 +413,7 @@ static struct snd_soc_dai_link geminilake_dais[] = {
 		.init = geminilake_rt5682_fe_init,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(system, dummy, platform),
 	},
 	[GLK_DPCM_AUDIO_CP] = {
@@ -423,13 +423,13 @@ static struct snd_soc_dai_link geminilake_dais[] = {
 		.nonatomic = 1,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(system, dummy, platform),
 	},
 	[GLK_DPCM_AUDIO_HS_PB] = {
 		.name = "Glk Audio Headset Playback",
 		.stream_name = "Headset Audio",
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.nonatomic = 1,
 		.dynamic = 1,
 		SND_SOC_DAILINK_REG(system2, dummy, platform),
@@ -438,7 +438,7 @@ static struct snd_soc_dai_link geminilake_dais[] = {
 		.name = "Glk Audio Echo Reference cap",
 		.stream_name = "Echoreference Capture",
 		.init = NULL,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.nonatomic = 1,
 		.dynamic = 1,
 		SND_SOC_DAILINK_REG(echoref, dummy, platform),
@@ -447,7 +447,7 @@ static struct snd_soc_dai_link geminilake_dais[] = {
 		.name = "Glk Audio Reference cap",
 		.stream_name = "Refcap",
 		.init = NULL,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.nonatomic = 1,
 		.dynamic = 1,
 		.ops = &geminilake_refcap_ops,
@@ -457,7 +457,7 @@ static struct snd_soc_dai_link geminilake_dais[] = {
 		.name = "Glk Audio DMIC cap",
 		.stream_name = "dmiccap",
 		.init = NULL,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.nonatomic = 1,
 		.dynamic = 1,
 		.ops = &geminilake_dmic_ops,
@@ -466,7 +466,7 @@ static struct snd_soc_dai_link geminilake_dais[] = {
 	[GLK_DPCM_AUDIO_HDMI1_PB] = {
 		.name = "Glk HDMI Port1",
 		.stream_name = "Hdmi1",
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.init = NULL,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
@@ -477,7 +477,7 @@ static struct snd_soc_dai_link geminilake_dais[] = {
 	[GLK_DPCM_AUDIO_HDMI2_PB] =	{
 		.name = "Glk HDMI Port2",
 		.stream_name = "Hdmi2",
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.init = NULL,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
@@ -490,7 +490,7 @@ static struct snd_soc_dai_link geminilake_dais[] = {
 		.stream_name = "Hdmi3",
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.init = NULL,
 		.nonatomic = 1,
 		.dynamic = 1,
@@ -507,7 +507,7 @@ static struct snd_soc_dai_link geminilake_dais[] = {
 			SND_SOC_DAIFMT_CBC_CFC,
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = geminilake_ssp_fixup,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(ssp1_pin, ssp1_codec, platform),
 	},
 	{
@@ -521,8 +521,6 @@ static struct snd_soc_dai_link geminilake_dais[] = {
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = geminilake_ssp_fixup,
 		.ops = &geminilake_rt5682_ops,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(ssp2_pin, ssp2_codec_5682, platform),
 	},
 	{
@@ -530,7 +528,7 @@ static struct snd_soc_dai_link geminilake_dais[] = {
 		.id = 2,
 		.ignore_suspend = 1,
 		.be_hw_params_fixup = geminilake_dmic_fixup,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(dmic_pin, dmic_codec, platform),
 	},
@@ -538,7 +536,7 @@ static struct snd_soc_dai_link geminilake_dais[] = {
 		.name = "iDisp1",
 		.id = 3,
 		.init = geminilake_hdmi_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp1_pin, idisp1_codec, platform),
 	},
@@ -546,7 +544,7 @@ static struct snd_soc_dai_link geminilake_dais[] = {
 		.name = "iDisp2",
 		.id = 4,
 		.init = geminilake_hdmi_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp2_pin, idisp2_codec, platform),
 	},
@@ -554,7 +552,7 @@ static struct snd_soc_dai_link geminilake_dais[] = {
 		.name = "iDisp3",
 		.id = 5,
 		.init = geminilake_hdmi_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp3_pin, idisp3_codec, platform),
 	},
diff --git a/sound/soc/intel/boards/hsw_rt5640.c b/sound/soc/intel/boards/hsw_rt5640.c
index 050c53ebd6ba..4ba82d006f1d 100644
--- a/sound/soc/intel/boards/hsw_rt5640.c
+++ b/sound/soc/intel/boards/hsw_rt5640.c
@@ -85,8 +85,6 @@ static struct snd_soc_dai_link card_dai_links[] = {
 		.nonatomic = 1,
 		.dynamic = 1,
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(system, dummy, platform),
 	},
 	{
@@ -95,7 +93,7 @@ static struct snd_soc_dai_link card_dai_links[] = {
 		.nonatomic = 1,
 		.dynamic = 1,
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(offload0, dummy, platform),
 	},
 	{
@@ -104,7 +102,7 @@ static struct snd_soc_dai_link card_dai_links[] = {
 		.nonatomic = 1,
 		.dynamic = 1,
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(offload1, dummy, platform),
 	},
 	{
@@ -113,7 +111,7 @@ static struct snd_soc_dai_link card_dai_links[] = {
 		.nonatomic = 1,
 		.dynamic = 1,
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(loopback, dummy, platform),
 	},
 	/* Back End DAI links */
@@ -127,8 +125,6 @@ static struct snd_soc_dai_link card_dai_links[] = {
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = codec_link_hw_params_fixup,
 		.ops = &codec_link_ops,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(ssp0_port, codec, platform),
 	},
 };
diff --git a/sound/soc/intel/boards/kbl_da7219_max98357a.c b/sound/soc/intel/boards/kbl_da7219_max98357a.c
index 18365ce6bcba..9665eb066cf3 100644
--- a/sound/soc/intel/boards/kbl_da7219_max98357a.c
+++ b/sound/soc/intel/boards/kbl_da7219_max98357a.c
@@ -453,7 +453,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.init = kabylake_da7219_fe_init,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &kabylake_da7219_fe_ops,
 		SND_SOC_DAILINK_REG(system, dummy, platform),
 	},
@@ -464,7 +464,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.nonatomic = 1,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ops = &kabylake_da7219_fe_ops,
 		SND_SOC_DAILINK_REG(system, dummy, platform),
 	},
@@ -472,7 +472,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.name = "Kbl Audio Reference cap",
 		.stream_name = "Wake on Voice",
 		.init = NULL,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.nonatomic = 1,
 		.dynamic = 1,
 		.ops = &skylake_refcap_ops,
@@ -482,7 +482,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.name = "Kbl Audio DMIC cap",
 		.stream_name = "dmiccap",
 		.init = NULL,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.nonatomic = 1,
 		.dynamic = 1,
 		.ops = &kabylake_dmic_ops,
@@ -491,7 +491,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 	[KBL_DPCM_AUDIO_HDMI1_PB] = {
 		.name = "Kbl HDMI Port1",
 		.stream_name = "Hdmi1",
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.init = NULL,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
@@ -502,7 +502,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 	[KBL_DPCM_AUDIO_HDMI2_PB] = {
 		.name = "Kbl HDMI Port2",
 		.stream_name = "Hdmi2",
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.init = NULL,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
@@ -515,7 +515,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.stream_name = "Hdmi3",
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.init = NULL,
 		.nonatomic = 1,
 		.dynamic = 1,
@@ -533,7 +533,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 			SND_SOC_DAIFMT_CBC_CFC,
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = kabylake_ssp_fixup,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(ssp0_pin, ssp0_codec, platform),
 	},
 	{
@@ -546,8 +546,6 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 			SND_SOC_DAIFMT_CBC_CFC,
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = kabylake_ssp_fixup,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(ssp1_pin, ssp1_codec, platform),
 	},
 	{
@@ -555,14 +553,14 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.id = 2,
 		.be_hw_params_fixup = kabylake_dmic_fixup,
 		.ignore_suspend = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(dmic_pin, dmic_codec, platform),
 	},
 	{
 		.name = "iDisp1",
 		.id = 3,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.init = kabylake_hdmi1_init,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp1_pin, idisp1_codec, platform),
@@ -571,7 +569,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.name = "iDisp2",
 		.id = 4,
 		.init = kabylake_hdmi2_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp2_pin, idisp2_codec, platform),
 	},
@@ -579,7 +577,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.name = "iDisp3",
 		.id = 5,
 		.init = kabylake_hdmi3_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp3_pin, idisp3_codec, platform),
 	},
diff --git a/sound/soc/intel/boards/kbl_da7219_max98927.c b/sound/soc/intel/boards/kbl_da7219_max98927.c
index ad4223fee0c5..fc318a979162 100644
--- a/sound/soc/intel/boards/kbl_da7219_max98927.c
+++ b/sound/soc/intel/boards/kbl_da7219_max98927.c
@@ -679,7 +679,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.init = kabylake_da7219_fe_init,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &kabylake_da7219_fe_ops,
 		SND_SOC_DAILINK_REG(system, dummy, platform),
 	},
@@ -687,7 +687,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.name = "Kbl Audio Echo Reference cap",
 		.stream_name = "Echoreference Capture",
 		.init = NULL,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.nonatomic = 1,
 		SND_SOC_DAILINK_REG(echoref, dummy, platform),
 	},
@@ -695,7 +695,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.name = "Kbl Audio Reference cap",
 		.stream_name = "Wake on Voice",
 		.init = NULL,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.nonatomic = 1,
 		.dynamic = 1,
 		.ops = &skylake_refcap_ops,
@@ -705,7 +705,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.name = "Kbl Audio DMIC cap",
 		.stream_name = "dmiccap",
 		.init = NULL,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.nonatomic = 1,
 		.dynamic = 1,
 		.ops = &kabylake_dmic_ops,
@@ -714,7 +714,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 	[KBL_DPCM_AUDIO_HDMI1_PB] = {
 		.name = "Kbl HDMI Port1",
 		.stream_name = "Hdmi1",
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.init = NULL,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
@@ -725,7 +725,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 	[KBL_DPCM_AUDIO_HDMI2_PB] = {
 		.name = "Kbl HDMI Port2",
 		.stream_name = "Hdmi2",
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.init = NULL,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
@@ -738,7 +738,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.stream_name = "Hdmi3",
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.init = NULL,
 		.nonatomic = 1,
 		.dynamic = 1,
@@ -747,7 +747,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 	[KBL_DPCM_AUDIO_HS_PB] = {
 		.name = "Kbl Audio Headset Playback",
 		.stream_name = "Headset Audio",
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.nonatomic = 1,
 		.dynamic = 1,
 		.init = kabylake_da7219_fe_init,
@@ -763,7 +763,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.nonatomic = 1,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ops = &kabylake_da7219_fe_ops,
 		SND_SOC_DAILINK_REG(system, dummy, platform),
 	},
@@ -777,8 +777,6 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.dai_fmt = SND_SOC_DAIFMT_DSP_B |
 			SND_SOC_DAIFMT_NB_NF |
 			SND_SOC_DAIFMT_CBC_CFC,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = kabylake_ssp_fixup,
 		.ops = &kabylake_ssp0_ops,
@@ -794,8 +792,6 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 			SND_SOC_DAIFMT_CBC_CFC,
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = kabylake_ssp_fixup,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(ssp1_pin, ssp1_codec, platform),
 	},
 	{
@@ -804,14 +800,14 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.init = kabylake_dmic_init,
 		.be_hw_params_fixup = kabylake_dmic_fixup,
 		.ignore_suspend = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(dmic_pin, dmic_codec, platform),
 	},
 	{
 		.name = "iDisp1",
 		.id = 3,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.init = kabylake_hdmi1_init,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp1_pin, idisp1_codec, platform),
@@ -820,7 +816,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.name = "iDisp2",
 		.id = 4,
 		.init = kabylake_hdmi2_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp2_pin, idisp2_codec, platform),
 	},
@@ -828,7 +824,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.name = "iDisp3",
 		.id = 5,
 		.init = kabylake_hdmi3_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp3_pin, idisp3_codec, platform),
 	},
@@ -845,7 +841,7 @@ static struct snd_soc_dai_link kabylake_max98_927_373_dais[] = {
 		.init = kabylake_da7219_fe_init,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &kabylake_da7219_fe_ops,
 		SND_SOC_DAILINK_REG(system, dummy, platform),
 	},
@@ -853,7 +849,7 @@ static struct snd_soc_dai_link kabylake_max98_927_373_dais[] = {
 		.name = "Kbl Audio Echo Reference cap",
 		.stream_name = "Echoreference Capture",
 		.init = NULL,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.nonatomic = 1,
 		SND_SOC_DAILINK_REG(echoref, dummy, platform),
 	},
@@ -861,7 +857,7 @@ static struct snd_soc_dai_link kabylake_max98_927_373_dais[] = {
 		.name = "Kbl Audio Reference cap",
 		.stream_name = "Wake on Voice",
 		.init = NULL,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.nonatomic = 1,
 		.dynamic = 1,
 		.ops = &skylake_refcap_ops,
@@ -871,7 +867,7 @@ static struct snd_soc_dai_link kabylake_max98_927_373_dais[] = {
 		.name = "Kbl Audio DMIC cap",
 		.stream_name = "dmiccap",
 		.init = NULL,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.nonatomic = 1,
 		.dynamic = 1,
 		.ops = &kabylake_dmic_ops,
@@ -880,7 +876,7 @@ static struct snd_soc_dai_link kabylake_max98_927_373_dais[] = {
 	[KBL_DPCM_AUDIO_HDMI1_PB] = {
 		.name = "Kbl HDMI Port1",
 		.stream_name = "Hdmi1",
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.init = NULL,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
@@ -891,7 +887,7 @@ static struct snd_soc_dai_link kabylake_max98_927_373_dais[] = {
 	[KBL_DPCM_AUDIO_HDMI2_PB] = {
 		.name = "Kbl HDMI Port2",
 		.stream_name = "Hdmi2",
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.init = NULL,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
@@ -904,7 +900,7 @@ static struct snd_soc_dai_link kabylake_max98_927_373_dais[] = {
 		.stream_name = "Hdmi3",
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.init = NULL,
 		.nonatomic = 1,
 		.dynamic = 1,
@@ -920,8 +916,6 @@ static struct snd_soc_dai_link kabylake_max98_927_373_dais[] = {
 		.dai_fmt = SND_SOC_DAIFMT_DSP_B |
 			SND_SOC_DAIFMT_NB_NF |
 			SND_SOC_DAIFMT_CBC_CFC,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = kabylake_ssp_fixup,
 		.ops = &kabylake_ssp0_ops,
@@ -933,14 +927,14 @@ static struct snd_soc_dai_link kabylake_max98_927_373_dais[] = {
 		.init = kabylake_dmic_init,
 		.be_hw_params_fixup = kabylake_dmic_fixup,
 		.ignore_suspend = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(dmic_pin, dmic_codec, platform),
 	},
 	{
 		.name = "iDisp1",
 		.id = 2,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.init = kabylake_hdmi1_init,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp1_pin, idisp1_codec, platform),
@@ -949,7 +943,7 @@ static struct snd_soc_dai_link kabylake_max98_927_373_dais[] = {
 		.name = "iDisp2",
 		.id = 3,
 		.init = kabylake_hdmi2_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp2_pin, idisp2_codec, platform),
 	},
@@ -957,7 +951,7 @@ static struct snd_soc_dai_link kabylake_max98_927_373_dais[] = {
 		.name = "iDisp3",
 		.id = 4,
 		.init = kabylake_hdmi3_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp3_pin, idisp3_codec, platform),
 	},
diff --git a/sound/soc/intel/boards/kbl_rt5660.c b/sound/soc/intel/boards/kbl_rt5660.c
index 2c7a547f63c9..b1f644f61232 100644
--- a/sound/soc/intel/boards/kbl_rt5660.c
+++ b/sound/soc/intel/boards/kbl_rt5660.c
@@ -377,7 +377,7 @@ static struct snd_soc_dai_link kabylake_rt5660_dais[] = {
 		.nonatomic = 1,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &kabylake_rt5660_fe_ops,
 		SND_SOC_DAILINK_REG(system, dummy, platform),
 	},
@@ -388,14 +388,14 @@ static struct snd_soc_dai_link kabylake_rt5660_dais[] = {
 		.nonatomic = 1,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ops = &kabylake_rt5660_fe_ops,
 		SND_SOC_DAILINK_REG(system, dummy, platform),
 	},
 	[KBL_DPCM_AUDIO_HDMI1_PB] = {
 		.name = "Kbl HDMI Port1",
 		.stream_name = "Hdmi1",
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.init = NULL,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
@@ -406,7 +406,7 @@ static struct snd_soc_dai_link kabylake_rt5660_dais[] = {
 	[KBL_DPCM_AUDIO_HDMI2_PB] = {
 		.name = "Kbl HDMI Port2",
 		.stream_name = "Hdmi2",
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.init = NULL,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
@@ -419,7 +419,7 @@ static struct snd_soc_dai_link kabylake_rt5660_dais[] = {
 		.stream_name = "Hdmi3",
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.init = NULL,
 		.nonatomic = 1,
 		.dynamic = 1,
@@ -440,14 +440,12 @@ static struct snd_soc_dai_link kabylake_rt5660_dais[] = {
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = kabylake_ssp0_fixup,
 		.ops = &kabylake_rt5660_ops,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(ssp0_pin, ssp0_codec, platform),
 	},
 	{
 		.name = "iDisp1",
 		.id = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.init = kabylake_hdmi1_init,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp1_pin, idisp1_codec, platform),
@@ -456,7 +454,7 @@ static struct snd_soc_dai_link kabylake_rt5660_dais[] = {
 		.name = "iDisp2",
 		.id = 2,
 		.init = kabylake_hdmi2_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp2_pin, idisp2_codec, platform),
 	},
@@ -464,7 +462,7 @@ static struct snd_soc_dai_link kabylake_rt5660_dais[] = {
 		.name = "iDisp3",
 		.id = 3,
 		.init = kabylake_hdmi3_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp3_pin, idisp3_codec, platform),
 	},
diff --git a/sound/soc/intel/boards/kbl_rt5663_max98927.c b/sound/soc/intel/boards/kbl_rt5663_max98927.c
index 2d4224c5b152..c9a5b6b709e8 100644
--- a/sound/soc/intel/boards/kbl_rt5663_max98927.c
+++ b/sound/soc/intel/boards/kbl_rt5663_max98927.c
@@ -687,7 +687,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.init = kabylake_rt5663_fe_init,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &kabylake_rt5663_fe_ops,
 		SND_SOC_DAILINK_REG(system, dummy, platform),
 	},
@@ -698,14 +698,14 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.nonatomic = 1,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ops = &kabylake_rt5663_fe_ops,
 		SND_SOC_DAILINK_REG(system, dummy, platform),
 	},
 	[KBL_DPCM_AUDIO_HS_PB] = {
 		.name = "Kbl Audio Headset Playback",
 		.stream_name = "Headset Audio",
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.nonatomic = 1,
 		.dynamic = 1,
 		SND_SOC_DAILINK_REG(system2, dummy, platform),
@@ -714,7 +714,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.name = "Kbl Audio Echo Reference cap",
 		.stream_name = "Echoreference Capture",
 		.init = NULL,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.nonatomic = 1,
 		SND_SOC_DAILINK_REG(echoref, dummy, platform),
 	},
@@ -722,7 +722,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.name = "Kbl Audio Reference cap",
 		.stream_name = "Wake on Voice",
 		.init = NULL,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.nonatomic = 1,
 		.dynamic = 1,
 		.ops = &skylake_refcap_ops,
@@ -732,7 +732,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.name = "Kbl Audio DMIC cap",
 		.stream_name = "dmiccap",
 		.init = NULL,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.nonatomic = 1,
 		.dynamic = 1,
 		.ops = &kabylake_dmic_ops,
@@ -741,7 +741,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 	[KBL_DPCM_AUDIO_HDMI1_PB] = {
 		.name = "Kbl HDMI Port1",
 		.stream_name = "Hdmi1",
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.init = NULL,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
@@ -752,7 +752,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 	[KBL_DPCM_AUDIO_HDMI2_PB] = {
 		.name = "Kbl HDMI Port2",
 		.stream_name = "Hdmi2",
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.init = NULL,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
@@ -765,7 +765,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.stream_name = "Hdmi3",
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.init = NULL,
 		.nonatomic = 1,
 		.dynamic = 1,
@@ -783,7 +783,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 			SND_SOC_DAIFMT_CBC_CFC,
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = kabylake_ssp_fixup,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &kabylake_ssp0_ops,
 		SND_SOC_DAILINK_REG(ssp0_pin, ssp0_codec, platform),
 	},
@@ -798,8 +798,6 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = kabylake_ssp_fixup,
 		.ops = &kabylake_rt5663_ops,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(ssp1_pin, ssp1_codec, platform),
 	},
 	{
@@ -807,14 +805,14 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.id = 2,
 		.be_hw_params_fixup = kabylake_dmic_fixup,
 		.ignore_suspend = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(dmic01_pin, dmic_codec, platform),
 	},
 	{
 		.name = "iDisp1",
 		.id = 3,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.init = kabylake_hdmi1_init,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp1_pin, idisp1_codec, platform),
@@ -823,7 +821,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.name = "iDisp2",
 		.id = 4,
 		.init = kabylake_hdmi2_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp2_pin, idisp2_codec, platform),
 	},
@@ -831,7 +829,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.name = "iDisp3",
 		.id = 5,
 		.init = kabylake_hdmi3_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp3_pin, idisp3_codec, platform),
 	},
@@ -846,7 +844,7 @@ static struct snd_soc_dai_link kabylake_5663_dais[] = {
 		.nonatomic = 1,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &kabylake_rt5663_fe_ops,
 		SND_SOC_DAILINK_REG(system, dummy, platform),
 	},
@@ -857,14 +855,14 @@ static struct snd_soc_dai_link kabylake_5663_dais[] = {
 		.nonatomic = 1,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ops = &kabylake_rt5663_fe_ops,
 		SND_SOC_DAILINK_REG(system, dummy, platform),
 	},
 	[KBL_DPCM_AUDIO_5663_HDMI1_PB] = {
 		.name = "Kbl HDMI Port1",
 		.stream_name = "Hdmi1",
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.init = NULL,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
@@ -875,7 +873,7 @@ static struct snd_soc_dai_link kabylake_5663_dais[] = {
 	[KBL_DPCM_AUDIO_5663_HDMI2_PB] = {
 		.name = "Kbl HDMI Port2",
 		.stream_name = "Hdmi2",
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.init = NULL,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
@@ -896,14 +894,12 @@ static struct snd_soc_dai_link kabylake_5663_dais[] = {
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = kabylake_ssp_fixup,
 		.ops = &kabylake_rt5663_ops,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(ssp1_pin, ssp1_codec, platform),
 	},
 	{
 		.name = "iDisp1",
 		.id = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.init = kabylake_5663_hdmi1_init,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp1_pin, idisp1_codec, platform),
@@ -912,7 +908,7 @@ static struct snd_soc_dai_link kabylake_5663_dais[] = {
 		.name = "iDisp2",
 		.id = 2,
 		.init = kabylake_5663_hdmi2_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp2_pin, idisp2_codec, platform),
 	},
diff --git a/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c b/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
index 2c79fca57b19..1c7bce63ecc5 100644
--- a/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
+++ b/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
@@ -575,7 +575,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.init = kabylake_rt5663_fe_init,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &kabylake_rt5663_fe_ops,
 		SND_SOC_DAILINK_REG(system, dummy, platform),
 	},
@@ -586,14 +586,14 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.nonatomic = 1,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ops = &kabylake_rt5663_fe_ops,
 		SND_SOC_DAILINK_REG(system, dummy, platform),
 	},
 	[KBL_DPCM_AUDIO_HS_PB] = {
 		.name = "Kbl Audio Headset Playback",
 		.stream_name = "Headset Audio",
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.nonatomic = 1,
 		.dynamic = 1,
 		SND_SOC_DAILINK_REG(system2, dummy, platform),
@@ -602,7 +602,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.name = "Kbl Audio Echo Reference cap",
 		.stream_name = "Echoreference Capture",
 		.init = NULL,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.nonatomic = 1,
 		SND_SOC_DAILINK_REG(echoref, dummy, platform),
 	},
@@ -615,7 +615,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.name = "Kbl Audio DMIC cap",
 		.stream_name = "dmiccap",
 		.init = NULL,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.nonatomic = 1,
 		.dynamic = 1,
 		.ops = &kabylake_dmic_ops,
@@ -624,7 +624,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 	[KBL_DPCM_AUDIO_HDMI1_PB] = {
 		.name = "Kbl HDMI Port1",
 		.stream_name = "Hdmi1",
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.init = NULL,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
@@ -635,7 +635,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 	[KBL_DPCM_AUDIO_HDMI2_PB] = {
 		.name = "Kbl HDMI Port2",
 		.stream_name = "Hdmi2",
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.init = NULL,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
@@ -655,8 +655,6 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 			SND_SOC_DAIFMT_CBC_CFC,
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = kabylake_ssp_fixup,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &kabylake_ssp0_ops,
 		SND_SOC_DAILINK_REG(ssp0_pin, ssp0_codec, platform),
 	},
@@ -670,14 +668,12 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = kabylake_ssp_fixup,
 		.ops = &kabylake_rt5663_ops,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(ssp1_pin, ssp1_codec, platform),
 	},
 	{
 		.name = "iDisp1",
 		.id = 3,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.init = kabylake_hdmi1_init,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp1_pin, idisp1_codec, platform),
@@ -686,7 +682,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.name = "iDisp2",
 		.id = 4,
 		.init = kabylake_hdmi2_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp2_pin, idisp2_codec, platform),
 	},
diff --git a/sound/soc/intel/boards/skl_hda_dsp_common.c b/sound/soc/intel/boards/skl_hda_dsp_common.c
index e9cefa4ae56d..8e13216e16c8 100644
--- a/sound/soc/intel/boards/skl_hda_dsp_common.c
+++ b/sound/soc/intel/boards/skl_hda_dsp_common.c
@@ -84,51 +84,47 @@ struct snd_soc_dai_link skl_hda_be_dai_links[HDA_DSP_MAX_BE_DAI_LINKS] = {
 	{
 		.name = "iDisp1",
 		.id = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp1_cpu, idisp1_codec, platform),
 	},
 	{
 		.name = "iDisp2",
 		.id = 2,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp2_cpu, idisp2_codec, platform),
 	},
 	{
 		.name = "iDisp3",
 		.id = 3,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp3_cpu, idisp3_codec, platform),
 	},
 	{
 		.name = "Analog Playback and Capture",
 		.id = 4,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(analog_cpu, analog_codec, platform),
 	},
 	{
 		.name = "Digital Playback and Capture",
 		.id = 5,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(digital_cpu, digital_codec, platform),
 	},
 	{
 		.name = "dmic01",
 		.id = 6,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(dmic_pin, dmic_codec, platform),
 	},
 	{
 		.name = "dmic16k",
 		.id = 7,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(dmic16k, dmic_codec, platform),
 	},
diff --git a/sound/soc/intel/boards/skl_nau88l25_max98357a.c b/sound/soc/intel/boards/skl_nau88l25_max98357a.c
index e13a5a4d8f7e..eb90017f891f 100644
--- a/sound/soc/intel/boards/skl_nau88l25_max98357a.c
+++ b/sound/soc/intel/boards/skl_nau88l25_max98357a.c
@@ -474,7 +474,7 @@ static struct snd_soc_dai_link skylake_dais[] = {
 		.init = skylake_nau8825_fe_init,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &skylake_nau8825_fe_ops,
 		SND_SOC_DAILINK_REG(system, dummy, platform),
 	},
@@ -485,7 +485,7 @@ static struct snd_soc_dai_link skylake_dais[] = {
 		.nonatomic = 1,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ops = &skylake_nau8825_fe_ops,
 		SND_SOC_DAILINK_REG(system, dummy, platform),
 	},
@@ -493,7 +493,7 @@ static struct snd_soc_dai_link skylake_dais[] = {
 		.name = "Skl Audio Reference cap",
 		.stream_name = "Wake on Voice",
 		.init = NULL,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.nonatomic = 1,
 		.dynamic = 1,
 		.ops = &skylake_refcap_ops,
@@ -503,7 +503,7 @@ static struct snd_soc_dai_link skylake_dais[] = {
 		.name = "Skl Audio DMIC cap",
 		.stream_name = "dmiccap",
 		.init = NULL,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.nonatomic = 1,
 		.dynamic = 1,
 		.ops = &skylake_dmic_ops,
@@ -512,7 +512,7 @@ static struct snd_soc_dai_link skylake_dais[] = {
 	[SKL_DPCM_AUDIO_HDMI1_PB] = {
 		.name = "Skl HDMI Port1",
 		.stream_name = "Hdmi1",
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.init = NULL,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
@@ -523,7 +523,7 @@ static struct snd_soc_dai_link skylake_dais[] = {
 	[SKL_DPCM_AUDIO_HDMI2_PB] = {
 		.name = "Skl HDMI Port2",
 		.stream_name = "Hdmi2",
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.init = NULL,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
@@ -536,7 +536,7 @@ static struct snd_soc_dai_link skylake_dais[] = {
 		.stream_name = "Hdmi3",
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.init = NULL,
 		.nonatomic = 1,
 		.dynamic = 1,
@@ -554,7 +554,7 @@ static struct snd_soc_dai_link skylake_dais[] = {
 			SND_SOC_DAIFMT_CBC_CFC,
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = skylake_ssp_fixup,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(ssp0_pin, ssp0_codec, platform),
 	},
 	{
@@ -568,8 +568,6 @@ static struct snd_soc_dai_link skylake_dais[] = {
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = skylake_ssp_fixup,
 		.ops = &skylake_nau8825_ops,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(ssp1_pin, ssp1_codec, platform),
 	},
 	{
@@ -577,14 +575,14 @@ static struct snd_soc_dai_link skylake_dais[] = {
 		.id = 2,
 		.be_hw_params_fixup = skylake_dmic_fixup,
 		.ignore_suspend = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(dmic_pin, dmic_codec, platform),
 	},
 	{
 		.name = "iDisp1",
 		.id = 3,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.init = skylake_hdmi1_init,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp1_pin, idisp1_codec, platform),
@@ -593,7 +591,7 @@ static struct snd_soc_dai_link skylake_dais[] = {
 		.name = "iDisp2",
 		.id = 4,
 		.init = skylake_hdmi2_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp2_pin, idisp2_codec, platform),
 	},
@@ -601,7 +599,7 @@ static struct snd_soc_dai_link skylake_dais[] = {
 		.name = "iDisp3",
 		.id = 5,
 		.init = skylake_hdmi3_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp3_pin, idisp3_codec, platform),
 	},
diff --git a/sound/soc/intel/boards/skl_nau88l25_ssm4567.c b/sound/soc/intel/boards/skl_nau88l25_ssm4567.c
index 575604dc8936..bf4e83433baa 100644
--- a/sound/soc/intel/boards/skl_nau88l25_ssm4567.c
+++ b/sound/soc/intel/boards/skl_nau88l25_ssm4567.c
@@ -513,7 +513,7 @@ static struct snd_soc_dai_link skylake_dais[] = {
 		.init = skylake_nau8825_fe_init,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &skylake_nau8825_fe_ops,
 		SND_SOC_DAILINK_REG(system, dummy, platform),
 	},
@@ -524,7 +524,7 @@ static struct snd_soc_dai_link skylake_dais[] = {
 		.nonatomic = 1,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ops = &skylake_nau8825_fe_ops,
 		SND_SOC_DAILINK_REG(system, dummy, platform),
 	},
@@ -532,7 +532,7 @@ static struct snd_soc_dai_link skylake_dais[] = {
 		.name = "Skl Audio Reference cap",
 		.stream_name = "Wake on Voice",
 		.init = NULL,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.nonatomic = 1,
 		.dynamic = 1,
 		.ops = &skylake_refcap_ops,
@@ -542,7 +542,7 @@ static struct snd_soc_dai_link skylake_dais[] = {
 		.name = "Skl Audio DMIC cap",
 		.stream_name = "dmiccap",
 		.init = NULL,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.nonatomic = 1,
 		.dynamic = 1,
 		.ops = &skylake_dmic_ops,
@@ -551,7 +551,7 @@ static struct snd_soc_dai_link skylake_dais[] = {
 	[SKL_DPCM_AUDIO_HDMI1_PB] = {
 		.name = "Skl HDMI Port1",
 		.stream_name = "Hdmi1",
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.init = NULL,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
@@ -562,7 +562,7 @@ static struct snd_soc_dai_link skylake_dais[] = {
 	[SKL_DPCM_AUDIO_HDMI2_PB] = {
 		.name = "Skl HDMI Port2",
 		.stream_name = "Hdmi2",
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.init = NULL,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
@@ -575,7 +575,7 @@ static struct snd_soc_dai_link skylake_dais[] = {
 		.stream_name = "Hdmi3",
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.init = NULL,
 		.nonatomic = 1,
 		.dynamic = 1,
@@ -594,8 +594,6 @@ static struct snd_soc_dai_link skylake_dais[] = {
 		.init = skylake_ssm4567_codec_init,
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = skylake_ssp_fixup,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(ssp0_pin, ssp0_codec, platform),
 	},
 	{
@@ -609,8 +607,6 @@ static struct snd_soc_dai_link skylake_dais[] = {
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = skylake_ssp_fixup,
 		.ops = &skylake_nau8825_ops,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(ssp1_pin, ssp1_codec, platform),
 	},
 	{
@@ -618,14 +614,14 @@ static struct snd_soc_dai_link skylake_dais[] = {
 		.id = 2,
 		.ignore_suspend = 1,
 		.be_hw_params_fixup = skylake_dmic_fixup,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(dmic01_pin, dmic_codec, platform),
 	},
 	{
 		.name = "iDisp1",
 		.id = 3,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.init = skylake_hdmi1_init,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp1_pin, idisp1_codec, platform),
@@ -634,7 +630,7 @@ static struct snd_soc_dai_link skylake_dais[] = {
 		.name = "iDisp2",
 		.id = 4,
 		.init = skylake_hdmi2_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp2_pin, idisp2_codec, platform),
 	},
@@ -642,7 +638,7 @@ static struct snd_soc_dai_link skylake_dais[] = {
 		.name = "iDisp3",
 		.id = 5,
 		.init = skylake_hdmi3_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp3_pin, idisp3_codec, platform),
 	},
diff --git a/sound/soc/intel/boards/skl_rt286.c b/sound/soc/intel/boards/skl_rt286.c
index 4f3d655e2bfa..04f3db889d07 100644
--- a/sound/soc/intel/boards/skl_rt286.c
+++ b/sound/soc/intel/boards/skl_rt286.c
@@ -348,7 +348,7 @@ static struct snd_soc_dai_link skylake_rt286_dais[] = {
 			SND_SOC_DPCM_TRIGGER_POST,
 			SND_SOC_DPCM_TRIGGER_POST
 		},
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &skylake_rt286_fe_ops,
 		SND_SOC_DAILINK_REG(system, dummy, platform),
 	},
@@ -361,7 +361,7 @@ static struct snd_soc_dai_link skylake_rt286_dais[] = {
 			SND_SOC_DPCM_TRIGGER_POST,
 			SND_SOC_DPCM_TRIGGER_POST
 		},
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &skylake_rt286_fe_ops,
 		SND_SOC_DAILINK_REG(deepbuffer, dummy, platform),
 	},
@@ -374,7 +374,7 @@ static struct snd_soc_dai_link skylake_rt286_dais[] = {
 			SND_SOC_DPCM_TRIGGER_POST,
 			SND_SOC_DPCM_TRIGGER_POST
 		},
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ops = &skylake_rt286_fe_ops,
 		SND_SOC_DAILINK_REG(system, dummy, platform),
 	},
@@ -382,7 +382,7 @@ static struct snd_soc_dai_link skylake_rt286_dais[] = {
 		.name = "Skl Audio Reference cap",
 		.stream_name = "refcap",
 		.init = NULL,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.nonatomic = 1,
 		.dynamic = 1,
 		SND_SOC_DAILINK_REG(reference, dummy, platform),
@@ -391,7 +391,7 @@ static struct snd_soc_dai_link skylake_rt286_dais[] = {
 		.name = "Skl Audio DMIC cap",
 		.stream_name = "dmiccap",
 		.init = NULL,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.nonatomic = 1,
 		.dynamic = 1,
 		.ops = &skylake_dmic_ops,
@@ -400,7 +400,7 @@ static struct snd_soc_dai_link skylake_rt286_dais[] = {
 	[SKL_DPCM_AUDIO_HDMI1_PB] = {
 		.name = "Skl HDMI Port1",
 		.stream_name = "Hdmi1",
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.init = NULL,
 		.nonatomic = 1,
 		.dynamic = 1,
@@ -409,7 +409,7 @@ static struct snd_soc_dai_link skylake_rt286_dais[] = {
 	[SKL_DPCM_AUDIO_HDMI2_PB] = {
 		.name = "Skl HDMI Port2",
 		.stream_name = "Hdmi2",
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.init = NULL,
 		.nonatomic = 1,
 		.dynamic = 1,
@@ -418,7 +418,7 @@ static struct snd_soc_dai_link skylake_rt286_dais[] = {
 	[SKL_DPCM_AUDIO_HDMI3_PB] = {
 		.name = "Skl HDMI Port3",
 		.stream_name = "Hdmi3",
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.init = NULL,
 		.nonatomic = 1,
 		.dynamic = 1,
@@ -438,8 +438,6 @@ static struct snd_soc_dai_link skylake_rt286_dais[] = {
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = skylake_ssp0_fixup,
 		.ops = &skylake_rt286_ops,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(ssp0_pin, ssp0_codec, platform),
 	},
 	{
@@ -447,7 +445,7 @@ static struct snd_soc_dai_link skylake_rt286_dais[] = {
 		.id = 1,
 		.be_hw_params_fixup = skylake_dmic_fixup,
 		.ignore_suspend = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(dmic01_pin, dmic_codec, platform),
 	},
@@ -455,7 +453,7 @@ static struct snd_soc_dai_link skylake_rt286_dais[] = {
 		.name = "iDisp1",
 		.id = 2,
 		.init = skylake_hdmi_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp1_pin, idisp1_codec, platform),
 	},
@@ -463,7 +461,7 @@ static struct snd_soc_dai_link skylake_rt286_dais[] = {
 		.name = "iDisp2",
 		.id = 3,
 		.init = skylake_hdmi_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp2_pin, idisp2_codec, platform),
 	},
@@ -471,7 +469,7 @@ static struct snd_soc_dai_link skylake_rt286_dais[] = {
 		.name = "iDisp3",
 		.id = 4,
 		.init = skylake_hdmi_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp3_pin, idisp3_codec, platform),
 	},
diff --git a/sound/soc/intel/boards/sof_cs42l42.c b/sound/soc/intel/boards/sof_cs42l42.c
index e6695e77d594..402e85f08f04 100644
--- a/sound/soc/intel/boards/sof_cs42l42.c
+++ b/sound/soc/intel/boards/sof_cs42l42.c
@@ -328,10 +328,6 @@ static int create_spk_amp_dai_links(struct device *dev,
 
 	links[*id].platforms = platform_component;
 	links[*id].num_platforms = ARRAY_SIZE(platform_component);
-	links[*id].dpcm_playback = 1;
-	/* firmware-generated echo reference */
-	links[*id].dpcm_capture = 1;
-
 	links[*id].no_pcm = 1;
 	links[*id].cpus = &cpus[*id];
 	links[*id].num_cpus = 1;
@@ -368,8 +364,6 @@ static int create_hp_codec_dai_links(struct device *dev,
 	links[*id].init = sof_cs42l42_init;
 	links[*id].exit = sof_cs42l42_exit;
 	links[*id].ops = &sof_cs42l42_ops;
-	links[*id].dpcm_playback = 1;
-	links[*id].dpcm_capture = 1;
 	links[*id].no_pcm = 1;
 	links[*id].cpus = &cpus[*id];
 	links[*id].num_cpus = 1;
@@ -420,7 +414,7 @@ static int create_dmic_dai_links(struct device *dev,
 		links[*id].platforms = platform_component;
 		links[*id].num_platforms = ARRAY_SIZE(platform_component);
 		links[*id].ignore_suspend = 1;
-		links[*id].dpcm_capture = 1;
+		links[*id].capture_only = 1;
 		links[*id].no_pcm = 1;
 
 		(*id)++;
@@ -476,7 +470,7 @@ static int create_hdmi_dai_links(struct device *dev,
 		links[*id].platforms = platform_component;
 		links[*id].num_platforms = ARRAY_SIZE(platform_component);
 		links[*id].init = sof_hdmi_init;
-		links[*id].dpcm_playback = 1;
+		links[*id].playback_only = 1;
 		links[*id].no_pcm = 1;
 
 		(*id)++;
@@ -508,8 +502,6 @@ static int create_bt_offload_dai_links(struct device *dev,
 	links[*id].platforms = platform_component;
 	links[*id].num_platforms = ARRAY_SIZE(platform_component);
 
-	links[*id].dpcm_playback = 1;
-	links[*id].dpcm_capture = 1;
 	links[*id].no_pcm = 1;
 	links[*id].cpus = &cpus[*id];
 	links[*id].num_cpus = 1;
diff --git a/sound/soc/intel/boards/sof_da7219_max98373.c b/sound/soc/intel/boards/sof_da7219_max98373.c
index 740aa11cb019..37ea39be3091 100644
--- a/sound/soc/intel/boards/sof_da7219_max98373.c
+++ b/sound/soc/intel/boards/sof_da7219_max98373.c
@@ -316,8 +316,6 @@ static struct snd_soc_dai_link dais[] = {
 		.id = 0,
 		.ignore_pmdown_time = 1,
 		.no_pcm = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1, /* IV feedback */
 		.ops = &ssp1_ops,
 		SND_SOC_DAILINK_REG(ssp1_pin, ssp1_amps, platform),
 	},
@@ -327,15 +325,13 @@ static struct snd_soc_dai_link dais[] = {
 		.no_pcm = 1,
 		.init = da7219_codec_init,
 		.ignore_pmdown_time = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(ssp0_pin, ssp0_codec, platform),
 	},
 	{
 		.name = "dmic01",
 		.id = 2,
 		.ignore_suspend = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(dmic_pin, dmic_codec, platform),
 	},
@@ -343,7 +339,7 @@ static struct snd_soc_dai_link dais[] = {
 		.name = "iDisp1",
 		.id = 3,
 		.init = hdmi_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp1_pin, idisp1_codec, platform),
 	},
@@ -351,7 +347,7 @@ static struct snd_soc_dai_link dais[] = {
 		.name = "iDisp2",
 		.id = 4,
 		.init = hdmi_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp2_pin, idisp2_codec, platform),
 	},
@@ -359,7 +355,7 @@ static struct snd_soc_dai_link dais[] = {
 		.name = "iDisp3",
 		.id = 5,
 		.init = hdmi_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp3_pin, idisp3_codec, platform),
 	},
@@ -367,7 +363,7 @@ static struct snd_soc_dai_link dais[] = {
 		.name = "dmic16k",
 		.id = 6,
 		.ignore_suspend = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(dmic16k_pin, dmic_codec, platform),
 	}
@@ -422,7 +418,7 @@ static int audio_probe(struct platform_device *pdev)
 			.name = "SSP1-Codec",
 			.id = 0,
 			.no_pcm = 1,
-			.dpcm_playback = 1,
+			.playback_only = 1,
 			.ignore_pmdown_time = 1,
 			SND_SOC_DAILINK_REG(ssp1_pin, ssp1_m98360a, platform) };
 	}
diff --git a/sound/soc/intel/boards/sof_es8336.c b/sound/soc/intel/boards/sof_es8336.c
index d6c38d8ea2ff..ff7417ca11cd 100644
--- a/sound/soc/intel/boards/sof_es8336.c
+++ b/sound/soc/intel/boards/sof_es8336.c
@@ -455,8 +455,6 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 	links[id].exit = sof_es8316_exit;
 	links[id].ops = &sof_es8336_ops;
 	links[id].nonatomic = true;
-	links[id].dpcm_playback = 1;
-	links[id].dpcm_capture = 1;
 	links[id].no_pcm = 1;
 	links[id].cpus = &cpus[id];
 	links[id].num_cpus = 1;
@@ -496,7 +494,7 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 		links[id].platforms = platform_component;
 		links[id].num_platforms = ARRAY_SIZE(platform_component);
 		links[id].ignore_suspend = 1;
-		links[id].dpcm_capture = 1;
+		links[id].capture_only = 1;
 		links[id].no_pcm = 1;
 
 		id++;
@@ -539,7 +537,7 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 		links[id].platforms = platform_component;
 		links[id].num_platforms = ARRAY_SIZE(platform_component);
 		links[id].init = sof_hdmi_init;
-		links[id].dpcm_playback = 1;
+		links[id].playback_only = 1;
 		links[id].no_pcm = 1;
 
 		id++;
@@ -569,7 +567,7 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 			links[id].num_codecs = 1;
 			links[id].platforms = platform_component;
 			links[id].num_platforms = ARRAY_SIZE(platform_component);
-			links[id].dpcm_capture = 1;
+			links[id].capture_only = 1;
 			links[id].no_pcm = 1;
 			links[id].num_cpus = 1;
 			id++;
diff --git a/sound/soc/intel/boards/sof_nau8825.c b/sound/soc/intel/boards/sof_nau8825.c
index 4fc6e1c6aef3..c439829f061b 100644
--- a/sound/soc/intel/boards/sof_nau8825.c
+++ b/sound/soc/intel/boards/sof_nau8825.c
@@ -378,8 +378,6 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 	links[id].init = sof_nau8825_codec_init;
 	links[id].exit = sof_nau8825_codec_exit;
 	links[id].ops = &sof_nau8825_ops;
-	links[id].dpcm_playback = 1;
-	links[id].dpcm_capture = 1;
 	links[id].no_pcm = 1;
 	links[id].cpus = &cpus[id];
 	links[id].num_cpus = 1;
@@ -416,7 +414,7 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 		links[id].platforms = platform_component;
 		links[id].num_platforms = ARRAY_SIZE(platform_component);
 		links[id].ignore_suspend = 1;
-		links[id].dpcm_capture = 1;
+		links[id].capture_only = 1;
 		links[id].no_pcm = 1;
 		id++;
 	}
@@ -457,7 +455,7 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 		links[id].platforms = platform_component;
 		links[id].num_platforms = ARRAY_SIZE(platform_component);
 		links[id].init = sof_hdmi_init;
-		links[id].dpcm_playback = 1;
+		links[id].playback_only = 1;
 		links[id].no_pcm = 1;
 		id++;
 	}
@@ -496,10 +494,6 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 
 		links[id].platforms = platform_component;
 		links[id].num_platforms = ARRAY_SIZE(platform_component);
-		links[id].dpcm_playback = 1;
-		/* feedback stream or firmware-generated echo reference */
-		links[id].dpcm_capture = 1;
-
 		links[id].no_pcm = 1;
 		links[id].cpus = &cpus[id];
 		links[id].num_cpus = 1;
@@ -529,8 +523,6 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 		links[id].num_codecs = 1;
 		links[id].platforms = platform_component;
 		links[id].num_platforms = ARRAY_SIZE(platform_component);
-		links[id].dpcm_playback = 1;
-		links[id].dpcm_capture = 1;
 		links[id].no_pcm = 1;
 		links[id].num_cpus = 1;
 	}
diff --git a/sound/soc/intel/boards/sof_pcm512x.c b/sound/soc/intel/boards/sof_pcm512x.c
index 9f673ccf81b5..52cb1c9a9af6 100644
--- a/sound/soc/intel/boards/sof_pcm512x.c
+++ b/sound/soc/intel/boards/sof_pcm512x.c
@@ -246,12 +246,12 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 	links[id].num_platforms = ARRAY_SIZE(platform_component);
 	links[id].init = sof_pcm512x_codec_init;
 	links[id].ops = &sof_pcm512x_ops;
-	links[id].dpcm_playback = 1;
+	links[id].playback_only = 1;
 	/*
 	 * capture only supported with specific versions of the Hifiberry DAC+
 	 */
 	if (sof_pcm512x_quirk & SOF_PCM512X_ENABLE_SSP_CAPTURE)
-		links[id].dpcm_capture = 1;
+		links[id].playback_only = 0;
 	links[id].no_pcm = 1;
 	links[id].cpus = &cpus[id];
 	links[id].num_cpus = 1;
@@ -294,7 +294,7 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 		links[id].platforms = platform_component;
 		links[id].num_platforms = ARRAY_SIZE(platform_component);
 		links[id].ignore_suspend = 1;
-		links[id].dpcm_capture = 1;
+		links[id].capture_only = 1;
 		links[id].no_pcm = 1;
 		id++;
 	}
@@ -341,7 +341,7 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 		links[id].platforms = platform_component;
 		links[id].num_platforms = ARRAY_SIZE(platform_component);
 		links[id].init = sof_hdmi_init;
-		links[id].dpcm_playback = 1;
+		links[id].playback_only = 1;
 		links[id].no_pcm = 1;
 		id++;
 	}
diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 7f4783592668..974e2baa752c 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -647,8 +647,6 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 	links[id].init = sof_rt5682_codec_init;
 	links[id].exit = sof_rt5682_codec_exit;
 	links[id].ops = &sof_rt5682_ops;
-	links[id].dpcm_playback = 1;
-	links[id].dpcm_capture = 1;
 	links[id].no_pcm = 1;
 	links[id].cpus = &cpus[id];
 	links[id].num_cpus = 1;
@@ -701,7 +699,7 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 		links[id].platforms = platform_component;
 		links[id].num_platforms = ARRAY_SIZE(platform_component);
 		links[id].ignore_suspend = 1;
-		links[id].dpcm_capture = 1;
+		links[id].capture_only = 1;
 		links[id].no_pcm = 1;
 		id++;
 	}
@@ -746,7 +744,7 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 		links[id].platforms = platform_component;
 		links[id].num_platforms = ARRAY_SIZE(platform_component);
 		links[id].init = sof_hdmi_init;
-		links[id].dpcm_playback = 1;
+		links[id].playback_only = 1;
 		links[id].no_pcm = 1;
 		id++;
 	}
@@ -795,10 +793,6 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 		}
 		links[id].platforms = platform_component;
 		links[id].num_platforms = ARRAY_SIZE(platform_component);
-		links[id].dpcm_playback = 1;
-		/* feedback stream or firmware-generated echo reference */
-		links[id].dpcm_capture = 1;
-
 		links[id].no_pcm = 1;
 		links[id].cpus = &cpus[id];
 		links[id].num_cpus = 1;
@@ -837,8 +831,6 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 		links[id].num_codecs = 1;
 		links[id].platforms = platform_component;
 		links[id].num_platforms = ARRAY_SIZE(platform_component);
-		links[id].dpcm_playback = 1;
-		links[id].dpcm_capture = 1;
 		links[id].no_pcm = 1;
 		links[id].num_cpus = 1;
 	}
diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index d16ceef702a7..5705f5bcca9b 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -815,8 +815,8 @@ static void init_dai_link(struct device *dev, struct snd_soc_dai_link *dai_links
 	dai_links->num_cpus = cpus_num;
 	dai_links->codecs = codecs;
 	dai_links->num_codecs = codecs_num;
-	dai_links->dpcm_playback = playback;
-	dai_links->dpcm_capture = capture;
+	dai_links->playback_only = !capture;
+	dai_links->capture_only = !playback;
 	dai_links->init = init;
 	dai_links->ops = ops;
 }
diff --git a/sound/soc/intel/boards/sof_ssp_amp.c b/sound/soc/intel/boards/sof_ssp_amp.c
index b33f720b3e6d..e98ad72341a2 100644
--- a/sound/soc/intel/boards/sof_ssp_amp.c
+++ b/sound/soc/intel/boards/sof_ssp_amp.c
@@ -230,7 +230,7 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 			links[id].num_codecs = 1;
 			links[id].platforms = platform_component;
 			links[id].num_platforms = ARRAY_SIZE(platform_component);
-			links[id].dpcm_capture = 1;
+			links[id].capture_only = 1;
 			links[id].no_pcm = 1;
 			links[id].num_cpus = 1;
 			id++;
@@ -250,9 +250,6 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 	}
 	links[id].platforms = platform_component;
 	links[id].num_platforms = ARRAY_SIZE(platform_component);
-	links[id].dpcm_playback = 1;
-	/* feedback from amplifier or firmware-generated echo reference */
-	links[id].dpcm_capture = 1;
 	links[id].no_pcm = 1;
 	links[id].cpus = &cpus[id];
 	links[id].num_cpus = 1;
@@ -285,7 +282,7 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 		links[id].platforms = platform_component;
 		links[id].num_platforms = ARRAY_SIZE(platform_component);
 		links[id].ignore_suspend = 1;
-		links[id].dpcm_capture = 1;
+		links[id].capture_only = 1;
 		links[id].no_pcm = 1;
 		id++;
 	}
@@ -332,7 +329,7 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 			links[id].platforms = platform_component;
 			links[id].num_platforms = ARRAY_SIZE(platform_component);
 			links[id].init = sof_hdmi_init;
-			links[id].dpcm_playback = 1;
+			links[id].playback_only = 1;
 			links[id].no_pcm = 1;
 			id++;
 		}
@@ -356,8 +353,6 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 		links[id].num_codecs = 1;
 		links[id].platforms = platform_component;
 		links[id].num_platforms = ARRAY_SIZE(platform_component);
-		links[id].dpcm_playback = 1;
-		links[id].dpcm_capture = 1;
 		links[id].no_pcm = 1;
 		links[id].num_cpus = 1;
 		id++;
diff --git a/sound/soc/intel/boards/sof_wm8804.c b/sound/soc/intel/boards/sof_wm8804.c
index 17224d26d9d6..f3c6e344c14a 100644
--- a/sound/soc/intel/boards/sof_wm8804.c
+++ b/sound/soc/intel/boards/sof_wm8804.c
@@ -167,8 +167,6 @@ static struct snd_soc_dai_link dailink[] = {
 		.name = "SSP5-Codec",
 		.id = 0,
 		.no_pcm = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &sof_wm8804_ops,
 		SND_SOC_DAILINK_REG(ssp5_pin, ssp5_codec, platform),
 	},
-- 
2.25.1

