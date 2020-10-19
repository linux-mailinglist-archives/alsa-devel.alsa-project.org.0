Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6852B29285B
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Oct 2020 15:40:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A1AB1723;
	Mon, 19 Oct 2020 15:39:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A1AB1723
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603114847;
	bh=iYby/wboJeGZ8LJxsROl//q+hIF/9Qqm4KMWOPvglr8=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mvS0bg+ba7iAWPQfpmXpQS84e3L8H8C4x5py0ND0XrU9AZfKgVmFc1Kcp6x+3GnCp
	 QQ99vXNTW9RhikpA9TJXKFTwbWOSWzk82qSbHAJZ2nKh1WoAdDfQMaC9gzspXcSQlx
	 KNWytZmFEi7QmEYVCWoB4iq4x9qYJkculyahiv7o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 509F2F80264;
	Mon, 19 Oct 2020 15:39:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DAB34F80247; Mon, 19 Oct 2020 15:39:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_BL,RCVD_IN_MSPIKE_L4,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com
 [148.163.135.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 050BBF80121
 for <alsa-devel@alsa-project.org>; Mon, 19 Oct 2020 15:38:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 050BBF80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=analog.onmicrosoft.com
 header.i=@analog.onmicrosoft.com header.b="bAAIr8Fj"
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
 by mx0a-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09JDA4Ku003772; Mon, 19 Oct 2020 09:38:51 -0400
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2107.outbound.protection.outlook.com [104.47.55.107])
 by mx0a-00128a01.pphosted.com with ESMTP id 347tf66f44-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Oct 2020 09:38:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oh8THCtnVnFjr7igkt4L6XaGtOKZeAdW9uoaXnYuvX44ByNpW54LlVC9ZuNQtVKsa3PNKNk7gs1iQkjdvk8YRGfbxuI4SCQUsuA0uoIi8AzHraZM+mfT21jPThM0MBBmrmiu+H6qTw8s00Y6oYq6Di/ceBpHE0dLN/oQOLluQZw6u6hv9wte8pvOMWdu0bWMs0URRk7p8+cM4EgiVjWeB427PAw56eI2Z4knDe3ejZV5PFCRWvliZwQwAuQyNUT7Avs9xLLTS4zVEvC/pzU9tYo5tJdZmm8vglzd6w/C2CpbAXgk4Iyv7JNXvxYp+hJW4X/69r5xruD1eHiz9wGoAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iYby/wboJeGZ8LJxsROl//q+hIF/9Qqm4KMWOPvglr8=;
 b=Yt++TAfA495K6DLJsPZXkNQGZmf5ou0kfDJk9ngShP5sYhIgoV5QuZIXDUJ1hdpo58Jd6RYnoWouZjLWhA1YYACmegqSqNg6OGfzvgXBlc9fncFdGbtu9MsCG+xY0F9S2EgibciNYhAgOg9jCa88mQ1LudfpIULM24AHceoY6LSiGMHGpVfCEjpuPXqJPdbqBvDgBDOX6XUCJVX3gDxfw1cSWnAwxYzdT8k6qMfvwgdf8mMqIg39Kdzp6lj6s7+4B0JOZ8Q5+7dQNgr07Ee4BaG4GywzdA3YQmpNd31lezovqGJWh4McjNQ+/xdGnXTfZdHTiAjjb2yWkqDYOOyutQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iYby/wboJeGZ8LJxsROl//q+hIF/9Qqm4KMWOPvglr8=;
 b=bAAIr8Fjoq27XF63wqexeDex2KBaw37OdXu5MMknvtWuU1ytLuxPIDNLQGvMfK2l0bAX+ymimJ/DcQhrYbQD4a+ZDFbgULWHxToalSu8CiqWbZaFl+YMVckhXPPw6PKhqeQ/vZsk7MwhuIDicXo7HM7yQ85GQbqrLmoVONh7BV4=
