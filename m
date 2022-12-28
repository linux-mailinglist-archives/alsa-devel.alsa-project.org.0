Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FBE657466
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Dec 2022 10:00:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F01048B2E;
	Wed, 28 Dec 2022 09:59:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F01048B2E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672218004;
	bh=miZN10xcuhtdxmkPdFVy4r0csGso1TwlVqGEmLPnq04=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=OdR9QM/IlD2XDgyD7CeZNJQmKK57Aimv++YQz4UMeS7l0vyl2xVyAQJ/zet7UAyvT
	 N2FfstfFzzI7ek77suFJktTsqbfubLMyLlsLHcuoezU9hNkibmYhIK7qGOvyL1PnHB
	 LYSHwNfVPLL/r6Oodv7qnZbO56gpYnJRkiuNRkMk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08F8EF80310;
	Wed, 28 Dec 2022 09:59:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0A5CEF80424; Wed, 28 Dec 2022 09:59:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2047.outbound.protection.outlook.com [40.107.13.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 45DBCF8023B
 for <alsa-devel@alsa-project.org>; Wed, 28 Dec 2022 09:59:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45DBCF8023B
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256
 header.s=selector1 header.b=p99JQK2m
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SOYjrXEf9RtRlngfcpWfDSzFyfTpSSzhGhrQJ1A73mBWK3z1ZpS8tboeS3XlW3XhR+cSlc0/TY6wzJb2WK1jSR+t9CCBe23HHZV09lhjc/w5ph9WuW9PfhAtJD8fiNvdsBJkTup66323IuaZN/KQJQ0Vopovhuc4Bhwyjrc7oIdbj5B6lU6fd5gXURmxYrEuivpd89uY8RxHqufED01poBde0KKh8zn/fOoCEP14Q/OsSp9zsuB4nYRw6ZwFToLsVZOwveSWDIP6bS4+EPf41Lik4mWK3bAT3/DSoCcAoSFmYMYTEKwLNGujj8u6BXgiBdT8NP3uoUAqOSNxmMrWjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B2XwEXv/CYCGjCHZLMDZZ5mJaIHnmTEDin/uIFEcxxs=;
 b=ieNaBuxOV1LQ+hdJY8bPGmkmC2BskzR5qWs2m+cF6TmoKmpz58jpRRz57Qbp7gWUZgl/ElnAN3YKNYYWwVXk9ZthqK37Wdw6ESlFLkSVkuCo8pys1UM5PGlfjtnA0789o4llL75oXBUCph53JZ9LbfNWXDlDsIv9r6xHtzhiPhcrLiU0L6mnluvdQnjVKLeuwfNS7/zculsjjwcpOta417viMIx2cTSrAR2efvgoxcazZ+8wU5pgzgk8vLycOSKxfECaUv7/Z+1a22I5BRbN0p1eyCn7jdUnKY3KZxjv37FnGwFctVIXW0VBlLUyp5aK0+UeNoF6M1FZS7Kyukm/Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B2XwEXv/CYCGjCHZLMDZZ5mJaIHnmTEDin/uIFEcxxs=;
 b=p99JQK2mCU65YnUnM+IhAuxu72QMEfFE4LDG/6I3UoWmnPlfG8FIB7lhmoRvegAuPqWyaeeicmtoh1Of0nfowixXRZ5XULjSeTzpJIWMfc7Wb3I83cHXNzrPOVNIdGyl7CuDrpQtbDqlpSuIOJCg+dCneuxZmG+aH4jixa4NMVtCkmBYNAjSw9Rt1jNkbBAaTFA7EnxkqjNPCQ2oxZjADs1uxBo3yjuA7HcCw+RuzStBCu3MnAlToqGQEPp+M5TntVMpXstnOQOAF7/V0Ct876tHnPDjSCdBXzv5Ju6vTIhDxZ2ehSH+16L2KMi1P0/jO1BnaKHdwMw9BkVlnASyKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com (2603:10a6:800:126::9)
 by DBBPR04MB7754.eurprd04.prod.outlook.com (2603:10a6:10:1ee::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.16; Wed, 28 Dec
 2022 08:59:06 +0000
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::8d51:14ac:adfd:2d9b]) by VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::8d51:14ac:adfd:2d9b%5]) with mapi id 15.20.5944.016; Wed, 28 Dec 2022
 08:59:06 +0000
