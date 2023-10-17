Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0B67CC629
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Oct 2023 16:47:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 901D482A;
	Tue, 17 Oct 2023 16:46:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 901D482A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697554052;
	bh=lFUwUxTqgUoKPf+e6xix+hIX2T1tys85l9kPE+lIogk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bJDiZFITiV7EjPOkDHczlJkAHx2BIPPpZEncedjgIje3aPVHK+blsWuvDWdMUIeMd
	 stn4Vi6s8aTylPdsBwVYkyr1Si6unFZ2KYLBkbYErTuMLLeWvw/XdhQTkKopiYIvbp
	 Ek3CFGwCBh338ArpUo+qaFDQh7foe8dNd0C2txQc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C67D0F80236; Tue, 17 Oct 2023 16:46:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 24708F8024E;
	Tue, 17 Oct 2023 16:46:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B01FBF8025F; Tue, 17 Oct 2023 16:46:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 618EAF80236
	for <alsa-devel@alsa-project.org>; Tue, 17 Oct 2023 16:46:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 618EAF80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=dcSwSJz0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697553974; x=1729089974;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=lFUwUxTqgUoKPf+e6xix+hIX2T1tys85l9kPE+lIogk=;
  b=dcSwSJz0EhSay8wPBhrTYrLMVGRLPaVEQmT6CzOKPsfN9YoNMVUqK4BR
   27rGZPF/5lgf/kA1zXPUAe285LHL2IHDbQGrNzhJ2S2SghO7fIxIxdl/p
   ibVW3yR2i5CHYsnBY6S4c7agn90fXr7Ms773MEnkoNhq3DFooMzS5ai53
   iiUraRroYZzgcv219BpeJDRe6Ot0TQbG6Z5XgPpMCv5CffYiFFMT68ElV
   tgAMK2unpEyo2wKz+vxgk58JaMp2m7FD9dLoqC3Z8gGn10UoWo9D4RRVL
   ejbHPFDU5S30s6gDUwIEVD3J7iG3mSc/o3ipWeD9Yk9se76J7jN36nmz3
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="366060399"
X-IronPort-AV: E=Sophos;i="6.03,232,1694761200";
   d="scan'208";a="366060399"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2023 07:46:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="826474115"
X-IronPort-AV: E=Sophos;i="6.03,232,1694761200";
   d="scan'208";a="826474115"
Received: from asprado-mobl2.amr.corp.intel.com (HELO [10.212.55.179])
 ([10.212.55.179])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2023 07:46:08 -0700
Message-ID: <d3c97c54-d149-4bed-9013-3f07bc6a7f52@linux.intel.com>
Date: Tue, 17 Oct 2023 09:45:55 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] ASoC: makes CPU/Codec channel connection map more
 generic
Content-Language: en-US
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>, Bard Liao
 <yung-chuan.liao@linux.intel.com>, bard.liao@intel.com,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org
References: <87zg0jwdnz.wl-kuninori.morimoto.gx@renesas.com>
 <87y1g3wdng.wl-kuninori.morimoto.gx@renesas.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <87y1g3wdng.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: KHDB37MMHH7BMCTWTCJTLQIO6JDKDJ7T
X-Message-ID-Hash: KHDB37MMHH7BMCTWTCJTLQIO6JDKDJ7T
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KHDB37MMHH7BMCTWTCJTLQIO6JDKDJ7T/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Morimoto-san,
we're facing an across-the-board regression with this patch, even in
regular 'nocodec' configurations with dummy dais and no codec.

> @@ -1055,22 +1054,28 @@ static int __soc_pcm_hw_params(struct snd_soc_pcm_runtime *rtd,
>  		/* copy params for each cpu */
>  		tmp_params = *params;
>  
> -		if (!rtd->dai_link->codec_ch_maps)
> -			goto hw_params;

By removing this test, we now proceed and deal with both FE and BE...

>  		/*
>  		 * construct cpu channel mask by combining ch_mask of each
>  		 * codec which maps to the cpu.
> +		 * see
> +		 *	soc.h :: [dai_link->ch_maps Image sample]
>  		 */
> -		for_each_rtd_codec_dais(rtd, j, codec_dai) {
> -			if (rtd->dai_link->codec_ch_maps[j].connected_cpu_id == i)
> -				ch_mask |= rtd->dai_link->codec_ch_maps[j].ch_mask;
> +		if (rtd->dai_link->num_cpus >= rtd->dai_link->num_codecs) {
> +			/* .ch_map is from CPU */
> +			ch_mask = rtd->dai_link->ch_maps[i].ch_mask;

... and for a FE dailink there's no ch_maps so this results in a kernel
oops.

> +		} else {
> +			int j;
> +
> +			/* .ch_map is from Codec */
> +			for_each_rtd_codec_dais(rtd, j, codec_dai)
> +				if (rtd->dai_link->ch_maps[j].connected_node == i)
> +					ch_mask |= rtd->dai_link->ch_maps[j].ch_mask;
>  		}
>  
>  		/* fixup cpu channel number */
>  		if (ch_mask)
>  			soc_pcm_codec_params_fixup(&tmp_params, ch_mask);
>  
> -hw_params:
>  		ret = snd_soc_dai_hw_params(cpu_dai, substream, &tmp_params);
>  		if (ret < 0)
>  			goto out;

Bard suggested the following diff (being tested now), comments welcome.

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 0bfff2ea111d..ce84d9c1d8be 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -1054,6 +1054,9 @@ static int __soc_pcm_hw_params(struct
snd_soc_pcm_runtime *rtd,
                /* copy params for each cpu */
                tmp_params = *params;

+               /* ch_map is only set in BE dai link */
+               if (rtd->dai_link->dynamic)
+                       goto run;
                /*
                 * construct cpu channel mask by combining ch_mask of each
                 * codec which maps to the cpu.
@@ -1075,7 +1078,7 @@ static int __soc_pcm_hw_params(struct
snd_soc_pcm_runtime *rtd,
                /* fixup cpu channel number */
                if (ch_mask)
                        soc_pcm_codec_params_fixup(&tmp_params, ch_mask);
-
+run:
                ret = snd_soc_dai_hw_params(cpu_dai, substream,
&tmp_params);
                if (ret < 0)
                        goto out;



