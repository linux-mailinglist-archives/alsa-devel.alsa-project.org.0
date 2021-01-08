Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 012EB2EEF64
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Jan 2021 10:21:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 74A7716BA;
	Fri,  8 Jan 2021 10:21:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 74A7716BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610097716;
	bh=lrNGyEkUkMJJBG3LPD8wD+Sh1K/I97Zv5lUje4sDDE8=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=orymVKg11HhFB0mCpU9hf68phPQggjwLcYJc30WnAgUWTkZxiVd7pmXvYcxITuHAq
	 pQ0FzF+Ih4u9A63uSArKxSwDDx8zBjFq4ujhuBJejpTKwU8l+RqKUrHIiKHpRiDkyF
	 88cgQZ8UFb1eJ73ONXTa1t0ibkFjCOXcyDPTt6sU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E46C4F80167;
	Fri,  8 Jan 2021 10:20:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 21FF2F80166; Fri,  8 Jan 2021 10:20:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com
 [148.163.135.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 15445F800FD
 for <alsa-devel@alsa-project.org>; Fri,  8 Jan 2021 10:20:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15445F800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=analog.onmicrosoft.com
 header.i=@analog.onmicrosoft.com header.b="Zw9SP6bS"
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
 by mx0a-00128a01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1089ArD3024733; Fri, 8 Jan 2021 04:20:07 -0500
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
 by mx0a-00128a01.pphosted.com with ESMTP id 35wsv6kxat-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Jan 2021 04:20:07 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OiqtwgUs0qiP8F96/4Zxf8/ilT5F6xzamlQaP1oqT8IUGz0Xlm5ybyOhjakgXC7Ipl+jlGNbgArZxP8T/UmLxXFlZyxZOBKhqu6TW/7FY/l5o4WWX9CCTplyO4LDzRsjnNj4ASh1kDZzkG1PYhNlCLN49rS+WbaihgaJZIEPBAancI5vzsed1rgiVDKNwvW52EGggJJu4U9IyaYb9wK2eRdcE7FXyLzw2ev3Wx3t7Ep506pr3to12XbHrwD+ySh+Rp26IolJdzGzLG5FBbbtrWWlzLG++BKXGH0rNWAnlRsvD9qcLZZdVFEvOrFFC6f/cp8YEUpo/Bj1Ji71ZbTYOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ui7GIXB2atOZTWB/+zLfn0j7jpD7L7+QtYNECIPpQ/I=;
 b=T7n26BqUJE8pNEInwKkW4Vpij4GfIhvKrn/V4gCt7xVzFMF6FuKTaoql3DGc5JE1rvhsnhS+gEZmkJAY1TIQhmYRfuaaeZpVBVbtBOeCu0Q1AsPcmnZzI7SpV1hir5s8YdkhnPpWWjidO0HVOdjtyzGPQvSptt8RYIxe72T3BqqVw/psH5MlFQeSBkL0aPoFwJcl5YNkCXL/RzBKqFMfOoVLNJ30IivkeRPlYdU8npuQktCsiM8SvxxSDiVYUtOVoiE4t10Rg0q0kKqr4BoM9lcVgTheAKA0h7cMduI0QnJZ4DAcgHZj6zFtngW1Yq/tZAJLzeDMfcAoCNLLHymY2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ui7GIXB2atOZTWB/+zLfn0j7jpD7L7+QtYNECIPpQ/I=;
 b=Zw9SP6bSfKC7PqgYxEXwpSI3zryHb2GqwwaaB0FW4jT1+fUYOpAdhl2IRYLNUrx0zQBj9aquHnEFSDKueZt3HljgeqriuNLhoZO1UFSSR2RV9w8912OfC8JtqqGgOjWbpDbg6RFhZ02c+9qY+tzcDjIkRk4NIGu/pydd3CDE36U=
Received: from CY4PR03MB2631.namprd03.prod.outlook.com (2603:10b6:903:74::18)
 by CY4PR03MB3255.namprd03.prod.outlook.com (2603:10b6:910:52::34)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.9; Fri, 8 Jan
 2021 09:19:55 +0000
Received: from CY4PR03MB2631.namprd03.prod.outlook.com
 ([fe80::9ded:292b:eedd:2b0a]) by CY4PR03MB2631.namprd03.prod.outlook.com
 ([fe80::9ded:292b:eedd:2b0a%8]) with mapi id 15.20.3742.009; Fri, 8 Jan 2021
 09:19:55 +0000
From: "Sa, Nuno" <Nuno.Sa@analog.com>
To: Xu Wang <vulab@iscas.ac.cn>, "lars@metafoo.de" <lars@metafoo.de>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "broonie@kernel.org"
 <broonie@kernel.org>, "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com"
 <tiwai@suse.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: RE: [PATCH] ASoC: adau17x1: Remove redundant null check before
 clk_disable_unprepare
Thread-Topic: [PATCH] ASoC: adau17x1: Remove redundant null check before
 clk_disable_unprepare
Thread-Index: AQHW5ZqRwsXhsRyK6kyDZks1e039iKodcp6w
Date: Fri, 8 Jan 2021 09:19:55 +0000
Message-ID: <CY4PR03MB26316C0C18A6541519CF9FA399AE0@CY4PR03MB2631.namprd03.prod.outlook.com>
References: <20210108084456.6603-1-vulab@iscas.ac.cn>
In-Reply-To: <20210108084456.6603-1-vulab@iscas.ac.cn>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?iso-8859-1?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcbnNhXGFwcG?=
 =?iso-8859-1?Q?RhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEy?=
 =?iso-8859-1?Q?OWUzNWJcbXNnc1xtc2ctYTlkNjY5NjYtNTE5Mi0xMWViLThhZjMtZmM3Nz?=
 =?iso-8859-1?Q?c0MjFmY2FlXGFtZS10ZXN0XGE5ZDY2OTY4LTUxOTItMTFlYi04YWYzLWZj?=
 =?iso-8859-1?Q?Nzc3NDIxZmNhZWJvZHkudHh0IiBzej0iMTQ0MyIgdD0iMTMyNTQ1NzExOT?=
 =?iso-8859-1?Q?MxNjc5NjIxIiBoPSJXR0d1cUwvcTY2ZFR4aDEwSG5uMS9Ra0lIcnc9IiBp?=
 =?iso-8859-1?Q?ZD0iIiBibD0iMCIgYm89IjEiIGNpPSJjQUFBQUVSSFUxUlNSVUZOQ2dVQU?=
 =?iso-8859-1?Q?FFb0NBQUNGWXpCc24rWFdBVHpKQk5NM0syTjdQTWtFMHpjclkzc0RBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBSEFBQUFEYUFRQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBRUFBUUFCQUFBQWw5QWhpd0FBQUFBQUFBQUFBQUFBQUo0?=
 =?iso-8859-1?Q?QUFBQmhBR1FBYVFCZkFITUFaUUJqQUhVQWNnQmxBRjhBY0FCeUFHOEFhZ0?=
 =?iso-8859-1?Q?JsQUdNQWRBQnpBRjhBWmdCaEFHd0Fjd0JsQUY4QVpnQnZBSE1BYVFCMEFH?=
 =?iso-8859-1?Q?a0FkZ0JsQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFFQUFBQUFBQUFBQWdBQUFBQUFuZ0FBQUdFQV?=
 =?iso-8859-1?Q?pBQnBBRjhBY3dCbEFHTUFkUUJ5QUdVQVh3QndBSElBYndCcUFHVUFZd0Iw?=
 =?iso-8859-1?Q?QUhNQVh3QjBBR2tBWlFCeUFERUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBUUFBQUFBQUFBQUNBQUFBQUFDZUFBQUFZUUJrQUdrQVh3?=
 =?iso-8859-1?Q?QnpBR1VBWXdCMUFISUFaUUJmQUhBQWNnQnZBR29BWlFCakFIUUFjd0JmQU?=
 =?iso-8859-1?Q?hRQWFRQmxBSElBTWdBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQkFBQUFBQUFBQUFJQUFBQUFBQT09Ii8+PC9tZXRhPg=3D=3D?=
x-dg-rorf: true
authentication-results: iscas.ac.cn; dkim=none (message not signed)
 header.d=none;iscas.ac.cn; dmarc=none action=none header.from=analog.com;
x-originating-ip: [2001:a61:242f:d901:2c8b:e8c3:c73a:ead9]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 88b552af-27ca-4ba2-658e-08d8b3b68ffa
x-ms-traffictypediagnostic: CY4PR03MB3255:
x-microsoft-antispam-prvs: <CY4PR03MB325537104710D504A3A77FF799AE0@CY4PR03MB3255.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1775;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JitGC8w6eJkX3SIeEs8OeVL5YLv1Vkn75wYp4zRzEDOs7wwKT4w+p+U1m6eyEDY05qE5SIXbSxKBboDS4g4gGECH9AFLeh+zPRSkv1a0+/EvgDH3GBgZCL4mcTajnoWLaWfUGIDiiHN9P4v6un1ht/X340c50o/R26/BTpjzxSyFAJY1rTDCcJvfP/sRMDtWnRL+YHxvfAfOT3IytBFDZDBp8dGVIMbHmRCIFZSnnDIo9xbhqDvYkwJZGRAYxVtdhFLtUPmOGsxlzt7yj1eeFe+ieoilDi6FhAHQF99uV1lrGv6PJdV6GJ7p36iqB9B95PUVgMydzSIohY4XfE7IsDdLsXEN9ag4/IQuslbHzTpl5MQ3dyw+l17hTTP9I7Eme6Vpdjud3szaNLGDvzWn6Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR03MB2631.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(136003)(376002)(39860400002)(396003)(71200400001)(478600001)(2906002)(33656002)(55016002)(53546011)(6506007)(5660300002)(52536014)(86362001)(4326008)(186003)(316002)(110136005)(83380400001)(66446008)(8936002)(66476007)(8676002)(66556008)(64756008)(66946007)(76116006)(9686003)(7696005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?ugaTmkaI4Xe91AuC45rMz6xuFpvhg/G7FDJQP67T+ftqxtvfDWMKJxhtwe?=
 =?iso-8859-1?Q?UjtTt19kgu3xFUGUUBikeTfDUGSD15TDdWKPPdEaOw13Q/+TRP1HmPzWZP?=
 =?iso-8859-1?Q?oJ2gmtr/MEeXj9JSexslTu3w4K/aPBuTSYsp39kEkd77h69qNrF2rQ0ng+?=
 =?iso-8859-1?Q?LF/Yq/fXVCfXP/ljlynPo7Y6bC554I684e9+QBPz6bwZ24Oi7pQOZfyAOX?=
 =?iso-8859-1?Q?JBiQK1r1k1pwTGkZIZL+ivjhmNKTc6yRpFo9j6PJ+TrIoO8Rlex2GB8r6u?=
 =?iso-8859-1?Q?SLLd8JHlLLRdw5lGLU43IayeYm+zNSIWhe9Lpaysqsq9gyQKV065TvGEln?=
 =?iso-8859-1?Q?UCCEvbZ7R/NeK98nfa/KEyOLp07Lzd3iBb9cENpoW6vP/veONL0uSOtQGy?=
 =?iso-8859-1?Q?r1xJG5M31ik/fjE0HxipImGGAqxf+bhiBOX4Gm0WKJICvPBPXV8fWHsqYy?=
 =?iso-8859-1?Q?ZoOuxKHOT7bu/YZwtRzSTkyhjxD9tqSkWCKjzZ3ajfXli5qyIkveYsq2UF?=
 =?iso-8859-1?Q?phQQhxyauSvJchqFgex/LNSSa4Zj5GbD2O83a5Ddm/XXgpNhhDRM12v7+E?=
 =?iso-8859-1?Q?/8eylQ5vUzK4S4RCAb1jh+w+8niPZ0wl3VIaOoI5zLwSqxR/Jm2sLE3e4b?=
 =?iso-8859-1?Q?RBpeVNMPoYYYxrmwZIvDwJG06U8JnXLkcREZ+sMBv9ZQnjy7QoZLwvh5lU?=
 =?iso-8859-1?Q?Yrtwz9uE+VoK/W7wT2ByMlMd24MwmHYitzlvzxygnJzMVNQhKFcIQHN7sC?=
 =?iso-8859-1?Q?NPRS1w5CD/CbRyFr4ZfuLKReMeORcwrKcHgkqvxNWZZHCADwA+b160Zf13?=
 =?iso-8859-1?Q?bBFCfuyW8l1fSkhZ9hoeBP1T6uyiuvbfCVgmEv2RkVdgI0jHgCKRRJSPxS?=
 =?iso-8859-1?Q?PmZRomOB7HZI0GnD/7ggkzVR4PT0TgnV7jGxkOnFrHQcA45zb/yqxm8yBG?=
 =?iso-8859-1?Q?5UBPglyKBvSwk+OeoCQl/nfKT0gRejXZq1CWWTGCikLvERHJLmdzqy+Aic?=
 =?iso-8859-1?Q?McN380IBBGvhhRUHPRbW2KgvXp26euJB8kqIITgJ+LBhBPjULHvfPPT5Q0?=
 =?iso-8859-1?Q?fveearI45ZiMOISzPZJ2fLQ=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR03MB2631.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88b552af-27ca-4ba2-658e-08d8b3b68ffa
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2021 09:19:55.2967 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bVVByUhJ6jsspvRKMeXPmE6I/znAsU/4MIfR9HBAqXxM5sJeBdoRItlPeylRVqWbP46tpEHZ7uP858DLKO6yfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR03MB3255
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-08_06:2021-01-07,
 2021-01-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 phishscore=0
 impostorscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0 adultscore=0
 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101080051
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


> -----Original Message-----
> From: Xu Wang <vulab@iscas.ac.cn>
> Sent: Friday, January 8, 2021 9:45 AM
> To: lars@metafoo.de; Sa, Nuno <Nuno.Sa@analog.com>;
> lgirdwood@gmail.com; broonie@kernel.org; perex@perex.cz;
> tiwai@suse.com; alsa-devel@alsa-project.org
> Cc: linux-kernel@vger.kernel.org
> Subject: [PATCH] ASoC: adau17x1: Remove redundant null check
> before clk_disable_unprepare
>=20
>=20
> Because clk_disable_unprepare() already checked NULL clock
> parameter,
> so the additional check is unnecessary, just remove it.
>=20
> Signed-off-by: Xu Wang <vulab@iscas.ac.cn>
> ---
>  sound/soc/codecs/adau17x1.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/sound/soc/codecs/adau17x1.c
> b/sound/soc/codecs/adau17x1.c
> index 30e072c80ac1..546ee8178038 100644
> --- a/sound/soc/codecs/adau17x1.c
> +++ b/sound/soc/codecs/adau17x1.c
> @@ -1095,8 +1095,7 @@ void adau17x1_remove(struct device *dev)
>  {
>  	struct adau *adau =3D dev_get_drvdata(dev);
>=20
> -	if (adau->mclk)
> -		clk_disable_unprepare(adau->mclk);
> +	clk_disable_unprepare(adau->mclk);
>  }
>  EXPORT_SYMBOL_GPL(adau17x1_remove);

This is fine by me but since you are touching this, you could also just rep=
lace the
remove() hook in all the users with devm_add_action_or_reset().

- Nuno S=E1
