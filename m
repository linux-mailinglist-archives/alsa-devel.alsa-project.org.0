Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5D65FEA86
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Oct 2022 10:28:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 19FDE57D0;
	Fri, 14 Oct 2022 10:28:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 19FDE57D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665736136;
	bh=vAhr/EoxqaoJOqdwpSQFyEUtpwAAytHqICMLBuZR9zA=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Sd2MyP+kcwO7a9Vc7LzU/3ygKoF0pgInsl0yiEo+SGwvdkODEaVQS7+ZFtiZDbDkY
	 GHHx9VXrGYsM3HwGCnIeZNPYVq1It4ZibYl6PH/4JzH4k25isO4+REMD25ocxutCej
	 VbgM1IGHtadVpkePIm1YSGDDpXHUWDIpi1cEPNGc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B862F80115;
	Fri, 14 Oct 2022 10:28:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D9524F80224; Fri, 14 Oct 2022 10:27:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_78,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2043.outbound.protection.outlook.com [40.107.215.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D86EDF800F3
 for <alsa-devel@alsa-project.org>; Fri, 14 Oct 2022 10:27:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D86EDF800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nuvoton.com header.i=@nuvoton.com
 header.b="ZHPlXn2M"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MRFZs4aqtBJqzplw2S019nwnz3ylBrpwS5nLGY+5R/cAkYzK/ZIQ1g88gAHRFoh4OCGb8+VSO7Ha0eqTavLe48CA0McjrkAEQQfnAjtUES+mziEy11+//sDZoAwz3YahF2NZgmVht4KEUfEw5N+g7F2qDpq116ZwZkfRvA6ArgKV70G9oJ3mCnXkogP7dnR9vnDxVRaPCpxYKoIIBnbOMK8uDXcKUDlTBTvE/Imm7EegWt8KTZ7eCZ1syx3SHntiVskws1XDOe0wScb30L2JO+/J0TQotk8zlUbpS9aFGt4Xfsexl6n9Owk25UkNJmFE+DfjB8lBp+p8XatT/dmF5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5qhpluCy5rv63dUaXljdSUjVaKkcw59IcTYJ7o59Hf4=;
 b=PbP66/uNYrGkK257mk0uZG+xFEpJRLyy25qZ4YeUmrDA1wuZ0JJZrBVGFQkoEi6DCHXTglN+ar+PaA+NYXujvb9Orxck6N6NkwXL/XTlgXcDgXT8lXDUu6XMBYBc+CbxC3jlzV/TfFmRdJ9/JtmvfAEgQL/E+mj1GYnPiFi5oc70qe0F7MMVEo6TM/nI7jABy7qYe5oimUxOgi835GwZxSTQJL+pq4ETLRmnG99wBfkSPLyE1MafjmYlwlT6XuyXUb7OFzdgBIDiJApATuhq4gUJnatkaVd2NLOZFFUcCeG/x038RT7zbf/S26bD3ZIKPftTjpE/cYhoyaDOOQqx8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nuvoton.com; dmarc=pass action=none header.from=nuvoton.com;
 dkim=pass header.d=nuvoton.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nuvoton.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5qhpluCy5rv63dUaXljdSUjVaKkcw59IcTYJ7o59Hf4=;
 b=ZHPlXn2McrDve8062sgr+3gY0SXhBZ+l+jKHKFflImy6Y34UhzbSYVCH0MNeqPyVJLdGZyxmGcSXqk+kb8vwnzirqYUmPA8AH3khiDV9gshmRXYc4c3zng+/ZhKTOK0AoMhy0t7cWb8xxlfcn+eU8sj2DLLz3mTnYprxdKu4TfU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nuvoton.com;
Received: from SG2PR03MB6732.apcprd03.prod.outlook.com (2603:1096:4:1db::11)
 by TY0PR03MB6823.apcprd03.prod.outlook.com (2603:1096:400:218::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.9; Fri, 14 Oct
 2022 08:27:38 +0000
Received: from SG2PR03MB6732.apcprd03.prod.outlook.com
 ([fe80::ebd4:f34:d904:c405]) by SG2PR03MB6732.apcprd03.prod.outlook.com
 ([fe80::ebd4:f34:d904:c405%7]) with mapi id 15.20.5709.010; Fri, 14 Oct 2022
 08:27:38 +0000
Message-ID: <6fb90595-26f5-a779-7366-fa4fb9e86935@nuvoton.com>
Date: Fri, 14 Oct 2022 16:26:15 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] ASoC: nau8822: add spk boost and spk btl options
To: Benjamin Marty <info@benjaminmarty.ch>, alsa-devel@alsa-project.org,
 kchsu0@nuvoton.com, wtli@nuvoton.com
References: <20220922134458.3421695-1-info@benjaminmarty.ch>
Content-Language: en-US
From: AS50 CTLin0 <ctlin0@nuvoton.com>
In-Reply-To: <20220922134458.3421695-1-info@benjaminmarty.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: TYCPR01CA0061.jpnprd01.prod.outlook.com
 (2603:1096:405:2::25) To SG2PR03MB6732.apcprd03.prod.outlook.com
 (2603:1096:4:1db::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PR03MB6732:EE_|TY0PR03MB6823:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a32b886-5f07-4774-1227-08daadbdf447
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 48j8h3s43lLVfZ9zDAedzThRJCRkl2CUo1rQB7uwb3zv+9syjb81bClTOg1mON6k6Akb02adM6oQoMT2GMYe1P+cLzoEgGcDjr1MVzCiHfF8rA+qCLxJ/eD30dYuD6OFPfQPfQhWd0T3imy3RLin4kbgJ3E21L7VnzEQ7ewCJ6jJQdqkews6fFnNNjRqUHgMH0eaiSnQt8rlC9OJYFhxXjEHvNH7mfPkd4TaQp3eA5Z3emhmlroxDx7lLPGYVGvnrYX2Vq8kjy+cevR2jRo7pXR/pIFwqFwIOy/87iGxJ6VikzZ3qMg9hx+Oup8PO154S2fOy3qkif599Q2VljoSPc2jYIUS2/LRRffs1OBWQu4Fr+nXg+O5Br8eNzqdvD4bgC3mlpgGTMZyOXD32yOMY88DMN6WSozk5s0MmnGKwChzdKPKVWYBRujLfsl5Mzltprm42G3m43b/AD6rz8LiqoXjUdgfGqZHTabkBYKKCLEdsbvh5z6BBQ0llqTV5aYZ9vLQ3Yh0py21HjjJAnR4tv6s5symXtDzPDIfLG6el+75uAwiPmZXCF3lVhtrMqVgD70tVVVGs3QVOSqVE0DfFgsUg0Ph4PhMwOrWJzqLUt181qTQmkw3GIgYt3GRyOC6lNoYWmLE7Wj0LZFWrUbGV9Yuq8prfXzXI0QqB/r9jxifV+wv2FEsjFFwfZf20X35fpGerVw9XB+MTMBYMEur8PUfC/byMEB/neZ8x5y3GOOhLhQHO2FYTSfg1RN8UxikCIPz4+wLzVQzxrSpPFlpQDDspIPSyHSwkRA/cV9x9qQJREoNyXNDrYIuTlus7GfYR8L8gEng5N5WXpi3Z3l3uOowK6e6w+f9IW5yw5y9bve1b3loryHeh1Xlp6C/+byH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SG2PR03MB6732.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(346002)(366004)(39860400002)(396003)(451199015)(66476007)(38350700002)(31686004)(6506007)(186003)(316002)(6636002)(36756003)(38100700002)(2616005)(2906002)(5660300002)(6666004)(26005)(52116002)(8936002)(6486002)(66556008)(31696002)(8676002)(66946007)(83380400001)(41300700001)(6512007)(478600001)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QjYxWnhub3dKYUJUMSt2emE3Vzh2Skt6WUhJZ3ZLaUZOU0JQMlN2aEREQWtv?=
 =?utf-8?B?MVFwYlN4SmZYZmV2SmQxM3ppZWo2Ykw2VGJZTkJCWE5aSElBM1VBZzVkV0x5?=
 =?utf-8?B?Q1N5U2UzNGczU242d2JxQlRuWEtvUWdKTGVIK3VQQjN5d1pEK2RhSm9rai9n?=
 =?utf-8?B?UWpiRS9HaVJmWmo3bEttVFBkUWQyY1lmRk9TWWZvV1Fsclowa2F2b0hTMVJ5?=
 =?utf-8?B?dnViNWk0bGZEa1hxMWVNZzdPVWV1dDJ3WG1Ba3VLaklnclg4V29uOUp1TGlk?=
 =?utf-8?B?QXJzMW5wZ0ZMM0Z2bW04cWNQU0JkeC8rYlJOajl6RTdsdVo3eGg3UVJqbHl4?=
 =?utf-8?B?VThLeEk4ZEJSQnBSVjRaMWJwTWtWU0o2QmVzOFd1SVozMUNndlN5aFFpSjhX?=
 =?utf-8?B?MmlNSUx0cU42M1kxb3g0emNTOUE2R1l2NlFqekJpOWpORlFIejZ4WU1xNWhD?=
 =?utf-8?B?M0l6bnlOZUJHN3Z2N29PcXkvczRCKzUyTytaUGkyR2d6WnJnS2JFQjVlWVBO?=
 =?utf-8?B?cTh5OVBQVUkxOE54WTM4ZFR1L09ldGx5Szdnck1HcTNhb2ZydGx4ME1lNG1v?=
 =?utf-8?B?SlBhWTZtTUowZk05aEFaSnVoRTV3cllsUWFaQThiUUdoVE1MK05TUlFzblhI?=
 =?utf-8?B?aEw4K0FGeVRMekJtTGNhTStsVitSZFpZOUltYm9TWVlFNzB2bFVJcm1OMG5v?=
 =?utf-8?B?TkhDZnNvQ2VhUGxybEQ5d012aVRWSXN4blhRT2RVbFVmQ204aUt2TWs3aXJW?=
 =?utf-8?B?a1VMeFAvMFlscEJSU0Y4d0x0L1RGaWIvVVNUSjhvRE1OK0xjRE5SSWdqckhv?=
 =?utf-8?B?SXV2alZPSkJVLzA2aUtIQlFZWGFTT1pla1NVL0dSMnkvanpic3lCMDhLTy9w?=
 =?utf-8?B?OVI2RkI2RjZPajF5U2tkVEdkYWFXNGdaclMwcW1WbTNjdTJoSjlQVU9PT0Nn?=
 =?utf-8?B?Zmx5MENQM0NsNlFXbS9mdkw3dHlWeEpNMUpndUdRcGFGYXcvaFpnU0VWMkR6?=
 =?utf-8?B?ZnhCQ3dLM013TnNvLy9WNXlTR2tOREZmMUwyVEV1U1oxbXVDUjdnT3Y4UVhn?=
 =?utf-8?B?MjJiT2VsNTVTYVI4QmdZZEdTdytjSWNwY0oxSXovK1lqTkdkNzRmNHEzd0h4?=
 =?utf-8?B?YTltWGIrSWIwTEcxc2c1bWdqVjluT0VWMlNPVGxQMVVWcU0wS0RtZDBpQ3pi?=
 =?utf-8?B?Nzdta2V5MTJYRFJiZWlEb1hRY2tCN2hmSlBtUGpUcW9XUC9DZTlQYVZDdGFh?=
 =?utf-8?B?cUNLLzZBRkpibzh5NEhvVDhoSFY3QktiOVFzZ0VDbWdwamY1YWx3cm01b2N1?=
 =?utf-8?B?ZEQzaXg1TEdBdy8xYVVPMHNsdCtIMDZZQ01MSEJza1padWRuMUQyd1IxYjRn?=
 =?utf-8?B?OERLMXgrOGVETVNoYm9Wd21rRW0wREF6ZTRFUjBwRFFHVmdDM3g5N053RWlh?=
 =?utf-8?B?cVBRaFlNZXhiTkRsSkZHT1BBakM4WTZYTXN6b1Y3bTNIdmtmQ0FOSnFBK0JW?=
 =?utf-8?B?MFhDbWRnakpkYTRvbXdjQUFVVHQ2SVMxdXVpRDFmWS9sZUhWQWRMYk43c1k2?=
 =?utf-8?B?N3NLMGxmNzlPcHpRY00xQVVMMzdzY3c3d3pSV0o2TVZKZGRqbzVZem50eCtP?=
 =?utf-8?B?RFhtZXQ0TGtxb0dLMkRkZS9pUlo0aXNoa1RWeDRWS2hNV3JhcWhqeWQrN0Rz?=
 =?utf-8?B?Wk91SVJ1TjN4YlQzaWdac25Cd09ucUg4YXl6aXV6b0VBR0J5TndER09wMlFZ?=
 =?utf-8?B?NHhSKzFZN245T1JNNWZNVWZrUElKcFlNdGM4U3BQNE1haVEwRDA0WXlLZmhs?=
 =?utf-8?B?NkVGQ3FEb0lyeGdjWWZsOFNPQzE3RzN1NXRnOHVvd1pTSnBNbC9IcXZSUUVY?=
 =?utf-8?B?RFluVFNmVklBWTVrMGhQUWpIaVI2NWU3SVVWQ2dKSENtSk5JSmhtVkRDSFI3?=
 =?utf-8?B?cnY5SmZGdXBGaHpmVlc0cytPODdBU0p1elhiREczdm03OURVMzFyL29iVjRK?=
 =?utf-8?B?OG5LMVY1WUxmZGFHckhJRlp2a21ycmdtOTd3QitrTUNnekRxVzVLc0tqL3F0?=
 =?utf-8?B?U2lFRjMwNC91WkdCd1hWdElIMWtQQTYwQ25HOWl6bWFQV3p0VVRrd2l0dElx?=
 =?utf-8?Q?NocqrxAaw8NdNRvfRx7UfnpNn?=
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a32b886-5f07-4774-1227-08daadbdf447
X-MS-Exchange-CrossTenant-AuthSource: SG2PR03MB6732.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2022 08:27:38.7426 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F2GKA6Sd+ex/jl86Jh+QUQjP/0duj8hi2HKEzo3hJHXDzWaz3PnDJ4mmgB4CRKpETFCMIuBc+mC2gDWHUGhwIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB6823
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

On 2022/9/22 =E4=B8=8B=E5=8D=88 09:44, Benjamin Marty wrote:
> These two options are required to use the Speaker output on this codec
> to its full potential, when wiring up the Speaker in an BTL configuration=
.
>
> The Speaker Boost flag is explained in the Datasheet on page 80.
> The Speaker BTL flag is explained in the Datasheet on page 78.
>
> Signed-off-by: Benjamin Marty <info@benjaminmarty.ch>
> ---
>   sound/soc/codecs/nau8822.c | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/sound/soc/codecs/nau8822.c b/sound/soc/codecs/nau8822.c
> index 1aef281a9972..812b8254f9a0 100644
> --- a/sound/soc/codecs/nau8822.c
> +++ b/sound/soc/codecs/nau8822.c
> @@ -379,6 +379,12 @@ static const struct snd_kcontrol_new nau8822_snd_con=
trols[] =3D {
>               NAU8822_REG_DAC_CONTROL, 5, 1, 0),
>       SOC_SINGLE("ADC 128x Oversampling Switch",
>               NAU8822_REG_ADC_CONTROL, 5, 1, 0),
> +
> +     SOC_SINGLE("Speaker Gain Boost Control",
> +             NAU8822_REG_OUTPUT_CONTROL, 2, 1, 0),
> +
> +     SOC_SINGLE("Speaker BTL Configuration",
> +             NAU8822_REG_RIGHT_SPEAKER_CONTROL, 4, 1, 0),
>   };
>
>   /* LMAIN and RMAIN Mixer */

Looks good to me, thanks.
But please add the right maintainer Mark Brown <broonie@kernel.org> for
patch review.

Acked-by: David Lin <CTLIN0@nuvoton.com>

________________________________
________________________________
 The privileged confidential information contained in this email is intende=
d for use only by the addressees as indicated by the original sender of thi=
s email. If you are not the addressee indicated in this email or are not re=
sponsible for delivery of the email to such a person, please kindly reply t=
o the sender indicating this fact and delete all copies of it from your com=
puter and network server immediately. Your cooperation is highly appreciate=
d. It is advised that any unauthorized use of confidential information of N=
uvoton is strictly prohibited; and any information in this email irrelevant=
 to the official business of Nuvoton shall be deemed as neither given nor e=
ndorsed by Nuvoton.
