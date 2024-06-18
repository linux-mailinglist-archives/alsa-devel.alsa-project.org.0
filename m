Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0FE90C8A3
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jun 2024 13:12:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 345F0839;
	Tue, 18 Jun 2024 13:11:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 345F0839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718709125;
	bh=7ZHVemsF6+KbeqK9iggqUq+lbRQzg/tHZkexl4DHzIM=;
	h=From:To:CC:References:In-Reply-To:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rqqTZJwnF1s9g3339pHzmtWFiqNNSv8O4R5wIcJzjOeCsR2U5iyd8OzGaB7e5c/2D
	 KUdfqx83sbDvQBe29rm50WUw7jaW294TmxEGkxVY40D28AOokCT3Okoxtv6z5s9SIL
	 PzPSEekCp4GbEQkaC1FU6CDz+1RxHEy7U1xTh05Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6DA5CF804D6; Tue, 18 Jun 2024 13:11:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E63BF805AF;
	Tue, 18 Jun 2024 13:11:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A5330F8023A; Tue, 18 Jun 2024 13:01:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C374FF800FA
	for <alsa-devel@alsa-project.org>; Tue, 18 Jun 2024 13:01:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C374FF800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=HkN8ocZ8
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 45I62OOg026682;
	Tue, 18 Jun 2024 06:01:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=LYfxUuuM5+2kBN2AZQxlpziiAVQ0rtBYuLHFLI7emic=; b=
	HkN8ocZ8Saeaakp/8ovjKl6ftWLE+rwanlNrHM7OU0T25lNC/bX6zagtyLiGwAqr
	ACYHd+IogEi3R3MQzpU9C4CZg7+jkVks5OZInty09gUNNHEWXgsKg0xFjwMDcbAK
	g4M4YBvnZexs8ceBHOUiC0da5GoEXbRGxX7hH94bgitFEy07GoHbUYpJ/gU2+zec
	4/2pfPd4OyeqxSZy6Ye7Q2MV/8dAAq9lbkRW/o38gZcii+LPVcR+Tm7mP2XxGqNG
	gH1KjO0t2hDcLLDwtaXzuPKoml+FcVXZqm46IQNDR+ggw6v4UcPYE1rBdmEjZmME
	ZPkV3QomrJkU7hkrcDIwow==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3ys7cjtyf9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 06:01:11 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 18 Jun
 2024 12:01:09 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Tue, 18 Jun 2024 12:01:09 +0100
Received: from EDIN6ZZ2FY3 (EDIN6ZZ2FY3.ad.cirrus.com [198.61.65.31])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id BFA73820248;
	Tue, 18 Jun 2024 11:01:08 +0000 (UTC)
From: Simon Trimmer <simont@opensource.cirrus.com>
To: 'Baojun Xu' <baojun.xu@ti.com>
CC: <robh+dt@kernel.org>, <andriy.shevchenko@linux.intel.com>,
        <lgirdwood@gmail.com>, <perex@perex.cz>,
        <pierre-louis.bossart@linux.intel.com>, <kevin-lu@ti.com>,
        <shenghao-ding@ti.com>, <navada@ti.com>, <13916275206@139.com>,
        <v-hampiholi@ti.com>, <v-po@ti.com>, <niranjan.hy@ti.com>,
        <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <liam.r.girdwood@intel.com>, <yung-chuan.liao@linux.intel.com>,
        <broonie@kernel.org>, <soyer@irl.hu>, <tiwai@suse.de>
References: <20240614040554.610-1-baojun.xu@ti.com>
In-Reply-To: <20240614040554.610-1-baojun.xu@ti.com>
Subject: RE: [PATCH v8] ALSA: hda/tas2781: Add tas2781 hda SPI driver
Date: Tue, 18 Jun 2024 12:01:08 +0100
Message-ID: <000701dac16e$d31b8390$79528ab0$@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQFH9wWDXqQ8t2vJMRVSU98ssQlei7Ly7ByA
X-Proofpoint-GUID: s_5Pp0VX6HsJf9n8wLybA-MTPdYTHWJh
X-Proofpoint-ORIG-GUID: s_5Pp0VX6HsJf9n8wLybA-MTPdYTHWJh
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 5ERFOLHUUTQVV7JL5SRK4CZKOX2JAHKG
X-Message-ID-Hash: 5ERFOLHUUTQVV7JL5SRK4CZKOX2JAHKG
X-MailFrom: prvs=3899536243=simont@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5ERFOLHUUTQVV7JL5SRK4CZKOX2JAHKG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

> From: Baojun Xu <baojun.xu@ti.com>
> Sent: Friday, June 14, 2024 5:06 AM
> +static int tas2781_hda_bind(struct device *dev, struct device *master,
> +	void *master_data)
> +{
> +	struct tas2781_hda *tas_hda = dev_get_drvdata(dev);
> +	struct hda_component *comps = master_data;
> +	struct hda_codec *codec;
> +	int ret;
> +
> +	if (tas_hda->priv->index < 0 ||
> +	    tas_hda->priv->index >= HDA_MAX_COMPONENTS ||
> +	    (!comps))
> +		return -EINVAL;
> +
> +	comps = &comps[tas_hda->priv->index];
> +	if (comps->dev)
> +		return -EBUSY;
> +
> +	codec = comps->codec;
> +
> +	pm_runtime_get_sync(dev);
> +
> +	comps->dev = dev;
> +
> +	strscpy(comps->name, dev_name(dev), sizeof(comps->name));
> +
> +	ret = tascodec_spi_init(tas_hda->priv, codec, THIS_MODULE,
> +		tasdev_fw_ready);
> +	if (!ret)
> +		comps->playback_hook = tas2781_hda_playback_hook;
> +
...
> +
> +static void tas2781_hda_unbind(struct device *dev, struct device *master,
> +	void *master_data)
> +{
> +	struct tas2781_hda *tas_hda = dev_get_drvdata(dev);
> +	struct hda_component *comps = master_data;
> +
> +	comps = &comps[tas_hda->priv->index];
> +
> +	if (comps->dev == dev) {
> +		comps->dev = NULL;
> +		memset(comps->name, 0, sizeof(comps->name));
> +		comps->playback_hook = NULL;
> +	}
> +

I'd been making sure you're on CC but in addition to the other review
comments I wanted to highlight that this in for-next will affect this patch
and require similar changes to these in the i2c driver:

https://lore.kernel.org/alsa-devel/87le327f29.wl-tiwai@suse.de/T/#Z2e.:..:20
240617154105.108635-3-simont::40opensource.cirrus.com:1sound:pci:hda:tas2781
_hda_i2c.c 

-Simon

