Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA8E846D04
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Feb 2024 10:54:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ACF2285D;
	Fri,  2 Feb 2024 10:54:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ACF2285D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706867657;
	bh=HLc3hEYTr2bWgL/m7HlioAfC3aKNshhQloeErHTOGqc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rmwo+eBQW2dsNUAW48jio93iDdGflASDjgt8XHU2rUziiMVFm+3PRJLz6dNEdGkmm
	 +MBTvI+axzvruNeglh1xzSLbXYUUvJL617zjkM05pGi1AjvU+bTBrBtF2m1J4wuuiY
	 2uRQ1rZA7SYRSLmutkWeFfSKSO8EUlkNQbApBkjs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 07D08F80563; Fri,  2 Feb 2024 10:53:40 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 69A40F80563;
	Fri,  2 Feb 2024 10:53:40 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 626E7F8055C; Fri,  2 Feb 2024 10:50:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from HK3PR03CU002.outbound.protection.outlook.com
 (mail-eastasiaazlp170110003.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c400::3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 78ABDF800E3
	for <alsa-devel@alsa-project.org>; Fri,  2 Feb 2024 10:50:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78ABDF800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=nuvoton.com header.i=@nuvoton.com header.a=rsa-sha256
 header.s=selector1 header.b=aWeuhzn9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dlhpENYc8I+m1Pv5I53/SvuXoeqgakpYvNlSbfhIURZBQut1EMa43oaqlKR3htM78GhrMZO1YmhPspLacEymOF8hBBdKN2GNE5QJ2gIHhG81+02E4iCcGpvZBOxB0CNXbhwOWyRDAPmdxHg4KkI5STRxjAGN2RNYIo3XGtMctCuD9ph4EvWTZR+de2ULcJKS/P3aGKisvH/Bnpm3NTfWLkC17xwgenv0TF+0WQzmHPi6yvcfVHZEkylTD85byfPYsCVHdZzv929F5e/r6GNKtEC90GhgS4vqBqp1hRe6DBnXSkBPDllPp7RA0VOeZgyKlUk+0lPLb4WJuiMSq+gwcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GAkdKHiayc4+9M6SK1NAAAqTa9Ex274nc1o4WfK0K6I=;
 b=oen80XP4aEM6hcqRx1S0hjwCuNgNRox6WOLLmzw/UhFeMwP6eg+RPKQe8h2OOQ9Qp8W2t2PP4LRBL4nbNg212MAlUeNtSqwEXb3+ixMUjbmQsm48ZPwgbX4MEt3SFe5DXtbBGpZmGHkK+iccmCV8+Hh2XF+Xhy4cwPH92PS2jjytvctl1fO0HvXQh4X6moJks+cDneZTcOpKH61anBidMTpikoV7msAV/fbisZSTctQsXUs/wPcicjVqyitedxFuu0NcDKhHVOb28tT4z3exXSl0mgzWrUkIlWsGnq6g1xxwOr9a+D1zOjwbZUztwwpKyjEP5tZ9xPDjo2f+E7LzcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nuvoton.com; dmarc=pass action=none header.from=nuvoton.com;
 dkim=pass header.d=nuvoton.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nuvoton.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GAkdKHiayc4+9M6SK1NAAAqTa9Ex274nc1o4WfK0K6I=;
 b=aWeuhzn9ej1ID+LXji9W81+Cwg7L1EDQmroEpgHWk9IIoWSrtWTXIG+iNOcZ6zHrbpS9gxWxZgBTwqMEsarSWB0QMB4PjqE5OTaikTeXEXF1MOTgeU52yS21Tio5AWSP+ZLMi/ZbTWp3j8VlgHikfV+74yexzPzIx9szgAm2kmU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nuvoton.com;
Received: from SL2PR03MB4348.apcprd03.prod.outlook.com (2603:1096:100:5c::17)
 by TYSPR03MB7910.apcprd03.prod.outlook.com (2603:1096:400:481::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.30; Fri, 2 Feb
 2024 09:50:36 +0000
Received: from SL2PR03MB4348.apcprd03.prod.outlook.com
 ([fe80::b6dd:f297:1b48:e1ea]) by SL2PR03MB4348.apcprd03.prod.outlook.com
 ([fe80::b6dd:f297:1b48:e1ea%7]) with mapi id 15.20.7249.027; Fri, 2 Feb 2024
 09:50:36 +0000
Message-ID: <12ec0515-ac50-1d4a-131d-56383130989d@nuvoton.com>
Date: Fri, 2 Feb 2024 17:50:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/2] ASoC: nau8325: new driver
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, conor+dt@kernel.org, YHCHuang@nuvoton.com,
 KCHSU0@nuvoton.com, CTLIN0@nuvoton.com, SJLIN0@nuvoton.com,
 scott6986@gmail.com, supercraig0719@gmail.com, dardar923@gmail.com,
 AS50 WTLi <WTLI@nuvoton.com>
References: <20240122095650.60523-1-wtli@nuvoton.com>
 <20240122095650.60523-2-wtli@nuvoton.com>
 <820c5ff7-4329-46b0-9981-607b1593deb5@sirena.org.uk>
From: AS50 WTLi <WTLI@nuvoton.com>
In-Reply-To: <820c5ff7-4329-46b0-9981-607b1593deb5@sirena.org.uk>
X-ClientProxiedBy: SI2PR01CA0031.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::11) To SL2PR03MB4348.apcprd03.prod.outlook.com
 (2603:1096:100:5c::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SL2PR03MB4348:EE_|TYSPR03MB7910:EE_
X-MS-Office365-Filtering-Correlation-Id: 99000c94-96ae-4e4d-b76b-08dc23d467b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jAWIq+VbBMhA47a05JwjRuF11qAL5F73rEI31ZJMjzuT6F2DBloNoGg7hHZDGFyPL8TmfEocVPfgL7ysSpo5TdQSGI/v9WsN3UDbvxQ/J9KgPpuqGNGvUAci+djQJv9mjclAlb9QriYlXGH43PHCc/wZMGpC6FVr6tabZI/E6xGTBMYE39E9B0xpHgNrUyl/lHNjApY3PiWoBGlY2lAGmf+z2PPFEKQpPmltLJabRL6O8HpXDz8HLo6SZYLL7bchFNBaNYcWTBP3sOy2fgueaLRsq+EFDdtIXym8yyxxQ3yMwcIusxb7CEK9dKAuXpntfFO0/wS2RPoR5+vQwBrAdEJlJB8j5ZAgLKcfecaoyuceBggt4FAhGfeZM7qXl/5W64hlcUNteOPyEUIBkXuSil51TQvcZnsft5I/r5AckCs0RmmUWwrG04LQ2sQagjj9meiaOcbBWgzAhes+LwjcjsxuRC2lZ+bHoIzH2ZkAQrzMM+SHFIZk6j0BSz29hIw/PwCJnfUHbu5Kg4z9xNb5azBcJvs+glROCA2QDUchD8i1SJOPWr2J5yagrFfuVLgi0OUoY6OntznQgoQhKvPoqy1UVEP9xawoRpOQCQjMcu4MH5k2FgvfzJk+ofEZIkhi5oLLlif4QBLru/URAKNMbw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2PR03MB4348.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(396003)(346002)(39860400002)(366004)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(41300700001)(83380400001)(26005)(6506007)(107886003)(6916009)(2616005)(66946007)(8676002)(8936002)(66476007)(7416002)(2906002)(4326008)(5660300002)(66556008)(316002)(38100700002)(6666004)(33964004)(478600001)(31696002)(6512007)(86362001)(6486002)(36756003)(53546011)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aDFQWHA4VUVFLzNUTzNxL2VjWEJFaDVpU2NHK1g2Znk0d3VvZW9acE5jUFZT?=
 =?utf-8?B?WTlPNmFFQ0dnWWJGQWxmZDhMY2plb05vK2thSExvb1d4MnFQZ0NrT28xY1FK?=
 =?utf-8?B?eFpsRldyWVFzVGYvRkhTTkhQT0htSVUzaDVaUTVlTEpITEptNDJ4NDNNSzcv?=
 =?utf-8?B?ZG54aHFPeFBKNzIrWFdhQW4zK3lORFhiNFM2N0FBMGo2L1NzbExwM1pIWkd0?=
 =?utf-8?B?NG5Rci9haTU0OFJjZm4zY1NkWVI4NGZXcHZPa2N6cTZpZDhCMC9rblNYTDZL?=
 =?utf-8?B?NXZXbGhQbVZ2c1ByWEFlM2dHV0tkcnpZaTkzcGV1dHpYZExGQmMzRTROOWF2?=
 =?utf-8?B?Qk5LNndDYmtEKzVGYXF5cDI2R2NBYWpaU2QvS3JwTWZ5VE5iU0VDZUtDeHVl?=
 =?utf-8?B?bGUvL1hLSTNTWEFTRGtJZTduQmhjdUUvZ2V0eFIyc2ZkdTFac2JtRC80ZW5U?=
 =?utf-8?B?Yyt2Q1dnK2NSUStQUHdleXNpWlFPdnIxL3k0clhwS2g4MVNZM3QxTzk5ZGRD?=
 =?utf-8?B?eTM2c1VoT3dUN2tMTjNoZzNuWTRCNXNrdXJGK25GdlR2OXA2RWJZMlJEMFVq?=
 =?utf-8?B?Tmk0Q3JvQzBLODg1UkoxTklKZjJyWlJvTjlDNHRZZ2RmZStvY205dU9odXo0?=
 =?utf-8?B?RFlHZ3NQUXI3dUJIN0JZUWl0dFNkeDRZcm5XVnhaNTVZNlpLak1CdkpiTER0?=
 =?utf-8?B?eU81L3RQbUFBbWljUFJOSXBXT3JlMHJmeHlaNHVhbndNa05LTkNIcThHL1J6?=
 =?utf-8?B?bFVtODNmZkxPbkRCekR1ZmZtKzVScVVhN1NtOEtHNTRvc1Rnbk50SFpWSjNK?=
 =?utf-8?B?dXU3ZHpjYTlFQy9WVWZMT25nR2ZueUh6SG1JM25yZk9LeWlwUkxTNlVkYjB1?=
 =?utf-8?B?NEhHcVVtZERpNzlXWkwvR21teTVUSVV1aDg0d1pvQ2pJNjl4ZSs4bGxzU0pW?=
 =?utf-8?B?OTU3STNNUC9xNFkwVGt6cS9PbzNLc3c4UkphejF1Wmh3YjI2d1VsejA5KzhR?=
 =?utf-8?B?eDNVcERGMUZ5ZWVaMEpYNkhud3gwbDV3VTU1Nm1PZGxXQlEwaExEaEhYanVX?=
 =?utf-8?B?R3lOR0dBdElQZ24wVytPUEJRUHpINGlNRCthdmNSZC9NZlZLWlFHVGhrU3dj?=
 =?utf-8?B?cURvajE5WkhEaUNhamtZejYzL1lOK2pnakhELzAxNjNXSHpwRGY4VklZNjBC?=
 =?utf-8?B?MXpLMUs4RFF3c28vbXBONzY2U29YUVJVZE1RMDNFRE9IdTk2Tkp3VVlMT2FC?=
 =?utf-8?B?Mnd0T2lXQVpNK2hUZGFJUEtGVjEzWVVOWncwb0pvdStzMTVCaXdRR051MWxU?=
 =?utf-8?B?cEc0cHQrYytDb0RCand6RjNTdk1PaW1HR1dIOVJzOG5jemhFWjlCdXQ4MU03?=
 =?utf-8?B?WEhOakdBYm9FWE1VbVRUTHJqVFRLbHFPdzJoUk5VaW1sdk1VUERRajJ5NWYz?=
 =?utf-8?B?K3N6dUVXQ1lWbWF0TGxQb1c3Zkh4QmxBUlZuQWRGcnJnaGpyYmE4c2NQNHVQ?=
 =?utf-8?B?c09QcEJXQ2ZnOER5MHFMeU15c1ZSTW52enZoL3F4NGR3ZmFPUitVdVNsT3I3?=
 =?utf-8?B?S0ZqR0NUN1BLZk5xc0JkdGI2YktYeGNsSy9zVFBrYmpqS1dlN24ycG50dDcw?=
 =?utf-8?B?V29yc2F1ODZnRlczM0V0VmYwSkRuQjZsTS9QUlpIdnBkdHJ2Y2hKeFRzTE14?=
 =?utf-8?B?MWxyVlVBVFNDcm80U3V0K0RSOU80M0VkUXZ4R2dzMUt5OW5VVEN2bTVPTWds?=
 =?utf-8?B?Wm5BYnZXU3ZDNHdzK3ZrZ1lWQU5DRGtmck5iZXMvQ0prZjBab1FOcDhYbWtM?=
 =?utf-8?B?V216SUcrU3VKbWNsN2VGNHFaMWxGVXBtWVZ2d01vU2hpT3BpY0pobnpsTGt0?=
 =?utf-8?B?clZxWU90ZUw2bk81WnJnZzBhU1JsSHFHdmZEZEpxK21VSXFINURTOEpnRWRv?=
 =?utf-8?B?eW1VQ1p2U2FrbVBld3Y5TUxNWE5JRHV4cmkxYVhSWTdQd2pUU052L29FQmEz?=
 =?utf-8?B?LzIyM3J4S3RxK0lmczJ5anRoRmZjdGtWUGEvM0Fpdm04QjlhcXBwa1NmTXc1?=
 =?utf-8?B?U2VPMHJQQ0NWaFQzTmlEaVRoVnliWXd6SlY3MkViZlNybFpMQ0twN0R1L0lU?=
 =?utf-8?Q?ItFE3o5qx4kucM5PAAb2PiGYZ?=
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 99000c94-96ae-4e4d-b76b-08dc23d467b1
X-MS-Exchange-CrossTenant-AuthSource: SL2PR03MB4348.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2024 09:50:36.2426
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 quyobS6q6hyf9YxIU9hGHRfuB/SYMkdtgkHaPhG2y8Dr7NGBM6C6opB/XRv+xkxg5vCBFixXq8jAp32W4SDYrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7910
Message-ID-Hash: VML6CWPCTQKAK4JHB7O5AQNNITS6YA5K
X-Message-ID-Hash: VML6CWPCTQKAK4JHB7O5AQNNITS6YA5K
X-MailFrom: WTLI@nuvoton.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; format=flowed
X-Content-Filtered-By: Mailman/MimeDel 3.3.9
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VML6CWPCTQKAK4JHB7O5AQNNITS6YA5K/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

DQoNCg0KT24gMS8yMy8yMDI0IDQ6MjggQU0sIE1hcmsgQnJvd24gd3JvdGU6DQoNCk9uIE1vbiwg
SmFuIDIyLCAyMDI0IGF0IDA1OjU2OjUwUE0gKzA4MDAsIFNldmVuIExlZSB3cm90ZToNCg0KDQoN
CisrKyBiL3NvdW5kL3NvYy9jb2RlY3MvbmF1ODMyNS5jDQpAQCAtMCwwICsxLDg5NiBAQA0KKy8v
IFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkNCisvKg0KKyAqIG5hdTgzMjUu
YyAtLSBOdXZvdG9uIE5BVTgzMjUgYXVkaW8gY29kZWMgZHJpdmVyDQorICoNCg0KDQoNClBsZWFz
ZSB1c2UgYSBDKysgY29tbWVudCBmb3IgdGhlIHdob2xlIGJsb2NrIHRvIG1ha2UgdGhpbmdzIGxv
b2sgbW9yZQ0KY29uc2lzdGVudC4NCg0KDQoNCg0Kb2theSwgSSB3aWxsIGZvbGxvdyBDKysgY29t
bWVudC4NCg0KDQoNCg0KDQoNCg0KDQorc3RhdGljIGludCBuYXU4MzI1X2Nsa2RldF9wdXQoc3Ry
dWN0IHNuZF9rY29udHJvbCAqa2NvbnRyb2wsDQorICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBzdHJ1Y3Qgc25kX2N0bF9lbGVtX3ZhbHVlICp1Y29udHJvbCkNCit7DQorICAgICAgIHN0cnVj
dCBzb2NfbWl4ZXJfY29udHJvbCAqbWMgPQ0KKyAgICAgICAgICAgICAgIChzdHJ1Y3Qgc29jX21p
eGVyX2NvbnRyb2wgKilrY29udHJvbC0+cHJpdmF0ZV92YWx1ZTsNCisgICAgICAgc3RydWN0IHNu
ZF9zb2NfY29tcG9uZW50ICpjb21wb25lbnQgPQ0KKyAgICAgICAgICAgICAgIHNuZF9zb2Nfa2Nv
bnRyb2xfY29tcG9uZW50KGtjb250cm9sKTsNCisgICAgICAgc3RydWN0IG5hdTgzMjUgKm5hdTgz
MjUgPSBzbmRfc29jX2NvbXBvbmVudF9nZXRfZHJ2ZGF0YShjb21wb25lbnQpOw0KKyAgICAgICB1
bnNpZ25lZCBpbnQgbWF4ID0gbWMtPm1heCwgbWluID0gbWMtPm1pbiwgdmFsOw0KKyAgICAgICB1
bnNpZ25lZCBpbnQgbWFzayA9ICgxIDw8IGZscyhtYXgpKSAtIDE7DQoNCg0KDQpBRkFJQ1QgdGhp
cyB3aWxsIG9ubHkgd29yayB3ZWxsIGlmIG1heCBpcyAxLCBqdXN0IGhhcmQgY29kZSB0aGF0Lg0K
DQoNCllvdSBhcmUgcmlnaHQsIEkgd2lsbCBtb2RpZnkgdG8gaGFyZCBjb2RlIGZvciB0aGUgbWF4
IGlzIDEuDQoNCg0KDQoNCg0KDQoNCisNCisgICAgICAgdmFsID0gKHVjb250cm9sLT52YWx1ZS5p
bnRlZ2VyLnZhbHVlWzBdICsgbWluKSAmIG1hc2s7DQorICAgICAgIG5hdTgzMjUtPmNsb2NrX2Rl
dGVjdGlvbiA9IHZhbDsNCisNCisgICAgICAgaWYgKG5hdTgzMjUtPmNsb2NrX2RldGVjdGlvbikN
CisgICAgICAgICAgICAgICByZWdtYXBfdXBkYXRlX2JpdHMobmF1ODMyNS0+cmVnbWFwLCBOQVU4
MzI1X1I0MF9DTEtfREVUX0NUUkwsDQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IE5BVTgzMjVfQ0xLUFdSVVBfRElTLCAwKTsNCisgICAgICAgZWxzZQ0KKyAgICAgICAgICAgICAg
IHJlZ21hcF91cGRhdGVfYml0cyhuYXU4MzI1LT5yZWdtYXAsIE5BVTgzMjVfUjQwX0NMS19ERVRf
Q1RSTCwNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgTkFVODMyNV9DTEtQV1JV
UF9ESVMsIE5BVTgzMjVfQ0xLUFdSVVBfRElTKTsNCisNCisgICAgICAgcmV0dXJuIG5hdTgzMjUt
PmNsb2NrX2RldGVjdGlvbjsNCit9DQoNCg0KDQpQbGVhc2UgdXNlIG1peGVyLXRlc3QgdG8gdmVy
aWZ5IHRoYXQgeW91ciBjb250cm9scyBjb25mb3JtIHRvIHRoZQ0KZXhwZWN0ZWQgQVBJLCB0aGUg
cmV0dXJuIHZhbHVlIGhlcmUgaXMgbm90IHdoYXQncyBleHBlY3RlZCAtIGl0IHNob3VsZA0KYmUg
YSBuZWdhdGl2ZSB2YWx1ZSBmb3IgYW4gZXJyb3IsIDAgZm9yIG5vIGNoYW5nZSBhbmQgMSBmb3Ig
Y2hhbmdlLg0KDQoNCkkgdGhpbmsgdGhlIHJldHVybiB2YWx1ZSBpcyBhbHdheXMgMCBhbmQgMSwg
YW5kIEkgd2lsbCBtb2RpZnkgdGhlIHJldHVybiB2YWx1ZSBmb3IgemVyby4NCg0KDQoNCg0KDQoN
Cg0KKyAgICAgICBTT0NfU0lOR0xFX0VYVCgiQ2xvY2sgRGV0ZWN0aW9uIiwgU05EX1NPQ19OT1BN
LCAwLCAxLCAwLA0KKyAgICAgICAgICAgICAgICAgICAgICBuYXU4MzI1X2Nsa2RldF9nZXQsIG5h
dTgzMjVfY2xrZGV0X3B1dCksDQoNCg0KDQpTaG91bGRuJ3QgdGhpcyBiZSBhIFN3aXRjaD8NCg0K
DQpZZXMsIHlvdSBhcmUgcmlnaHQuIEkgd2lsbCBjaGFuZ2UgaXQuDQoNCg0KDQoNCg0KDQoNCisg
ICAgICAgU09DX1NJTkdMRSgiQUxDIEVuYWJsZSIsIE5BVTgzMjVfUjJFX0FMQ19DVFJMMywNCisg
ICAgICAgICAgICAgICAgICBOQVU4MzI1X0FMQ19FTl9TRlQsIDEsIDApLA0KDQoNCg0KQUxDIFN3
aXRjaC4NCg0KDQpva2F5LCBJIHdpbGwgY29ycmVjdCB0aGUgbmFtZSB0byAiQUxDIEVuYWJsZSBT
d2l0Y2giLg0KDQoNCg0KDQoNCg0KDQorc3RhdGljIGludCBuYXU4MzI1X3Bvd2VydXBfZXZlbnQo
c3RydWN0IHNuZF9zb2NfZGFwbV93aWRnZXQgKncsDQorICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBzdHJ1Y3Qgc25kX2tjb250cm9sICprY29udHJvbCwgaW50IGV2ZW50KQ0KK3sNCisg
ICAgICAgc3RydWN0IHNuZF9zb2NfY29tcG9uZW50ICpjb21wb25lbnQgPQ0KKyAgICAgICAgICAg
ICAgIHNuZF9zb2NfZGFwbV90b19jb21wb25lbnQody0+ZGFwbSk7DQorICAgICAgIHN0cnVjdCBu
YXU4MzI1ICpuYXU4MzI1ID0gc25kX3NvY19jb21wb25lbnRfZ2V0X2RydmRhdGEoY29tcG9uZW50
KTsNCisNCisgICAgICAgaWYgKG5hdTgzMjUtPmNsb2NrX2RldGVjdGlvbikNCisgICAgICAgICAg
ICAgICByZXR1cm4gMDsNCisNCg0KDQoNCldoYXQgaGFwcGVucyBpZiBzb21lb25lIGVuYWJsZXMg
Y2xvY2sgZGV0ZWN0aW9uIHdoaWxlIHRoaW5ncyBhcmUgcG93ZXJlZA0KdXA/DQoNCg0KVGhpcyBj
bG9jayBkZXRlY3Rpb24gc3dpdGNoIHVzdWFsbHkgZG9lcyBub3QgdHVybiBvbi9vZmYgZHVyaW5n
IGV4ZWN1dGlvbi4gSWYgdGhpcyBpcyB0aGUgY2FzZSwNCg0KdGhlcmUgaXMgYSBjaGFuY2UgdGhh
dCB1bmV4cGVjdGVkIGV4Y2VwdGlvbnMgbWF5IG9jY3VyLiBTbyB3ZSdsbCByZW1vdmUgdGhlICJD
bG9jayBEZXRlY3Rpb24iIHN3aXRjaC4gVGhlDQoNCm1vZGUgaXMgZGV0ZXJtaW5lZCBkdXJpbmcg
dGhlIGluaXRpYWxpemF0aW9uIHBoYXNlLg0KDQoNCg0KDQoNCg0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18NClRoZSBwcml2aWxlZ2VkIGNvbmZpZGVudGlhbCBpbmZvcm1hdGlvbiBj
b250YWluZWQgaW4gdGhpcyBlbWFpbCBpcyBpbnRlbmRlZCBmb3IgdXNlIG9ubHkgYnkgdGhlIGFk
ZHJlc3NlZXMgYXMgaW5kaWNhdGVkIGJ5IHRoZSBvcmlnaW5hbCBzZW5kZXIgb2YgdGhpcyBlbWFp
bC4gSWYgeW91IGFyZSBub3QgdGhlIGFkZHJlc3NlZSBpbmRpY2F0ZWQgaW4gdGhpcyBlbWFpbCBv
ciBhcmUgbm90IHJlc3BvbnNpYmxlIGZvciBkZWxpdmVyeSBvZiB0aGUgZW1haWwgdG8gc3VjaCBh
IHBlcnNvbiwgcGxlYXNlIGtpbmRseSByZXBseSB0byB0aGUgc2VuZGVyIGluZGljYXRpbmcgdGhp
cyBmYWN0IGFuZCBkZWxldGUgYWxsIGNvcGllcyBvZiBpdCBmcm9tIHlvdXIgY29tcHV0ZXIgYW5k
IG5ldHdvcmsgc2VydmVyIGltbWVkaWF0ZWx5LiBZb3VyIGNvb3BlcmF0aW9uIGlzIGhpZ2hseSBh
cHByZWNpYXRlZC4gSXQgaXMgYWR2aXNlZCB0aGF0IGFueSB1bmF1dGhvcml6ZWQgdXNlIG9mIGNv
bmZpZGVudGlhbCBpbmZvcm1hdGlvbiBvZiBOdXZvdG9uIGlzIHN0cmljdGx5IHByb2hpYml0ZWQ7
IGFuZCBhbnkgaW5mb3JtYXRpb24gaW4gdGhpcyBlbWFpbCBpcnJlbGV2YW50IHRvIHRoZSBvZmZp
Y2lhbCBidXNpbmVzcyBvZiBOdXZvdG9uIHNoYWxsIGJlIGRlZW1lZCBhcyBuZWl0aGVyIGdpdmVu
IG5vciBlbmRvcnNlZCBieSBOdXZvdG9uLg0K