Received: from DM6PR03MB4411.namprd03.prod.outlook.com (2603:10b6:5:10f::14)
 by DM6PR03MB5209.namprd03.prod.outlook.com (2603:10b6:5:245::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.25; Mon, 19 Oct
 2020 13:38:50 +0000
Received: from DM6PR03MB4411.namprd03.prod.outlook.com
 ([fe80::f457:143e:f83b:26cf]) by DM6PR03MB4411.namprd03.prod.outlook.com
 ([fe80::f457:143e:f83b:26cf%4]) with mapi id 15.20.3477.028; Mon, 19 Oct 2020
 13:38:49 +0000
From: "Ardelean, Alexandru" <alexandru.Ardelean@analog.com>
To: Mark Brown <broonie@kernel.org>
Subject: RE: [PATCH] ASoC: adau1977: remove platform data and move micbias
 bindings include
Thread-Topic: [PATCH] ASoC: adau1977: remove platform data and move micbias
 bindings include
Thread-Index: AQHWpgWE3Z1Iz2EjTE2H2I7CnJvccame5HGAgAAJElA=
Date: Mon, 19 Oct 2020 13:38:49 +0000
Message-ID: <DM6PR03MB44111745EE9A6FE8B989D6A2F91E0@DM6PR03MB4411.namprd03.prod.outlook.com>
References: <20201019105313.24862-1-alexandru.ardelean@analog.com>
 <20201019130331.GA4904@sirena.org.uk>
In-Reply-To: <20201019130331.GA4904@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcYWFyZGVsZWFc?=
 =?us-ascii?Q?YXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRi?=
 =?us-ascii?Q?YTI5ZTM1Ylxtc2dzXG1zZy02ZTk2ZWU2Yi0xMjEwLTExZWItYTVhMy00MTU2?=
 =?us-ascii?Q?NDUwMDAwMzBcYW1lLXRlc3RcNmU5NmVlNmQtMTIxMC0xMWViLWE1YTMtNDE1?=
 =?us-ascii?Q?NjQ1MDAwMDMwYm9keS50eHQiIHN6PSIxNTA0IiB0PSIxMzI0NzU4ODMzNTkz?=
 =?us-ascii?Q?NDc4OTkiIGg9IkZoNlRZZHlSaFNxUEF1RGRsTWU1S0N6bFk3OD0iIGlkPSIi?=
 =?us-ascii?Q?IGJsPSIwIiBibz0iMSIgY2k9ImNBQUFBRVJIVTFSU1JVRk5DZ1VBQUVvQ0FB?=
 =?us-ascii?Q?QzdwUEF3SGFiV0FZT1ViRzA0WllMWmc1UnNiVGhsZ3RrREFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFIQUFBQURhQVFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFFQUFRQUJBQUFBS1ZJV2JnQUFBQUFBQUFBQUFBQUFBSjRBQUFCaEFHUUFh?=
 =?us-ascii?Q?UUJmQUhNQVpRQmpBSFVBY2dCbEFGOEFjQUJ5QUc4QWFnQmxBR01BZEFCekFG?=
 =?us-ascii?Q?OEFaZ0JoQUd3QWN3QmxBRjhBWmdCdkFITUFhUUIwQUdrQWRnQmxBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUVBQUFBQUFBQUFBZ0FBQUFBQW5nQUFBR0VBWkFCcEFGOEFjd0JsQUdNQWRR?=
 =?us-ascii?Q?QnlBR1VBWHdCd0FISUFid0JxQUdVQVl3QjBBSE1BWHdCMEFHa0FaUUJ5QURF?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFRQUFBQUFBQUFBQ0FB?=
 =?us-ascii?Q?QUFBQUNlQUFBQVlRQmtBR2tBWHdCekFHVUFZd0IxQUhJQVpRQmZBSEFBY2dC?=
 =?us-ascii?Q?dkFHb0FaUUJqQUhRQWN3QmZBSFFBYVFCbEFISUFNZ0FBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFCQUFBQUFBQUFBQUlBQUFBQUFBPT0iLz48L21l?=
 =?us-ascii?Q?dGE+?=
x-dg-rorf: true
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=analog.com;
x-originating-ip: [188.27.128.55]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 46086ed9-b714-4c7c-0afb-08d874344fcf
x-ms-traffictypediagnostic: DM6PR03MB5209:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR03MB5209E54B6EF1AF1115A6A09CF91E0@DM6PR03MB5209.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oEtu7kYaZWG0LaQt+jWDBSwcd6oorPoEyj+7s2Ibe4RS05WrjnKADBTbSpIcKywTN28JKaok2OxEX82j9FmepZDFRBLNQ48AehVfh9RXUQZouQvTCaKlXpN2eWlu8MgtOGwl0m37IhU944Lx5Fax5wLLdpvDE1KtUbIACesbFwqq4aXsz6Bk+VGQK1f3w0dSIz4ItDH/YyV1kDf8yfWVmFr5M7I58ZUNwVe6+F6Yz+fOeeUNI0IjBJ811FZsgrqBtdD86oaYxlzKz9rJ6LgrcWHbe/FVhA3fMKKX+XMJ/LBRXLTvsjiKGJGIExXASxE1hVayyb0+be0WZel22O3VUGlCxKXP2BE21/ohIDAKdz17yqj6vMlSMIfpNbDZwfI9fvSy1zSd9eRuKwB3MmhCsw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR03MB4411.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(39860400002)(366004)(396003)(376002)(66446008)(316002)(66946007)(66556008)(64756008)(4326008)(9686003)(2906002)(86362001)(26005)(66476007)(54906003)(7696005)(52536014)(6916009)(6506007)(8936002)(83380400001)(55016002)(33656002)(53546011)(5660300002)(966005)(478600001)(186003)(76116006)(71200400001)(8676002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: e/HxosKTJQUf1FAo3rgPamqZqtpwM7F8UdGei2Umj+oNA3rsCQocpK2ltCNLPzOTA3lhpDFy/BQ+2ILw19YZw/+KaNQB/SLY5uOLg3wWQQxcIObsaU/LTcdUqd5oAHMgEyrsBOWntL6QvF5kN4p5ppHc8j+XtqbSqBXm+l1uRkTe23Py9NAaZ+xCGMF8hQpyAkgq1l2RR5ARdujYHgr9dyrJG4sTibyJ/RftBz+R78eKRlukTg0t3KHeB+zKgeT5Ms11DJpxJ69utrxhKB3wZzk5Kv4hXf5ZgsRzt6gnjxUPO6aKZ7rODZpZhYKPz+4AN9KqdS1bhLzNWX3DDd9sa+K4EM/2JVD2Nk4eUxtj0vaHurEoGGf3UFpFyKwilKbOBzMYhu/hTNbZ/CrSpQC3uYzpXp3KhKPm0j4MPuO5JypJVENusK3RLztmVhYbO+D1+o9QhdeUdVNQZbOGGx7zJnahswJfRFo8HmwZp9MhXjdOamBiO8J6Zhantf7AnwiQS3hLzucaHcfGtERp5gyCNJilHxDCK7N+uz9rhuv8/kBRUmZ4Y7+8au3o9EJk5ePKHAzzJel3OVqmSTP534ELj9nbZVuOBAl5lOKEIXmX6Nyq3UrtNVgcsUlpDV2xbHyLes+BhjomT8GwgDbEVj3elw==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB4411.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46086ed9-b714-4c7c-0afb-08d874344fcf
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2020 13:38:49.8075 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Gq13vm1EfRkAlP2x2BmZnACHk8sHcgDTUgzXenMyE0l4aJ3Lvd1V7KryiUtVeZb4lLeL1iFmD/zGNjaOjQBlcxmv0Sy1DPuNizTWeAQGrgM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5209
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-19_05:2020-10-16,
 2020-10-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 bulkscore=0 phishscore=0 adultscore=0 clxscore=1015
 impostorscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 mlxscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010190093
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "tiwai@suse.com" <tiwai@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Sa,
 Nuno" <Nuno.Sa@analog.com>
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
> From: Mark Brown <broonie@kernel.org>
> Sent: Monday, October 19, 2020 4:04 PM
> To: Ardelean, Alexandru <alexandru.Ardelean@analog.com>
> Cc: linux-kernel@vger.kernel.org; alsa-devel@alsa-project.org;
> lgirdwood@gmail.com; lars@metafoo.de; Sa, Nuno <Nuno.Sa@analog.com>;
> perex@perex.cz; tiwai@suse.com
> Subject: Re: [PATCH] ASoC: adau1977: remove platform data and move micbia=
s
> bindings include
>=20
> [External]
>=20
> On Mon, Oct 19, 2020 at 01:53:13PM +0300, Alexandru Ardelean wrote:
> > The change removes the platform_data include/definition. It only
> > contains some values for the MICBIAS.
> > These are moved into 'dt-bindings/sound/adi,adau1977.h' so that they
> > can be used inside device-trees. When moving then, they need to be
> > converted to pre-compiler defines, so that the DT compiler can understa=
nd
> them.
>=20
> This is missing an update of the binding documentation for the new proper=
ty.

Umm, if referring to the 'adi,micbias' property, that isn't new:
https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/tree/Docu=
mentation/devicetree/bindings/sound/adi,adau1977.txt#n26

This just removes any left-over platform-data stuff; which admittedly shoul=
d have been done earlier.
I also started a conversion of the old binding from text to yaml.
I'll probably have that ready in a couple of days.
