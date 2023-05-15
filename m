Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5AF70318E
	for <lists+alsa-devel@lfdr.de>; Mon, 15 May 2023 17:29:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE7F11E2;
	Mon, 15 May 2023 17:28:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE7F11E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684164558;
	bh=o4d3wchS2hGWpfF31kHfxYcLQGLrdY5jEIsaF69ZRNA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CvQ1hhqP5ZIoaRQXJ2zTe8xfFcMsPPkF9FZZr5lz1EN6XJBwafBI3u56MgUxHaijK
	 xTjhNt9tt/cmmCun6BdXe6ehe88fEU9bnCSYleEr4kcgqLspCDhhm0V8RF0ieEFrBP
	 CdnoOKdjZMc8zaIDNcgLo+hj9O0guOyAnvwMF1ec=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 24B1DF80431; Mon, 15 May 2023 17:28:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 79985F8016D;
	Mon, 15 May 2023 17:28:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EEB80F80272; Mon, 15 May 2023 17:28:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4A7FCF8016D;
	Mon, 15 May 2023 17:28:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A7FCF8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=CiQDb98Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684164490; x=1715700490;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=o4d3wchS2hGWpfF31kHfxYcLQGLrdY5jEIsaF69ZRNA=;
  b=CiQDb98ZiW7vuGKe/4rEuRIFRdEsPIqzkVwl1rImmVxiWwvj7/wVRw4p
   BFi9n/8EWN67PKEjFd2Pqco8FnTHMB2qI9RkvVMxCmCvoN17mFwpjjSs7
   ZMZs25YxlDbBFmVnr+tyYVF8+Y9TgsgE+hC0N10RdEsGYepaWaWxdZSYS
   ZV68556WnMZckSbo+jKO/dNnuiJxWlHQincs/faiPQdBU0Jfz+zLa/tpL
   bDWaje3SDuon2n+6LkBCWyltK3I2pZOd99fTFLMAMKSX/zuVq1kBfY4P0
   ybsRe32cunpQDwlBraNrUxL1ZonyczAUKy6/xqrHMQR3e3v49jg3AhwTs
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="340583196"
X-IronPort-AV: E=Sophos;i="5.99,277,1677571200";
   d="scan'208";a="340583196"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2023 08:28:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="947452467"
X-IronPort-AV: E=Sophos;i="5.99,277,1677571200";
   d="scan'208";a="947452467"
Received: from molivas-mobl.amr.corp.intel.com (HELO [10.251.17.233])
 ([10.251.17.233])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2023 08:28:01 -0700
Message-ID: <8f57c62f-c427-f5df-d517-d4025fe7c65d@linux.intel.com>
Date: Mon, 15 May 2023 10:28:00 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
Subject: Re: [PATCH 1/2] ASoC: SOF: mediatek: add mt8188 audio support
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Trevor Wu <trevor.wu@mediatek.com>, peter.ujfalusi@linux.intel.com,
 yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com, daniel.baluta@nxp.com, lgirdwood@gmail.com,
 tiwai@suse.com, perex@perex.cz, matthias.bgg@gmail.com,
 yc.hung@mediatek.com, tinghan.shen@mediatek.com,
 sound-open-firmware@alsa-project.org, alsa-devel@alsa-project.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230515052540.9037-1-trevor.wu@mediatek.com>
 <20230515052540.9037-2-trevor.wu@mediatek.com>
 <7c784932-951a-65c0-c48f-bfa4c098b2e1@collabora.com>
 <ZGJKPuf1FX4AYLXl@finisterre.sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <ZGJKPuf1FX4AYLXl@finisterre.sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: JAEZM3W2HAE5CLUHIQS7DNH4WJFEPLWK
X-Message-ID-Hash: JAEZM3W2HAE5CLUHIQS7DNH4WJFEPLWK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JAEZM3W2HAE5CLUHIQS7DNH4WJFEPLWK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 5/15/23 10:05, Mark Brown wrote:
> On Mon, May 15, 2023 at 01:25:44PM +0200, AngeloGioacchino Del Regno wrote:
>> Il 15/05/23 07:25, Trevor Wu ha scritto:
> 
>>> +{
>>> +	/* common defaults */
>>> +	memcpy(&sof_mt8188_ops, &sof_mt8186_ops, sizeof(struct snd_sof_dsp_ops));
> 
>> Never use sizeof(type), always use destination var size! Anyway, there's more.
>>
>> I don't think we need to perform this memcpy: we'll never see an instance of
>> both mt8186 and mt8188 drivers on the same machine, so you can safely just use
>> sof_mt8186_ops for mt8188...
> 
>>> +	sof_mt8188_ops.drv = mt8188_dai;
> 
>> ...which obviously means that this becomes
> 
>> 	sof_mt8186_ops.drv = mt8188_dai;
> 
> This does have the issue that it then means the ops struct isn't const
> which isn't ideal.  It's also not the end of the world though so I don't
> have super strong feelings.

We do the same for Intel devices, we have a common structure which is
copied and only the members that differ in specific SOCs are updated.
You're right that it's not constant, but it avoids copy-paste of a
rather large structure just to change a couple of lines.
