Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6BB5677CE
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Jul 2022 21:29:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE30116BF;
	Tue,  5 Jul 2022 21:28:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE30116BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657049365;
	bh=eUTS73gge0teSJcOvcvBRalNCEsZt4ZRmdTswbOzRWQ=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W4VYgJaxHH6UW3XjAMCjfytCd4YVgtEbJO9SLw/f4zZeCckdwmkITFOBnoESAwgvy
	 jtDnjbK6hoiqurK//vaZiZTFhxUxl7HRO+MwO6iD1ydYb7RqncSLAhqKcRzE3jJEqe
	 +8t39XQu0UszjVirIJKNaeUnYP9XQx9S6dbJR+r8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3F4FF800CB;
	Tue,  5 Jul 2022 21:28:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E495F8015B; Tue,  5 Jul 2022 21:28:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 31AA9F800CB
 for <alsa-devel@alsa-project.org>; Tue,  5 Jul 2022 21:28:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31AA9F800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="iwMumnrn"; 
 dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com
 header.i=@microchiptechnology.onmicrosoft.com header.b="JYQ6BuX2"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1657049294; x=1688585294;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=eUTS73gge0teSJcOvcvBRalNCEsZt4ZRmdTswbOzRWQ=;
 b=iwMumnrnR3XVzouvkTBQ4B/WWHJ/IxN4GNEsJeDWDik3UwouKVWeeOot
 ZUrSRRDoNXZVUKmhYiLJldZflZz6I295e9aFjA8UEnEAE08JxCg4U5JWh
 H0+G5xtRrs3eNCL6uL48STDjm/vJSXQpfsbO29Qq6/9cEWjNRK1tRq4oT
 1OcKwnRbDDh62Nr4DlglA61Eb5d6rPNTue7lnNmK/BSLkrJxu2IK2YHgw
 Q6fMegfUfbxmtXrihFVWYcfLjRrOu1PcrC5TSAE0SZFcH5dDo+lRaYDNF
 q0qdWc/A0E6u1PQ5ki5uOSUv+27wDlWqrShcWFvf2VMdSqge3OKhXrH0I w==;
