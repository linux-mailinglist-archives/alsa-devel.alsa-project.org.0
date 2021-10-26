Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C9143ADF0
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Oct 2021 10:26:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9350416E0;
	Tue, 26 Oct 2021 10:25:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9350416E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635236800;
	bh=ZGzXi6GvPY1IAyJ9JUDR9F4VEVu2mPMp7QZSTUpJZOM=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Wjw8VnR9BBFP/3hp+Jo5oPVYM2xyU/AO06pMcZCQPtIy+v9SPC0UZXVj7NOZJjHEY
	 hZ/ergWrmMh7CTRYk73eFngWyevmzHW6vemRAYUvtYEyLEBcYJ9AhdAqWO1ha+0ulP
	 K4aRP81EeTu9EtTTEPyBRdAFetN8D5dpB+H9bv/U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0786CF80105;
	Tue, 26 Oct 2021 10:25:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C5110F8010A; Tue, 26 Oct 2021 10:25:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER,NICE_REPLY_A,PRX_BODY_78,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-hk2apc01on060a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:febc::60a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 74DE4F8010A
 for <alsa-devel@alsa-project.org>; Tue, 26 Oct 2021 10:25:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74DE4F8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nuvoton.onmicrosoft.com
 header.i=@nuvoton.onmicrosoft.com header.b="baXIoNBc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=alY1VpQ7zxM4GO+0P2NaTUqW9MXCUf3ScGW6W5UdFCFqrz6piLYx5Utu8tf70ZfKJMNb3jqN9YjYfahJ4H20wBoIjyMfsUcTEginMrpXeG5Aex7C0X76KsmSxMkAoYLQSzskmHX0oEQXOJn1pBmNiB2z05PV/ITW+4ahdAiavHSS/C+nx/VAgeRLHXXAni9FX9eatK5kJHYMGbgeP/N3AaYgBYRkgBrW3RNeLA90sKp4o0/XB3F+a75rB53BY9urhuwSR8Wq1WrTO2A9YYIiTG5g8rZ04Kck9JHf8Eq1uZrC1awHN7CcH49oug1VmjC+MjM74pxvPjZW4Db2e1cnPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0oJgEME8eJ8xwi7jHWijzAIJYcFeGX90v9O0FemGOFo=;
 b=lVn/+09i331Xb4VUrGRwekgZP566Y255RBXctFe0LGjTdUn9JQVjFH3PQ/+UmeKwHlaVaWA3X0+m4UQBYputZlKjL5XuC+P6Vq1MfLObx21fqeofd1TGK8x9Rm1iSeBm4sPigrgVwYGkOVt4r6bB1UY83L3MIL9PXyEqTHtdjiBYzq2L2Sb3inTypmOVfhnBEIw6jG8vwulABLZVLpI1su8zMlbt/QMQe2Nfz0c7Yn+XbnnZBjGrQ/F0g+Y4tCb+LkA9wz7dhq6RbE6tUdavpGTEFMKAivcAgca1wCRBlfWY9JDJ76c+DVlFo0p57eVjdJ2wZeqy2qDdEgo9GLXN/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nuvoton.com; dmarc=pass action=none header.from=nuvoton.com;
 dkim=pass header.d=nuvoton.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuvoton.onmicrosoft.com; s=selector2-nuvoton-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0oJgEME8eJ8xwi7jHWijzAIJYcFeGX90v9O0FemGOFo=;
 b=baXIoNBcyULSf47WeTGUnfWNlcKmURd43vOGjE65h9OgVLryqyNkkPUQNNdtLQuSzOdtfVENxMPkXGn4MZQ1JCj3fBsRi7dpLUCiYCbJoGqz8WdE11TcYKy2wXXVgcKwUScNr+2Dkws7ctkGtYz0QE/M8WDK/VZtmPGXxlnS59A=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nuvoton.com;
