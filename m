Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B064E55BBBB
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jun 2022 21:36:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EDDF41685;
	Mon, 27 Jun 2022 21:35:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EDDF41685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656358564;
	bh=WexGN+inyRDD3PbDX+Xv8y5k87OwI0bD1+yVFWNdJv8=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NP1kiYAwFxv//5vL1WCKnebFOOOl9UDduX9+1uAkuaqZ/GCIV+Z6VmLn0gEr2mm6x
	 LHpOFWLlPztCEcbk3cRrT74fbI/LhUjvTR/8YCJv2FXrCmtxmAnLLd2NDfaVih4Qgv
	 kJARxKc6PlrkhZtZETflAS3hNARpwFeXyXnbcH/s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A3C3F800E9;
	Mon, 27 Jun 2022 21:35:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 12649F8028B; Mon, 27 Jun 2022 21:35:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2043.outbound.protection.outlook.com [40.107.92.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 79E15F800E9
 for <alsa-devel@alsa-project.org>; Mon, 27 Jun 2022 21:34:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79E15F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=precisionplanting365.onmicrosoft.com
 header.i=@precisionplanting365.onmicrosoft.com header.b="z/cbrCel"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rx8hBayBF6OdDzT1tz/CE4V9n6HFCYUcbk+9oxHadUL6LjGelF/0Q4iMs7gtcT9RRqbEwMFajGjJIxSWpF1ojlA9733SYiFikUn9Z3jgliVSIbUVg7to32QX2wYlid8k1x6ceBbQ/TDNUeYamAqcp84+nEzu+XmG3m/g+Cst8t+vr8ACbNRLA2Eub3IoncUdTscH36k5CU9jOaoUb2kp0GbQoLJcgZOUzFqaV9aRJNwnRWHYRFZih3BdivEupJsSE/V44GdtBSuNxsbhNQOOwoM7NuobVoIbgiFQ6xu/hr393wPbEu6EmIcQlcA98z3YTr/aooOCAW/BSY3iVXbmhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zT16AZUgwLOkvpbqGh8dInij4wGjLP+Us9hUA8T70jQ=;
 b=LkJBNaZE4VJl9O8t3L+7RhtKELhKRKO0Eq3fd3Sbd46jPNAa+FZbt2VPHOEqhnYpRrCIkCU1ftdmynLAdjvzPT/DZ2JIpDfjeOQVgm/HQz3A5XfAt/NpX39LBF/pxGngzQ/+fK2P4nt2PzxXblCC4mU3NWrG8J0Csr2dwvQ9LSb66tVefDlvW6CUtKYTWaZJXEMn1ejUmN4C4XsETWEcdHrjX9EowGJsdKN4Whkyp+RdBTdLIy1q3F7As7g7gQaXWS53gIUKnvQoBK7tmKffVcHuyRkEaRYouvYDQY/mfOxqbDJGffkVaTbMT7hxVU/xfifdJU1eScAVqWBnElmPjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=precisionplanting.com; dmarc=pass action=none
 header.from=precisionplanting.com; dkim=pass header.d=precisionplanting.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=precisionplanting365.onmicrosoft.com;
 s=selector1-precisionplanting365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zT16AZUgwLOkvpbqGh8dInij4wGjLP+Us9hUA8T70jQ=;
 b=z/cbrCeltHzS5X/oXtISPwNW6RYhyt0mHxTcjkOggYZdEK2dlnCcYWifNkJg88w+RalMzXFG6MFebac0OKIDPEJ5om1AiKJTzT5rf1lrjp0Zy+BM7YJjx71DCjPbwRWyn20jopXzWGnfKPTubFb2rpo/vnyROdVIQRamUrd6SJM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=precisionplanting.com;
Received: from SA1PR22MB3196.namprd22.prod.outlook.com (2603:10b6:806:22b::8)
 by MWHPR22MB0445.namprd22.prod.outlook.com (2603:10b6:300:7d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Mon, 27 Jun
 2022 19:34:45 +0000
Received: from SA1PR22MB3196.namprd22.prod.outlook.com
 ([fe80::24b0:19e9:a42d:60b0]) by SA1PR22MB3196.namprd22.prod.outlook.com
 ([fe80::24b0:19e9:a42d:60b0%6]) with mapi id 15.20.5373.018; Mon, 27 Jun 2022
 19:34:45 +0000
Message-ID: <db9ad0da-da84-2cae-c354-3c9707df9c4f@precisionplanting.com>
Date: Mon, 27 Jun 2022 14:34:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v4] ASoC: ti: omap-mcbsp: duplicate sysfs error
Content-Language: en-US
To: David Owens <daowens01@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Jarkko Nikula <jarkko.nikula@bitmer.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <20220620183744.3176557-1-dowens@precisionplanting.com>
From: David Owens <dowens@precisionplanting.com>
In-Reply-To: <20220620183744.3176557-1-dowens@precisionplanting.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH2PR07CA0001.namprd07.prod.outlook.com
 (2603:10b6:610:20::14) To SA1PR22MB3196.namprd22.prod.outlook.com
 (2603:10b6:806:22b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c8073e00-5522-4833-3d92-08da587416cb
X-MS-TrafficTypeDiagnostic: MWHPR22MB0445:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3SK8IfnuTa4BIg4rAs7qIjkWEUw7HkpAHvtq5P0XDfbw3RLoVZHSBKz6KCAfNwFsHpuXMDmj9vAnEWA3vZU+K/Kv6U2obeKpMoAyNcG0ZdsH4ekmNmjXa6d8jNanPIytiIrJi+6Nusynx9rNdnmZwHTZ6vTMMlTS97WXBsqqqmkK0xOsNyZ5vBXLLJMELLJODHNPDsxWDn5WsLHUaiIrJN9MqBKknIwHx2A9vCsMr2JSm0mmAJGSA2rbe2oYbDJwUVf7ylatLbWD92b8sPPg5MYpYBOUp+6cv8pGe7WmfGOPOHTr2ULqvTp50IdB7p5HQ8QpSeLH0qsm+RaZjxWbWbR05UE9sDoUMge+tz4YorOVPW4y2nu9QBlpgcpmNPQbJUzfg9JiQ39MvIvxcPJDDmmlpFJRi3nXSCoUtmShX+5gJZGefDuCc4iSjyQgsaxOMj3RWSYXoPbglSctKY7M48VeZqqn0DGJnxoEJd6v0UZ2KMxXgU0BIdgEvaSzJakgPyHjcRH0Vx4LMuaZGjIw/4B/oGuFbByytUJrMyE1Wq2ARuGdvEwxysdG4F8UzDO5W/av+2Sv6F+eeCQHPKjfn6ZHCFASJv4aOIMbPeAtfyibiIzvnW7/P2aUzGQHn8XBcMddBsqgBkAHp3l6cCAFKDqzbnGcSy+/e5pOWSu9SvQsMy883oW3FxCKOtc/2MnP7CBEQ29uMU5144n28wKhmZARZrdilQAaNdHpvasocFfRUqlhIltkXpLWJp3qXeyLFFsDW5u6oF/WjUWW9WW6UVLZkVkj0rethEBgoDGZv3wfUtsz8LoQS9JT2zGZ/8t9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR22MB3196.namprd22.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(366004)(39850400004)(376002)(396003)(136003)(2616005)(41300700001)(53546011)(38100700002)(66574015)(5660300002)(6512007)(6666004)(83380400001)(86362001)(2906002)(4326008)(8676002)(186003)(31686004)(110136005)(6486002)(66476007)(66946007)(7416002)(31696002)(52116002)(316002)(6506007)(66556008)(478600001)(8936002)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGZ1UzJoTnpBaCtScm5qUnRhUklHcHlBRnhhQnRVMHBDY3plT2FRdDBLbWpF?=
 =?utf-8?B?eng1RXZTS2ZjclZKaUkrbDhNZFYvVWdjM1JDY1krdGtqMG9iaWp3aWVtd3Vj?=
 =?utf-8?B?azd6MnFENmFFZXhQMGJySXErajFpTEpFR21leGNrVG50UHZjRHZqMG1aVmI3?=
 =?utf-8?B?SUtqS0Jma2l3Yld0dEVqY3o4WDlqK0hLQ1c5YkpkYzB2UWxPcHMyWGFnejhB?=
 =?utf-8?B?YWhSejcyclJQSGloNnJDYzB4U2ZhMjl3MFNUV1RzekJGUG41RkxQSUZ5aUow?=
 =?utf-8?B?WThtN0NqQWU1QVc4UDFxMEx5U1l0SFdiY1pRdGRjbzdIRkpnWmJFSVJ4TXZl?=
 =?utf-8?B?dzRDakJPcWl6UXo2STZqVmdldURYdTVVemFzYS9hbjBWMVFab2tPL1Y4OWE4?=
 =?utf-8?B?ckVJSWptQW1UUTY0UFRRbXJISEllMzQ3eDFRVE16MWoxU1RiUWc4SHNBV3dT?=
 =?utf-8?B?WTcyOXVSVTZueFNzUlEyTjViR3VlTjhpcTlSNy9MSitueUgvdGs5MHk0RlVI?=
 =?utf-8?B?alRUZTJxVGhjSzV1dmdhMUJra1d6TmJpc3ZNRXlsOFFuOU1DR3l2bW10dVZ4?=
 =?utf-8?B?ZnFpNzZxWkRyZXdpVGZEbkM3dmt4MjBYd3E2a0NvemIvWGVjaE03VE1wWFo2?=
 =?utf-8?B?cC9YRWNCRnhpYWNVT01Fdm1nMFdyd08xUFEwekJEeXY5Mlh0QmQyVy96MnhS?=
 =?utf-8?B?VWRKZUhvSWFNdWJHQnNTbVN5elpmcFFRaUROb1ZJQUxVYjRrRHVJRkxWbnBx?=
 =?utf-8?B?K3dmN0YxNm45Y2ZDcWlScmF5SThCZndPTUhMcGR3ZVVNNERCVi9lQ0JCeDlO?=
 =?utf-8?B?TEo5Nmdkdkg4R2RtNjFTM2pHanlSdWk3NllDdzFPWWJ2OFgycU1sRmZ4U3J6?=
 =?utf-8?B?UXZRN3YxalI4ZTdDMEgyU2wycHRmaVl4ZklmWmxVcmZDUDBGL0VmZS9kVCtT?=
 =?utf-8?B?MkI2WXhlYkVZamNuQXgxYS9qUEIyRnpncnFxWlBOY3hJRGRabFBseFhBdmhM?=
 =?utf-8?B?VVBXbjNiL0JxK1VsWlRZb3pOdzVtTFRJb0R3d2g3d2xoZCtZQVJVRlNGMUVN?=
 =?utf-8?B?emdLcTJQVlBFaUN0a0daWVdyNkFOdERjVi92Q0xxMHRWTHRqbGZ0TFRZQTkr?=
 =?utf-8?B?bWNHeG84dGtjemZXcWlPeU00RmFaOFFDVXFzZFFMTWlLaUJ4SjVXUm9KQ0Z5?=
 =?utf-8?B?b2FjL0c3RXRFWWN0ekYwSUxZSWlxUUZkMUJHNGRjTTQ0NXB5eldKQUFtMGJ4?=
 =?utf-8?B?RWVTWjVaQm11d0E1L1E4bUpRZmZXb3pROHRLZmpydjlCVEtSZ3ZKZ1JVeG5C?=
 =?utf-8?B?QllQYk5lclIvc3dYYXpCa1pLMWN3QTVlNU1ZaU16QWtqN3QzN0dmdjFqTjJQ?=
 =?utf-8?B?NmxoZjhwUnVKVExObittQVRxZHBjM3F4c0JJcU82VHA3YkFKeS9mbk14ejli?=
 =?utf-8?B?bU1rSTdqOXluYjMxaVFNN0NrTDh1WnRLVzNhbWdma2FubTRZbzlienNpY2Fw?=
 =?utf-8?B?U1FrOHFldHhXaC9sVnVvbVBYb1ZOT0I4SWt4NFRSdUZ1RXFIN1BJSUE5MUFP?=
 =?utf-8?B?eDdReEpxb2hHTTk2T0VZdS9UaVNXZUY4aHVHSGJHek1iVFJndnZycHJ6TG5t?=
 =?utf-8?B?RGhGTDc2Q0xWMzhOd09JdnRRVHJ1UWJFLzRnVjkzTzI2b0lGanF3RkVZa1BL?=
 =?utf-8?B?SnF4Y01NcVlJZHJDWUhPSXZRamlxOEhBZUlyWDJ0UW5EaTcyNHo4amZZRlhI?=
 =?utf-8?B?bGtWRldESDBLb1FsOVZzT2FrWlF4MURYMjl1NnR3cnlaUjU5OEpVZGtBYm94?=
 =?utf-8?B?Y0Jyb3RhcGJWcnFQbUpydzR4b2FsUXR5NVFTUzdZNENDS0FCYUIxbktBWVJs?=
 =?utf-8?B?OUdDSUU2bkdHSlFLcWtSY25xVm5MRzY1Skp5Z1FZRlJzdnZtSVFUamk2VkpT?=
 =?utf-8?B?d0EvSzdPNDZ6b3plbjFCNVRhSmpLZTQveU1WVFlVNE5wTkNoQlBBUXB0SnBD?=
 =?utf-8?B?dFFpYVpFY2dHb3NtSXJzTVpwaThlWmVLVURQTnV2WWJSd0ZPZllzd3hmL2hs?=
 =?utf-8?B?MUVsYUFaNmpiRHlWUHRQOTdsaVozU1JOajdUaDlON2lZNEwxOGkzQW9OcnRD?=
 =?utf-8?B?TnRsRUhZcFhjVkNJOWpZTzJlWTYzNlFnM25zVDUvSUhiMFJKR1BDS0ZaZDdz?=
 =?utf-8?B?VGYvQm5MeVpVMEZaVjVBQ2VjbTZJZGVJWldDSGZNSktZQS81NkZDbnBjKzN4?=
 =?utf-8?B?R09FcEZ1Y29ib3F6bnhPQk5TUnBnPT0=?=
X-OriginatorOrg: precisionplanting.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8073e00-5522-4833-3d92-08da587416cb
X-MS-Exchange-CrossTenant-AuthSource: SA1PR22MB3196.namprd22.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2022 19:34:44.9790 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: aa593af2-61f8-4d4f-988a-e9c4c02b7f57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k3E8cP5oPMzVz0BdnWP6+KRCjLC6gAjBU5XFtJy0Zz8c/ILrRjxVKVJP/+4GYPQ3UMdOdkaSLKim4p9T0koNY18o4Jjm/KBnt2BRzFaJVXg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR22MB0445
Cc: alsa-devel@alsa-project.org, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org
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

On 6/20/22 13:37, David Owens wrote:

> From: David Owens <daowens01@gmail.com>
>
> Convert to managed versions of sysfs and clk allocation to simplify
> unbinding and error handling in probe.  Managed sysfs node
> creation specifically addresses the following error seen the second time
> probe is attempted after sdma_pcm_platform_register() previously requsted
> probe deferral:
>
> sysfs: cannot create duplicate filename '/devices/platform/68000000.ocp/49022000.mcbsp/max_tx_thres'
>
> Signed-off-by: David Owens <dowens@precisionplanting.com>
> ---
>
> Changes in v4:
>  * Reverted change that added use ATTRIBUTE_GROUP and left the attribute
>    structs as-is to fix compilation error and lessen the area of impact.
>
> Changes in v3:
>  * Whitespace changes only to allow clean apply
>
> Changes in v2:
>  * Improved error handling
>
> ---
>  sound/soc/ti/omap-mcbsp-priv.h |  2 --
>  sound/soc/ti/omap-mcbsp-st.c   | 14 ++------------
>  sound/soc/ti/omap-mcbsp.c      | 19 ++-----------------
>  3 files changed, 4 insertions(+), 31 deletions(-)
>
> diff --git a/sound/soc/ti/omap-mcbsp-priv.h b/sound/soc/ti/omap-mcbsp-priv.h
> index 7865cda4bf0a..da519ea1f303 100644
> --- a/sound/soc/ti/omap-mcbsp-priv.h
> +++ b/sound/soc/ti/omap-mcbsp-priv.h
> @@ -316,8 +316,6 @@ static inline int omap_mcbsp_read(struct omap_mcbsp *mcbsp, u16 reg,
>  
>  /* Sidetone specific API */
>  int omap_mcbsp_st_init(struct platform_device *pdev);
> -void omap_mcbsp_st_cleanup(struct platform_device *pdev);
> -
>  int omap_mcbsp_st_start(struct omap_mcbsp *mcbsp);
>  int omap_mcbsp_st_stop(struct omap_mcbsp *mcbsp);
>  
> diff --git a/sound/soc/ti/omap-mcbsp-st.c b/sound/soc/ti/omap-mcbsp-st.c
> index 0bc7d26c660a..7e8179cae92e 100644
> --- a/sound/soc/ti/omap-mcbsp-st.c
> +++ b/sound/soc/ti/omap-mcbsp-st.c
> @@ -347,7 +347,7 @@ int omap_mcbsp_st_init(struct platform_device *pdev)
>  	if (!st_data)
>  		return -ENOMEM;
>  
> -	st_data->mcbsp_iclk = clk_get(mcbsp->dev, "ick");
> +	st_data->mcbsp_iclk = devm_clk_get(mcbsp->dev, "ick");
>  	if (IS_ERR(st_data->mcbsp_iclk)) {
>  		dev_warn(mcbsp->dev,
>  			 "Failed to get ick, sidetone might be broken\n");
> @@ -359,7 +359,7 @@ int omap_mcbsp_st_init(struct platform_device *pdev)
>  	if (!st_data->io_base_st)
>  		return -ENOMEM;
>  
> -	ret = sysfs_create_group(&mcbsp->dev->kobj, &sidetone_attr_group);
> +	ret = devm_device_add_group(mcbsp->dev, &sidetone_attr_group);
>  	if (ret)
>  		return ret;
>  
> @@ -368,16 +368,6 @@ int omap_mcbsp_st_init(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -void omap_mcbsp_st_cleanup(struct platform_device *pdev)
> -{
> -	struct omap_mcbsp *mcbsp = platform_get_drvdata(pdev);
> -
> -	if (mcbsp->st_data) {
> -		sysfs_remove_group(&mcbsp->dev->kobj, &sidetone_attr_group);
> -		clk_put(mcbsp->st_data->mcbsp_iclk);
> -	}
> -}
> -
>  static int omap_mcbsp_st_info_volsw(struct snd_kcontrol *kcontrol,
>  				    struct snd_ctl_elem_info *uinfo)
>  {
> diff --git a/sound/soc/ti/omap-mcbsp.c b/sound/soc/ti/omap-mcbsp.c
> index 58d8e200a7b9..9fb7cf0c9f88 100644
> --- a/sound/soc/ti/omap-mcbsp.c
> +++ b/sound/soc/ti/omap-mcbsp.c
> @@ -702,8 +702,7 @@ static int omap_mcbsp_init(struct platform_device *pdev)
>  		mcbsp->max_tx_thres = max_thres(mcbsp) - 0x10;
>  		mcbsp->max_rx_thres = max_thres(mcbsp) - 0x10;
>  
> -		ret = sysfs_create_group(&mcbsp->dev->kobj,
> -					 &additional_attr_group);
> +		ret = devm_device_add_group(mcbsp->dev, &additional_attr_group);
>  		if (ret) {
>  			dev_err(mcbsp->dev,
>  				"Unable to create additional controls\n");
> @@ -711,16 +710,7 @@ static int omap_mcbsp_init(struct platform_device *pdev)
>  		}
>  	}
>  
> -	ret = omap_mcbsp_st_init(pdev);
> -	if (ret)
> -		goto err_st;
> -
> -	return 0;
> -
> -err_st:
> -	if (mcbsp->pdata->buffer_size)
> -		sysfs_remove_group(&mcbsp->dev->kobj, &additional_attr_group);
> -	return ret;
> +	return omap_mcbsp_st_init(pdev);
>  }
>  
>  /*
> @@ -1431,11 +1421,6 @@ static int asoc_mcbsp_remove(struct platform_device *pdev)
>  	if (cpu_latency_qos_request_active(&mcbsp->pm_qos_req))
>  		cpu_latency_qos_remove_request(&mcbsp->pm_qos_req);
>  
> -	if (mcbsp->pdata->buffer_size)
> -		sysfs_remove_group(&mcbsp->dev->kobj, &additional_attr_group);
> -
> -	omap_mcbsp_st_cleanup(pdev);
> -
>  	return 0;
>  }
>  

This patch should resolve the compilation errors seen in the earlier version.  Péter, I ended up simply reverting the changes I made related to attribute groups since they were not strictly necessary for the fix and I probably shouldn't have modified those sections of the code anyway.

-Dave