X-IronPort-AV: E=Sophos;i="5.92,247,1650956400"; d="scan'208";a="171137359"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 05 Jul 2022 12:28:09 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 5 Jul 2022 12:28:08 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Tue, 5 Jul 2022 12:28:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iC4NqM2kwr9PV62WwIXRkyn2GlOn6uJhmI6pVhrtHkGxguw5zwxSykFB7/nT0Q7kFHK6qRwmQtsL2h+b2SlnOkw2d1Y8bjmtDCBZKmpt9jOuinzelTo4uugVhAQM73NypPj/KGfL7kvQ28Cnn1I+UtNCclxYrGZ2Pia/o7o/+HuZwVyepEqYIoVGXKetr4vpSRWyqfcUFn/pZB7RDJYH6F7zh/gxHIK5OojIhCo3KpllMY/YXJ4uZ2pIvWZbkgBVjac14WOuUKHE2Avc4mY+bPTwgquxmDktrrYlHsppWifS/8PqM5IN3go1v0yROfvIIt0N6rBH2yrU8xBkROCGeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eUTS73gge0teSJcOvcvBRalNCEsZt4ZRmdTswbOzRWQ=;
 b=fHdI5mStJdt8XrW1QBVmQeAlSB7k2UNJzhLlbx8QeB/QZVcjd7GG7DBOosvSNywN41wG1chPzvNZ46QwpdRGTxpH/hxuTZJbJTSY5qRcrU5UpAYtuCf7osTinAdsr3DPyrFB3ksc6SFGWYjez4OhZm9pXBlHEeIK22JsDzGb68RrMukfDWtuCU9VVfcysNovTTsal68W3b0AqppAS4nPDcNuMc3NOxbasRNKi4gfu+W/TFNzwmq+lPm2fDXK+ix0h1SRr4+mhCHQEf98HIV1ssFrGqjxlBwYjZP4x3YeG2qzlCf8vks9KaPKrJOScODc/wtQC77ExDsZGtcnM/xmTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eUTS73gge0teSJcOvcvBRalNCEsZt4ZRmdTswbOzRWQ=;
 b=JYQ6BuX2oM35IwzyOyvRxuFUL4w/jrH0lAfCECkUJ+8Eu+Cs+kA9NIqZC1mT6rK2GUB22PV/liOSWcLm0DDSqCqvSijnjjav7EMTLGWwmofVEbVwXPy+0YN1EANuTNKOmrto+9R+zU3R6sj8D5j4kGcqqIZj8guCtuoHzl8F5ws=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by SN6PR11MB3472.namprd11.prod.outlook.com (2603:10b6:805:bd::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.17; Tue, 5 Jul
 2022 19:28:05 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 19:28:05 +0000
From: <Conor.Dooley@microchip.com>
To: <robh@kernel.org>
Subject: Re: [PATCH v4 05/14] dt-bindings: memory-controllers: add canaan k210
 sram controller
Thread-Topic: [PATCH v4 05/14] dt-bindings: memory-controllers: add canaan
 k210 sram controller
Thread-Index: AQHYjYAvHczrGH5faUaoq3axDB0JHK1wLk+AgAABY4A=
Date: Tue, 5 Jul 2022 19:28:05 +0000
Message-ID: <d2369d3c-adfb-3158-2fa6-81c336502db9@microchip.com>
References: <20220701192300.2293643-1-conor@kernel.org>
 <20220701192300.2293643-6-conor@kernel.org>
 <20220705192307.GA2471961-robh@kernel.org>
In-Reply-To: <20220705192307.GA2471961-robh@kernel.org>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2e076e0f-8623-4af3-8c1f-08da5ebc7c35
x-ms-traffictypediagnostic: SN6PR11MB3472:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: =?utf-8?B?c3RPYWVMeS9NbVB1azlSQzRxRUJiL3dMVitWVmJINGlid05UMXJNWE1TTWdk?=
 =?utf-8?B?WDN6Z2ZMN213Z21sNVlzeFFRZksrSEhqZm9ZWkVPbDJ6OTl6eS9CeGpMWTZs?=
 =?utf-8?B?cmhqS09vekpGeDJPRXlPYlZIOG5RQ0Y1UFdCek53eWNkYUNHbkxUSk82cEtl?=
 =?utf-8?B?RERtUnV5b1FabzNyMVRMUTBNKzNKdjUxSTNFUFNsemJDL1Q0Tm5aaVN0WStK?=
 =?utf-8?B?Q1l1MGR0eHE5Ui96emZNY1QyL1VaMkJOSUpMa05EZFFTN1ZnejZKQjE0M3hr?=
 =?utf-8?B?ZjUraFM0OW9XemE4alU1UHVPYTZrdDdzMk1rQjFhaFNMOVAvZ3NHMTVWVEhk?=
 =?utf-8?B?N3ZLV2pReFhrSDUyK2thUEkzUnJsVXhnakZ5K0dlcmduOFJJaFpnY2Z1YTZH?=
 =?utf-8?B?VU9jWE5iQnBBeGR3UW1JK2hGVyszdzUydG85c3BmR0haUnNLSmZSVmxZamFU?=
 =?utf-8?B?WUJFL1d4Q1VkSUpZZnFPSis3aEd5dEVmR2lzM1JFQlJxeWVMTmZOUm1NY0xO?=
 =?utf-8?B?ZXNqc2luSE91bVJmRXZKQ0hTZVg3WlY1Wkk5MWx1TG5RaGhNNUpQV3k1dDRU?=
 =?utf-8?B?cUlBRS83UVB4N080Y0xtRkVScEh2NkxlS1Q0bjNkSFp3Rm1uL1NEMlRNT1RW?=
 =?utf-8?B?d25vZ0UwNXRrSGNtUmtsbloxSm9SdkkxaGVIQng3WDc2THpPN0xZTzJsZ1Yy?=
 =?utf-8?B?Z3lHamhwT1J6MnpDQkNsNi84M3k5d3FrZDgwVkhFa0ZxSDJEZFdBaEtTRFlW?=
 =?utf-8?B?UVhlZmZNc0hkdFUyeHFoc1dUVVJqdk9XbGpLVWxLSFpFSkErWFk0VUlUVnlk?=
 =?utf-8?B?TGFaOHNLcUhqZE1qbFB2c2VQMUVTSUo2MXpVVnBzTjVvWU02TXpzRWFnQ252?=
 =?utf-8?B?SURvdjd0OElsMkpSS3YyRUlCa3hmeFYvNzcwbjEzTVZUWXJ5OTRIT1ltTlpw?=
 =?utf-8?B?RFdYRmFZK3hJS0VXazZSbEFBR1llbDFIQlJwRVRGeUVqVjYrMjlwendYL01D?=
 =?utf-8?B?UEpGdy8zdit5Q0twZEl4L3ZONmpMQXpua0V5UFRsL29VZjEvYVl4SG9lSjhp?=
 =?utf-8?B?VjNVc3JCMkNUU2ZRdDBUTmhFVHoyMWsyenR5bDluSmhNRXc5ajlQTkEvUjJi?=
 =?utf-8?B?MUdQaGdLVXNGQ2srV1NJeWRXT0RzTDNDcnR6MUo2QjhsMHpxbmZpdC9pWVY4?=
 =?utf-8?B?UDg4cVBDVlV6MjhhNVRPckZLaUJFMi96M2pGckZDSzhWTTZZaWpMcWJWak85?=
 =?utf-8?B?a2czbm0vNURCbGx0UHU5SFl2UUo2N2NiVUpOUVRoQlNsczhRQT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(376002)(396003)(136003)(39860400002)(366004)(7416002)(478600001)(966005)(5660300002)(8936002)(6486002)(53546011)(6506007)(31696002)(86362001)(26005)(6512007)(41300700001)(2906002)(38100700002)(122000001)(2616005)(186003)(38070700005)(83380400001)(71200400001)(66946007)(76116006)(66556008)(66476007)(64756008)(66446008)(54906003)(6916009)(91956017)(31686004)(36756003)(316002)(4326008)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZjJyNEZKUlp3OU1NdTJSWTZIWUd0QmJ6aVErOXVmVjd4S0cwNitjL2ZJbmsv?=
 =?utf-8?B?ZzRtNDZDaWthMXdJRmZIT25JSmVrdjE3aHVQbHNTeWxSS1BFa3dqZ0lzRDBL?=
 =?utf-8?B?RlIxTElWN3Z5SkxQazdSamNzMWhDWjkwTWd2RDQyN2VpTER6MDl4czBidjJK?=
 =?utf-8?B?Y3RMcDQ3MUN3WU9PZ3VwWjBJSjNoNHR2QWRtVGJ0Tmd2TE5jYzBaQS94NlFm?=
 =?utf-8?B?NTY3b2d1THdxVWZLVjhnYXhsSlcxcVYvZkhxTnFRZTRua3IzNXk3Z0ZtRFRU?=
 =?utf-8?B?TjlTOUM0UFB0YW1Bb0trRG9LNTNjVHAxemZQWXlSUEI5SG5CK0UzMW1EZU1H?=
 =?utf-8?B?eFh5bXZQMDRkeEd1RUExNXdUemF1Rmk5K1c4UHNWcVA0ZkQ2eGdXMTY3cGxZ?=
 =?utf-8?B?VHFhRnJmREdHTUU1eFN2SDErYTROVXh6Q1FWM3JVSS8yYXNXNmdSRVhSUXBH?=
 =?utf-8?B?ZzdxSkQyRDcwd1pzZnlVeGRlRXZhQllXVHBIMTZ5TXhJemROWnJaTHF4RXNl?=
 =?utf-8?B?SDladnhkcmxzdVVSOHh6MWViTkRvdW5BQ3VFdFZqemRoMDFzY21qdG04WWZR?=
 =?utf-8?B?S2E0c1d4UlJtTVlFbjhENUdRbDhQaGEzMktmSDhPbnBvN0tBRWhIdmRLWmpW?=
 =?utf-8?B?NnBpWC9FUjdkYkRYSUtFZVFCQ01UdU95WTYrQWxrNGRwbHIyK2xsYWo5b1Ny?=
 =?utf-8?B?N3l0ei9rQUwzOUJsYkd5aTdUYmU2bkxpTmMyN0RpSjRDOUU0bVYwUFZDdldL?=
 =?utf-8?B?bTBOS3VDanFVNEpxTS9aVEEwcDdMQVdSeFYvRkE5TElIQ0pWUXlQN1ZzcEhP?=
 =?utf-8?B?UEhKdUNhZEI1WStpUFJUaW9EQzM2R0dsVk1uOGNnV09RL3ArdmtGVzg1dmps?=
 =?utf-8?B?Q05pTlpsRHRNMVNQL1hla0s2b3VKWFBaZDFoWHlQOEtDMjNXVFA2UllxRzdq?=
 =?utf-8?B?bi9kNG5Qbk5lZWN6bEVXU3R0c2hoR2FZMlpPRlRYNzc3RTcwc3M1M0RBRk1E?=
 =?utf-8?B?MDNvemkwK2lFSWlHSHhtclpSd25uMW5WR2hBZHYzc3RPZGpUaVBTOUNQdG5P?=
 =?utf-8?B?T3E0dEJOR3l4RjBnbWZUTDJHdmtRbVpSMk1DbjViNjBsN1hvUDg0V0V0YzNS?=
 =?utf-8?B?d0g5L0VZT2tJTWxmTWlGTWhORkdBcHpJbmNnM1I0OE83NWZ5T3kzQ211enZL?=
 =?utf-8?B?Y2hOSkVVYXRWV0RjTjZJSkh0d3dyaWEvcHBzcmxTYkRZUDk1L1J5dVdWL0o5?=
 =?utf-8?B?QWg4S01KdmdPcS8rZGJqZDdzbVJ5SVFCTTlQQWk5ZEhkQ2pHQkIxU0U2bEdM?=
 =?utf-8?B?MHRzVE5xc0F6TzRPcHZwclB6OWRTZ1h1VWZ6T2RYK0RScFl3NElXZExJWFUy?=
 =?utf-8?B?dE03ZVpHWlV5V0FieDNERENQaW14bU5wWnc2dnpTQkptRVl2Z3pTRnpVeVQw?=
 =?utf-8?B?dytyYnpnWHhVeTZvMHpuam8vTTdaQ05WbE9XcXpoRlFkZ201WEVSQm1kY3Nz?=
 =?utf-8?B?VjczWldoZzl6QWZERlJyNXE1RFhVdUEwczRvcTZsQU1FQzRWTVBET25ydnda?=
 =?utf-8?B?RnJUTHY4V3VMZUZ0SjdwdXRTN2RoK2luUE9YMWxBY2RQQjg2aE1XZGN4SUZB?=
 =?utf-8?B?VmhWaTBmWkNZWHlrakpQcjIveFlUNHhtRnBrZVZrdS90bjlWOXl6Y2xYTTRE?=
 =?utf-8?B?YWtoRDlLMEhicThCdFpXK2hxeUVINC9LYUtRWE50NzhDV1prSyswQVppL0RL?=
 =?utf-8?B?ZzBRek9sbmhramxGbUcyUWFRcFdKU1p3ZktHbTRyWDkzNTJUZ09RbEthZHh0?=
 =?utf-8?B?L3h6RnBITlJ0ekNHVGtwZ1J2NlRYQ05BMi9UemxuMVJLWU82VGpMS2VhS0RQ?=
 =?utf-8?B?cmdDSW93Y05kc3FIaC9hbW5Ea3JoWWlqV25MaXRwWGY5azN6SDhRaVlkbDZ2?=
 =?utf-8?B?UjB1TEZjTkdNM2szeC9rV0s4ODZQZHZXZ0tTM2NDZlpxRUo1S09JTWIwNjk1?=
 =?utf-8?B?eG5oYWZYRnEyWHJYcnhGZGdjRlVoVTBDUjQxSHhibXBvQVFmY3lUQkVHZHZC?=
 =?utf-8?B?VkVkTEJDU21iRENORnZNWHBUemhmWjcxd0ZHeWduWUlMZDlaL2t6dG9MTUk1?=
 =?utf-8?Q?juE8nIfDILiEhEqg8eiUX8Nd5?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A32B686B55314D488B3B6C946DC5779E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e076e0f-8623-4af3-8c1f-08da5ebc7c35
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2022 19:28:05.6468 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HHWcDpMmuNknfJ5KYlGdG+yycygpbWtaxB8EYACVOv2+I2SotKO3Es84CXiz0ORnuAH9/RRCWI615R4GUSZYkqLc2KcQtA7YAlIbQiOjEXo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3472
Cc: niklas.cassel@wdc.com, alsa-devel@alsa-project.org, airlied@linux.ie,
 palmer@rivosinc.com, linux-kernel@vger.kernel.org, Conor.Dooley@microchip.com,
 thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 linux-riscv@lists.infradead.org, sam@ravnborg.org,
 damien.lemoal@opensource.wdc.com, daniel.lezcano@linaro.org,
 joabreu@synopsys.com, geert@linux-m68k.org, Eugeniy.Paltsev@synopsys.com,
 devicetree@vger.kernel.org, aou@eecs.berkeley.edu, broonie@kernel.org,
 dri-devel@lists.freedesktop.org, paul.walmsley@sifive.com,
 dillon.minfei@gmail.com, lgirdwood@gmail.com, fancer.lancer@gmail.com,
 vkoul@kernel.org, palmer@dabbelt.com, daniel@ffwll.ch,
 dmaengine@vger.kernel.org, masahiroy@kernel.org
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

DQoNCk9uIDA1LzA3LzIwMjIgMjA6MjMsIFJvYiBIZXJyaW5nIHdyb3RlOg0KPiBPbiBGcmksIEp1
bCAwMSwgMjAyMiBhdCAwODoyMjo1MVBNICswMTAwLCBDb25vciBEb29sZXkgd3JvdGU6DQo+PiBG
cm9tOiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPg0KPj4NCj4+IFRo
ZSBrMjEwIFUtQm9vdCBwb3J0IGhhcyBiZWVuIHVzaW5nIHRoZSBjbG9ja3MgZGVmaW5lZCBpbiB0
aGUNCj4+IGRldmljZXRyZWUgdG8gYnJpbmcgdXAgdGhlIGJvYXJkJ3MgU1JBTSwgYnV0IHRoaXMg
dmlvbGF0ZXMgdGhlDQo+PiBkdC1zY2hlbWEuIEFzIHN1Y2gsIG1vdmUgdGhlIGNsb2NrcyB0byBh
IGRlZGljYXRlZCBub2RlIHdpdGgNCj4+IHRoZSBzYW1lIGNvbXBhdGlibGUgc3RyaW5nICYgZG9j
dW1lbnQgaXQuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29s
ZXlAbWljcm9jaGlwLmNvbT4NCj4+IC0tLQ0KPj4gIC4uLi9tZW1vcnktY29udHJvbGxlcnMvY2Fu
YWFuLGsyMTAtc3JhbS55YW1sICB8IDUyICsrKysrKysrKysrKysrKysrKysNCj4+ICAxIGZpbGUg
Y2hhbmdlZCwgNTIgaW5zZXJ0aW9ucygrKQ0KPj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVtb3J5LWNvbnRyb2xsZXJzL2NhbmFhbixrMjEw
LXNyYW0ueWFtbA0KPj4NCj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvbWVtb3J5LWNvbnRyb2xsZXJzL2NhbmFhbixrMjEwLXNyYW0ueWFtbCBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZW1vcnktY29udHJvbGxlcnMvY2FuYWFuLGsy
MTAtc3JhbS55YW1sDQo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPj4gaW5kZXggMDAwMDAwMDAw
MDAwLi44MmJlMzI3NTc3MTMNCj4+IC0tLSAvZGV2L251bGwNCj4+ICsrKyBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZW1vcnktY29udHJvbGxlcnMvY2FuYWFuLGsyMTAtc3Jh
bS55YW1sDQo+PiBAQCAtMCwwICsxLDUyIEBADQo+PiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmll
cjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpDQo+PiArJVlBTUwgMS4yDQo+PiArLS0t
DQo+PiArJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9tZW1vcnktY29udHJvbGxl
cnMvY2FuYWFuLGsyMTAtc3JhbS55YW1sIw0KPj4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVl
Lm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIw0KPj4gKw0KPj4gK3RpdGxlOiBDYW5hYW4gSzIx
MCBTUkFNIG1lbW9yeSBjb250cm9sbGVyDQo+PiArDQo+PiArZGVzY3JpcHRpb246IHwNCj4gDQo+
IERvbid0IG5lZWQgJ3wnLg0KPiANCj4+ICsgIFRoZSBDYW5hYW4gSzIxMCBTUkFNIG1lbW9yeSBj
b250cm9sbGVyIGlzIGluaXRpYWxpc2VkIGFuZCBwcm9ncmFtbWVkIGJ5DQo+PiArICBmaXJtd2Fy
ZSwgYnV0IGFuIE9TIG1pZ2h0IHdhbnQgdG8gcmVhZCBpdHMgcmVnaXN0ZXJzIGZvciBlcnJvciBy
ZXBvcnRpbmcNCj4+ICsgIHB1cnBvc2VzIGFuZCB0byBsZWFybiBhYm91dCB0aGUgRFJBTSB0b3Bv
bG9neS4NCj4gDQo+IEhvdyB0aGUgT1MgZ29pbmcgdG8gZG8gdGhhdD8gWW91IGRvbid0IGhhdmUg
YW55IHdheSBkZWZpbmVkIHRvIGFjY2VzcyANCj4gdGhlIHJlZ2lzdGVycy4NCg0KRXVnaCwgY29w
eSBwYXN0ZS4gSSdsbCByZXBocmFzZSBpbiB0aGUgcmVzcGluLiBJdCBzaG91bGQgYmUgImluaXRp
YWxpc2VkIGJ5DQpmaXJtd2FyZS4iIFRoZXJlIGFyZSBubyByZWdpc3RlcnMsIG9ubHkgY2xvY2tz
Lg0KDQo+IA0KPiBBbHNvLCB3aGVyZSBpcyB0aGUgU1JBTSBhZGRyZXNzIGl0c2VsZiBkZWZpbmVk
Pw0KDQpUaGUgYWN0dWFsIHNyYW0gaXMgaW4gdGhlIG1lbW9yeSBub2RlLg0KDQo+IA0KPj4gKw0K
Pj4gK21haW50YWluZXJzOg0KPj4gKyAgLSBDb25vciBEb29sZXkgPGNvbm9yQGtlcm5lbC5vcmc+
DQo+PiArDQo+PiArcHJvcGVydGllczoNCj4+ICsgIGNvbXBhdGlibGU6DQo+PiArICAgIGVudW06
DQo+PiArICAgICAgLSBjYW5hYW4sazIxMC1zcmFtDQo+PiArDQo+PiArICBjbG9ja3M6DQo+PiAr
ICAgIG1pbkl0ZW1zOiAxDQo+PiArICAgIGl0ZW1zOg0KPj4gKyAgICAgIC0gZGVzY3JpcHRpb246
IHNyYW0wIGNsb2NrDQo+PiArICAgICAgLSBkZXNjcmlwdGlvbjogc3JhbTEgY2xvY2sNCj4+ICsg
ICAgICAtIGRlc2NyaXB0aW9uOiBhaXNyYW0gY2xvY2sNCj4+ICsNCj4+ICsgIGNsb2NrLW5hbWVz
Og0KPj4gKyAgICBtaW5JdGVtczogMQ0KPj4gKyAgICBpdGVtczoNCj4+ICsgICAgICAtIGNvbnN0
OiBzcmFtMA0KPj4gKyAgICAgIC0gY29uc3Q6IHNyYW0xDQo+PiArICAgICAgLSBjb25zdDogYWlz
cmFtDQo+PiArDQo+PiArcmVxdWlyZWQ6DQo+PiArICAtIGNvbXBhdGlibGUNCj4+ICsgIC0gY2xv
Y2tzDQo+PiArICAtIGNsb2NrLW5hbWVzDQo+PiArDQo+PiArYWRkaXRpb25hbFByb3BlcnRpZXM6
IGZhbHNlDQo+PiArDQo+PiArZXhhbXBsZXM6DQo+PiArICAtIHwNCj4+ICsgICAgI2luY2x1ZGUg
PGR0LWJpbmRpbmdzL2Nsb2NrL2syMTAtY2xrLmg+DQo+PiArICAgIG1lbW9yeS1jb250cm9sbGVy
IHsNCj4+ICsgICAgICAgIGNvbXBhdGlibGUgPSAiY2FuYWFuLGsyMTAtc3JhbSI7DQo+PiArICAg
ICAgICBjbG9ja3MgPSA8JnN5c2NsayBLMjEwX0NMS19TUkFNMD4sDQo+PiArICAgICAgICAgICAg
ICAgICA8JnN5c2NsayBLMjEwX0NMS19TUkFNMT4sDQo+PiArICAgICAgICAgICAgICAgICA8JnN5
c2NsayBLMjEwX0NMS19BST47DQo+PiArICAgICAgICBjbG9jay1uYW1lcyA9ICJzcmFtMCIsICJz
cmFtMSIsICJhaXNyYW0iOw0KPj4gKyAgICB9Ow0KPj4gLS0gDQo+PiAyLjM3LjANCj4+DQo+Pg0K
