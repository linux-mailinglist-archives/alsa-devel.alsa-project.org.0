Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8B4176581
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Mar 2020 21:59:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D820B1694;
	Mon,  2 Mar 2020 21:58:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D820B1694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583182769;
	bh=UasCd3tkmeRjml8xgzsijwXYfawDLPfRgVomrHLYpO4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KlO1GbEtSG+iDTAFU6PxgvIVXqfMuNUtiJvwLJFzIiyq1v6K39O1Dqpmmfg+bP6c4
	 ASf+rOU0mHtfe7H3b6kpjjtt7lraztfYX7ys6eJ0kI4vAFFphaqZ/B7B68GsW066H1
	 zhrHW/KS3c05YY08GQRBCIhl+QOM6JXUd/vNsHa0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F41ECF801F5;
	Mon,  2 Mar 2020 21:57:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1454CF801F5; Mon,  2 Mar 2020 21:57:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50062.outbound.protection.outlook.com [40.107.5.62])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 15D88F800E5
 for <alsa-devel@alsa-project.org>; Mon,  2 Mar 2020 21:57:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15D88F800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="L6kvdPU5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MGeucfAVSazP5QB1RZZMg5Oxmwky2x62Imv1CJitoPe7GqjB2ZvLghLb8297yWeJPbphnk72Qn8VbATe4oFg3d8PZrZal6arqAvPJkYeKVfod0ZQcBGOEqLBnH57F1zJyFW5x2eLg1qd/sFQXjPLT2xxVKD5LqaNgIFRdXLPQieUorkSwlHrWytxvn6sJD7GSImAoyDYNn/CVE5tpCU3EDCQRmct1H2vyl9C1vHSAJtrt1Jfx4qDd/jU6YhHr47gxWR4MapFhCz8A9M+IMUYx4U78mA/4H5AjJTyMc190v65Y5XSJnuXBC3wjX2jbXTxbDcszmoGwFCPn8E5jnr0Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EFfcAXEU3F7FxlDk2Im7xjB1qQVJKbPG3CV/CSaQVl8=;
 b=dctLlaIs0P7m8dIAMrbKLzSmBfHfnP/D50uKx4ILlyGlNPM2ADtYCw+SL4O3OdKhwZaLwdK8DpfbyIYKZEY2gzY3kw2F3/25yZnUdHcOZTamEcoIQYSZL6/HrpjxNd/F3no9EqjNCOlTwx6xvYaBOHHF5Ncbo515JRlJ5kbuG122Z9rkD1tYQItgt8eRp58/OUFV52n+4NltVbpewtRN+e0hvoIt4Xelt+TreLuisik9MLpmVGCFH1eRDycfXF/2xfrPs8V3aMjqUaBAfZhR/vy7lOXnyS8tp9NYEIkq3k5nl+wYq8qLhGHg7xn4VAqQlN0H+u3ShhXoKR4YTp3UWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EFfcAXEU3F7FxlDk2Im7xjB1qQVJKbPG3CV/CSaQVl8=;
 b=L6kvdPU5vOhewDcQL7iGlmcxTyBa3pDGzRD636o2Ug8Vw0xIt2jjnR+h2jAyZGL9d+4hulWbA+F4LEv1c3nlQl1qQtVBf75kk6uuoN3NVftJ1u/RVWIvYYerIHUSfp1RsI0IBSrQ3vSvdSN/0faLpoFxntcjyCEfWlrYF3Fk/N4=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=daniel.baluta@oss.nxp.com; 
Received: from VI1PR0402MB3839.eurprd04.prod.outlook.com (52.134.16.147) by
 VI1PR0402MB3453.eurprd04.prod.outlook.com (52.134.3.33) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.18; Mon, 2 Mar 2020 20:57:39 +0000
Received: from VI1PR0402MB3839.eurprd04.prod.outlook.com
 ([fe80::35d0:31bc:91d9:ceb0]) by VI1PR0402MB3839.eurprd04.prod.outlook.com
 ([fe80::35d0:31bc:91d9:ceb0%7]) with mapi id 15.20.2772.019; Mon, 2 Mar 2020
 20:57:38 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: rjw@rjwysocki.net,
	len.brown@intel.com,
	pavel@ucw.cz
