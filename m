Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7B11CFE86
	for <lists+alsa-devel@lfdr.de>; Tue, 12 May 2020 21:42:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D80BA16E2;
	Tue, 12 May 2020 21:42:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D80BA16E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589312573;
	bh=6x3SIeoi7QtSPwzm98PBj9EuY0q4wItrDsQbynmsRPM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZOs9s/vT5mmklv6cqHblZ/rs9KqKmLz8BVqPYy3oSpQJEgT3qdA34decoFPCm4JOK
	 zKF5wFVMmDS6/XYqAz8Yj+vGv45Hte+Dzwlhv/ND0/a6Fb8NSndfageRuFqCpMAKGN
	 ylo75t0MXCszf7oUI7J6c3N+EFuNSFuOlbfRiHro=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 777D2F80158;
	Tue, 12 May 2020 21:41:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 91273F8014C; Tue, 12 May 2020 21:41:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9ED35F800AA
 for <alsa-devel@alsa-project.org>; Tue, 12 May 2020 21:40:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9ED35F800AA
IronPort-SDR: U75FHmQq8WLCmIDg98xcYN7AYP45Do85h6wGV1jDa+HxBfYzx4o/lUZFskBep3REtT85TQIbpb
 Qmmg02Xbh5PQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2020 12:40:54 -0700
IronPort-SDR: qg6uKAs3IT9aBnz7Kdu8vlAd0TYcheSjiHhyAxOc3kESgSsqkTPTRE/RAPEaj8zoiaRPywXrxb
 T7t2PPcws4Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,384,1583222400"; d="scan'208";a="463668423"
Received: from ahlayhel-mobl1.amr.corp.intel.com (HELO [10.254.65.241])
 ([10.254.65.241])
 by fmsmga005.fm.intel.com with ESMTP; 12 May 2020 12:40:53 -0700
Subject: Re: [PATCH 2/2] ASoC: topology: remove the redundant pass checks
To: Keyon Jie <yang.jie@linux.intel.com>, alsa-devel@alsa-project.org
References: <20200512182319.118995-1-yang.jie@linux.intel.com>
 <20200512182319.118995-2-yang.jie@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <99807efc-000b-d94d-e972-19894d7c028f@linux.intel.com>
Date: Tue, 12 May 2020 14:40:53 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200512182319.118995-2-yang.jie@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: tiwai@suse.de, broonie@kernel.org
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



On 5/12/20 1:23 PM, Keyon Jie wrote:
> As we have check the 'pass' in the soc_elem_pass_load(), so no need to
> check it again in each specific elem_load function, at the same time,
> the tplg->pos will be reset to the next header base when the pass is
> mismatched, so the increasing of the tplg->pos in these cases made no
> sense. Here remove all of them.

Sorry Keyon, I am not comfortable with the changes. This started as a 
removal of a debug log and we ended-up changing the execution flow in 
one of the more complex parts of the ASoC framework.
I spent 30mn looking at the code and I don't have a feeling all corner 
cases are covered. The bar for core changes is higher, it'd help to have 
additional explanations or evidence that your proposal was tested 
extensively. You may be right but we should be careful with topology 
changes.

