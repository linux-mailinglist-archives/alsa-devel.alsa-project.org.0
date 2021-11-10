Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8795C44C45F
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Nov 2021 16:28:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0CD2D1664;
	Wed, 10 Nov 2021 16:28:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0CD2D1664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636558131;
	bh=JfPL/C1sW2Y/lrCgoBdKw2lcFtbK70no6JZSdNLVuGo=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XBMyXGHrD8MYo4ZSrAOCcFDh8zHjsBVWdBuWXNV6dG2hs3KFuPFnhrtnbVTLQsGm+
	 djnUTRRK9enDFYV0dxVj8WDNAd0gErtT8cpvOgcgwg829wUXmW21Lf/SMtjEJkWtmI
	 5EO6zqDKLmdQasr63MaZLct0qYYt2lXFubUwNgog=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C139DF804C1;
	Wed, 10 Nov 2021 16:27:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0408F8049E; Wed, 10 Nov 2021 16:27:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70054.outbound.protection.outlook.com [40.107.7.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0BA0DF80054;
 Wed, 10 Nov 2021 16:27:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0BA0DF80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="S0I8z5w+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=asLgTVHkMoLI5g/zoN9lGqOeWx/E3bRwD3psrz15Y8OQ/OLthXj8ipoQD9MBfUhi91ODVdT229C22qYBwX6jZAHN0aiygcRisIsG+hCTVWWAv/Ug5+A7fSRR42bG8M4LcbrpZ2Y57GT/aptfXF5mf8EXy784C6kVK1Uk25EETDf2f8tJgppHUKQ7aGfUd4CmehiXdOo4ARl2rwHChOR5bskH6HXdftHhcpC5aDZXpjiw1mj7tpMm0VrolcRJCzpPm2ZCqKAtZ/8OGG8QnzR3aQgkGpzSQtu7fKqFlIGNhhS28bg4ZnK+xcuQg63WZruHxcDEuu7YmINzDHR70kYMvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x5eeSTCNSaDL0Yz8AHq65QUqZG92k6jwv73iNBtVjfI=;
 b=Qq1xex+R4JuaS6J9EDPX+N8aNthwSn26ElV+U3taD2OSB9V5BD0QPgDLBg1keH5HFqSa/DIcFhVbVGj9oAhtfNWxgYE4Cl4lWCmG+UWZbJV869QZCCSgjmn1QKBolUsqgsFcDLy3b/uICLJQtwR4jTA+pNgve22adVpUPyf5fMy8BT3JUWWOiAwNJU3usrE9IWjeJTd7zwhiWO6j16tmngtZCAmLY+F51axzApH8gV6KTCqREmyLdG68GRvoYBh5NSM7bNaRK61tX9gW+dVg/i3x5Zak4Y8gppud+mNY5t3rR4N0dWPdmRM7JZMKlCOuiX0ECA8X6ReiUIObfxPltw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x5eeSTCNSaDL0Yz8AHq65QUqZG92k6jwv73iNBtVjfI=;
 b=S0I8z5w+DoROnTP1Bn4jkbFgEOVPjurCfS/DMKrKoBklZDGtS+F+1KhmgXfQb9IGSFt13zfZQruIU5DSX53PdSRmgrY7cx7UiykEVCttnSLSD0wLQZIWyBIHF0IlnYKRy/T8/yAINV8icsIRnYw5Cme0WcwRU1UYvfVnn+stX6Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by VI1PR0401MB2653.eurprd04.prod.outlook.com (2603:10a6:800:57::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Wed, 10 Nov
 2021 15:27:29 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f%3]) with mapi id 15.20.4669.016; Wed, 10 Nov 2021
 15:27:29 +0000
Subject: Re: [PATCH] ASoC: SOF: build compression interface into snd_sof.ko
To: Arnd Bergmann <arnd@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
References: <20211108111132.3800548-1-arnd@kernel.org>
From: Daniel Baluta <daniel.baluta@nxp.com>
Message-ID: <dd1031ba-5867-1392-4fe7-b09ac0d71fa0@nxp.com>
Date: Wed, 10 Nov 2021 17:27:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20211108111132.3800548-1-arnd@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: AM0PR02CA0139.eurprd02.prod.outlook.com
 (2603:10a6:20b:28d::6) To VI1PR04MB5151.eurprd04.prod.outlook.com
 (2603:10a6:803:61::28)
