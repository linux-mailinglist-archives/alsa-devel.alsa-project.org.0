Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD58D8029E7
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Dec 2023 02:32:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 157E01E9;
	Mon,  4 Dec 2023 02:32:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 157E01E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701653572;
	bh=VOeNJ9bP2ol8l1lgLIWqNrotkUk3G41NWIVhomjCWxo=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=nhvJJhtE8zhmtLECmoH6PZUISmG4yYw80/hoUGAvmHTkgE2c53Q8NH4GC9YsBDlZF
	 ofb0Bk1QNgp2xUDmBs9OANdIvRQZDq7V+Os6nuN8Te3LK0kRkZJi2bPk3WGjxecfiV
	 Gdkno5zFRTzY71Bfy78wMK3qzIntB0KPs7QmdR7w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A7939F80579; Mon,  4 Dec 2023 02:32:19 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DB5C1F80570;
	Mon,  4 Dec 2023 02:32:18 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7659EF8024E; Mon,  4 Dec 2023 02:31:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-2.7 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20700.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2019::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8D019F800E4
	for <alsa-devel@alsa-project.org>; Mon,  4 Dec 2023 02:31:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D019F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=ABzL4vKT
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JK/MFnMJV7f220RGNL9qVgzkW3LvpNpjIku3R9vdsHp7VnDXqqYsu6E6NdtUpk/brGi4GkVMQlwDooVp/AGEH057KECnAAyI654SEbpB9nbAJR5i5ko5cZCRX6blXIDYMeyRPud2+E4F0ydGpKh0sbOdbDJO/qLdPOz84jqKlZAAvRATtKrIjFZZeC05w9yDhAbDSqElQfAUsod/KAgscX/3oDZ2OMmmtvd9VIniEoqTGxNOrfvnSXdOtbVTDmPy2LaJvX9RzHA7efr0BUWUXUnaKv3264vRNtJiwo2vXx8GmnbsVpMea8oqfMtH9o9NZ1e4q//NBaA0DRQPi1FGZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JU9Hs/93m3UrEjEeg8mcxU9AvcuIGdoC4OgqrVJsh+U=;
 b=RoaU/slo9bxjxuvqKC93AIf/Y+IVJkAXZfyvNatHQNLvOgKlu0VCHfiye1jgUafLL0mSxjLuO76gq3UAHlw1g3dAt3u4TerUxUAcBeGW0mJdkVc2RNTTF7fNxVubXnvt5RYzGcncjwA0VdIVp1dZLkFHfQTXciq25Fyjoyl3cUOzmUb6vXlhDTjQ5zB3N54aW1xNNvye+fGqMoxkZVJHnLhTJRPTq77zirq17MW70OsiFhWjRAwTjXBoxOoVQnhBB0ZlY2PwLmnxkBRuwe1ehV5YDhRALASMDjyEX3KRPvSS2oTzF76qTt5ly0K3lEWE64VtTcBwr5CRF4tSUBUCCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JU9Hs/93m3UrEjEeg8mcxU9AvcuIGdoC4OgqrVJsh+U=;
 b=ABzL4vKTpqWMGk44BAk4s/qwmFJCdK6iDQmToNXhH3Y8WRTzHGwsSnslIJNj00Ox9+/0YnHE/2SYStAtcv2szHpxtG/+2R1KCfTtkHG+TTkjG8CgTJ8Uw4R1fHkJnW8dhdyRH4CsAvZr/4/Rqy5m1XIPygfPcikHFQScQngnxkk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB9747.jpnprd01.prod.outlook.com
 (2603:1096:400:22c::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Mon, 4 Dec
 2023 01:31:11 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::5732:673b:846c:ed92]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::5732:673b:846c:ed92%4]) with mapi id 15.20.7046.033; Mon, 4 Dec 2023
 01:31:11 +0000
Message-ID: <87il5ebvom.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Bard Liao <yung-chuan.liao@linux.intel.com>,
 Brent Lu <brent.lu@intel.com>, Cezary Rojewski <cezary.rojewski@intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Jaroslav Kysela <perex@perex.cz>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Takashi Iwai <tiwai@suse.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org
