Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79DCC3622B8
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Apr 2021 16:51:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 05CBA1693;
	Fri, 16 Apr 2021 16:50:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 05CBA1693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618584694;
	bh=si1QPZ2flPUrmkT5PWH6Ow8cJDHjPMMu995EBXe3zDU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UTTpZCILVTuwvgN5473GaEveIok2QHYgRZEr8hEbnU+HpBw0QQ/cCc1kuS/+jz944
	 TiHn7m+CoWOJnncRIMSSR1XEKL/Cq1tKXpY7O+Z7mL4b0BLOUmVpIzs1+N+tyWPyxR
	 z9hS5j4L+zd7kJupAfh3zqGslUJ3PxUQLni7pjSg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D5BEF800B9;
	Fri, 16 Apr 2021 16:50:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13A7CF8025B; Fri, 16 Apr 2021 16:50:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060.outbound.protection.outlook.com [40.107.220.60])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 70E32F800B9
 for <alsa-devel@alsa-project.org>; Fri, 16 Apr 2021 16:49:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70E32F800B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="UcceKhFC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BOYFbqcTk6AIJx3V26xi2jcqoSUEJJzr9n4dt9WyzzPMb9EAZ5HJUd/SX/1P5nO8pdzvHDceMvPtKv7mb4EOKftEK+oUbrWjLJLXsfojml5BXdgR5KxuJhg8pXH5O16k2SzR4erVPON84EPfFlkFM47fmGaPEeFP2ey4VkSvn33pog6czleOQLyRjf+8YBcqB3gNAExgZYRgQ8MghL464LN1hApugJzHJiNgg4r1/3C5tjyZ1X8EPKfC2LqU9Aut05VhzA+eT8JquEzLBMO/KpB521lsk+vnXKUjLcf+TkIPnWgsUAXR4BsBrJzMvSmdbj/9VTQl20ZsY3o2MYgiuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HJuj4BtRWIe/ZeGERCq8vEUa+bVMqPTaI9k4+0Oc2RM=;
 b=aUAa0sUHYrSyF+dqr0NwksUlbwTAC7NePObeGAYfBeV9NtUriXJIrNLStcq3z9z13McUfJGdLD4OslEd9q4XosUjkpuE5zhqKjW76K0Dg8LKBZlwM1wYUMnExsfA+xdnYXUWVfn1c6mE3/oVxtbNykqxdWGLRAfS54FY/TppFPylVnZY3fnOOkyR4YnrjRjAiHFbNnWAbXRQYJ9ofaOR+0q3FiUXACyIfLQWSyL34Vrj93TNdXv2UTfecbv7iH375elQpLrxTzkFE6YluX6vNLAiz7fNsiBp9lI6Db5ZJAmfpI0YgI95bwshL09vxddDTwfKCIWl2R9WXTCCpo7Tcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.35) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HJuj4BtRWIe/ZeGERCq8vEUa+bVMqPTaI9k4+0Oc2RM=;
 b=UcceKhFC5qhQWBrBsL3S8MiDQGIvmEgXtokQqUWc/r9MnuiWubzgiLSW6NckCoIMUtNISc/H25wb+PThf2yeTf5qtZTz6AwF9Zm6DTSGV5A+RoBD8Lj8XNeAsuNIA6p6UBdN04OgBCt3G0REDO5GIX3QkvtW9x1X9yCF8ivNclImsNj89JfVjtZMZ/KT6tOGdxJHUx6ijsu+DE2XU63J8htaeYeJnBlGJqrRXZzQYBnbG3nRI+xvXQy1FlXxbLMAzZpsoe8THihgPFiHVLyXw2z/YcHOr2RHwP+PcUE484cG9ajRXe0MXkZfvjJjGXFMlrQDeZsv7iW/ga5h2AQZmA==
