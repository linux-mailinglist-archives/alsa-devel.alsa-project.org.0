Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A86A18C64B
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Mar 2020 05:11:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 876FE1788;
	Fri, 20 Mar 2020 05:10:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 876FE1788
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584677497;
	bh=PSuxwCNLJW4UjMNpkAJkG6KxJQsPQZHLFdmudMIzX0E=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LuFERN9M7wBLDVTnKPGAjpGB0ClDO9XXU5TXLjMDko89eYB0ULyZURqApHhbvvovp
	 czYxTVL1AU6ZDXg/DjiObFsDSZ7+7vxBiFaUdmYPAWel8Q2xHGE8JZeYXoncGasaFq
	 JkI/5geU4PvbjuhThOFYAg32QfGxdz+EBCd/PQIM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 59ECAF800C0;
	Fri, 20 Mar 2020 05:09:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C3117F8015B; Fri, 20 Mar 2020 05:09:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,MSGID_FROM_MTA_HEADER,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760059.outbound.protection.outlook.com [40.107.76.59])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1B897F800C0
 for <alsa-devel@alsa-project.org>; Fri, 20 Mar 2020 05:09:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B897F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="Xgso1hFm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aWqa08u+WJedIv+l+9/3QDqI/XerplcGO8sg1Pysf9S7sZwepSFAxMA2QplXwhd4fhlLYS1RXuWRWrKlYD8CYU5+2wyfA8b11e1PH0Sc+aXlnAmYgBw/GHwNg9c5u5W3xbe4huDaU49JFVFlEFlKCntA9Hj3d4A1x48ZM5cbDJ3TveI+R2KsKjbew3drdE474CxTFv4l7uXqs902OFxi8BPAuPAopVCdBFOSVOqGZfireFv4KluThzPOymK4A/SadCog83EhqSBn0+gmzv99CkgoP0pegAR6gDALkhP/yF7H0xscAbxC9jNR/4tK6/ly3wCf07R+JOdC5U74Mpn4+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Td0fQzCqepjOKQ+mNnZKkgvQQBoo9nSqasoOF9gOvE=;
 b=A0upWZPMMg2J0TRxwMynZQdFU1Z+f4pFraHVci4g2FajnruxwfKAc6vt/3rpBWXe3bmBI32NYAD6IU7QLWQdGSYdTPFAznkpenlUrap+1xvoWYzM8LMAl0x+t8wem7moa8EAj0h/7mDU8WGdv3hUX7lpC9emEOg9lbh5/HO1PwiYVwzjUsDW+hcXLd+0ucH7fmRPfQL1awK+KItr2xOlavydYxvH21TgAGoezH/EEXKv0GoHEEAEsSzz/i4C5H43nXz1Grmdx0ZJ3qgUw6iNMsXBcXxTjGhwX+32M8T5VsprFwjT30jmHhIh9yiLRpjbdyxPDuPbDg0eDvNAwizCAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Td0fQzCqepjOKQ+mNnZKkgvQQBoo9nSqasoOF9gOvE=;
 b=Xgso1hFmhLlYz8EGLT9HVMAX2CCDkWe7cHTGT8xrZxH2Z5uD+Il3bGvlNTbCc4Yp4PxAStq8YayhF6rUkCNUxoc8Dpub+OV/QQgIienNo+JaVEA7JeFRGIRNK7Extnp3z67/oYo/Dk0YlyX1kLcKnJtzeCSflenf6wC2X811uiM=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Akshu.Agrawal@amd.com; 
Received: from DM5PR12MB1849.namprd12.prod.outlook.com (2603:10b6:3:107::23)
 by DM5PR12MB2486.namprd12.prod.outlook.com (2603:10b6:4:b2::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.20; Fri, 20 Mar
 2020 04:09:36 +0000
Received: from DM5PR12MB1849.namprd12.prod.outlook.com
 ([fe80::8557:da95:cb3f:f37a]) by DM5PR12MB1849.namprd12.prod.outlook.com
 ([fe80::8557:da95:cb3f:f37a%8]) with mapi id 15.20.2835.017; Fri, 20 Mar 2020
 04:09:36 +0000
Subject: Re: [PATCH] ASoC: amd: Changing Audio Format does not reflect.
To: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
References: <1584616991-27348-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
From: "Agrawal, Akshu" <aagrawal2@amd.com>
Message-ID: <8b1ab5dd-954e-29b7-b51f-f8c3e09a1521@amd.com>
Date: Fri, 20 Mar 2020 09:39:21 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
In-Reply-To: <1584616991-27348-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: PN1PR0101CA0040.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c00:c::26) To DM5PR12MB1849.namprd12.prod.outlook.com
 (2603:10b6:3:107::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.32.35] (165.204.159.242) by
 PN1PR0101CA0040.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00:c::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.19 via Frontend
 Transport; Fri, 20 Mar 2020 04:09:28 +0000