Received: from HK0PR03MB3154.apcprd03.prod.outlook.com (2603:1096:203:44::11)
 by HK0PR03MB3905.apcprd03.prod.outlook.com (2603:1096:203:3b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.11; Tue, 26 Oct
 2021 08:25:02 +0000
Received: from HK0PR03MB3154.apcprd03.prod.outlook.com
 ([fe80::a4a5:ba58:5edb:3dc6]) by HK0PR03MB3154.apcprd03.prod.outlook.com
 ([fe80::a4a5:ba58:5edb:3dc6%3]) with mapi id 15.20.4649.013; Tue, 26 Oct 2021
 08:25:02 +0000
Message-ID: <77c97746-598e-a6d9-2122-129e3b883da5@nuvoton.com>
Date: Tue, 26 Oct 2021 16:25:00 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 1/2] ASoC: nau8825: add set_jack coponment support
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20211025113857.3860951-1-CTLIN0@nuvoton.com>
 <20211025113857.3860951-2-CTLIN0@nuvoton.com>
 <YXaidVceACviFFob@sirena.org.uk>
From: AS50 CTLin0 <ctlin0@nuvoton.com>
In-Reply-To: <YXaidVceACviFFob@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: HK2PR02CA0206.apcprd02.prod.outlook.com
 (2603:1096:201:20::18) To HK0PR03MB3154.apcprd03.prod.outlook.com
 (2603:1096:203:44::11)
