Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 026896B2285
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Mar 2023 12:18:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C05C71738;
	Thu,  9 Mar 2023 12:17:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C05C71738
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678360689;
	bh=jxx24YCz56bVdx/YeHhfE0pqo04bUVgMmuJ1dNFF/jg=;
	h=Date:Subject:To:References:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=R5lgOD35gTf84o0tEhxCqfFZoDsIsBofoDbMmhyOzp48zyYucU52/cIhXMplidWlF
	 GgyxZm8TeQSEq9wVpPmiWaQD+l2GgPl66np4yg/AHNWeydod4bKEBOPEbuT80H5xZW
	 b4udzDKlKSLvRsPI3spyXVWq0ktj5ozgI8FycQ34=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ADD02F8007E;
	Thu,  9 Mar 2023 12:17:17 +0100 (CET)
Date: Thu, 9 Mar 2023 12:16:59 +0100
Subject: Re: [PATCH v3 09/28] sound: usb: card: Introduce USB SND platform op
 callbacks
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, broonie@kernel.org,
 lgirdwood@gmail.com, krzysztof.kozlowski+dt@linaro.org, agross@kernel.org,
 Thinh.Nguyen@synopsys.com, bgoswami@quicinc.com, andersson@kernel.org,
 robh+dt@kernel.org, gregkh@linuxfoundation.org, tiwai@suse.com
References: <20230308235751.495-1-quic_wcheng@quicinc.com>
 <20230308235751.495-10-quic_wcheng@quicinc.com>
In-Reply-To: <20230308235751.495-10-quic_wcheng@quicinc.com>
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DUUZZMHPUXI3NEB2YHY6E2FHVBWUVOYC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <167836063576.26.1706602458146226034@mailman-core.alsa-project.org>
From: Oliver Neukum via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Oliver Neukum <oneukum@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, quic_jackp@quicinc.com, quic_plai@quicinc.com
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 46F91F8042F; Thu,  9 Mar 2023 12:17:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2061d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7d00::61d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 22B39F8007E
	for <alsa-devel@alsa-project.org>; Thu,  9 Mar 2023 12:17:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22B39F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256
 header.s=selector1 header.b=P4c3Ihfv
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UGXM4UwE9NuXqS50hm5bCyeEQyPQfp9Ye9Ua6gBydE7YkqbdG+LG3iKXtPFCOp4pdTkRuarDLIGtFc0GsBUVuQwUcebG7kes14B3wOT4Wk4QNBwGXO1DwxLWxJbLxU+dmZSBauIX0CTI8L7hGnLq+HlbVAv3mZBFdk/wUXqN4TaFyEHAbImzhfc/Wot/4NfL5t3hVFLE3z/pxryd7IrUZ5uqLbwR3+9ii53UYxqA8cChEfLj8ePgqZoKx/BMnBD/DTDH9i9rFDy5Dv5BAdNf4jRQnDWyBs35eGqjfhAq9A2AzvqtiQzB6rLgzx7ZgZoZYgCjtaJzmmn1MG6w4RwyLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IbnTqDAldfxjb2ED4TbQR3xSpxLMM2d4AMWoS1iI1rE=;
 b=J+7/GRiMVL0FdFd78iFSAOWy7RqGMwfcuMio9vAADofsqCwUzW/4K+0NHX10bjBnOE9ipQNpNbeXoxkrVIBXhTwDFbbaLmNrTyKRMW1RBfqetFYVYjmerL4DWqTmpgb02HVJBOSODFApmF9v9iJ2kV/xmU0QD6GEyNHWJW2/bFjPQAvHo11ogK0FPdvxqjPZyea2ENPeHDaJVEbKBlkvJ9GhoG/KUV8DtsxSFthvPuUNYK+/zvojgYVwa4Ujzl7h73Mgotoj1wh9rDURCAyaWvULekuo0faRILwNGImngyRHpik/jwZCK8phpIsFFWonx4+teDpiUu6oxCLJldP/2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IbnTqDAldfxjb2ED4TbQR3xSpxLMM2d4AMWoS1iI1rE=;
 b=P4c3IhfvTFWjDs/G8zcxIZxpqJ4/knG239YxaWncn7cil1mmDMvmOvp06jh/T7lctR7Bv8kpi+YzcHvgPA+P2xoGGFQc+OUaZ9KVj8mzbWBZyO9UXIN7JRxJfDlzSvFYpA1wD9HEs+27yKzRZcCWB4o0NTmmlbybWRFt6ysgw5fmNDQXh8foycYzX+iLuopWj/f5luy6L6leNnarB1CAxk1YdPh54aT0qXzBrcqMErg2EstxhBwsedMC3mGMgm3kPlTW79Oj+KscA/RE223hIEKJxm5seHKkXyDLbiydtZtuXidYeJ5Bu4ypUOMeJabDG9udKkGAwLJ0Y134JTMTCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com (2603:10a6:800:126::9)
 by AS8PR04MB8053.eurprd04.prod.outlook.com (2603:10a6:20b:2ad::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Thu, 9 Mar
 2023 11:17:03 +0000
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com ([fe80::2ea:4a86:9ab7])
 by VI1PR04MB7104.eurprd04.prod.outlook.com ([fe80::2ea:4a86:9ab7%3]) with
 mapi id 15.20.6178.019; Thu, 9 Mar 2023 11:17:03 +0000
Message-ID: <c5103e6c-a7b5-d100-c731-7502fd34dbed@suse.com>
Date: Thu, 9 Mar 2023 12:16:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 09/28] sound: usb: card: Introduce USB SND platform op
 callbacks