Received: from DM6PR03CA0072.namprd03.prod.outlook.com (2603:10b6:5:100::49)
 by DM5PR1201MB0267.namprd12.prod.outlook.com (2603:10b6:4:55::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Fri, 16 Apr
 2021 14:49:39 +0000
Received: from DM6NAM11FT063.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:100:cafe::e0) by DM6PR03CA0072.outlook.office365.com
 (2603:10b6:5:100::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16 via Frontend
 Transport; Fri, 16 Apr 2021 14:49:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.35)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none; vger.kernel.org; dmarc=pass action=none header.from=nvidia.com; 
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.35 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.35; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.35) by
 DM6NAM11FT063.mail.protection.outlook.com (10.13.172.219) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4042.16 via Frontend Transport; Fri, 16 Apr 2021 14:49:39 +0000
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 16 Apr
 2021 14:49:38 +0000
Received: from [10.26.49.10] (172.20.145.6) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 16 Apr
 2021 14:49:36 +0000
Subject: Re: [PATCH 1/2] ASoC: simple-card-utils: Propagate errors on too many
 links
To: Thierry Reding <thierry.reding@gmail.com>, Mark Brown
 <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
References: <20210416071147.2149109-1-thierry.reding@gmail.com>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <1303b932-5226-0ee6-8f41-fd896908b045@nvidia.com>
Date: Fri, 16 Apr 2021 15:49:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210416071147.2149109-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 648ead11-2db5-40b4-3c07-08d900e6dcb2
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0267:
X-Microsoft-Antispam-PRVS: <DM5PR1201MB02674787076ADA36E11EC92ED94C9@DM5PR1201MB0267.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EeGAqOiUehddsVxLGvQZAx1mpUQV7cNX8siBUMYYD9ON/JoIZjXdVL2ndrcqXpNuuTSpqJzgWLYSSmddoLtZbjaTzx2p+xXPfJ8YRiqY73tv+z56jLuocZN747mLu47h+8gHaI7NopPzag7XQMsmUmBnXGV4hb+jffw0GV5xwV1aq+Rqh5BfFlAPmUBiPIdVIOrJI5z4KYtiUxSs6cWZ4Lss84GIGH04kEoOZU+yby5/4sS18INuoTE5k1ywJgE4B4OjLuIEru+jUnKFcg29fx+lMtn7TmgruhUNHnuOudzdzU4gAqLNHhQkeR/2y5FE1iKdCz0E1GcOUL0T6E8hNS1pjlJzYdnKRTIJwVC/wymbY/uXule98W8eR4WduJxK+UD7PDrGw8Bh565KHabuWw7GCWiteMd7npeseGVmJ8XQEsZmmMgX50naaz6iELPCNYOETjrLMa9e778fFrWVR5dd4PTJhBR/FJnRszB5Bzb9zfFzU7ExQj0y8/3VEWdVuJJECpaP12jHCSKFwEYduSh6LjEjCvBZuM1lpd9IhzTKKeyYR5qF+QA7DWs1iwCoNIOLFFd6CWh4pnc3M5FiIA6+2Ay0Wk7HvkzMFPEaduBfyDeQ3yxyWjoP59CAdpZ6qnPrW/nGGDWS6vMW/oCzbBIXwUIsRFGMgiPAyEhrT0kBb4y3y1oEdb2Zwbj8qJWv
X-Forefront-Antispam-Report: CIP:216.228.112.35; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid02.nvidia.com; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(39860400002)(396003)(36840700001)(46966006)(31696002)(70586007)(86362001)(8676002)(70206006)(316002)(82310400003)(4326008)(54906003)(336012)(478600001)(53546011)(2616005)(36756003)(110136005)(47076005)(26005)(16526019)(186003)(8936002)(36860700001)(7636003)(5660300002)(356005)(2906002)(31686004)(16576012)(426003)(36906005)(83380400001)(82740400003)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2021 14:49:39.3752 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 648ead11-2db5-40b4-3c07-08d900e6dcb2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.35];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT063.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0267
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Kuninori
 Morimoto <kuninori.morimoto.gx@renesas.com>
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


On 16/04/2021 08:11, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The DAI counting code doesn't propagate errors when the number of
> maximum links is exceeded, which causes subsequent initialization code
> to continue to run and that eventually leads to memory corruption with
> the code trying to access memory that is out of bounds.
> 
> Fix this by propgating errors when the maximum number of links is

s/propgating/propagating

