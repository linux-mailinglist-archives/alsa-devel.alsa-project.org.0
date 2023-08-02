Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC8E76C4CC
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 07:23:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16A051D6;
	Wed,  2 Aug 2023 07:22:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16A051D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690953779;
	bh=+tjsNFjesriWjA8VxbQgaE/36CDFPOydAoI+uJLEoRU=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=NMRlma9jqVnHjKkZJxtVVo2Wf13vZaN3S/eHrVDVCuccrofjTET3GjDhVh8epiihc
	 /+LfuCauJeO9j0QzfCAgrwwHAjBvP+xb1Q0eXJDCuKtEU91G1uWR9UAGSJhclSXViV
	 TuMRP1Mk4UGLFURDEEdkIzCs0fBk4QEE5XGpS4BA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4C1E4F802BE; Wed,  2 Aug 2023 07:22:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 69B99F801D5;
	Wed,  2 Aug 2023 07:22:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ABC01F802BE; Wed,  2 Aug 2023 07:22:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,SPF_HELO_PASS,
	T_SCC_BODY_TEXT_LINE,T_SPF_PERMERROR,URIBL_BLOCKED shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on061d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0c::61d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 09344F80163
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 07:21:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09344F80163
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=OWsKCHvm
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sx6qx2bnbVvyYDhyZ7GdDZZLXrpma57fXPb0AxJCAieICHfwf0TIQ8V2nn6l5XDqvo6oMimIthBphzzGc6uY4RFaJR9TlZJgODiUZbu9QVZdRv0r6pv7Zq8nZP1hXbdG15WM6M+SjbAoMXXB9+mlxfgMMNO4yRtVVuWZqDle3RewFoKrzSKhwHUL1DJTKxfwULi7aDjD9NW/fa2cGH3hgB/UvsjmJtfeL7ZzZBG67RzcsaT7F9yuscvh+IfDs6282TXPYkIZ+jhORdArNlO0UWD/t9RXGo+4PIcRqR5+R2JE3WIGnmZ/XMtdwwWe0b3xilnIdRN2kODmC4H68S14Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CXbX6FoCnen4ROyHFV4aeWDFOqlkYlgy831bbi6vPmU=;
 b=JK5WC6T5rq3IvaSEiRNDcTbor0ewUwANAE3qghTikAdznYgJptrfuTLHnqsCJZCkx4ZeQZV4EH7UJtdJe5P2AxomQ3z9zuG0qZFtD0ZG3o6u3a1tglxtYMZtD3hzd+ZKFDMKyczZVmu0R9V+YuNjt3i/c46PRD6ygYRTzRVsgt0oEsTGeAD/lL8N9vfo0S0cc80KjWqA5t24rklqC+UIQOH6rE5vHIucZvbNEFy/M78vRWrqWplbujCSCNqmiL6t1aKS5akBXYZ/QUYVccragCPA3x3V+QUOYBqg9xYg4TKqKNYWsmW7nEnfiG5G9npiMknR7exRWZM0/rLuZ6bkwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CXbX6FoCnen4ROyHFV4aeWDFOqlkYlgy831bbi6vPmU=;
 b=OWsKCHvmQD5N8VsW/RM4wD6Hec80QdjneBWHLywa19NQ7Xiyz4+L0Xoq0FRVU0P6o8iSyby4sTqyvBdV4IuUpeJuR4CxIDT9UP237HoACqNUEtw/InP372Pqh1HWbU8LxUCk8Bojshv6txiXnMFRqwsW42ymDtqgAUbCmPQno7g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
 by DUZPR04MB9946.eurprd04.prod.outlook.com (2603:10a6:10:4db::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44; Wed, 2 Aug
 2023 05:21:49 +0000
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::cda8:5cad:29b6:3c96]) by DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::cda8:5cad:29b6:3c96%7]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 05:21:49 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: Chancel Liu <chancel.liu@nxp.com>
Subject: [PATCH v2 0/3] Update the register list of MICFIL
Date: Wed,  2 Aug 2023 13:21:14 +0800
Message-Id: <20230802052117.1293029-1-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0025.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::13) To DB9PR04MB9498.eurprd04.prod.outlook.com
 (2603:10a6:10:360::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9498:EE_|DUZPR04MB9946:EE_
X-MS-Office365-Filtering-Correlation-Id: b2d3f8dc-2a3b-42dc-5649-08db93185f3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WDtbXpTN5XRQDE3xIUJn2ihAlXcuT0alOSGK8PpeyEcFlPrIIkOUTGTdrFhARmdbcOmZy0Z35f9KA+I6gHd+vASEJlQ0R6g0dTZ5wEqsPY8IDCQiXzInlzswLGKEk+QSi9JbDD5ns0jz6OH3ahXEGSv2ly5c1V5ZcqrwRnGHLGbbR5udOaAIblC3hmwjcsLBD+sBo6s7H6AjQ//QGOkZt7guNZuDI+dXPVu2PsuCm1qOk0XWWDCm3d9BStimS+d50jn2WeX0eWenSievuWsnt+OquXnof7hyCt7+IU4kiMUC8DD6REn0RxN9BmKyg47iN6EqAHa4O4TUxIB/iuSLeGGyV0ja6UqwgH5+rwoUQI29aFeZOy8NTI0mlscJL7eKIkL+h6xTEuzX73rOEjn1Ts6llFQXEIm6MgwfZJ84rlObe2V0IIIeEblThAHvkXQo3MKNoFkbURYXcQUBQIqb5QKOpN49eFkBQHccm7nLSDGhH1O7cZI61LNBxwWIdaruFQ65WF1wo7elwmHI2ev7Mti3pzu8AorKiH5Y062rMSc0HMzTC8ECYYcQemVKd/OkdMi7Wd5+gjYogGMlJGl6QZFDbNOMg97BAdyDOpSVKz/fkul1BLH+nr5fjco1Jt/GWUOLN4PKF+Rga2nGY6ceQg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9498.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(366004)(39860400002)(346002)(376002)(451199021)(6512007)(7416002)(6666004)(5660300002)(186003)(66946007)(4326008)(66476007)(66556008)(478600001)(52116002)(6486002)(44832011)(316002)(41300700001)(8936002)(8676002)(26005)(38350700002)(38100700002)(86362001)(921005)(6506007)(36756003)(2906002)(83380400001)(1076003)(4744005)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?T4ArstiCYbb6AP3p/EqEdBsGtK4OLvPwLiGcq822X5qMv3YqnXqF+uBr9xrd?=
 =?us-ascii?Q?ZDgbw+zFb4Dmg69gbZgv+kO0+CYpJg1sXF7hEw26X8i8fnfq80a3xLRjjg4D?=
 =?us-ascii?Q?+PGfeNdb+KGSeeqkex5QaWH9ddXZ1qzKES595K6lH8dHSnXA6bmUbGdF812B?=
 =?us-ascii?Q?mGg399kyHEnTSy7uXWOSAkSn72Q5ypnBKVwirBW75MI6rTFQTygbjemElIbG?=
 =?us-ascii?Q?+zFeopbufI0bXduNJ9RRGA2/TtzF5TG+grrhcmrUiGnko5nBSYSfDBDXye0k?=
 =?us-ascii?Q?RrXbPBW9cMZNl2VTsxC5FWZtbi81UW4Tvrgnc89We+FN2jP1W/7w1ihCxb8+?=
 =?us-ascii?Q?CpP9tEZml7pFpnCjVJPC4HJpcN8zdjmlnAdPI9wLQ0SOW3aPsfRgg/uJER6e?=
 =?us-ascii?Q?uXl4UUN4yIL80e2OfcX0q5MDI7tDUDH8Yx4MiqyiSAtYLvP6qARD4pyDJEvk?=
 =?us-ascii?Q?N6/rf4g+0ebmt9IGT2pvGROvZgQfSeWcQtDA/fTitahsnh0QTgheBat/FNlW?=
 =?us-ascii?Q?t+DoTgbK3KPT6t+qMGxOLDkHiaF8WEcDPxsExeZYR+KDa+HoBPfR49xgDtLU?=
 =?us-ascii?Q?ln2JKAOIpj2lXcndftbpKqdVhq1uhuLjTXSk1qn7IvRYVOA839bDGb+Ub5oD?=
 =?us-ascii?Q?QPfc5V6Qo3JkbwGemDAKdufRHzyt0OMVVMFXpNLXE5G7UkTMbt/cHb5oVSYC?=
 =?us-ascii?Q?lvH2RH37asCrY+a6DFDbuxFUeOGp3s4dcaxEOeVZVvGxvfsJnDTANcwFKLPX?=
 =?us-ascii?Q?MfZtLtrDSIaqct3mtB6d2ZocQQawcU80CLZkjLNSHD2GEIrRit83bPlZqZ8v?=
 =?us-ascii?Q?iimNXiCO910FqknfXqn7LG8Zh/IhsA3A+d5zEj4OYCkbO7FPSPWPacPG/HGj?=
 =?us-ascii?Q?fNhUJ3HsZm0R9rawQcJ3DWAvrNoVqS5l69f2hOfLp498AZAGomJTs3rmOeEy?=
 =?us-ascii?Q?kGjXDvr7vSCTdmEhgadUU0ZcyibLeHJU3KvFF4BzWEiaMosWrc+2VwWESGD7?=
 =?us-ascii?Q?EZMADfu0/et17cfyrJiXELBhpzOwkNRE0m5Zs9psTnh0PesRETdByqbuijtx?=
 =?us-ascii?Q?pF/A/IVROppSdflndtzi+YxqwdLOMdb95a6hwH0Q8UPm1v+HndBHoQIiM3o9?=
 =?us-ascii?Q?KzEGU4SxbAIyK5Sy1toAQtZT1kCLN/0NR9Jbs//ncrhBGn5p0mbG1UbQCv83?=
 =?us-ascii?Q?irJZynDYoiWlgY1U0Br6U9vTSs2S4Gaq75IFliLevMagH6F6k6gFyLjJXr4O?=
 =?us-ascii?Q?JNPkOtPfZIqZyeN1Usd+qVRWffOl1Zpgo+lispXycdLwpu0jvQYoNZTTZK/+?=
 =?us-ascii?Q?8IocF4wTDWNicLkX9shfbEGnXFo0YeL6IlEHg11jJ+IqFo2MdZy1iWi6S+Zg?=
 =?us-ascii?Q?siqP/EBtLXNevASZk7+mYFp8JLAckUxjssDICrykQZqQ1VpDy+ZUMdadrTOT?=
 =?us-ascii?Q?icjcb0PYtPNgcwUrnUVpsMyAXggDJxYQb3p8W/s/xx9UBA6SAYBeT4R6y8qM?=
 =?us-ascii?Q?gfJnXbjL7c7RIeRGH/RxdoFH6L9gtFwGQwDgEUYnaZYBh6fLnRgzrUnYmG+G?=
 =?us-ascii?Q?G3U5+gGiY1KFAI9UxUPg7j+SW2pshxTLneKzLm51?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b2d3f8dc-2a3b-42dc-5649-08db93185f3c
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9498.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2023 05:21:49.2857
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 WJ7rjhxRU5KxFnYVQvYrhpaOTBcFYXcX4DoD/1kQe5rPo8Tc6HDbHXZw9YQd3QPnCBYVNpm/4JmEfUt2urQr6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9946
Message-ID-Hash: RPEP7MXSIAPPSKR4EI66VJ7D4UMCRTIO
X-Message-ID-Hash: RPEP7MXSIAPPSKR4EI66VJ7D4UMCRTIO
X-MailFrom: chancel.liu@nxp.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RPEP7MXSIAPPSKR4EI66VJ7D4UMCRTIO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

MICFIL IP is upgraded on i.MX93 platform. Add new registers and new bit
definition.

changes in v2:
- rename check_version to use_verid to make it more explicit
- rename fsl_micfil_check_version to fsl_micfil_use_verid


Chancel Liu (3):
  ASoC: fsl_micfil: Add new registers and new bit definition
  ASoC: fsl_micfil: Add fsl_micfil_use_verid function
  ASoC: fsl_micfil: Use SET_SYSTEM_SLEEP_PM_OPS to simplify PM

 sound/soc/fsl/fsl_micfil.c | 100 ++++++++++++++++++++++++++++++-------
 sound/soc/fsl/fsl_micfil.h |  64 ++++++++++++++++++++++++
 2 files changed, 146 insertions(+), 18 deletions(-)

--
2.25.1

