Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D472E761016
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jul 2023 12:02:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 168D114F4;
	Tue, 25 Jul 2023 12:01:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 168D114F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690279322;
	bh=wAqyz8wYEsIapFRPmlHdOPSJdpww6JMWjjaTiOm81bE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NZQs8GZEdQBOBeRzxX5PDWq0oNXGiC+sinhh+/jjBtfmt5nwv/aOyagU907Zhjevs
	 PC7la0CRaCfb7lNAfY9MbZ3hswPobHtErZmyCsm1R0qCqePPSUfahDgAPJYyYGy52n
	 J9nGOvnpA6Er83S5clqFZ/tGVSPSWyTkQkYoUZtE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 96497F80310; Tue, 25 Jul 2023 12:01:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 57D42F80153;
	Tue, 25 Jul 2023 12:01:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BD6B4F800C7; Tue, 25 Jul 2023 12:01:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e1a::60d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C33AEF800C7
	for <alsa-devel@alsa-project.org>; Tue, 25 Jul 2023 12:01:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C33AEF800C7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256
 header.s=selector1 header.b=ffuP2xBa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fOU4iV3VeRsGce+AhyODAc3OmpG2UvVbwPXpOCw6YDiLi5izkvIdPk3pyzWYrfDWH+lxG+SxGu5j+I5fFdsmPDXztL9nMSE98hj4wGq3KLHqbSZks6x3qylnsNnvjFkRKsfsgOTYWQRZ5tQq4fq7hoZbpGUC+1pRC1F44Y0M1jRR7s7FD2Hgnp+npYyt0L98+5OMnMA5VXmtxGthNMp/G6xFoFogpZVaqnxpG0jBCmFphdAY5UFgSspqa+w3tbPE/uo09umhhVlFhKwmCYAKhv8unUqLYuewljot6wBlvI7tTneTVfQKiR5cjMsa5RTVEyt9Xe/+6G/wO453Eq2DDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YiFmC4w2iYUbumQmMmmoeZYGf1eQtooKrdu/BYtG/iM=;
 b=k1wNLOh/OcFbvENFuTfdaL//LhKY6T+6Fr0pxMSKLEa2DWkfd67/lHBa9mzSO4i6zdEai3UIV+V1rfZHEsabmWgte2PSqBIEej7o0LWHIw0mNoFqT+AMAtkHaYGrXVmYYjKD3lQH8KTtvMyQq0nDgwGFewBB3ztTFsBKlGDkp/0a4BI5FK9shNdx+JpEhdLQ3ycu3IGLpxCKQplqWgbiRQqV6tNCEnrFO12jbG5H8W9jNKr7UCc8GqDnQzqjSK4YgzlTYT1FOi9lqgeVreYA99sudqT7i9M1dmNh6oICHmB9w8ggwxj9tp6Y0XgBSAUaQH3pBj8WtAyraR7lBB6fKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YiFmC4w2iYUbumQmMmmoeZYGf1eQtooKrdu/BYtG/iM=;
 b=ffuP2xBa26jH243GfumUc4srjDFg2zkV6vleCYWf+OXNxLrI2MYg1LAh2oYeqiDJ3fK92ofi1MdaiMudLPrQFAwy/fbtADXf/xkzxdR/iGtXoJdpGs9LZK/O02BcEWFHLYzThXMpUnChDUUzgLukcyLrWZz/dtT7kHRDT2MwNCf7nfJLK6ILgCTw4rPqm8jzxQBxdMUFzy/XJK3VpwllF71YYWgREdSBoPAvB3RcLn8pGv9xuhRF7uIZ2NrxdweYwCdZ/JFk5lscycxCqe+yDmhRGXVAx3zL8UvlvALakXNJqQ0fDkNsJ4jk7+dP5FHEvqgIiqQrLwD3Qbr4y1JJYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com (2603:10a6:800:126::9)
 by AS8PR04MB7509.eurprd04.prod.outlook.com (2603:10a6:20b:23e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Tue, 25 Jul
 2023 10:00:56 +0000
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::7ef4:97ef:66d5:f5b3]) by VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::7ef4:97ef:66d5:f5b3%2]) with mapi id 15.20.6609.032; Tue, 25 Jul 2023
 10:00:56 +0000
