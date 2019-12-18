Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2AB123FA4
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Dec 2019 07:33:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A91E1660;
	Wed, 18 Dec 2019 07:32:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A91E1660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576650813;
	bh=t7QvAhPWmiIzFZwP6c+4AaWlK93MnH8VXoHqW5hebx4=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rbCA87aoC82ZPHnJEzF0aQ04RpdwY4ahG4ySVMDiqgegeD3s75AlSgPmLvzsmGms9
	 sgqoi26NsrxAs4UpNt6xQUQiAFp0Y2QnlDD5qsZzSxL0sT0Il0C1hqqmHygBaDfYmn
	 Z9N5BozmV+yJtZBaSI2gAlXw9uzk0RK1HEwwtPRU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 79691F80255;
	Wed, 18 Dec 2019 07:31:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B08E1F8022C; Wed, 18 Dec 2019 07:31:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,SPF_HELO_PASS,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2054.outbound.protection.outlook.com [40.107.223.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B428AF80059
 for <alsa-devel@alsa-project.org>; Wed, 18 Dec 2019 07:31:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B428AF80059
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="YHW6uvi5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iJo8Xv14UVhi7ASwT6AgVNScETf49rbnzs3s5ctZbyZyccAOCiL5uHgbJjr3IL82bL+E0A57jTY1YAjAwfrZT+vhrq95WZfHvI554FNJEZA2cMyT+nEQuWQRwx2OpxGwP9D/FSod0sUa5YVDVIf0Xm2O8XD/34Qt9feA95d/VvoOLUpKArmm6q5jfWP/LQdXE+lsw3hfpxnBeZp0xpr3Ob052n3bXlfl46nerhz0DRdvFtqCaW/TVzXvcSu8YA0eNNohSXkEFx13JXr/LhBazTxtTRD+TEUxeQl8yBbbs5ljgVEINMcLQapnwjzHK1AYZo71PODojOnFAhPRr5Wv2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=apHv+0GPRsLdUmX9eggFiu9bWaN5GuejZLELOFj/y7A=;
 b=kqIfCxLhyBplu/JHUAB3PuLGovhOJ0dTbtJlf5CkJDDzE7qLDqmKOhk8BrDURI121w30PT0F/lrPrGW4LLIQn4aZHyd2LXWSrT+NL1DOozgyAu4WNbTYu/uEUw/+Ikqo6xVv15ePKUqfXOKbimHZsLXMRcv+D2EnW4VNsYApRbocEnB3SJ4nZpK/EL3Lubdf6XUJPKWXUbIUhIxS6nmWutKlSArpwBCw+g2zizzegTondwJp3KZUAttD8GNtP+6KPLZIq2mtjnidoaFJbhHv5Ppz+hM5/HIK1gP2FmmArRdECOQIHE11eCnpD6CtpfgowwDbGp6F5/nwmYigujuH1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=apHv+0GPRsLdUmX9eggFiu9bWaN5GuejZLELOFj/y7A=;
 b=YHW6uvi5bMWqGcWA3uV4s1NWxO/clxxhV/mpUQyk662bm3zqPSBckoOEy/3QnCrBOxk1nEsaxroRY6mn0KwmvqkRny7D1tNUsM0Kujw2rhee/DHhSJwudIhoT+WmFDE5thZHa/fUMLbLkvAv0eH77NAfMZZbBSBEcM0HqV/46TQ=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Vishnuvardhanrao.Ravulapati@amd.com; 
Received: from DM6PR12MB3868.namprd12.prod.outlook.com (10.255.173.213) by
 DM6PR12MB3706.namprd12.prod.outlook.com (10.255.174.219) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.14; Wed, 18 Dec 2019 06:31:37 +0000
Received: from DM6PR12MB3868.namprd12.prod.outlook.com
 ([fe80::cd29:4d84:9dbf:c632]) by DM6PR12MB3868.namprd12.prod.outlook.com
 ([fe80::cd29:4d84:9dbf:c632%7]) with mapi id 15.20.2538.019; Wed, 18 Dec 2019
 06:31:37 +0000
To: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
References: <1575553053-18344-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
 <1575553053-18344-8-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
From: vishnu <vravulap@amd.com>
Message-ID: <3688990f-0ac3-08bf-20b8-93a4ab17441e@amd.com>
Date: Wed, 18 Dec 2019 11:59:56 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
In-Reply-To: <1575553053-18344-8-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
Content-Language: en-US
X-ClientProxiedBy: MA1PR0101CA0021.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:21::31) To DM6PR12MB3868.namprd12.prod.outlook.com
 (2603:10b6:5:1c8::21)
