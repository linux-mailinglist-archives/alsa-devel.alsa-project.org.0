Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2365F53C8D6
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jun 2022 12:38:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B56F71828;
	Fri,  3 Jun 2022 12:37:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B56F71828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654252680;
	bh=fu0VpG2w5b1J1zZ7VGT611InjH17yc0ZFiJvkkeHhxA=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pwfTsln57P2yyfopvZroEDa0U9JqHErjradGisT3szn2MLIPP948S1g/GGcP69mMa
	 mpL5ggy24BVHlrkYfDptn4D4PoWyim9xMYD0JmCH80Rnx1nUbAs1jQjlWxeGfJbXu+
	 P2kKelZZHYiNiLaH3uooT8lNn+CTAvijSKUr6RbY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 393F0F804D1;
	Fri,  3 Jun 2022 12:37:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D8D93F80236; Thu,  2 Jun 2022 17:06:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0655F80149
 for <alsa-devel@alsa-project.org>; Thu,  2 Jun 2022 17:06:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0655F80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="q/uILHg/"; 
 dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com
 header.i=@cirrus4.onmicrosoft.com header.b="ADA0Ec43"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 252CtDDf010388;
 Thu, 2 Jun 2022 10:06:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=PODMain02222019;
 bh=T9OYWE3ks9CTXdgkYcmuekWmQcdv+f36vn+7+uKrWEg=;
 b=q/uILHg/aTS/CrynBj9MmNIub4emdaF81fJftagSPZmccu+evylVO+gkVTch9lzBvoNF
 77aTOyfzz5N1BLCdX0yedls8mhE9l6pQHwCztzNU87Jl+PbqdasvBg+jdgWINmsEI4cK
 lyvae5jnkMbIa+gLsygaHhWWQYWUexI0CN+MretkBL/nekBh39JQB4nv46uQciFtUBrk
 YuYmSRNgQ5r/JmDZriDJVfYgpCgYpx/NJK16Ez+55PJp1eUkwU4C6fd4qsp/9EGaW5nz
 vzclRY67wUfT9wn/oGzMrIopK2KMPEO2yHR/7xG/e9fytVOTspSScCZ3bbTglSYr4f3N sQ== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3gbh51nm3f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jun 2022 10:06:30 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=erHWByL4G2UrqEcdXCVSq/Z8c5iwUqYmrORQssPnk4X7biCgGVZX4CF8F8YJJsSIR7qN+uRUQmwSe567DoEyIsVPCyxoINECcyyo5roAbQ5nHHWHgmYi+gVQwHNkQuEdDdIdR06eyvTcG4wuSzRqssrLtMX0WmRzt9cYLf98YT6ArnJQy4DMzaMUAxOEQTvbtZDplXKcwZekVIAxS99nHvctU0bL4Y1+zWW97OIhAG6QVSUu6nTlyV8/G8yafhzEezV3ZlVeyAMRM3MvUv9vR0Q4omy8P2/C4xBmh95/YWEOsZgTfOouM2lJvEuYprSAeawbl3tceI8Bm8C8X4vY6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T9OYWE3ks9CTXdgkYcmuekWmQcdv+f36vn+7+uKrWEg=;
 b=bO7jNrA7WjhtmRa5XCB/XnxYKLcsyQ76l6+KBuD3FxBV3Nlqj+PcGkP+pvagYf6YWBEmhGnzALyAY3CYqRfpcklSriZAkdLqHSF8UPJaJASs7mvQ3elRx6eyL9BfvRJbRIy1Pg49qlPUOqyB3gkgjGUrhLbPKGYOv58GKWjsD4Ju2kl6SK/eO8nGoyqWGzqu0CGg42ejFsxn2e+zvjEXnKtSDPFE0ofwEh52fPRcwgviJ/E+yRx65nhtH8GHk2ejHWdM9sbjXwOQQO2djAwg1b+MUnHvHXfRXefgbrFF0AXHxgzpIYe9ROVxucyf6lwjvE5v0QVjigke3L8yyqbHtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cirrus.com; dmarc=pass action=none header.from=cirrus.com;
 dkim=pass header.d=cirrus.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T9OYWE3ks9CTXdgkYcmuekWmQcdv+f36vn+7+uKrWEg=;
 b=ADA0Ec43kXse7hlsc2iLc9BIe07T4P2IvMCHFXAPxfDIfCO0B+Zrex9M+JaZ4YR0eqG7xE9wl7MdEJW1vuN56Kp6tloJrZDDTQxQg+xQDoJEFvVjO5Pqprxtj1trMqyXcjowID68uJIrBXx5Bp0Wcsm6r3J4p0imBMduicLrH2M=
