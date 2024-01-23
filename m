Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6DB3837810
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jan 2024 01:05:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A0B784D;
	Tue, 23 Jan 2024 01:05:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A0B784D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705968349;
	bh=O71FA2E42UYsMrjWzxnrECf7lu1r2wSaetj5Tv9Gp2w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=A6JLR9PXpq8nst6wHZbip8B51JNnt6cqAzbne1cOcKQQoouvsUE/zSaopFGtjxczo
	 Swyj4p3JstehClQPcEfu5sXkwBN2Nd4l9QjjVYT89pM60jBeBzRAZp0zc/ba/WMufc
	 k8lwrjh1S6LNkHW2ViKKVEuW8CdAu9hu0rAAS6Lk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B5144F80639; Tue, 23 Jan 2024 01:04:25 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D2B4CF805AB;
	Tue, 23 Jan 2024 01:04:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 91706F80610; Tue, 23 Jan 2024 01:04:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20700.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:201a::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A399EF805C2
	for <alsa-devel@alsa-project.org>; Tue, 23 Jan 2024 01:04:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A399EF805C2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Jl0C8XW5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kxHPz513iwNMMis0HNXUxTsn/Xmt6QaN7UsAvOaj8AnEvG2qQBwPZG4rUpjhQalGxqKNRFqY7VL3cN4Db5tk4IO/ywjZpQ3k8Lh7o2I8zU3NJwXQfddnWqvsYNv3bvZz1jW9Q3bILLMlosDuiIhko01eQa1Kbx3s+0FDs9xTuQuuT3XxdEqSr9eIuX5c356xzUpGDxF8xjR+CY2zhthLjUtvqxcRBvxuXq4PwFb/dn5ViKSqYELpMvKzq5sHJrz6K6NFLwT63wikYTppV/cOl0GNoToojfQ1ZKBrB82ku6YDzSrkzE7qLVb94PDRaqRIgLxUIn51MJHxkP6QXV8prg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3nOTCUJGIMIXj+KvwhKMa89nGXFB5+3ZjUbE8AMOrDw=;
 b=OQ4jVFCrmiUGLHOy0bbM7giME7EVMoy4vtyb8/9XC/d3JrgCefH/ar5c9GLZ9K/IV9gvOO0VnOrDeB1f2nMlzbL5MVXOzwyL5E/S9KdZGV6Pr0DB3pLuHCSUbd1ZEuOX9HXPqp8M6jqD3ibXkw7LmZvINGAyvR4rXqGJIreRcrBmDWB92fXTTVTP3xhtYyeVCoo9cC8191LYeC/6/IwQH/gVuuGGCUiWV7XRN0OZ6yUGb9fs0tYrr3o6Wfrb+pCkQySsUaXxx4zzphhM0IokkUwECOWR73lPhEkwbzARibVUbHqZQGiA+uF9caPvpJtjGeKvI7PKoPIZJsaJsjarfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3nOTCUJGIMIXj+KvwhKMa89nGXFB5+3ZjUbE8AMOrDw=;
 b=Jl0C8XW5pbASYddJArUDwjnDACtRJb7mjONEuSMcKJbxWsnrQa1eFEgjI9yfT/NCjHTXkeBCa0TP8VIeTC6fd5/GiVHpHHSkYx8hNZfrOx5hDjPb76eOCeAulGfXorRxQjHskQRkh3hRlvwG6MSDyrCojc7bYJ21fSj5GjT+45g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB5583.jpnprd01.prod.outlook.com
 (2603:1096:400:40::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.20; Tue, 23 Jan
 2024 00:04:11 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4%2]) with mapi id 15.20.7228.020; Tue, 23 Jan 2024
 00:04:11 +0000
Message-ID: <87ede8ud8l.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: =?ISO-8859-1?Q?=22Uwe_Kleine-K=C3=B6nig=22?=
 <u.kleine-koenig@pengutronix.de>,	Daniel Vetter <daniel@ffwll.ch>,	David
 Airlie <airlied@gmail.com>,	Frank Rowand <frowand.list@gmail.com>,	Helge
 Deller <deller@gmx.de>,	Jaroslav Kysela <perex@perex.cz>,	Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,	Liam Girdwood <lgirdwood@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,	Mark Brown
 <broonie@kernel.org>,	Mauro Carvalho Chehab <mchehab@kernel.org>,	Maxime
 Ripard <mripard@kernel.org>,	Michal Simek <michal.simek@amd.com>,	Rob
 Herring <robh+dt@kernel.org>,	Saravana Kannan <saravanak@google.com>,
	Takashi Iwai <tiwai@suse.com>,	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-sound@vger.kernel.org
