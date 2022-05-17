Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CADFA529C3A
	for <lists+alsa-devel@lfdr.de>; Tue, 17 May 2022 10:19:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58CFA1622;
	Tue, 17 May 2022 10:18:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58CFA1622
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652775589;
	bh=r/iEWqUM5Mg/HOsmVNdKt++7KbSjqrk+OvFZ8aouiJM=;
	h=From:To:Subject:Date:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N8KSf6AnF0d9+YeKYhnHW1+parkMyeqC5CGcuOf2VWl6psf7VbRwM6rwJZVn3oWs/
	 ylV55UkSIzKcGbjImgkRWWh58nHq/n2FYQqYknnwNj7DMrQ4QsU5mua4xHFd4Bw8YG
	 CTbS7xY7Z8TQ8I3pZgRYgdzSjtHDT0JyXgYodeNY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7379AF80310;
	Tue, 17 May 2022 10:18:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4A430F802DB; Tue, 17 May 2022 10:18:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com
 [148.163.135.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 28688F800F5
 for <alsa-devel@alsa-project.org>; Tue, 17 May 2022 10:18:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28688F800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=analog.onmicrosoft.com
 header.i=@analog.onmicrosoft.com header.b="HvBBUa5I"
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
 by mx0a-00128a01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24H7gDe9030034;
 Tue, 17 May 2022 04:18:39 -0400
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2173.outbound.protection.outlook.com [104.47.58.173])
 by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3g29b5hq8k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 May 2022 04:18:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BlIRhvKRy0RXT90gCU0W/5OK6EHt4nDm7HREiR22PVlLaDofP520RuAPJ5S0Jfklh/dfQCLnWT3j/5UlsbUT6IH0wndmYLAndCPuC0Af/rgtOvUVoNqeIRx6f6ywlI73P775P2jTbOXN9nMFLnHt626gNF75EZuWcl72k6TqonwcltFBYEy9FUw/JzkI4hH+za2aVJs3Jjl8CIGx/hGPt4DO/2Nu9j0HR6KzgoIzTcHNU3uZYkSImfLuoZPmHnHTqMEvG2QxXkNM47qCNmPtX4E2kzkNUQXwR4RLyJMITHgSW++QrfLBCFj/7pi6YqNT8A/S7kdAhwNVt1JZmaVj3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r/iEWqUM5Mg/HOsmVNdKt++7KbSjqrk+OvFZ8aouiJM=;
 b=nR4gByJWKlimLsiSG9P3uPDE0QMRWOEDgtVaBx6UoM5lfDpiseDzEmf+37JJV7x4QkZJFq3IRmX6QJjbmmhptbUyqzUxWs5dL/n/6RMvBlnyKfNHkXsH4ZPtNIWnZulQnj/yES3Mu43G/ZK8AiWae6mF8lC3C0kaTsA3DQ/0k+s+nHVYL9rVEqQ1F37izczcvM4zodYk+QGW+OXq21edb1ZTuXrmojLcxYI3Pqy4bZu15CH1DSiJRMvfqYZP22+5SG2Sz7qFpU93/kkTvzGdC+cQGCI4hbWuXwmAgZFqB884+nVrZRcBxhdIRZ1iuMJY1+4ytyRg/hI/Q1yNQpU1wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r/iEWqUM5Mg/HOsmVNdKt++7KbSjqrk+OvFZ8aouiJM=;
 b=HvBBUa5ID5vYK+JbGAVmrqaJLXuZsD00+/EBer6VDuMqaNiXYVRvx4YeifgjRK2Wc7SntbKMAH2r+P0OcqIRbWGaWeklY8uNSng3QXToPGUvBj7+iH6ajek1QgnGyqRs1uMTm2Adl/oFI7ExxhLE0UdXKwil0zkQf0A5CZjOmmM=