Message-ID: <7c6d14f3-0453-af11-de07-db937c49e60e@suse.com>
Date: Tue, 25 Jul 2023 12:00:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 01/32] xhci: add support to allocate several
 interrupters
Content-Language: en-US
To: Wesley Cheng <quic_wcheng@quicinc.com>, agross@kernel.org,
 andersson@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org,
 mathias.nyman@intel.com, gregkh@linuxfoundation.org, lgirdwood@gmail.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 srinivas.kandagatla@linaro.org, bgoswami@quicinc.com,
 Thinh.Nguyen@synopsys.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-usb@vger.kernel.org, alsa-devel@alsa-project.org,
 quic_jackp@quicinc.com, pierre-louis.bossart@linux.intel.com,
 oneukum@suse.com, albertccwang@google.com, o-takashi@sakamocchi.jp,
 Mathias Nyman <mathias.nyman@linux.intel.com>
References: <20230725023416.11205-1-quic_wcheng@quicinc.com>
 <20230725023416.11205-2-quic_wcheng@quicinc.com>
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20230725023416.11205-2-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0019.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::6) To VI1PR04MB7104.eurprd04.prod.outlook.com
 (2603:10a6:800:126::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7104:EE_|AS8PR04MB7509:EE_
X-MS-Office365-Filtering-Correlation-Id: 56647b15-185a-44d8-15c9-08db8cf60a13
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4ONfF8IXFCdwQqxFVHg43J5/oxb3edES+vFAJ3AQpJWmRq/I1O1Sxp1RAC2wGYhSAOaRqUxNARLPeQXObzlVLnAlHRNe3VOz3SYzI/ImI6+sBHk8pU/kqHmbPItF43Z/ZBd30trbSoNb3smDQ+eduggPe2whUTbvUSWXemw6VjHJlS074X2CUAoVQUQDPo8EgNFrmj9XN6YBbQd77c6Ls1RFqWI46K/gbtWVr84LYMcB/g2P0pqVez0sDUhmdou7GDiaU+PUZ1lDhmD/FxA3eDCNHPbG+YYL6c9OcpseLZ70uDSvwxh7VgokGLFRBzNOVv9dJbvuhI+h1ATaS0HPCBQNaCM/qJlPIX93z+5BYIa3yKqf0Ri5MIJOLn/YBhwKj+hNDRxfoSVABdspR2i9XbLSFsBB0fegUAM/YjLSnWHfcuqKAGUZL01f3XwWi9hS0kd1mP6F6i3QjNElYGl/m4j8Xq1KFvOuKZBtGnCciPfsNmUIEeK8dlSzT2t485nRC+N6yGzoBBygBKA0VU5QafKcaVQeE1sRPQRaDWXl3LhWauHcFlrFjK9ML+xUnCAmbeEejT6DKhI0o85bdC+/pHadOyHSddkvljjUwOSwyrNrmAra2CxWxHRxM4Mt8kqTVPla6PrAypegQeh1cPp+4RrZMDWtUoBwOFQORGGvXsc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7104.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(396003)(136003)(39860400002)(376002)(346002)(451199021)(186003)(2616005)(6506007)(53546011)(83380400001)(4326008)(66556008)(66946007)(8936002)(316002)(66476007)(41300700001)(5660300002)(8676002)(6512007)(6486002)(7416002)(6666004)(4744005)(2906002)(478600001)(38100700002)(921005)(36756003)(86362001)(31696002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Wk5ielUyMGJJUnpwRXZ3MVJsV2tSZDBiNEkydyswRTdOL0NDKzF1RWVLejJP?=
 =?utf-8?B?MXZMSVJQUFdTRVJISjZmSEF4MzdKUy9qa3hVTWx6WDY2dUMzcEVYTXR2Y3RP?=
 =?utf-8?B?RFZCRHpqcmluN01EL2pubjEyY292eEdLZU1lUytrQ3pLdkNBcW51bXJ3VjhN?=
 =?utf-8?B?eHVjUTNXOUsrQ3VvWjY5MkJaUmMwREh0TUxjUGllRzNRZ3NQS2lwcXNSaVF2?=
 =?utf-8?B?RzJNVGJ2cGVaMjVXa3lyRjRCcW9yaTVuR0M1Ny9WS28wVnlzZE9YQWVndjN2?=
 =?utf-8?B?cmpvZDl2b3RHZHdkNXdScUgzUWw4bzc5VlovV1dtRk14ZTFOWE10bDVhS0xv?=
 =?utf-8?B?N2QyM1libkVUMytyMDNXUUk4RGFHWXo1QWRLR1NzajBPVC94Q1VCMExraC9M?=
 =?utf-8?B?azQzbjdWd2tGUXJWbUpBeEYrQTJkZUJDcldZek9YL1dyU2NoOGhOMGg3dVdj?=
 =?utf-8?B?Vi8vdkcwZlhjdWthaHQzL3NwSFBjRXgxeGJEQUlpTVpGL051WXJrVTNuWFVY?=
 =?utf-8?B?MkZ1a2hBb0I4VFpqSnFvcXo0NWpMMktnTlJad0RPVlFaZFlsTDR5aWtIb01r?=
 =?utf-8?B?LzdyZTBOc2ZZbU9mdzRuTGxBaG9iRFVoK05wZlU3M0JBbC9XWWc3eERmM3d3?=
 =?utf-8?B?aGExbW5mbElEbCtYYkI5L0Flc2tWNUVhTHFDOVhhKzlnR1ZWMDJ6eld5czJ6?=
 =?utf-8?B?anlqUUNNUWZvbjN5WVlHWnBRL2hnYmlVTFQwZU8xZ09VRXJVRXo3bjhmV1lK?=
 =?utf-8?B?ckppNndMeVBSTDFGcFFXK1doNmhmbWNkOEVWSnovTlY3RGErWGFMeDJ5S1lz?=
 =?utf-8?B?bUFNUlVaemdxZzhpWDlKK3N1VjN0WlJiZFllUnh1cjJITWRienBqZSt3UUUx?=
 =?utf-8?B?blZvL2dIaXNTUngzRndMTFRFSi81WElGeEFSdWVSUnhwN1dKMTJMeWRZNVFD?=
 =?utf-8?B?dURJd0FXc0QxcXUzZ0t4QTJxeXpzSm9qc2hCOFN3VGEvL2M2elphbmNBQk9l?=
 =?utf-8?B?MjBZVjJvajZ0cXhlVzVYbjU5VlNIbkh6TmlvN0l3bHF2YmVYeXBpL2tEcWFC?=
 =?utf-8?B?Q0xyTngxeUdzWVJwdDlkejFyb3FsT3lkQXFYbVdUMTFSczBtZWY4YytNUDJW?=
 =?utf-8?B?UWowOWNjVWFhODJ5eGp0S2tPNGhrWUl1VUowbWlVS3VxbnpTdFU0cDcxWFp5?=
 =?utf-8?B?clgvSHRoUUVCN2lEYXJjMDBQaFdvWE9KWm1rbGRFQ1RBOE5hSERkcTZRYnZm?=
 =?utf-8?B?SVBmbW1DWUwxWkNPbGNoakxWNWVPZ1BSWjkxdVRPbFdDQlAxMWxWZ3Z2QWJJ?=
 =?utf-8?B?SXVjd0d1N1JnL2NPbENIUm9sMWNGU3M2SGhMVDBXOHhWNzZYcnpvTDJnMXpz?=
 =?utf-8?B?cEtCZ05oeWtOb3pEZE9IczJWa3c1K1NsaExEci9qOGxXVDQwY1dnNjlDOXA4?=
 =?utf-8?B?MWpiN25BL3lMQ3R0MWczWEVJWW5zb013YnA2OHNsMUJWVUZpTWx1OTNVaFZS?=
 =?utf-8?B?dG5qc2RORm54SWF5K2JMZUd6ZlBkalZSOFMxVGZPOVZqWENNRVlHVnJxc04z?=
 =?utf-8?B?N3BvVVNEOGdncGo4MllpMmsySUVDdUYweU1jUDAySVZIMlVLT1dJSG1CK1pS?=
 =?utf-8?B?WjZqdGMvajhvTnp2Yjh3Nmc1YlR0WjMvRmxIWmE1YW4yazl6SzNrMnZSMHJz?=
 =?utf-8?B?YzVXNnNER0F2bVFORGo3blQ3TVpDU0VqSmJCYm9MdVRRRmUxL1kxa3pLSjlr?=
 =?utf-8?B?S0lCK09waXVwOUd6K1RuZFp4NVdWNVlEWVdLY3FEbURabFZzYXpvWVZYQm9W?=
 =?utf-8?B?ZmJrdXZnMk5HelBFZk5sNkY5MmY1NjN3MGxYYVB5U0ZDTzNCQ0VUdXlYNGpT?=
 =?utf-8?B?aGoxM252MGFsTURPdndySXBRd1ovQXU0K0YxNXVuU0czTVVNYkpSQng2Q1V2?=
 =?utf-8?B?WXhzanVaRjJqZmxWcGgzeHgrQThRVW5GTURQZmdHT01scDlxQ1BlTGJwSE54?=
 =?utf-8?B?VFY4dGRjY0FCYTlQT29IL1pWeU9sajZOKzBESlp1dVJGb2hHOHlubStJUldV?=
 =?utf-8?B?MDB6UVRTRmtqSm5SZ0pseUd6cFhRZ3Z4UllvZUZLWFZpZzVjTERnNHViYkEv?=
 =?utf-8?B?S1lyS2E3dHFuWVMrOHdpbFVpT1pzYVhJVmd0Q283Y0tnTlp4WHM1RE04Q05l?=
 =?utf-8?Q?mTTTFIuIbfcGYXZJRyb8pjs=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 56647b15-185a-44d8-15c9-08db8cf60a13
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7104.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2023 10:00:56.3933
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 QIcKURQ3k3vf6Tw4a687trQSECJf8K/3oc4boMXdevNaxqDEvY7TydWGfUQCRzYFfSbrMpWTdpaM/ubWbLm/xQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7509
Message-ID-Hash: ESHFOYLZMBXYAZO4GKU73SGZE5ELC6N5
X-Message-ID-Hash: ESHFOYLZMBXYAZO4GKU73SGZE5ELC6N5
X-MailFrom: ONeukum@suse.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ESHFOYLZMBXYAZO4GKU73SGZE5ELC6N5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 25.07.23 04:33, Wesley Cheng wrote:

Hi,

this is more of a stylistic remark, but this:

[..]
> +	/* Find available secondary interrupter, interrupter 0 is reserverd for primary */
> +	for (i = 1; i < xhci->max_interrupters; i++) {
> +		if (xhci->interrupters[i] == NULL) {
> +			err = xhci_add_interrupter(xhci, ir, i);
> +			break;
> +		}
> +	}
> +
> +	spin_unlock_irq(&xhci->lock);
> +
> +	if (!err) {

Making the non error case a conditional return is ...

> +		xhci_dbg(xhci, "Add secondary interrupter %d, max interrupters %d\n",
> +			 i, xhci->max_interrupters);
> +		return ir;
> +	}
> +
> +	xhci_warn(xhci, "Failed to add secondary interrupter, max interrupters %d\n",
> +		  xhci->max_interrupters);
> +
> +	xhci_free_interrupter(xhci, ir);
> +
> +	return NULL;
> +}

Was this taken out of a style guide that teaches to avoid "goto"
at any cost?

	Regards
		Oliver

