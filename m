Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0F5389F31
	for <lists+alsa-devel@lfdr.de>; Thu, 20 May 2021 09:56:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D9031676;
	Thu, 20 May 2021 09:55:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D9031676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621497396;
	bh=EznMvwiF3ryTdviLXDEIdaBf4ML3SfjpHc3T8CiUJrg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nfjHN2nwXBpCF2yjbV5VS/6dK7GWJv6yGvTMHrMlhYlnr5a0D+aWMJSraQ3J/DtIh
	 ydMLT6eG8S0envk/ZddkFFwZk7+688TTKWUdEQX/i7CXnb5dzMdkQTjvK7mE95c/ju
	 90ZQlJqy9v9st7R9Nm8ad6B6v1mhW/XVN/+3OtiM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D98D5F80229;
	Thu, 20 May 2021 09:55:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6A5D9F80217; Thu, 20 May 2021 09:55:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=NICE_REPLY_A,PRX_BODY_30,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 65B8FF800C1
 for <alsa-devel@alsa-project.org>; Thu, 20 May 2021 09:54:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65B8FF800C1
IronPort-SDR: ZwVDuOKEXruOkytDLff1MfrmmjMgyv/1NqL4PP2GbBsWh1HZ67jwXDK0Gk+hTxVNOoQ7oc0Zni
 G2/GDFwhICPQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9989"; a="286700488"
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; d="scan'208";a="286700488"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2021 00:54:50 -0700
IronPort-SDR: ups5F9VQr9xbsXWpKlRCLzsiRI1OJ8s3Sve52o0l1OEKSKyrjaNHKeNLIdKBd8b8Nq6qTEuLbM
 Ejwyn/BnFHBQ==
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; d="scan'208";a="473886845"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.237.180.88])
 ([10.237.180.88])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2021 00:54:46 -0700
Subject: Re: [PATCH 2/2] ASoC: topology: Fix a small leak in
 soc_tplg_dapm_graph_elems_load()
To: Dan Carpenter <dan.carpenter@oracle.com>,
 Liam Girdwood <lgirdwood@gmail.com>
References: <YKXunAOB1DJ4dT5p@mwanda>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Message-ID: <fe3d1825-aaae-0426-ad18-0e543f3fea1f@linux.intel.com>
Date: Thu, 20 May 2021 09:54:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YKXunAOB1DJ4dT5p@mwanda>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, kernel-janitors@vger.kernel.org,
 alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>
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

