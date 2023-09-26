Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F8E7AE5E6
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Sep 2023 08:30:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6AF1CEAA;
	Tue, 26 Sep 2023 08:29:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6AF1CEAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695709835;
	bh=KnufS477o+O7s+Ah/XqA9BRf/wgSn+zD46k+jsi7tgc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=n4a1cH8PHcfTKXwElAa6yZv1Cf4wJ2Lr8dquHi3v0en0ENDOyWkTlAcLahqz38za1
	 epmw3uvsILS14P6CoAjNbHPLBvio2DQRtWpjgEYgH/ap5KbTByLDEGx6NqJQJCScfB
	 maItExVautBrjzrp+XwxwX3K/IWBQZU/ZQNAhKik=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8F831F806B5; Tue, 26 Sep 2023 08:24:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 39DA4F805E8;
	Tue, 26 Sep 2023 08:24:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 83BE4F8068F; Tue, 26 Sep 2023 08:24:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2072a.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::72a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 78766F806A1
	for <alsa-devel@alsa-project.org>; Tue, 26 Sep 2023 08:24:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78766F806A1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=mRyDAI1N
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=naR4xJ02PRdqwbooXSHkj+GwOEUegiihVal5f9iq0UJK71hI4tFSjWuHvOXqHRRz1XaviQZFi/m2BF7OzbBVHkGnpoLgccISLzW6zfaHhGrUrCXQdLnTFPiA5S4BS1Tns99+jlF6qHSBjaqIaYe4nN3Kb7Nd9yqA54kEG4VzBqTs3CwecalLrSca1hXBYVnH0cElWjJ72C2PrCV8hDV0qh23IdN2QN6XpOY/4KZVIzbueTnduC4mtblBSp6sCM2OMbjUfpf/5dB28C9IyToSxq3by+OqqCzsoEFsWkz62jXFzsYxZrVhvLIcCYaDl+AOjtssQVquB3K8MNWqOUheNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L43mtjnZpwETBzC2s0ZyHvGWSPWOBQH5ovHzieLEtFg=;
 b=XKIiBwtjMZzkD7Xb9AuEqU1+mZHubism4ZuNZ0Bx9DOx3ZA+V0jg4sioBpAjs0fZPtP4S/nydN8sdW5/jbqNP3LkABnF0eJZZP2K39kiOxolzXgvQkNC6ltQzP5nSrksw6U9yRzOJWAGBVRXCcyvP+Vcr/oKzb6QyuNht5kK9SZofJLhOd2L5/taBVklG2EaZzLe3Gvr2KKRFTjd/pTvsls9fGl5khC8rq14cAuq470GGwe3oSzek2NX5Hpl/EuWulSXa0cm6G333AebHLhKiN33n/XGXO9USABCZNcU1ESkmDGClQZbQeCA42+5YZS8qLIZGUxZ/3EbCNBbPe1W9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L43mtjnZpwETBzC2s0ZyHvGWSPWOBQH5ovHzieLEtFg=;
 b=mRyDAI1Nat1Yuxhp240cy8oapggeN6F9MVE1pQHNQ7xYpWcyrY8VLlQc/LPGDGkbvCaTY74c1HAav7Ko/bXjoCUwmChwd2vKR+RbxmWC2pvWFzAHsqXYZNCfKpprBYjT1O1QqO6qDvkPsH1fP8JrYYbwfL4yKFY8lJ3Hf8NdExU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB6175.jpnprd01.prod.outlook.com (2603:1096:400:4b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 06:24:14 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 06:24:14 +0000
Message-ID: <871qelh2pf.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Bard Liao <yung-chuan.liao@linux.intel.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Vinod Koul <vkoul@kernel.org>
Cc: Sanyog Kale <sanyog.r.kale@intel.com>, alsa-devel@alsa-project.org
Subject: [PATCH v2 34/54] ASoC: soundwire: convert not to use asoc_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87edilihhg.wl-kuninori.morimoto.gx@renesas.com>
References: <87edilihhg.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 Sep 2023 06:24:13 +0000
X-ClientProxiedBy: TY2PR06CA0017.apcprd06.prod.outlook.com
 (2603:1096:404:42::29) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB6175:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b5f207f-2605-4e72-7454-08dbbe59346a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	mAAw6uFtOt+wKNWIn9KUexzFF1XBFHciMyJdK9nDKGNWzTg2j4OPVa6sMPwQ73euYx9sSqiNoOKLL+nMqpbUeOc0iRmm3i9VQ8RBFXU9Mo4ZW2QUYGPjx6PmNGlNMh5QO7P3ZdMlUoax8kZHjaWlRnJclwGHyCvUw0tMZWvw0eyUl0X0++JdJFkENdMlXHduW/FLJmm3993Qrmvqaof7XBoBfa2rRTyjFE3sFEk7SM96iif7YwdlDUf8DYiIqQc80Gihq/Dv99Y2U3CyPdHtGIGpjDyLwspx4bSUkJmubC2ICP71MEM1U6Tli66e8YeMilWOGsHDlEWgDKPVFEJ5I5UDgux1Zhztt3M2IZuULneH/p/f/M1FI4pJSa8PSRGD9UCy04QnaYTzukC6ZDPNg3EKaCgZ55JSndULsmgNVt48DieeM1151a+18bo1kxkv/oJ6+p/c44CF8H9z94x9w2NSBCMf9ymvXnLSvCmqN8fcTCNu+2YfSe7d+iqdlGQU29dVlPkZny6lP8aOfmQDtlXFwVDMwO1CCJIEn28oN/QEhEdWTBxdGjEFfWu28VkV2CGDnZlH9jCs4QxmUj1Q6o82FXA/lZd187viL4D5hNSx1wNGQCkW9CvAD+/ziOjovlp/YmbTIeuIyfwn2vKXZQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(366004)(346002)(136003)(39860400002)(230922051799003)(1800799009)(186009)(451199024)(6506007)(6512007)(52116002)(26005)(478600001)(66476007)(66556008)(66946007)(86362001)(2616005)(110136005)(6486002)(38100700002)(38350700002)(83380400001)(2906002)(8936002)(8676002)(36756003)(4326008)(5660300002)(316002)(41300700001)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Tg4f/9f7QhekiI83iLDdcXTn8qBtqG6stl4VSYjafRBnsNk9icPLizbc6qJ5?=
 =?us-ascii?Q?fIO7ncJ7AYoE72ctnrDsldWAr1g5qfEmzPbVmR9tIOcFbWlT/z4jNKyzVjqX?=
 =?us-ascii?Q?uuCBTfwc+fas5HRhtcJOs8rR9Uk2cd9mtPyroYcopKrTlLH5yQrRTs756v4b?=
 =?us-ascii?Q?f4PYRGlQDdlESjfTnGLYIaJLr5WH5rO/afr1EFcmzFrt57nRBSCNlvUfSr4j?=
 =?us-ascii?Q?TRVZ4GCmXRrcCkoKlceWuKsUDzdH9KlIYfJK1mZt4QMwJc415sPJW3WT94R0?=
 =?us-ascii?Q?xG3vNCh4OsmxnYx1CdGgagojlp3m16/qJYB8dBKxB3isxyMOhaaLOlzVFeHH?=
 =?us-ascii?Q?+E5tNLmoY5SQaDRPThEthUWWVJrWzjeZ9WtjAPmaDYuK8tqczOC68+ooNOy4?=
 =?us-ascii?Q?aiqUK2GLZF6kMaTeYahsYmneNGX/1+gKfiawrtrhDTzns80XvVCzfA6QWamX?=
 =?us-ascii?Q?fcOCg5gtCt6uzwzH+4esakN/mr5fMLRxNtoii6+qR02+Mlu3kwjSux4XbZNQ?=
 =?us-ascii?Q?ttkO/qhcxxYnkjBWTxZweCQ55Wb8PGaSwf4cUJ92y36UREWXfmRyAjiJiFQe?=
 =?us-ascii?Q?yaVcGnJwFuqKAfREeL4HlUSWeN6kb7e218sVo72VwAGxtGVMQFz/9PiLHQTW?=
 =?us-ascii?Q?DdRuxeiX02vgdWs87xDKODi17EYustEdggmc5aDMcJ+VUWROGRlR6u01yyKZ?=
 =?us-ascii?Q?544cIWNnsjHUgTOInfi3gzbSB/tfaQ8dj90tQn/6YJXX+logLEEKxJ9raXoS?=
 =?us-ascii?Q?Q916LdMdeBw0sWbTquZ+aE4ixX2YhmVQC/HSC8htrJGwl42+jUoJDnUWwDab?=
 =?us-ascii?Q?nmylpo+YTHIHC1b34fwTVIzfhOKAaqY80MHqZk4IlkLmqitObBrD7KCdBCDb?=
 =?us-ascii?Q?2rFVBRdFZl0MrdArEghIjXEZg/3VK3/VWdzbBhFdgfP6GWpykDWdaH9mukwV?=
 =?us-ascii?Q?64ZPsEQtgrvOHz3jHmAUavmxakoDZgTokzAIK7OFywDMa5ytz4zd7Oggs9b1?=
 =?us-ascii?Q?4ruz1vYu/K1oEpQW3ekSMXEkCYgxjHuODO425PAX7kr//zTwjATsRLfOScCn?=
 =?us-ascii?Q?uawb+lwx1RZgfjiaAkm6Env6cu52VnRFptzZB/ehA6gEBTLxAoxcCkNuN/l8?=
 =?us-ascii?Q?EEkJB4pTIydzopa+cvIi6oP0RrnPMk53VAL6wYZdxSJTzuDlFKei7cco0Yhe?=
 =?us-ascii?Q?JrbOep4izHDRf5TlsaAiJbVGhvyPO96LKu1Ga0w4ghlxkmt+z9AYRi2e/LYh?=
 =?us-ascii?Q?t/p0KyZYBXOMGANkg3SokzXR2SJVOEtB+Ob+aOS0mRA6cIaZPGmYvf21OYYH?=
 =?us-ascii?Q?JTaH2Wiep+3kN6mBmSJTiPe2OB6yQMfehggHeXPZCzLtYtnZHHgyZMgWj/J2?=
 =?us-ascii?Q?3Kl299iFCbD0CMf76hmjYALDm7O6r6M6sAjILonZbXEuKbyP1jfmUjmgbbY3?=
 =?us-ascii?Q?eNbR1HUkaELvOy6xa+Xca8+x6yhDvwgZFhlDg6omwkgu4aOOfp7/hcTFsQqC?=
 =?us-ascii?Q?TYVSbNWBdTcfjQEefDJ7s0r1XBdbzeUAidGpf0dbe0bMld4qmOmgtelm+sCR?=
 =?us-ascii?Q?TKT+YktVTqx4E2TffZBPDpRhTAAaQLwGRUm/nmZi8mnTuMQg7+sEeFGFc5no?=
 =?us-ascii?Q?6AWXpGM2Y741zZ3tuScY1uM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1b5f207f-2605-4e72-7454-08dbbe59346a
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 06:24:14.4657
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 gDfXArKwWkF1oroCpeU2WwjGPJXw+y0HtDlbpkPOOmW6TqyTp++u1R+cSZQMW9o2s3M3qriWJMWwLJT+crUIg0yf2AFyCy1ZJcc1uLHpcZDX+7BQ+cTzIkDdCJFmpxlk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6175
Message-ID-Hash: EGWPMYHV4QCU74KFGVOZNYBR2NHNDSKZ
X-Message-ID-Hash: EGWPMYHV4QCU74KFGVOZNYBR2NHNDSKZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EGWPMYHV4QCU74KFGVOZNYBR2NHNDSKZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ASoC is now unified asoc_xxx() into snd_soc_xxx().
This patch convert asoc_xxx() to snd_soc_xxx().

Acked-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/soundwire/intel.c       | 2 +-
 drivers/soundwire/intel_ace2x.c | 2 +-
 drivers/soundwire/stream.c      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 26d8485427dd..1287a325c435 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -759,7 +759,7 @@ static int intel_prepare(struct snd_pcm_substream *substream,
 	}
 
 	if (dai_runtime->suspended) {
-		struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+		struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 		struct snd_pcm_hw_params *hw_params;
 
 		hw_params = &rtd->dpcm[substream->stream].hw_params;
diff --git a/drivers/soundwire/intel_ace2x.c b/drivers/soundwire/intel_ace2x.c
index a9d25ae0b73f..82672fcbc2aa 100644
--- a/drivers/soundwire/intel_ace2x.c
+++ b/drivers/soundwire/intel_ace2x.c
@@ -327,7 +327,7 @@ static int intel_prepare(struct snd_pcm_substream *substream,
 	}
 
 	if (dai_runtime->suspended) {
-		struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+		struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 		struct snd_pcm_hw_params *hw_params;
 
 		hw_params = &rtd->dpcm[substream->stream].hw_params;
diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index d77a8a0d42c8..69719b335bcb 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -1819,7 +1819,7 @@ void sdw_shutdown_stream(void *sdw_substream)
 	struct snd_soc_dai *dai;
 
 	/* Find stream from first CPU DAI */
-	dai = asoc_rtd_to_cpu(rtd, 0);
+	dai = snd_soc_rtd_to_cpu(rtd, 0);
 
 	sdw_stream = snd_soc_dai_get_stream(dai, substream->stream);
 
-- 
2.25.1