Received: from PH0PR03MB6786.namprd03.prod.outlook.com (2603:10b6:510:122::7)
 by CY4PR03MB2871.namprd03.prod.outlook.com (2603:10b6:903:139::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.15; Tue, 17 May
 2022 08:18:36 +0000
Received: from PH0PR03MB6786.namprd03.prod.outlook.com
 ([fe80::d4d8:c051:a366:8003]) by PH0PR03MB6786.namprd03.prod.outlook.com
 ([fe80::d4d8:c051:a366:8003%9]) with mapi id 15.20.5273.013; Tue, 17 May 2022
 08:18:36 +0000
From: "Sa, Nuno" <Nuno.Sa@analog.com>
To: Dylan Laduranty <dylan.laduranty@mesotic.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: RE: [PATCH 2/2 v3] dt-bindings: ADAU7118: add new entries for pins
 drive strength
Thread-Topic: [PATCH 2/2 v3] dt-bindings: ADAU7118: add new entries for pins
 drive strength
Thread-Index: AQHYabHNRBOAjYCNzEuJk2EQ54Dtg60iuVXA
Date: Tue, 17 May 2022 08:18:35 +0000
Message-ID: <PH0PR03MB6786A29EE38C9FDF74B4F02299CE9@PH0PR03MB6786.namprd03.prod.outlook.com>
References: <20220517054809.8244-1-dylan.laduranty@mesotic.com>
 <20220517054809.8244-2-dylan.laduranty@mesotic.com>
In-Reply-To: <20220517054809.8244-2-dylan.laduranty@mesotic.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?iso-8859-1?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcbnNhXGFwcG?=
 =?iso-8859-1?Q?RhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEy?=
 =?iso-8859-1?Q?OWUzNWJcbXNnc1xtc2ctZjA4YzI5ZWYtZDViOS0xMWVjLThiZTctZTRiOT?=
 =?iso-8859-1?Q?dhN2NjNzEwXGFtZS10ZXN0XGYwOGMyOWYxLWQ1YjktMTFlYy04YmU3LWU0?=
 =?iso-8859-1?Q?Yjk3YTdjYzcxMGJvZHkudHh0IiBzej0iOTI1IiB0PSIxMzI5NzI0OTExMz?=
 =?iso-8859-1?Q?MxNDgyOTIiIGg9InR2S3VPU3hiZjlaWUJaN2xSVm93L0h1QWdpdz0iIGlk?=
 =?iso-8859-1?Q?PSIiIGJsPSIwIiBibz0iMSIgY2k9ImNBQUFBRVJIVTFSU1JVRk5DZ1VBQU?=
 =?iso-8859-1?Q?VvQ0FBQ0UzT095eG1uWUFXUXpla0tDMklBa1pETjZRb0xZZ0NRREFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFIQUFBQURhQVFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFFQUFRQUJBQUFBVklFdm9RQUFBQUFBQUFBQUFBQUFBSjRB?=
 =?iso-8859-1?Q?QUFCaEFHUUFhUUJmQUhNQVpRQmpBSFVBY2dCbEFGOEFjQUJ5QUc4QWFnQm?=
 =?iso-8859-1?Q?xBR01BZEFCekFGOEFaZ0JoQUd3QWN3QmxBRjhBWmdCdkFITUFhUUIwQUdr?=
 =?iso-8859-1?Q?QWRnQmxBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUVBQUFBQUFBQUFBZ0FBQUFBQW5nQUFBR0VBWk?=
 =?iso-8859-1?Q?FCcEFGOEFjd0JsQUdNQWRRQnlBR1VBWHdCd0FISUFid0JxQUdVQVl3QjBB?=
 =?iso-8859-1?Q?SE1BWHdCMEFHa0FaUUJ5QURFQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFRQUFBQUFBQUFBQ0FBQUFBQUNlQUFBQVlRQmtBR2tBWHdC?=
 =?iso-8859-1?Q?ekFHVUFZd0IxQUhJQVpRQmZBSEFBY2dCdkFHb0FaUUJqQUhRQWN3QmZBSF?=
 =?iso-8859-1?Q?FBYVFCbEFISUFNZ0FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFCQUFBQUFBQUFBQUlBQUFBQUFBPT0iLz48L21ldGE+?=
x-dg-rorf: true
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a2d10693-b623-4998-7a5b-08da37ddd6fa
x-ms-traffictypediagnostic: CY4PR03MB2871:EE_
x-microsoft-antispam-prvs: <CY4PR03MB28717DD08BFE2C97A457833A99CE9@CY4PR03MB2871.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: j02jHeLtFXWXbbq5Cwy9O6IpV7Slle7v0qyS/tFO+NpH1kRP1Y7qu92se5JCkzt0fQZHSCuLDAa/lUDBh2KCpTmgWZ+NEWQ9z8OofL5cgCOc5KsBuIDO/K7WYAWhqpf97tyX4WAXUvnKSIE47bhkfNxo5N10hEUVMmZ6Q9ImZf9HDJ98WLeaYAp4AtkvnyHc2c7A0ZC1i+MpPsPePOVOdUFJhkPqZu4ONokUQEa9i5ipB27acqFUJRzjCPNxhbDA7WiYrkPfh0PKMYG1bAq03GMM3R8C7yiPSwdOys7O19ptKBu2VzsudSOn53vf/Zk9Hliy0ZAhZGeBsie3yraSJfFw4KxxpgtMTCNhadI7AguhJHR0WObdsAiGJIiizWsyFoOh/WMKJpYvXTomSOYnOSVq+l3wNfGCCZT8yGtZaOv3KXThTHGo218GzfPYyv1GBroPwlWeEj2Iqyi5VSkfe08pjpHJGmQDiaWvhK9ISKUj9jyRVZTTLsgvx8T4NS9MfxeMmZ7QJrkj713/k5WJ44EHI92au5CXpUxSwolETGModDdiFCylLbe3B4wb/UWfIrmXoFHgSAOP3KMwJvqLP4eqnAUP0tI6mAuG9Cv1F/a15bKesBH9C1PeTDQLPhBztdUiAxKNyy/YxBA9JFczFaG6gLQ3AufR4RPHD2d32UnEWKQ8Tr3kltmXFb5u0+wdz5YtsC5KiMK/QO3NLKci3Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR03MB6786.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8936002)(7696005)(52536014)(55016003)(83380400001)(122000001)(186003)(508600001)(38100700002)(86362001)(5660300002)(38070700005)(6506007)(33656002)(66446008)(4744005)(76116006)(66946007)(66556008)(8676002)(66476007)(53546011)(64756008)(9686003)(110136005)(2906002)(316002)(71200400001)(26005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?uYNc3kgON2dIIbCSAu74RWK0tU4NO+bGNlNux1TMIuL/yXCdXEqBrneN6z?=
 =?iso-8859-1?Q?xHcWJSdUEdCjdtVI+lA245xY+cGDN37lqPhnpG24G/Co/B1Ijni62rRrvn?=
 =?iso-8859-1?Q?V3nJpyGEHp4uVv5xYQSASHQX8nhGgPTvpZw/zIPyIgoVCvdy923WLoKiWn?=
 =?iso-8859-1?Q?FZOxQvXM7Sk8VwJTNMZZrpqW3wZ+nhU/zn6KmUhHOUK4dUO2B+GtTfUZOb?=
 =?iso-8859-1?Q?awOQMgjbyGY//mHJ1PS4g6YJOOxnrq37mU7wC4WcgbL6gvgcUdgFl08V43?=
 =?iso-8859-1?Q?sYDvFwvFKC1tPiIV9/SbSxs9BCy5E5wbYy+vwZP5Jw0TFtKFUGXaK+rYuf?=
 =?iso-8859-1?Q?n0nJkczdHkMzfHNFWUsPMK+xLOLcUOxe/eZurgO/mSbx30pOBkqFBcj4d6?=
 =?iso-8859-1?Q?g2GblZen2FvSEFJfcJz0IrKoibMnjKuh+hzgJDm2317NHgzeW/2ZMskj3Q?=
 =?iso-8859-1?Q?D6Su44W/Zi4c7pMMaZ3nKqdhsfnI8wOXFFusa4XMQ2Vidn0MjF+sIQAP2F?=
 =?iso-8859-1?Q?ggCUyKPaDxqjnA02rav0Y4PgtqbBhV/XxJyvM65dSKLr6Dfvet55nk+NSz?=
 =?iso-8859-1?Q?aBM3jn0LgPPkGc5XmReWbRbkJiC0OmAqE18GsNLY+nUsHWB37CPKCTuf6S?=
 =?iso-8859-1?Q?J084QkNo6DUU8QSunv3qhXyDE295rkfz+lcSPtx4hW24wvvQEuL1H1J0L/?=
 =?iso-8859-1?Q?DIqGm3l1Q8kNih/GwbmgGyMFfx2pdtlgSYEkjr89UKTXh08n3+bEQubpQt?=
 =?iso-8859-1?Q?Y1JWsv9mvoZ6TT5BQY0htA67t40GXrTx5xfqenqPKHHstcN07aJbZfDR2c?=
 =?iso-8859-1?Q?nmmavIkiu7b0xC6HrWTWBopw2h0dm5kuJ4Lb6UODKqJYhlOqUECapphHEp?=
 =?iso-8859-1?Q?1XkCGnNGVHkZJVy2cBXhzEbiD5NuLlup0UyShSs4jlXuw5YpOzZC8hlTpC?=
 =?iso-8859-1?Q?HQ80o98RQgGU93/ObQqH3JctjWj8dSdx144Y93c2Whj+FEG/dy/zt9jeEv?=
 =?iso-8859-1?Q?rp6TYeeu2fzERNaTAu0TjDCZuLwrEk4tfF96vTURwjUqnu8Ju2NNPLL6Mv?=
 =?iso-8859-1?Q?3vMvO/ftKvIVSBuK+kPO5iAMbtBFDSKVshf1yq9w2CkjO2AqrDl8optOnb?=
 =?iso-8859-1?Q?RpH+bEt4+q9Nex3rMbWMnwm0Y1+a3Z5bQOIXADIyTIjX9QAv8Tuv7GioX0?=
 =?iso-8859-1?Q?dMEWhDRNpURQ8Gh1c8zCv9mzvathAD6yOy714dqXwmpx5IkZyuIPnikZRN?=
 =?iso-8859-1?Q?kMZDSKzK/yzHUcoT1lYql2ML3mp2NagyDSG1i/1Pp4phrnzP6SpwnTPucG?=
 =?iso-8859-1?Q?ay1r3GvOaaQ9KVLODsyJEVFhkoBmJLfU4rkBGCAR+PDiHu0NmNMc2r/xsr?=
 =?iso-8859-1?Q?xsuZzaadPjZLBewkixevCFq8BybtCEhNQsNwLwApTIPWQeCf+mnC4FdAUO?=
 =?iso-8859-1?Q?WcqpdgqmL2nDPdNkud5OZ79MEJ6RVMSixskON2SMtvBHeKUjwmaEQjMOuI?=
 =?iso-8859-1?Q?VnNPz/8wqwZtQP+DKn39FoJus3aS9WlsdNmf25ogFXZ4O271Klv7wSd2Jf?=
 =?iso-8859-1?Q?dbjAnR5OFyUMZ/L341/Iw3WDs5xgiDiUAhheZc/BXgYRArwG407MiZwb/7?=
 =?iso-8859-1?Q?CUFGAT3d4HhJVdWwT93We2c7vzf7srb3k+CNvPRGV65n4yArbwOoFdDfQ+?=
 =?iso-8859-1?Q?jC5r8dQFpFa86ODxKdKdkBp6jcpsu2h/2eZAInrMN6wlZOpI74gV3X+eRZ?=
 =?iso-8859-1?Q?6ROdY6fFCvSryx1CfwY8QZYrfBtogr2onbitoyKqmlV0Etxkv3iHTjyGvV?=
 =?iso-8859-1?Q?UAyJZqTWGA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6786.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2d10693-b623-4998-7a5b-08da37ddd6fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2022 08:18:35.9761 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1zj5aPKtulm0tydmx4ElCzX2haixu6xBBk66SbBuJRd4XnhaZ/q9ueWh0eV3Rr2fQhQcrGiiAltu9WIFkSjGag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR03MB2871
X-Proofpoint-ORIG-GUID: Weivazf3xyXxf7Af31BwA77kIn9jpESb
X-Proofpoint-GUID: Weivazf3xyXxf7Af31BwA77kIn9jpESb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-17_01,2022-05-16_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 mlxlogscore=803 suspectscore=0
 malwarescore=0 adultscore=0 phishscore=0 clxscore=1015 mlxscore=0
 spamscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205170050
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

Hi Dylan,

> -----Original Message-----
> From: Dylan Laduranty <dylan.laduranty@mesotic.com>
> Sent: Tuesday, May 17, 2022 7:48 AM
> To: alsa-devel@alsa-project.org
> Cc: Sa, Nuno <Nuno.Sa@analog.com>; Dylan Laduranty
> <dylan.laduranty@mesotic.com>
> Subject: [PATCH 2/2 v3] dt-bindings: ADAU7118: add new entries for
> pins drive strength
>=20
> [External]
>=20
> Update driver doc with new entries for managing pins drive strength.
> Add a table to describe possible values for each entry.
>=20
> Signed-off-by: Dylan Laduranty <dylan.laduranty@mesotic.com>
> ---

Just a note for the future. In my previous review I said something
like:

"
... With that fixed:

Reviewed-by: Nuno S=E1 <nuno.sa@analog.com>
"

Hence, you could/should have included my 'Reviewed-by' tag in v3.

- Nuno S=E1
