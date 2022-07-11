Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DECD570A06
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Jul 2022 20:36:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC11BE0E;
	Mon, 11 Jul 2022 20:36:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC11BE0E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657564613;
	bh=H5tW3po4l2zMow9OrE4ghvA4aiWULJvWcCJQkVpWe80=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lvAov5nvrQhZsJs0JEB3uUXy2vi2OKQzFmRCJCUd3bd+prcLVpVi/fztB2SxQTpQI
	 iiYa0dI+dQ3bypWyFPFEYkaDYPpHLA1lAJXYOyI/no6UT4Z4rx3+f951ltpU+StYHS
	 LmVX4D0C6y/hW85eMpEwfbyTcQ48p9QWDMTMUXuI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F2ADF80256;
	Mon, 11 Jul 2022 20:35:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 80A58F80163; Mon, 11 Jul 2022 20:35:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B2444F800E8
 for <alsa-devel@alsa-project.org>; Mon, 11 Jul 2022 20:35:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2444F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="1YPYf021"; 
 dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com
 header.i=@microchiptechnology.onmicrosoft.com header.b="JYS9j2sg"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1657564545; x=1689100545;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=H5tW3po4l2zMow9OrE4ghvA4aiWULJvWcCJQkVpWe80=;
 b=1YPYf021n+MVTmOjALBdnygMUW4+jGbsTbiGdDrdYjQ2uGUDrbh9yx0q
 PQraCTVYatdmVXJwljhtn8NzBM4R4YiimLVRkh1lNTsKM6Oet0A1qgARW
 yKzrZPoO0Vwgziudty5L2/5nOFiWyxYq98pA3rHibYOHgmaIVZQgLF97b
 lMMioS5ddwXyfruX2dXfTztVj/KfdaSY4OCnR9SlVyXKaf2/UedjWQuUu
 9+OJLAYQT4uU93wsz3cL6twHZ2aykiuP3NpZTTivekB1A38Ix4c4QeCwi
 ELkEmI+6QumKHyjFIfVmQ1BJF9TTboTyRDVIscl5wxDsn7wGyyumSZa1f w==;
X-IronPort-AV: E=Sophos;i="5.92,263,1650956400"; d="scan'208";a="167333644"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 11 Jul 2022 11:35:22 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 11 Jul 2022 11:35:21 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Mon, 11 Jul 2022 11:35:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CqNC8r+GRpxmbSqk++WzD35Zh9MyfHx9AFcieE+EVntFjTPfKkwN9ekXf6HLO/zCvqLoFu404l45IyA7NFU2Yjn0zh2AFOcHqsyr8Ev5SKGLGV6uUELHUvcYXdF8MHsZfk11zPDSUM+6BAF6HqqsdFRdAza3atdCKnjXsvropCPSfZyZJDUdr3lribtvNn4hw42VqsO4q7Cs3zvYkYcdxzKpXQDG6FDnDUSYYYlqkOaqfus9lMFfMbEF+Fnd5/p5awNjyZBXsqE1ykUJNScHB//b0xwcVGQp0b8uvTRk5Cgi0pcfm2hRCz1lcM++GOkhCAIDmf2YNr8raMV2tcJEpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H5tW3po4l2zMow9OrE4ghvA4aiWULJvWcCJQkVpWe80=;
 b=RpZ4PMGJqFq0H4SmpSXKMjancjFnYpBYp9merdnbLnN6+7p3oxrtkFZh4/Fdgc/N5M6+Yc1mpxPtFRlN7ccaY5CErBcNsakBK2Hv30w2P0HsLrcki3H9OGFifpNA+XQgwRD06r5mYGwSDo27CIcNVeXgIE8ssoDSMojfqE1p3ljgFDavUmxN1vBqjRg2VvnS8uF46mvXBydY2cFNtVfo9ohEMdnAf+2pRyzfW8eS3n2+wphCnfaIU/Cpp+jVaO9gA6JMU4wEDezOWZ9dW7j8rR/lJj3iMAukDBKkFp6WHRoIhFeChsf8OqSqQ/W09RLALL5DTnyzYVOUPYgvugKoQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H5tW3po4l2zMow9OrE4ghvA4aiWULJvWcCJQkVpWe80=;
 b=JYS9j2sgROArC7uD3kjE38w2qULqaWH0/VtvrxruipwC1rNP4/K+9g+1UxiKwMZD/aKXIirqBjkIrcHctdi7fdT8wBkHOZEvddZ1fmXls6l27/MFrlpMZqTxuhNliYh+WeYw2PgP9cjB/JsJO7daIcYu0ptfSHfU94ov/5K/mg8=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by BN8PR11MB3668.namprd11.prod.outlook.com (2603:10b6:408:81::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Mon, 11 Jul
 2022 18:35:09 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::8d4a:1681:398d:9714]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::8d4a:1681:398d:9714%5]) with mapi id 15.20.5417.026; Mon, 11 Jul 2022
 18:35:08 +0000
