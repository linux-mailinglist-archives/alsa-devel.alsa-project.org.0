Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DBA17ED231
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Nov 2023 21:34:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 313EA82A;
	Wed, 15 Nov 2023 21:34:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 313EA82A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700080498;
	bh=sfHNZboaVnHWwEsVgAb8hSxbO+bGVrQdSdI+2IQ3rhU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=b3Z/o/cBVPBOrWF7ibFoCYNuyMFJE01Ss/LKPMCH1+2edmE0qHe/QUGhcXfV8FFhF
	 m1Uap3JXnLrQFJw/OymZ02CRir95MoUh9lssuND4cgQl+LO6MaHvhIEHm64YLfwJLw
	 6+qkXtyxtw6T/fm9x4wEF8lbR6AzQvRsB6s/GF0c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 74BC2F8016E; Wed, 15 Nov 2023 21:34:06 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 87B6EF80166;
	Wed, 15 Nov 2023 21:34:06 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AFF5BF801D5; Wed, 15 Nov 2023 21:34:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 23345F80166
	for <alsa-devel@alsa-project.org>; Wed, 15 Nov 2023 21:33:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23345F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Qb0EIlBn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700080433; x=1731616433;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=sfHNZboaVnHWwEsVgAb8hSxbO+bGVrQdSdI+2IQ3rhU=;
  b=Qb0EIlBn3vgB93QQjGHuHpJoaEQnBICWFmp4Ruvmm5iYyyqY6zZQqg0c
   w0dNvu10fjqFuN3S1rr1+zeo68DVOIM56PVAAeBiYlNxtjutkYu0eMzUs
   Ferdqryd22R1nTjR0z9tY7PlCbyOGIiEOjN3/w+TV2KBZWxQ+d3l5eN/1
   5DbyOoed6sva2Gb0/ZbqSa8q7I7La6Cac72+cgOAOpJ1GnZgOOSPcUv36
   F8jTX1x5mm0E/CFrttfMz3UiGI+S6CDbG8lkP6Si3VmOCk7PDvb6IQBzI
   +pcIjQypHybA2c+QepxMM7DJGYsSaM8sTsOyk6h8/z7BUSPFpVyLBhLdo
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="12503727"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200";
   d="scan'208";a="12503727"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 12:33:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="758603411"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200";
   d="scan'208";a="758603411"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
  by orsmga007.jf.intel.com with SMTP; 15 Nov 2023 12:33:33 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 15 Nov 2023 22:33:32 +0200
Date: Wed, 15 Nov 2023 22:33:32 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: alsa-devel@alsa-project.org, intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] ALSA: hda: i915: Alays handle -EPROBE_DEFER
Message-ID: <ZVUrHJL4387iYEby@intel.com>
References: <20231115123625.74286-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231115123625.74286-1-maarten.lankhorst@linux.intel.com>
X-Patchwork-Hint: comment
Message-ID-Hash: SUUHZTU5HHWV3GBIGWPIC46SNKXCNOF2
X-Message-ID-Hash: SUUHZTU5HHWV3GBIGWPIC46SNKXCNOF2
X-MailFrom: ville.syrjala@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SUUHZTU5HHWV3GBIGWPIC46SNKXCNOF2/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Nov 15, 2023 at 01:36:25PM +0100, Maarten Lankhorst wrote:
> It turns out that even if the comment says that the driver can load
> fine, it's not really the case and no codecs are detected.
> Specifically for -EPROBE_DEFER, always fail the probe.
> 
> This fixes a regression when HDA-intel is loaded before i915.
> 
> Reported-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Tested-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> Fixes: e6d0c13e9f46 ("ALSA: hda: i915: Remove extra argument from snd_hdac_i915_init")
> Cc: Takashi Iwai <tiwai@suse.de>

Appears to work here as well. Thanks.

> 
> ---
> Using Takashi's version, as I like the separate -EPROBE_DEFER if more.
> ---
>  sound/pci/hda/hda_intel.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
> index 058f6e6491f9..8e9a003daa8d 100644
> --- a/sound/pci/hda/hda_intel.c
> +++ b/sound/pci/hda/hda_intel.c
> @@ -2140,6 +2140,9 @@ static int azx_probe(struct pci_dev *pci,
>  	if (chip->driver_caps & AZX_DCAPS_I915_COMPONENT) {
>  		err = snd_hdac_i915_init(azx_bus(chip));
>  		if (err < 0) {
> +			if (err == -EPROBE_DEFER)
> +				goto out_free;
> +
>  			/* if the controller is bound only with HDMI/DP
>  			 * (for HSW and BDW), we need to abort the probe;
>  			 * for other chips, still continue probing as other
> -- 
> 2.40.1

-- 
Ville Syrjälä
Intel
