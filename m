Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 589CA43489
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2019 11:14:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD46717F9;
	Thu, 13 Jun 2019 11:13:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD46717F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560417273;
	bh=XBLMss/USCrL8wo+Ve3bnHFjdh9pVNFvJ6HJnKyHwdk=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gc+S2GIU9/azoj+zmqhqA0Yc0bwpbWtiRQljwMz84qvCBxcjYc+K7Qpg5Jfxy81/7
	 0uFcgl0mOnxBzXCB+0gXzxwtBnKjUiCOOZRzeaqDV82/sFeHVc/KUsFZ6uSPd3Vk1X
	 g5yU2Ik2yjps0YQ76QS/bg8GHX1TGfMKfaFZkIKk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D409EF89738;
	Thu, 13 Jun 2019 11:11:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CB185F8970F; Thu, 13 Jun 2019 11:06:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00105.outbound.protection.outlook.com [40.107.0.105])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F218EF80794
 for <alsa-devel@alsa-project.org>; Thu, 13 Jun 2019 11:06:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F218EF80794
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=toradex.com header.i=@toradex.com
 header.b="hW6JuzoL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XmkQyMRrS+WeHQ6vK9H+Cu7FwZrb/8eyGFDbIh/uw8k=;
 b=hW6JuzoLELo5AaljochyWZlSw9sK1VS/7u+i5M61FHKiiVSt3ZI4lPZn8zuU8JhlMkGMVPB510VM/vjHcAYMFoVQ9wwnwM2OSQoVv+qr62ghqxAF3kD6EzbSILmlbdiDmWfrK6ya3YhKE8T1nkjB67P3XENKclRMRXe/Vec6bbE=
Received: from VI1PR05MB6477.eurprd05.prod.outlook.com (20.179.26.150) by
 VI1PR05MB5599.eurprd05.prod.outlook.com (20.177.203.31) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.10; Thu, 13 Jun 2019 09:06:23 +0000
Received: from VI1PR05MB6477.eurprd05.prod.outlook.com
 ([fe80::8437:8389:cec3:452c]) by VI1PR05MB6477.eurprd05.prod.outlook.com
 ([fe80::8437:8389:cec3:452c%6]) with mapi id 15.20.1965.017; Thu, 13 Jun 2019
 09:06:23 +0000
From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
To: "festevam@gmail.com" <festevam@gmail.com>, Oleksandr Suvorov
 <oleksandr.suvorov@toradex.com>
Thread-Topic: [PATCH v1 5/6] ASoC: Define a set of DAPM pre/post-up events
Thread-Index: AQHVD9h2n65i+TZ/JkawFJN4s0sAMaaZbtqA
Date: Thu, 13 Jun 2019 09:06:23 +0000
Message-ID: <dbab9b60e46dde17a3dd0bd05a160d14e9e63860.camel@toradex.com>
References: <20190521103619.4707-1-oleksandr.suvorov@toradex.com>
 <20190521103619.4707-6-oleksandr.suvorov@toradex.com>
In-Reply-To: <20190521103619.4707-6-oleksandr.suvorov@toradex.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=marcel.ziswiler@toradex.com; 
x-originating-ip: [46.140.72.82]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cb99e40f-5267-4cef-8d91-08d6efde68cb
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:VI1PR05MB5599; 
x-ms-traffictypediagnostic: VI1PR05MB5599:
x-microsoft-antispam-prvs: <VI1PR05MB5599968CDFFEE3EFA7D0E3E4FBEF0@VI1PR05MB5599.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1227;
x-forefront-prvs: 0067A8BA2A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(376002)(39850400004)(366004)(346002)(136003)(189003)(199004)(305945005)(186003)(118296001)(6636002)(11346002)(229853002)(26005)(6486002)(316002)(71190400001)(7736002)(71200400001)(54906003)(86362001)(478600001)(110136005)(14454004)(3846002)(6246003)(81156014)(99286004)(36756003)(76176011)(8676002)(6506007)(53936002)(476003)(6512007)(256004)(5660300002)(25786009)(4744005)(81166006)(6436002)(8936002)(66446008)(66066001)(4326008)(2501003)(66556008)(66476007)(64756008)(68736007)(66946007)(76116006)(44832011)(2616005)(2906002)(6116002)(486006)(446003)(102836004)(73956011);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR05MB5599;
 H:VI1PR05MB6477.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: toradex.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: A1zjQP3EgXEWSUNDuWJjXB2hJbTrC6nfoB8dJV8R9EXiY9RLT8Oh3rSDlw3nnXndVhWe7ghz60IswSS2hInT3DZLmfNYlelocJzos2zrQwjAjtHbYWXah+BAdZ433GivxPtFzjJkBzhq58X0zNbw41yGlZg88TUwAEUvF7l7OccgcIDuk6lcgxwVGWxH1Pz0VhFGhoR0JeuPwWVp8KahgxGhLXYZ3AdZYjVIjJ0Snxy13bWyE4ne2xaAx+5WnI7YReQzh7MGbn6PHqutjlFds8QbIpeJHUbasZRizXJ4Kzsi0ezWzfptR0+OA7Mrz5xS+HyeytAy8K5U/gDZNZX1Kb3sRiW4phkqV6bhUe6jwiSotLFl7+4PtApcirlQBaJCaJInbx4vlynBSxA+UlDjcMDbYJ0uPhyiTXWUKtdjwJg=
Content-ID: <D5430796D926C44B9A1666479D72A936@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb99e40f-5267-4cef-8d91-08d6efde68cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2019 09:06:23.8653 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: marcel.ziswiler@toradex.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB5599
Cc: Igor Opaniuk <igor.opaniuk@toradex.com>, "tiwai@suse.com" <tiwai@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [PATCH v1 5/6] ASoC: Define a set of DAPM
	pre/post-up events
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

On Tue, 2019-05-21 at 13:36 +0300, Oleksandr Suvorov wrote:
> Prepare to use SND_SOC_DAPM_PRE_POST_PMU definition to
> reduce coming code size and make it more readable.
> 
> Signed-off-by: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>

Reviewed-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

> ---
> 
>  include/sound/soc-dapm.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git include/sound/soc-dapm.h include/sound/soc-dapm.h
> index c00a0b8ade08..6c6694160130 100644
> --- include/sound/soc-dapm.h
> +++ include/sound/soc-dapm.h
> @@ -353,6 +353,8 @@ struct device;
>  #define SND_SOC_DAPM_WILL_PMD   0x80    /* called at start of
> sequence */
>  #define SND_SOC_DAPM_PRE_POST_PMD \
>  				(SND_SOC_DAPM_PRE_PMD |
> SND_SOC_DAPM_POST_PMD)
> +#define SND_SOC_DAPM_PRE_POST_PMU \
> +				(SND_SOC_DAPM_PRE_PMU |
> SND_SOC_DAPM_POST_PMU)
>  
>  /* convenience event type detection */
>  #define SND_SOC_DAPM_EVENT_ON(e)	\
> -- 
> 2.20.1
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
