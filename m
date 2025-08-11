Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 314F8B25CC3
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Aug 2025 09:11:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7036A6025D;
	Thu, 14 Aug 2025 09:11:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7036A6025D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1755155505;
	bh=rETwuxNJRYZS/jbZtrvdyagmPvc8m3s920CFb+aveNo=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=CDK9gTkyNKxFfVltyQsioJkJ6Fowmz1T4l4JtK7+PKm29ZrXlUPBNqbytn9CyplZE
	 snbcdk5bm1R23vxv7YiVErTZeRn+ku16apNBzq1eAFCmOUU0OQ1lqE4YdQMjwGmTpy
	 f6maPEceIDtJvY2rFCQ2aYsmsE2CDD7iqAVQSuhk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9A27FF805D2; Thu, 14 Aug 2025 09:11:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 805D8F805C4;
	Thu, 14 Aug 2025 09:11:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 06D12F80518; Mon, 11 Aug 2025 12:34:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_40,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0a-00300601.pphosted.com (mx0a-00300601.pphosted.com
 [148.163.146.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2DB96F8021D
	for <alsa-devel@alsa-project.org>; Mon, 11 Aug 2025 12:34:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2DB96F8021D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=emerson.com header.i=@emerson.com header.a=rsa-sha256
 header.s=email header.b=kX1FLz5H;
	dkim=pass (2048-bit key,
 unprotected) header.d=Emerson.com header.i=@Emerson.com header.a=rsa-sha256
 header.s=selector1 header.b=SCT8rzy/
Received: from pps.filterd (m0484887.ppops.net [127.0.0.1])
	by mx0b-00300601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 57B4Cqpk005627;
	Mon, 11 Aug 2025 10:34:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emerson.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	email; bh=cB7APMUTX/wbnMR5A/ZVWRMqU3IY+6NmC1IOzC+kIK8=; b=kX1FLz
	5HElWmZ47rDcupRMq5F5qwOO5ZOtqb8163/EOJSF2iUZaD8Hwq/EUWP9wH1N05Al
	87guzpk9W92zwSE6IZkNlmy8zgIU3LzEgLnoH9melgcPsmAoSRYsbUn0ukxbvI1N
	/VMiRYK4QvKcOGlueEMLOyXWLibDKdnkjBJ9k/cCrs/N4D7yZJmqEtLvcvmhJe8q
	AzbnXjLLnkxiJyPgLnWiuv8figXZkMIHwAApmn0w6dalV3vzN/SSE6sDtyT96kVj
	4ynGFD43k3X9nPI2wiVgEgHo8J0nJ0m61KzzDt88+IJfx66Os56WVAe4RkhANPJW
	KQhjITN1FdYeJIQA==
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2070.outbound.protection.outlook.com [40.107.94.70])
	by mx0b-00300601.pphosted.com (PPS) with ESMTPS id 48ehrddxqf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Aug 2025 10:34:23 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=utbqu0McIF8MeS679Ov5e7X52QtRpmmXeanPY3/XYUFlmEDoCnVRrYvJ6kCuE6TsDHwmu3Ie5pRhaViVABJOMgcngm8Y8407Yt+YAupCFf9jBK9GwcQcUJOZ0BZ3u19Tl5GoPejYn/N8PqNTVQUTHCj19LdccszNluQD2W5S0WtWsOMVrBhh7f209RInbXdrl9Limp5rslAHmfpYFYKVbfRZmr5zTFK/f84+upC8FVIDPykocJXhrXlZbKmVUeohaZnEpy8FyauUbF8cO2Q/wgxqqJ6cfvYPOmcrftlQsAEWUG1EUH6owSB4yh8Tml4+uz2iFfOFKbnnMkXLP6vSfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cB7APMUTX/wbnMR5A/ZVWRMqU3IY+6NmC1IOzC+kIK8=;
 b=ZAxGpiJILw2WrJHLL/A7s3Ga/qzisgGMkPZHjzjs+J6EnDiaQzG/CvDXx4hA4mpnOrLd9ComtuOLQ7NTpXEml5ss+MJJ4SkmJaDQEuR5/b0yF5JFMmQIv95Vx7ADX33yuyY66vZfTeLaZoUaYm5NpfJAGwn7pWoEGZU7FIrNqctdjJ7wcuUrcrqhDq8ZqI8BKeZXyI67ubGXPK6c6PudFGyFu4Bis2KNobh+dFpSTLQjD84etuDfkhSxWsTeRGpZ80PuCxPThJwGHw9bzDvRor53gmhak+Xl6mBOC3DTFXr3aNgJnfUt4OMgiGnSVekBkEQwaxnWbMcFbXHkK/mi2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=emerson.com; dmarc=pass action=none header.from=emerson.com;
 dkim=pass header.d=emerson.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Emerson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cB7APMUTX/wbnMR5A/ZVWRMqU3IY+6NmC1IOzC+kIK8=;
 b=SCT8rzy/Dt8f8PxfQfhiPL9xwVdNWf++5vuCRSh56PnTMYphb7xvoTNayAIdlR/rvz2aHZHKkOj83BobXokxkqXZ+fPkIFM9bWbBo6Cx1NlulhmXocbKPJuWJ9dfwaPw1BD0PyZnE398Hhdke5JWDMyMpfucOGP3szCFK5eSbOwNdUd3S9155DyH2WuIakSvV0stSD6UkmTiPXGQ0n+HR4KhnBnoN5n6qEzYrnvnt1tS94PX1UT/qXSjx578Jsft2ocSsDSzBfdNexTJ/8dOVJQ+kpisMnLdbKVxiPNXB8xchQ+LEbrorwlvlK/igg5H8p/GPr9LlZzxIJEdagruSQ==
Received: from DM4PR10MB6864.namprd10.prod.outlook.com (2603:10b6:8:103::12)
 by CO1PR10MB4707.namprd10.prod.outlook.com (2603:10b6:303:92::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.22; Mon, 11 Aug
 2025 10:34:20 +0000
Received: from DM4PR10MB6864.namprd10.prod.outlook.com
 ([fe80::4e12:13e3:41bb:1410]) by DM4PR10MB6864.namprd10.prod.outlook.com
 ([fe80::4e12:13e3:41bb:1410%4]) with mapi id 15.20.9009.018; Mon, 11 Aug 2025
 10:34:13 +0000
From: "KATARE, SAURABH [EMR/MSOL/PUNE]" <saurabh.katare@emerson.com>
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
        "tiwai@suse.de" <tiwai@suse.de>, "perex@perex.cz" <perex@perex.cz>
CC: "Kulkarni, Pavan Kumar [EMR/MSOL/PUNE]" <pavankumar.kulkarni@emerson.com>,
        "Joshi, Tejesh [EMR/MSOL/PUNE]" <Tejesh.Joshi@emerson.com>,
        "Nagesh, Rahul
 [EMR/MSOL/PUNE]" <rahul.nagesh@emerson.com>
Subject: Cybersecurity Risk Assessment Request from Emerson for Advanced Linux
 Sound Architecture (ALSA)
Thread-Topic: Cybersecurity Risk Assessment Request from Emerson for Advanced
 Linux Sound Architecture (ALSA)
Thread-Index: AQHcCFG+x2Tqy3aKbk6FN3s65T+s1g==
Importance: high
X-Priority: 1
Date: Mon, 11 Aug 2025 10:34:13 +0000
Message-ID: 
 <DM4PR10MB68643A6D91F19668A31E0AA0802FA@DM4PR10MB6864.namprd10.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_d38901aa-f724-46bf-bb4f-aef09392934b_Enabled=True;MSIP_Label_d38901aa-f724-46bf-bb4f-aef09392934b_SiteId=eb06985d-06ca-4a17-81da-629ab99f6505;MSIP_Label_d38901aa-f724-46bf-bb4f-aef09392934b_SetDate=2025-08-08T11:03:01.414Z;MSIP_Label_d38901aa-f724-46bf-bb4f-aef09392934b_Name=No
 Label;MSIP_Label_d38901aa-f724-46bf-bb4f-aef09392934b_ContentBits=0;MSIP_Label_d38901aa-f724-46bf-bb4f-aef09392934b_Method=Standard;
undefined: 8126014
drawingcanvaselements: []
composetype: newMail
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR10MB6864:EE_|CO1PR10MB4707:EE_
x-ms-office365-filtering-correlation-id: 9427e272-2ed2-4d12-2ad0-08ddd8c29d8f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|8096899003|38070700018;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?3pBHeiHnkDAcMjEAHOd2hXfOFw2ZLw6QBx/ISSj8HWDXPDd3eo7cV9wRzl?=
 =?iso-8859-1?Q?CQMxiMYNFqaByvPG+fQOPyvlTfGCjbYSHVd+r6hay+2FYMwlWa4SkzQWQd?=
 =?iso-8859-1?Q?HTu5NiM7bjVEacMl+8RicdfP4PAfq3peN2Fc7V8noIc5FyLbgSeyrUVyoY?=
 =?iso-8859-1?Q?KmOdCFZMZLU1O8xxBNiJI4JXceaOBt5rw1q/ORs5wpkUyGzfj9NKqRC5An?=
 =?iso-8859-1?Q?zIlaCMicc/KFfjGDyEDf9yutGLcfDJvqM3pL1g0IUReAAIOs4RDvTq5xot?=
 =?iso-8859-1?Q?QAqel3/LI50WbaGhQPH0KSxEUeVokmYUsH+TNBKRTXf9bDwTzmt6hftJDL?=
 =?iso-8859-1?Q?zUdunU89dn1o2btQoDKuVciJlRKPWmuqswgCphumHrq8xRPucyQe+D/LdL?=
 =?iso-8859-1?Q?6x6Ou8kavrM3I64dscf20M2i8gXZ9922ESB+MSSRedKRZ3+tiQnFIRwo9j?=
 =?iso-8859-1?Q?3Kv+vQ0qgFpcyX8udNfQu99Ek05mVDTbjmtlw9QpAF6NDtPqXmX3iX4okE?=
 =?iso-8859-1?Q?V0r7pNxqzsvcJg4yrFUmDBILvNejamUMdCFclNTw4UxOjlytPamZ0eg169?=
 =?iso-8859-1?Q?zlMdY5MsX2IMwVKQL0BXQN74Ww9lk9RghSxtx73S1NV7vxvxMxX+6WmxCs?=
 =?iso-8859-1?Q?O00Bq+vbdrW1TzhrjSz8TwWw5tbAyHA4+NnW3n5D4K5Dr/X6yZbxyxTUfV?=
 =?iso-8859-1?Q?78beJP98diuKhuvITdtRt6eqLIt6jFHjvLeHGrO0JT62A/3y8cyXcBq7yN?=
 =?iso-8859-1?Q?N7gJ6Aa3cWTSIKyiiWX3J5tTXJ36VY3CVmQaM7texXFsBgeRIXxjL0vkAs?=
 =?iso-8859-1?Q?VaVFXJxtBgPLukXtawB7wUrlnOYNGMjAM6V3FZyIZJ9yYJAqORRidGf4YT?=
 =?iso-8859-1?Q?HnyPb+BjAknfJvaR1XqVptqhe0rlrKmVuhekZYm3HGN9wyKVKgW79XpueJ?=
 =?iso-8859-1?Q?ow/ExjIPP2mKhCGsvnqGRpNm8q9qD5FaYZMj+t3IAcdPx7U+He9JHIajJY?=
 =?iso-8859-1?Q?SnBIGFfCsPZVnjDJZgRGqcfojPUhVD1ZwkPffFbfdRUe60i6fgKs/TdRT2?=
 =?iso-8859-1?Q?Mj6ND+gFleM1WGWUsOcVxC6yd4juwxtCFf1dWBDb0KwgRMNunpzUmVFVfh?=
 =?iso-8859-1?Q?8ED8WGMvS5rJ4/JxKDcvD/n6ol55BJczg1XSoL+UeR8MOR5yYG5tG4iQ6l?=
 =?iso-8859-1?Q?gmfHUMxwPJr5hm4bGlgwrXSxo8Q53eYneP0KFVSYC4X5Rkb+fePFrsJVw8?=
 =?iso-8859-1?Q?Gah3O5hMH+6iw7OXvTgAKzRINF5lq7dgxsXpCZ4KmqFqt4YpcZ/dCTM7qS?=
 =?iso-8859-1?Q?n8IZaIf+AnoZUb5znrZgB++0bBcZmzido7cA4GCV6eHrCQhb+Omnn+gLzS?=
 =?iso-8859-1?Q?cwNJWx3AMDcMODTrmYgQNWPw/x9P+iLEuX6tEqAs9g+kc3T2n9p829t4rs?=
 =?iso-8859-1?Q?GTRRRqExOUKY1VMoh5MksvA4wB8KI2kH42CNl76n+QgjWFEaXm55pbuWnT?=
 =?iso-8859-1?Q?qs+p1D/lEdfmfY57y+bvM+vuKDabRwgR5Ihg2LjPH2X8kN3VRXkaKV2lFX?=
 =?iso-8859-1?Q?LhHauWY=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB6864.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(8096899003)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?3d29j8zEC4berJ9SjmRtAdQ3KYt70/dvEK8Awvo0YpDxDRCy3owCWq4v+C?=
 =?iso-8859-1?Q?S1MFzLzGSRBa+dgDVPmTCgCdpBOm7I4S2J3KUu56SstiFr1cCdHCxT1u78?=
 =?iso-8859-1?Q?KhL+7UZ9clbR1xVpCPNJjkzIX5OwZi7vTnUdWv6MoLhaHSkwXi9ImVWFTR?=
 =?iso-8859-1?Q?zpi/0vUJli9R/9JpURnKTBUKccKEhj894PDchV3T0YCcBwwhN3frcItvkh?=
 =?iso-8859-1?Q?c9kZAZ3lEHIDIRKGUaSDD5Y5znTEbhWdpH2Sy3kSd2Vp7t1fWjJlntkmCp?=
 =?iso-8859-1?Q?B0XU5it26fJKp+WW8gWafJI1Mg4eyM+LOPN0ryFZjiI2BhOC4oOcFI3X5X?=
 =?iso-8859-1?Q?L487yRRy/v8gEg2IVSFPSQnHH0rnQimmXPY5ZxjW9BRF3qQviO5KYIR3t2?=
 =?iso-8859-1?Q?fTd9PTuDbLb2vsmPlth2M0KfxMuUqWtBiiAWDyBTHRiZBPXXxqPKrRo7dP?=
 =?iso-8859-1?Q?9d9khxALWst4mpt3m5A1qdWJgEcShDjpdjP98RlDd6vgh5wxHBgHcGCdl4?=
 =?iso-8859-1?Q?Ao4CSuMqJbfTQq77xfzy21oJYv0xeEpQ4ZsQzhZrahYU0NtgZAowUXKbfB?=
 =?iso-8859-1?Q?szHPyzJKoc9EwhmgXOmFLrsBtqmfOVNP3sQz0u1VOv95Q3yz/V/7bLId6s?=
 =?iso-8859-1?Q?zbO/1FRm5znNvgZsk6qhxhUFsJRw9XWz8QKn0Q9EK+nSMB49qFArimteoy?=
 =?iso-8859-1?Q?slmKM6f26yIGWpIycKJjhpO9FfXp4QJRF7Hi3yiM4fja5632pGHjtPqcCu?=
 =?iso-8859-1?Q?pCFrFfoJGNE4gr4bBOBWSi9zBX3A/LZh0CdouqKQ6CNH1PcN2O4RLp1vg1?=
 =?iso-8859-1?Q?GMpj1Qjew4HlpYa1NcgSZ7TPiUoWojeF2Uwm05sBpuk/BE+tjKNvmYuGfj?=
 =?iso-8859-1?Q?aFs4EICdluVcTwR46UdIz7cbtuiy1SY+CPEsMep1gPzWtTRwdWCSbz9FBp?=
 =?iso-8859-1?Q?KrJ+FKqQQio5tirih2vhhl9njdqHztpiTijrSff0fr9UOt2n4QKiPT0Vee?=
 =?iso-8859-1?Q?RaTTabDHdgsJ6COF2cqzbO0ZmLrl9Q7ViLPhxgqPMlTRmemZDjBlYkxJuN?=
 =?iso-8859-1?Q?yYxxLBL5ysq348PbEqBFyXmXvC8yHjWmpndOWDIex/7kOm7/IgartgRDB9?=
 =?iso-8859-1?Q?9z8QVITuljcG2/v52FCy6HfT10Fk1tGNOTK8dNoKCMlHGJILHs4bSziza4?=
 =?iso-8859-1?Q?3mVRlU5hjXZvFlTo3+ExYVJFTcGKSjU8exE+2z+oYXf+2Y1R4UwFjjNIN3?=
 =?iso-8859-1?Q?53WutXkvPsVnWj0+su7j4jzOmdseK0gICD2xrfUIKD0R9VmHbljLNW5Ilq?=
 =?iso-8859-1?Q?PUw8hqWxY8K2fBc7wNwEfZrH1Mb7myUB7DBmjhgnsxZ0tmlSRXIRiU+DS+?=
 =?iso-8859-1?Q?i/Y2XPVmjjzbrIOqKjlRm39sex6bsiv+xD9hQv+FoPO+PUpDuJRro5gCTx?=
 =?iso-8859-1?Q?Sm8pdT2xtLyQ7rnKXwv7C5CykCW3oM9iBEapZR3rpz2F6lsv0ApfcUSdVL?=
 =?iso-8859-1?Q?ggt5d5lZCVqdl3Pt92Yc/Swi69ZWjEyAthp9EO3Zun1D+0fI9icaK9H14r?=
 =?iso-8859-1?Q?lbIc00fW0CI98gnxS2P0Z3a3YRJX++cUwBcSIx+cB7Ge+UFcKZlP24RQMT?=
 =?iso-8859-1?Q?yo+jjkqTIf6DlPOuT7vrt2eaOnbfDkkKsOssso1jVZKUbYJYBb7yeopw?=
 =?iso-8859-1?Q?=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: Emerson.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB6864.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9427e272-2ed2-4d12-2ad0-08ddd8c29d8f
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2025 10:34:13.4729
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eb06985d-06ca-4a17-81da-629ab99f6505
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 mQxEvfnSWuKa4ILndSqkWSn60FoUaH9qn9Myza2mKV+vurXedD/7UCVZuHm9oec77nZKQ5cX5yrROXqayTwIY0x+fDBt0XVI2pU5AYTLN8E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4707
X-Proofpoint-ORIG-GUID: bUqxogrT4zsr6v6f6mAQhoNEfpshOR1l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA3MCBTYWx0ZWRfXy5nIE0NCjJoc
 ajxpoFR/61vkIzSJJf9OJQX2XbIXk807aNVLD68iPKC+yI0gm3b0CbLzHaUqjriC+OmhJmNIUmV
 Ba4Q7O5XAKIm31J5Pic3qsZtcUkHt4qOrgRmJKpY63lj7vVFmkEGpJu3bJ6KsuMkAUVgQ2SVVxF
 PYGPtIkXf7Csx3vc+cZLf0+R6NqagmZTydbSW6dnNkS8aTFFxRv3rYmY6Cvkl7PPV6kbpkAH5uW
 mSBgbmLBh8+upxL5xzYErxVsZgxlcApFr9CwonaECO2nczZzU8TyezXiBsYiTueQ8d6WMmZgwd/
 Ow2tRvApTqRhSulV2Llwv4QPdAuHw2rMGrotlutbOlBSJbg7PF2ixQrQBLI9XZed5i13hpH2dTG
 l8/S3a7eXL/uvIycUTGDAN09MUF7CexLMEa0UhkKKoNQNN/QpX/G6RzhNlWRbrmG64gotcKN
X-Authority-Analysis: v=2.4 cv=fsXcZE4f c=1 sm=1 tr=0 ts=6899c72f cx=c_pps
 a=nm3qkiEdQefvnzZsVJXsYw==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10 a=ZPWZ4rD8_x8A:10 a=geDs06hvAAAA:8
 a=TnvpoKyg8wxaY2Pjy_oA:9 a=wPNLvfGTeEIA:10 a=Jr2pXW48YXxDi7K3xC4A:9
 a=rGA4sRPooCNOGFLo:21 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10
 a=7yvi0DHx91fDKfvzWsLo:22
X-Proofpoint-GUID: bUqxogrT4zsr6v6f6mAQhoNEfpshOR1l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1011
 priorityscore=1501 spamscore=0 adultscore=0 mlxscore=0 phishscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2507300000
 definitions=main-2508110070
X-MailFrom: prvs=73188412e1=saurabh.katare@emerson.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: WVQ3H3XBPEM2PUPXQAZUJDPCALDNAC2U
X-Message-ID-Hash: WVQ3H3XBPEM2PUPXQAZUJDPCALDNAC2U
X-Mailman-Approved-At: Thu, 14 Aug 2025 07:10:57 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Content-Filtered-By: Mailman/MimeDel 3.3.9
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U3BECBFY5KP5W57VUBDSTALILVU3Q2DI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hello,



I hope this message finds you well.



As part of our ongoing efforts to comply with the EU Cyber Resilience Act (=
CRA), we are currently conducting a cybersecurity risk assessment of third-=
party software vendors whose products or components are integrated into our=
 systems.

To support this initiative, we kindly request your input on the following q=
uestions related to your software product "Advanced Linux Sound Architectur=
e (ALSA)" with version v1.2.1.2. Please provide your responses directly in =
the table below and do reply to all added in this email,



Additional Information:

  *   Purpose: This security assessment is part of our due diligence and re=
gulatory compliance obligations under the EU CRA.
  *   Confidentiality: All information shared will be treated as confidenti=
al and used solely for the purpose of this assessment.
  *   Contact: Should you have any questions or need further clarification,=
 please feel free to reach out by replying directly to this email.



We kindly request your response by Monday, August 25, 2025, to ensure timel=
y completion of our assessment process. Thank you for your cooperation and =
continued partnership in maintaining a secure and resilient digital environ=
ment.



Sr. No.

Queries to Vendor

Response from Vendor (Yes/No)

Additional Remarks from Vendor

1

Is Secure Software Development Lifecycle followed for developing this compo=
nent?





2

Do you provide regular security updates for "ALSA" ?





3

Is there any discontinuation/End of life for the latest version of "ALSA" i=
n near future?





4

Do you have Long Term support for "ALSA"? If yes please mention the version=
 in Remark column





5

Is appropriate cybersecurity testing followed? If yes, is any specific stan=
dard for testing used?





6

Are there any vulnerabilities in the latest version which are not disclosed=
 publicly? If yes, when will it be fixed and released? please mention in Re=
mark column.





7

Is the vulnerability handing procedure available for "ALSA"? if yes mention=
 the procedure in the Remark column.





8

Do you comply with EU-CRA requirements?





9

Do you provide proof of conformity regarding adherence to EU-CRA? If yes pl=
ease mention details in Remark column







Best regards,

Saurabh.


Saurabh Katare | Engineer, Software Development

Emerson | Plot no 23, Rajiv Gandhi InfoTech Park | Phase II , Hinjawadi | P=
une | Maharashtra | 411057 | India

saurabh.katare@emerson.com