MIME-Version: 1.0
Received: from [IPv6:2a02:2f08:570c:ca00:8fb8:5033:9d1f:8d33]
 (2a02:2f08:570c:ca00:8fb8:5033:9d1f:8d33) by
 AM0PR02CA0139.eurprd02.prod.outlook.com (2603:10a6:20b:28d::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.15 via Frontend Transport; Wed, 10 Nov 2021 15:27:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 803df9a5-8b83-4977-a0b1-08d9a45e9bb4
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2653:
X-Microsoft-Antispam-PRVS: <VI1PR0401MB2653E1ED2D94C5F0E887ECCEF9939@VI1PR0401MB2653.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dZ3XxJA1MDBePYP0lg0Wb3fYtn+dsgJhRZNC/DQcAYnGKk0nGSWIOTdL7Hnx9VvA4pAR2HwGaJE0Z/nZPdxGgmQAFScDMbcC7dKd7bCNmYh8yXgOxJZTRLJQ7BW1VVL4w4bonz7r3xglXm1j+HdFjE2/LKJDd+6hkIKJEskxVet1de8CAPERP+zCyy5c/dwshR+dqrUsBceVLLXI2bwFwalv2u5FMzMQtFu02OejFZhwVTq0FQgq/HzzQk04dfIPgECTz4wRcuJaxZcRWM7XWaJyfv96i0vkrzza87cyZ18diLspRpZo+z5oh7qg7cJsaYdimw3FqyELF12VxaEAfQc60BLR4E0rdt1TGjvGVDRwfa3jl4Mom5+LnlYvnu8HYob1FbS4GJmSrfpS65hovKfJBeLQW5D2HkxyABN3bX6ZE706UixEYBuxm2IiTWGHhT7ZWu97oX/nuua5aQbxPF0iVjmS09erCsZIqSwT3VP7lUQuZj4xztpFqFqpqLecIJubqGBhptZZzzrXNDDhnjGwCgKYr+J8xGak5Ub7LLv8UvNnc9u1FUxR1foujCew6GYfZ0IypeLfwFCbcz7+ULHIi0cEJEcD6BI/iIU3AC3Ub7oLGlJcP+2cH/XuvXc5L3cM9URwE2FmfygNu2AGyeICMV8kJ6W0Tfi1RHTJfZQJIA/CrpYjPHh3Kn2kV+rVUm00IOPU39tUx8qBXb6KVQShnX3DcOGTYQZ3MigtcR4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(110136005)(186003)(54906003)(52116002)(31696002)(53546011)(4326008)(8676002)(5660300002)(2906002)(8936002)(2616005)(316002)(44832011)(66556008)(508600001)(86362001)(38100700002)(36756003)(7416002)(66476007)(66946007)(31686004)(6486002)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SEdDbWQvUVRFRGtvV1VFUXJYSllLTFVtVXVZOFJ3c2NUbS9xTSt0QWRZRTIw?=
 =?utf-8?B?MXFDa09NRmkxeUt2eHZNaE1Fajd4NHZnSXVUbFNqTzIrd3hJVWtTa0lnT3JN?=
 =?utf-8?B?TTBSWi9IaEdZSVlVODVjVmF5TEZmOURhQzR2QUpOSk0vYXhaU1JNbHA0TTBV?=
 =?utf-8?B?eUlWVXVHVFU1OGt1Sk5wdmY1SklEbVZCSGVFd3JVKzNkMVVyeHl5eEdlODVp?=
 =?utf-8?B?T01TUGxXRmxhaUpTYlhseU5tZkRBV2o4WHA2UlVGN3VzMFFCRjhmWmIxWVo1?=
 =?utf-8?B?VGpNWXFLNVQzQTFWRTk2cFNBNHZialU5bmpyTC9xUkZsM0tuaHRVekM0M3Zz?=
 =?utf-8?B?SHZqY3BMMmR5b3BUaGZKT3UveU45c0dhRHkrZEhoSFIzRjMrY3JQSk1GdEdX?=
 =?utf-8?B?Z2RZUG5yNXFFWlB0NzVzUXEzajloVmk1WllHa2c2c0t1WXlRWUJVdUVSZjA0?=
 =?utf-8?B?UUVSZTlhOVVZV1dqVWhXRk9kYzJhV2U5cWwrbmlLblplRkEwWTdycFNlT00w?=
 =?utf-8?B?NFFuRjQvcmtDYVNIM0t1QXFMdVk2MURhb2FhNnkxV3N3ZVptYWdEelFBaHNN?=
 =?utf-8?B?aVFnOWFYT3dpbWgwVk5Uc2Faa2NTaElJb2pBSnp0N3MwMHJTMDc3TDFYQldi?=
 =?utf-8?B?bnZ2R0hHdTNwVWV5aTZ5V3UrR094amlhRHVXTTBaQ2lwNlF2ZEJXWGR5dUZu?=
 =?utf-8?B?SXo5OVRoakN2RFptWWJmVUQ0ODQ3dVZNVy9VY0d6OWVMcC9ON0hUSmpyTm1q?=
 =?utf-8?B?cTZ1RTkzRDRWSEZGdTVDVHROZHY0WVcxZ0xhQ0NwbG5ZY0oxbGs3STRDR01E?=
 =?utf-8?B?SHUwdmt4cDVXcnlCYWxSa0U1dEtmbXBGczY3anJlM3RNU1kzTG5jdlVxcjQr?=
 =?utf-8?B?TzViSlZNUXJ2MmIwVVZnZHBjaFNzck9HMEVVUnJORUQ3OGMyZmUxekx0U1Ex?=
 =?utf-8?B?TlVDTFYwamRwMk15dVhSYWczUGNjcE4reWdRS0x2bWM4S3Z2Ym5JRFQya3lV?=
 =?utf-8?B?ajAwRXU5Q2g4NXhzdkJVTnFERzduNU1qVUw4WE1HR0FVbC9uVUVSeURPMzY1?=
 =?utf-8?B?bHhyWU9weHBNYVh1eThBbU1lWkVwbm83RDh6cW1KaGdrL1graVNESjhHMmpY?=
 =?utf-8?B?Q1IxTm5hekU5MDFqZFZhS3F2cEhNamVkY09TeFc3WjV0OWM1U2VkeW9sU1Bw?=
 =?utf-8?B?eCs4WElYWkpzT09PZ0syT0gvR0FoNXJDSHFpUjUwRTBrVC9CZkMxUHBhajZY?=
 =?utf-8?B?bEVyWDNtZVNrclNnSjMrWStvVjJOTmRDNi9oR0tlZnpPTmFUUHdURkJvaTRE?=
 =?utf-8?B?eGdxRVJaN2dxemU0czFvbkRBZHNPcWU3RlZQVXJuZURYVzlEeTczY3Vva2tN?=
 =?utf-8?B?SU83TzgvZ0pUN0lwczF5UThCVlhCMVcxYm83TDdkcFNISk5nalhrZ1lvejdP?=
 =?utf-8?B?T2ljZFRuQ0pxNEVtZTI2Nk01RHc2Z04yT0xMR2EvNEZ3NE1mSWFaa0NPVFZs?=
 =?utf-8?B?WElXNTVPc1pJNS9BSjFrTzN0MkEwMjRRRWRYYzM2QUJtWG1MSHZYdzkzSnNo?=
 =?utf-8?B?OWNmT0FXamFFV3pBbkFCeHI5SmV4a0JYZFUzME1yQ0piTU9qaGtiRzFEa3pl?=
 =?utf-8?B?dndKSmpod3VCWHRFRzhmOVY1L1U0OGlSSFhoY2VtQy9xRFdDY1ZWZW9WeDN0?=
 =?utf-8?B?WVNkd3JDeGN1cUhPK2lwbUFqcnBSU0lNY1dBaXI3K1NhT3ljMnBXeDhXRTRW?=
 =?utf-8?B?NVpUUlllb0pnbVY2aG93cG8vb2JXN2JzVFpjbjlpUnhCMW1NV0IweXV5WC9m?=
 =?utf-8?B?bDg5aFVNdkNBQnhpSWVVdVVPZUg2ck90Z0lBMlZTczMyeXprMUxKRC9qcWRz?=
 =?utf-8?B?UldUQXUwQVBYT1Y5NFh6NzFSTGd4N0hBQmVuWjRxUXVVeVNwNEhxc1I0OXNm?=
 =?utf-8?B?STFBMDVSOFlaVUFvREhsS2FMWXVtL0JuY2JYNTlmUjYyTXdyTEtKVG1Oblkz?=
 =?utf-8?B?SnFNVUtJa3lHZXdiem4wenpvemw3Z1pOZ1V4dzJxR2Z4T1RtRkc2c3BTZDdT?=
 =?utf-8?B?QnFRYVJMajhhL0hZZUdSR0toRkJBYWJQYjRycGp5YkJrR2J2MTBxMFZWK003?=
 =?utf-8?B?MUF0V1F3RzV5Ti93bS9XNE4yRm1mNUVmMHdoRFpaUmt4Z1VKcTB3aFg2WmlU?=
 =?utf-8?B?WDVPejRMSkZPR3dLOVovMkpIR3NUVjA1Qkt2VFZrc0YyYk11bmFTRDJsMXZB?=
 =?utf-8?Q?gUH/gMN5YhyP4lcSz2SbGm41Zf2aIOKtTdTGY7Wp7A=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 803df9a5-8b83-4977-a0b1-08d9a45e9bb4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2021 15:27:29.8181 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P2MuA5xbO2ebOemjvgHkTSZ7iRwUhfFJs8kUQpkbXM67lmyl0vVwCtcMqTjGbcRMIno8LX1vGO+FUz+SPAhOvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2653
Cc: alsa-devel@alsa-project.org, Arnd Bergmann <arnd@arndb.de>,
 Bud Liviu-Alexandru <budliviu@gmail.com>, Randy Dunlap <rdunlap@infradead.org>,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 Paul Olaru <paul.olaru@oss.nxp.com>, Colin Ian King <colin.king@canonical.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, linux-kernel@vger.kernel.org,
 sound-open-firmware@alsa-project.org
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


On 11/8/21 1:11 PM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> With CONFIG_SND_SOC_SOF_COMPRESS=m, the compression code is
> not built into a the main SOF driver when that is built-in:
>
> x86_64-linux-ld: sound/soc/sof/ipc.o: in function `ipc_stream_message':
> ipc.c:(.text+0x5a2): undefined reference to `snd_sof_compr_fragment_elapsed'
> x86_64-linux-ld: sound/soc/sof/topology.o: in function `sof_dai_load':
> topology.c:(.text+0x32d1): undefined reference to `snd_sof_compr_init_elapsed_work'
> x86_64-linux-ld: topology.c:(.text+0x32e1): undefined reference to `snd_sof_compr_init_elapsed_work'
>
> Make this a 'bool' symbol so it just decides whether the
> code gets built at all.
>
> Fixes: 858f7a5c45ca ("ASoC: SOF: Introduce fragment elapsed notification API")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Indeed this is a bug and must be fixed. Thanks Arnd!

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

> ---
>   sound/soc/sof/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/sound/soc/sof/Kconfig b/sound/soc/sof/Kconfig
> index 6bb4db87af03..041c54639c4d 100644
> --- a/sound/soc/sof/Kconfig
> +++ b/sound/soc/sof/Kconfig
> @@ -47,7 +47,7 @@ config SND_SOC_SOF_OF
>   	  Say Y if you need this option. If unsure select "N".
>   
>   config SND_SOC_SOF_COMPRESS
> -	tristate
> +	bool
>   	select SND_SOC_COMPRESS
>   
>   config SND_SOC_SOF_DEBUG_PROBES
