Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0BB0D5413
	for <lists+alsa-devel@lfdr.de>; Sun, 13 Oct 2019 06:05:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A647167E;
	Sun, 13 Oct 2019 06:04:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A647167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570939514;
	bh=m/4s8sDoMTsNdlqhnv4yFnN9LCZ3RlnYWf4yFAxcrjk=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IsQq9XYjGeNxlRvJzqk7vewn/7gmsTVYlFMGnQTOec34atehifY1SvCdwyucXMxMl
	 daECu3C81nWIRMxLMfRZqlmf+z8nigARf+0hqNZs82J5xYFTkum1fSSdfohD/hYo08
	 ldGvWl1TmvHumwzcanQqfCpe9HcpHuS3Mfc9WmYE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF31CF804AB;
	Sun, 13 Oct 2019 06:03:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19426F80212; Sun, 13 Oct 2019 05:59:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 INVALID_MSGID, MAILING_LIST_MULTI, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from listssympa-test.colorado.edu (listssympa-test.colorado.edu
 [128.138.129.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 891E3F80212
 for <alsa-devel@alsa-project.org>; Sun, 13 Oct 2019 05:55:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 891E3F80212
Received: from listssympa-test.colorado.edu (localhost [127.0.0.1])
 by listssympa-test.colorado.edu (8.15.2/8.15.2/MJC-8.0/sympa) with ESMTPS id
 x9D3t3AB030079
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Sat, 12 Oct 2019 21:55:04 -0600
Received: (from root@localhost)
 by listssympa-test.colorado.edu (8.15.2/8.15.2/MJC-8.0/submit) id
 x9D3t2Rt030031; Sat, 12 Oct 2019 21:55:02 -0600
Received: from SN6PR03MB4014.namprd03.prod.outlook.com (2603:10b6:a02:a8::31)
 by BYAPR03MB4376.namprd03.prod.outlook.com with HTTPS via
 BYAPR03CA0018.NAMPRD03.PROD.OUTLOOK.COM; Wed, 9 Oct 2019 19:22:32 +0000
Received: from BN3PR03CA0052.namprd03.prod.outlook.com
 (2a01:111:e400:7a4d::12) by
 SN6PR03MB4014.namprd03.prod.outlook.com (2603:10b6:805:c3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2327.24; Wed, 9 Oct
 2019 18:03:02 +0000
Received: from BY2NAM01FT041.eop-nam01.prod.protection.outlook.com
 (2a01:111:f400:7e42::203) by BN3PR03CA0052.outlook.office365.com
 (2a01:111:e400:7a4d::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.17 via Frontend
 Transport; Wed, 9 Oct 2019 18:03:02 +0000
Received: from ipmx1.colorado.edu (128.138.128.231) by
 BY2NAM01FT041.mail.protection.outlook.com (10.152.68.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384)
 id 15.20.2347.16 via Frontend Transport; Wed, 9 Oct 2019 18:03:02 +0000
Received: from ipmx8.colorado.edu ([128.138.67.85])  by mx.colorado.edu with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2019 11:10:02 -0600
Received: from mx-spsc.colorado.edu (HELO mx.colorado.edu) ([128.138.67.77]) by
 mx.colorado.edu with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2019
 10:34:54 -0600
Received: from ipmx7.colorado.edu ([128.138.128.233]) by mx.colorado.edu with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2019 10:12:25 -0600
Received: from mx.colorado.edu ([128.138.128.150]) by mx.colorado.edu with
 ESMTP; 09 Oct 2019 09:53:32 -0600
Received: from mx.colorado.edu ([128.138.128.150]) by mx.colorado.edu with
 ESMTP; 09 Oct 2019 09:44:01 -0600
Received: from vger.kernel.org ([209.132.180.67]) by mx.colorado.edu with
 ESMTP; 09 Oct 2019 09:36:24 -0600
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand id
 S1731392AbfJIPgX (ORCPT <rfc822; michael.gilroy@colorado.edu>);
 Wed, 9 Oct 2019 11:36:23 -0400
Received: from inva020.nxp.com ([92.121.34.13]:49886 "EHLO inva020.nxp.com" 
 rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP        id
 S1730546AbfJIPgU (ORCPT <rfc822;linux-kernel@vger.kernel.org>);        Wed,
 9 Oct 2019 11:36:20 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])        by
 inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 523FB1A01A2;        Wed,  9
 Oct 2019 17:36:18 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22]) 
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 463731A0084;       
 Wed,  9 Oct 2019 17:36:18 +0200 (CEST)
Received: from fsr-ub1864-103.ea.freescale.net (fsr-ub1864-103.ea.freescale.net
 [10.171.82.17])        by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id
 D2A8B2060B;        Wed,  9 Oct 2019 17:36:17 +0200 (CEST)
Authentication-Results: spf=none (sender IP is 128.138.128.231)
 smtp.mailfrom=vger.kernel.org; 
 o365.colorado.edu; dkim=none (message not signed)
 header.d=none;o365.colorado.edu; dmarc=fail action=none header.from=nxp.com;
Received-SPF: None (protection.outlook.com: vger.kernel.org does not designate
 permitted sender hosts)
Authentication-Results-Original: mx.colorado.edu;
 dkim=none (message not signed) header.i=none
IronPort-SDR: B/BFTxlsUktpPAy+1gTnAMtvqS/Ra0T1Mj2yhFCiN36Ac7WLXdRIde1Zzn4A1AX+Ytnp6acUPo
 +O+YFPcLgK+6uQ+APYAOV8bVCNsx1/J90=
IronPort-SDR: VNv4KSz1C+ZE7+noQMhDTOIHx3e1w/CDqmJ1tJh6YsbzUphJWK2/f1hVIJQcqZlejQ4FltZeed
 xemZuW+MDUhkZ60pVDmuNeHR73oN4BfjE=
IronPort-SDR: KJ6sjNd3odmWbOCOBpjfkh+PUjnQLypYV6IEkQBzEzTwhRyEDBWayDtPdC2GAKsbrUVLYIZYJ7
 YtiAf1Y5WlUlWxp08L/HAXOLH7FBEeZOc=
IronPort-SDR: zSHNqJ3kJmdA4bDI3Z01WzPcVsHQx7KI81goM5O4+8srCFexwFW9G1e5642PGH5wpbxFMGpXyf
 c67AIh+f9v/cpjG8uqWVG9vY0vMfyIGu0=
IronPort-SDR: eY1zfBA9tFV14nug72X79On7yUKAUMIy2RgP7e4fRH1QKlJJNKbnIzvWUxraCtkLCu9rogKO38
 if9d6+H8qYUhh9nlbow7zCX70PtfQy0JI=
IronPort-SDR: 92uLM0FM8XtVyjiqgPa4ojfbKUKBMnitDfOBSvgGgpWhSw8ftZtD7CSHOlR9PHUuU7xofmG1pj
 WA30aF97UDI7JyshTek/PyhUmx2QdB33s=
IronPort-PHdr: =?us-ascii?q?9a23=3ARCTiPRUtC3S6n4gN9/hC+5l+WVnV8LGuZFw894?=
 =?us-ascii?q?YnhrRSc6+q45XlOgnl6O5wiEPSA9yJ7uICgO3StLrpVWtG7Jqc4zgOc51JAh?=
 =?us-ascii?q?kCj8he3wktG9WMBkCzKvn2Jzc7E8JPWB4t/3yyPUVPXserYVrUr3A=3D?=
IronPort-PHdr: =?us-ascii?q?9a23=3ASkXCORNYFsKhVp6FP2kl6mtXPHoOpqn0MwgJ65?=
 =?us-ascii?q?Eul7NJdOGZ8o//OFDEu6w/iU+PVoLf7OhNh+2Qvqz9CiQM4peE5XYFdpEEFx?=
 =?us-ascii?q?oIkt4fkAFoBsmZQVb6I/jnY21yHMlLWFJ/uXDuN09TFcs=3D?=
IronPort-PHdr: =?us-ascii?q?9a23=3AQBUEkxagHPNRk+dG7KvH6mr/LSx94efdIxIV55?=
 =?us-ascii?q?w7irlHbqWk+dHYMVfC4el20gabWJWd4PVAjPDfv6emVGAdst6Ns3EHJZpLUR?=
 =?us-ascii?q?JNycAbhBcpD8PND0rnZOXrYCo3EIUKVFJs83yhd0kAHsH4alA=3D?=
IronPort-PHdr: =?us-ascii?q?9a23=3ASJeBFBfwkuzRFJpRi/Dw1uvulGMj4e+mFxMJ6p?=
 =?us-ascii?q?chl7NFe7ii+JKnBkHE+PFxlwGQD4DLrflDj+3MuqznH2EM/MXJvHMDdclKUB?=
 =?us-ascii?q?kIwYUTkhc7CcGIQUv8MLbxbiM8EcgDHF9o9n22Kw5UTcD5YVDf?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0FDAgBfHZ5dbVVDioBlHAEBAQEBBwE?=
 =?us-ascii?q?BEQEEBAEBgXuCGwWBQh0SKo0lm22HGBQBAQEBAQEBAQEIGBUCAQEBhxEjOBM?=
 =?us-ascii?q?CAwkBAQEDAQEBAgEFAgEBAgIQDQsJBiuFQIYhBgECJFIGCQEBUANUBxIFgx2?=
 =?us-ascii?q?CeASxaTOIe4FIgTSHNYRZgVg/hGGKMASVRoEillsHgiVmBJQjJ5lALY4AmV6?=
 =?us-ascii?q?BaYF7MxojgzxQEBSBWxeOJnGBCJATAQE?=
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0E2AgDME55dfU1DioBlhFyBZBKNT5t?=
 =?us-ascii?q?shywBAQEBAQEBAQEILQIBAQGHNDgTBQkBAQEDAQICAQUCAQECAhABAQkWCIV?=
 =?us-ascii?q?phiEDAwECJFIGCQEBUANUBxIFgx2CeASxVjOIfIFIIIhJhjE/hGGKMJVKgSK?=
 =?us-ascii?q?WWweCJWYElCMnmUAtjgCZXoFpgXszGiOEDBAUkBiBeZATAQE?=
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0F9AgDjBZ5dh+mAioBlHAEBAQEBBwE?=
 =?us-ascii?q?BEQEEBAEBgXuCG4FGLyqNJZtrhxgUAQEBAQEBAQEBCBgVAgEBAYcRIzgTAgM?=
 =?us-ascii?q?JAQEBAwEBAQIBBQIBAQICEAEBAQoLCQgphUCGIQMDAQIkUgYJAQFQA1QHEgW?=
 =?us-ascii?q?DHYILBLFRM4h7gUiBNIc1hFmBWD+EYYoqBJVGgSKWWweCJWYElCMnmUAtjgC?=
 =?us-ascii?q?ZXoFpgXszGiODPFAQFIFbF44mcYEIk10BAQ?=
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0FiAQDP+51dh0O0hNFlHAEBAQEBBwE?=
 =?us-ascii?q?BEQEEBAEBgXuCG4FEMSqNJYd8k2+HGBQBAQEBAQEBAQEgFAECAQEBhxEjOBM?=
 =?us-ascii?q?CAwkBAQEDAQEBAgEFAgEBAgIQAQEBCgsJCCmFQIYhAwMBAiRSBgkBAVADVAc?=
 =?us-ascii?q?SBYMdggsEsT0ziH6BSIE0hzWEWYFYP4RhiioElUaBIpZbB4IlZgSUIyeZQC2?=
 =?us-ascii?q?OAJtHgXszGiODPFAQFIFbF44mPwExgQYBAZNdAQE?=
X-IPAS-Result: =?us-ascii?q?A0FDAgBfHZ5dbVVDioBlHAEBAQEBBwEBEQEEBAEBgXuCG?=
 =?us-ascii?q?wWBQh0SKo0lm22HGBQBAQEBAQEBAQEIGBUCAQEBhxEjOBMCAwkBAQEDAQEBA?=
 =?us-ascii?q?gEFAgEBAgIQDQsJBiuFQIYhBgECJFIGCQEBUANUBxIFgx2CeASxaTOIe4FIg?=
 =?us-ascii?q?TSHNYRZgVg/hGGKMASVRoEillsHgiVmBJQjJ5lALY4AmV6BaYF7MxojgzxQE?=
 =?us-ascii?q?BSBWxeOJnGBCJATAQE?=
X-IPAS-Result: =?us-ascii?q?A0E2AgDME55dfU1DioBlhFyBZBKNT5tshywBAQEBAQEBA?=
 =?us-ascii?q?QEILQIBAQGHNDgTBQkBAQEDAQICAQUCAQECAhABAQkWCIVphiEDAwECJFIGC?=
 =?us-ascii?q?QEBUANUBxIFgx2CeASxVjOIfIFIIIhJhjE/hGGKMJVKgSKWWweCJWYElCMnm?=
 =?us-ascii?q?UAtjgCZXoFpgXszGiOEDBAUkBiBeZATAQE?=
X-IPAS-Result: =?us-ascii?q?A0F9AgDjBZ5dh+mAioBlHAEBAQEBBwEBEQEEBAEBgXuCG?=
 =?us-ascii?q?4FGLyqNJZtrhxgUAQEBAQEBAQEBCBgVAgEBAYcRIzgTAgMJAQEBAwEBAQIBB?=
 =?us-ascii?q?QIBAQICEAEBAQoLCQgphUCGIQMDAQIkUgYJAQFQA1QHEgWDHYILBLFRM4h7g?=
 =?us-ascii?q?UiBNIc1hFmBWD+EYYoqBJVGgSKWWweCJWYElCMnmUAtjgCZXoFpgXszGiODP?=
 =?us-ascii?q?FAQFIFbF44mcYEIk10BAQ?=
X-IPAS-Result: =?us-ascii?q?A0FiAQDP+51dh0O0hNFlHAEBAQEBBwEBEQEEBAEBgXuCG?=
 =?us-ascii?q?4FEMSqNJYd8k2+HGBQBAQEBAQEBAQEgFAECAQEBhxEjOBMCAwkBAQEDAQEBA?=
 =?us-ascii?q?gEFAgEBAgIQAQEBCgsJCCmFQIYhAwMBAiRSBgkBAVADVAcSBYMdggsEsT0zi?=
 =?us-ascii?q?H6BSIE0hzWEWYFYP4RhiioElUaBIpZbB4IlZgSUIyeZQC2OAJtHgXszGiODP?=
 =?us-ascii?q?FAQFIFbF44mPwExgQYBAZNdAQE?=
X-IronPort-AV: E=Sophos; i="5.67,277,1566885600"; d="scan'208"; a="414517866"
X-IronPort-AV: E=Sophos; i="5.67,277,1566885600"; d="scan'208"; a="371416319"
X-IronPort-AV: E=Sophos; i="5.67,276,1566885600"; d="scan'208"; a="371343727"
X-IronPort-AV: E=Sophos; i="5.67,276,1566885600"; d="scan'208"; a="286787201"
X-IronPort-Outbreak-Status: No, level 0, Unknown - Unknown
X-IronPort-Outbreak-Status: No, level 0, Unknown - Unknown
X-IronPort-Outbreak-Status: No, level 0, Unknown - Unknown
X-IronPort-Outbreak-Status: No, level 0, Unknown - Unknown
X-IronPort-Outbreak-Status: No, level 0, Unknown - Unknown
X-IronPort-Outbreak-Status: No, level 0, Unknown - Unknown
X-Original-Recipients: gasiewsk@o365.colorado.edu
X-Original-Recipients: gasiewsk@o365.colorado.edu
X-Original-Recipients: gasiewsk@o365.colorado.edu
X-Original-Recipients: gasiewsk@o365.colorado.edu
X-Original-Recipients: migi9492@g.colorado.edu
From: "Daniel Baluta" <daniel.baluta@nxp.com>
To: "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
 "broonie@kernel.org" <broonie@kernel.org>
Date: Wed,  9 Oct 2019 18:36:15 +0300
Message-Id: 20191009153615.32105-3-daniel.baluta@nxp.com
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191009153615.32105-1-daniel.baluta@nxp.com>
References: <20191009153615.32105-1-daniel.baluta@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
X-MS-Exchange-Organization-ExpirationStartTime: 09 Oct 2019 18:03:02.3931 (UTC)
X-MS-Exchange-Organization-ExpirationStartTimeReason: OriginalSubmit
X-MS-Exchange-Organization-ExpirationInterval: 1:00:00:00.0000000
X-MS-Exchange-Organization-ExpirationIntervalReason: OriginalSubmit
X-MS-Exchange-Organization-Network-Message-Id: 0f481d37-4668-4ce8-73b3-08d74ce2ed4f
X-EOPAttributedMessage: 0
X-MS-Exchange-Organization-MessageDirectionality: Originating
X-Forefront-Antispam-Report: CIP:128.138.128.231; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:SKN; SFS:; DIR:INB; SFP:; SCL:-1; SRVR:SN6PR03MB4014; H:ipmx1.colorado.edu;
 FPR:; SPF:None; LANG:en; ; SKIP:1; 
MIME-Version: 1.0
X-MS-Exchange-Organization-AuthSource: BY2NAM01FT041.eop-nam01.prod.protection.outlook.com
X-MS-Exchange-Organization-AuthAs: Anonymous
X-OriginatorOrg: colorado.edu
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0f481d37-4668-4ce8-73b3-08d74ce2ed4f
X-MS-TrafficTypeDiagnostic: SN6PR03MB4014:|SN6PR03MB4014:
X-MS-Exchange-Organization-SCL: -1
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-Microsoft-Antispam: BCL:0;
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2019 18:03:02.1539 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f481d37-4668-4ce8-73b3-08d74ce2ed4f
X-MS-Exchange-CrossTenant-Id: 3ded8b1b-070d-4629-82e4-c0b019f46057
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3ded8b1b-070d-4629-82e4-c0b019f46057; Ip=[128.138.128.231];
 Helo=[ipmx1.colorado.edu]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4014
X-MS-Exchange-Transport-EndToEndLatency: 01:19:31.1517093
X-MS-Exchange-Processed-By-BccFoldering: 15.20.2347.014
X-Microsoft-Antispam-Mailbox-Delivery: ucf:0; jmr:0; ex:0; auth:0; dest:I;
 ENG:(750127)(520002050)(944506383)(944626516); 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OM2Az3idnfV9aW1NwQ4OdamgvFhzN8o7CM5M9X3JPERWJshhCf0ZtLt5ueok?=
 =?us-ascii?Q?sY8b07Uox9F8j8ZhD2pAHyuGgCcUkLew9ZX5CleMjj1xFDb29oMi+1h5rqDG?=
 =?us-ascii?Q?kPsFrUHHmvZoWtCpFG8RJEzD1S71MtN0E4P+li1mVNIsjeMrR1BIhjGe5VCh?=
 =?us-ascii?Q?N4AA07oleDFmXiKB3HZJ1P0Z0xPe6N+zVyoSzVqKPV713aHlRUqpI2QNSbEy?=
 =?us-ascii?Q?/8659KUc4k6q1Wj+dmQn9S9gjrSKHxhTpclutU8OQJxewap/hXgIdjI+eHkc?=
 =?us-ascii?Q?WpPlE8EvWNK4ONGaBdZfIeJTVmt5ytxnClqppKN4NyPuXUz6mL2mqeuN6oRn?=
 =?us-ascii?Q?7X99oDybLbOH+W0+7x4SlyTodfvndsKJCAKl3N7PdTkMl+pYg3vURzGI9MK3?=
 =?us-ascii?Q?EsA74DEeTe6k3XB3JBaCxQPI5qeRT+Y6ashle58eY0ZvBBj8abHiQcSJ3Cjp?=
 =?us-ascii?Q?QNF6T5lCuvrEvUaoUlQPPRkqEyUTlvTgeFPyfOVNQqvdr1ZWqJ1Qj7oI0yOu?=
 =?us-ascii?Q?rYLnQ4NYwCY5xIz8LO4w+TulvcHVp/TVWJ+dxokY0bqYIyUog9dlflW+7iGT?=
 =?us-ascii?Q?eiChtRjqEuBRn1Khsl+EAmA7dXZzyUzRi3Zo7+N3C1byrtxR5eBiCzobG3UO?=
 =?us-ascii?Q?pg+Z+lCxNeVXJx/rIF2Udb/ryENVE74ZDuaQKx7cn9zEbjizH3p4+kBWDzkE?=
 =?us-ascii?Q?nk7kzO+kKV9jgFn8so4L1nzQbyTwRiZe2rqKPoUiNcR7ElolAOwNMhzf6k8o?=
 =?us-ascii?Q?6ZVUGoXtFNFngI0Ggexac7YDk10KIghdbwdZbyA7yMY3fStfidiE1fbK8Jpr?=
 =?us-ascii?Q?OCgEu3e7/E7XaziBYNcl74tEeoi1+0KlT577+6ygQ5sx8MDO4McQRkM6U4BG?=
 =?us-ascii?Q?tDPzTL5R/wtWOFqMVR0YgSQP7RtK3De3d8nmSH0CKl0Jbw5gslKwGbhynnia?=
 =?us-ascii?Q?V4GUE95zut/UK+IwIIqtuahOFcUzUzue7ZDLSZo+rCcyJ4sbpMtiO9fQn8L6?=
 =?us-ascii?Q?mVCzl6g6GjhrCgm4Pdb8v1wjuIdg8mpHr6wkgOuSTk9YYxIZhRGsDQ+afZ9I?=
 =?us-ascii?Q?DXWTb2QHaJgxOYD61JNJoVw+uGF1VDwpLBqhTCxLZ/Rhwtkn8UzyogL3F98M?=
 =?us-ascii?Q?d45clmT+EhDsLYboj/hOV1sihqe7U3AGng=3D=3D?=
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "kuninori.morimoto.gx@renesas.com" <kuninori.morimoto.gx@renesas.com>,
 "linux-imx@nxp.com" <linux-imx@nxp.com>
Subject: [alsa-devel] [PATCH 2/2] ASoC: simple_card_utils.h: Fix potential
 multiple redefinition error
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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

asoc_simple_debug_info and asoc_simple_debug_dai must be static
otherwise we might a compilation error if the compiler decides
not to inline the given function.

Fixes: 0580dde59438686d ("ASoC: simple-card-utils: add asoc_simple_debug_info()")
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 include/sound/simple_card_utils.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/sound/simple_card_utils.h b/include/sound/simple_card_utils.h
index 293ff8115960..bbdd1542d6f1 100644
--- a/include/sound/simple_card_utils.h
+++ b/include/sound/simple_card_utils.h
@@ -136,9 +136,9 @@ int asoc_simple_init_priv(struct asoc_simple_priv *priv,
 			       struct link_info *li);
 
 #ifdef DEBUG
-inline void asoc_simple_debug_dai(struct asoc_simple_priv *priv,
-				  char *name,
-				  struct asoc_simple_dai *dai)
+static inline void asoc_simple_debug_dai(struct asoc_simple_priv *priv,
+					 char *name,
+					 struct asoc_simple_dai *dai)
 {
 	struct device *dev = simple_priv_to_dev(priv);
 
@@ -168,7 +168,7 @@ inline void asoc_simple_debug_dai(struct asoc_simple_priv *priv,
 		dev_dbg(dev, "%s clk %luHz\n", name, clk_get_rate(dai->clk));
 }
 
-inline void asoc_simple_debug_info(struct asoc_simple_priv *priv)
+static inline void asoc_simple_debug_info(struct asoc_simple_priv *priv)
 {
 	struct snd_soc_card *card = simple_priv_to_card(priv);
 	struct device *dev = simple_priv_to_dev(priv);
-- 
2.17.1


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