> 
> Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
> ---
>   sound/soc/soc-topology.c | 46 ++--------------------------------------
>   1 file changed, 2 insertions(+), 44 deletions(-)
> 
> diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
> index b3dae319c108..682ffaa85e9e 100644
> --- a/sound/soc/soc-topology.c
> +++ b/sound/soc/soc-topology.c
> @@ -246,8 +246,8 @@ static inline void soc_control_err(struct soc_tplg *tplg,
>   }
>   
>   /* pass vendor data to component driver for processing */
> -static int soc_tplg_vendor_load_(struct soc_tplg *tplg,
> -	struct snd_soc_tplg_hdr *hdr)
> +static int soc_tplg_vendor_load(struct soc_tplg *tplg,
> +				struct snd_soc_tplg_hdr *hdr)
>   {
>   	int ret = 0;
>   
> @@ -268,16 +268,6 @@ static int soc_tplg_vendor_load_(struct soc_tplg *tplg,
>   	return ret;
>   }
>   
> -/* pass vendor data to component driver for processing */
> -static int soc_tplg_vendor_load(struct soc_tplg *tplg,
> -	struct snd_soc_tplg_hdr *hdr)
> -{
> -	if (tplg->pass != SOC_TPLG_PASS_VENDOR)
> -		return 0;
> -
> -	return soc_tplg_vendor_load_(tplg, hdr);
> -}
> -
>   /* optionally pass new dynamic widget to component driver. This is mainly for
>    * external widgets where we can assign private data/ops */
>   static int soc_tplg_widget_load(struct soc_tplg *tplg,
> @@ -1127,12 +1117,6 @@ static int soc_tplg_kcontrol_elems_load(struct soc_tplg *tplg,
>   	int ret;
>   	int i;
>   
> -	if (tplg->pass != SOC_TPLG_PASS_MIXER) {
> -		tplg->pos += le32_to_cpu(hdr->size) +
> -			le32_to_cpu(hdr->payload_size);
> -		return 0;
> -	}
> -
>   	dev_dbg(tplg->dev, "ASoC: adding %d kcontrols at 0x%lx\n", hdr->count,
>   		soc_tplg_get_offset(tplg));
>   
> @@ -1204,14 +1188,6 @@ static int soc_tplg_dapm_graph_elems_load(struct soc_tplg *tplg,
>   
>   	count = le32_to_cpu(hdr->count);
>   
> -	if (tplg->pass != SOC_TPLG_PASS_GRAPH) {
> -		tplg->pos +=
> -			le32_to_cpu(hdr->size) +
> -			le32_to_cpu(hdr->payload_size);
> -
> -		return 0;
> -	}
> -
>   	if (soc_tplg_check_elem_count(tplg,
>   		sizeof(struct snd_soc_tplg_dapm_graph_elem),
>   		count, le32_to_cpu(hdr->payload_size), "graph")) {
> @@ -1741,9 +1717,6 @@ static int soc_tplg_dapm_widget_elems_load(struct soc_tplg *tplg,
>   
>   	count = le32_to_cpu(hdr->count);
>   
> -	if (tplg->pass != SOC_TPLG_PASS_WIDGET)
> -		return 0;
> -
>   	dev_dbg(tplg->dev, "ASoC: adding %d DAPM widgets\n", count);
>   
>   	for (i = 0; i < count; i++) {
> @@ -2101,9 +2074,6 @@ static int soc_tplg_pcm_elems_load(struct soc_tplg *tplg,
>   
>   	count = le32_to_cpu(hdr->count);
>   
> -	if (tplg->pass != SOC_TPLG_PASS_PCM_DAI)
> -		return 0;
> -
>   	/* check the element size and count */
>   	pcm = (struct snd_soc_tplg_pcm *)tplg->pos;
>   	size = le32_to_cpu(pcm->size);
> @@ -2386,12 +2356,6 @@ static int soc_tplg_link_elems_load(struct soc_tplg *tplg,
>   
>   	count = le32_to_cpu(hdr->count);
>   
> -	if (tplg->pass != SOC_TPLG_PASS_LINK) {
> -		tplg->pos += le32_to_cpu(hdr->size) +
> -			le32_to_cpu(hdr->payload_size);
> -		return 0;
> -	}
> -
>   	/* check the element size and count */
>   	link = (struct snd_soc_tplg_link_config *)tplg->pos;
>   	size = le32_to_cpu(link->size);
> @@ -2528,9 +2492,6 @@ static int soc_tplg_dai_elems_load(struct soc_tplg *tplg,
>   
>   	count = le32_to_cpu(hdr->count);
>   
> -	if (tplg->pass != SOC_TPLG_PASS_BE_DAI)
> -		return 0;
> -
>   	/* config the existing BE DAIs */
>   	for (i = 0; i < count; i++) {
>   		dai = (struct snd_soc_tplg_dai *)tplg->pos;
> @@ -2610,9 +2571,6 @@ static int soc_tplg_manifest_load(struct soc_tplg *tplg,
>   	bool abi_match;
>   	int ret = 0;
>   
> -	if (tplg->pass != SOC_TPLG_PASS_MANIFEST)
> -		return 0;
> -
>   	manifest = (struct snd_soc_tplg_manifest *)tplg->pos;
>   
>   	/* check ABI version by size, create a new manifest if abi not match */
> 
