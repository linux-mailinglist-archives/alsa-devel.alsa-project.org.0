Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B1A8AF750
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Apr 2024 21:28:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 42CE8162E;
	Tue, 23 Apr 2024 21:28:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 42CE8162E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713900534;
	bh=Qjy7fnBN7qAjnVUZGJSRvF7UEO8SmUcABcJPDgZt++M=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=uHauk3s+IkA0BziO/ViqLZdJ22yJ/Totfd8ni6VDPjXwE12l5mmazgv/22xhU+tv2
	 DF4OKPtzbMwPnfVm9bNQ45TiAQKNKkq0jwyjKtSwG8w3efDjlibYlaoZkm+pClUGTX
	 JMX7NrWEJUbNam0jNjnNxpXGT4Tt69GI64DufEDY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0B5C6F805A1; Tue, 23 Apr 2024 21:28:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BFE82F8059F;
	Tue, 23 Apr 2024 21:28:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 26A8CF8025A; Fri, 19 Apr 2024 09:13:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out11.electric.net (smtp-out11.electric.net
 [185.38.181.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A874BF801C0
	for <alsa-devel@alsa-project.org>; Fri, 19 Apr 2024 09:13:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A874BF801C0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=svedala.se header.i=@svedala.se header.a=rsa-sha256
 header.s=selector2 header.b=vng26Ey6;
	dkim=pass (1024-bit key,
 unprotected) header.d=svedala.se header.i=@svedala.se header.a=rsa-sha256
 header.s=mailanyone20190125 header.b=Hq4bRo3x
Received: from 1rxiR0-000GEE-V9 by out11c.electric.net with emc1-ok (Exim
 4.96.1)
	(envelope-from <Niclas.Soderlund@svedala.se>)
	id 1rxiR2-000GZ9-T3;
	Fri, 19 Apr 2024 00:13:24 -0700
Received: by emcmailer; Fri, 19 Apr 2024 00:13:23 -0700
Received: from [40.93.214.9]
 (helo=GV3P280CU006.outbound.protection.outlook.com)
	by out11c.electric.net with esmtps  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.1)
	(envelope-from <Niclas.Soderlund@svedala.se>)
	id 1rxiR0-000GEE-V9;
	Fri, 19 Apr 2024 00:13:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bAJDPULl/WKG7sC2s2EuYw6MoFRG80S+vLXL5nxsO7rHmkx/rcZprA1HPII91BbM0H+sNRZzjSUJtKJTaeh4S0nPPWWKwxJjDsC1b3hZCTbNRzrQy1v9/d/Oe0shAr5DG6FFjlyjHFfgopD8LTlm7rD7B93ONGM4xrwRh1x2cefwekaLZKG0Rb/41HrOFGzV9ksJ8Rfzj7TBWZTclT8LRB+VsLjuxeXpqiyEYfELnEmYM7MgL1H0RITCx7HMQ96KEAu3jz4nPT1tpcezOPkKKJJN3lwandnP9SJhkzh9b15yyrXTU7ms6PMN8pvWmf1lpshE/W/HDHN2TMnGG2Z1Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iHAn6D03GADLkMkoAbwXUBGFER3us1aYSYnj0Zv8+D0=;
 b=Jb+2ANEEF6KOwJ+mJ3ww/4p/COeKvAEC6axat2puOWqy/hhD7q/7vYIf5CG2GdQuB9jU7r9ZdZFqU66kKQPLexo8MDQfjES4Q9nbHq0R793QPUsVEHFXnQZ2JU1MDEL+RTRs9LS2d9gb5fqkoTF893Ab9VesWpzF2s4z90ibK/UIh+9Y+Vrf4mJtgr0cxnfmL8QxsPB3QUdnm0c3je5aQ3Vh04OuPQHf//Nbcf93dRmsM7BJjj8vM+R9R1wzaW9gEefu1T1W2bpZTh/h7rObpibMZ+Cz1xhJpN5cHDXjI/RpHfTYJvDPaWChbTYXwOPS4tapm/GgcY5hKKPXa6Dksw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=svedala.se; dmarc=pass action=none header.from=svedala.se;
 dkim=pass header.d=svedala.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svedala.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iHAn6D03GADLkMkoAbwXUBGFER3us1aYSYnj0Zv8+D0=;
 b=vng26Ey6VXWJZJIqYJ9xn3Ucs+td904M+Tq9RyoD2yNLPCEmwv+Rn3URFXZL9GOK59/T9nzhoc5RBZme4a4Q848XHkDXkM+EQxXer1Sa5kjJOOBZQbSr47QEClZoqAJQ7WuEpvFjPcmOq0Rq4xptoq4gRcl4JF6LkB6Odu90YLg=
Received: from GVYP280MB0222.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:36::13)
 by GVZP280MB1113.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:190::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.43; Fri, 19 Apr
 2024 07:12:40 +0000
