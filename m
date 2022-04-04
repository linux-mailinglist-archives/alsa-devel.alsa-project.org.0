Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BC24F1532
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Apr 2022 14:46:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5601D16C6;
	Mon,  4 Apr 2022 14:46:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5601D16C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649076418;
	bh=gsqvJQ/VYhuaaQfgGTcaBP7s+WfNuFs/1lM2XAulu0k=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BnMyrmd/JgAerTO50nhCg9ELOhLmpBBPc4oqEXNHJKDNh7EG2Je1+e14XMahLubOm
	 BOfitwKtXu/zRuMA1v5jYwXKSC7cTPY9oFuJVXJgQczUx8V7xbc5PWjJZeDHXev/Ft
	 Fr1It/WZqS/aKhEiufLtqD9Qx+c9A1iDdEDNIvL8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CD59EF801F7;
	Mon,  4 Apr 2022 14:45:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6CB1BF80162; Mon,  4 Apr 2022 14:45:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 91B53F800D1
 for <alsa-devel@alsa-project.org>; Mon,  4 Apr 2022 14:45:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91B53F800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="YHDdOV+v"; 
 dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com
 header.i=@microchiptechnology.onmicrosoft.com header.b="vdDVcsCl"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1649076351; x=1680612351;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=gsqvJQ/VYhuaaQfgGTcaBP7s+WfNuFs/1lM2XAulu0k=;
 b=YHDdOV+vhEibiHSwVAlqKDzLXMpIIrRaDA89N6gYKcQqs8tfRFv7pfhu
 nYlPmQBDvtkFmXO0MbKzhpDiOuV7c6OuV15ZoywL6oACmQedcESDyuxc7
 Ykewa+0HzaSZnSapJFROrDnIJfUjnWDFeX8lvQYOGTDSImZyhSFSRL4Sw
 SXyU6Us/qH0ceCLYRPGHFMzC+pOl9BFSSHocggX+mrwQXBADFBlhUVLcS
 TUABiHS4vIT9PuIOL4vm4Gu/9L8XFZ5Wn1F90HSrGTf1GLYWVQq8rDhHv
 IiirC0fKfbXzIQVGsTJblGCBeN89Ray5lVC8SduRdxL8czisHk1Fst4n3 w==;
X-IronPort-AV: E=Sophos;i="5.90,234,1643698800"; d="scan'208";a="91140472"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 04 Apr 2022 05:45:42 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 4 Apr 2022 05:45:43 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Mon, 4 Apr 2022 05:45:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ho1V2Ri0MqoA1rZFESk02G0PRzp3TGEwvnpcLAwF4TlyUNhRPeRRCVIEjqqidlYAsmvyAXIaQVN9ihL0QUhvHJcs5gtjfK9Pm235KxOmqp53IbKsgJ8sQhR4+hJdhV9dLf1/lvIYi51Yc32kh9FC1Yh9S9WsLhihiFLuWTqpTf4WE+Bniy5k0KAmSEhaWoaeMOM22/zIHlwghRzILkLa6WgiT+WLofiQPtl700TNIa7LOidq5Fwj+ljiNXxE82HkvXMnfgzyZRjStrBqwm3pAcn+4sapEDRfUZimJVeRPWUwSDbQveWx3LH/l6EG5s4pZXpYEJffUdEIcKcMya7i9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gsqvJQ/VYhuaaQfgGTcaBP7s+WfNuFs/1lM2XAulu0k=;
 b=WpUVgQ7j2inrtAdoxNbrI2Vyxq7Bl1E50lVn2JlHwQZ3sZbw6CZdQC5CI7CjZzbAhrUOthg9RNwbu5dgHK2nCBMiuLdVdNqaCeaefPNPAtPLAleUqhzJnRPcaoOIDKreIX2CLpEa4iaSOtwD8HcbdWw1Kg5epyxVXHVS+vuXBuCZ6fexMqXeh2nELhLfaZzn+bSVGyG6AHuQxxXSY3v0WUiUfu/9/DdSqDO9wq+BvqbMXtjj0zCQN9t5SLj1ADoELpY6P8r6cbm2QpxPYaktKEeKi3f4LgwC3NTakxKcUWVrtk7nrs0roOzxJts9daKSwD1/Pi1fmCIh0FZOxxAv6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gsqvJQ/VYhuaaQfgGTcaBP7s+WfNuFs/1lM2XAulu0k=;
 b=vdDVcsClPIW3XBzmKnt9oYoCtAZB67C6Pqp/Rh8LbO9l24IJUuTUPIi+SaGc/3sMv7sd/qkIU54EgkmaG8dj+VaVEjKMgq8AI18q7g2x3uOTR7Z4aKO33CApCTy/1R6mzYE7Miwo0RrOPSo83RLrPXLFiBzxp7miu/7G2jOUxHA=
