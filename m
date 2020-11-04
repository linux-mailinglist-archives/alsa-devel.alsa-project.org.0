Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F1D2A639F
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Nov 2020 12:51:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F4AB16A5;
	Wed,  4 Nov 2020 12:51:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F4AB16A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604490713;
	bh=fKXxz/xSskJhbHgBQvdBCy07IKcXXgnVRBxNjgvQPLg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I1kXdKlGhi0CwI7nDoK6a1DBK1untZ8mVEdHjf3pd88zKCNXcb5iwtcAMVJI0uzMi
	 0Mx53/m1OCYMoJd50Ja2Mo7N5tJg32ZVP9PkeQ61PCF6G2RNvhvNADw+5sRLpiXSnE
	 8s3semAHdLD9uLK2uf/90prDWlG1hVuPLxFBHo7U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A7C61F8015A;
	Wed,  4 Nov 2020 12:50:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F14E2F80234; Wed,  4 Nov 2020 12:50:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,PRX_BODY_78,
 RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE autolearn=disabled version=3.4.0
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310044.outbound.protection.outlook.com [40.107.131.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7AAECF80229
 for <alsa-devel@alsa-project.org>; Wed,  4 Nov 2020 12:50:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7AAECF80229
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nuvoton.onmicrosoft.com
 header.i=@nuvoton.onmicrosoft.com header.b="B3bpWAuH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eui2RCdghB857vu0hv24u6veERSpDGJhf1NI6m6D5VCer8NUBfZt9GZQRwOndAC1+Dyp+slM2cM9sXumq8RKXsTqq1qsTNVRTdrgyHy+8dgdu4QLNE45Xmt1oKhyfszx5w1e/06bfG2D14icdueY6koIyFIwyEC3lgz9Mvn77bHh6K9Ipf+r8+gCAZIuzgwhfYaUyVi7CGVTzfXW0CfvxQyMyZuKnj7I23o1BGVE+eQMTIIoqnk/f0pRmwpRu23YEZjU+NuPM0kHjZSBWx5fR9m+ba7T71UosByzqS+Dyc2fHUylQN+2PBqSmoSfuA+IcC5EQKUhGmfGtUD/mb9FMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZVfyK23Mr40Y5Sa0sfMFltf6P0FMT8GneXekAiyuVR8=;
 b=IjTVLcu6wIT3sB8LQYtc71lHz5PVoBPqy60j1hxbIKEQ9Ge4CDoU0Xj11KBPuyGIuQPXzBh01ECQ6Aaxvxzt8BUMZ36P9nN/cznQ2A8AGdilD7pjn5YwfSXY2DZ9t5jVBB/PeLzixfE9lHRVDbHBzUzMeJ8Ram9GBrz/VQ2AabMdSYXow2jruJSeqTOLJugCybuvYuGlk9Wm+12oZ3uDAT4g/ABT4oS4gu79GBN97iKeUevXBC5LjZMQK45aiVOVaQNXw3sckIOwxr5GvkxVSnOfQd0yWLyu/lA5jhHXh5TbU8LVhtEMJcVpR9oPQ34fmB/2ZUDAMF44ecapcET/yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nuvoton.com; dmarc=pass action=none header.from=nuvoton.com;
 dkim=pass header.d=nuvoton.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuvoton.onmicrosoft.com; s=selector2-nuvoton-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZVfyK23Mr40Y5Sa0sfMFltf6P0FMT8GneXekAiyuVR8=;
 b=B3bpWAuHbOB4PK6jPE53bsnDVlNpKxgsF7eiHmMB/h6X5ECb2uQ/dQ628/8G0mv0sM9++2AF1FRI8h1Wj9fmhB1CBE1/IoA93fhomeoumVauHAOmrWjEDHuTj2tCKaziC1IXbxNKki6Iv+uGWIJBDNmba60PWIQgyCrFSpFUOOI=
Authentication-Results: nuvoton.com; dkim=none (message not signed)
 header.d=none;nuvoton.com; dmarc=none action=none header.from=nuvoton.com;
Received: from HK0PR03MB3154.apcprd03.prod.outlook.com (2603:1096:203:44::11)
 by HK0PR03MB4884.apcprd03.prod.outlook.com (2603:1096:203:be::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.10; Wed, 4 Nov
 2020 11:50:04 +0000
Received: from HK0PR03MB3154.apcprd03.prod.outlook.com
 ([fe80::7c3e:ca32:232f:ef71]) by HK0PR03MB3154.apcprd03.prod.outlook.com
 ([fe80::7c3e:ca32:232f:ef71%6]) with mapi id 15.20.3541.015; Wed, 4 Nov 2020
 11:50:04 +0000
Subject: Re: [PATCH] ASoC: nau8315: add codec driver
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org
References: <20201102023212.594137-1-CTLIN0@nuvoton.com>
 <0adb99c2-d0d9-5052-c163-4d9a341239fc@linux.intel.com>
From: CTLIN0 <CTLIN0@nuvoton.com>
Message-ID: <da4d4666-3c91-16d7-926b-b339ae4e39be@nuvoton.com>
Date: Wed, 4 Nov 2020 19:49:56 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
In-Reply-To: <0adb99c2-d0d9-5052-c163-4d9a341239fc@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-Originating-IP: [27.247.235.104]
X-ClientProxiedBy: HK2PR02CA0139.apcprd02.prod.outlook.com
 (2603:1096:202:16::23) To HK0PR03MB3154.apcprd03.prod.outlook.com
 (2603:1096:203:44::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.43.101] (27.247.235.104) by
 HK2PR02CA0139.apcprd02.prod.outlook.com (2603:1096:202:16::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.18 via Frontend Transport; Wed, 4 Nov 2020 11:50:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a9dc4278-f161-485a-b513-08d880b7c463
X-MS-TrafficTypeDiagnostic: HK0PR03MB4884:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <HK0PR03MB48843DA21E158F45FDD0D44D8EEF0@HK0PR03MB4884.apcprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 54PmXXEU1qHsGP08qE/nThNclTM+hOmOnTF+um6OHyM3IuVI9Mx9/CdZxHeUTN25mL7E5w5wbIhgC6pw/1TV0fAXXVmg2C8n6LVrUS7xgKwN63mpZ3IMlEWFvI+dgOKMYfoLW8lT2heTrueZ59FaD5g6fkoEHd4k4ltQ8zMBxYYetS7J0C3bvsk2XbpHg3CX14aYDtm1iBkhlBNF8ykVR2WJwUWWzchH4grb+MXTsuc5q4Csn31ChQU0YjhJXBT/XuBCOXj0RumFBlkAGM/PTI90Ya4nhwZv3exUcGtLVOpKz5P5qRmvVJz1tEReLWL5LhCS6kAmOyrDZnrq6iWpWcjc1qR5yB9kPF6KV4W5NFvq5RGyn8sLjoUAt6IoTyjy
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR03MB3154.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(366004)(136003)(39860400002)(346002)(2906002)(186003)(5660300002)(36756003)(16526019)(83380400001)(8936002)(8676002)(6666004)(52116002)(31686004)(26005)(6486002)(2616005)(956004)(107886003)(86362001)(16576012)(66476007)(66556008)(66946007)(4326008)(31696002)(478600001)(316002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 6VyxZgNoRzhJoejnC/5jkfh9PDq/z/iwQFeehDfybpCZfAR1pXsMOtQxwBMls+3mz7AIaqWWSM58iTnAQejqonTSNFPuGAZYNznlu/gN73FNB3QGqKbhKjDG7SDZ5zuLKXhMgDUc0l9o+I3YAIEIbx2flNQlOAYK5dQb5G289L/bNjYw3/sTTH67mt+kY/AUjsTTGc9ydeAwcGXuchKqeeMprpekBFhUfn+auPHwKx/DtgwG5b+C8WzmOme6s1//3MGUrdxp/9fvJ9TNGwTZsmnAMqzphtXeBHGm91FNxlCIP9dDG0GKSUOHW1aP2Vm7yXNskV5QqSJZu+GcBGh1XZMIKE9zBmav4HkyfS3sMLhNRac4vRlcwOrM1KrrBLMitXz3mdPlh76lIPcwWYzMM2nL6kJHRlSeCNEnIRk/HUtwSx0gxcCsencPh0f3AzqhG0CKfEACk/vJ2A/T+gl90/yJrExfwJ8kp/SJTr0NxQS85CHZwCAd0zxm8NxMyukZWWRrtEYnEoU5p1xcXVeD2ku7P3Q/H32u9OMpB1mga6IR9vY8Ip3AzgOCXrpitPnulXInXQcSwtKiqmwuyrnC98o/tmILvsJMD/rwH7X7kJyLHAV1xdc5idupnhqyL+ZPoQezABYFt4GViRQPcfkDDQ==
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9dc4278-f161-485a-b513-08d880b7c463
X-MS-Exchange-CrossTenant-AuthSource: HK0PR03MB3154.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2020 11:50:03.8672 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CoPm31z2uoqjUsc01rYaosutE+bYo2MlG0Tttd43uSBssS2X4mhOIbveJU6XWjABZSswREjuJVXZOOs4CwK33Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR03MB4884
Cc: WTLI@nuvoton.com, YHCHuang@nuvoton.com, alsa-devel@alsa-project.org,
 KCHSU0@nuvoton.com, lgirdwood@gmail.com
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

On 2020/11/2 =E4=B8=8B=E5=8D=88 10:42, Pierre-Louis Bossart wrote:
>
>> +struct nau8315_priv {
>> +    struct gpio_desc *enable;
>> +    int enpin_switch;
>> +};
>> +
>> +static int nau8315_daiops_trigger(struct snd_pcm_substream *substream,
>> +        int cmd, struct snd_soc_dai *dai)
>> +{
>> +    struct snd_soc_component *component =3D dai->component;
>> +    struct nau8315_priv *nau8315 =3D
>> +        snd_soc_component_get_drvdata(component);
>> +
>> +    if (!nau8315->enable)
>> +        return 0;
>> +
>> +    switch (cmd) {
>> +    case SNDRV_PCM_TRIGGER_START:
>> +    case SNDRV_PCM_TRIGGER_RESUME:
>> +    case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
>> +        if (nau8315->enpin_switch) {
>> +            gpiod_set_value(nau8315->enable, 1);
>> +            dev_dbg(component->dev, "set enable to 1");
>> +        }
>
> I know the code is modeled after max98357a.c but I keep wondering if
> this enpin_switch state is actually useful for anything.
>
> Is there actually a case where the trigger happens before the
> DAPM_POST_PMU event handled below [1]?
>
Yes. Currently, I set event on DAPM just with SND_SOC_DAPM_POST_PMU or
SND_SOC_DAPM_POST_PMD, so these two specified events will be caught.

If I set SND_SOC_DAPM_PRE_PMU event, it can be caught, too.

>> +        break;
>> +    case SNDRV_PCM_TRIGGER_STOP:
>> +    case SNDRV_PCM_TRIGGER_SUSPEND:
>> +    case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
>> +        gpiod_set_value(nau8315->enable, 0);
>> +        dev_dbg(component->dev, "set enable to 0");
>> +        break;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static int nau8315_enpin_event(struct snd_soc_dapm_widget *w,
>> +        struct snd_kcontrol *kcontrol, int event)
>> +{
>> +    struct snd_soc_component *component =3D
>> +        snd_soc_dapm_to_component(w->dapm);
>> +    struct nau8315_priv *nau8315 =3D
>> +        snd_soc_component_get_drvdata(component);
>> +
>
> [1]
>
>> +    if (event & SND_SOC_DAPM_POST_PMU)
>> +        nau8315->enpin_switch =3D 1;
>> +    else if (event & SND_SOC_DAPM_POST_PMD)
>> +        nau8315->enpin_switch =3D 0;
>
> And even if this variable was useful, for symmetry should it be
> PRE_PMU/POST_PMD?
>
Yes, I agree with your opinion.

 From the above description, I suppose you might want to point whether
the dapm widget of EN_PIN is redundant, right? That's a reason the
physical hardware pin is set to high/low in trigger function point of
snd_soc_dai_ops, it always occurred after dapm event.
If yes, from my current platform of verification, even if the dapm
widget of EN_PIN is removed, the result of sound output is same yet.
Maybe the first version, I should submit a simpler version.

>> +
>> +    return 0;
>> +}
>> +
>> +static const struct snd_soc_dapm_widget nau8315_dapm_widgets[] =3D {
>> +    SND_SOC_DAPM_OUTPUT("Speaker"),
>> +    SND_SOC_DAPM_OUT_DRV_E("EN_Pin", SND_SOC_NOPM, 0, 0, NULL, 0,
>> +            nau8315_enpin_event,
>> +            SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_POST_PMD),
>> +};
>> +
>> +static const struct snd_soc_dapm_route nau8315_dapm_routes[] =3D {
>> +    {"EN_Pin", NULL, "HiFi Playback"},
>> +    {"Speaker", NULL, "EN_Pin"},
>> +};
>> +
>> +static const struct snd_soc_component_driver
>> nau8315_component_driver =3D {
>> +    .dapm_widgets        =3D nau8315_dapm_widgets,
>> +    .num_dapm_widgets    =3D ARRAY_SIZE(nau8315_dapm_widgets),
>> +    .dapm_routes        =3D nau8315_dapm_routes,
>> +    .num_dapm_routes    =3D ARRAY_SIZE(nau8315_dapm_routes),
>> +    .idle_bias_on        =3D 1,
>> +    .use_pmdown_time    =3D 1,
>
> is this necessary? This has the side effect of powering-down
> immediately instead of after a delay.
Yes, I follow most of drivers to use this flag.
>
>> +    .endianness        =3D 1,
>> +    .non_legacy_dai_naming    =3D 1,
>> +};
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