On 5/20/2021 7:07 AM, Dan Carpenter wrote:
> We have to kfree(routes) on this error path.
> 
> Fixes: ff9226224437 ("ASoC: topology: Change allocations to resource managed")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>   sound/soc/soc-topology.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
> index 6b7a813bc264..5730fcaa7bc6 100644
> --- a/sound/soc/soc-topology.c
> +++ b/sound/soc/soc-topology.c
> @@ -1135,8 +1135,10 @@ static int soc_tplg_dapm_graph_elems_load(struct soc_tplg *tplg,
>   	 */
>   	for (i = 0; i < count; i++) {
>   		routes[i] = devm_kzalloc(tplg->dev, sizeof(*routes[i]), GFP_KERNEL);
> -		if (!routes[i])
> -			return -ENOMEM;
> +		if (!routes[i]) {
> +			ret = -ENOMEM;
> +			goto free_routes;
> +		}
>   	}
>   
>   	for (i = 0; i < count; i++) {
> @@ -1198,6 +1200,7 @@ static int soc_tplg_dapm_graph_elems_load(struct soc_tplg *tplg,
>   	 * The memory allocated for each dapm route will be freed
>   	 * when it is removed in remove_route().
>   	 */
> +free_routes:
>   	kfree(routes);
>   
>   	return ret;
> 

Yes, that's right, however looking at this function again, I wonder if 
instead we can just get rid of the routes array and kcalloc call?

Something along those lines (hope that copy paste won't mess it up):



diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 73076d425efb..13db9cfe223f 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -1104,7 +1104,7 @@ static int soc_tplg_dapm_graph_elems_load(struct 
soc_tplg *tplg,
  {
         struct snd_soc_dapm_context *dapm = &tplg->comp->dapm;
         struct snd_soc_tplg_dapm_graph_elem *elem;
-       struct snd_soc_dapm_route **routes;
+       struct snd_soc_dapm_route *route;
         int count, i;
         int ret = 0;

@@ -1122,28 +1122,15 @@ static int soc_tplg_dapm_graph_elems_load(struct 
soc_tplg *tplg,
         dev_dbg(tplg->dev, "ASoC: adding %d DAPM routes for index 
%d\n", count,
                 hdr->index);

-       /* allocate memory for pointer to array of dapm routes */
-       routes = kcalloc(count, sizeof(struct snd_soc_dapm_route *),
-                        GFP_KERNEL);
-       if (!routes)
-               return -ENOMEM;
-
-       /*
-        * allocate memory for each dapm route in the array.
-        * This needs to be done individually so that
-        * each route can be freed when it is removed in remove_route().
-        */
         for (i = 0; i < count; i++) {
-               routes[i] = devm_kzalloc(tplg->dev, sizeof(*routes[i]), 
GFP_KERNEL);
-               if (!routes[i])
+               route = devm_kzalloc(tplg->dev, sizeof(*route), GFP_KERNEL);
+               if (!route)
                         return -ENOMEM;
-       }

-       for (i = 0; i < count; i++) {
                 elem = (struct snd_soc_tplg_dapm_graph_elem *)tplg->pos;
                 tplg->pos += sizeof(struct snd_soc_tplg_dapm_graph_elem);

-               /* validate routes */
+               /* validate route */
                 if (strnlen(elem->source, SNDRV_CTL_ELEM_ID_NAME_MAXLEN) ==
                             SNDRV_CTL_ELEM_ID_NAME_MAXLEN) {
                         ret = -EINVAL;
@@ -1160,46 +1147,32 @@ static int soc_tplg_dapm_graph_elems_load(struct 
soc_tplg *tplg,
                         break;
                 }

-               routes[i]->source = elem->source;
-               routes[i]->sink = elem->sink;
+               route->source = elem->source;
+               route->sink = elem->sink;

                 /* set to NULL atm for tplg users */
-               routes[i]->connected = NULL;
+               route->connected = NULL;
                 if (strnlen(elem->control, 
SNDRV_CTL_ELEM_ID_NAME_MAXLEN) == 0)
-                       routes[i]->control = NULL;
+                       route->control = NULL;
                 else
-                       routes[i]->control = elem->control;
+                       route->control = elem->control;

                 /* add route dobj to dobj_list */
-               routes[i]->dobj.type = SND_SOC_DOBJ_GRAPH;
-               routes[i]->dobj.ops = tplg->ops;
-               routes[i]->dobj.index = tplg->index;
-               list_add(&routes[i]->dobj.list, &tplg->comp->dobj_list);
+               route->dobj.type = SND_SOC_DOBJ_GRAPH;
+               route->dobj.ops = tplg->ops;
+               route->dobj.index = tplg->index;
+               list_add(&route->dobj.list, &tplg->comp->dobj_list);

-               ret = soc_tplg_add_route(tplg, routes[i]);
+               ret = soc_tplg_add_route(tplg, route);
                 if (ret < 0) {
                         dev_err(tplg->dev, "ASoC: topology: add_route 
failed: %d\n", ret);
-                       /*
-                        * this route was added to the list, it will
-                        * be freed in remove_route() so increment the
-                        * counter to skip it in the error handling
-                        * below.
-                        */
-                       i++;
                         break;
                 }

                 /* add route, but keep going if some fail */
-               snd_soc_dapm_add_routes(dapm, routes[i], 1);
+               snd_soc_dapm_add_routes(dapm, route, 1);
         }

-       /*
-        * free pointer to array of dapm routes as this is no longer needed.
-        * The memory allocated for each dapm route will be freed
-        * when it is removed in remove_route().
-        */
-       kfree(routes);
-
         return ret;
  }


