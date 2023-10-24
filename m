Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 091AF7D53EC
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Oct 2023 16:25:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51F09857;
	Tue, 24 Oct 2023 16:24:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51F09857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698157521;
	bh=L++4CmKz6BsAhZ7VdgtQs3hUhOH7wFF41ckdSy07qs0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tI/5Rhx3X+XYEzF8YhcPjPG3ZFIJ1/0RabK1Hd5bBWh1Q7m2EBIujLfC9WORfxb1c
	 /IvEVHRsyaL4KCrcF9N0b5YbXUpUTr8MZWuYJBnYNURUSHQB34CFgz/bx6kjFrhVmx
	 nn8JHt5fnJoxV4XpKiXIRVDvhBw5RlS9AvbZc+nA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 86AB7F80157; Tue, 24 Oct 2023 16:24:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BF4F9F80157;
	Tue, 24 Oct 2023 16:24:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 733C5F80165; Tue, 24 Oct 2023 16:24:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 310C6F8012B
	for <alsa-devel@alsa-project.org>; Tue, 24 Oct 2023 16:24:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 310C6F8012B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=KD6qbqeu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698157459; x=1729693459;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=L++4CmKz6BsAhZ7VdgtQs3hUhOH7wFF41ckdSy07qs0=;
  b=KD6qbqeuCQIknOeDl0Y/CZRxwm5bh2WAG0JX2YqUdfs0kG73QyKfQaBE
   OPoo85+kVR9++mHlRCSlpcBS1Giq8wkYll+U8K/PGAUn6yMUAjPiZamuL
   2gXfpQyMpTmKZCQ+ZcPzYm0Pi3CwbMamp0RGvAYtHUqbcMxrwfBS2M4I7
   YGuzvd7RFp5Di7Ufq9ePwH44z9lX6JWxqrouu+7PPAAwPorMgvNygN2Mu
   XJoKNtpcd7J1lHNKinh0rqLH5x6J1SdxqnIKEmdSsv40XI5M7KM26hOAB
   6pMHNktQXZ999/sIbSSiV4RpjMKDOKtEYRANoTLyox+pwamp+WSq3tGi/
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="386873693"
X-IronPort-AV: E=Sophos;i="6.03,248,1694761200";
   d="scan'208";a="386873693"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2023 07:24:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="758491431"
X-IronPort-AV: E=Sophos;i="6.03,248,1694761200";
   d="scan'208";a="758491431"
Received: from pwali-mobl.amr.corp.intel.com (HELO [10.209.188.4])
 ([10.209.188.4])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2023 07:24:05 -0700
Message-ID: <3ce60545-ba2b-48cc-903d-288d761f2fe3@linux.intel.com>
Date: Tue, 24 Oct 2023 09:24:05 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] ASoC: makes CPU/Codec channel connection map more
 generic
Content-Language: en-US
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>, Bard Liao
 <yung-chuan.liao@linux.intel.com>, bard.liao@intel.com,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org
References: <874jihlx44.wl-kuninori.morimoto.gx@renesas.com>
 <8734y1lx3m.wl-kuninori.morimoto.gx@renesas.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <8734y1lx3m.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XCD526QRNHIPPR7EK73PJDVPCSIHA3QC
X-Message-ID-Hash: XCD526QRNHIPPR7EK73PJDVPCSIHA3QC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XCD526QRNHIPPR7EK73PJDVPCSIHA3QC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 10/23/23 00:35, Kuninori Morimoto wrote:
> Current ASoC CPU:Codec = N:M connection is using connection mapping idea,
> but it is used for N < M case only. We want to use it for any case.
> 
> By this patch, not only N:M connection, but all existing connection
> (1:1, 1:N, N:N) will use same connection mapping. Then, because it will
> use default mapping, no conversion patch is needed to exising drivers.
> 
> More over, CPU:Codec = N:M (N > M) also supported in the same time.
> 
> ch_maps array will has CPU/Codec index by this patch.
> 
> Image
> 	CPU0 <---> Codec0
> 	CPU1 <-+-> Codec1
> 	CPU2 <-/
> 
> ch_map
> 	ch_map[0].cpu = 0	ch_map[0].codec = 0
> 	ch_map[1].cpu = 1	ch_map[1].codec = 1
> 	ch_map[2].cpu = 2	ch_map[2].codec = 1
> 
> Link: https://lore.kernel.org/r/87fs6wuszr.wl-kuninori.morimoto.gx@renesas.com
> Link: https://lore.kernel.org/r/878r7yqeo4.wl-kuninori.morimoto.gx@renesas.com
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