Received: from GVYP280MB0222.SWEP280.PROD.OUTLOOK.COM
 ([fe80::6ccb:d943:9ebc:1482]) by GVYP280MB0222.SWEP280.PROD.OUTLOOK.COM
 ([fe80::6ccb:d943:9ebc:1482%3]) with mapi id 15.20.7472.044; Fri, 19 Apr 2024
 07:13:08 +0000
From: =?iso-8859-1?Q?Niclas_S=F6derlund?= <Niclas.Soderlund@svedala.se>
To: "sbinding@opensource.cirrus.com" <sbinding@opensource.cirrus.com>
CC: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"patches@opensource.cirrus.com" <patches@opensource.cirrus.com>,
	"perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>
Subject: Re: [PATCH v1 0/7] Add support for various laptops using CS35L41 HDA
 without _DSD
Thread-Topic: [PATCH v1 0/7] Add support for various laptops using CS35L41 HDA
 without _DSD
Thread-Index: AQHakiij0DSA9Qsv90uqoyf5KeEvoQ==
Date: Fri, 19 Apr 2024 07:13:08 +0000
Message-ID: 
 <GVYP280MB02222656ED35281D0EC3620EE20D2@GVYP280MB0222.SWEP280.PROD.OUTLOOK.COM>
Accept-Language: sv-SE, en-US
Content-Language: sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=svedala.se;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GVYP280MB0222:EE_|GVZP280MB1113:EE_
x-ms-office365-filtering-correlation-id: 72d47772-40c2-4254-9119-08dc60402aa3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?f+YnSckcV8fkiTpEyOcOeM/DRyS1eH2Ug51dsMVUhs1FGWtTnRTnHkH6Sn?=
 =?iso-8859-1?Q?6Df1iL6C9PjQTjvxWg2ochI2FqmLwD/ygcbpR0z4rm4Mula/gzRZNFAagd?=
 =?iso-8859-1?Q?IXw0le24tL+FGviTu7Ns+kXdoxbJ65uPsIjnjlDM2k3RBP1n6tZ+yY9ieG?=
 =?iso-8859-1?Q?EWmov924Z8jTp0tDehdBsFEQt0MVB2AFy/v2eoDDPElBNWvgNECecsX41N?=
 =?iso-8859-1?Q?HKIV8yJvFS+vfn3b4W2BQP447mnzehSdn10hqsBpCpnJ/bL/VDidh2SBGf?=
 =?iso-8859-1?Q?PMYTEPRyEp0g5E/AWsbMeZdSqjPoEvHJkdPrieT2kV/twm2C2kRWnePe1r?=
 =?iso-8859-1?Q?+9DRqvhasR2rE4FWKGWOxKoArwy7oFC0wr8n8Hg27THz+YhkvVjzZ6wsHw?=
 =?iso-8859-1?Q?kGNaunL18B5gw+V1bPuX5atcbSX2/IaE5/XD0qKEX4B4ZH1+YGtxCGnlED?=
 =?iso-8859-1?Q?mAswyEsO91evJAyi9DZ+uMqr3MlUKw/eWK3KiAcRZ41m3krNxiTxBd2WiO?=
 =?iso-8859-1?Q?UQL/xVJ9SPn5FRvKIx3oGiy+ASvwapWsYhjZJd/gMm14I/VtcVsrPwnRRq?=
 =?iso-8859-1?Q?L/+oAFhGg8KyvypmrQMYBJKtscJsaOiazdpbzZjDO1VR6ZEdeZ7MmmdZt3?=
 =?iso-8859-1?Q?A7zgvVsieeBAqe6p+gGDwc39lHhvOtpeqe+0JBELnvvIbKev+7+xCGcWHZ?=
 =?iso-8859-1?Q?W5BD3PHitglqICixRtOpgqJxj+sUOmJIJOGqq1CsxtysfjcPbk0/lFTkiv?=
 =?iso-8859-1?Q?eIddas5dQlilsvlav3/sgcZFRZDt3iO7mAnJp6rUxiQGK/2BroWOm5bveo?=
 =?iso-8859-1?Q?lWgOZ+rljfF6uFm4A85n7YhjqZCorYR6nTz8QP6IxmPLDH1EuYvVwQDjH6?=
 =?iso-8859-1?Q?B38j9UpPyQizg/XT+96OJ661WwWLrA1UfUMJ11XldCQP4ebE+/5hM2yoMR?=
 =?iso-8859-1?Q?0ss0rSJxyU70tFljpKo+hliQpwNPxWbiejsCW7CG6CkXlhdz6eKDBoj6MP?=
 =?iso-8859-1?Q?RY8CkqmHViNA2LHyhNYENj1xpHif1YIDUD6RRenwCn290EIGDZcCDxGhr9?=
 =?iso-8859-1?Q?/c4GZf3fYfB97M8yNP0dEYo976UAwjEFmqVQMw2fCoqpMAWPzk1yUF7VpB?=
 =?iso-8859-1?Q?nJ/6yTC7Kfjh1syzlKv12s9LfWaiy3yfUtAmdmg3nI6l+WVfzsrqeDV0qH?=
 =?iso-8859-1?Q?F/C05GVqbEmHXKr/6+Z7RYwV91D3sj2Uwoeqb1K3X8DjKGhoeMH66zE3OW?=
 =?iso-8859-1?Q?0SbwlfF6WZ2pkedPqLSCixUa1/AdPi1GT6lCnDtpC7DEko3M/2vfMso8zp?=
 =?iso-8859-1?Q?D0AAToi4AnPUzG7FD7MU6ZG/djgkxpvJJolfSmBNsDx3ZSwNeZzMN9DDv7?=
 =?iso-8859-1?Q?r0Q3DEE90HwK1QFIWBQJug6+qW7GAYag=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVYP280MB0222.SWEP280.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?kEmuZc2QC6hhu4eb8jCLlJzZbkak+1+Gc2mClMvAwBie8bosFeo1NX/k7J?=
 =?iso-8859-1?Q?JNQ3gSaAiHgaqpblzq1OBeF3TBLAfoYC+7N428B2D7K5FBVctBVDoDm84q?=
 =?iso-8859-1?Q?UJ1ntxTGDuq6Cb7PCtgAXvoEIGI1Gkm3vaD0vj1tSkQfMIwmriBE5WheoN?=
 =?iso-8859-1?Q?Unu7PXkuvYwpfFyYx1Q7b5R9wd7z3BbvL2n3VJcQKJTde8y4B9eoNbUErH?=
 =?iso-8859-1?Q?+r+V4MKLF7z3sV9GSskKamLuStmNPEkRAMs1PskPs3xRDeea1xiJs9et4W?=
 =?iso-8859-1?Q?v03vMWJwXAwzmcARA5nHLNOyjg4UfldyfF7Xldxg+PDB2pSy7Ty2oeNCKU?=
 =?iso-8859-1?Q?6C2LIgHpQ95X3xO8iEJqH+xKL38ED+Ocx0jnSZ0xtO49taVP90mtmZkPYH?=
 =?iso-8859-1?Q?/34dHtFPBOXM4Uhtux/mORak6kXkFKRhKcmWX/IM5Rs2Cs3Yj6BPLq4po+?=
 =?iso-8859-1?Q?4b0tPuRJ+EddJP/XScVHXdfw9CTO/q6RAc6zhkl8rIKXR867zngTItjj6C?=
 =?iso-8859-1?Q?YVPjjEAo/6QvTT7rDxxpVyrNNJ3rQ/TFifiNjqnCLU7eGXEhXg4/D4/aOx?=
 =?iso-8859-1?Q?JPA6Zm+H7pXszVOrUjJqNVUukNtlNzySXo9PsAY58uINTnzJpli1SJ7Fay?=
 =?iso-8859-1?Q?5byPVjChGy7GjQePK+appdxe4tacA2lMR9HZkSaOOW7M6mmAWvza2NjVeQ?=
 =?iso-8859-1?Q?8gYIvRBFkX2EYAcwkBdCrKr/qeH0IcnSEnD6ZMgkVqNtXfhclw0Bb7Kl9r?=
 =?iso-8859-1?Q?ZiSTuk0Nhuu4meO5UCYf51XFh/HQdB2IePKBHTZ2popteFr9IqZvg0IBZF?=
 =?iso-8859-1?Q?K+kpB/08DMd2bsFjqpLGhV9wMDGWq/fbBJI53eLsW8kOx+UDIovdtx4Qaj?=
 =?iso-8859-1?Q?pXDsyASNIVqlviyBki+5yYb9/vqLsxJpCrnLks6WmsCl1tE6ujMfZ/4DuY?=
 =?iso-8859-1?Q?k7IitnXN09Gcj9ECWuN1kZ0LV+yrLknKjZqXwrD0olwZNetDbl2ofOzjTr?=
 =?iso-8859-1?Q?ZB7euw6E01LIoJAqDnkamVBlyjuOJdl9OVIKribRfDiT05XZznelHqwbjz?=
 =?iso-8859-1?Q?NYUp1R9QAc/4lv5G7JOvQPqx0pb4n5drmUNFW4Bs36t6EOENW9VBELU9Ib?=
 =?iso-8859-1?Q?4Bg0coPQrNbzqav/mT9Jbyq1SmOVNfcACFPE55iZCbxgtq4rNNylF0fUnX?=
 =?iso-8859-1?Q?uim7UFe8m5aE3BP6AJW5s2NH6fis4BkULNsgF1imw3QpBUgFTg9VHVWpSf?=
 =?iso-8859-1?Q?FWjuNPTQC8jJIMduidRL2CYy0FMdnu1z8/hPMZW4d9l1H801C9Y3oY9QH3?=
 =?iso-8859-1?Q?AhMnUELwZSRvBbnl5stRb32B9lfQzd+Ri4dZEthfd0rUi3NYXpkTNQxFDX?=
 =?iso-8859-1?Q?ZmlMvjnICwH+8BSO01xL5r7jXTQHCUUxZ1NiBjyVA6vyAoE++FEVp+kV5M?=
 =?iso-8859-1?Q?Udk+xz0jL2TcK2nhSGlYPuBoWWLN8EVhR68rQs35BLu2yavP+zZI0ixcIK?=
 =?iso-8859-1?Q?GHIOVAYjx+w4cSBmyGgiy000o2n7aafF5+FOTepg5E+SnIrGKe8D9HxLPA?=
 =?iso-8859-1?Q?cOsVWVy/aT3JkqLDY766ziQrhTFYM3vRSOLUC0TPqkMV+mOcd8gYK3479d?=
 =?iso-8859-1?Q?E7cCSOuspDKrH4RKHRs1n65rhtFTKYh65d?=