MIME-Version: 1.0
Received: from [10.11.60.137] (60.250.207.217) by
 HK2PR02CA0206.apcprd02.prod.outlook.com (2603:1096:201:20::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.16 via Frontend Transport; Tue, 26 Oct 2021 08:25:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c20ea422-ba04-4de9-db38-08d9985a1b3d
X-MS-TrafficTypeDiagnostic: HK0PR03MB3905:
X-Microsoft-Antispam-PRVS: <HK0PR03MB3905D60F0BEE7E81022D77EA8E849@HK0PR03MB3905.apcprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2GGigMUXusjjsBvgYE36O9dpYlu+cB5iE/PXPNwWj1cu9vTKQissXo4WZkkCut2SED1rmwc89xVtSsbyBkh8j9UU2hEOmD6FEMhMSQ5RHRxG7unG2vQhY4MnZCShQLO7lH1lMD9MJGuVkZp0HX7TPtr2WW7MFik17Gtm/2HhMSn4wtjj188IIezUdC+tzwv156GecooiEJiuritawl+eXgvMjD3czr3sIcyGRqW2c4J+kwR58FmHPUTOm4sk5cl+5Lw2C70Jq1/l6UYEFEMXgZB0ufs1m2oHBm+mnw8hvDS/8IZ2ayWNXzUCQpkziFaIdDHNNDN1kjd1AYn7QNV2y30cOOx/4iuF3Pa71mBzgufby1CSOkISqrj6SlAHzPUgXsBQbgtCbbG0vM2E8E5vfb7e8rhtejKKBnu2C78ZbVByqQDAnBguHHmAYEhNYshi5W2fqqogfZFTbQpPLMiJabh8df8FSq/SeTq6gnETzIz9AnvXCP5QJh7WqI5PitXgfeipKIEuuY7/nmihNmcwHzGHtThlUVEgp+E/xlcJRjIIoj/G9Kw1+hyaqAdCRNiCAp60st+r8vyn5eQqm4GrzuMmDTBpQoT9NtDVXhCngC0YCpmGup9kawJXq/x/48m6tr5aNMkx3iQZP14Le/7rx2APpXIgNbV343FZ2WljgLorVWNDKzS81GIkd3I+trp62pjy216fa7aWIrBC8Bz15Su4haXJIpVfALP5ds/k6PSpQcYLZWjkPgiwDE8uh4O+IvizUeQ47VzLQQ4BIhe7VQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR03MB3154.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6486002)(2906002)(66946007)(86362001)(5660300002)(508600001)(66556008)(8936002)(186003)(16576012)(52116002)(83380400001)(8676002)(107886003)(26005)(4326008)(38350700002)(38100700002)(31696002)(316002)(2616005)(31686004)(956004)(6916009)(36756003)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K2JEMXF0SmNDWlE0QkJZTm1iUURGcWlVcExDUm5OdUF6ZmZJVUkvb0xFaW9D?=
 =?utf-8?B?ZnByMFgwQ0ZxaVBzblNTU2pKdkFldDUwd2NuY2V6RmJRSE8vQlQxNThrMlF1?=
 =?utf-8?B?YStBNW5NekpFdzNJMDArTCtGZHg2SjV2MC9kcTAzbXV3emM2VmFDUkpmeFR1?=
 =?utf-8?B?L0R4SEhERitLaEJQNGZndjJtNmsvZ2pqbllKcm5aeVdXelhjYW1LcTdIWlZK?=
 =?utf-8?B?dTZpNlowQnltWEZjVzdBVk9IeFdJLzhJaW5VVG5vUDNqNDM1enJjaTdEdHp2?=
 =?utf-8?B?bXA3Vk8zUk9FblZSWXo0THJYZ1M5d0hEMklRVFAwRDVpUGhBWFFZWThTM0du?=
 =?utf-8?B?NDJqZ3VrR1VRSm5BanJNelNGdjMvL1ZPdkRhR09CcEE1MnN4MklYMjA3S2xk?=
 =?utf-8?B?ZGlIbUE4dUxLVnAwdHAvR2RGdE5TTHFPbkg5UlZBWVhaanNuV0h6VUxOMW85?=
 =?utf-8?B?RU1neFFwa3FSb05VWGxEYm9YZ25FWkhrUFFSRVFESS91QTVaSUp2ZkhsRENN?=
 =?utf-8?B?VWVnczRHVDl4aGlpQWdRQWRZc08zVW02WXlBL21xOXkyVkR3S1J4ZnpUYjlm?=
 =?utf-8?B?TVpxMHlrUW9kZWJtWUkwZHZlNjhZRFIwSUlzbWFhRjNGQ1U5bzdDR1ZUWG5j?=
 =?utf-8?B?WWNrVVMrREphVFkxM2taWEpHZFBYYTdlcG9IcUFKRW16c0p2MExjWkdLMFF3?=
 =?utf-8?B?TloyY09JenFNU1prSWxXcFNBRnd3d2Z6ajAvcXU2WlBudkpFY0lUZ2NhTFNh?=
 =?utf-8?B?NlhlMDNJZkUrVU9iNkZVY25yYWl3MEFib1RST0dnUkhOZGVXeUZBY2lydFBK?=
 =?utf-8?B?dUp1cnkwZTdYTm51SHBVS2EwVGUwU3dIREpDekZhTWxDalRoSEhFcXhPc3FL?=
 =?utf-8?B?YlRHNnFpTEQvcW5iVzdEVklId2tiM1FWeGFCcE56VVBCbXRzVFRhakdOMnRh?=
 =?utf-8?B?Rmcrb3BCdmcxZ3ZkUkd2UUt6WTVvNU9MelY3TFd1NWZYall0V1JiUEVjMFE0?=
 =?utf-8?B?MEdscnF6TjRCZDVPYVBvQStDSDBZZ2h1Rm1tRGZ2dExmZ3ZLc0o4bG1HUzJ6?=
 =?utf-8?B?RXN0Z0xOR0Q4bUNNd0lWYjB1ODA1bGlleHFtQmlNL2hBOEo1YW10N20yZklm?=
 =?utf-8?B?VGxQbm9MSXkrMWQxQUN4RkxoaVppM2pqYjdZem1SaU80TGZkQklVUW1PNkRh?=
 =?utf-8?B?QjRZQnlhQnZmMDdQVW90RGs3bVI3YmRuaXVtZUJiV0oyQVFBTFZSQ0lGenN0?=
 =?utf-8?B?MlVhcG5QQmtSNC9oMGZ3NmJoOG4vWFc0dU5udVRHeCtEdElIS1YxVGgwNWoz?=
 =?utf-8?B?UDFVQytLOXV2SmJ6bXM4V1ZGWHhwTk5vUmV3UXBxQW5tTXcyRDkzQWYwS1I1?=
 =?utf-8?B?Rlh6VndKamZnTE4wUDJYUjNqRVpvd2VZQ3MrdjRURlcybTVZc1JoN3dvUVhr?=
 =?utf-8?B?azNVa3FWcW9HZ25NNlAzQlhGTFltTVNXODd3ZkdCMVBjL2lyVGNhaEtyNmdx?=
 =?utf-8?B?NWQyL2Iwd0NLUmR4bXd0dXA5UUt2bnBGd0lrYWNKNDE5cDdEVGVLY3d4c2pX?=
 =?utf-8?B?SkIwQ25OOWJGbENrRGM3cSs3b3hpV2JrRC9FSExqZlhjNDVuU1JQU1lqdTNs?=
 =?utf-8?B?cUxBNGNhSFZmdExhSmJQbHpjd2ZWOFBvbVhqV2c4SmwvL0s3ZWRhbXJ3VVhD?=
 =?utf-8?B?N05JWEo3ZEFWelFsZUpyZm84NEdaUUhINW9zeHh5Nmw0SUE5dU1uMFVpdVM2?=
 =?utf-8?B?ZjFjcnJMR0VHa3d0cksrcW50aGhRbU5rLzRjQVpldlRlWFRoeU1YcnluRDFD?=
 =?utf-8?B?UGZIR0pGR3prTDBEYzBqNy9oSnBXNEdwZmdKOC9IV2ZaSU9MaFZrWFVzTkNr?=
 =?utf-8?B?K1N5UExWRGE2M3dic3VQSHkxa1NIdW9aN2o1OGhPTVdQTlFFWld0ZzFwOWc1?=
 =?utf-8?B?WGdHYy8yTjNpRWJEN1hNU1ErSTY3enV4ckJzb0tENGZ5ZWZ1eHRsMExwVUs1?=
 =?utf-8?B?ai9pcVhrRmFOZmI4dzg3UC8yTjEwQXhoWE8vbjVzdXJhOUtXa3VuZ21uSzVY?=
 =?utf-8?B?ZFJDczQyRTJOUkF6M0lvcjliejZKOWtOTVRrdHkrelVKdGxaMTdqODNuUjM5?=
 =?utf-8?B?Wk9TVmk0ZHhEM3VNRTV6SGJNNmZSVnNOWUJrb3ZLT21ueFFPK293TmZ6cnpV?=
 =?utf-8?Q?LYtqI3K6PXSPfIT5lmNkqI0=3D?=
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c20ea422-ba04-4de9-db38-08d9985a1b3d
X-MS-Exchange-CrossTenant-AuthSource: HK0PR03MB3154.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2021 08:25:02.2462 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XLhbFrCQZyT2/YtLItEGmBA0ttd+zgh7qfiP1iuVrBxczngcd+/yeoNWFQEW1C1oNv60R45tLWyN5/WBqyYmFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR03MB3905
Cc: alsa-devel@alsa-project.org, WTLI@nuvoton.com, SJLIN0@nuvoton.com,
 KCHSU0@nuvoton.com, lgirdwood@gmail.com, YHCHuang@nuvoton.com,
 mac.chiang@intel.com
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

On 2021/10/25 =E4=B8=8B=E5=8D=88 08:26, Mark Brown wrote:
> On Mon, Oct 25, 2021 at 07:38:57PM +0800, David Lin wrote:
>> Use set_jack ops to set jack for new machine drivers. Meanwhile,
>> the old machine drivers can still call previous export function
>> "nau8825_enable_jack_detect".
>>
>> Signed-off-by: David Lin <CTLIN0@nuvoton.com>
>> Signed-off-by: Mac Chiang <mac.chiang@intel.com>
>> ---
> One other thing, sorry - your signoff should generally come last.  If
> Mac wrote this then the commit should say it comes from them, if you
> worked on it together then Co-developed-by is usually used.
Thanks for your suggestion. I will update on next submission.
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