Received: from DM8PR11MB5687.namprd11.prod.outlook.com (2603:10b6:8:22::7) by
 CH0PR11MB5218.namprd11.prod.outlook.com (2603:10b6:610:e1::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5123.31; Mon, 4 Apr 2022 12:45:38 +0000
Received: from DM8PR11MB5687.namprd11.prod.outlook.com
 ([fe80::fc32:96a4:933f:194f]) by DM8PR11MB5687.namprd11.prod.outlook.com
 ([fe80::fc32:96a4:933f:194f%5]) with mapi id 15.20.5123.031; Mon, 4 Apr 2022
 12:45:38 +0000
From: <Codrin.Ciubotariu@microchip.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: Re: [PATCH v1 1/3] ASoC: atmel: Remove system clock tree
 configuration for at91sam9g20ek
Thread-Topic: [PATCH v1 1/3] ASoC: atmel: Remove system clock tree
 configuration for at91sam9g20ek
Thread-Index: AQHYQF8elzhow9CUGU6EXo5vBVupF6zfwwYA
Date: Mon, 4 Apr 2022 12:45:38 +0000
Message-ID: <bdb37e47-c9b0-ff9c-4762-02ffab51c090@microchip.com>
References: <20220325154241.1600757-1-broonie@kernel.org>
 <20220325154241.1600757-2-broonie@kernel.org>
In-Reply-To: <20220325154241.1600757-2-broonie@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d099445f-86b4-4c81-cea8-08da16390572
x-ms-traffictypediagnostic: CH0PR11MB5218:EE_
x-microsoft-antispam-prvs: <CH0PR11MB5218EA023175021E1405DA3FE7E59@CH0PR11MB5218.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2gDxpCLnGxVZMLeASMJhNeqb1ue5DgZasCrvAb0VBdTOG38cBTmlsHdZ0VbUOEZlhhWYqL3eV8Fh9mJu20jUfoE6Yf++yRdx14kFwEFt9klb3HCyIhCGW4RbNhvUl/h8pLcP9szjxJ9DMLTo8e6b72y0qG4VzQff0YLxLv83mU64wC2j8MZ0EoZKL/ZDortaLuEJupHFepqMKFTyDZCR6ZrRd3wIr6bqT//PyYXDt9oxW2fUJ1N8zO2xVOFxahk8lmtjb2tvECntHBa7b0BkmHIMZHTPhJRRZgzwp1FW2JRlsri+9uPNlRAvrh/qh2kf69UuzsaVip1fLZPi+cg4LqFl0guuWUmQHPxiiXb7n+JroA+9SXu5A2jmuchVmWzX69nepkpDwHTCwsU7kAxNmmAG5+5kuGhY5vmTCxV4LlX7kd4fbtt4Sn9N13vPD7F+r5IGUudm+NOHMqmgsaWkHAhidC9LSVQC0k1dlkRpuUGBnWMQASWx53fZNnusgyoFQ1f4rK+29xPsdMyjg2wL3tyqpKck2Lx9zeRxT1Q11ATS6qrfcABbWsNP95Di8YSHcjufnQSnQ9wvDgg/vAa0l37wUTjemI1xg+T8w/RdRa/bT7xwR4YfOpUBRjKjLhSJyRdL4lxPHcW0Ch8Hao2+ozsWu47Hw3GPBSb5rqK1QmjR8MSSULXrmhyQacZi6qNDtxDDfmvqfpiQiP309gqbzPfmscgfbdJKmU4sAlnI08zUXZgEvCLGM3/J7mC1vw5l4bQXyq3bQBqLmnpVt6bMUXn0KG+DFxbkCEDdXELxbTlW5Twblu+T/5RhZZOFJ4Q3
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5687.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(66946007)(38100700002)(6512007)(122000001)(86362001)(31696002)(38070700005)(66556008)(66476007)(66446008)(64756008)(76116006)(2906002)(6506007)(8676002)(4326008)(71200400001)(110136005)(83380400001)(508600001)(5660300002)(6486002)(8936002)(53546011)(36756003)(31686004)(316002)(186003)(2616005)(91956017)(138113003)(98903001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZWU1UkJ2UzRTYUU4cTlISmpWT3NqQXRXdnZzbHVsOE1aVTlqSGtRbkZrOTA1?=
 =?utf-8?B?aWg5aVdVZU1OVVhyVlNueUwzNVpFbmhHNlcyaERnY3B1WVNMdzduN3hzVXMr?=
 =?utf-8?B?WDhVU0VuVjY0eThQOTJJdk5kNGhCRVNBK2g4MTdmOGFNS0VNWDBNZFh2MlA1?=
 =?utf-8?B?SVpDbEhBL29JNFhNSURaK0NQa1Zza1N0M1dFdWRyV00xd3IyM2ZnNUZZT0JF?=
 =?utf-8?B?Uk5yVTgzY3J6eFNPUlFSd09jSmpvVXZTR3I0TVlJQnZyN0hzY0hHQ2E0TXZp?=
 =?utf-8?B?RHVUelc5ekdMUG9nTkJwNWJZeU5OWEVlUWpjbGx1aDZMQ1AzWHpnbVdBd1Fw?=
 =?utf-8?B?V0ZKUU9jdmxzM3FSRE9GeFkxZ2E2bEFhRnllMTVRZUNZZGhnQzM1MWNQNTlN?=
 =?utf-8?B?RmljZDV0eTRabXo4YmN3bG1LNmtmTUI1Zmprd1ZGTzFLRzRZdFlUK0VFRysw?=
 =?utf-8?B?ME5KZUJBRkJ2cGFuOVdmV1FjcXVwL0l6N2tWc2xDS2RMbnN4blNGYmhPWi9a?=
 =?utf-8?B?c2xhMU1ENFNNWitrUDdrYm1VOTJtc29yZFVjRTRyQ3NxbTdreERiUkhwdlBJ?=
 =?utf-8?B?Zi96UTFFTHNWcFljdHJHZkVDQituWXNkTFc1ZkVJZTRLYUtLWXprMU04SUJ5?=
 =?utf-8?B?c25XL3dCcERacjdVeHptMHlmMkI4elZWUk1nZC9aL0VhQ3dRMnhrUFNORUZL?=
 =?utf-8?B?R0lOelV0eGI3K0JWSU1vQnlXVzRpOG45RC9UL25uK1lENmp0RXcva0ZJUWxu?=
 =?utf-8?B?VjlZcGFFRUF4dzNlbDZzbittWFhVNWFVS3RXd1o2Um5wbTVnb2VpL2t4SEI3?=
 =?utf-8?B?QmtsU2ZDU1BubmpTUS9Hd3ExdkU1OGZYaDJhN3VTbkVSUTBHL2RKZjRJUFFH?=
 =?utf-8?B?b1NqRjdVQS9ramFreUJVOUpkZ3lPRDZBNGNXWmhOM1lld1M1aUdmclA1Mi81?=
 =?utf-8?B?YjZBYm0vbFBEdjVwU0R1TU01RFlpc2hKT1Z3ZGZnczU5UFdpVm0wVmFHcDJJ?=
 =?utf-8?B?Q0dabFhWTjFFVWx6clprV3JuRUtrQmoxMG5lY0o4N1BGeGd1ZFZmRmdnTllr?=
 =?utf-8?B?V0xXa2tUWHJ6SkNzNWg4MkxNMDU0VWdkYkNtY2ZaMXRobmRkT2xjeE40QnpQ?=
 =?utf-8?B?eDg0d2xKclRkakhQbGVFbWNVYURHM09oMFhFUFpqanhRdU14dk1aTS9kQ3FU?=
 =?utf-8?B?VndGL3hKZWVRRDhHZHhEQTE5c0dFNVIrN1NLOEdmd3ZQNHo4dWxTRVFOVzZI?=
 =?utf-8?B?Z0J5U2dHemxXNVJST1R2bHpQVWFURDI4Q25iSHI0aDdlOWlOYmU0Wkx3WDBT?=
 =?utf-8?B?TGVyN3RwTDEya1dqZWFPak9xS1hIVW9CUGxTWkpTQ3RXTGk3amNJWjNUclN1?=
 =?utf-8?B?ZzNpajFhdDFsUEdNWjV3VXVPZG93NjlENXFMSzJEaWxYWEFmaHprYnRIMHBv?=
 =?utf-8?B?aEpPbkN0cjNDSWoyM09UaDFqYm1ZajNKbzhYcGNyNUdnRy9ZZU9ieHozYTB0?=
 =?utf-8?B?OHV4MUR6Z2NFWSs3SFFrNG1oRkk2YkNJdVA2bVpXekt5QXZaSUdOK0JDZ2NN?=
 =?utf-8?B?NmZxTWJ5UmZvWnJ2Zy9vbDkvQ1ovaWxPNm05cDRoUnRSWk12azgyTi8vS0Uw?=
 =?utf-8?B?MGNnZU5DM2JxZUVFdnRtUXNna1lBeDJLQVVsL1BScGJwTUpzYlJUalI5Tmhy?=
 =?utf-8?B?R0pIVGtJc2pOVVEvdVRTb0Z5SngwQ2Y2dTBtaC9WclhjMVh6eE1yYjlBQjFF?=
 =?utf-8?B?dk1vMVRMUXVhdyt3Y25tbzdlNVJWMXdOMHgwc05xK0gweHMvUXBFOVFOU1Vm?=
 =?utf-8?B?cGFqQm16S3A2dm1OWEd0RWRtOGk3Z0Y0dDh6OWpWMFRRNm9ZUWZqZDFkQi9l?=
 =?utf-8?B?SmxVMTJydzZjSXFNNm4xbkhrT0F3a2tIR1lHU1hIK2YrZnIvRWM4NVBRcnBQ?=
 =?utf-8?B?U1gzNi9VelBmUVhXZDlhOWhvUmtaKzdVRFdOTjJXcVIyQ1dWU3BncWhGVWVP?=
 =?utf-8?B?bjhqbG16c3d2TEFhT1h1elMraWNSbGlqL2t3WGtmTHJZaUpSSzVsQ1FuRmt1?=
 =?utf-8?B?eHZDNFFtZW4xbDIwMjJ1WDBRY1pGVTRvVUN4WXN0cHJmQlFVcThFYTRPY3Qx?=
 =?utf-8?B?UFJlV0F1WE0xcU8xZG94Wi9LdGxpajNRZnZXZFVZWjdlbU1MdkJwaHNwTUZP?=
 =?utf-8?B?aFRQcG9Vbm1UVjE4aVFMQjV3em5sS1d5RFlmTkh2THVHaXpzRmhMZ0hMc09I?=
 =?utf-8?B?aHdsWjRVMGxnVVNmUmpoc1lKTXFJUXBVM3RnMkFsNlBKYTFtWWFUK1FyQnlF?=
 =?utf-8?B?djJLRExiUzJyN0pyTnZvNThhZUFmU2Z6MUZsSUZUUmJyWVhobGRnWU53cGgr?=
 =?utf-8?Q?cp2i6+FnDTE8CI8PzJ0qBDGndoBDK1h4dXOAKVI7QvFT9?=
x-ms-exchange-antispam-messagedata-1: Hh3LTerCzwaGsUaiJsx0InL6PKiNjH/K9i8=
Content-Type: text/plain; charset="utf-8"
Content-ID: <38E4D7E82511C6439FB4F76114CC557E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5687.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d099445f-86b4-4c81-cea8-08da16390572
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Apr 2022 12:45:38.5766 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AdIPOAPPOJ0mFu7ZE+1idZ8DHsLLWUHaKU6vKuEFuL0e/3dxlY0JfsutNqzJuIUpSBEiePw3N0GxdSLVlGShwN1iuw4S3i6S4dJKqQhe+CI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5218
Cc: alsa-devel@alsa-project.org
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

T24gMjUuMDMuMjAyMiAxNzo0MiwgTWFyayBCcm93biB3cm90ZToNCj4gVGhlIE1DTEsgb2YgdGhl
IFdNODczMSBvbiB0aGUgQVQ5MVNBTTlHMjAtRUsgYm9hcmQgaXMgY29ubmVjdGVkIHRvIHRoZQ0K
PiBQQ0swIG91dHB1dCBvZiB0aGUgU29DLCBpbnRlbmRlZCBpbiB0aGUgcmVmZXJlbmNlIHNvZnR3
YXJlIHRvIGJlIHN1cHBsaWVkDQo+IHVzaW5nIFBMTEIgYW5kIHByb2dyYW1tZWQgdG8gMTJNSHou
IEFzIG9yaWdpbmFsbHkgd3JpdHRlbiBmb3IgdXNlIHdpdGggYQ0KPiBib2FyZCBmaWxlIHRoZSBh
dWRpbyBkcml2ZXIgd2FzIHJlc3BvbnNpYmxlIGZvciBjb25maWd1cmluZyB0aGUgZW50aXJlIHRy
ZWUNCj4gYnV0IGluIHRoZSBjb252ZXJzaW9uIHRvIHRoZSBjb21tb24gY2xvY2sgZnJhbWV3b3Jr
IHRoZSByZWdpc3RyYXRpb24gb2YNCj4gdGhlIG5hbWVkIHBjazAgYW5kIHBsbGIgY2xvY2tzIHdh
cyByZW1vdmVkIHNvIHRoZSBkcml2ZXIgaGFzIGZhaWxlZCB0bw0KPiBpbnN0YW50aWF0ZSBldmVy
IHNpbmNlLg0KPiANCj4gU2luY2UgdGhlIFdNODczMSBkcml2ZXIgaGFzIGhhZCBzdXBwb3J0IGZv
ciBtYW5hZ2luZyBhIE1DTEsgcHJvdmlkZWQgdmlhDQo+IHRoZSBjb21tb24gY2xvY2sgZnJhbWV3
b3JrIGZvciBzb21lIHRpbWUgd2UgY2FuIHNpbXBseSBkcm9wIGFsbCB0aGUgY2xvY2sNCj4gbWFu
YWdlbWVudCBjb2RlIGZyb20gdGhlIG1hY2hpbmUgZHJpdmVyIG90aGVyIHRoYW4gY29uZmlndXJh
dGlvbiBvZiB0aGUNCj4gc3lzY2xrIHJhdGUsIHRoZSBDT0RFQyBkcml2ZXIgc3RpbGwgcmVzcGVj
dHMgdGhhdCBjb25maWd1cmF0aW9uIGZyb20gdGhlDQo+IG1hY2hpbmUgZHJpdmVyLg0KPiANCj4g
Rml4ZXM6IGZmNzhhMTg5YjBhZTU1ZiAoIkFSTTogYXQ5MTogcmVtb3ZlIG9sZCBhdDkxLXNwZWNp
ZmljIGNsb2NrIGRyaXZlciIpDQo+IFNpZ25lZC1vZmYtYnk6IE1hcmsgQnJvd24gPGJyb29uaWVA
a2VybmVsLm9yZz4NCg0KUmV2aWV3ZWQtYnk6IENvZHJpbiBDaXVib3Rhcml1IDxjb2RyaW4uY2l1
Ym90YXJpdUBtaWNyb2NoaXAuY29tPg0KDQpUaGFuayB5b3UgZm9yIGFkZHJlc3NpbmcgdGhpcyEN
Cg0KQmVzdCByZWdhcmRzLA0KQ29kcmluDQo=
