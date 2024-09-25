Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD4E98BC39
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2024 14:38:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD7CBFAA;
	Tue,  1 Oct 2024 14:38:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD7CBFAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727786296;
	bh=nHDjui1jZrb23SQgry7Uio3D35Gka2uZYVXuGRFpVxs=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=NO00zvLifsoYcaEIsGiWE2L9Cbh/GkxHnQJ5/OreJNR+4t6KYIK62GYr8xNqoBWSx
	 b70OPAotg0SsThhoNJ7hq5F1NimL+XE4xiUr0FIaukZDtay3IzyT6ss+uhG7tWW8u9
	 FFK/fuq/rVDMBW/L0HadQzNCet2bxeOkxc283zEc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2FF3AF80733; Tue,  1 Oct 2024 14:35:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7399FF805D6;
	Tue,  1 Oct 2024 14:35:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E23CAF802DB; Wed, 25 Sep 2024 10:11:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2062d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feae::62d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6F962F8010B
	for <alsa-devel@alsa-project.org>; Wed, 25 Sep 2024 10:11:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F962F8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=vivo.com header.i=@vivo.com header.a=rsa-sha256
 header.s=selector2 header.b=HAgrDbej
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LJ2MTyVo+S3ZaDehMMTTfRyNI45IapT3srdy5x9Nsbua2zI8g+QxLOUuQgJC3kOAmdzTloLJwulddJtJwH14BFtaGblzT3fj1V9AgO5qj9kQOQgsQeBp7aBUcaS1HIXm/ZMga8Mr9F3UIfEHp3bAqdGB7qeVN6/uYgZ28MUVL+Eqog2U+HGf4yxMUGNAfNHliZFyNP+K9ubCi6xc5OQwqsNcLxL2gQroU8eXPlzwTJsPoHdqlITmD/95BwqWBOzdoZcTREndnO4zDnnajQKgUTyyPG/m06/MkzZd+iVJ6QqGGsU0ZFTuzGdrORGu3OmbKXBpS5EUvZf1DHuUL82YwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0gDGF1yGIVoRQybEyWPOCtnsvQE37RNp6M+4z3vS/FE=;
 b=eH7WHRUl3nJH1r7qb3H/mdFu+4hnQmV2ShImLlge1OCuGBrSSsbbU1fBjVuBvQ8TlJHU+SV7dcLhd5Ayu6INSFQeRnbEo8smD9QU4CUSOnAHnXlYRjmn1gI9/rFU/+c/o9ttOdX6K/Fa36fXCS5g8IMWOzQ3yGxuUMJvbnn+aTarFBtK3Fa20JEz3sG9bCRRPTRrRMd8havqqwl3mnAE8nUQDLAdmJL5E+9yCd2wsNYrf+VIjTJdl/VZWhH2ZKJ3LvZEMu9tI0iAS9WE7ZnJ4SNS0+W6XFJCtMBkCxCdvIbDRV9cluoQKU//vCQ/TACL4v6Q9A4M/3WZTpHZgo0hgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0gDGF1yGIVoRQybEyWPOCtnsvQE37RNp6M+4z3vS/FE=;
 b=HAgrDbejF05qGqd/LbrHWm/QGtPqDUPCUyIBkeEvFY2poV8Dq5oFQkvdanR4Edu5uiqcw2ddgJ/HXdPIcd95UX4NIpKh9BcpcnAO7C/+t5vSKaV2vPzoSGikIzV3zHmIBWC8U7k1Magm5FbcI4tiYVhifrptbqKExlpmZTcsy9f1+1i8kAkkCWDzjvRZGWVMKE8h60cDgp1ImsmT1XuJwLncGK+iQbIXAfCbVpShhiOAhjSH7MmuME0B6U694+vzVMZ2sevrylHMe6sK1TomR0ZmsWSGxuuxGDQznqsZ0er2A0RjkB+4obXndUTMG2SC4UrIg+VjoHfC0kLUMQfuzA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5899.apcprd06.prod.outlook.com (2603:1096:101:e3::16)
 by PUZPR06MB5540.apcprd06.prod.outlook.com (2603:1096:301:ea::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.27; Wed, 25 Sep
 2024 08:11:45 +0000
Received: from SEZPR06MB5899.apcprd06.prod.outlook.com
 ([fe80::8bfc:f1ee:8923:77ce]) by SEZPR06MB5899.apcprd06.prod.outlook.com
 ([fe80::8bfc:f1ee:8923:77ce%3]) with mapi id 15.20.7982.022; Wed, 25 Sep 2024
 08:11:45 +0000
From: Shen Lichuan <shenlichuan@vivo.com>
To: vkoul@kernel.org,
	yung-chuan.liao@linux.intel.com
Cc: pierre-louis.bossart@linux.dev,
	sanyog.r.kale@intel.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Shen Lichuan <shenlichuan@vivo.com>
Subject: [PATCH v1] soundwire: Correct some typos in comments
Date: Wed, 25 Sep 2024 16:11:34 +0800
Message-Id: <20240925081134.10248-1-shenlichuan@vivo.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0046.apcprd02.prod.outlook.com
 (2603:1096:4:196::15) To SEZPR06MB5899.apcprd06.prod.outlook.com
 (2603:1096:101:e3::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5899:EE_|PUZPR06MB5540:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d6b6e11-a08a-4e46-eec4-08dcdd39b1f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?tvwf/rvI1P9X6dAwZ9AU6Mr/AbKhoZQKV1DeyUnwmcthhs9+S+44wf1e9HY3?=
 =?us-ascii?Q?UsqsOeDiMFPBtxDDRPK/9nWcEe/GxrYQEZ9PiRfKzPoYFwQ/zYKWDnYNz01z?=
 =?us-ascii?Q?QyCRqYn1UsWuQ3XmlCkFGBL5Aev1TfEcKesRkXIG+dxk07cGimfEKyRtMvuX?=
 =?us-ascii?Q?uv30xc3mocoC/Rtm8AYaZpip949s8ly5UcYgQjuKem+Cd0FX4jaCrjjOIS1p?=
 =?us-ascii?Q?Z9864ecnuNusneiPgOkmJ+8Skba5xL8KgCQFpQB4jgCl4m2zbg4r3SECcZgj?=
 =?us-ascii?Q?YFEhbNfVunJzy7JCKJGklobaOEvJ37lbsrax4CjUzqlorCgcH0S8MbQI0iCZ?=
 =?us-ascii?Q?Cm6hZGs6KBFyBsISJAQnWiFaDVRvI8e5yTZ13xby+W+8gwAg5JAfbiJEDL7W?=
 =?us-ascii?Q?wgy1652vePjsl0OhZhyT6bG+q0AL5Vtk83CALupCHziyld68UroUppuAMDSz?=
 =?us-ascii?Q?wnR8vTbXRnuZN1xeARUc7q6YK00Gcfi9IegySa6YZOkx691el5ZpJsR2jHDt?=
 =?us-ascii?Q?TjxhKY3dJb4DDEDFp5fN03fQETwEhh+qFnRsvoEwPNOweaHPECR/I/seVGfJ?=
 =?us-ascii?Q?NOG1Kcbo2a7IVhSL9V5qbf2Pa3gl+Rmo13cLKlXEMW4srZPZcY7LJCm3deaZ?=
 =?us-ascii?Q?Ps8SP5A9Aj8vwnTk1v3pWce2PT+iz0tBIITKEZqUj/zmy4G9zcL5RqgwGnJV?=
 =?us-ascii?Q?bsYoNJk8TMA18SkE9kyBGyxy4HMZmKko7k6HN6mWlR9yGWwSJLi7FcxDpoLO?=
 =?us-ascii?Q?Og9/Jdr9xc1c8+AiMxS7GtFiSM1W0717pfJwGdRz9kdQV0rMx/gDR/9pe2OV?=
 =?us-ascii?Q?AdYLzMcO/ABhfI/NgWIphQyJ58KYgJ18KpPlTfBHFKWTo4g19g1oGOlNVvq9?=
 =?us-ascii?Q?yu2uM2E2RZV7Qh9nvlRQPC5Xbrr9g0VciYHVXNPHDfrfPnlsdaroahdlPQ3l?=
 =?us-ascii?Q?wsNt13OKL4fiXW1f0OyxXfJ0UAVQkutVkbvas08gt5Y//lU5NCQLJnXaQzjc?=
 =?us-ascii?Q?8RdEMz3qBvvo7y+1ukyDBAor0mHPnabSOQy8WA8+UI5SiT/QlCNBC+nF2Jo6?=
 =?us-ascii?Q?2QR7Na6q3jgO+2G+yfJbRn3B609e0gZFNGF0yolUkvE/c85q/9P70OaOaDQK?=
 =?us-ascii?Q?GKdYg1SzfRsH88siQt172UvLYq49pio99/KlFLQKmdOWLAH1kAhsa7s/z83J?=
 =?us-ascii?Q?xzSjBKnW0yLq1hPNGwnNqiO2Ef7PyMKhGzKUtMxxmf5q4nRA8K1QuHaYJvui?=
 =?us-ascii?Q?UsGGrBERaiSn+M8qC9rDdPcpgVlIplVM9HaBw+AcDdxQp+bt0jyxqmFVKeEO?=
 =?us-ascii?Q?y2kT4hw2zhbL5kj4F0usO4GXI++thsz+pGz/uNKAsL/xnw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5899.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VFtCtKElLJpV6+cnEOKY9Nf2upsRqcH1siyX7uny954BB2VFauItI3JoFmrp?=
 =?us-ascii?Q?UdZrppQbBZw9TGm/uxw5lzO+X4Bri6aWevzgSzIqoEpvFMdXEOSPg8kEEgy9?=
 =?us-ascii?Q?0uEwvTQ8gfgRpjYS4+Aea9u5jlSqQWNLtOmqmrJGvGaxmBidp9nqjQJxT6NG?=
 =?us-ascii?Q?LEqL0D7aEZbzmm8afy9m/R0g/D9hUusxLc41XaY5G88lI+TIabJwT67ZkPyh?=
 =?us-ascii?Q?yRruFFhj01VVCjplQIDl4ziTnwhZvqmyBGtrrJU8waSi6lAZ6FVOs3u/wetw?=
 =?us-ascii?Q?d/K9byhjT+PHqcVghI0CXIojFzeLNNRTp+xsjW3S6/jzzlKhTlGSVAUmCE3x?=
 =?us-ascii?Q?A7NDYNcDCfzbwwG6gTvAiqnP222+CHZcBTBFnBa8Lgjdn/WN8WnD1/YovbSg?=
 =?us-ascii?Q?snEBegoq7SYaFBoKeXxN5VpYOESxZeXgw9qvBwLza19OnSP9H/O7/xMPnjpw?=
 =?us-ascii?Q?LumEZmv8+sBmb5ByecM9nCPIQKkNoSGDnVJirvgn0ZMyyuJDRroSHHtVUkjZ?=
 =?us-ascii?Q?IlRKKqRXdyJl2wV0bRr8JjmWwywHKTk5DztNjwR0+RKa/d5I0j9K9ivKkFwr?=
 =?us-ascii?Q?QjqHCUFCGJfjkrBWnaTjJtA4OuUc1xTagKUEXPbzAzerIz2eyj+SVsqBzMnd?=
 =?us-ascii?Q?sya7vnm2MMAellMe1apDx/4OcwFfeUYMxKmDLhUTU+FujcQAQWWXd+q6O803?=
 =?us-ascii?Q?o1VYzz4fPmTFomuIkhRpdnNwQ2E/BQlNZ3sqW+B4eIiRgP6Z5pGQ01He50nn?=
 =?us-ascii?Q?Ycm4gyWsdQ1w01km6pxuFF/HWPgKo1aGk8CcWwLUMISyzNOJnHhX+y8xPdmI?=
 =?us-ascii?Q?gufb/h9anwkjRmMNAzhA2ZycmZwNb25gIba9qnDYeNrQt3DSbMIQazyjp4tj?=
 =?us-ascii?Q?B/81ZcKL/5ImSAZmAbzkJHjdv47ssVDMxhLIWZqJhTh+q+LNJMF4dy2u3AFg?=
 =?us-ascii?Q?504IJrYIzqWIqM+WxEqQXBq9NmdKGYGdfN6AR94Hn2xsd6/shJVM822G1uaV?=
 =?us-ascii?Q?bjpdDsDht1B7AjlOlPv71oupL+JwElDxhinG04nt9JSYzPvsyNAFEuHI+mf0?=
 =?us-ascii?Q?q3MeBZlw0njdcvPbNoKYrmVapWMMOszanc5nPMQgqOncsPVfDrBY6Pc148Aw?=
 =?us-ascii?Q?ykDOdtvPkfbuKOcP/BHJTYLHZYCYK656PbcJJbG1IeJwYAdxuElRkuXeyk4W?=
 =?us-ascii?Q?T9MURZfxVkVNOEzwmlV2e2nNiwro6gIkx5Q8ng/gEG3Sw9GE692iJsCxmrYE?=
 =?us-ascii?Q?AxAUYMWzPCTC5eXOj7Ylwy7sTsVIUAphcFOZdGNU4rwcBfSLRq1RrKL9eNvP?=
 =?us-ascii?Q?JTwrFOuvN4sQVcK/YHvPQpWuGddik5ooY4mbjn6VOa4aQQ4gnB1u7DGrAnmf?=
 =?us-ascii?Q?7vC9hK1V1LDfA1Euakoc2Nzb+jl38Hb8DFmQ+K/nB0yVHwoWOCBkaIHR6a0b?=
 =?us-ascii?Q?ek+jzNnsHj/nq6iygoqpnc/7X5WOIHXXGBV4NyJ5oWiKpjrUEAF9cNVVJ0c7?=
 =?us-ascii?Q?aNBAa827hSsPWKY1U9oj5T1z8vXVYWg9Tw3RDDfGKPEXmno6QadbMmqFe0jf?=
 =?us-ascii?Q?PeDNE+8ohXxiwW2mAP7Z1EBxb0ErhViqSC4REvGD?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9d6b6e11-a08a-4e46-eec4-08dcdd39b1f6
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5899.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2024 08:11:45.0526
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 7dKY80FmhbFk8K046Cv+7Jn6iaMdcE0BeiwAzFErDynqIjGHEN2j7VN4PzkxCDLBFOq0jpD+gHnocmFIKKrecg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB5540
X-MailFrom: shenlichuan@vivo.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: URZQ237ABWTQABQBL5L3NA6TFO2REWKH
X-Message-ID-Hash: URZQ237ABWTQABQBL5L3NA6TFO2REWKH
X-Mailman-Approved-At: Tue, 01 Oct 2024 12:35:33 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/URZQ237ABWTQABQBL5L3NA6TFO2REWKH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Fixed some confusing spelling errors that were currently identified,
the details are as follows:

-in the code comments:
drivers/soundwire/bus.c:115: enumuration==> enumeration
drivers/soundwire/qcom.c:1176: wil ==> will
drivers/soundwire/sysfs_slave.c:218: highligh ==> highlight

Signed-off-by: Shen Lichuan <shenlichuan@vivo.com>
---
 drivers/soundwire/bus.c         | 2 +-
 drivers/soundwire/qcom.c        | 2 +-
 drivers/soundwire/sysfs_slave.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 263ca32f0c5c..d1dc62c34f1c 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -112,7 +112,7 @@ int sdw_bus_master_add(struct sdw_bus *bus, struct device *parent,
 	/* Set higher order bits */
 	*bus->assigned = ~GENMASK(SDW_BROADCAST_DEV_NUM, SDW_ENUM_DEV_NUM);
 
-	/* Set enumuration device number and broadcast device number */
+	/* Set enumeration device number and broadcast device number */
 	set_bit(SDW_ENUM_DEV_NUM, bus->assigned);
 	set_bit(SDW_BROADCAST_DEV_NUM, bus->assigned);
 
diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index aed57002fd0e..2b403b14066c 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -1173,7 +1173,7 @@ static int qcom_swrm_stream_alloc_ports(struct qcom_swrm_ctrl *ctrl,
 	else
 		sconfig.direction = SDW_DATA_DIR_RX;
 
-	/* hw parameters wil be ignored as we only support PDM */
+	/* hw parameters will be ignored as we only support PDM */
 	sconfig.ch_count = 1;
 	sconfig.frame_rate = params_rate(params);
 	sconfig.type = stream->type;
diff --git a/drivers/soundwire/sysfs_slave.c b/drivers/soundwire/sysfs_slave.c
index f4259710dd0f..c5c22d1708ec 100644
--- a/drivers/soundwire/sysfs_slave.c
+++ b/drivers/soundwire/sysfs_slave.c
@@ -215,7 +215,7 @@ const struct attribute_group *sdw_attr_groups[] = {
 
 /*
  * the status is shown in capital letters for UNATTACHED and RESERVED
- * on purpose, to highligh users to the fact that these status values
+ * on purpose, to highlight users to the fact that these status values
  * are not expected.
  */
 static const char *const slave_status[] = {
-- 
2.17.1