Subject: [PATCH 0/5] ASoC: don't use original dummy dlc
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 4 Dec 2023 01:31:10 +0000
X-ClientProxiedBy: TY2PR06CA0025.apcprd06.prod.outlook.com
 (2603:1096:404:2e::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB9747:EE_
X-MS-Office365-Filtering-Correlation-Id: 8aa15d72-a750-4a41-efc5-08dbf468b252
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qCtJOtnDGP25G+B4pembVMlL1cgPXlFr0x7u6sHBpq5s2nLuIIIm+FFPDs+0huJ0vUGPR3W1HIzoc2fsV0YtQ9Zu7JZFnCwznYLDDA4KVhcdOrZWp1ZHSf3uLVUxFsXr2Deu9ExCfovRYNduBygsrCUBSSQqm6Ois70QgHmJMijMpFIAuE8+mNeBdIdpET3UHrSuwWw1GjOG3AWyP02acNIKJ9JZPGeqoAIurYj1J5Q/LPpwwTZcGPuN0A2ObfkqMVRqrX0R7fMCpEwS8ga6Cjy+Kg84UrxLJEqmlnZgO6M98osuSysbFBxKTIeTe+XMkdyDBzcHgNmlvW4CmtQvCogoBw70SQeios93zTyKcOMTK0v2HROPEqJyVvAK1Ys/GikEezLBvYy3l7E1W2LvVGjI2ZUdODUnGQRzL7VQNAOwxhbTrN3mPhYWFb8CaKJqm4MelVCcRsxkfhQmwEtVTiW5wwmcWAWhsFbIRUr2iu+f87loMWALwn4UwmtWodlBhlPOSUj5nm93LV2Gr4HnlE1qtnkpeikfNASJqt2w1V08DYOAvEupGTkYUgIvF1tXEz+0ZyRISO3lun3L6aje0FB02RdyTTX+99SQyYrffpCRlr4fPkqqJay85d4Y7AYx
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(346002)(396003)(376002)(136003)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(52116002)(6506007)(6512007)(478600001)(26005)(83380400001)(2616005)(6486002)(66556008)(66946007)(316002)(66476007)(110136005)(54906003)(41300700001)(86362001)(5660300002)(36756003)(8676002)(8936002)(4326008)(38100700002)(921008)(38350700005)(2906002)(7416002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?E7dAatt9a22U/bRfUmBOu/Tc6qgNgsafs82+nVpSmjXUeO1LlfhlUUVN9zji?=
 =?us-ascii?Q?rnbemaSF00CKqKJyGpZV7xlsMtXijrFC3oWZvw2XulvxSwcIQEUJYAXPvXjQ?=
 =?us-ascii?Q?Mdb5v0SouMyjvycU/aNNTRjq5vHi1/1JOwOOAiprkNKXqHFmNbrPqFCTXRk4?=
 =?us-ascii?Q?esr411pvmsRJw0VaHTGqj8XAfofN/6ajITe1shzutVWZkQg2wU0LBADWSK8C?=
 =?us-ascii?Q?/NtHO9o3u6t3xsJ7k2vB/mwBBzqttRLwH6Ugt5gQQk6cMuT6+EZhUP/zsoi4?=
 =?us-ascii?Q?MG3crpIHmLdc1ZpipN3QJ7/1okRJ5lRWPcm+nfmVvagoXgTqwL5V7crUT3yi?=
 =?us-ascii?Q?NbmoXA/ADDSsAEwiAFG9TBRmvVQycDkpwMXeSaXaobceQtHSbtqmVAl1Cbai?=
 =?us-ascii?Q?dWzQAB3Tq/yl9l99fCwWwxR+K8ROAyTedpnuSSA96l5KjVe9SWelrhC+K+Xv?=
 =?us-ascii?Q?bWWgff18nHlh0qpJ7oJ60wfj4YhVkeFbxIUrmOjcv7rdzGbWFyq0bxibvVhm?=
 =?us-ascii?Q?fToYnev7JTksGEySt6uY5XiurmKhzh8nFUl6Aa4H20lRbMhJlj8F+0sJoMco?=
 =?us-ascii?Q?EuvMUmtpuPxh2fS3ziwqSoftjIeF7yb3poQcOfBBh5i1jfY2aLHloYz68Qtp?=
 =?us-ascii?Q?w33MMam8c4UcrugpwjaP4xgTPLhLWBFVQNcp456SnR0hKAoDJ+mlryDrXU2I?=
 =?us-ascii?Q?SabGWRmp1C0fYkc4PTwDnhXkMrXJIeFnIuT0hRw03qEJ9xeAVX1kqupXhLh9?=
 =?us-ascii?Q?EcWEBHa4+Ijou6CSaktzvem+KdTfozrxt47KNrb5cy19s82HOAWVS+vkmPC2?=
 =?us-ascii?Q?G6GyiPfy+Io7ci/jGm5fNCtZilUjvaSZbXvQ09l+tKKyB2BsJEmq4ONSjDnC?=
 =?us-ascii?Q?e+IunCVMGNvlUIlowwA/q0UuvCL69X6e6aZkzywGZgXa7LIcqiHAsG5t8+uC?=
 =?us-ascii?Q?s+cdK/Ux4414Yc9Lr1rzP+9K3YQ+cCksBSaboicwOWhBAy8bUBdHaek+V+Lo?=
 =?us-ascii?Q?Qgf+UeRZ1cpa6mUBEWZYFi7DxmzPH7urJtmGroyShYd2LdKwmRjB6ZbBEujY?=
 =?us-ascii?Q?ftVmSBydK25TcO4Zf8DW3/h/JtuzrTVl6KovYa8MTfI2AuemITmQT6LKZrqu?=
 =?us-ascii?Q?c/Vy8Wbejdj+b3eVvmUx61eN0Iaz5bV5+OHK8DhYbwAOgVaDG/0uwluC8QH4?=
 =?us-ascii?Q?LqRasB32dzLsSVjUTfx/6K6DLLvyJvSAEEVRlF+byxIVtHl3nsV52PusRus6?=
 =?us-ascii?Q?tZDmx8lNwkr5sLOEedPhqfyTIYs65qSgxrBX96GFZpAQf30Wb/MadZvSxgHf?=
 =?us-ascii?Q?o0ZLkYKzS6P5DT8C29cbgtHK5IgcbqDR2yfJp+GGboXFKL6wD0z10vhq7815?=
 =?us-ascii?Q?KyjGKZ0co7MXH0oUcmytwO5uvX9wGC4aQDu4x8H/rWgrq1GBW3tyWsq+3voR?=
 =?us-ascii?Q?AjhY8OyuIM2B7Qn/5IB2879Vg+sdMkUd0Zny4PUZd2rz8iK4aHt8/7U+7OSv?=
 =?us-ascii?Q?gxNZ1zOGTBUvuACXhy58zZE7GnuiXJWxM6v+JiFXuca5yftj0CecJgUgB+vw?=
 =?us-ascii?Q?gOVSMmdtnW5l78uZyahP+7Mk758UzBxSX6jV3fZvisCsOlaY+nMjgiee9xr4?=
 =?us-ascii?Q?+4Qs1jRYmWnPfHKLtfIewMk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8aa15d72-a750-4a41-efc5-08dbf468b252
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 01:31:11.0343
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 3NSQZc+s6pNZF6AXxbeEFj5C75t9sWnaB2lGRpEuwd4gc9WeWyWtDWa7D7Avq1HiPvcnk3EG6nVL/IIexOODHVNApRTETDw+ZBJ8EwAe9dB7fP4kULFj82oKSqvQlj9E
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9747
Message-ID-Hash: BUR67NZGTY2W4USWEZAAMZ2QAKRNZYZ2
X-Message-ID-Hash: BUR67NZGTY2W4USWEZAAMZ2QAKRNZYZ2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BUR67NZGTY2W4USWEZAAMZ2QAKRNZYZ2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Mark, and each driver owner

This patch-set try to not use original dummy dlc.

"Empty" dlc might be used on Platform, but "dummy" dlc is not needed
for it. [PATCH 1/5][PATCH 2/5] removes "dummy" dlc from Platform.

Now ASoC have common dummy dlc (= snd_soc_dummy_dlc).
[PATCH 3/5][PATCH 4/5] will use it instead of original dummy dlc.

Many drivers are using below macro

	SND_SOC_DAILINK_DEFS(link,
		     DAILINK_COMP_ARRAY(COMP_CPU(...)),
(X)		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
		     DAILINK_COMP_ARRAY(COMP_EMPTY()));

But (X) part will create original dummy dlc.
[PATCH 5/5] will try not to create original dummy dlc, and replace
it to common dummy dlc.

Kuninori Morimoto (5):
  ASoC: fsl: fsl-asoc-card: don't need DUMMY Platform
  ASoC: samsung: odroid: don't need DUMMY Platform
  ASoC: intel: hdaudio.c: use snd_soc_dummy_dlc
  ASoC: sof: use snd_soc_dummy_dlc
  ASoC: soc.h: don't create dummy Component via COMP_DUMMY()

 include/sound/soc.h                  |  2 +-
 sound/soc/fsl/fsl-asoc-card.c        |  3 +--
 sound/soc/intel/avs/boards/hdaudio.c |  6 ++----
 sound/soc/samsung/odroid.c           |  3 +--
 sound/soc/soc-core.c                 | 30 ++++++++++++++++++++++++++++
 sound/soc/sof/sof-client-probes.c    |  4 +---
 6 files changed, 36 insertions(+), 12 deletions(-)

-- 
2.25.1

