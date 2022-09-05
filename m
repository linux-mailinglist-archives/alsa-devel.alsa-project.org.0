Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 12CAF5ADBD8
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Sep 2022 01:19:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC0951673;
	Tue,  6 Sep 2022 01:18:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC0951673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662419987;
	bh=QIRhPr4FbZK4x2KwW/3KrLIno/R2hog+P3urML2T9JY=;
	h=From:Subject:To:In-Reply-To:References:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MalC5fRHrYVEl/4w0R4NEHczNOnrLyEM46ek2sAjYEAIhnITmSb0/87nzfPDqOz0I
	 jR4BVGFpcK8BU9L54/LJkl5QVFrHRPMMclPrUgIDeRRs4I6Xuf59flWry6KlUM3xb3
	 J3t7JqMmG5qK/VGlKl6jq0dxnNRSg6K93yRCipXs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 35711F8053D;
	Tue,  6 Sep 2022 01:18:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A610DF80542; Tue,  6 Sep 2022 01:18:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2100.outbound.protection.outlook.com [40.107.114.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C6044F80542
 for <alsa-devel@alsa-project.org>; Tue,  6 Sep 2022 01:18:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6044F80542
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="aBck7HRP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e4rmVBAXSLTs++YUkFQf3byVQfEXZFJ9WcZctF5d7j9hAco7nEvTPakLd9E8icgEN/qnKF2MJlVddj4nRABXeYDf1DFGK1UV6tlaXR/ZlE4seb2sPGtTVO1rdJprd8tjFvcl5S+zhO0/U4KfUndcWfnrlfhEg9YMmnrwFMd2jz/hGr1R7OHnIF9o8AZwwwh5Sk5fFN7gnkds+23uN7qTMdVRS7E2eSgXk0aieIfGpNueduJwB49RusIeMk3uvKavPkOoVeCIL2VCXH0pD7OR7SWvbkoj3aq4Mcdc0jKorzaGyaacxzXysogYbWeR0qvcFUkCu4uXcvkSHOPENl8KCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GfpVeaVu68zBJY8TZDXtBE1PfJkmlORwjJqByvsDvXo=;
 b=lE/d477avvrwyfWQiXuCkMQoIrJxe+fTFYIpSyU2aCyxXeYTPguzWh0VlMXCZyoGV755/bqz4k4O+20Kt+MGS089QTbenSmdixknrbEQmW9zL60MkZlFs9Wx9r2fmvNgluL9APvU780bEGtS82HzfPggvFGE4CtLR75HI0ERlIAk6BmyIefQE8/nX3ClIRsu4EfCNpbvfpfpUYMYDLe8KEe4n1lvT5hnwvB7BRCCpjo2IeXFvaH/s1/N/68Lo3+GYlgtBhWFy2TamirgMsY30QUkzKYO9FP6gQDRrTVVm01l3001ehNBAlKiG1XLKrjMKtV+W10ZQeyIoMNV74su9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GfpVeaVu68zBJY8TZDXtBE1PfJkmlORwjJqByvsDvXo=;
 b=aBck7HRPgtq5+tyLwFYI+IxFVcLw5g7XUP4Us/Ha+McwdyclI4xIe2NeU9FXmdYfKvWtZSytbpz8L8lCLbX62O+XMx4rRn7Rh0DyBZJmC8zhou+40xl1qVGwdzhbKvCaKHguqNh/Ft8iojnTwIBWXXOxScOMVTRYXHxcwjLE7KM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYAPR01MB5852.jpnprd01.prod.outlook.com (2603:1096:404:8053::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Mon, 5 Sep
 2022 23:17:58 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::bdab:be26:6e36:88c6]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::bdab:be26:6e36:88c6%3]) with mapi id 15.20.5588.018; Mon, 5 Sep 2022
 23:17:58 +0000
Message-ID: <87wnah8l7e.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 4/4] ASoC: soc-dapm.c: fixup
 snd_soc_dapm_new_control_unlocked() error handling
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <8735d59zt9.wl-kuninori.morimoto.gx@renesas.com>
References: <8735d59zt9.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Sep 2022 23:17:57 +0000
X-ClientProxiedBy: TYAPR01CA0174.jpnprd01.prod.outlook.com
 (2603:1096:404:ba::18) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 89987b2c-46b0-4e52-99d6-08da8f94de9a
