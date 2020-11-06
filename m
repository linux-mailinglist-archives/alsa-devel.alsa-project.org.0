Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B022A8D8A
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Nov 2020 04:33:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7ED741670;
	Fri,  6 Nov 2020 04:32:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7ED741670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604633621;
	bh=2UoMiOLzWDrhwMIbaLK4FLFQIocJaoJr4ktHnT4tlCE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oEci45JoSKbifA3DSgpS175/Bi2UPA7D5ohZMF4VeniVQ7bn1XJhNwAC8qHia437t
	 /E5H191R1V1mIVXJ47BS7JHJN6kJV4ClQOHmtO+79Tlcooz2TEYUX4hFgWckJQ1Jdl
	 k+4jzboiQQbdNCvEW8Wr65j1gZvIc1zn3UPdIq1w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DD0D1F8023E;
	Fri,  6 Nov 2020 04:32:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 49AF3F80234; Fri,  6 Nov 2020 04:32:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,PRX_BODY_78,
 RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300044.outbound.protection.outlook.com [40.107.130.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E11EF80150
 for <alsa-devel@alsa-project.org>; Fri,  6 Nov 2020 04:31:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E11EF80150
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nuvoton.onmicrosoft.com
 header.i=@nuvoton.onmicrosoft.com header.b="cHTTWYlt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AUPmKVpzBV6PmvD9qp56/A5izyzAqJvb3rWUhicSUSVWfp3ifDthONwWuN3TxJWxJ7Tx7Ib3cf+xwnPHrH9jROLnBJpjbM/ViRRrTbWNku5PcHMhdYNShw5Ub5lqPCedmW8XEoL06aL2cU3xCYEMnP6wzRVRkB/ZRgRMdCDRxTzmOXBpfnI1sY/fMkVrBsyt+Me9ulqYX/28SDCgAC4UWryCYoTMRbaPzw8ViA3Oti7heGUJtuiPUDvl9MEDRiS8AI+G8tnr1/7qBRL6ueGTNLAzLHZMpG84T5nsidVEknUWkyXlJbXBuOMwtol4GRC+8vvR0osCNiDYzAxfL+UMZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2UoMiOLzWDrhwMIbaLK4FLFQIocJaoJr4ktHnT4tlCE=;
 b=gcKDRlu6eQVPgMyHK5mSnXQ7lcaEOWugHbYzXHr8P5SXnT6Nk4EGhuIwyzeETZuKsuHFh4pCCBc++poYamLsoKXnwruhqCahiDYcLVK1hLeh7xuKrRfnzfLCUwJSNEyGHg8gZqdE7VrQfncNpMu5R0vLAtxV6vC0l0rVkI033mAUmubp/dOu8Z7kfuzNm5kT40qcIGl7nheNxxfjZz/2MReIriLMQitxeVPZ8YNULRD5o0a2gTpkt+FxcxqpALjX5/RubZ/XBBindEWdl1hKDnXvRH95w4iY9ZvHlrVqaiZTCLLFdOP5pntd6oyISoNv6+yNEfckMZsXIW/9HKIfgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nuvoton.com; dmarc=pass action=none header.from=nuvoton.com;
 dkim=pass header.d=nuvoton.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuvoton.onmicrosoft.com; s=selector2-nuvoton-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2UoMiOLzWDrhwMIbaLK4FLFQIocJaoJr4ktHnT4tlCE=;
 b=cHTTWYlt3lQTCsk/PWA+/T394RYPwdUnqqm8Wpm4FA+bjDOMBcDDPVj1vn/2yeq1VOmnySg1BYBg1HGlzh8ym6rNEw+h/Xu/RmO5OePBUEd79G2Rk7yYNfJbgFpIlCAzp7+mjvZsV7hPRyPH3plbnN44x02XFvHorXFqRM/tffE=
Authentication-Results: nuvoton.com; dkim=none (message not signed)
 header.d=none;nuvoton.com; dmarc=none action=none header.from=nuvoton.com;
Received: from HK0PR03MB3154.apcprd03.prod.outlook.com (2603:1096:203:44::11)
 by HK2PR03MB4547.apcprd03.prod.outlook.com (2603:1096:202:1d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.10; Fri, 6 Nov
 2020 03:31:44 +0000
Received: from HK0PR03MB3154.apcprd03.prod.outlook.com
 ([fe80::7c3e:ca32:232f:ef71]) by HK0PR03MB3154.apcprd03.prod.outlook.com
 ([fe80::7c3e:ca32:232f:ef71%6]) with mapi id 15.20.3541.021; Fri, 6 Nov 2020
 03:31:44 +0000
Subject: Re: [PATCH] ASoC: nau8315: add codec driver
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Tzung-Bi Shih <tzungbi@google.com>
References: <20201102023212.594137-1-CTLIN0@nuvoton.com>
 <0adb99c2-d0d9-5052-c163-4d9a341239fc@linux.intel.com>
 <da4d4666-3c91-16d7-926b-b339ae4e39be@nuvoton.com>
 <da9232f9-15c9-01ea-44cf-107ff4dd6c58@linux.intel.com>
 <CA+Px+wVGosx=pmSkJKtYd9dQZ98D0aYG0KaDq6-ov67UoiV8Jw@mail.gmail.com>
 <20201105150249.GC4856@sirena.org.uk>
 <bd3d3b6f-2cca-cd4b-2eff-b32792b3b2e4@linux.intel.com>
From: CTLIN0 <CTLIN0@nuvoton.com>
Message-ID: <b1b1efee-b19e-2d5c-3806-5532c39c7c47@nuvoton.com>
Date: Fri, 6 Nov 2020 11:31:36 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
In-Reply-To: <bd3d3b6f-2cca-cd4b-2eff-b32792b3b2e4@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-Originating-IP: [27.247.235.104]
X-ClientProxiedBy: HK2PR04CA0089.apcprd04.prod.outlook.com
 (2603:1096:202:15::33) To HK0PR03MB3154.apcprd03.prod.outlook.com
 (2603:1096:203:44::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.43.101] (27.247.235.104) by
 HK2PR04CA0089.apcprd04.prod.outlook.com (2603:1096:202:15::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.21 via Frontend Transport; Fri, 6 Nov 2020 03:31:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e3e5854c-e024-408d-155e-08d882047bc3
X-MS-TrafficTypeDiagnostic: HK2PR03MB4547:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <HK2PR03MB4547B72DBF709E6F7A3C60438EED0@HK2PR03MB4547.apcprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nLS0Cpeg/huFHtJ8H0oA18ZTAm+cAPnGU7yNiNuBWMZWXYFzbvkhGw1r9PVa4yjoJ3DDsr5oWurAi3h/VMEjy9VqXA6tQ7sA+d07g5qpNJTyxcg2v5Ewk2UiP8gipdFOdpyYt7bdtU6exLd7D8ZrOnCQafNE7iSmJ3+w+YARbksxxN2/YXBXIKl3zATZbz2Gz8fPbUj19tBXv17T4kS1VGfN9S4XG/1e74h36CjWXWSDp1v56UnoWKS0Pl92vDHPuOH8F6XUOOsCD9JHNuujWXhZ4yBj8GbBBtVtvd5QEQzi3x0JXMfSarsHUWPubD0MpeVCM9hEBU7XP+XBp8ulxFEXsVQxAzWj/wQmssJMVc2nU4McmCGS6XpmxfCPZURk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR03MB3154.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(39850400004)(346002)(136003)(366004)(83380400001)(31696002)(66476007)(2616005)(956004)(16526019)(5660300002)(86362001)(2906002)(4326008)(8676002)(107886003)(54906003)(66946007)(66556008)(316002)(110136005)(186003)(478600001)(8936002)(16576012)(31686004)(6666004)(52116002)(6486002)(26005)(36756003)(53546011)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: osWHJB9FJN9LHrveitXeiTtbm2U0nJKqtBumdJ83SvpsnIiNZALLb5aiz9829gkQyclRSBBy5GoGhAPKvH/pcLRpmd1Mx3ASriy61ktPeXke/B+bOGYqqiPqsYTCQxODPp4T68otgn6XI7helPReU70qoW+eD+wKzwL7JAcpVJXY3fOYelCXIYSuIYnOP6YKt0vCr2+6T3ZcDAY8TcI8TKrGRizcjCt8c03nmj2cv6ObFGLpvFYv+NwtsGmR2yAz44MaFE6MRgDND0jxD7TSc00W29FCTGXMQlkPW4BGSUBLH7IxxN+siPm3iB/HTYHwCPwu7UWlqxgykn7BjszpvEYd2zcYagc6hTsh4j0IW3WRtqE7J6sDhQ5lgt4CIVowhR3pGQ7WFAJOCBCNfrIS6Y/WqDOZUm9mTp21TbXQj4mzxbmWzR0Lt88sSakWK8oXizKCn0zoy4JdN4NJL0QvfYQLJrjfPBDW1L0StPm05SXGb1eyRTV5Nu+pEWD7UV/wWcsQYMue+V/kZW17DyXgOh1LvRXJkI9WtevC+JxzrSGS/TYXUxSVgKj8lDro3RD0lHT1vqlkPF7Zui1+2lB4cEwhkhzBqLaHVlJ3LR71Elnhmx5m1Jq1k455YqtD7ujaAywP4lJFsUj2tN4vweWMAw==
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3e5854c-e024-408d-155e-08d882047bc3
X-MS-Exchange-CrossTenant-AuthSource: HK0PR03MB3154.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2020 03:31:44.2986 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lmc2h4ye7B6zAfOIOhGQJS7cypT7s+k17DpadiJWT7bF42lcHKOkfrxLzfl5EUJaiTnTMPxh3T9S1rDy9m8e7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR03MB4547
Cc: WTLI@nuvoton.com, YHCHuang@nuvoton.com,
 ALSA development <alsa-devel@alsa-project.org>, KCHSU0@nuvoton.com,
 Liam Girdwood <lgirdwood@gmail.com>
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

On 2020/11/6 =E4=B8=8A=E5=8D=88 12:21, Pierre-Louis Bossart wrote:
>
>
> On 11/5/20 9:02 AM, Mark Brown wrote:
>> On Thu, Nov 05, 2020 at 10:20:33AM +0800, Tzung-Bi Shih wrote:
>>
>>> If nau8315 doesn't share I2S with other components for now, it could
>>> be better to not introduce the software mute control.
>>
>> The mute callback is there because there's some controllers that don't
>> start up cleanly and end up outputing glitches (for example due to not
>> being able to flush their FIFOs) - keeping the CODEC muted until after
>> the I2S is running covers those glitches.
>
> Thanks for explaining those dependencies. The code looks good to me:
>
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>
Thanks for your comments. However, I also agree the opinion from
Tzung-Bi Shih @ Google.
May I confirm whether I should keep this patch, and remove dapm widget
of EN_PIN next patch?
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