> reached, which ensures that the driver fails to load and prevents the
> memory corruption.
> 
> Fixes: f2138aed231c ("ASoC: simple-card-utils: enable flexible CPU/Codec/Platform")
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  sound/soc/generic/audio-graph-card.c | 19 +++++++++++--------
>  sound/soc/generic/simple-card.c      | 17 ++++++++++-------
>  2 files changed, 21 insertions(+), 15 deletions(-)
> 
> diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
> index 0582fe296471..2401212281c2 100644
> --- a/sound/soc/generic/audio-graph-card.c
> +++ b/sound/soc/generic/audio-graph-card.c
> @@ -539,8 +539,8 @@ static int graph_for_each_link(struct asoc_simple_priv *priv,
>  	return ret;
>  }
>  
> -static void graph_get_dais_count(struct asoc_simple_priv *priv,
> -				 struct link_info *li);
> +static int graph_get_dais_count(struct asoc_simple_priv *priv,
> +				struct link_info *li);
>  
>  int audio_graph_parse_of(struct asoc_simple_priv *priv, struct device *dev)
>  {
> @@ -552,7 +552,10 @@ int audio_graph_parse_of(struct asoc_simple_priv *priv, struct device *dev)
>  	card->dev = dev;
>  
>  	memset(&li, 0, sizeof(li));
> -	graph_get_dais_count(priv, &li);
> +	ret = graph_get_dais_count(priv, &li);
> +	if (ret < 0)
> +		return ret;
> +
>  	if (!li.link)
>  		return -EINVAL;
>  
> @@ -657,8 +660,8 @@ static int graph_count_dpcm(struct asoc_simple_priv *priv,
>  	return 0;
>  }
>  
> -static void graph_get_dais_count(struct asoc_simple_priv *priv,
> -				 struct link_info *li)
> +static int graph_get_dais_count(struct asoc_simple_priv *priv,
> +				struct link_info *li)
>  {
>  	/*
>  	 * link_num :	number of links.
> @@ -706,9 +709,9 @@ static void graph_get_dais_count(struct asoc_simple_priv *priv,
>  	 *	=> 4 DAIs  = 2xCPU + 2xCodec
>  	 *	=> 1 ccnf  = 1xdummy-Codec
>  	 */
> -	graph_for_each_link(priv, li,
> -			    graph_count_noml,
> -			    graph_count_dpcm);
> +	return graph_for_each_link(priv, li,
> +				   graph_count_noml,
> +				   graph_count_dpcm);
>  }
>  
>  int audio_graph_card_probe(struct snd_soc_card *card)
> diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
> index bf5ddf1ea65f..1d1c4309b582 100644
> --- a/sound/soc/generic/simple-card.c
> +++ b/sound/soc/generic/simple-card.c
> @@ -526,8 +526,8 @@ static int simple_count_dpcm(struct asoc_simple_priv *priv,
>  	return 0;
>  }
>  
> -static void simple_get_dais_count(struct asoc_simple_priv *priv,
> -				  struct link_info *li)
> +static int simple_get_dais_count(struct asoc_simple_priv *priv,
> +				 struct link_info *li)
>  {
>  	struct device *dev = simple_priv_to_dev(priv);
>  	struct device_node *top = dev->of_node;
> @@ -584,12 +584,12 @@ static void simple_get_dais_count(struct asoc_simple_priv *priv,
>  		li->num[0].platforms	= 1;
>  
>  		li->link = 1;
> -		return;
> +		return 0;
>  	}
>  
> -	simple_for_each_link(priv, li,
> -			     simple_count_noml,
> -			     simple_count_dpcm);
> +	return simple_for_each_link(priv, li,
> +				    simple_count_noml,
> +				    simple_count_dpcm);
>  }
>  
>  static int simple_soc_probe(struct snd_soc_card *card)
> @@ -628,7 +628,10 @@ static int asoc_simple_probe(struct platform_device *pdev)
>  	card->probe		= simple_soc_probe;
>  
>  	memset(&li, 0, sizeof(li));
> -	simple_get_dais_count(priv, &li);
> +	ret = simple_get_dais_count(priv, &li);
> +	if (ret < 0)
> +		return ret;
> +
>  	if (!li.link)
>  		return -EINVAL;
>  
> 

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
Tested-by: Jon Hunter <jonathanh@nvidia.com>

Thanks!
Jon

-- 
nvpublic