Subject: [RFC PATCH 1/2] PM / domains: Introduce multi PM domains helpers
Date: Mon,  2 Mar 2020 22:56:59 +0200
Message-Id: <20200302205700.29746-2-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200302205700.29746-1-daniel.baluta@oss.nxp.com>
References: <20200302205700.29746-1-daniel.baluta@oss.nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: AM4PR05CA0031.eurprd05.prod.outlook.com (2603:10a6:205::44)
 To VI1PR0402MB3839.eurprd04.prod.outlook.com
 (2603:10a6:803:21::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1864-103.ro-buh02.nxp.com (89.37.124.34) by
 AM4PR05CA0031.eurprd05.prod.outlook.com (2603:10a6:205::44) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.15 via Frontend Transport; Mon, 2 Mar 2020 20:57:37 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [89.37.124.34]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 76787022-9d97-4803-3f69-08d7beec5780
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3453:|VI1PR0402MB3453:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB3453ED1F859BAA4A5A7B418AB8E70@VI1PR0402MB3453.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-Forefront-PRVS: 033054F29A
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(376002)(346002)(136003)(366004)(199004)(189003)(2906002)(26005)(6486002)(4326008)(6506007)(5660300002)(186003)(16526019)(478600001)(7416002)(6666004)(1076003)(2616005)(66946007)(66556008)(66476007)(44832011)(8936002)(8676002)(86362001)(81166006)(81156014)(6512007)(52116002)(956004)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0402MB3453;
 H:VI1PR0402MB3839.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:0; MX:1; 
Received-SPF: None (protection.outlook.com: oss.nxp.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bEjqc1sxXIpkxiqIrs1/5Y98exNa75d6swjo2drG3oa/dcmfQLswrnR272uxunayBUvMG3Of/HzpqKZpvUJLMFFB5Wm5qez7/BKoJHb39dF3J5bwLf1dDs1AfOB5VCRXpFk4100VR5B06D2I1Jo329DiYCRmxwq2Hfbs1wQH9Bf0365z2kDLvxL0Y+y2dIJzCfr6H+CPX4Z9NE/9WWIbzxZwQGB8dlKiu8bRM0DHHASwdhtLMnRu4hGwPlP25ViQmRzZdW2iGcbLvTutcXiOw6sIDrNLgfu2/Dt4UgO2aLVnNzFvada+skdl7bpnvYq4ULQ6pX40JjjaEpeRPoDBy4xHJcEAXrskxKA4nKjPectJ9ivLDMPzRtUiAfGhKM/+5JfKxmzIfhhCzWUXsjO2sEZRt7cCgGFXGbac4XT5+HHbE4TDka+VGSueTOOqpX+p
X-MS-Exchange-AntiSpam-MessageData: k5Or6yQZYLbQOfTe8dRa2g2vqZLCsuCDlkYlR0bYyeRAZJi0tDcFi7fqJWmPDZK4QHSDzZgAelP0SrE6GeGn8jLu5PHydokhDWfSDL5tr8E1uw9V6ruc4ckm9VGs0OJ5BCoyQsTPr/0e7Z187j8RYA==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76787022-9d97-4803-3f69-08d7beec5780
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2020 20:57:38.8564 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DGavOBA6qMMFuXQIm/SxOfElhO0ERe/bT5A4dFh3WaenfSqYYJNN5hVKGMUL0qTJMUtvfmAu3m5sCANPlaG5bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3453
Cc: aisheng.dong@nxp.com, daniel.baluta@gmail.com, ulf.hansson@linaro.org,
 festevam@gmail.com, alsa-devel@alsa-project.org, linux-pm@vger.kernel.org,
 gregkh@linuxfoundation.org, s.hauer@pengutronix.de, khilman@kernel.org,
 ranjani.sridharan@linux.intel.com, linux-kernel@vger.kernel.org,
 Daniel Baluta <daniel.baluta@nxp.com>, pierre-louis.bossart@linux.intel.com,
 paul.olaru@nxp.com, linux-imx@nxp.com, kernel@pengutronix.de,
 shawnguo@kernel.org, shengjiu.wang@nxp.com,
 linux-arm-kernel@lists.infradead.org
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

From: Daniel Baluta <daniel.baluta@nxp.com>

This patch introduces helpers support for multi PM domains.

API consists of:

1) dev_multi_pm_attach - powers up all PM domains associated with a given
device. Because we can attach one PM domain per device, we create
virtual devices (children of initial device) and associate PM domains
one per virtual device.

2) dev_multi_pm_detach - detaches all virtual devices from PM domains
attached with.

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 drivers/base/power/common.c | 93 +++++++++++++++++++++++++++++++++++++
 include/linux/pm_domain.h   | 19 ++++++++
 2 files changed, 112 insertions(+)

diff --git a/drivers/base/power/common.c b/drivers/base/power/common.c
index bbddb267c2e6..a90cc6b476e4 100644
--- a/drivers/base/power/common.c
+++ b/drivers/base/power/common.c
@@ -228,3 +228,96 @@ void dev_pm_domain_set(struct device *dev, struct dev_pm_domain *pd)
 	device_pm_check_callbacks(dev);
 }
 EXPORT_SYMBOL_GPL(dev_pm_domain_set);
