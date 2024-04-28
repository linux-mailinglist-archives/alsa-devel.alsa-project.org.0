Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 444B08B776D
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Apr 2024 15:45:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC525839;
	Tue, 30 Apr 2024 15:44:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC525839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714484709;
	bh=BlLR3VmaNOtlUVj69xW1y8yCXJwrwlKzIRm7h4h3rBs=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Dmo7ZejFNdsKIBgXnmEW4buGHE9FG+clG4eQoKP5yhXQ9qaqo1jgVnjP8M1/0ahnW
	 eEfejwU4+eOWtekHCs4AXlZ1prwJJkNfewrjK+3FSD4R6EX10LzLVAjlA4S/M9I7fm
	 K75zjziIkoK2NMJokqlEkV/5EuB5qLeUbeNll6Zk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DAB3FF80570; Tue, 30 Apr 2024 15:44:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D49EBF805A1;
	Tue, 30 Apr 2024 15:44:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1E3DEF8028D; Sun, 28 Apr 2024 18:38:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mx0b-0068d901.pphosted.com (mx0b-0068d901.pphosted.com
 [205.220.180.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D4F25F800B5
	for <alsa-devel@alsa-project.org>; Sun, 28 Apr 2024 18:38:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4F25F800B5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=biamp.com header.i=@biamp.com header.a=rsa-sha256
 header.s=proofpoint header.b=Bd8LSWVb;
	dkim=pass (2048-bit key,
 unprotected) header.d=biamp.com header.i=@biamp.com header.a=rsa-sha256
 header.s=selector2 header.b=sodSh94Q
Received: from pps.filterd (m0278265.ppops.net [127.0.0.1])
	by mx0b-0068d901.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 43SGRqos016489;
	Sun, 28 Apr 2024 09:38:21 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=biamp.com; h=
	from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	proofpoint; bh=BlLR3VmaNOtlUVj69xW1y8yCXJwrwlKzIRm7h4h3rBs=; b=B
	d8LSWVbblDODkhAKbpTBqaWY2C267wCLj8E3/gc3jZTHoGW2qf9+fx3DM3l0ahVw
	qeXygVkhhjyGyl13bijqVgW9EDg0NQJKUFHdmJGWHiclVWIBs2ra/aisVxy6iouv
	m6HoPP9le9AOkbYuOeTfz7KYYlRWrWa74bAU1R6DXfO9rI6j6qAF5Nt54VyqyZcd
	dmzDZ8tsuT3ngV4kvevi39SbW7TVq/fzGUtCiaFXTtjC4vbfIvgIhBzBfHYIX6yI
	kYwLTo5GMg869dzXdRiIZj3bMiNpRipRknxCguo9esLuG8Emu3GMoK3CB/k/s2vT
	Ow5rOwErXlgNQb+ywvAKw==
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam04lp2040.outbound.protection.outlook.com [104.47.74.40])
	by mx0b-0068d901.pphosted.com (PPS) with ESMTPS id 3xrx2x0quf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 28 Apr 2024 09:38:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mI0aXQimhgH9pXvPOQmjxXfafnppbChSBJRb5vbIGHYMlDF9xkHTF8D4Yg+bVfLTToG+XUPAqs0TWh8LciTM+d4HtosIDuDFLbRbQLSYNMWid51RLK1h2hOKc/ah9dDEFsO+Y3hsK9GAch0YBylWTVkNfB/sRLP1eqpbdJRJGl4g8wJ38o/6GUeXq3HTKKIVy3DgJIukCavHoBfPI2smqExLe6r4+QepgZ3w8Zy8jaXf4PfeVyFcME5KwSRGdGbvKoBjC9UL8+/DXCa6Z5OuDr0EKMAQyXrP9eOd74aU4K45k0rcRmBu/5JN4QqUYEeGl/Q1wN73zwLF6zZJ3DItiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BlLR3VmaNOtlUVj69xW1y8yCXJwrwlKzIRm7h4h3rBs=;
 b=K9cyO2PaV6Jzkf4qVn1O+LQDeEznCtAx5IF5vJMf0QVAGnyThVbNnrc0X4elKKbIejRobnbKTYFuylzaJmGXnr1aoztDh69KCKeIcGExgsS2f4WEHRrneuQAgFyUkXcORxdAoIugNft4/uUO+bzzm7u3vv/W41PCDJBGVQF5S0yKhIaHmHwfgWxRl3y+KqjZngfbxdykgEvmE8I2Vdeg0HCKdLR9v+grmC7OvXoVLJPjdUgNlBEclggtoJL3HJPUulNOH4vXMljJU2clDV2pr39B2Si0xqzuj/xXR/h+k8h4pdpUPYHq9ABKyP6v8vVr7DVRkB5W7PF572UMAUFjAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=biamp.com; dmarc=pass action=none header.from=biamp.com;
 dkim=pass header.d=biamp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=biamp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BlLR3VmaNOtlUVj69xW1y8yCXJwrwlKzIRm7h4h3rBs=;
 b=sodSh94QRT60V/PnM99rzdCeJKALWv2S0IfdgeHvZRy4Idt5XDe6Xxvubi8sp9XpcqVtmdJTFs1YNi8Lpzvkn6GJjg6IyN2bRVtjq84oIMQzfyxxXhtlCNi9vNPj5cSiYanVpHOWUCbD9mA/SfNbijq7YGo5pnJXm3SN9ql/IKaUuXF+BBEdHtH+cSGBS7ZPY+LFmIXNioMNJhbpypzb83+kNp+bNjQBnZIIrLVjFyLSaGB3I90oSYKozGcIKS32QQ89YCoaXlNSWTTrDmNoQnYdVUDezNl3kaiMWI7B7o2cCDdYNIkYXO+H/ufAAQ2/qCkzWK7o86v9GRRufDnnDg==
Received: from CO1PR17MB5419.namprd17.prod.outlook.com (2603:10b6:303:ec::17)
 by SA3PR17MB7019.namprd17.prod.outlook.com (2603:10b6:806:2f3::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Sun, 28 Apr
 2024 16:38:17 +0000
Received: from CO1PR17MB5419.namprd17.prod.outlook.com
 ([fe80::f48:ee61:a81b:d555]) by CO1PR17MB5419.namprd17.prod.outlook.com
 ([fe80::f48:ee61:a81b:d555%4]) with mapi id 15.20.7519.031; Sun, 28 Apr 2024
 16:38:17 +0000
From: Chris Wulff <Chris.Wulff@biamp.com>
To: Chris Wulff <crwulff@gmail.com>, Pavel Hofman <pavel.hofman@ivitera.com>
CC: Takashi Iwai <tiwai@suse.de>,
        "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>,
        "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Felipe Balbi <balbi@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>,
        Julian
 Scheel <julian@jusst.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        John Keeping <john@metanate.com>,
        AKASH KUMAR <quic_akakum@quicinc.com>,
        Jack
 Pham <jackp@codeaurora.org>
Subject: Re: usb:gadget:f_uac2: RFC: allowing multiple altsetttings for
 channel/samplesize combinations
Thread-Topic: usb:gadget:f_uac2: RFC: allowing multiple altsetttings for
 channel/samplesize combinations
Thread-Index: AQHalhrEn9WZsEFVxUGMqGyQkwLwG7F4t+YAgABglgCABL1jgIAAERlT
Date: Sun, 28 Apr 2024 16:38:16 +0000
Message-ID: 
 <CO1PR17MB5419D45A1BDC2AFA22F60DD9E1142@CO1PR17MB5419.namprd17.prod.outlook.com>
References: <35be4668-58d3-894a-72cf-de1afaacae45@ivitera.com>
 <72e9b581-4a91-2319-cb9f-0bcb370f34a1@ivitera.com>
 <871q6tbxvf.wl-tiwai@suse.de>
 <22301bb6-d893-2e65-6ebd-1787ca231387@ivitera.com>
 <CAB0kiBJm=Ya6a1mWRZ28p9=D_BesH55DFk4fd4wP0be4zKPR7w@mail.gmail.com>
In-Reply-To: 
 <CAB0kiBJm=Ya6a1mWRZ28p9=D_BesH55DFk4fd4wP0be4zKPR7w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR17MB5419:EE_|SA3PR17MB7019:EE_
x-ms-office365-filtering-correlation-id: cec7c2bb-e6a0-4cd3-146f-08dc67a19b24
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230031|7416005|376005|366007|1800799015|38070700009;
x-microsoft-antispam-message-info: 
 =?utf-8?B?MVk5QnIyMEYraFlmWE96MHBuL0xac0prRHZiRTVDaXR3RTRxU1BzSGoyczQv?=
 =?utf-8?B?TTRkcWtpeW9RWEJPeXMxQTlyN2Z6S0ZhV2p0eldiSVFLcHZHMGlmMjJ5L3BJ?=
 =?utf-8?B?YVdUT1dUcTBISzZWR3hvZEExTXN0Q2hOcDJNOFpxZEdqbkQ1NkFFeVd2VTd2?=
 =?utf-8?B?dXZGb0xmeFg2UUJITjdPOWIyUklQUGhPZUVuMUdna1JWQS94b2U3UTNsU3Ur?=
 =?utf-8?B?YWdhVU5ZaTFDdXpocER0SVFkdFRzdWU3SUwvcjFzaWMvRjZ5UDcrZkh3ZEZV?=
 =?utf-8?B?NmFqcXhFbWdLWnJGS1pBS2E3R1Awa0N0UHhEVUtTZ3pPajBmb3R1SVJob2ZK?=
 =?utf-8?B?T2FYR2RnVGFnZEdmNHpaNXJaMXpPMEgzTjloeHpGT01CdHZQeWdaWEU1VGhv?=
 =?utf-8?B?Mm5oSkZlZ0kzUW1MMVN1dzA5cStJNWp6Qml2eFJ1NzRuZGtGbDdaaFI3VlVG?=
 =?utf-8?B?NVlESXJPMEsxeFJudDBOTzI4TGo2RFVEc09sdUxmWkxESUM2WnhVVEpmYVlD?=
 =?utf-8?B?TWVVVkJaSWdQQU1pUml5WmxBL1F1b0hqVG1VWGFmeHhDWCtXMTkvOTU5Ui8r?=
 =?utf-8?B?WUdvYWpUeXMzeTRKM3cvaHk3MUlrV0svMllYckNBb1NFT0xtYnFNQTB4N1Zn?=
 =?utf-8?B?RGU1N0hhSFlLRWdvbzhwNk9YZnFCN0NyUzFndVZ0Wk54SGwzc0hGQnRqc2hW?=
 =?utf-8?B?TXpRbE8vK3FkN1MvZzBEbXN2aURZYXJCUnR5ZTJVcjduR25WQ0U1aFVtdDJZ?=
 =?utf-8?B?VUJkanBuei84Mnk4a05qcWYxbWdpUkExUStNbFdFZUZhc1MzWDJZN2NJYVJa?=
 =?utf-8?B?TDlyTjJjUld5dFNTZ2xEd3VxK1VIcG1wa1ROL0FkcXVEVlFKeFBQRS8rdVNh?=
 =?utf-8?B?b0dYaExhVXNFb0ZjVXlIWUdSQ2ZzYnJzTDhtdmVqaEI4bFF0VmhCd0xya3Nj?=
 =?utf-8?B?Tm9nNlQ4U284ZlN3cFRRUlVjaENkVmhPd2o5bzVlMU8vbzd3Nk1VNktaV2du?=
 =?utf-8?B?VDdXK0dOQktFem9HMHJTQ3ZsZU5pbHlIYkw5aGdGQXZlSGR0YThraGsyV2o2?=
 =?utf-8?B?YWJFSUJpYmZaR3ZJempSSlU5NDhzV2JoQzVVbklxbXVQSE1YRktaUnhwQnRx?=
 =?utf-8?B?ZDRyWVZKMWNvWVNLNXlBbU85cmFqTkd1UTRkU0pWNlVEeTkralBBemRQSlNP?=
 =?utf-8?B?dEpURmJzQU5kM0FlNjlUREtHOFNDamxYejVuRHVRaXFZUFNHNkpneXVwTUlt?=
 =?utf-8?B?b05oRGhkUEFFdGpUeFJybG1IZVlJeVE3MHNzclB5T1RyME1wTjRpZmRwUVRR?=
 =?utf-8?B?NWhsOGt4dlNlaEEzQWl0VkluejczSWt3SmJsNXJoYWRFbE01YW1lUFNIUGFR?=
 =?utf-8?B?amUzeUZ0MTUvQWNUN2MyV1NUWnNtNjg3U1B4UE44Qjd2RVVxbWg5b1hXRmFH?=
 =?utf-8?B?WFRvYXROcnkyZ2lJdlVzZXJOU0FWaG5xU1NvcktPTDU0K0N5NXVXUTBEVk4y?=
 =?utf-8?B?QXU4SCtUWGZneS9GTUlheWowT0JYSGpPYWJ0bXNXWjhwN3RMZ2E0ZUltakNa?=
 =?utf-8?B?NnF1c2lSb3ZmWXEvY2doMHQ2c0NIaGpSUVdZSGdyeUVDQllReUlrUXlPZFF5?=
 =?utf-8?B?RW9sMzQxd2xvR1VZeXgwRm1ERFYrNUNYc3RSNHovT29SS1M4MEJib0dhNVVD?=
 =?utf-8?B?WUlMYi82RGZ1UFcycTFKclowLzFHdnJldHJUQVdacWVTZTF2Tzg0MWRBPT0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR17MB5419.namprd17.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7416005)(376005)(366007)(1800799015)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?bEdMSXNMdEVSVlBrcHlOOHBDclRTTlowelg0c0gxM3hmTlNYQXFQV0NQM1VJ?=
 =?utf-8?B?ZGpZTG5TRXNtTU1qa2ZjcXJPRUh3R0wxMy9sZGNKTnM0TnY3MSs3VEs5NXll?=
 =?utf-8?B?TlVRR2wraXpWKzZMM0F0L0ZOdDhLbVMwWjVmakFkYWQrazJMSjdtSnExSXM0?=
 =?utf-8?B?NlhEZk5DQmt5T0NZWmIrTGlJcVlaUzNTZGN1YVYzOFBwN1F5U2xWSVZGMWhY?=
 =?utf-8?B?Z0FPWmw0REdvZ1g5T2RlRjIxZ21ucEVyMFU1WFY0UjEzbHcvaXNqYmpoSlRv?=
 =?utf-8?B?SStXdlcxYUtUUzZuYkNXVCtscmdWc1pWM1A0dkQ0OEJJMEpOdmFBNU5oVXhB?=
 =?utf-8?B?c0JBTGxnLzc3dW51RHhFTCtUOERPU0VZWHFQbmFveTZiY1JIcjMvV0ZFWUpQ?=
 =?utf-8?B?aXo1NlAwUzdJZHZQR3F4bWJ4TUFvbGc5SkZzY3dJUzA4SWFEbFJHUk1oaDZO?=
 =?utf-8?B?OHJqRUxibXRwL3liRWdIRjlxczFuVy8xZDhSOHpGWVcxVlA4ZENkTS9Da1Nh?=
 =?utf-8?B?LzJROEhCVE55UERhSnpKRnZvdFkvUHhwSkwyOVdtdTdhcElnNDB0RkV4U2FE?=
 =?utf-8?B?TW9IVDYvZXg0UnBNUmdqSnhEL2Z2NGs1aHQ4bHY3Y0hMS3pUVmFoWnI4Vitt?=
 =?utf-8?B?cW9odHVOTWJ1RnBoa2kxZUh2TEk2R3djbFIycGJRUVBOTnIvRzQ2am0vZmNm?=
 =?utf-8?B?OTFnVW5EdXM4ak90aVNBT3ZnZWJnc2lXQ1duWmttM3czYUIxV0FJb3dYc0l1?=
 =?utf-8?B?NzFlNVRGTFFlRXdTanVBNVVRQTMyNDErZlFycGYzcUtoQm5tNU92ajkwbFlm?=
 =?utf-8?B?dG85UkVMSk1xa3hJbGZRT0JRblk3NDVIVHlFcUlMZEp6c2xxUG55S2hORUly?=
 =?utf-8?B?ZXFGSTIzbnJzUjc4TWZsSkV6VVkyOW5XREVCQVRrUERrQWVQZHBwZUViSGRV?=
 =?utf-8?B?Uy8ycnRpV3pNUm8yUWhUQzA5M0F3QzBJenVXMTExZ0kzZlBtTGFvS1laYU9N?=
 =?utf-8?B?S1UrYnljdE9EUDF4YXEzbGQzRE5MWmJkaVB1RGV6OFIzZnpPL1dhbDh2Y05T?=
 =?utf-8?B?RDFaNkFCQ0ZDMHlwRExwWndzUTB5ZkE4NERiaENNU3FyR3Z0TmVhV0JxWTFh?=
 =?utf-8?B?UWpyelVuZFJRVmltQnJKVnh6a1IvN0xkVWVuZ01xWS9CMGZtcVRUV3AwdUVx?=
 =?utf-8?B?Wi9vYUhwK0dTbnlBc2hrOWRwUGdpcnBmNXIrU0M1R2FITHRDL3NqaWhhaU9M?=
 =?utf-8?B?T3JabTNyeHRwelI5bmhyOXhiRFlpRmE1OTdUeGg5dDdFRmlKOEVoNFlPa002?=
 =?utf-8?B?SlEvZ3U3OWZPakcyL08rVjFreno0WG5KMzFIaGFKYjdDTHBVZ1NsRlB5U0cv?=
 =?utf-8?B?VmxldUc5WkRyQm9pSnoxNmRzdGE2cTRlSFcrclh2TG9SeVpSUnlsNC80RGUx?=
 =?utf-8?B?TjVVNjBUcElmendCdmY2enYvdE1Sc052RzZQL1h1SWllWDFmNWQ1S0pveEJC?=
 =?utf-8?B?RVhkWWUwZWszUm9zdzFJSjdoUUpvK0tYQ0VPMGFrRkdqQ1dtYTUvSEZhOURl?=
 =?utf-8?B?eC9tVlRDdWduRkNacjh0bi9GSDJaVjRwcy9ZdHJESHpUYmQveTUwd3hGWk40?=
 =?utf-8?B?d2dtT014b3lkN2xBZ2pmeUpKMGRwN1pHY0VRQW5KaS9TS1hhTHZpeDJNK1BT?=
 =?utf-8?B?VjloVE5tb08vNlpDRFlXdjBNa3VDMk1YNkticjBXOEJZNE1kRU5YRkZHZzE0?=
 =?utf-8?B?dnBsZ1JCdEFQUDhlMlRzSlR5bndVYjNydXpmT1BodG15SjFGYkU0aENhMzN1?=
 =?utf-8?B?c1BSdXVMem9HNWMyMVVhaENsZUtmUCticXFSY3pyQm5tOGxXOFZ3OVBBbGZx?=
 =?utf-8?B?cE4yZCtUUk5FSUhYcktyV0NXbFh5NHhpN2F6bVI2K3lDQlViSFc3N2VhbGhm?=
 =?utf-8?B?L2svRzFoMXoyOC9MdFRXdjFKNG5LbmlHNWdUNVh6aFc2SWI4VGQwcTU4aUNm?=
 =?utf-8?B?QmV0Q1FMUTB4dTIxSURaSlNSVDZ6bzJxTWNjOEVIdCtwZXdjOUdjcFhFZjd5?=
 =?utf-8?B?WlNHQlZnVzk1RmFRZnU4Y2JOdk1TTHJVbWJvSFd6bWRnRURZZEZUOWZBYWRE?=
 =?utf-8?Q?LwhV/jhXiKnlXLL2M1vst0KFj?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: biamp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR17MB5419.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 cec7c2bb-e6a0-4cd3-146f-08dc67a19b24
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2024 16:38:16.9953
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 341ac572-066c-46f6-bf06-b2d0c7ddf1be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 vY344poo9/2NzRd0w26z5GcDO848A+HllrFdgHbmzo8jKCPQe+DtSO8c1cbNifkkiR44YD1yYvvIi/ZG4W4c9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR17MB7019
X-Proofpoint-ORIG-GUID: zp_94lfRxsd64aV_5L55oEs3e-r_nyLT
X-Proofpoint-GUID: zp_94lfRxsd64aV_5L55oEs3e-r_nyLT
X-MailFrom: prvs=5848fad0b2=chris.wulff@biamp.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: YRRXE5JXKEHLABXOHGFL6OPKAJWZCWXM
X-Message-ID-Hash: YRRXE5JXKEHLABXOHGFL6OPKAJWZCWXM
X-Mailman-Approved-At: Tue, 30 Apr 2024 13:44:32 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/26SRZK3KMTCZF3BNXWVXWP6XL44CYXBS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

QXBvbG9naWVzIGZvciB0aGUgdGVycmlibGUgZm9ybWF0dGluZy4gQXBwYXJlbnRseSB0aGUgZ21h
aWwgY2xpZW50IG1hbmdsZXMKcGxhaW4gdGV4dCBlbWFpbC4gU2VydmVyIG1lIHJpZ2h0IGZvciB0
cnlpbmcgdG8gcmVzcG9uZCBvbiB0aGUgd2Vla2VuZC4gSGVyZSdzCnRoZSByZXBseSB3aXRoIGZp
eGVkIGZvcm1hdHRpbmcuCsKgClBhdmVsLAoKwqAgRm9sbG93aW5nIHVwIG9uIHRoaXMgYW5kIGRp
c2N1c3Npb25zIGluIHRoaXMgcGF0Y2ggc2VyaWVzCgpodHRwczovL2xvcmUua2VybmVsLm9yZy9s
aW51eC11c2IvQ08xUFIxN01CNTQxOTVCRTc3ODg2OEFGREZFMkRDQjM2RTExMTJAQ08xUFIxN01C
NTQxOS5uYW1wcmQxNy5wcm9kLm91dGxvb2suY29tLwoKRXhhbXBsZSBmcm9tIHRoYXQgdGhyZWFk
IHdpdGggY19hbHRfbmFtZSBjaGFuZ2VkIHRvIGNfbmFtZSBhcyBpdCBsaXZlcwppbiBhbiAiYWx0
LngiIGRpcmVjdG9yeSBhbmQgcmVtb3ZhbCBvZiB0aGUgbnVtX2FsdF9tb2RlcyBpbiBmYXZvciBv
ZiBqdXN0CmFsbG93aW5nICJta2RpciBhbHQueCIgdG8gY3JlYXRlIG5ldyBhbHQgbW9kZSBzZXR0
aW5nczoKCihhbGwgZXhpc3RpbmcgcHJvcGVydGllcyArIHRoZSBmb2xsb3dpbmcgbmV3IHByb3Bl
cnRpZXMpCmNfaXRfbmFtZQpjX2l0X2NoX25hbWUKY19mdV9uYW1lCmNfb3RfbmFtZQpwX2l0X25h
bWUKcF9pdF9jaF9uYW1lCnBfZnVfbmFtZQpwX290X25hbWUKCmFsdC4wCsKgIGNfbmFtZQrCoCBw
X25hbWUKYWx0LjEgKGZvciBhbHQuMSwgYWx0LjIsIGV0Yy4pCsKgIGNfbmFtZQrCoCBwX25hbWUK
wqAgY19zc2l6ZQrCoCBwX3NzaXplCsKgIChBZGRpdGlvbmFsIHByb3BlcnRpZXMgaGVyZSBmb3Ig
b3RoZXIgdGhpbmdzIHRoYXQgYXJlIHNldHRhYmxlIGZvciBlYWNoIGFsdCBtb2RlLArCoMKgIGJ1
dCB0aGUgb25seSBvbmUgSSd2ZSBpbXBsZW1lbnRlZCBpbiBteSBwcm90b3R5cGUgc28gZmFyIGlz
IHNhbXBsZSBzaXplLikKCgpIZXJlIGlzIGEgbW9yZSBkZXRhaWxlZCBicmVha2Rvd24gb2YgdGhl
IChjdXJyZW50KSBwcm9wb3NhbDoKCiogQWxsb3cgdGhlIHVzZXIgdG8gY3JlYXRlICJhbHQueCIg
ZGlyZWN0b3JpZXMgaW5zaWRlIHVhYzEgYW5kIHVhYzIKICBmdW5jdGlvbiBjb25maWdmcwrCoCAq
IFByaW9yIHRvIGNyZWF0aW9uIG9mIGFueSBvZiB0aGVzZSBhbHQueCBzdWJkaXJlY3Rvcmllcywg
dGhlCiAgICBmdW5jdGlvbiBiZWhhdmVzIHRoZSBzYW1lIGFzIGl0IGRvZXMgdG9kYXkuIE5vICJh
bHQueCIgZGlyZWN0b3JpZXMgd291bGQKICAgIGV4aXN0IG9uIGNyZWF0aW9uIG9mIHRoZSBmdW5j
dGlvbi4KwqAgKiBDcmVhdGlvbiBvZiAiYWx0LjAiIGNvbnRhaW5zIG9ubHkgImNfbmFtZSIgYW5k
ICJwX25hbWUiIHRvIHNldCB0aGUKICAgIFVTQiBzdHJpbmcgbmFtZSBmb3IgdGhpcyBhbHQgbW9k
ZSwgd2l0aCB0aGUgZGVmYXVsdHMgYXMgIkNhcHR1cmUgSW5hY3RpdmUiCiAgICBhbmQgIlBsYXli
YWNrIEluYWN0aXZlIgrCoCAqIENyZWF0aW9uIG9mICJhbHQueCIgd2hlcmUgeCBpcyBhbiBpbnRl
Z2VyLCBjb250YWlucyB0aGUgc2FtZSBuYW1lCiAgICBzdHJpbmdzIGJ1dCB3aXRoIGRlZmF1bHRz
IG9mICJDYXB0dXJlIEFjdGl2ZSIgYW5kICJQbGF5YmFjayBBY3RpdmUiIGFuZAogICAgYWRkaXRp
b25hbCBmaWxlcyBmb3IgYW55IHBlci1hbHQtbW9kZSBjb25maWd1cmFibGUgc2V0dGluZ3MgKHN1
Y2ggYXMKICAgIGNfc3NpemUsIHBfc3NpemUsIGV0Yy4pIEF0IHRoZSB0aW1lIG9mIGNyZWF0aW9u
LCB2YWx1ZXMgZm9yIHRob3NlIGFyZSBjb3BpZWQgCiAgICBmcm9tIHRoZSBjb3JyZXNwb25kaW5n
IHNldHRpbmdzIGluIHRoZSBmdW5jdGlvbiBtYWluIGNvbmZpZ2ZzIGRpcmVjdG9yeS4KwqAgKiBD
cmVhdGlvbiBvZiAiYWx0LjEiIGluIHBhcnRpY3VsYXIgY2hhbmdlcyB0aGUgbWVhbmluZyBvZiB0
aGUgZmlsZXMKICAgIGluIHRoZSBtYWluIGZ1bmN0aW9uIGNvbmZpZ2ZzIGRpciBzbyB0aGF0IHRo
ZXkgYXJlIG9ubHkgX2RlZmF1bHRfIHZhbHVlcyB1c2VkCiAgICB3aGVuIGNyZWF0aW5nICJhbHQu
eCIgZGlyZWN0b3JpZXMgYW5kIHNldHRpbmdzIGZyb20gImFsdC4xIiB3aWxsIG5vdyBiZSB1c2Vk
CiAgICBmb3IgYWx0IG1vZGUgMS4gKEFsdCBtb2RlIDEgYWx3YXlzIGV4aXN0cywgZXZlbiB3aGVu
ICJhbHQuMSIgaGFzIG5vdCBiZWVuCiAgICBjcmVhdGVkLikKCiogQUxTQSBjYXJkIGludGVyZmFj
ZSBiZWhhdmlvcgrCoCAqIENvbmZpZ3VyYXRpb24gb2YgdGhlIEFMU0EgY2FyZCBpbnRlcmZhY2Ug
cmVtYWlucyB0aGUgc2FtZS4gSXQgaXMgY29uZmlndXJlZArCoMKgwqAgd2hlbiBiaW5kaW5nIHRo
ZSBmdW5jdGlvbiB0byBtYXRjaCB0aGUgc2V0dGluZ3MgaW4gdGhlIG1haW4gZnVuY3Rpb24gY29u
ZmlnZnMuCsKgwqDCoCAiYWx0LngiIHNldHRpbmdzIGhhdmUgbm8gZWZmZWN0IG9uIHRoZSBjcmVh
dGVkIEFMU0EgY2FyZCBzZXR1cArCoCAqIFNhbXBsZSBzaXplIHdpbGwgYmUgY29udmVydGVkIGJl
dHdlZW4gQUxTQSBhbmQgVVNCIGRhdGEgYnkgZHJvcHBpbmcKICAgIGV4dHJhIGJpdHMgb3IgemVy
byBwYWRkaW5nIHNhbXBsZXMgKGVnIDE2LT4yNCB3aWxsIHplcm8gcGFkIGEgYnl0ZSwgMjQtPjE2
CiAgICB3aWxsIGRyb3AgYSBieXRlKQrCoCAqIENoYW5uZWwgY291bnQgZGlmZmVyZW5jZXMgd2ls
bCBpZ25vcmUgZXh0cmEgaW5jb21pbmcgY2hhbm5lbHMgYW5kIHplcm8KICAgIG91dGdvaW5nIGV4
dHJhIGNoYW5uZWxzIChlZyA4LT4yIHdpbGwganVzdCBjb3B5IHRoZSBmaXJzdCB0d28gYW5kIGln
bm9yZQogICAgdGhlIHJlc3QuIDItPjggd2lsbCBjb3B5IHRoZSBmaXJzdCB0d28gYW5kIHplcm8g
dGhlIHJlc3QuKQrCoCAqIFBlci1hbHQtbW9kZSBjb25maWd1cmFibGUgc2V0dGluZ3Mgd2lsbCBo
YXZlIGEgcmVhZC1vbmx5IEFMU0EgY29udHJvbCAobGlrZQrCoMKgwqAgc2FtcGxlIHJhdGUgZG9l
cyBjdXJyZW50bHkpIHRoYXQgY2FuIGJlIHVzZWQgdG8gaW5mb3JtIHRoZSBwcm9ncmFtIGF0dGFj
aGVkCsKgwqDCoCB0byB0aGUgQUxTQSBjYXJkIHdoYXQgdGhlIGN1cnJlbnQgc3RhdGUgb2YgdGhv
c2Ugc2V0dGluZ3MgYXJlIHdoZW4gdGhlIFVTQgrCoMKgwqAgaG9zdCBzZWxlY3RzIGFuIGFsdCBt
b2RlLgoKQW4gc2ltcGxlIGV4YW1wbGUgb2YgaG93IHRoaXMgY291bGQgYmUgdXNlZCB0byBjcmVh
dGUgYSBzZWNvbmQgYWx0IG1vZGU6Cgpta2RpciB1YWMxLjAKZWNobyAyNCA+IHVhYzEuMC9wX3Nz
aXplCmVjaG8gMjQgPiB1YWMxLjAvY19zc2l6ZQpta2RpciB1YWMxLjAvYWx0LjIKZWNobyAxNiA+
IHVhYzEuMC9hbHQuMi9jX3NzaXplCgpOT1RFOiBBbHQgbW9kZXMgYXJlIHNlcGFyYXRlbHkgc2Vs
ZWN0YWJsZSBieSB0aGUgaG9zdCBmb3IgcGxheWJhY2sgYW5kIGNhcHR1cmUKc28gdGhlIGhvc3Qg
Y2FuIHBpY2sgYW5kIGNob29zZSBhcyBkZXNpcmVkLiBUaGVyZSBpcyBubyBuZWVkIHRvIG1ha2Ug
YW4gYWx0IG1vZGUKZm9yIGV2ZXJ5IGNvbWJpbmF0aW9uIG9mIHBsYXliYWNrIGFuZCBjYXB0dXJl
IHNldHRpbmdzLiBJbiB0aGlzIGV4YW1wbGUgdGhlIGhvc3QKY2FuIHBpY2sgZWl0aGVyIDI0IG9y
IDE2IGJpdCBzYW1wbGVzIGZvciBjYXB0dXJlLCBidXQgaXMgb25seSBhbGxvd2VkIDI0IGJpdCBz
YW1wbGVzCmZvciBwbGF5YmFjayBhcyBib3RoIGFsdC4xICh2aWEgdWFjMS4wL3Bfc3NpemUpIGFu
ZCBhbHQuMiAodmlhIGRlZmF1bHQgY29waWVkIHRvCnVhYzEuMC9hbHQuMi9wX3NzaXplKSBoYXZl
IGJlZW4gY29uZmlndXJlZCBhcyAyNC1iaXQuCgoKT24gVGh1LCBBcHIgMjUsIDIwMjQgYXQgMTE6
MDjigK9BTSBQYXZlbCBIb2ZtYW4gPHBhdmVsLmhvZm1hbkBpdml0ZXJhLmNvbT4gd3JvdGU6Cj4K
Pgo+IE9uIDI1LiAwNC4gMjQgMTE6MjIsIFRha2FzaGkgSXdhaSB3cm90ZToKPiA+IE9uIFdlZCwg
MjQgQXByIDIwMjQgMDk6NDA6NTIgKzAyMDAsCj4gPiBQYXZlbCBIb2ZtYW4gd3JvdGU6Cj4gPj4K
PiA+Pgo+ID4+IE9uIDE3LiAwNC4gMjQgMTM6MDcsIFBhdmVsIEhvZm1hbiB3cm90ZToKPiA+Pgo+
ID4+PiBJIGFtIGNvbnNpZGVyaW5nIGltcGxlbWVudGF0aW9uIG9mIG11bHRpcGxlIGFsdHNldHRp
bmdzIHRvIGZfdWFjMiwgc28KPiA+Pj4gdGhhdCBtdWx0aXBsZSBjb21iaW5hdGlvbnMgb2YgY2hh
bm5lbHMgYW5kIHNhbXBsZXNpemVzIGNhbiBiZSBvZmZlcmVkIHRvCj4gPj4+IHRoZSBob3N0Lgo+
ID4+Pgo+ID4+PiBDb25maWd1cmF0aW9uOgo+ID4+PiAtLS0tLS0tLS0tLS0tLQo+ID4+PiAqIGVh
Y2ggYWx0c2V0dGluZyBmb3IgZWFjaCBkaXJlY3Rpb24gc2hvdWxkIGRlZmluZQo+ID4+PsKgwqDC
oCAqIGNoYW5uZWwgbWFzawo+ID4+PsKgwqDCoCAqIHNhbXBsZXNpemUKPiA+Pj7CoMKgwqAgKiBo
c19iaW50IGJJbnRlcnZhbAo+ID4+PsKgwqDCoCAqIGNfc3luYyB0eXBlIChmb3IgY2FwdHVyZSBv
bmx5KQo+ID4+Pgo+ID4+Pgo+ID4+PiBQZXJoYXBzIHRoZSBlYXNpZXN0IGNvbmZpZyB3b3VsZCBi
ZSBhbGxvd2luZyBsaXN0cyBmb3IgdGhlIGV4aXN0aW5nCj4gPj4+IHBhcmFtZXRlcnMgKGxpa2Ug
dGhlIG11bHRpcGxlIHNhbXBsZXJhdGVzIHdlcmUgaW1wbGVtZW50ZWQpLiBBbGwgdGhlCj4gPj4+
IGxpc3QgcGFyYW1zIHdvdWxkIGhhdmUgdG8gaGF2ZSB0aGUgc2FtZSBudW1iZXIgb2YgaXRlbXMg
LSBpbml0aWFsIGNoZWNrLgo+ID4+PiBGaXJzdCB2YWx1ZXMgaW4gdGhlIGxpc3Qgd291bGQgYXBw
bHkgdG8gYWx0c2V0dGluZyAxLCBzZWNvbmQgdG8KPiA+Pj4gYWx0c2V0dGluZyAyIGV0Yy4KPiA+
Pj4KPiA+Pj4gT3IgdGhlIGFsdHNldHRpbmcgY291bGQgYmUgc29tZSBzdHJ1Y3R1cmVkIGNvbmZp
Z2ZzIHBhcmFtIC0gcGxlYXNlIGlzCj4gPj4+IHRoZXJlIGFueSByZWNvbW1lbmRlZCBzdGFuZGFy
ZCBmb3Igc3RydWN0dXJlZCBjb25maWdmcyBwYXJhbXM/Cj4gPj4+Cj4gPj4+Cj4gPj4+IFNob3Vs
ZCB0aGUgY29uZmlnIGFsc28gYWRqdXN0IHRoZSBsaXN0IG9mIGFsbG93ZWQgc2FtcGxlcmF0ZXMg
Zm9yIGVhY2gKPiA+Pj4gYWx0c2V0dGluZz8gVGVjaG5pY2FsbHkgaXQgbWFrZXMgc2Vuc2UgYXMg
aGlnaGVyIG51bWJlciBvZiBjaGFubmVscyBjYW4KPiA+Pj4gZGVjcmVhc2UgdGhlIG1heCBzYW1w
bGVyYXRlLCBlLmcuIGZvciB2aWEgYSBURE0gaW50ZXJmYWNlLiBJZiBzbywgaXQKPiA+Pj4gd291
bGQgbmVlZCBlaXRoZXIgdGhlIHN0cnVjdHVyZWQgY29uZmlndXJhdGlvbiBvciBzb21lICJsaXN0
IG9mIGxpc3RzIgo+ID4+PiBmb3JtYXQuCj4gPj4+Cj4gPj4+Cj4gPj4+IEltcGxlbWVudGF0aW9u
Ogo+ID4+PiAtLS0tLS0tLS0tLS0tLS0KPiA+Pj4KPiA+Pj4gUGFyYW1ldGVycyBjb3VsZCBiZSB0
dXJuZWQgdG8gYXJyYXlzIG9mIGZpeGVkIHByZWRlZmluZWQgc2l6ZXMsIGxpa2UgdGhlCj4gPj4+
IHAvc19zcmF0ZXMuIEUuZy4gNSBtYXguIGFsdHNldHRpbmdzIGluIGVhY2ggZGlyZWN0aW9uIHdv
dWxkIGNvbnN1bWUgb25seQo+ID4+PiA0ICogKDUtMSkgKyAzKiAoNS0xKSA9IDI4IGV4dHJhIGlu
dHMgKGV4Y2x1ZGluZyB0aGUgc2FtcGxlcmF0ZXMgY29uZmlnKS4KPiA+Pj4KPiA+Pj4gQ3VycmVu
dGx5IGFsbCBkZXNjcmlwdG9yIHN0cnVjdHMgYXJlIHN0YXRpY2FsbHkgcHJlLWFsbG9jYXRlZCBh
cyB0aGVyZQo+ID4+PiBhcmUgb25seSB0d28gaGFyZC1jb2RlZCBhbHRzZXR0aW5ncy4gSU1PIHRo
ZSBkZXNjcmlwdG9ycyBzcGVjaWZpYyBmb3IKPiA+Pj4gZWFjaCBhbHRzZXR0aW5nIGNvdWxkIGJl
IGFsbG9jYXRlZCBkeW5hbWljYWxseSBpbiBhIGxvb3Agb3ZlciBhbGwKPiA+Pj4gbm9uZS16ZXJv
IGFsc2V0dGluZ3MuCj4gPj4+Cj4gPj4+IFBsZWFzZSBtYXkgSSBhc2sgVUFDMiBnYWRnZXQgInN0
YWtlaG9sZGVycyIgZm9yIGNvbW1lbnRzLCBzdWdnZXN0aW9ucywKPiA+Pj4gcmVjb21tZW5kYXRp
b25zLCBzbyB0aGF0IG15IGV2ZW50dWFsIGluaXRpYWwgdmVyc2lvbiB3YXMgaW4gc29tZQo+ID4+
PiBnZW5lcmFsbHkgYWNjZXB0YWJsZSBkaXJlY3Rpb24/Cj4gPj4+Cj4gPj4KPiA+PiBUaGlzIGZl
YXR1cmUgaGFzIGNvaW5jaWRlbnRhbGx5IGFyaXNlbiBpbiByZWNlbnQgY29tbWl0cyBieSBDaHJp
cwo+ID4+IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL2xvcmUua2VybmVsLm9y
Zy9sa21sL2M5OTI4ZWRiLThiMmQtMTk0OC00MGI4LWMxNmUzNGNlYTNlMkBpdml0ZXJhLmNvbS9U
L19fOyEhSEJuTWNpdXdmVlNYSlEhVEJndFc1TGtuNEZCVEJXeFlEWi0zSV9Fb1ZSLVE4bXd0eWVZ
X1BXSUdPbWZLSFcyb1c3NmdNaE9XRjVsOFVvOXlJRFBKRmhnVkkyWlV0aFhmQSQKPiA+Pgo+ID4+
IE1heWJlIFRha2FzaGkncyBjb21taXRzIHRvIHRoZSBtaWRpIGdhZGdldCBjb3VsZCBiZSBhIHdh
eQo+ID4+IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL3BhdGNod29yay5rZXJu
ZWwub3JnL3Byb2plY3QvYWxzYS1kZXZlbC9saXN0Lz9zZXJpZXM9NzY5MTUxJnN0YXRlPSoyQSZh
cmNoaXZlPWJvdGhfXztKUSEhSEJuTWNpdXdmVlNYSlEhVEJndFc1TGtuNEZCVEJXeFlEWi0zSV9F
b1ZSLVE4bXd0eWVZX1BXSUdPbWZLSFcyb1c3NmdNaE9XRjVsOFVvOXlJRFBKRmhnVkkxRG9XaUtY
USQKPiA+PiBUaGUgbWlkaSBnYWRnZXQgYWxsb3dzIG11bHRpcGxlIGNvbmZpZ3VyYXRpb25zIG5v
dywgd2hlcmUgY29uZmlncyBhcmUKPiA+PiBwbGFjZWQgaW50byBhIHNlcGFyYXRlIGJsb2NrLlgg
Y29uZmlnZnMgZGlyZWN0b3J5LiBUaGF0IHdheSB0aGUgY29uZmlnZnMKPiA+PiByZWNvbW1lbmRh
dGlvbiB0byBrZWVwIG9uZSB2YWx1ZSBwZXIgaXRlbSBpcyBhZGhlcmVkIHRvIGFuZCB0aGUKPiA+
PiBjb25maWd1cmF0aW9uIGlzIG5pY2UgYW5kIGNsZWFuLgo+ID4+Cj4gPj4gVGhpcyBtZXRob2Qg
d291bGQgbmljZWx5IGFsbG93IHZhcmlvdXMgc2FtcGxlcmF0ZSBsaXN0cyBmb3IgZWFjaAo+ID4+
IGFsdHNldHRpbmcsIHdpdGhvdXQgaGF2aW5nIHRvIHVzZSBzb21lIG9ic2N1cmUgbGlzdCBvZiBs
aXN0cy4KPiA+Pgo+ID4+IFRoZSBmX3VhYzIgdHJlZSBjb25maWcgY291bGQgaGF2ZSBlLmcuIGFs
dC4xLVggc3ViZGlycywgdG8gZml0IHRoZQo+ID4+IGFsdHNldHRpbmcgSUQuIEkgYW0gbm90IHN1
cmUgdGhlIGRvdCBpbmRleCBub3Qgc3RhcnRpbmcgd2l0aCAwIHdvdWxkIGJlCj4gPj4gYW4gaXNz
dWUuCj4gPj4KPiA+PiBOb3cgdGhlIHF1ZXN0aW9uIHdvdWxkIGJlIHdoYXQgdG8gZG8gd2l0aCB0
aGUgZXhpc3RpbmcgKGFuZCB0aGUgbmV3Cj4gPj4gcGFyYW1zIGFkZGVkIGJ5IENocmlzKSBmbGF0
LXN0cnVjdHVyZSBwYXJhbWV0ZXJzIHdoaWNoIGFwcGx5IHRvICh0aGUKPiA+PiBvbmx5IG9uZSkg
YWx0c2V0dGluZyAxLiBNYXliZSB0aGV5IGNvdWxkIGJlIHVzZWQgYXMgZGVmYXVsdHMgZm9yIHRo
ZQo+ID4+IG90aGVyIGFsdHNldHRpbmdzIGZvciB1bnNwZWNpZmllZCBwYXJhbWV0ZXJzPwo+ID4+
Cj4gPj4gSSB2ZXJ5IG11Y2ggYXBwcmVjaWF0ZSBhbnkgaW5wdXQsIHRoYW5rIHlvdSBhbGwgaW4g
YWR2YW5jZS4KPiA+Cj4gPiBJTU8sIGEgc29mdGVyIGFwcHJvYWNoIHdvdWxkIGJlIHRvIHVzZSBz
dWJkaXJzIGZvciBhbHQxKyB3aGlsZSBmbGF0Cj4gPiBmaWxlcyBhcmUga2VwdCB1c2VkIGZvciBh
bHQwLgo+Cj4gVGhhbmtzIGEgbG90IGZvciB5b3VyIGhlbHAuIElJVUMgYWxtb3N0IGFsbCBleGlz
dGluZyBjb25maWdzIGZvciB0aGUKPiBVQUMxLzIgZnVuY3Rpb25zIGFwcGx5IHRvIHRoZSAicnVu
IiBhbHRzZXR0aW5nIC0gYWx0c2V0dGluZyAxLiBUaGUKPiBhbHRzZXR0aW5nIDAgaXMgZm9yIHN0
b3BwaW5nIHRoZSBvcGVyYXRpb24sIElJVUMuIEFjdHVhbGx5IHRoYXQncyBob3cKPiB0aGUgc3Ry
ZWFtIHN0b3AgaXMgZGV0ZWN0ZWQgb24gdGhlIGdhZGdldCBzaWRlIC0gdHJhbnNpdGlvbiBhbHQx
IC0+IGFsdDAuCj4KPiBEaWQgeW91IHBlcmhhcHMgbWVhbiB0aGUgZmlyc3QgInJ1bm5pbmciIGFs
dHNldHRpbmc/Cj4KPgo+ID7CoCBBbHRlcm5hdGl2ZWx5LCB3ZSBtYXkgYWxsb3cgY3JlYXRpbmcK
PiA+IGFsdDAsIHRvbywgYW5kIHRoZSB2YWx1ZXMgdGhlcmUgd2lsbCB3aW4gb3ZlciB0aGUgZmxh
dCB2YWx1ZXMuCj4gPgo+Cj4gSUlVQyB0aGlzIHdvdWxkIGJlIHRoZSBtZWFuaW5nIG9mIGRlZmF1
bHQgY29uZmlncywgaW4gY2FzZSB0aGV5IGFyZSBub3QKPiBzcGVjaWZpZWQgaW4gdGhlIHN1YmRp
ci4gSSBsaWtlIHRoYXQgYXMgaXQgd291bGQgbWFrZSB0aGUgY29uZmlndXJhdGlvbgo+IGVhc2ll
ciBpZiBub3QgZ2VuZXJhdGVkIGJ5IHNvbWUgc2NyaXB0Lgo+Cj4gVGhhbmtzLAo+Cj4gUGF2ZWwu
Cj4KPg==