The Intel CI did not detect any issues with this patch, see
https://github.com/thesofproject/linux/pull/4632, so

Tested-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Note however the -W1 error below


> +static int snd_soc_compensate_channel_connection_map(struct snd_soc_card *card,
> +						     struct snd_soc_dai_link *dai_link)
> +{
> +	struct snd_soc_dai_link_ch_map *ch_maps;
> +	int i, max;

sound/soc/soc-core.c: In function
‘snd_soc_compensate_channel_connection_map’:
sound/soc/soc-core.c:1050:16: error: variable ‘max’ set but not used
[-Werror=unused-but-set-variable]
 1050 |         int i, max;
      |                ^~~

> +	/*
> +	 * dai_link->ch_maps indicates how CPU/Codec are connected.
> +	 * It will be a map seen from a larger number of DAI.
> +	 * see
> +	 *	soc.h :: [dai_link->ch_maps Image sample]
> +	 */
> +
> +	/* it should have ch_maps if connection was N:M */
> +	if (dai_link->num_cpus > 1 && dai_link->num_codecs > 1 &&
> +	    dai_link->num_cpus != dai_link->num_codecs && !dai_link->ch_maps) {
> +		dev_err(card->dev, "need to have ch_maps when N:M connction (%s)",
> +			dai_link->name);
> +		return -EINVAL;
> +	}
> +
> +	/* do nothing if it has own maps */
> +	if (dai_link->ch_maps)
> +		goto sanity_check;
> +
> +	/* check default map size */
> +	if (dai_link->num_cpus   > MAX_DEFAULT_CH_MAP_SIZE ||
> +	    dai_link->num_codecs > MAX_DEFAULT_CH_MAP_SIZE) {
> +		dev_err(card->dev, "soc-core.c needs update default_connection_maps");
> +		return -EINVAL;
> +	}
> +
> +	/* Compensate missing map for ... */
> +	if (dai_link->num_cpus == dai_link->num_codecs)
> +		dai_link->ch_maps = default_ch_map_sync;	/* for 1:1 or N:N */
> +	else if (dai_link->num_cpus <  dai_link->num_codecs)
> +		dai_link->ch_maps = default_ch_map_1cpu;	/* for 1:N */
> +	else
> +		dai_link->ch_maps = default_ch_map_1codec;	/* for N:1 */
> +
> +sanity_check:
> +	max = min(dai_link->num_cpus, dai_link->num_codecs);

sound/soc/soc-core.c: In function
‘snd_soc_compensate_channel_connection_map’:
sound/soc/soc-core.c:1050:16: error: variable ‘max’ set but not used
[-Werror=unused-but-set-variable]
 1050 |         int i, max;
      |                ^~~
> +
> +	dev_dbg(card->dev, "dai_link %s\n", dai_link->stream_name);
> +	for_each_link_ch_maps(dai_link, i, ch_maps) {
> +		if ((ch_maps->cpu   >= dai_link->num_cpus) ||
> +		    (ch_maps->codec >= dai_link->num_codecs)) {
> +			dev_err(card->dev,
> +				"unexpected dai_link->ch_maps[%d] index (cpu(%d/%d) codec(%d/%d))",
> +				i,
> +				ch_maps->cpu,	dai_link->num_cpus,
> +				ch_maps->codec,	dai_link->num_codecs);
> +			return -EINVAL;
> +		}
> +
> +		dev_dbg(card->dev, "  [%d] cpu%d <-> codec%d\n",
> +			i, ch_maps->cpu, ch_maps->codec);
> +	}
> +
> +	return 0;
> +}