+
+/**
+ * dev_multi_pm_attach - power up device associated power domains
+ * @dev: The device used to lookup the PM domains
+ *
+ * Parse device's OF node to find all PM domains specifiers. For each power
+ * domain found, create a virtual device and associate it with the
+ * current power domain.
+ *
+ * This function should typically be invoked by a driver during the
+ * probe phase, in the case its device requires power management through
+ * multiple PM domains.
+ *
+ * Returns a pointer to @dev_multi_pm_domain_data if successfully attached PM
+ * domains, NULL if 0 or 1 PM domains specified, else an ERR_PTR() in case of
+ * failures.
+ */
+struct dev_multi_pm_domain_data *dev_multi_pm_attach(struct device *dev)
+{
+	struct dev_multi_pm_domain_data *mpd, *retp;
+	int num_domains;
+	int i;
+
+	num_domains = of_count_phandle_with_args(dev->of_node, "power-domains",
+						 "#power-domain-cells");
+	if (num_domains < 2)
+		return NULL;
+
+	mpd = devm_kzalloc(dev, GFP_KERNEL, sizeof(*mpd));
+	if (!mpd)
+		return ERR_PTR(-ENOMEM);
+
+	mpd->dev = dev;
+	mpd->num_domains = num_domains;
+
+	mpd->virt_devs = devm_kmalloc_array(dev, mpd->num_domains,
+					    sizeof(*mpd->virt_devs),
+					    GFP_KERNEL);
+	if (!mpd->virt_devs)
+		return ERR_PTR(-ENOMEM);
+
+	mpd->links = devm_kmalloc_array(dev, mpd->num_domains,
+					sizeof(*mpd->links), GFP_KERNEL);
+	if (!mpd->links)
+		return ERR_PTR(-ENOMEM);
+
+	for (i = 0; i < mpd->num_domains; i++) {
+		mpd->virt_devs[i] = dev_pm_domain_attach_by_id(dev, i);
+		if (IS_ERR(mpd->virt_devs[i])) {
+			retp = (struct dev_multi_pm_domain_data *)
+				mpd->virt_devs[i];
+			goto exit_unroll_pm;
+		}
+		mpd->links[i] = device_link_add(dev, mpd->virt_devs[i],
+						DL_FLAG_STATELESS |
+						DL_FLAG_PM_RUNTIME |
+						DL_FLAG_RPM_ACTIVE);
+		if (!mpd->links[i]) {
+			retp = ERR_PTR(-ENOMEM);
+			dev_pm_domain_detach(mpd->virt_devs[i], false);
+			goto exit_unroll_pm;
+		}
+	}
+	return mpd;
+
+exit_unroll_pm:
+	while (--i >= 0) {
+		device_link_del(mpd->links[i]);
+		dev_pm_domain_detach(mpd->virt_devs[i], false);
+	}
+
+	return retp;
+}
+EXPORT_SYMBOL(dev_multi_pm_attach);
+
+/**
+ * dev_multi_pm_detach - Detach a device from its PM domains.
+ * Each multi power domain is attached to a virtual children device
+ *
+ * @mpd: multi power domains data, contains the association between
+ * virtul device and PM domain
+ *
+ */
+void dev_multi_pm_detach(struct dev_multi_pm_domain_data *mpd)
+{
+	int i;
+
+	for (i = 0; i < mpd->num_domains; i++) {
+		device_link_del(mpd->links[i]);
+		dev_pm_domain_detach(mpd->virt_devs[i], false);
+	}
+}
+EXPORT_SYMBOL(dev_multi_pm_detach);
diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
index 9ec78ee53652..5bcb35150af2 100644
--- a/include/linux/pm_domain.h
+++ b/include/linux/pm_domain.h
@@ -183,6 +183,13 @@ struct generic_pm_domain_data {
 	void *data;
 };
 
+struct dev_multi_pm_domain_data {
+	struct device *dev; /* parent device */
+	struct device **virt_devs; /* virtual children links */
+	struct device_link **links; /*  links parent <-> virtual children */
+	int num_domains;
+};
+
 #ifdef CONFIG_PM_GENERIC_DOMAINS
 static inline struct generic_pm_domain_data *to_gpd_data(struct pm_domain_data *pdd)
 {
@@ -369,18 +376,27 @@ struct generic_pm_domain *of_genpd_remove_last(struct device_node *np)
 
 #ifdef CONFIG_PM
 int dev_pm_domain_attach(struct device *dev, bool power_on);
+struct dev_multi_pm_domain_data *dev_multi_pm_attach(struct device *dev);
 struct device *dev_pm_domain_attach_by_id(struct device *dev,
 					  unsigned int index);
 struct device *dev_pm_domain_attach_by_name(struct device *dev,
 					    const char *name);
 void dev_pm_domain_detach(struct device *dev, bool power_off);
 int dev_pm_domain_start(struct device *dev);
+void dev_multi_pm_detach(struct dev_multi_pm_domain_data *mpd);
 void dev_pm_domain_set(struct device *dev, struct dev_pm_domain *pd);
+
 #else
 static inline int dev_pm_domain_attach(struct device *dev, bool power_on)
 {
 	return 0;
 }
+
+struct dev_multi_pm_domain_data *dev_multi_pm_attach(struct device *dev)
+{
+	return NULL;
+}
+
 static inline struct device *dev_pm_domain_attach_by_id(struct device *dev,
 							unsigned int index)
 {
@@ -396,6 +412,9 @@ static inline int dev_pm_domain_start(struct device *dev)
 {
 	return 0;
 }
+
+void dev_multi_pm_detach(struct dev_multi_pm_domain_data *mpd) {}
+
 static inline void dev_pm_domain_set(struct device *dev,
 				     struct dev_pm_domain *pd) {}
 #endif
-- 
2.17.1

