Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A8375C5E8
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 13:32:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5D4E1F7;
	Fri, 21 Jul 2023 13:32:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5D4E1F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689939171;
	bh=dXgGdDZe21q+A6YjKZPUfJZVifU9r1MKAmEsUXEnEPo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LnoUhSU8wqgcY+piNiYixZ7bWtB1Alems3H4lLc8knEQ0ovFR4oaqoqalFncwDZPK
	 lXxJ9JwwvAfxrxH6YVOEora9SQSv2MG8w70LPDuRV9+bB8mQU/QvEdHU3a2ZVp4P2s
	 GMk3V1TzOQ5+g+WZUtGELemcPmiNOYTh7jRrFi94=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A94D7F80552; Fri, 21 Jul 2023 13:32:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C58D0F8032D;
	Fri, 21 Jul 2023 13:31:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 46D1DF8047D; Fri, 21 Jul 2023 13:31:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E0328F8007E;
	Fri, 21 Jul 2023 13:31:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0328F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=dTTTfDlA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689939106; x=1721475106;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=dXgGdDZe21q+A6YjKZPUfJZVifU9r1MKAmEsUXEnEPo=;
  b=dTTTfDlApnlIV2AzHmPgabb0FWpbOOehr+xA1VWAISNDpzgoTGr6+aNt
   3ctIkt4rZpY68keWJIDHA0+otCws9lQHAPLSqzx5XgzYmYXYZWX7+FZy3
   HfErIbMkk9qJoJckUxOxt59uaDOyal9nf23OupcRGekzP7COxkZX+e13R
   UdX3xlSjP7EH2m1AxL/SwyW7dO/cPQ8nk5I03ehuMcOOay0A5ICjYmAJJ
   GzrF9sIQB8EAzxESciqa8ePUT2FtC5lAb2ObbO3woNY9T7a833GyfeVRY
   bla5Fv5b8dlZ/TTXeRuGIYli8398nnGYQnbUlRPzZXpLw2fU3+diNWky+
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="433230778"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200";
   d="scan'208";a="433230778"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 04:31:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200";
   d="scan'208";a="868217214"
Received: from dhardfel-mobl1.ger.corp.intel.com (HELO [10.251.223.78])
 ([10.251.223.78])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 04:31:36 -0700
Message-ID: <a01b804f-345b-153f-1112-b7057400e8c8@linux.intel.com>
Date: Fri, 21 Jul 2023 14:32:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [PATCH v2 3/9] ALSA: hda/i915: Add an allow_modprobe argument to
 snd_hdac_i915_init
Content-Language: en-US
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 alsa-devel@alsa-project.org
Cc: sound-open-firmware@alsa-project.org, linux-kernel@vger.kernel.org,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Mark Brown
 <broonie@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>
References: <20230719164141.228073-1-maarten.lankhorst@linux.intel.com>
 <20230719164141.228073-4-maarten.lankhorst@linux.intel.com>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20230719164141.228073-4-maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QPMJWMB3NBHNBQZ5LBUM3FBU5YYOCYDR
X-Message-ID-Hash: QPMJWMB3NBHNBQZ5LBUM3FBU5YYOCYDR
X-MailFrom: peter.ujfalusi@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QPMJWMB3NBHNBQZ5LBUM3FBU5YYOCYDR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 19/07/2023 19:41, Maarten Lankhorst wrote:
> Xe is a new GPU driver that re-uses the display (and sound) code from
> i915. It's no longer possible to load i915, as the GPU can be driven
> by the xe driver instead.
> 
> The new behavior will return -EPROBE_DEFER, and wait for a compatible
> driver to be loaded instead of modprobing i915.
> 
> Converting all drivers at the same time is a lot of work, instead we
> will convert each user one by one.
> 
> Changes since v1:
> - Use dev_err_probe to set a probe reason for debugfs' deferred_devices.
> 
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>  include/sound/hda_i915.h        | 4 ++--
>  sound/hda/hdac_i915.c           | 8 ++++----
>  sound/pci/hda/hda_intel.c       | 2 +-
>  sound/soc/intel/avs/core.c      | 2 +-
>  sound/soc/intel/skylake/skl.c   | 2 +-
>  sound/soc/sof/intel/hda-codec.c | 2 +-
>  6 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/sound/hda/hdac_i915.c b/sound/hda/hdac_i915.c
> index c32709fa4115f..961fcd3397f40 100644
> --- a/sound/hda/hdac_i915.c
> +++ b/sound/hda/hdac_i915.c
> @@ -155,7 +155,7 @@ static int i915_gfx_present(struct pci_dev *hdac_pci)
>   *
>   * Returns zero for success or a negative error code.
>   */
> -int snd_hdac_i915_init(struct hdac_bus *bus)
> +int snd_hdac_i915_init(struct hdac_bus *bus, bool allow_modprobe)
>  {
>  	struct drm_audio_component *acomp;
>  	int err;
> @@ -171,7 +171,7 @@ int snd_hdac_i915_init(struct hdac_bus *bus)
>  	acomp = bus->audio_component;
>  	if (!acomp)
>  		return -ENODEV;
> -	if (!acomp->ops) {
> +	if (allow_modprobe && !acomp->ops) {
>  		if (!IS_ENABLED(CONFIG_MODULES) ||
>  		    !request_module("i915")) {
>  			/* 60s timeout */
> @@ -180,9 +180,9 @@ int snd_hdac_i915_init(struct hdac_bus *bus)
>  		}
>  	}
>  	if (!acomp->ops) {
> -		dev_info(bus->dev, "couldn't bind with audio component\n");
> +		int err = allow_modprobe ? -ENODEV : -EPROBE_DEFER;

Add one blank line here.

>  		snd_hdac_acomp_exit(bus);
> -		return -ENODEV;
> +		return dev_err_probe(bus->dev, err, "couldn't bind with audio component\n");
>  	}
>  	return 0;
>  }

-- 
Péter
