Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 016D949DBA3
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jan 2022 08:31:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A61461B50;
	Thu, 27 Jan 2022 08:30:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A61461B50
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643268685;
	bh=GcfeZU6W6cyXQAbzt490qbSts96L/VxF2e2ryk8t2cI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ggWXkoCc3R+Ijo1lKq8Rot7xOvqTluAQ1hgcjaVVfC1ICqAA++3x2XpbtyvuvdWnW
	 7crDGh+1oMhLinR5pXYLfz10sMQiQUy90HPXo9ChBHQ/uZYRakg/6Z6We0VwVssU2Y
	 icv9n9D+YrT+f9BLHNhCND6cJxA4BJMxvI5gU0Og=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B9B4F80508;
	Thu, 27 Jan 2022 08:30:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 45BEFF8047B; Thu, 27 Jan 2022 08:30:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060.outbound.protection.outlook.com [40.107.94.60])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B210EF804D9
 for <alsa-devel@alsa-project.org>; Thu, 27 Jan 2022 08:30:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B210EF804D9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="myG/QBwY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TFj952tquVBsZAJ7x7Asx1p9kKQwJZ2KAKEwSo6m+mW8EU0Id6suqxcRGHp2IF5MFQwuKe2SbjxhY8a03IFySLFTcwO40UqkveKI5Ad6gBmbpxl33+CSg74MsyU1g6K8/9B5hIovh6FD0XyuHBEScsz/Q5gfir+kbPGTxiSF/aXsV+fjpagh8y45m7WLvTGqXC+huZ0wvGD8DTouzsrm1Bj26PXeMVyQyorzz8qzTwVGcffN/b4j4rB2be8rUZuOqFD4WMggN2h7c1CsLBrsrguK7btBEiRjjACosDG0CmVQFSHGtuys6OCcxkbiCGXxwIKcerVnpGIHvBlzUsWdcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h45H5Qif7Wn+tyWb/jus0b9JEQArU9dnLojcVKksACo=;
 b=VW/i4OmwPgKQ7xFbarqvPnFc1hUZnRKSfnlHNITQy3jnfnxKixuESL96kgVfUhujVm724dTHbPqW2onQtWsdZgbFzn/VXkPpwQZy/pPj/Utfj/E3VQkU7Qyz2lDxB5cHrOpViuqADqKi77SUe1MDX8aM3YXlskZwB6bF627eRZcLZdEtRgMGkDwKKSDnnO48pnaOUgSXJ7sedX+xrohf+G6ebF8DwgnhFjcwqqJofszox80HCRG2MTvAMDl//deXWKbZ1LCtAEukkqk4Me9pxEMeb+jjdI+iD3WWd3ZvaJaykpCT+3ptIzSaHWahOK1njTqvUYRNUsWN9G/YH5FI3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h45H5Qif7Wn+tyWb/jus0b9JEQArU9dnLojcVKksACo=;
 b=myG/QBwY9KmCZHzyLXZBE2ovLSyUNm0yiJnS5ftf4EOM1DgcVVoqwK/XdK21Z1jf1AgC7f1+FVStk+Vy+EN8eMpS2OLfQDEmLlAzpjNrm64xsA9KEwx9uVRyZB2l8K3URDnZl0Ye9H9afOn+f6Rl+O1fFekegfMyQ0JPgwKfHnsXutOMQCn/kaLb3Fhoeq4U3HR5uerVmOFUkZvApxrx4/rJVEn8v1G4T1fxsJaTTrh2yfWl0ObNOaera1sUhuKZWrr+dHg1KwdeEzNL2U08lSMhOstaSsSbHr/a91p9pAInbVVnfNsjdQQZowdfE8fM9c0noVHXu1g8fS7vM4u81Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY4PR12MB1576.namprd12.prod.outlook.com (2603:10b6:910:10::9)
 by DM6PR12MB2617.namprd12.prod.outlook.com (2603:10b6:5:4a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Thu, 27 Jan
 2022 07:29:56 +0000
Received: from CY4PR12MB1576.namprd12.prod.outlook.com
 ([fe80::24b0:46e7:d3c0:a77b]) by CY4PR12MB1576.namprd12.prod.outlook.com
 ([fe80::24b0:46e7:d3c0:a77b%7]) with mapi id 15.20.4909.019; Thu, 27 Jan 2022
 07:29:56 +0000
Subject: Re: [PATCH 1/5] ASoC: tegra: Update AHUB driver for Tegra234
To: Mark Brown <broonie@kernel.org>
References: <1643100491-5398-1-git-send-email-spujar@nvidia.com>
 <1643100491-5398-2-git-send-email-spujar@nvidia.com>
 <YfF75N97CzLNDRMs@sirena.org.uk>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <9b4e6677-676b-f26d-2163-bc8fec186b3b@nvidia.com>
Date: Thu, 27 Jan 2022 12:59:44 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <YfF75N97CzLNDRMs@sirena.org.uk>
Content-Language: en-GB
X-ClientProxiedBy: BM1PR0101CA0062.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:19::24) To CY4PR12MB1576.namprd12.prod.outlook.com
 (2603:10b6:910:10::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9bca8447-cbf6-4826-6d38-08d9e166d0e0
X-MS-TrafficTypeDiagnostic: DM6PR12MB2617:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB26173CA389F4616AA1AD91AFA7219@DM6PR12MB2617.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZUNxSMmoW+AefJ/s/S06L87NTFYdIl6pdjtzj83/O5t9ewlSlFMgWanzcGDV7jtGDNvsMYtaXyz1B2AuENIGqYh6f9uG5L3cn27zTQKr8Q0JICy571GF4dUK+u58io79j0zzoQd4a6bbDZkHDj/wOfFOh1MyCa2jOPq9i93DkY7tcfyhyOq4Qhz0iR90zNBiJvk23AykdZkxucp0bF+IXG4c4fbNyMSfG8q3U/jZxrFuNCJbn1vJV32ctljJGHg7ccYIVBfdtcccTNvXSZDl5JwtNKngPHytQfFHsZ/JKqQDuK/XKDy0l/1cTT472667Ruez5boV3XgrpGZQw6zhCgovAo4cONUGZpncGERlfUuCNVi38g/4VQjjiu1pclruXPgiL/AYVW8J/CuXBWFgrkokV4bBg+H/Xu6mPe3Bg6cVhAOCTnSL47HxbDu2gwocGswJE8FOyuqsPhzKY3Ly5/9TLFaLFQmcYmmkVxC7J6izC1HYfeP0KFzas9vYVkuGJwK0A15yhS2YFqhNjyjePznJTO2HQZPgYCwCOJSaiSA3zJIYb4ndKgXU0gDnk7v0gZUTh/PS6j4NE5L+RcXbcykDtiXDN0TmEDgg/ngyCARUUcurbdvVOgdEzgQF+UWUnT3e3u/gTKikd3uUSvOhHfxa4elDWOm2Y1j6+zdjxWZYm8bc3Jbn6jPs8/ieUd2SwubKTOHLtWjolxxrBtnn/LDnXnmM4zuf6N2NW8JXZyI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR12MB1576.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8676002)(6666004)(8936002)(4326008)(6916009)(26005)(53546011)(6506007)(66556008)(66476007)(66946007)(316002)(86362001)(186003)(6512007)(5660300002)(2906002)(31696002)(7416002)(6486002)(31686004)(36756003)(508600001)(38100700002)(2616005)(45980500001)(43740500002)(20210929001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?Windows-1252?Q?abIX6ndjRitT1qw1Gl8YQTOXsFMIHIBIzDrUdm0uRddBK4yVtKaucjKR?=
 =?Windows-1252?Q?pt/vx8mAXURfn8KlGXT37HPgsWo7LYqbpvlPKUkF6bdHZFmrbuoDEEGX?=
 =?Windows-1252?Q?5Tsjo7SU/f61qFj38NvSHVLZRzGFFTuzKXI6nomawfmngk6WNHSdSLiJ?=
 =?Windows-1252?Q?drFLFscY2viJycRFdd/oduRWhrAZcDFxbP/Zf/Khgvp/0lj7I0975yVt?=
 =?Windows-1252?Q?vT7ix+sK2Tlweu9A7bgSuSkKkr/y44lI6DNp6eQiMk9d7oqyAiMANeqX?=
 =?Windows-1252?Q?gtzkrTV1VGQLHk51ypn/s724kaYZb3D8q9G86gMsrrTXV1APOzvwLVaK?=
 =?Windows-1252?Q?HF33wsIjWIdLwLoeXgKT40uoHrZuyQxdi+uXRUGXR1eGCykLvsRc2pLd?=
 =?Windows-1252?Q?i/Qkkd0wbGogaB9+CBmUtSQxp2k/HA5vjv3DsSrLb198/76yEap6As/5?=
 =?Windows-1252?Q?VtAvvBtHftTnSSuk6GNFrV1m+dyC3qODCE7//1KGurYcGm1eX9RaDDMy?=
 =?Windows-1252?Q?2ztbfFc7PEaU2TCcTtP9qqXq7V/vI/7uBY5/kj/N9vCPosKyoV3XpukF?=
 =?Windows-1252?Q?vFzWg/GoioWZgnMxeCHfn8ZclPFFk2bPJOtH7o918q/5wfoSNuV9p8C6?=
 =?Windows-1252?Q?fdoETZLXiwKm7MjY3Fj/C1/9uPI1l/H0EJWo2xG+naRTbA7nH8XOd6ZH?=
 =?Windows-1252?Q?QeObzppWpkXbKyzp8H2X05h/PKUpnD0Bt/ciVDx1L700dQUVYumSPE7+?=
 =?Windows-1252?Q?nVp6TvDTYgqgRgarmuRiRpiwXhBitk7aTMGowjdffZk/rUIWp/t2IbMF?=
 =?Windows-1252?Q?B1pLX+Cs1236AwyVjqJs3EmE+21B02KfRgMc9D0bxX+I7Upvk2LoRj9q?=
 =?Windows-1252?Q?g6AE3+OQcXKU1RCx8dhT/8OXMP1cd/+RcKYsi9fTPQQN2Q7HEIpFxNRP?=
 =?Windows-1252?Q?b8FJ5p2bMdwIzLGICTWOSybVqyUxwjphTXKQT7sxa2NbMZdf+TAqmQim?=
 =?Windows-1252?Q?kh/AHaLzNH7zLOGGNu8Iq5Y1qHrLDvm5U/FZsWcWouC4eXM7kic+PdEo?=
 =?Windows-1252?Q?b2gCDG4UEIMfYa196RFXTMBsAqMR43CnwLTlq+bxcJ8i36N56V5o2auK?=
 =?Windows-1252?Q?gXpL0GMOOkqBT8kFwCNRr1HH86AnkMojJBuGwTCOusj1ZPQ9K47EeIze?=
 =?Windows-1252?Q?P86LTbJibWHbohTrYSRB44ibevoirb4RI/Mb7MfYcVJjol2t1d5gmx8t?=
 =?Windows-1252?Q?rcwbgyaahnOEQlKaE58/LomzxlxuWTx2MVfi0h6E5guklKQNdNmL2kmo?=
 =?Windows-1252?Q?yH195XKbxAXWN73TWUal3pmbA1TMM4QEa0cyE1EjtZozoWTgpUsHGjXk?=
 =?Windows-1252?Q?Gk9QXlyvjIHPL5oqtA3ORypA9tGlb1opivNxFxseBFoMW+Pwq2+i07mt?=
 =?Windows-1252?Q?PJEizTkcAQnb/3a3wgnnJpTTTbwU2qXXUH5PSsdncU8l8blDj1Bsy03O?=
 =?Windows-1252?Q?zmSBmJUvrsEZcr0kGLHNsFE7hOHaBy4H0O2WkevvgrPLISb0tU2iF4LF?=
 =?Windows-1252?Q?dvY2gXsGB0KKrO5aIg0/8Avv2JFRN9tFvvvGQ3GImeeGyOGkU76iAv0D?=
 =?Windows-1252?Q?c3l57bJhmEJqHG8/UifaTYvhWXGMleZVj419njfO+iLEuWbM6PyssbeA?=
 =?Windows-1252?Q?c/ZqiXRRKqSkRuhmCprWoOktJJsU4cxVQHgMPDOr31FIzXGbm5HCeTut?=
 =?Windows-1252?Q?6GsOAf582EfxjmDBOOY=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bca8447-cbf6-4826-6d38-08d9e166d0e0
X-MS-Exchange-CrossTenant-AuthSource: CY4PR12MB1576.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 07:29:55.9287 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3uDYe6l+fu9B+28/pMIAwfriJjG9ty+IZyVCJ7yXsQN/bq0oCpgAXRakVyR6wCPv755UJ8YT44IKzUkncbNwZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2617
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, tiwai@suse.com, lgirdwood@gmail.com,
 robh+dt@kernel.org, jonathanh@nvidia.com, thierry.reding@gmail.com,
 linux-tegra@vger.kernel.org, mkumard@nvidia.com
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



On 1/26/2022 10:20 PM, Mark Brown wrote:
> On Tue, Jan 25, 2022 at 02:18:07PM +0530, Sameer Pujar wrote:
>> From: Mohan Kumar<mkumard@nvidia.com>
>>
>> The register offsets of switches connecting various AHUB internal
>> modules have changed from previous chip. Address this variation by
>> making use of Tegra234 based compatible.
> This doesn't apply against current code, please check and resend.

I had some WIP patches before this one, that caused conflicts on linux-next.
Sorry for the trouble. I have rebased and sent v2 now.