X-MS-TrafficTypeDiagnostic: TYAPR01MB5852:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4nwXM6oLU1ru3MaEI63g9DeynwCW4uLuhNxKHcWXA07GhUuIkLbeerRF9ehoOMvdNCI+J21QX52p07qnSW+O0kAqMW0cE3gJB45ZuIC02B7H15zkTtzU2kS//jcXb7MI2+H/jNmMFVDnr7izb4MNx3viNIMfUDQ6KjAUoqF+7TXaGyVk5Tp5CRKVaKDA0U94zbCXD4ZRKKJrfKW4Pof6xf+g9Wksx0HJFUD47nnur1KRB3+z+y12aDplSDljvfciYa+lSGqnbIEZ8wI97bckVkw6iYsPOodCcWwgj9f72tbXGhtalRQfFWKoKvKRQl6xbs6Eyl4hCpGnfrsgn+ceEwM0YEmkChqj+QeRMVKdTDDFaws9KoehfWmqHl2rRUXTcT7bIjlzA8v3Isytx6dF2OXRhPUZ5d/OesHqkDuVVpvELhUlJIicknGMel8CDFhlV+V/4sIGawzzkq/6i+OXlc3vWd5s1lHawJ3YKrMNoJlHDYtJgS/FsDQwLX7oTaSSiF1uBpYN9asRcNJb6VtSsh6AKWOwx9NDdIQAxVvVbp7/JMY/w++Ot2SUf+jFwqFCcjAeUqIuTdr4pYVbudHepy50HJG0XHQVWgYHySFVJtEFoSIuognn5KU4Syo3KQviTGUC0ZJeeJ/tHPkdLa7NsMKEc7a3TybVObjOMq4bIeWln0xLOUuKNMGiOAeoL91rvqzP4edyGKRiW9MJI1up/kf86kZBa/VSYG9BpOmpIz08uX3k0wCH3WV/OLK6MdYaQQwZfaxG5219Ger+anPo20RmrVVAZKpK2whdyfZflc1FAPwnSITiAiW9RuCrsjca3tfOUJt2GmlgUmRMpDLEow==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(346002)(366004)(396003)(39850400004)(136003)(8676002)(478600001)(2906002)(6512007)(26005)(66556008)(86362001)(4326008)(186003)(66946007)(52116002)(6486002)(36756003)(41300700001)(6506007)(8936002)(66476007)(2616005)(83380400001)(38350700002)(38100700002)(6916009)(316002)(5660300002)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YVLYnRVeZOq5Ws8deCtb5n0B37eLDpESeSMbrykjs5LJ0/G+cy8J63bbVQga?=
 =?us-ascii?Q?V1pa0dDi3jEoDLDE9SIRQJ1ETh9+XH0fJ1tZ+3auXHS6q1brihgyRxyUChnI?=
 =?us-ascii?Q?Iw8zYr0kJZZowqTfraPl9WxoW110RN1bPJlQRZeWJrYEVwjJbeOjVdAHDqhS?=
 =?us-ascii?Q?hfK0v/v0iknuaozz1WpMtwpkc7ILJb30p9xVA6Pt4d+nd/tEWde6kcVoqzDW?=
 =?us-ascii?Q?xTs+O2kkXiSSHOWNlw2QAG6k6sYAqMwG6bqS92PTjKCv/6+0lL90hbyQ9bkH?=
 =?us-ascii?Q?0ESicEd+dqrgZAkjwj0Y9MTBw7+WBlEkHmTymfpknYEExAaBMxSSq424gkcX?=
 =?us-ascii?Q?H68Oi/fMOSFiVvDQVSRMfgOyWPcSE4jFzvwyPpYK98nmnUnEX1OA/5Fu8H8R?=
 =?us-ascii?Q?47OCLb0PSyT5MilwiQZbd2GEQVB/04HSTGmvfD6WGMyPvU2gP0SpBxr/52fY?=
 =?us-ascii?Q?ZzgmKz4GRH5+xE2sL1ql5OH1hPTVCAJu1Q4QZgfKDyFmy6vpqqqwdnRso332?=
 =?us-ascii?Q?Pd1Y5MwADoxsbRX0her44OSxmVoOAvIGG3Sl/bmk2iTTMBTCgMLAuplZnN+2?=
 =?us-ascii?Q?1k1j/EGMJpGX4HKKwXyy1CqLsDcXocZ3/jqpalG14EJUm6cTdZLYByU2BzrT?=
 =?us-ascii?Q?jvTldlk4shFHkYzCpP1JIJHQUSlo1/y0IBSyjJcuZa0j9TqJORG9+4vBcNVC?=
 =?us-ascii?Q?jDUsC3YmEai1uuh9Zip6yzq4KhoL5jE4ZfhBxFHkeLjcLNXB6t8xAuCfdFGm?=
 =?us-ascii?Q?/Dv/DdKr70N+B8mWC7uc9zhpr6BgWqQkN8zgXB+a3hepHJKmBMVdaIGOzj84?=
 =?us-ascii?Q?gI0XlM32VYjMvaHOWCHbw+wg5kk5jfTjYqkhWJFBlTzbGbrZbJBCZFdrwcew?=
 =?us-ascii?Q?WqDleHoiMlprJVgjhpnoCu+IrT9d1C+APgnah+Vif0bEILM+dITuuh0AsA+k?=
 =?us-ascii?Q?zF1hI5V4xNbTZaN+ZhnIC7fuBhaslxNyL5hDHi5K0kHAk84/j43r578lMKcT?=
 =?us-ascii?Q?Ia6OdmaYeSGHpvE2R3roVbQWb/qFx+vvEpiNLURevalCdMTO1NbxofL/eS1T?=
 =?us-ascii?Q?stUMW+8zun5w2LUaZe0hZnmhisvKyLs77wdMw6Bk5ow3sNm2A/crH+pShbj4?=
 =?us-ascii?Q?Pz4+BeTvwoWwcbB2II3L/I1ZT47a5QStfozkAjbhEzbUKMPZzRXtGVBceL9p?=
 =?us-ascii?Q?N8kwTCThSp7a1XNBaZyyucBnZ5q3GHGhwrXq9E9bp2o5L2Hcr2+BbVneZabV?=
 =?us-ascii?Q?/ImJG4PJes5RAe8KCehDAEiNyFw1uwwCJXNFj3c5uN5uwbDRI4BKFte+VLZt?=
 =?us-ascii?Q?+vgNw2CVPC93dhtOg8YT4Cl/LAXmC4WDOr4s4IPVknZZh8F4ch+fvw4Eq4sU?=
 =?us-ascii?Q?1C8gIc/ZMJlglu3tlR0eVuv7kdN7A8F0iBo8xT4+PzsC5CmQP7L+DyUyDyT3?=
 =?us-ascii?Q?4MMajG41HaUeWnjTib9aSUd0tuG3Rdb0niYsf/yrFbToNk7DfR0wp1bqAMXG?=
 =?us-ascii?Q?MY063OhmhPykApHSg8DFEFiGf8i/2G59pFo7qlCtaO7wG3pxn3HM7OK71AlI?=
 =?us-ascii?Q?KizBg1gH+dU5lHvsvvhY3cutWgUQUBcv0rsBtqto0srwsGFAHTXyg71AT10c?=
 =?us-ascii?Q?ut+v96yX70UntiKiJFmLiNU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89987b2c-46b0-4e52-99d6-08da8f94de9a
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2022 23:17:57.9733 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sVOvnxaAFL/8rfqDJcDzwwErYB1vmCzKlI4sHzykV0FFQRbo8SEZVJK3ooljZAKHyqTpoi9nhmc48yrtQXhtZt6GkweONusJV2CLwV93BBusEveMvy26FhFV0d1NMwGB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5852
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Current snd_soc_dapm_new_control_unlocked() error handling is wrong.
It is using "goto request_failed" (A), but error message is using
"w->name" (B) which is not yet created in such timing.

	snd_soc_dapm_new_control_unlocked(xxx)
	{
		...
		switch (w->id) {
		case xxx:
			...
			if (IS_ERR(...)) {
				ret = PTR_ERR(...);
(A)				goto request_failed;
			}
		...
		}

		prefix = soc_dapm_prefix(...);
		if (prefix)
(B)			w->name = kasprintf(...);
		else
(B)			w->name = kstrdup_const(...);
		...

(A)	request_failed:
		if (ret != -EPROBE_DEFER)
(B)			dev_err(..., w->name, ...);

		return ...;
	}