Content-Language: en-US
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, broonie@kernel.org,
 lgirdwood@gmail.com, krzysztof.kozlowski+dt@linaro.org, agross@kernel.org,
 Thinh.Nguyen@synopsys.com, bgoswami@quicinc.com, andersson@kernel.org,
 robh+dt@kernel.org, gregkh@linuxfoundation.org, tiwai@suse.com
References: <20230308235751.495-1-quic_wcheng@quicinc.com>
 <20230308235751.495-10-quic_wcheng@quicinc.com>
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20230308235751.495-10-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0079.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::7) To VI1PR04MB7104.eurprd04.prod.outlook.com
 (2603:10a6:800:126::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7104:EE_|AS8PR04MB8053:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dc0a7e5-b7c9-4c96-5c64-08db208fcf1e
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NjKXz7PFvw+ewuofKQrv7kpO+6YxG1cTLyRe+u9X607L0A25xqDXipoibEtZa88ejlcBUJdGnJNgJul1CFrgjxWisxeYWbJTdyMudrWruf1IeFdzuJ1rpDw7s9WjfS/UVFQMcdkVZ0nJG5zcZfKKCC9Xkh2qAKYJd/kL0uxDu3bK/HEy6bwDN4YWgHiZtR222T+AQEQhzuvbUHMicPi2n6jRezPiqVdqB9JWfPgAEJejwtZi9M+9pjYHwwCF3eN+YcR0ABv8/ijjCvEuwxRNAFhRjGVIZ1pEt/lTnkYNtRwUhOlg3Ew2b0eeLTKlg9C/ZE7aDSa0EpJZGcqEAyAh7uccvH1jFU3VuK5SfB6Y0mAli92N/vRDmWesbQG+Z5SCaBsJ3b70O4QxqagZvXqmMERExcWejLToz5B4c7p6T6ubNh/E90sBKhQxtr+rWZRY1p7JPVm1LYnh0HTraWi+nRHkaC3rE7Hv22o3vwl0HLJbkxtk9Op5AjrlysmvC/R+7QLCnkxOZh15/YZ/ANM3EqjUHBYL7ucmKZBt7WJt/1VoUTTHr4x0kVK5RobAZ8E9Q8milpq4Gr2se8vbrmbM/pOWItbzLcm9uNmaqVZ/eObtEtCndYjpSMQULWD/QvnYydVoTskphwYyDacbTlrAUPjWrUowHEaYkPj220h5axqPdeshugMBgC2UITm5zHEuolVhwiYKUCLBUSlqcs/FWFbmzghvqC0PPY3jLpNgPAFqjllTf4PrrWM+wyrsnPKO
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7104.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(396003)(366004)(346002)(39860400002)(136003)(451199018)(8936002)(36756003)(7416002)(5660300002)(921005)(8676002)(53546011)(6506007)(6512007)(38100700002)(6666004)(83380400001)(186003)(2616005)(6636002)(86362001)(316002)(31696002)(41300700001)(4326008)(66476007)(66556008)(6486002)(478600001)(31686004)(66946007)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bDhuS1k4RFY5cFFrcldyT0RubFM0S2JRNmhBUmFlYlhyeXZmb1VOU2JYdVJu?=
 =?utf-8?B?TjlLVStMOFhoZmtGOS9vZTBLdXZ2S0xTZ1RRcnU4MmJOUnpxRktPZGN1NzUv?=
 =?utf-8?B?K3hKbVBCOEovalNBeW5sdDVHTEg2bmR3MXZMdm9rdXNvU05lY2dpQVp2RTBV?=
 =?utf-8?B?bkRiNHA2MERPUEVadmFZbTdlc3VYZnM0NUFuZHRpc0ZOREpUb25rNFdLV1hO?=
 =?utf-8?B?SVRGVmhRZGtPblBYQjdLVENhdlp1dkdTbkVlUWFZUkRONGZDUnI4N0J3RG1X?=
 =?utf-8?B?U1VBSklpa0dkK0tVZHJrMFo4OU5OQjZGNjVZd3lSTmxxeVRGTmluVjBvTXEr?=
 =?utf-8?B?N3hITGVmTXowbXZMZklDek9FZktiUVFVMVYxNDJSakk4MWlYdDFMeFlaVHZk?=
 =?utf-8?B?UFdpMGsrNEx0UXFHY2VnejNLcjFlTk5Od2VPRWZRWU9tN1cwVXkrQit5SnY5?=
 =?utf-8?B?NXdaZnlKYk82ZFo3eTlJRFF2T2FBZEZuNlBsR2R1NDJNZFg4SncyYnZQWHN6?=
 =?utf-8?B?a1FpeTAvUlFQWEI5U0NmS0FMYlQ3ZzRsekhRK3E0WkwyU0NjOU5qZncvYlZI?=
 =?utf-8?B?NWcwdEhXU1ZuRWQ1VWpjRmduUTBaaDdwaFFRcElvOUFGLzZYbzFDS0l2Ly9R?=
 =?utf-8?B?eHJpOGkyaEV6QWsxWnNBcHNWa29saVRVUFV5SGdmVnVla3VxZlROenlwdy80?=
 =?utf-8?B?dkU0cTZ6Z0QxNEJuUHg0Zk9NUjVWWHZmLzYvc0xjMVAzSTVxNDY0V09BMS9K?=
 =?utf-8?B?UENqZHYxRlMzVjl3WTlKZTh2UlQ3aW1ZRGxQRis1VFd2eUx6VGtDUkhiaXhZ?=
 =?utf-8?B?bGlsQ2UxVENSaXMyRHdrbHgxN1ZkM0pwU0hxQjZKOFl3UkFjdVBxVW1JVnFJ?=
 =?utf-8?B?ZWV5VVJaR3JDb3NOZDRMQlQrUnlaUzVCZzk5Z2tDOGpaZlZsWGdENWF2S255?=
 =?utf-8?B?VlN0SFp3VmtwajRiRmlHL3FMRTFmdFlCT0d0U3dEektpQWFYQUVtSlJ5WXNw?=
 =?utf-8?B?bm5UMDRpWjk3MU1rZys0VGY3TDZRT3c0Y0tWTTd5SjQ5a1pQL1BrWVM4N3d3?=
 =?utf-8?B?Ti9rVHNlamxvdk85WnoyRlcvTkcvZ3dkS1lYZjQ1aGpJOEQ5UnZSc2lBMFlZ?=
 =?utf-8?B?NzI5Ukc5N2kvZk92NGZNQ0pPUmRqSVpLSHFPM3NINnBzd1FWZU5jaUlvU21a?=
 =?utf-8?B?Wkk4azlSUzVQNStKelBLMmt6alg0cjdidWlDTFJvMmhNWUtHUkNQVVVlaURB?=
 =?utf-8?B?WnRyNmpZeko5bmZ5cDNOMkVuOFFGSnZxaTdIV0EyQ0kxbmlpcG5mWDcxTnRP?=
 =?utf-8?B?U3MydDhVODdJSHR1cVJYZTUveXg5V2hLVUlIL1Y2a3VTUkpuTHYyVE4xRTNv?=
 =?utf-8?B?WmVxTzh1RTdSR2pXRGVhZitLMzU1RWpJQzEvY1VXd1gvU1ZpQWxRZWJkVDdt?=
 =?utf-8?B?MW1rc0o1ZW5FaGhuNnNNbFZleUZYb0d3bFpaRzhBSytkT2RsL2pxMnR3Zy9a?=
 =?utf-8?B?bFluaFFOQll3bWR1TkNxRlAvTWZwLzhqLzcvMXZtTVNLT29ZQWpyVDVNRHJW?=
 =?utf-8?B?cVN2TU9sbG1iL205V0t0Qnk2MEl3c2RrM0xndmdWTW02R3hmQllQbVRZRTZN?=
 =?utf-8?B?WkhwVmxVZmxUeTRzQTBLYWFuMWJlQWR4aHMxaWVLSkNoVndDLy9BRTdMTndH?=
 =?utf-8?B?MXI0V0dWS2hQY1RKclZNamlvTkpoV3hRcFNDV29oeG1POFlTNEhnR1NDKzNr?=
 =?utf-8?B?QU5LZ21WUDZEUDBDNmhKTlBhSllLSGM1VkpTcThFVE9jYVVOYXVpOVVpRUJn?=
 =?utf-8?B?K3dXQkZpeWdhWWJjVUIrR3A4UFc1KzZCT3NWazEzQTRwR0VkZDJBNUh5SnhE?=
 =?utf-8?B?TTIySkdIZktQT05peXZQM0JOcUgreFkwYWpCOWYwRFZpZG4vRHlDZ25CNnli?=
 =?utf-8?B?RDQvZlpOSGlJbmhsdFJDS2M2YjNJRzVJNmc1Uy92YWlFQ1p3T0t0R2RqQnBs?=
 =?utf-8?B?VXBBUHkzakFHNG4xTnZ2OGp0VGVsMFlubnh5SFFMNFE0YUs0SDl1RjFXZVRY?=
 =?utf-8?B?TWJyWUpSUEJQWFlTd2Z3QXBEeFhBTUJxaThJY0RObGZRWm1VMjJmU0ZaRGZP?=
 =?utf-8?B?d3hycE9teEJHdmlFbG5nQ3N5RUY4RThvMER5aEhCZktrNVpFYzNSWkliOEpm?=
 =?utf-8?Q?KPoVIJwNu3SlTnfcQMIEMOSYYjNjwk4zY5EZRYnprJEo?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6dc0a7e5-b7c9-4c96-5c64-08db208fcf1e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7104.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2023 11:17:03.2529
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 xPgawBiwaXjZ4bVhBb76JGhVtpLC2YXMYq1MJaPpuWxa4A6mV5CKpePy7Jnxme7/ECO9+RopJeMjmYsofn84iQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8053
Message-ID-Hash: DUUZZMHPUXI3NEB2YHY6E2FHVBWUVOYC
X-Message-ID-Hash: DUUZZMHPUXI3NEB2YHY6E2FHVBWUVOYC
X-MailFrom: ONeukum@suse.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, quic_jackp@quicinc.com, quic_plai@quicinc.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DUUZZMHPUXI3NEB2YHY6E2FHVBWUVOYC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 09.03.23 00:57, Wesley Cheng wrote:
> Allow for different platforms to be notified on USB SND connect/disconnect
> seqeunces.  This allows for platform USB SND modules to properly initialize
> and populate internal structures with references to the USB SND chip
> device.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>   sound/usb/card.c | 36 ++++++++++++++++++++++++++++++++++++
>   sound/usb/card.h | 20 ++++++++++++++++++++
>   2 files changed, 56 insertions(+)
> 
> diff --git a/sound/usb/card.c b/sound/usb/card.c
> index 26268ffb8274..9bcbaa0c0a55 100644
> --- a/sound/usb/card.c
> +++ b/sound/usb/card.c
> @@ -117,6 +117,30 @@ MODULE_PARM_DESC(skip_validation, "Skip unit descriptor validation (default: no)
>   static DEFINE_MUTEX(register_mutex);
>   static struct snd_usb_audio *usb_chip[SNDRV_CARDS];
>   static struct usb_driver usb_audio_driver;
> +static struct snd_usb_platform_ops *platform_ops;
> +
> +int snd_usb_register_platform_ops(struct snd_usb_platform_ops *ops)
> +{
> +	if (platform_ops)
> +		return -EEXIST;
> +
> +	mutex_lock(&register_mutex);
> +	platform_ops = ops;
> +	mutex_unlock(&register_mutex);

This looks _highly_ suspicious.
Why does the assignment need a lock, but the check does not?

	Regards
		Oliver