In-Reply-To: <87jzo0uda2.wl-kuninori.morimoto.gx@renesas.com>
References: <87jzo0uda2.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 04/13] drm: omapdrm: use of_graph_get_next_endpoint_raw()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 23 Jan 2024 00:04:11 +0000
X-ClientProxiedBy: TYCPR01CA0203.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB5583:EE_
X-MS-Office365-Filtering-Correlation-Id: a81c44d6-428e-4b9f-1233-08dc1ba6d3d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ajDALJarV49rnQWAszTYIPZobGHb+sQiB22+4jILiIhT1+TNhWnme54NMlCAl9LZSPijIO4xD1hMpikj/YmTRSWiSDWAqETD0NyA/MYDHSWYXQxNCniO4wQ8/3GYB6rLjhHyOude1oPUz9smy0uJBrVYVn8A+RD4W2ckbu7LPs2t8vcR8x3gd/O5NgGvDI2D9wzxQ5Q3ePIT0jKdM/SFbDRgrO6VeMCjSjTkcL6iYbBWITwTl5OXNE7UZ+LW3XBsKUJGaDtWERHLHtyI716joX7civyovrXSmyp05bZw/1x9DNQcj5MCk8swm2lSEdtVhAgOetiyO+k0j7bvWMMNHlz/At+imAhEjVA7ChkxaOATUqzp9KWzpLUGvjWsLpoGFsxEmXiUQgW7ZnqiR+EIRF+YZopxXZ8z4K7SIEbntpg2Ax0jeTx1PJSWZnEGZL/f0/AZOOnQg4T6Aae6j9CSU9omBPbpWYKweTUYlGvbDnzDO4ABmoCWf+Kd08ipo2uUtqGP9QopYDFmuAQkjGJhcyb26Uz4bX0UD1B/3Efmuh2rrBv9NZN/Z49kABXDvoO9aeML/g/5flyq8610/+NKYNmBtDcaI2uix3gxvyzs41kkCL8+/78Icms238lzAPnTb3xa7gzF/V0BllUDtlvPNg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(376002)(39860400002)(366004)(396003)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(6506007)(2616005)(6512007)(52116002)(26005)(36756003)(38100700002)(86362001)(921011)(38350700005)(41300700001)(83380400001)(5660300002)(7416002)(2906002)(478600001)(110136005)(4326008)(66476007)(6486002)(8936002)(8676002)(66556008)(316002)(66946007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?bwm5/djuUooyBkg+a3xyJ0Xob6xFjY+ixAY/qO22XAkhpCtr0WCRv3MTqMMY?=
 =?us-ascii?Q?SkhEdSztVqOXXzogEeK6Qn5e/x3pESceRQ4j4/9aAnwwaLT9lHJR5YBhQAVi?=
 =?us-ascii?Q?kdZeC3wQ3VbGSDlqEJfhxQsXE/d+IiYxQqCyQo0qY/knk991r+VyVtbIbyhy?=
 =?us-ascii?Q?5SYOK6xMLa0d8rzfFRXrxe+XDzDOH6RzobB4grAnnMm6bK2Q0y5FxZX0Az43?=
 =?us-ascii?Q?KjnHYrPBKpsXZ4IKK9bA2yTGpVqimJmpY75CzFEOBqlMPEKgjpZiTMmj/ni0?=
 =?us-ascii?Q?qqJTZxTlD1Kv9ZkyjCeQSNDZ5TO8ywC203ViAWXjI68gbgEUqeb0wPOqltbH?=
 =?us-ascii?Q?YEOIVdRvIAm1M45PLW/+nidlz419fANzbnJ0v7LeRrYDjA2+M+w3D0FdbRrU?=
 =?us-ascii?Q?SMFoxkZVyZefLbiFVI+OXl4Z6JjdORQCwMGYAebjcS+a3g/T1N+U4B4MBqOm?=
 =?us-ascii?Q?LZE5A65vm9URGWpt60OOvzUbtKgNHbQ9nQJ7QuLlhBoa5oLIq3oik9RLktkO?=
 =?us-ascii?Q?b3qs5xW9hPl7a/MUp5yj7pMlfx8m4knB226JEGG27M5S1/wAVd8SPA88xYGf?=
 =?us-ascii?Q?UjYHMpMAiQtA8e5WgUr2GauhhDZiVCiv/fo7GUqS+vu+Dl4s9XyzpvIO3PXN?=
 =?us-ascii?Q?GjfeRm7K76bEMpIeZhqv+WhPTnDoQiZGqyN/CnutFl8Md5yza4J2LMor22Ee?=
 =?us-ascii?Q?9E4hZGoi0zPhKDptj7qRKhFwras8t/6R4wQtQlySjaqBb2iB6hc8yw4alf9z?=
 =?us-ascii?Q?PiulMb1wmqMperCqL0JqUmn+p0xFF3+jrydWltGGu7lmtGBJiXG2RFZ1K/Pe?=
 =?us-ascii?Q?YxZkMzIEHQnTl/CloA9UQHKTXkYrUpLEUtuGlQ+m8+2aYIg59iKb6O7b4Q36?=
 =?us-ascii?Q?UdZOuWjGUkomyY3bNMppijggalV0aFCIQJ4ugICtQvNXpyX82/U4qpqcYfrw?=
 =?us-ascii?Q?zvYSwNBiTRyzfrqNv2g48cHnm4Xv/6nCLd/Wq+7SJjCEYF2nsBtWyNKiKHtm?=
 =?us-ascii?Q?zEeWDAtIAJwEF0W0Unt7dEW+HWBGEGu6C5f5U9agcLjCdTfOqAVd3v6xHv7y?=
 =?us-ascii?Q?+4xuI6/8nrQXp7v9cTYzHJfqe/bJuBQBU2KMT/c9RDI/q66MyN4nSttW6v5H?=
 =?us-ascii?Q?3BaiAw4sRB0CbUJig3oKozbrl1sRagDoSDZ87xj3H8xlPVvnjIQ1uLwR0z3l?=
 =?us-ascii?Q?OmxF8ZfN7DfSZ9J2xNzEG3lJMf4JhsKdymq3XvRIUFfYUG/og89nQ0ASpB7d?=
 =?us-ascii?Q?CHwsKRTCwJswj5UPcwxfW6tQng5PpSatsE5ONU6BrSJDg7Nk6ZogfKuaG6ou?=
 =?us-ascii?Q?E9i4Km8PIHEr6OT1FEuAoov4B/PRTMiI9qp7qn4apWaAWsiNsXZoEM70WOzs?=
 =?us-ascii?Q?vos8vneM46dQ/bsbVESnAh2ZcXlSTnaxGaVqQNaSpRwjdacM5+IGIa3Hzijk?=
 =?us-ascii?Q?XmY/zZz7Zng8HTcOJdp/SnxgTyuUmE2K5SCayJDrpSL+eNJHHS7mG5X41oo0?=
 =?us-ascii?Q?zfUHfXI/+EhTr59Q+ks+zK+pIuEgOrmPXSRVY7u+oFLmBqYfrvvgrRW73aQL?=
 =?us-ascii?Q?VU6NR/SgtgpRKm25DAaYk5rf+k+G/ApsjI/Z1CjeHx9zdRflhXFM/9EBJoCs?=
 =?us-ascii?Q?L+QzH4NZxRiET0tj7uYpPhg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a81c44d6-428e-4b9f-1233-08dc1ba6d3d0
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2024 00:04:11.3047
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 2URTnd3p/+9F4SnG5Z/xbzw3eBGME0W0h7mZ/PZOVIUDPBmJTBO7kIttIoGu8ZwtoHIL7Jc7K7OiBjBQF5WHCTzILWoAlrhPfJbMBMSOM6I9l+SW1o1zuAjjp+jnb/55
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB5583
Message-ID-Hash: FKBGNMVQJQAROLSMVNA6SSXWJNDJS7OZ
X-Message-ID-Hash: FKBGNMVQJQAROLSMVNA6SSXWJNDJS7OZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FKBGNMVQJQAROLSMVNA6SSXWJNDJS7OZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We can now use of_graph_get_next_endpoint_raw(), let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/gpu/drm/omapdrm/dss/dpi.c | 2 +-
 drivers/gpu/drm/omapdrm/dss/sdi.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dpi.c b/drivers/gpu/drm/omapdrm/dss/dpi.c
index 030f997eccd0..edcf7f4fb149 100644
--- a/drivers/gpu/drm/omapdrm/dss/dpi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dpi.c
@@ -709,7 +709,7 @@ int dpi_init_port(struct dss_device *dss, struct platform_device *pdev,
 	if (!dpi)
 		return -ENOMEM;
 
-	ep = of_get_next_child(port, NULL);
+	ep = of_graph_get_next_endpoint_raw(port, NULL);
 	if (!ep)
 		return 0;
 
diff --git a/drivers/gpu/drm/omapdrm/dss/sdi.c b/drivers/gpu/drm/omapdrm/dss/sdi.c
index 91eaae3b9481..0308dfc00058 100644
--- a/drivers/gpu/drm/omapdrm/dss/sdi.c
+++ b/drivers/gpu/drm/omapdrm/dss/sdi.c
@@ -346,7 +346,7 @@ int sdi_init_port(struct dss_device *dss, struct platform_device *pdev,
 	if (!sdi)
 		return -ENOMEM;
 
-	ep = of_get_next_child(port, NULL);
+	ep = of_graph_get_next_endpoint_raw(port, NULL);
 	if (!ep) {
 		r = 0;
 		goto err_free;
-- 
2.25.1