we can create "w->name" at beginning of this function.
In such case, we need to call kfree_const(w->name) at error case.
This patch do these.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-dapm.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index e8c813586b53..928e3bfe7457 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -3630,10 +3630,18 @@ snd_soc_dapm_new_control_unlocked(struct snd_soc_dapm_context *dapm,
 	enum snd_soc_dapm_direction dir;
 	struct snd_soc_dapm_widget *w;
 	const char *prefix;
-	int ret;
+	int ret = -ENOMEM;
 
 	if ((w = dapm_cnew_widget(widget)) == NULL)
-		return ERR_PTR(-ENOMEM);
+		goto cnew_failed;
+
+	prefix = soc_dapm_prefix(dapm);
+	if (prefix)
+		w->name = kasprintf(GFP_KERNEL, "%s %s", prefix, widget->name);
+	else
+		w->name = kstrdup_const(widget->name, GFP_KERNEL);
+	if (!w->name)
+		goto name_failed;
 
 	switch (w->id) {
 	case snd_soc_dapm_regulator_supply:
@@ -3672,17 +3680,6 @@ snd_soc_dapm_new_control_unlocked(struct snd_soc_dapm_context *dapm,
 		break;
 	}
 
-	prefix = soc_dapm_prefix(dapm);
-	if (prefix)
-		w->name = kasprintf(GFP_KERNEL, "%s %s", prefix, widget->name);
-	else
-		w->name = kstrdup_const(widget->name, GFP_KERNEL);
-	if (w->name == NULL) {
-		kfree_const(w->sname);
-		kfree(w);
-		return ERR_PTR(-ENOMEM);
-	}
-
 	switch (w->id) {
 	case snd_soc_dapm_mic:
 		w->is_ep = SND_SOC_DAPM_EP_SOURCE;
@@ -3770,9 +3767,11 @@ snd_soc_dapm_new_control_unlocked(struct snd_soc_dapm_context *dapm,
 	if (ret != -EPROBE_DEFER)
 		dev_err(dapm->dev, "ASoC: Failed to request %s: %d\n",
 			w->name, ret);
-
+	kfree_const(w->name);
+name_failed:
 	kfree_const(w->sname);
 	kfree(w);
+cnew_failed:
 	return ERR_PTR(ret);
 }
 
-- 
2.25.1