X-Originating-IP: [165.204.159.242]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ad0a8dcb-b965-4199-5e65-08d7cc848058
X-MS-TrafficTypeDiagnostic: DM5PR12MB2486:|DM5PR12MB2486:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB2486876A00F580E6B09DFF4AF8F50@DM5PR12MB2486.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 03484C0ABF
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(366004)(136003)(39860400002)(376002)(199004)(52116002)(16576012)(36756003)(316002)(37006003)(956004)(2616005)(54906003)(16526019)(53546011)(186003)(5660300002)(66556008)(26005)(2906002)(66476007)(66946007)(8936002)(31696002)(6486002)(81156014)(31686004)(6666004)(8676002)(81166006)(478600001)(6636002)(6862004)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2486;
 H:DM5PR12MB1849.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5dVrL3yn0nHp/iYZkV0+FmY0jL8+wJ8vvE1PVmmi7Vd5i6G6eSP1wZ0GwM2xfVUoBgOeuatBWPzIURB85Qemf9US3eKD9Xtl3WfGPn6EhF+b1I0ZWR80vQyJ6jqZTLRFtK0lq6njKbK1dqIzhXkIdvM/ssjkcV/bTQMbVE7VuJTg4+9bSlPmSO8nWt/yO7LHLC5vaBdwCNQ9An2WznufYjwOW/eEgFcgRwAJ7VqTpPju8zpNoUT1tykZgGomyhv3YNWVKK6gmrFJHj30uipYaiX9XPdqk4hP+VwIfB9N4G+ixusDKkp2Nz0lUzdlW0QqKwr8t2e2a+iCPI2YxQUziK6B9lyyBMT8u6FjbbORrPfIat82EniMg0sUYTxESQ3/7NuBwxzHZsP1fUiMuXJm5Of3uQVSQoQmyX4i52L/FVRcABYG0+by+a2hHOGW6nbN
X-MS-Exchange-AntiSpam-MessageData: mkqLAvhy2F07y17z+KjlVdaujYsPKoetzlUcIXUhpJFnxPdq4nRSqU1KZ7hhrBOYCwfwnAnxceo/OwEr641CfjgOgeqZAP4Eg+KyJgyxmyu+ToClbuwuVXtv6kL6v0nE3YoXlQV2wugEgq+9VM+OHg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad0a8dcb-b965-4199-5e65-08d7cc848058
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2020 04:09:36.3815 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pgVcDxTI87IUz7FpLo5xeUv/oSVTfjSXbdEX/QQJN+a4t9prL1aXDyhUUDQhFgvZwrpXDaa/uoe1hxRymB1YAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2486
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Liam Girdwood <lgirdwood@gmail.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Akshu Agrawal <akshu.agrawal@amd.com>, broonie@kernel.org,
 Wei Yongjun <weiyongjun1@huawei.com>, Alexander.Deucher@amd.com
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


On 3/19/2020 4:52 PM, Ravulapati Vishnu vardhan rao wrote:
> When you run aplay subsequently as below by changing the stream format:
>
> aplay -Dhw:2,0 -c2 -fS16_LE -r48000 /dev/zero -vv -d 5;aplay -Dhw:2,0
> -c2 -fS24_LE -r48000 /dev/zero -vv
> as a single command, the format gets corrupted and audio does not play.
>
> So clear the ACP_(I2S/BT)TDM_ITER/IRER register when dma stops.
>
> Signed-off-by: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
> ---
>   sound/soc/amd/raven/acp3x-i2s.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/sound/soc/amd/raven/acp3x-i2s.c b/sound/soc/amd/raven/acp3x-i2s.c
> index 3a3c47e..b07c50a 100644
> --- a/sound/soc/amd/raven/acp3x-i2s.c
> +++ b/sound/soc/amd/raven/acp3x-i2s.c
> @@ -240,9 +240,7 @@ static int acp3x_i2s_trigger(struct snd_pcm_substream *substream,
>   				reg_val = mmACP_I2STDM_IRER;
>   			}
>   		}
> -		val = rv_readl(rtd->acp3x_base + reg_val);
> -		val = val & ~BIT(0);
> -		rv_writel(val, rtd->acp3x_base + reg_val);
> +		rv_writel(0, rtd->acp3x_base + reg_val);

Clearing the entire register might result in issues.

IMO better fix is to have a sample_len mask for ITER and IRER register.

Use it to clear sample length bits in acp3x_i2s_hwparams function before 
setting the new format resolution.


Thanks,

Akshu