From: <Conor.Dooley@microchip.com>
To: <Ryan.Wanner@microchip.com>, <lgirdwood@gmail.com>, <broonie@kernel.org>, 
 <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
 <Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
 <Claudiu.Beznea@microchip.com>
Subject: Re: [PATCH v2 0/2] dt-bindings: sound: Convert to json-schema
Thread-Topic: [PATCH v2 0/2] dt-bindings: sound: Convert to json-schema
Thread-Index: AQHYlVTyYonqOIFmQEKungwznccSFA==
Date: Mon, 11 Jul 2022 18:35:08 +0000
Message-ID: <f13ef75e-c884-eac7-2e88-b0d9bb7b0a3f@microchip.com>
References: <20220711183010.39123-1-Ryan.Wanner@microchip.com>
In-Reply-To: <20220711183010.39123-1-Ryan.Wanner@microchip.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 54f1274a-d5cb-4d74-5069-08da636c1521
x-ms-traffictypediagnostic: BN8PR11MB3668:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 49bXnUaRbyvnBoZZHc6z9jbo6zd7WmAf4Wx7CeG9upEZ32r1nCa551zS7Llnr6m1CSxH5IQLOp0leAXSLHHDvv1ZMiUf1V2gABS+2+3w6O5xacgKZ2r/Q1F1vHlkq+zQ5/fBEQbRAEnqfwdzw/UtVDo7PTuZ+HZsTFNWNXWDtiH2YhIBDzcAgYDXoF85hp0xlbj5kiLRf1hGVtPmr1l7jsyto+SFiGSueZPQ+cDPStxaQc6/pzuK6GFIjJXxFPt/9cSVYPcPHBQVn+x2cd68BGRIvY0CqTJdOJAXWJnJ8HrBVeysz+FzMtHh2WCjfoy3vrI2JUor0YdhizUGqGKD04tLWMl3PyrcAPInG9D9Y3+shx30umxmnBusuF8h9/AxFNHUjkbwe7IKq3nmrZPWQw+YZYdg6T8ExGKgwB+tafFtVvemdDtAJ7phBf2CCdXqUByx+CTgyCLUdg0I35GbCzg5QJF6nQ/HC0P01ZuezcZpCIxgO9vVR945XRZr9pK4N2AYLKFrKM1wes/81ShKE4bTR3L38dnvPQEt6RIJOeRH2ekYXTHPm4m4hvDm5JgmbrIaxzCH75JUU9VRbmtGJTzSh5eT3V+W9nB55DQFq1BbH/zZgOP5/Zmqbh+sZiZIXkTX0udL+sGQ+8hRaRzxKhWz3O54TszYYYWsRDAZp34Gu4ZgtNcvU4LtKSOPiZ3mIDc/YEFBfzQ7KbfdTPRpDCMnfQ6yD1cz9KwvACZXbpwtZU8Y+CH04zUiZuAGiyUC59XIvBQZgE9dtnHXl9TmO1xEzlRm8O+Ev/HQs2BuPOM8DP6Hbyo1azbb5GHWoUTmAD1yXRirsDunjt9b36MkUG0uOczDMENAEsO59/2xpGeeZt6JNLsJ8apvuW7NBbu4
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(136003)(376002)(366004)(39860400002)(346002)(2906002)(41300700001)(6512007)(26005)(53546011)(6506007)(38070700005)(122000001)(38100700002)(316002)(66556008)(8676002)(2616005)(76116006)(66476007)(64756008)(4744005)(66446008)(5660300002)(66946007)(91956017)(4326008)(186003)(71200400001)(6486002)(36756003)(86362001)(31686004)(478600001)(8936002)(31696002)(54906003)(6636002)(110136005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VE5zTUJEWjdsdTU1SWFtSFdJOHZhS3J5d0xpakJOTERtSk0yZ3JqWmluaGZ0?=
 =?utf-8?B?MXZGTi9LdERubU92M0JWYzJDQnRWNjdDTGhlYzZxUHQ2OUU4TENrZmxJOUN3?=
 =?utf-8?B?ZGFTOCt3YVlTWVBtb2ZSM0RMZTltdkNXYUhWdCtCNXNyNG8xbFFxNlZJdjlE?=
 =?utf-8?B?VzhYejBIakh6ZENyeDZTWCsxY2ZhUEVadTdpeUVJSGlMSTNWTGorUUxKdHd6?=
 =?utf-8?B?V3YwWVhyUzJwYzRzM1FUY09nTmtKZFJJSnlnSzNQNVgrQmZodFhJM2xma3RD?=
 =?utf-8?B?aEF0ODIySDVMeWJQdTBOU0g5WVFkMElDM1IyS1NDMUtuNnVFMDNuRXBsVDdT?=
 =?utf-8?B?aGl6SmM3VXV1bjhveHVOaVdnNXRReUZVQlptMjdJQnZNU3NIamZ4SlNpdFdt?=
 =?utf-8?B?TnJhcjVLd21kR1RKOWJXQkNtSExMeW5kLzBzWk1UWGRkY0MwTFFMdnZUZDdk?=
 =?utf-8?B?M2hka29mRXZkSlkyMC92VWprVWhGZ1d2NXF5cGlVaG5KVG1sK2Y0T0JXRlM1?=
 =?utf-8?B?SnRtcHJacjdvNjZwK2tsZkxqTnYvK0NkcVlJKzNsZmFOaXIzL0ZiSzNtL3BU?=
 =?utf-8?B?U0s3a21KbW1ERHdpN1pudGlzQjE1Z2V5WkhobUFCRHVaMmo5aEVNZGx2Nnd3?=
 =?utf-8?B?N2RLaGpLaWFIZXJONXdwR2RMSVdhT1pCK1RVTkI1TmVoUU1tR1N1cWcwSW1E?=
 =?utf-8?B?TXRZZkxDMmpVWDNHcXU1dGdvZlhEY0F6QmduQ0tFL09EN2lnQ0gvTzBueFN4?=
 =?utf-8?B?Q0VTeTNtNUptcCtXckU1YVNRRW84TFI3WlUxcDBKazFOWGNKeXUyTzNsTW5r?=
 =?utf-8?B?dzd1MHlQSnFrdnlPanZCM1NTNWZQTVhrdlZCOHM4MHF5bEs3ZzVuNk9WUlJh?=
 =?utf-8?B?S0VSZTB6dDNSajZIRzV5VTd0cWxwLzVIa3NsU1lJZHpYbDZFUkROeE5aRmps?=
 =?utf-8?B?TVMycWJKWXExVHFzNHhRK0VOek4ydCtOZEtwOHpRYXJ1bGNvRUtSRWxqcnR0?=
 =?utf-8?B?amI2akREcEIwR2lGNktyenpUVFp0bTlnc2YyOGhGWHVSOFAvWE85QlNhQzJt?=
 =?utf-8?B?QndSOEJhdkRWTTVWWnBjdVo0UXZVellCYndkWGQrQTZML2dFcTZKZHBIY0dy?=
 =?utf-8?B?N1R6SC8zU0FUV3U4ZDA2VmxLQ0thMnRZTmcrVTc4U2NnYUVqS0tFcHZhempT?=
 =?utf-8?B?b3JONTNkWWllT2tRR3pwTWo4bWZqelF1dGZ1cjd0dzMrOGFwOUlkMHhOdUp0?=
 =?utf-8?B?SVNjTGpEaVpzVzUyWW9SeHVnN3RqQjAxcDVST0lKOUNSQU5Sc1ZQcGRWYkYw?=
 =?utf-8?B?VWZlUit1aUV6Z0NKdWRNTjY3aDBlTGwvTkMwLyt0VzhLVVBHSnQxcHBuWDF0?=
 =?utf-8?B?UmY1VmhQbVJRbHVFS3I5V3JLQnFQcXdPVWZ4U3dkdVFoSXk3dGEwOEc1ZCs4?=
 =?utf-8?B?ME1KT0NpMnppdE4yYTFQN1R5dFQ1cWNMSklqbjlZclNVSTEwdmdQVTZMdnhG?=
 =?utf-8?B?a2MvRzhYNnRDVmFzeW1YcWlIV2NVcGtwOUdjcGVsbWIyaFRhTVF4eTVYMjBI?=
 =?utf-8?B?NzRDbWRRVmorZHR6STNjVzdIcWF2SHBjRTlNK25jaW5kNUtRaDVCQkxsUVdn?=
 =?utf-8?B?QmNNQUZSM0NGZnBGT3BVaVNieVpLQkZwVTNIeklXT1IyQWVUQWh2S0c5dGhL?=
 =?utf-8?B?UTQrcjhqRVZxeHM3Tit4N1UwY3lpWWM3V3VRYTlvMzZIV2oxb21Ca2pPUmJL?=
 =?utf-8?B?R2tPN2pyOThVaTBkdDk0cUNndDRHVTRTUGdyb0Jaa2RXZmlWd0E4N0ZvSGhN?=
 =?utf-8?B?eitwdDhrajJPSnlQeVU2RXZDc0FUbnMyVGhvWGhQTmJUZ2JZZTN1QlgyOCt5?=
 =?utf-8?B?SGswc3RnS2pDdUZnaXpXeEpGV1lVK1YxQUNRVGhlQ3ZVWkF3dDBzUlQ0bHBy?=
 =?utf-8?B?YlpkMDlmMktaY0JNcUxwMGRjQlhYc3k1WUhVcExDelI3Wm81VHNWYlZZaTNn?=
 =?utf-8?B?YW1BZitQWS9PVm1qRTdhOUNUMXZkeUpPbzFLWVJOK1UxTGJtZlU4TjNXbWRn?=
 =?utf-8?B?M1hPSXMxOU52bUZNS0diS2tYbG05VnYxSWM0bFpOT3gwL0pnRlVNNlVIbnk1?=
 =?utf-8?B?bzVlenNod1R0blo0ZnBhRXh2eVZkYlJRTUROYUNDTU9nb2ErTU1NWTBDWjRq?=
 =?utf-8?B?bkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <310D85E49B5E8F46BB6DAC355105F742@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54f1274a-d5cb-4d74-5069-08da636c1521
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2022 18:35:08.8312 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sL3I621hWsNvk7Es38NDesIImbUoWLyeOc9lc8q8wWg99WlNs8xcnUMTHxamxFFNNUIo7AK8gqkWyDFhyu2gYoBOID1b8r9/k60xiZkFXkc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR11MB3668
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

SGV5IFJ5YW4sDQpUaGFua3MgZm9yIHlvdXIgcGF0Y2hlcywgZ290IGEgY291cGxlIGNvbW1lbnRz
Lg0KDQpPbiAxMS8wNy8yMDIyIDE5OjMwLCBSeWFuLldhbm5lckBtaWNyb2NoaXAuY29tIHdyb3Rl
Og0KPiBGcm9tOiBSeWFuIFdhbm5lciA8Unlhbi5XYW5uZXJAbWljcm9jaGlwLmNvbT4NCj4gDQo+
IFRoaXMgcGF0Y2ggc2VyaWVzIGNvbnZlcnRzIGF0bWVsLWNsYXNzZCBhbmQgYXRtZWwtcGRtaWMg
ZGV2aWNlIHRyZWUNCj4gYmluZGluZ3MgdG8ganNvbi1zY2hlbWEuDQo+IA0KPiB2MSAtPiB2MjoN
Cj4gLSBGaXggY29tbWl0IGZvcm1hdHRpbmcuDQoNCkZvciBzb3VuZCBiaW5kaW5ncywgSSBhZmFp
ayB0aGUgc3RhbmRhcmQgd2F5IHRvIGRvIGl0IGlzOg0KIkFTb0M6IGR0LWJpbmRpbmdzOiBmb28i
DQoNCklmIHlvdSBldmVyIHdhbnQgdG8gZ2V0IGFuIGlkZWEgb2Ygd2hhdCBzdWJqZWN0cyBmb3Ig
YQ0Kc3Vic3lzdGVtIHNob3VsZCBsb29rIGxpa2UgeW91IGNhbiBhbHdheXMgcnVuOg0KDQpnaXQg
bG9nIC0tb25lbGluZSBwYXRoL3RvL3N1YnN5c3RlbQ0KDQpTbyBmb3IgdGhlc2UgcGF0Y2hlczoN
Cg0KZ2l0IGxvZyAtLW9uZWxpbmUgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Nv
dW5kLw0KPiAtIEZpeCB0aXRsZXMgaW4geWFtbCBmaWxlDQo+IC0gUmVtb3ZlZCB0cml2aWFsIGRl
c2NyaXB0aW9ucw0KPiAtIENvcnJlY3QgZm9ybWF0dGluZyBlcnJvcnMgDQo+IA0KPiBSeWFuIFdh
bm5lciAoMik6DQo+ICAgZHQtYmluZGluZ3M6IHNvdW5kOiBhdG1lbCxjbGFzc2Q6IENvbnZlcnQg
dG8ganNvbi1zY2hlbWENCj4gICBkdC1iaW5kaW5nOiBzb3VuZDogYXRtZWwscGRtaWM6IENvbnZl
cnQgdG8ganNvbi1zY2hlbWENCiAgICAgICAgICAgICAgXiBmb3Jnb3QgdGhlIHMgaGVyZQ0KDQpU
aGFua3MsDQpDb25vci4NCg0K