Received: from PH0PR19MB5177.namprd19.prod.outlook.com (2603:10b6:510:78::23)
 by DM6PR19MB2908.namprd19.prod.outlook.com (2603:10b6:5:13e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Thu, 2 Jun
 2022 15:06:28 +0000
Received: from PH0PR19MB5177.namprd19.prod.outlook.com
 ([fe80::c593:be0f:715d:fa19]) by PH0PR19MB5177.namprd19.prod.outlook.com
 ([fe80::c593:be0f:715d:fa19%8]) with mapi id 15.20.5314.013; Thu, 2 Jun 2022
 15:06:28 +0000
From: Xiang Liu <Xiang.Liu@cirrus.com>
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: Re: [PATCH v2] ASoC: Intel: cirrus-common: fix incorrect channel
 mapping
Thread-Topic: [PATCH v2] ASoC: Intel: cirrus-common: fix incorrect channel
 mapping
Thread-Index: AQHYdkDrfdL0C7+YBkib+EV1vbQgYa08KXcAgAAN5xE=
Date: Thu, 2 Jun 2022 15:06:28 +0000
Message-ID: <PH0PR19MB51775222DDCE1AC8782E67529EDE9@PH0PR19MB5177.namprd19.prod.outlook.com>
References: <20220602051922.1232457-1-brent.lu@intel.com>
 <53e13af2-d279-372c-0b5b-fdf3277e0231@linux.intel.com>
In-Reply-To: <53e13af2-d279-372c-0b5b-fdf3277e0231@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9a83df9a-1959-4d87-ce67-08da44a9782c
x-ms-traffictypediagnostic: DM6PR19MB2908:EE_
x-microsoft-antispam-prvs: <DM6PR19MB29089854889A4C929D2B1F5B9EDE9@DM6PR19MB2908.namprd19.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pNb+zQmfUEtJW1Syu5Q4S70QkKI/vC+Edg/wn4LLVsbgtjpMSHAzysu7Az1hBwXG3vO0ue+O0fumrG4ALTeXV4WWDvO+miYyX30Iso6z/E/0sTv/geqNrpKR+lvhOSp4vH/X+QGjYlzgGrBJCd953jTTkGDWDrfkSrCVd5kFVZwYBSE73cvepZnwxmKd4h8xN6gEa3+O7JR1RGdA77nA/s5rSvvZtvjcaHQqsY/awX/ujFY7QoVbZVqrnMVPGvwzvLU0uw0Bc5w4YzwGiid7KYwTEKUNcEuGolhfs6zrKC7msAtZFi0T75drsMDoaiD5u2Edrs6joDyTh1xc9I0uduwWJhyrGukU+9nxTZHnEr5Gz4mY6Uom5oYPZASZMOv4NfB5aqE32SZobhgjtpKWI+lhk13Tz1LkImGatdngYZ66e03TCfHuGKWR4Q7hM5rj2phnUUCqiHLeUUAZOkgcbBNkVcME2LFsUvq9ygxq/EIYmQ5pjJMj2bSnT+HV0yxzna7fXhbngFqvDY4hvjoM+7phvHvvPYYRwJMkbGUJ8iBdUf0HY7hyrpJWIbrW6KaBW6dr2lFlRoaU6aZ04jhRS7+u6Lo04b5GWNS9ldhcIwRyFHQACDPuzqacCz6qXoT6PnI8W8nBoMGNc0kK/yVRLwh81/7wjLAkeXuP9//k3hV/2J+JsAHZKFKIYNm5wOS1X9cRcZ0qpwdPqeiSYUczQA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR19MB5177.namprd19.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(64756008)(8676002)(4326008)(122000001)(66556008)(38070700005)(66946007)(38100700002)(8936002)(52536014)(5660300002)(71200400001)(2906002)(53546011)(66476007)(9686003)(7696005)(6506007)(508600001)(6916009)(76116006)(26005)(83380400001)(91956017)(316002)(186003)(86362001)(33656002)(55016003)(66446008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?s5uiG/1xJv+3ah/ZNNi2oXWY4rJxcM6sN2HTWuGWYoGu/WK/x9NYE0aZliSK?=
 =?us-ascii?Q?eps+Q4seASTKjL4i6xaPTr0NX9cD2HSmJTGtSpS7T8TWH/4qoEtIHMhJtSBK?=
 =?us-ascii?Q?eghq9PEwsJ9Yu130ujO5R/GQFRBOCY+4xlv/6IQyasH9aGi3tVnmOkpN1xFY?=
 =?us-ascii?Q?nBqFaIf6CuuuSzAoG2DPifiJBoZ9akfFvJdFB+l/0CfOC4Myl9oAikfr90BF?=
 =?us-ascii?Q?OX2NXFJnSpQBUk36sMYU/Dh2L2HG1Bqi/YiH4zG2rUqmbwMj7qXxiOPXFp4g?=
 =?us-ascii?Q?S/dpsURhN61e86IYWbzNJvNxIiEiEuzKliVpI4nL70yYMMPrNZAqPUz2jrxz?=
 =?us-ascii?Q?HsKzvRgtV/GGClkVs46VE/uDMKXXj/qI3WBqfC03PtNaEEijv8Eh68+aBe7W?=
 =?us-ascii?Q?ZvUoYncWf6pR2EBVQCBRTdWZdg6FZ/7csyvTCBArmKEaQpZa+lnmHxJQeUL8?=
 =?us-ascii?Q?OkSD2Vmpwpci0Jz5qbU/KellWglMZCGJtz9TV+7kf88iySPGl2aVormTNTVe?=
 =?us-ascii?Q?cFqe1KBG+bEPKVhD8kEreh1Z24uyzgMVZyv3R7ZBRvI2I/gCqxSGwlqpmvPc?=
 =?us-ascii?Q?fQZKESPyu4+nsqiBvXMe4Gn4JEaUjoed0UbfX5lk5RZoHvHTtfD+SSQ/v1Sh?=
 =?us-ascii?Q?frRyigGSfCOtOVsbG1DzD8bT3HYIveA+U9k9S4lb4lY2tNdgSVoawDts9GSE?=
 =?us-ascii?Q?xxz6SEzxuTmEEJIGN0hToO0rqxn5GeZlhLqBymR9Cku2QqX3gCKy31tyxzGF?=
 =?us-ascii?Q?MNzljdyQIDtrU4UpFQ9sxrnzqPzRmuOcjMcdVHgI1ABDDMEFx7arHsu7oYJa?=
 =?us-ascii?Q?8P7CygxIiq+8biTqEaPeIeiTqn+LZXwM/MPgg3hOfp5sQZzaVN4+dE7dNtrb?=
 =?us-ascii?Q?cMwmVrj9n5tlSvMVUjbePvkav8pt7efq6Hjey9vSZwSmJ6CgiCki/GaFooIp?=
 =?us-ascii?Q?VZoy1QGDcJdf5HzAE/w7xtfkNPztnnMHJWN50KaoMSg3GxltjZTU/rLdYxCE?=
 =?us-ascii?Q?cf69waOXuhWkKmFrmlSGlvTVO+nvcrYrdvaFtCvAjEkknK6v24lAV8Ldajhh?=
 =?us-ascii?Q?SsbQaLNQ2zhIAtdDpEU1no2Co1gZSCfM7YkEHMf90YppkZBv82YDjhEHhka7?=
 =?us-ascii?Q?ERQh9Thn8Vj/2CeoyoGrXjw15Uz0bnUAepnZlQV0wkMq+Pz+Ua6DByOBGXaB?=
 =?us-ascii?Q?G8RaY2Ewjbdr0xVpwin0qP3X+G76Hnr4X4ySeTP4/iolTqdtpTbbTpM+6vkd?=
 =?us-ascii?Q?0a9a/YK661A7Gzd1QzBqaeoUjNHGjg3ADlqWYSQxE1izcQFZEjdKE76XxTXy?=
 =?us-ascii?Q?puA5lFCDDUecAUUzHFeuLGWEAyaz+BwXCIe/IpAQuY817dCk+nYm3zjyJ/OD?=
 =?us-ascii?Q?yJdmFMCxSW3gMh9bpxydY6oA6TYmT+7z1KbIjPXMWt5iVTWZzqVHpw39dE/d?=
 =?us-ascii?Q?eASWJNy5FEOPUUUt5ydLKfaElkwAl8gVi0JkRfSRsHyhA2Bk35oCjKK5qg2a?=
 =?us-ascii?Q?WkROYcAheTUB3WZWvV9lH2oOXdLSN3o3n4dNqizPgFOmLtnaVzIgvwTDUu7U?=
 =?us-ascii?Q?lreittbDH6k4ekyo5QfWwG4pWqdtyQ+rFk/kinLHA6BBaxcZtu4bBL7+7JiD?=
 =?us-ascii?Q?3V/JezJn1bwB53ucTpDXEL8NqwNAJKAE/bKCxEXWfvM3NaAsvid9jmcxC821?=
 =?us-ascii?Q?FAY0a1X0hEGe6FOibBIBMQ26MKfwL2XQyhTZxr5CUr4mfeleIu5ab2GpSka6?=
 =?us-ascii?Q?MLWfVnVDLMY7uKeAb+3CKBQ5qF9lJCQ=3D?=
MIME-Version: 1.0
X-OriginatorOrg: cirrus.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR19MB5177.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a83df9a-1959-4d87-ce67-08da44a9782c
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2022 15:06:28.2241 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oN9CM29fiYn5SjfYidq4Ka/JqHy4AeeuKfMKldZgflWR/+FV10HozGZiqeVKOaajbXBR3unwjwtvcUTE2gxmTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR19MB2908
X-Proofpoint-GUID: c8Lp1tZSq_Wk0VkfBcJ-rBr41ku8kCa5
X-Proofpoint-ORIG-GUID: c8Lp1tZSq_Wk0VkfBcJ-rBr41ku8kCa5
X-Proofpoint-Spam-Reason: safe
X-Mailman-Approved-At: Fri, 03 Jun 2022 12:37:02 +0200
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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

git send-email \
    --in-reply-to=3D53e13af2-d279-372c-0b5b-fdf3277e0231@linux.intel.com<ma=
ilto:--in-reply-to=3D53e13af2-d279-372c-0b5b-fdf3277e0231@linux.intel.com> =
\

    --cc=3DStefan.Binding@cirrus.com<mailto:--cc=3DStefan.Binding@cirrus.co=
m> \

    --cc=3DStuart.Henderson@cirrus.com<mailto:--cc=3DStuart.Henderson@cirru=
s.com> \

    --cc=3DVitaly.Rodionov@cirrus.com<mailto:--cc=3DVitaly.Rodionov@cirrus.=
com> \


Best Regards

--Xiang Liu
Email:   xiang.liu@cirrus.com<mailto:xiang.liu@cirrus.com>
Mobile: +86 13810448973



From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Date: Thursday, June 2, 2022 at 22:23
To: Brent Lu <brent.lu@intel.com>, alsa-devel@alsa-project.org <alsa-devel@=
alsa-project.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, linux-kernel@vger.kernel.o=
rg <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>, Jie Yang =
<yang.jie@linux.intel.com>, Liam Girdwood <liam.r.girdwood@linux.intel.com>=
, Mark Brown <broonie@kernel.org>, Xiang Liu <Xiang.Liu@cirrus.com>, Bard L=
iao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH v2] ASoC: Intel: cirrus-common: fix incorrect channel m=
apping
Caution:  EXTERNAL email