Message-ID: <bf1011a8-c746-c465-f161-f0293409d922@suse.com>
Date: Wed, 28 Dec 2022 09:59:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [RFC PATCH 06/14] usb: core: hcd: Introduce USB HCD APIs for
 interrupter management
Content-Language: en-US
To: Wesley Cheng <quic_wcheng@quicinc.com>,
 Alan Stern <stern@rowland.harvard.edu>
References: <20221223233200.26089-1-quic_wcheng@quicinc.com>
 <20221223233200.26089-7-quic_wcheng@quicinc.com>
 <Y6ca8IKLK9g497Qv@rowland.harvard.edu>
 <e1203849-01b4-b196-36f3-76d58dd7c724@quicinc.com>
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <e1203849-01b4-b196-36f3-76d58dd7c724@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0209.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::8) To VI1PR04MB7104.eurprd04.prod.outlook.com
 (2603:10a6:800:126::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7104:EE_|DBBPR04MB7754:EE_
X-MS-Office365-Filtering-Correlation-Id: 6024c3a4-2fdd-440f-cf5d-08dae8b1c5f9
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yZ23L6r3HybdPVHODqtVu7JUUh7ZlYXYYljAGiQioK9Oq9lcC9gxCQvwf4mVLwr47hk2YG2h55UagkqSiN442cOKM8Ar6yQ+WZGJeecR+IQom1Vb0xiTnThWM7tTNu1LqOniM2O1gmhxhpeIXWzKqU8io8LlwfmcVLhTIzpb7oE2TtYVoHvpozfCxjiMa9UF7zdQFKsWMX1gfM1rDkM/qhYusX2i2LQJNd8PvThLDjU5CgXeuEhI7WUWK6hiNHa7V4zGE9Y+InoNKnXwN32BqHTIKw/LHXeav8c1MNfBNBUELW9byAbbpjzFpLXUejh+WZEkfBuLtCyUZeUOh+BjuWP4vc8O5yoKtcmT/hiiVIFfEZhA7vnN7e/K3g40HcVFytO8K1KlufbW66zQ6I8U3NIHU9oj/dGVtLtfSnd2KpSANhHXeorl8BD5prrgXcp0Q/N+bp5nXx/7Wm9evXyNodgrQDm6jRuyPAWMcbBx1mzdY1O5zSA8vgV5nzkrkb4ZKBelFYC3UZtPD3EyuhS/iVkXMpKTg/AaxbA+B7AKaGx9TAR8wO0uur/MCbmYDlFQdJE+YmoLSjxVeTUxNHXe0OYsty4BIBTfK+hx1Aww57mMA45x0bcT5Dw4LHBJWDP4TySop1b8H5F5dVQiuOl3KKrdBF+vzPs8LOWqeS2dWbyKpipUn75F67QmqRIR32EXk+qlgZvrY1n3HV2FcHSMBpX24Ao3mU/2SRi9PaFL6jQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB7104.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(346002)(39860400002)(366004)(396003)(376002)(451199015)(6486002)(478600001)(316002)(186003)(110136005)(2906002)(36756003)(6506007)(38100700002)(6666004)(31696002)(53546011)(86362001)(2616005)(6512007)(4744005)(31686004)(7416002)(5660300002)(8676002)(66946007)(8936002)(4326008)(66556008)(66476007)(41300700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K3JKSUxHRGRhWGdEZ0praFFybHRYTnowbyt1SzZQUldxNkhTTVl2Q3haYTVo?=
 =?utf-8?B?NDdEZXFjUjV5ek16NUFzZW93YjBTT21sdHE2d09QZTcxYkxtNit5WXFkd2NS?=
 =?utf-8?B?Q1VlVHZBUzkwZ2dYV0tlWktpZjdCaXFuOGZHYVFHSmxBQkR6dGV6VUl6Vzl0?=
 =?utf-8?B?R2REalpsL2pQMVBVbG16aGFrMUc5OE9lRGFacEloekVCQ3lzend6ZnUzV3lj?=
 =?utf-8?B?MXRaenF6OHQxaHA3KzJySlVWRVNVbXp0aHlIeC8wM2NTSnFob2g1bWdsRDdB?=
 =?utf-8?B?RWhIME1jLzg1djdFbzBGb0JESHNDejV4NDNicmw1K096dnVyWU5tTU1UK3Yw?=
 =?utf-8?B?ZCt5VzZ1M3VhVHJtd3FRbXBSdGo3Zk9kZVV1R3JZelNSbUs3VE9YV3lhU0J1?=
 =?utf-8?B?NEZZelJzODBhV1VkNFVHNVp6c0tLUVhoa3RQaDVwTDhTTFIrd3V5ZzZIcytH?=
 =?utf-8?B?a29BcUV6bS9RNm5CWGJLMTNKM1FyTEplQ2dwTnlRL0JJeEZDSHFWOHNQb2xL?=
 =?utf-8?B?Q3g0YVB6TmRDZ1h2eHVlcU1NTFJqSXlhQ1lJVHQxZkhmQ3pITG92Q1pkMXp6?=
 =?utf-8?B?dGR4UExzcU1aNTVkVlNTK3ZwckM2YlpvT1poaEZSOHdQemNVdVhPMGp6Wk4z?=
 =?utf-8?B?RCtIWXlXVTNJTUlpdXBpcFRLNS9ncUR3RW1GVUJHa2gvaG40MjAzQTBJN2Vx?=
 =?utf-8?B?dTMxcEFBMis3b0xad3BhWG5UYVdYclBTMnN2a2xOZ0ZndS9Ca09scW1XdEtD?=
 =?utf-8?B?NnltUFZySGJvbzEzRTFqcm1WZjZKZG0xQnZ6cUFvWStETHIwRFlJU3JaKysy?=
 =?utf-8?B?WnVrN3AxQ1RsUTA5RVEvREdQNDREcWJoL1VqQWdhbHdoZG9Kb2YyVG4rMXgx?=
 =?utf-8?B?NzVrYnVTRHI1c3FxS2hkOW5JbjFkNElaR2h3ZWo0VUdvcnNoUW1uV3N3Yk5U?=
 =?utf-8?B?NXIxMWR3U3ZRUnV3UEZvbTRlRXl5cW84ZURLR21TS3lsK1pXa0hRRzNUclJZ?=
 =?utf-8?B?cmNSMndMNzdwdmxWaXhZb3krdmZad2g2U29ETythY2hQUVBhSUl0VFg4c0dr?=
 =?utf-8?B?S2xVNm1sdS9ZMjJJYVVpN2pMRnV4amRuWm9mR29TRUtvSUJpbWZDVi9rTDBH?=
 =?utf-8?B?by9vQUVjSC9jeUdzd0lWL3AxSEo4aFNOVVFUT2xxWEZsWjU5ZSswV0NwQWJ6?=
 =?utf-8?B?U2ZwS2lBWldBT04weHFha2prVE0rQ0xtRVRKc1owdHI3QnQ0RGRDUWdvWmZr?=
 =?utf-8?B?Ri9RYzdacHdrRlc5Y05RRHNQdkRWaUpRZnFES0Y3WVVKd3dvQ04rTU16UUk0?=
 =?utf-8?B?VS82WWM2SWUyUkhzdlMrQXRyVmNsTjJlT28wdmhZY05tUEwxNUdLMDVlMVEy?=
 =?utf-8?B?cVgrNzBhUzVlVUZYTXJFVDI1ejJBODRENlJZTGhYZWxJdExvS3ljQUQxVWU4?=
 =?utf-8?B?SkJZQjhoR3BUWGpndyttK25xVEZVaTVtVlNkSUNCaXBNcGFsckNaMVFGUUth?=
 =?utf-8?B?K251UkNRYVNOZXRJM28wQUNpcVRBZGNIZzNXNjEwZnVwWWRXUDBOQkw2UGxq?=
 =?utf-8?B?dVM0Qk5XVno1eDVFamFoRUh2UGNaL0FLOHVvKzdqRS9mOTRiY1g1VWh4REFt?=
 =?utf-8?B?cDhwaWFPdUpxOVBpd2pMMlZ1Y2NvTGFBZVlrN282dk1YMUtjMnVjS3l4dDN4?=
 =?utf-8?B?V0w0YS9sb09tcDlZL2pldTNSY2lMWW1RK0cwSVA0dEx4eTg5Yzg4SVMzVVQ2?=
 =?utf-8?B?c3lWMm4wTWpySUJGMU9qTHhRWStRQlh6cVdsNXJmelZmQjVEMXBnbmdNcDBJ?=
 =?utf-8?B?RWxTTTZXOHJMVmdLaDhWQ0p4TmZEWEtMMnZtcGdyV2RHbldDdG9EdklBZ0la?=
 =?utf-8?B?ZU9HQ2dwMEoyQ0Z4NmxOZnkwNXFzcnFJNGh4RVhDeUlqVkc1SHVGRUZLVGVt?=
 =?utf-8?B?dmRJdklVRmFwMGhFdkdWMTgyeFRFUkF4ZWN1b1RzQ2NkWXFCd0JKR0tPdVdn?=
 =?utf-8?B?WVNMSVFXY29NTXRaOFpxdXQ4ODJ0YXpaSUZmeWdBbnYyMkt1c1NUcXFYeEMz?=
 =?utf-8?B?cFRSSVBJUlg4dCtrazdSK1pQbWsyRkFJbFRienVBOEJWSktrL0o5cVBONmtk?=
 =?utf-8?B?M2RML2pEZjl6VEwwU1pTNUx2NjNQR09NU2drRStoR3BENnRWeWk0MVRvdWNM?=
 =?utf-8?Q?jDNBANYoj/HV6S5tgXDSsFw7vtPbZh85mpb3CytNt1YW?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6024c3a4-2fdd-440f-cf5d-08dae8b1c5f9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7104.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2022 08:59:05.7809 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7THR7gdtjisBk17hIH9T4VtfN8AbN62zAb9R7+4e5faDDjtwZZ+HNNx+Gw6G+Rc4C4ccX5irKr4guheA3p9zjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7754
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-usb@vger.kernel.org, bgoswami@quicinc.com,
 mathias.nyman@intel.com, gregkh@linuxfoundation.org, andersson@kernel.org,
 tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, agross@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, Thinh.Nguyen@synopsys.com,
 quic_plai@quicinc.com, linux-kernel@vger.kernel.org, quic_jackp@quicinc.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 27.12.22 22:07, Wesley Cheng wrote:

> 
> Hmmm...maybe I should change the name of the API then to avoid the confusion.  Yes, usb_hcd_flush_endpoint() does ensure that URBs submitted to the EP are stopped.  However, with this offloading concept, we aren't actually submitting URBs from the main processor, so the ep->urb_list will be empty.
> 
> This means the usb_hcd_flush_endpoint() API won't actually do anything.  What we need is to ensure that we send a XHCI stop ep command to the controller.

That is a concept specific to XHCI, yet you are adding a generic
API. The namin should reflect that. usb_quiesce_endpoint() ?

	Regards
		Oliver