MIME-Version: 1.0
X-OriginatorOrg: svedala.se
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GVYP280MB0222.SWEP280.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 72d47772-40c2-4254-9119-08dc60402aa3
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2024 07:13:08.9204
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2a43f767-6833-455f-b87d-61ec9dc036cc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 eFetOR7fc0zLse6RpRcihFi3NTgOEzuO9QKCP74vR+SqQexDnNlBAIj61lsmAnHEVV2XbgNAWqZ/XQ/Hs4N+tCzApGgVBVw2m6gqbgzmtK8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVZP280MB1113
X-Outbound-IP: 40.93.214.9
X-Env-From: Niclas.Soderlund@svedala.se
X-Proto: esmtps
X-Revdns: mail-swedencentralazlp17010009.outbound.protection.outlook.com
X-HELO: GV3P280CU006.outbound.protection.outlook.com
X-TLS: TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256
X-Authenticated_ID: 
X-VIPRE-Scanners: virus_clamav;virus_bd;
X-PolicySMART: 32514092, 30573092, 18988237
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=svedala.se;
 s=mailanyone20190125;h=MIME-Version:Message-ID:Date:To:From;
 bh=iHAn6D03GADLkMkoAbwXUBGFER3us1aYSYnj0Zv8+D0=;b=Hq4bRo3xdx1oLIVyLQPWevbxmpK0Fdxl4fsEnR3dXuwIMZooWPVyyFzGJwhRCKANDJw7/WNgtMO2NWALhx5ZyY8c8PUaM6CBqWC8PMeT72ws/lD2pHJMdKXHscW5KDA81Z/3Dot72TB43G9BQ1/T9/6ACDzuCfTl0MRKLDN4zNc=;
