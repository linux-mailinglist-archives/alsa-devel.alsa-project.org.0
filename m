Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C97C20690B
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jun 2020 02:30:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D69EB17DE;
	Wed, 24 Jun 2020 02:29:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D69EB17DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592958636;
	bh=Tm3RagHb5MR+ryCRpOSVJd9cdI8SnOET7AhUw9utZ54=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eoiX7dn5bpiRT1Z5seGhEF8laKnU83gOTXcSU8yeX+2EiBX69Px2xKoh6DV0ZAztT
	 L9AFglVyo1wHy343aCXYdcmXK8AZ9+QqVSDOv0GI/PKYjvROy4wRgXtuDL6b73nvnX
	 99c4q/41GNhz+oK9EWGxIEpSI1NWNvgUi7mXMmqc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0BD52F800B2;
	Wed, 24 Jun 2020 02:28:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2AC31F80234; Wed, 24 Jun 2020 02:28:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 74501F800B2
 for <alsa-devel@alsa-project.org>; Wed, 24 Jun 2020 02:28:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74501F800B2
IronPort-SDR: 4MHINnp//+S41vFBxjIuXo5Wbduj0Okyc+ChTA7QmqR6l3qBfhaNq4kxwgvJN4CpsDFF6Y31kj
 hVXBRasCxKYw==
X-IronPort-AV: E=McAfee;i="6000,8403,9661"; a="162353260"
X-IronPort-AV: E=Sophos;i="5.75,273,1589266800"; d="scan'208";a="162353260"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2020 17:28:44 -0700
IronPort-SDR: jMZ8seqlBGGDSnj9bd0j9IfoJAecr58HKW4t9EYyHrcEURv2hhDySvGOMP3KbzhZ1gjRzooAHx
 yOk71YCRj6Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,273,1589266800"; d="scan'208";a="479071924"
Received: from jsoloni-mobl.amr.corp.intel.com (HELO [10.254.107.75])
 ([10.254.107.75])
 by fmsmga005.fm.intel.com with ESMTP; 23 Jun 2020 17:28:43 -0700
Subject: Re: [PATCH] ALSA: hda/hdmi: Add Intel silent stream support
To: Harsha Priya <harshapriya.n@intel.com>, alsa-devel@alsa-project.org,
 tiwai@suse.de
References: <1592954796-12449-1-git-send-email-harshapriya.n@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <d9608b01-a111-d5ac-dcf7-c2dfdae79d08@linux.intel.com>
Date: Tue, 23 Jun 2020 19:28:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <1592954796-12449-1-git-send-email-harshapriya.n@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: kai.vehmanen@intel.com, Emmanuel Jillela <emmanuel.jillela@intel.com>
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

2 nit-picks that I missed in previous versions of this patch, sorry:

> diff --git a/sound/pci/hda/Kconfig b/sound/pci/hda/Kconfig
> index 7ba542e45a3d..8804808410b3 100644
> --- a/sound/pci/hda/Kconfig
> +++ b/sound/pci/hda/Kconfig
> @@ -232,4 +232,20 @@ config SND_HDA_POWER_SAVE_DEFAULT
>   
>   endif
>   
> +config SND_HDA_INTEL_HDMI_SILENT_STREAM
> +	bool "Enable Silent Stream always for HDMI"
> +	depends on SND_HDA

nit-pick: should this be 'depends on SND_HDA_INTEL'?
if not, this 'depends on SND_HDA' is redundant, already within an
'if SND_HDA' block

> +	help
> +	  Intel hardware has a feature called 'silent stream', that
> +	  keeps external HDMI receiver's analog circuitry powered on
> +	  avoiding 2-3 sec silence during playback start. This mechanism
> +	  relies on an info packet and preventing the codec from going to
> +	  D3. (increasing the platform static power consumption when a
> +	  HDMI receiver is plugged-in). 2-3 sec silence at the playback
> +	  start is expected whenever there is format change. (default is
> +	  2 channel format).
> +	  Say Y to enable Silent Stream feature.
> +
> +endif
> +

[...]

>   /* update ELD and jack state via audio component */
>   static void sync_eld_via_acomp(struct hda_codec *codec,
>   			       struct hdmi_spec_per_pin *per_pin)
>   {
>   	struct hdmi_spec *spec = codec->spec;
>   	struct hdmi_eld *eld = &spec->temp_eld;
> +	bool monitor_prev, monitor_next;
>   
>   	mutex_lock(&per_pin->lock);
>   	eld->monitor_present = false;
> +	monitor_prev = per_pin->sink_eld.monitor_present;
>   	eld->eld_size = snd_hdac_acomp_get_eld(&codec->core, per_pin->pin_nid,
>   				      per_pin->dev_id, &eld->monitor_present,
>   				      eld->eld_buffer, ELD_MAX_SIZE);
>   	eld->eld_valid = (eld->eld_size > 0);
>   	update_eld(codec, per_pin, eld, 0);
> +	monitor_next = per_pin->sink_eld.monitor_present;
>   	mutex_unlock(&per_pin->lock);
> +
> +	/*
> +	 * Power-up will call hdmi_present_sense, so the PM calls
> +	 * have to be done without mutex held.
> +	 */
> +
> +	if (enable_silent_stream) {
> +		if (!monitor_prev && monitor_next) {
> +			snd_hda_power_up_pm(codec);

nit-pick: is there a need to test the return value? I see this in 
patch_hdmi.c

	ret = snd_hda_power_up_pm(codec);
	if (ret < 0 && pm_runtime_suspended(hda_codec_dev(codec)))
		goto out;

> +			silent_stream_enable(codec, per_pin);
> +		} else if (monitor_prev && !monitor_next)
> +			snd_hda_power_down_pm(codec);
> +	}
>   }
>   
>   static void hdmi_present_sense(struct hdmi_spec_per_pin *per_pin, int repoll)
> 
