Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 32CF04C502E
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Feb 2022 21:55:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B299F1F67;
	Fri, 25 Feb 2022 21:54:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B299F1F67
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645822544;
	bh=n1WjNrXTDDJ1HlpfAhdDsNewfZtFBkLYWP+4hOiP0Hs=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FOCBKShedL0xSbdCswgivuTlX/50L+INcfJvn5Av3TC6lpTReuEE/t7j1P4AIrm9+
	 jjSDdz5obEdrLQnPLo2arvA7nTd517ozS5QEHiy8eqNoUQzTsGHJ1EtKW8S9o81yAu
	 5YC+Gpi2GsSfli3P6aWFMSeyHeLzMrQ/a7ShmfdM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 88D59F80534;
	Fri, 25 Feb 2022 21:52:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1FEE5F80118; Fri, 25 Feb 2022 21:52:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 295AEF80118
 for <alsa-devel@alsa-project.org>; Fri, 25 Feb 2022 21:52:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 295AEF80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="aQ6eNisC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645822359; x=1677358359;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=n1WjNrXTDDJ1HlpfAhdDsNewfZtFBkLYWP+4hOiP0Hs=;
 b=aQ6eNisCtBDrNDa6mFFMfLCcviMRAcnZPKwGqUeLEq4FspB9V10SNvja
 s54FoGzBemyKoz2uws0WSTCv3rjEmUatf1a/znZK4Qdn5QufkTzMs3+yt
 qQwzClfrk0MHsMJq6mN4g/ei3gQxmX1Na6Zcc3ZaxarweT5yPBE8F2f1E
 ldaKLzEl2PqIDHb1cnlFwY+KxFk0by1NmWznWurZkTbSHMi7UPgriwhYU
 d9ijm0eEZ4zcaRnqD1sJhw10r7V1dRen5M0HJ4Deq5SlVCHat4oayi0IH
 9YZ5NEDOV2i3wg7J5y+eNAl2eOsz+iGparJ6ved1N6y/SohcTfcpPNnAk Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10269"; a="313296133"
X-IronPort-AV: E=Sophos;i="5.90,137,1643702400"; d="scan'208";a="313296133"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 12:52:37 -0800
X-IronPort-AV: E=Sophos;i="5.90,137,1643702400"; d="scan'208";a="777520577"
Received: from nnwogbe-mobl1.amr.corp.intel.com (HELO [10.212.101.231])
 ([10.212.101.231])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 12:52:36 -0800
Message-ID: <2b6bc0f7-1e04-77b3-95d2-ff561b006ccb@linux.intel.com>
Date: Fri, 25 Feb 2022 13:36:46 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [RFC 09/13] ASoC: Intel: avs: Path creation and freeing
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20220207132532.3782412-1-cezary.rojewski@intel.com>
 <20220207132532.3782412-10-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220207132532.3782412-10-cezary.rojewski@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: upstream@semihalf.com, harshapriya.n@intel.com, rad@semihalf.com,
 tiwai@suse.com, hdegoede@redhat.com, broonie@kernel.org,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
 lma@semihalf.com
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



On 2/7/22 07:25, Cezary Rojewski wrote:
> To implement ASoC PCM operations, DSP path handling is needed. With path
> template concept present, information carried by topology file can be
> converted into runtime path representation. Each may be composed of
> several pipelines and each pipeline can contain a number of processing

it's not quite clear how you can have different pipelines with a single
dma_is per path?

> modules inside. Number of templates and variants found within topology
> may vastly outnumber the total amount of pipelines and modules supported
> by AudioDSP firmware simultaneously (in runtime) so none of the IDs are
> specified in the topology. These are assigned dynamically when needed
> and account for limitations described by FIRMWARE_CONFIG and
> HARDWARE_CONFIG basefw parameters.

It's already quite hard to create a topology using static IDs that will
work, this dynamic creation adds an element of risk and validation,
doesn't it?

Can you clarify how you validated this dynamic capability?

> Paths are created on ->hw_params() and are freed on ->hw_free() ALSA PCM
> operations. This choice is based on firmware expectations - need for

So a path seems to be completely tied to an FE then?

That would mean that a 'dai pipeline' with 'mixin-dai-copier' would not
be managed by an avs-path, and would somehow need to be autonomously
created?

You really need to clarify how basic topologies with
mixers/demux/loopbacks are handled.

> complete set of information when attempting to instantiate pipelines and
> modules on AudioDSP side. With DMA and audio format provided, search
> mechanism tests all path variants available in given path template until
> a matching variant is found. Once found, information already available
> is combined with all avs_tplg_* pieces pointed by matching path variant.
> This finally allows to begin a cascade of IPCs which goes is to reserve

this sentence makes no sense.

did you mean 'which goals'?

> resources and prepare DSP for upcoming audio streaming.

> +static struct avs_tplg_path *
> +avs_path_find_variant(struct avs_dev *adev,
> +		      struct avs_tplg_path_template *template,
> +		      struct snd_pcm_hw_params *fe_params,
> +		      struct snd_pcm_hw_params *be_params)
> +{
> +	struct avs_tplg_path *variant;
> +
> +	list_for_each_entry(variant, &template->path_list, node) {
> +		dev_dbg(adev->dev, "check FE rate %d chn %d vbd %d bd %d\n",
> +			variant->fe_fmt->sampling_freq, variant->fe_fmt->num_channels,
> +			variant->fe_fmt->valid_bit_depth, variant->fe_fmt->bit_depth);
> +		dev_dbg(adev->dev, "check BE rate %d chn %d vbd %d bd %d\n",
> +			variant->be_fmt->sampling_freq, variant->be_fmt->num_channels,
> +			variant->be_fmt->valid_bit_depth, variant->be_fmt->bit_depth);
> +
> +		if (variant->fe_fmt && avs_test_hw_params(fe_params, variant->fe_fmt) &&
> +		    variant->be_fmt && avs_test_hw_params(be_params, variant->be_fmt))
> +			return variant;
> +	}

This matching between FE and BE formats is the key problem with this
patchset IMHO.

We need the ability to reconfigure the BE based on constraint matching,
not exact match with a fixed value!

> +
> +	return NULL;
> +}
> +
> +static void avs_path_module_free(struct avs_dev *adev, struct avs_path_module *mod)
> +{
> +	kfree(mod);
> +}
> +
> +static struct avs_path_module *
> +avs_path_module_create(struct avs_dev *adev,
> +		       struct avs_path_pipeline *owner,
> +		       struct avs_tplg_module *template)

so you have templates for paths AND modules?

Completely lost...

I'll skip the rest of this patch.
