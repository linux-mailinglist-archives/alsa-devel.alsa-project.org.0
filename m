Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 597DC67A31
	for <lists+alsa-devel@lfdr.de>; Sat, 13 Jul 2019 14:59:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5D32166B;
	Sat, 13 Jul 2019 14:58:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5D32166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563022763;
	bh=5idNN2IJNQgK8ClP2Kg+M2qoMYjvDe69NM1516kJEgo=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NzEFxpUOQHqIl3bpRPymcmzgVxVxLp4Mr7z+CyH7iqAMKOUEdttOIpofwKgSg5thI
	 IU+X9hpg2ICPS7+h1F//BDHtr/o9mxD+IOUTaqsYMtvl71izinbUiHC8Fx3caPEPRF
	 /u2zuGo3J3JC6nbUVu2nkj8knwvnnIF/warSXRZA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CCD6EF800E1;
	Sat, 13 Jul 2019 14:57:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 79B26F802BE; Sat, 13 Jul 2019 14:57:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20094.outbound.protection.outlook.com [40.107.2.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5FE34F800E1
 for <alsa-devel@alsa-project.org>; Sat, 13 Jul 2019 14:57:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5FE34F800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=toradex.com header.i=@toradex.com
 header.b="PqDZqhap"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QDVehqKB2ZeByEDqJifLLuCgz6CWavLqLW1mayy8FLQ=;
 b=PqDZqhapp246jfDkIC6KQSmB8cN+WqjAoFtZz2ou7HISHeon9BFjVGlFN242Zc6DT7wlNPLjt8ZOdOIM15zWMwSaQM03zyLuUVRdEZZ1fFdsERC933kTgL935eVBvlepyF668TV83xSIA7wL20YpHWXa0f4j6jaDv6R4p99jlaw=
Received: from AM6PR05MB6535.eurprd05.prod.outlook.com (20.179.18.16) by
 AM6PR05MB6085.eurprd05.prod.outlook.com (20.179.2.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.19; Sat, 13 Jul 2019 12:57:31 +0000
Received: from AM6PR05MB6535.eurprd05.prod.outlook.com
 ([fe80::c860:b386:22a:8ec9]) by AM6PR05MB6535.eurprd05.prod.outlook.com
 ([fe80::c860:b386:22a:8ec9%6]) with mapi id 15.20.2073.012; Sat, 13 Jul 2019
 12:57:31 +0000
From: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
To: Arnd Bergmann <arnd@arndb.de>
Thread-Topic: [PATCH] ASoC: audio-graph-card: fix type mismatch warning
Thread-Index: AQHVOXqIQvGOhqOHmkesxvTHSugavQ==
Date: Sat, 13 Jul 2019 12:57:31 +0000
Message-ID: <CAGgjyvHBfyviNofKay47TGG7EGBHQDSiq78y+=FGtZc3eZKpOw@mail.gmail.com>
References: <20190712085605.4062896-1-arnd@arndb.de>
In-Reply-To: <20190712085605.4062896-1-arnd@arndb.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR01CA0073.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:10e::14) To AM6PR05MB6535.eurprd05.prod.outlook.com
 (2603:10a6:20b:71::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=oleksandr.suvorov@toradex.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-gm-message-state: APjAAAUzu4kRw7o3FLU8vBN3NbkeGaHuDlBghkuU5ctKx2YOcSgmLTrc
 lrscxnoQQIHKFRYiivSjS7jyp1qXyY8L6XK4fQw=
x-google-smtp-source: APXvYqyHz3vONT9peljHK2/8BqeWnne53tQZ8KrmYJI1MCCGu8ZBTA5UIWzcoweVpj/wtZYxfsc451saVMcvxldSHPg=
x-received: by 2002:a17:906:25c5:: with SMTP id
 n5mr12260286ejb.195.1563022191006; Sat, 13 Jul 2019 05:49:51 -0700 (PDT)
x-gmail-original-message-id: <CAGgjyvHBfyviNofKay47TGG7EGBHQDSiq78y+=FGtZc3eZKpOw@mail.gmail.com>
x-originating-ip: [209.85.208.53]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 68f0a6ff-49eb-4ed4-4378-08d70791aadc
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM6PR05MB6085; 
x-ms-traffictypediagnostic: AM6PR05MB6085:
x-microsoft-antispam-prvs: <AM6PR05MB608572A238C51335212ADADFF9CD0@AM6PR05MB6085.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2331;
x-forefront-prvs: 00979FCB3A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(979002)(4636009)(396003)(39840400004)(366004)(376002)(136003)(346002)(199004)(189003)(8936002)(44832011)(486006)(446003)(66946007)(76176011)(11346002)(476003)(386003)(6506007)(8676002)(2906002)(81166006)(81156014)(26005)(53936002)(9686003)(6512007)(99286004)(186003)(52116002)(14444005)(66066001)(7736002)(55446002)(305945005)(229853002)(86362001)(61266001)(102836004)(256004)(68736007)(316002)(64756008)(66556008)(66446008)(71190400001)(71200400001)(3846002)(6116002)(66476007)(14454004)(61726006)(54906003)(6246003)(107886003)(6436002)(6862004)(498394004)(95326003)(25786009)(478600001)(4326008)(6486002)(5660300002)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR05MB6085;
 H:AM6PR05MB6535.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: toradex.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: n+YwWaPtcKNvUJmAyrmQs21sNAk0cXYDvya+7wtI1Vt8Mc8pE0zzIfNx3R8Ik70kHsagJ3Z7iY6DZxGszHcZf4F5u2sc9NQkXqcgAk87RyYYIAD6rPuifxDGGTlRnxz6H8IJDhmPXNic9ez+7eL2hGe84S0eeT7ZdxHpBRPxtjWhOx8zMzSM9VLyJDvShUWUZOcEkzKHOlLOpxtd+L9yuOwXgqYX9MM526eyo9G4g6NO17VZWEaulfMiOUm6SPCgPxyCERE51IP2Po9+b/DI1nSl5jRx4g8ClUh0dpT4MifvZCNBRjMcy5JsR0KxDOVoFCkoU28e95y9gwUkwsRs9ZH5gIuPkhf+A49gs+8CXMIPfWX0mbcOC6g9tRthMVIS/DiJhhj8vXqjf4JzJCY+Bk+FvwdcIonLBqO1HEJd3lA=
Content-ID: <ED99BCD10C91104996C9EF5B4D17273D@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68f0a6ff-49eb-4ed4-4378-08d70791aadc
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jul 2019 12:57:31.5248 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oleksandr.suvorov@toradex.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR05MB6085
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Wen Yang <wen.yang99@zte.com.cn>
Subject: Re: [alsa-devel] [PATCH] ASoC: audio-graph-card: fix type mismatch
	warning
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

On Fri, 12 Jul 2019 at 11:57, Arnd Bergmann <arnd@arndb.de> wrote:
>
> The new temporary variable is lacks a 'const' annotation:
>
> sound/soc/generic/audio-graph-card.c:87:7: error: assigning to 'u32 *' (aka 'unsigned int *') from 'const void *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
>
> Fixes: c152f8491a8d ("ASoC: audio-graph-card: fix an use-after-free in graph_get_dai_id()")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>

> ---
>  sound/soc/generic/audio-graph-card.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
> index c8abb86afefa..288df245b2f0 100644
> --- a/sound/soc/generic/audio-graph-card.c
> +++ b/sound/soc/generic/audio-graph-card.c
> @@ -63,7 +63,7 @@ static int graph_get_dai_id(struct device_node *ep)
>         struct device_node *endpoint;
>         struct of_endpoint info;
>         int i, id;
> -       u32 *reg;
> +       const u32 *reg;
>         int ret;
>
>         /* use driver specified DAI ID if exist */
> --
> 2.20.0
>


-- 
Best regards
Oleksandr Suvorov

Toradex AG
Altsagenstrasse 5 | 6048 Horw/Luzern | Switzerland | T: +41 41 500
4800 (main line)
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