On 6/2/22 00:19, Brent Lu wrote:
> From: xliu <xiang.liu@cirrus.com>
>
> The default mapping of ASPRX1 (DAC source) is slot 0. Change the slot
> mapping of right amplifiers (WR and TR) to slot 1 to receive right
> channel data. Also update the ACPI instance ID mapping according to HW
> configuration.
>
> Signed-off-by: xliu <xiang.liu@cirrus.com>
> Signed-off-by: Brent Lu <brent.lu@intel.com>

This v2 looks much better and self-explanatory. Thanks!

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
>  sound/soc/intel/boards/sof_cirrus_common.c | 40 +++++++++++++++++++---
>  1 file changed, 36 insertions(+), 4 deletions(-)
>
> diff --git a/sound/soc/intel/boards/sof_cirrus_common.c b/sound/soc/intel=
/boards/sof_cirrus_common.c
> index e71d74ec1b0b..f4192df962d6 100644
> --- a/sound/soc/intel/boards/sof_cirrus_common.c
> +++ b/sound/soc/intel/boards/sof_cirrus_common.c
> @@ -54,22 +54,29 @@ static struct snd_soc_dai_link_component cs35l41_comp=
onents[] =3D {
>        },
>  };
>
> +/*
> + * Mapping between ACPI instance id and speaker position.
> + *
> + * Four speakers:
> + *         0: Tweeter left, 1: Woofer left
> + *         2: Tweeter right, 3: Woofer right
> + */
>  static struct snd_soc_codec_conf cs35l41_codec_conf[] =3D {
>        {
>                .dlc =3D COMP_CODEC_CONF(CS35L41_DEV0_NAME),
> -             .name_prefix =3D "WL",
> +             .name_prefix =3D "TL",
>        },
>        {
>                .dlc =3D COMP_CODEC_CONF(CS35L41_DEV1_NAME),
> -             .name_prefix =3D "WR",
> +             .name_prefix =3D "WL",
>        },
>        {
>                .dlc =3D COMP_CODEC_CONF(CS35L41_DEV2_NAME),
> -             .name_prefix =3D "TL",
> +             .name_prefix =3D "TR",
>        },
>        {
>                .dlc =3D COMP_CODEC_CONF(CS35L41_DEV3_NAME),
> -             .name_prefix =3D "TR",
> +             .name_prefix =3D "WR",
>        },
>  };
>
> @@ -101,6 +108,21 @@ static int cs35l41_init(struct snd_soc_pcm_runtime *=
rtd)
>        return ret;
>  }
>
> +/*
> + * Channel map:
> + *
> + * TL/WL: ASPRX1 on slot 0, ASPRX2 on slot 1 (default)
> + * TR/WR: ASPRX1 on slot 1, ASPRX2 on slot 0
> + */
> +static const struct {
> +     unsigned int rx[2];
> +} cs35l41_channel_map[] =3D {
> +     {.rx =3D {0, 1}}, /* TL */
> +     {.rx =3D {0, 1}}, /* WL */
> +     {.rx =3D {1, 0}}, /* TR */
> +     {.rx =3D {1, 0}}, /* WR */
> +};
> +
>  static int cs35l41_hw_params(struct snd_pcm_substream *substream,
>                             struct snd_pcm_hw_params *params)
>  {
> @@ -134,6 +156,16 @@ static int cs35l41_hw_params(struct snd_pcm_substrea=
m *substream,
>                                ret);
>                        return ret;
>                }
> +
> +             /* setup channel map */
> +             ret =3D snd_soc_dai_set_channel_map(codec_dai, 0, NULL,
> +                                               ARRAY_SIZE(cs35l41_channe=
l_map[i].rx),
> +                                               (unsigned int *)cs35l41_c=
hannel_map[i].rx);
> +             if (ret < 0) {
> +                     dev_err(codec_dai->dev, "fail to set channel map, r=
et %d\n",
> +                             ret);
> +                     return ret;
> +             }
>        }
>
>        return 0;