X-PolicySMART: 32514092, 30573092, 18988237
X-PolicySMART: 32514092, 30573092, 18988237
X-PolicySMART: 32514092, 30573092, 18988237
X-PolicySMART: 32514092, 30573092, 18988237
X-PolicySMART: 32514092, 30573092, 18988237
X-PolicySMART: 32514092, 30573092, 18988237
X-PolicySMART: 32514092, 30573092, 18988237
X-MailFrom: Niclas.Soderlund@svedala.se
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: IDDNTJD6KW4XNIRIIYXN3D6UMOFUB7GM
X-Message-ID-Hash: IDDNTJD6KW4XNIRIIYXN3D6UMOFUB7GM
X-Mailman-Approved-At: Tue, 23 Apr 2024 19:28:11 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Content-Filtered-By: Mailman/MimeDel 3.3.9
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QMEQUJYSQ4XF3WJGEW5Y73YQ43R5KVN5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

amazingly high level of laymanship here and equally high level of dispear. =
But model after model is added to fix the problem with speakers not working=
, but nowhere is my model seen. I have the Lenovo 13X G2 model and even at =
kernel 6.8.7 my speakers still doesnt work.

Where can I add a request to also include this model in the patches, so I h=
ave a hope of having the speakers start working?

I do apologise in advance,


Mvh, Niclas
