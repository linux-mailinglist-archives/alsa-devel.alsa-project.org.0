Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EEFE14C70F
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jan 2020 08:50:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 87B961665;
	Wed, 29 Jan 2020 08:49:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 87B961665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580284224;
	bh=LnkpJqWsoXmnrxC2iXaHWkJnfBgi/WB0UlxGpXXnMTo=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=T/eOKJ7C4I5JYLnA3Q1UjV+A9t4jxIqaZxaf53s9U75RYPnrh070VIFXH5nFSqmsT
	 uy2zi5c0m7yCiyaEkbgr7TxEySPNMipxFfCrHXaqe9C3URSS6caiDF5Q3Bdhafba7v
	 /RcXVlFevoeWdhazv+MXFhJx5tOp0uEKTid+hOhQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E2E1F80123;
	Wed, 29 Jan 2020 08:48:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6FD37F8021E; Wed, 29 Jan 2020 08:48:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2061.outbound.protection.outlook.com [40.107.20.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03024F80123
 for <alsa-devel@alsa-project.org>; Wed, 29 Jan 2020 08:48:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03024F80123
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="VIpGDkmb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QIgq1iWY0OLN+F5FPHYpGsIi5CR7qdB4+v0Xo/fTUPPp1pXGO+EyC6kLQPjPAUwcJ11mZ749nZ6C/I8Ml2EOlNyhH2PUdoVPtNCuPUuKE7ZBbtvuAn21sU82KXgmxOMeVVy025+q3p1XJ1vrfPT29VIQNhh3eORl9TyJOxFH61iiGgqjQo+1mDre7uaMYcZYH/NetCyzRmkR6+d3KcpObWD5HLdlFEnWeHHZXQGdW0VMuoVUuRx+9Mb/KyxeiVeBQz6MVMC3fRqjMGw0Wzc7QQ/PrmBPYVi7JGflbkwF1zNvTTlF0mMLMz/kcCiSPHA33A2uxfNCBe+3oFy999c/Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yopIu+0gejNmcVZ5IoGHU3s2Mjt4vB0it/Iq4IBt+kw=;
 b=mZbykPZ4cI1yAdeQLuYfTs0PxbTWMwuH6TBgTPkIcGJwopMLAq0LOLhbWuXSiQ/g5tkVgdmh+FB6fBNyR+3PK/i94ZDmWg8Z21PLDfOYY1rpBOXKACXsAIE6H1cg6YiVEqP9nYq0yXCWohERssKVcNW77k8ywPNRVO7XjrRQ62bnh0Bx1T1S0jplof+H9F9ULJg7rG+KCde5rt7bj+Zzr96IcjJaizSEQb/OCgmYWskUr6gcPP5ZeiFMPMxg0Di2cKyYnmnn5N50Eli6TCPwVRyFC6X80+kBopH7ADQcThn1503gUHB3DbFWVutfXCqjLK5J+Q1tnsFG6Gy9e7jv0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yopIu+0gejNmcVZ5IoGHU3s2Mjt4vB0it/Iq4IBt+kw=;
 b=VIpGDkmbe+0kylspUySXqTDlocJckaf0CQQgfbg35U7RaRxcJE2tPExmKmPzHzN1jdWaO2kywljjAZH8Gtggmqv8ESr4apur/JBfh+E4f4sRtmm86tffLXEnXbJfAIsDR7H3swDSF8asTsHg41n5HE736zVfE5A8K66g8wFmRAk=
Received: from VI1PR0402MB3839.eurprd04.prod.outlook.com (52.134.16.147) by
 VI1PR0402MB3744.eurprd04.prod.outlook.com (52.134.11.25) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2665.22; Wed, 29 Jan 2020 07:48:34 +0000
Received: from VI1PR0402MB3839.eurprd04.prod.outlook.com
 ([fe80::8881:e155:f058:c0d1]) by VI1PR0402MB3839.eurprd04.prod.outlook.com
 ([fe80::8881:e155:f058:c0d1%4]) with mapi id 15.20.2665.027; Wed, 29 Jan 2020
 07:48:33 +0000
From: Daniel Baluta <daniel.baluta@nxp.com>
To: "cezary.rojewski@intel.com" <cezary.rojewski@intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Thread-Topic: [alsa-devel] [PATCH v3 08/11] ASoC: SOF: Generic probe compress
 operations
Thread-Index: AQHV1niBkI+qGdUwNEe7Zkq6Gk3rIg==
Date: Wed, 29 Jan 2020 07:48:33 +0000
Message-ID: <c31e40d6e082729b3e28285fd915808ba8187183.camel@nxp.com>
References: <20200128104356.16570-1-cezary.rojewski@intel.com>
 <20200128104356.16570-9-cezary.rojewski@intel.com>
In-Reply-To: <20200128104356.16570-9-cezary.rojewski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=daniel.baluta@nxp.com; 
x-originating-ip: [89.37.124.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 59d8c0d1-fadd-4c9c-b23d-08d7a48fa44a
x-ms-traffictypediagnostic: VI1PR0402MB3744:
x-microsoft-antispam-prvs: <VI1PR0402MB37447FD85B197D6B018191D8F9050@VI1PR0402MB3744.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2449;
x-forefront-prvs: 02973C87BC
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(366004)(346002)(136003)(396003)(189003)(199004)(71200400001)(8676002)(6486002)(44832011)(6512007)(36756003)(81166006)(81156014)(186003)(478600001)(8936002)(2616005)(26005)(54906003)(110136005)(4326008)(2906002)(66946007)(6506007)(316002)(76116006)(91956017)(5660300002)(4744005)(86362001)(66446008)(66556008)(64756008)(66476007)(41533002)(99106002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0402MB3744;
 H:VI1PR0402MB3839.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KO2i1NyL1U1WheJDGt5bMGG9lt+hbFh92n83J425DmgxB9mRbbDKu5R4wsfU2EUpptxvRW8I0wKNQxsAMx8asJcVDr+4q1dTYdOfeCN2fGLCdJ4hiTy+0ZinSEmR7lNC3+31dH8Sfj4B5iaeB2c0xHmLuEW7PUwuWG/BNMDvMk5HyWmvnzS12d0mi3IRaQd3+qBfIfAZVIDub6yDywROOPwP3AIIM0ei7EifO+4qovcTmVgGA+WnpwLuzJLO//PMEHniNMrwCTfHVx9+l65DWcO2n1ynfAtv5aVMrDAAd2r8hOZyF1CQaa+9cyt7V3mSaF3pFbHD5nTtFRnJSLL+Ntf43tqjRawu3OkjaIN2VkWbmkvJgbAd54+tLkQG/MsmSm2C66sztPDyjKRt+YobprTAmsQ2ouTmM5CHDHmsvyFLK6yGG9Qlp60aIe4w48oC8BriRFtRZJhnfMibpKTk6DtMMjmuqFp4NHpjqDbNIF+/RZnSBvepCKfvPRC85eIKJxNThbjQqEAmz1Qn6V80nA==
x-ms-exchange-antispam-messagedata: kk0rTMdbsaW0nd7I7NV4OluOBUBhqYU4BknYm1rG1uUkz3LfVbDVmiCl9yEd2EDa7oTdpUyHcYSM0EOjfLL38D5qTakXIVSQ7ERxCtpTvF5Rc7mXyO6ntG5uBnwfIqaPvvPR/IJOeYqKUtkLHb+goA==
x-ms-exchange-transport-forked: True
Content-ID: <696DCDFFAA8AB544A23511F31236035C@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59d8c0d1-fadd-4c9c-b23d-08d7a48fa44a
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2020 07:48:33.7813 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zdf3fWu4NQkaeZFX+4fhHGHpFKZyyacSA4hseFLmUAA7WwdblA/zkJznj4MBV3lX7oIZT9IIrl2qvkTCFPYZnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3744
Cc: "tiwai@suse.com" <tiwai@suse.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH v3 08/11] ASoC: SOF: Generic probe compress
 operations
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

One comment below:

> +int sof_probe_compr_set_params(struct snd_compr_stream *cstream,
> +		struct snd_compr_params *params, struct snd_soc_dai
> *dai)
> +{
> +	struct snd_compr_runtime *rtd = cstream->runtime;
> +	struct snd_sof_dev *sdev =
> +				snd_soc_component_get_drvdata(dai-
> >component);
> +	int ret;
> +
> +	cstream->dma_buffer.dev.type = SNDRV_DMA_TYPE_DEV_SG;
> +	cstream->dma_buffer.dev.dev = sdev->dev;
> +	ret = snd_compr_malloc_pages(cstream, rtd->buffer_size);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = snd_sof_probe_compr_set_params(sdev, cstream, params,
> dai);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = sof_ipc_probe_init(sdev, sdev->extractor_stream_tag,
> +				 rtd->dma_bytes);
> +	if (ret < 0) {
> +		dev_err(dai->dev, "Failed to init probe: %d\n", ret);
> +		return ret;
> +	}
> 

Should we call snd_compr_free_pages on error case?
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