MIME-Version: 1.0
X-Originating-IP: [165.204.159.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 64aa55aa-6f76-4ace-a441-08d78383eee8
X-MS-TrafficTypeDiagnostic: DM6PR12MB3706:|DM6PR12MB3706:|DM6PR12MB3706:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB37060B16BB701138CDBA9003E7530@DM6PR12MB3706.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 0255DF69B9
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(396003)(136003)(376002)(39860400002)(346002)(189003)(199004)(6862004)(6486002)(8936002)(2906002)(66476007)(316002)(2616005)(66556008)(81166006)(81156014)(52116002)(8676002)(5660300002)(66946007)(37006003)(36756003)(6512007)(4326008)(478600001)(31686004)(186003)(54906003)(26005)(6506007)(31696002)(6666004)(7416002)(53546011)(6636002)(43062003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3706;
 H:DM6PR12MB3868.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ug2t8DUNy0Rz4myfZpnIm8/iIKwgaCk6LkfHgvtwmNRLHJsMm/MlPfV6Krdz2vKK81PaW5lJzsPvhQuwsyOvilNyOSNdIChvqCC6ut2NB/b5T5AyRbUhaFya+jOZW/7BsPqFpzl2Vc1UI5jJJyuP4vMnvDWUO7aGqXyFrE07k1RByxlcwnk3PmxH38RG9cuR6QTL5CnVacG87ZzY/KXCe4r1cXhlbIQb/so3RjE2owbxsBQZH9a1GlvzhY16SyzVZsyLQxEq90Ntg7ShnuXf50P5ho0JfyUhzwk39lkiZZQs8lc+MnDbVs/SM0y+qAgd3l6MIU5hYcvEo4DcHjXtxlb/pKzJV3nck53ELUtgOml1G69Mhe5GabSrppinJKJZwhMuelDOCISYh61xn8gMXFWl4kBaYjlKGiqUvTjECZJtxpUSFQEkvSV4Vq4NNM25QViZ7+Mg/qaC8BcuJDir5UuBfuKAgO2bXQEDGGm8deg7RSNZpbYNejJ/TYs+6To+
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64aa55aa-6f76-4ace-a441-08d78383eee8
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2019 06:31:37.1301 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XyNWhT2QSKC+fyEHsLFKXaFF56uP6HvZeOTTDnVXtS396Uy8z7Y0HfP4Zf30/VA/ul+2xjjINKgPQ9DfMCcyrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3706
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, open list <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, YueHaibing <yuehaibing@huawei.com>,
 pierre-louis.bossart@linux.intel.com,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Mark Brown <broonie@kernel.org>, djkurtz@google.com,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Alexander.Deucher@amd.com,
 "Tabian, Reza" <Reza.Tabian@amd.com>
Subject: Re: [alsa-devel] [PATCH v14 7/7] ASoC: amd MMAP_INTERLEAVED Support
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Mark,

Patches have been reviewed by Dan and pierre-louis.bossart@linux.intel.com

Please can you upstream these please.

Regards,
Vishnu

On 05/12/19 7:07 PM, Ravulapati Vishnu vardhan rao wrote:
> ACP-I2S device support MMAP_INTERLEAVED.
> Added support for the same.
> 
> Signed-off-by: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
> ---
>   sound/soc/amd/raven/acp3x-pcm-dma.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/amd/raven/acp3x-pcm-dma.c b/sound/soc/amd/raven/acp3x-pcm-dma.c
> index 916f0d8..28a3081 100644
> --- a/sound/soc/amd/raven/acp3x-pcm-dma.c
> +++ b/sound/soc/amd/raven/acp3x-pcm-dma.c
> @@ -22,6 +22,7 @@ static const struct snd_pcm_hardware acp3x_pcm_hardware_playback = {
>   	.info = SNDRV_PCM_INFO_INTERLEAVED |
>   		SNDRV_PCM_INFO_BLOCK_TRANSFER |
>   		SNDRV_PCM_INFO_BATCH |
> +		SNDRV_PCM_INFO_MMAP | SNDRV_PCM_INFO_MMAP_VALID |
>   		SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_RESUME,
>   	.formats = SNDRV_PCM_FMTBIT_S16_LE |  SNDRV_PCM_FMTBIT_S8 |
>   		   SNDRV_PCM_FMTBIT_U8 | SNDRV_PCM_FMTBIT_S24_LE |
> @@ -42,7 +43,8 @@ static const struct snd_pcm_hardware acp3x_pcm_hardware_capture = {
>   	.info = SNDRV_PCM_INFO_INTERLEAVED |
>   		SNDRV_PCM_INFO_BLOCK_TRANSFER |
>   		SNDRV_PCM_INFO_BATCH |
> -	    SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_RESUME,
> +		SNDRV_PCM_INFO_MMAP | SNDRV_PCM_INFO_MMAP_VALID |
> +		SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_RESUME,
>   	.formats = SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S8 |
>   		   SNDRV_PCM_FMTBIT_U8 | SNDRV_PCM_FMTBIT_S24_LE |
>   		   SNDRV_PCM_FMTBIT_S32_LE,
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
