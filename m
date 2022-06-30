Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46300561A67
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jun 2022 14:35:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9FB4D950;
	Thu, 30 Jun 2022 14:34:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9FB4D950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656592548;
	bh=RBmj/Kl7Uz8J5Gl38SW+6TT6PnWkhV4QH3Vx5kZhP0U=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DTz6+3PFMtUgGAzcDYZba2i+vl/Fn60u4HJ7FbjayGblOxg7vcEnSsXJnKBScsQyk
	 lOcUSMjcBKPQpGqcXhZAau7xkR+v7nf346TwZwJUIqH0lRT70gkP/OdAElnfMEpsr4
	 kEUq2Ca0VRWr/N7MgapNA5KrW0pGA8qjGRfscLyU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E3B5F804DA;
	Thu, 30 Jun 2022 14:34:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BCA5EF804D8; Thu, 30 Jun 2022 14:34:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 062E9F80107
 for <alsa-devel@alsa-project.org>; Thu, 30 Jun 2022 14:34:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 062E9F80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="HgOokaX4"
Received: by mail-wm1-x334.google.com with SMTP id
 t17-20020a1c7711000000b003a0434b0af7so1593962wmi.0
 for <alsa-devel@alsa-project.org>; Thu, 30 Jun 2022 05:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Ss2eXTgce1Z+FVZRaJDO9kFJJteGb8clhtcbdKqjPjs=;
 b=HgOokaX4wfrQzc+oA97X8AeIvHAkrPLrBoHNebb+3k3hR8K9p/sswIam9tY0Bc955D
 g08xkt9Di1n7cmfuFfEZ2rsXRG/ZxaoEaONrmw56waF0TJs86WqIF/ZybI+MaM7n1VMZ
 Cs/G945RITWjoXpSutHuC2mHo3WcT4bmAKqV3w2P8V0XPuEyA37Mu8KDrulb0TDDOyt5
 i2JxDP5AaMUunnB8k5ocRga5fMRE0HwGW8Lz+efVXFm5g3PFJKDLvT/G80oHKFyfP0zF
 HlS/0mwBdrfsMV8ZJpEeOOD15/NF9pKUh7KUtPspnZlg3C0/9bdOa/avE0GNJL8IO32U
 wclw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Ss2eXTgce1Z+FVZRaJDO9kFJJteGb8clhtcbdKqjPjs=;
 b=RnKudyvgvYKE4yuXwuoShe0jHJt/2KgSOgyVkQwAPJr/Rl4DJMJMP6xiUKoC06t7eQ
 Oba9US+xqEtpH0XlSEGV6MzYqgmI/WA2jb3OZ1KllGb4vqDMo0zVUdp2g65EwmxEAlV4
 7ts9mxg/ExIxP0GDY/4YWKRpET/DtvOjQgh85OVKemzNqxyeguHlH84uFYwBNvMmJqS2
 9rIk9L6vmOf4DQ5CGs91pb+xJU7j5WwsdTdaXfx0J1WGdH1aCWWP9CoGyqCYCZwpyiUX
 IRx/ZbVXGyReF7lLwCLcITdYL7FSAZxiiWEatXYaf3heSv8QB0p+YwzTdGGmgvLFcKVe
 mQGw==
X-Gm-Message-State: AJIora8iCgy0hfX0oOTN4ROu/5ikHRymNUpx6qgFacxGJwhTU6DlMOgn
 RZDytblVldZP1ix/31hF8XoJXw==
X-Google-Smtp-Source: AGRyM1sJU7urd+5aK3MgCw3Uv7rECBKArUwktKQmOYEC6kLFke4BEdi3TOYid4eWgGI2yM4KAC43rw==
X-Received: by 2002:a7b:c20d:0:b0:3a0:39e4:19e8 with SMTP id
 x13-20020a7bc20d000000b003a039e419e8mr11900050wmi.166.1656592478287; 
 Thu, 30 Jun 2022 05:34:38 -0700 (PDT)
Received: from [192.168.86.238]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id
 bi18-20020a05600c3d9200b0039c4506bd25sm3053738wmb.14.2022.06.30.05.34.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jun 2022 05:34:37 -0700 (PDT)
Message-ID: <a1569f25-97c4-c1ea-c09e-c01b53f1b5e0@linaro.org>
Date: Thu, 30 Jun 2022 13:34:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] ASoC: qdsp6: fix potential memory leak in
 q6apm_get_audioreach_graph()
Content-Language: en-US
To: Jianglei Nie <niejianglei2021@163.com>, bgoswami@codeaurora.org,
 lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com, dan.carpenter@oracle.com,
 linmq006@gmail.com
References: <20220629182520.2164409-1-niejianglei2021@163.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20220629182520.2164409-1-niejianglei2021@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org
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



On 29/06/2022 19:25, Jianglei Nie wrote:
> q6apm_get_audioreach_graph() allocates a memory chunk for graph->graph
> with audioreach_alloc_graph_pkt(). When idr_alloc() fails, graph->graph
> is not released, which will lead to a memory leak.
> 
> We can release the graph->graph with kfree() when idr_alloc() fails to
> fix the memory leak.
thanks for catching this, wondering did you hit this bug while testing 
or was it a some tooling that discovered this bug?

> 
> Signed-off-by: Jianglei Nie <niejianglei2021@163.com>
> ---

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


>   sound/soc/qcom/qdsp6/q6apm.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
> index f424d7aa389a..794019286c70 100644
> --- a/sound/soc/qcom/qdsp6/q6apm.c
> +++ b/sound/soc/qcom/qdsp6/q6apm.c
> @@ -75,6 +75,7 @@ static struct audioreach_graph *q6apm_get_audioreach_graph(struct q6apm *apm, ui
>   	id = idr_alloc(&apm->graph_idr, graph, graph_id, graph_id + 1, GFP_KERNEL);
>   	if (id < 0) {
>   		dev_err(apm->dev, "Unable to allocate graph id (%d)\n", graph_id);
> +		kfree(graph->graph);
>   		kfree(graph);
>   		mutex_unlock(&apm->lock);
>   		return ERR_PTR(id);
