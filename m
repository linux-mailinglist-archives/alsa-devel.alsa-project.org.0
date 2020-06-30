Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA4A20F40F
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jun 2020 14:00:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D82B91676;
	Tue, 30 Jun 2020 13:59:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D82B91676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593518427;
	bh=lLgmEASFIDcGEe2LDUia7Bb55U+5VIx/wPuONfPm9Dc=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G5sLu65mbBaOdfIgsYmydn8rAZITIkhGyWjkg6Ha8ffql+/ENGdKh6HwRsxBWwAG9
	 +okfb5MMt3QkAYzzjLEarcKTNwGj4dUCD5GffKtQ3BlEJdndS1dtKVG3A3BXipZPCN
	 YDr8xOlEvuY7G5QHU+8e1co1fjATWgbzQPE8G894=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A5A3F800EA;
	Tue, 30 Jun 2020 13:58:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 36545F8022D; Tue, 30 Jun 2020 13:58:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DC91AF800EA
 for <alsa-devel@alsa-project.org>; Tue, 30 Jun 2020 13:58:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC91AF800EA
IronPort-SDR: ghiN9Ri6k2U8Q1BP1qmO+/4CfUV3y1vnalVTtjWFUejbspBrglguOiG0z+rPMS+Oj+BEfQ9wag
 smYJfWvrv9hQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9666"; a="134511767"
X-IronPort-AV: E=Sophos;i="5.75,297,1589266800"; d="scan'208";a="134511767"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2020 04:58:38 -0700
IronPort-SDR: 7cG7SOguOvSZ7+Jo938xhxA7Stz5pla6ufWXiUABPUU25UjoF0j74hVCWz9yy49VIRLz2l/uaV
 ibVqn2dB8brw==
X-IronPort-AV: E=Sophos;i="5.75,297,1589266800"; d="scan'208";a="454585115"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2020 04:58:36 -0700
Date: Tue, 30 Jun 2020 14:58:13 +0300 (EEST)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Harsha Priya <harshapriya.n@intel.com>
Subject: Re: [PATCH v2] ALSA: hda/hdmi: Add Intel silent stream support
In-Reply-To: <1593476606-24147-1-git-send-email-harshapriya.n@intel.com>
Message-ID: <alpine.DEB.2.22.394.2006301432390.3186@eliteleevi.tm.intel.com>
References: <1593476606-24147-1-git-send-email-harshapriya.n@intel.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8BIT
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Takashi Iwai <tiwai@suse.de>, kai.vehmanen@intel.com,
 alsa-devel@alsa-project.org, Emmanuel Jillela <emmanuel.jillela@intel.com>
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

Hi,

hmm, I think a few review comments from Takashi were missed. See inline:

On Mon, 29 Jun 2020, Harsha Priya wrote:

> --- a/sound/pci/hda/Kconfig
> +++ b/sound/pci/hda/Kconfig
> @@ -232,4 +232,20 @@ config SND_HDA_POWER_SAVE_DEFAULT
>  
>  endif
>  
> +config SND_HDA_INTEL_HDMI_SILENT_STREAM
> +	bool "Enable Silent Stream always for HDMI"
> +	depends on SND_HDA_INTEL

Takashi requested to limit this to Intel hardware only, and despite the 
its name, SND_HDA_INTEL is not sufficient to do this.

I think best would be to take silent stream into use in
intel_hsw_common_init(). That indirection would also protect against 
user-space modifying the module parameter value during execution (it is 
only evaluated in intel_hsw_common_init()).

> +	if (enable_silent_stream && eld->eld_valid) {
> +		int pm_ret;
> +
> +		if (!monitor_prev && monitor_next && eld->eld_valid) {
> +			pm_ret = snd_hda_power_up_pm(codec);
> +			if (pm_ret < 0)
> +				codec_err(codec,
> +				"Monitor plugged-in, Failed to power up codec ret=[%d]\n",
> +				pm_ret);
> +			silent_stream_enable(codec, per_pin);
> +		} else if (monitor_prev && !monitor_next && !eld->eld_valid) {
> +			pm_ret = snd_hda_power_down_pm(codec);
> +			if (pm_ret < 0)
> +				codec_err(codec,
> +				"Monitor plugged-out, Failed to power down codec ret=[%d]\n",
> +				pm_ret);
> +		}
> +	}

There a bug in above, outer "if" checks for "eld_valid" while inner 
"else-if" checks for "!eld_valid" -> latter can never be reached.

Takashi, I was checking older code history on the acomp interface, and at 
least on Intel platforms using acomp, it is sufficient to check for 
eld->monitor_present. I.e. in

»       eld->eld_size = snd_hdac_acomp_get_eld(&codec->core, per_pin->pin_nid,
»       »       »       »             per_pin->dev_id, &eld->monitor_present,
»       »       »       »             eld->eld_buffer, ELD_MAX_SIZE);
»       eld->eld_valid = (eld->eld_size > 0);

... monitor_present will always be 0 if eld_size<0 (and eld_valid is 
set to 0). An error monitor_present will not be set, but 
sync_eld_via_acomp() initialized the value to 0 for this case.

The additional checks in the patch are thus harmless, but make the code a 
bit suspicious looking. If the above did not hold, you could have a 
sequence like

monitor_prev=0, monitor_next=1, eld_valid=1   -> power-up
monitor_prev=1, monitor_next=0, eld_valid=0   -> no op
monitor_prev=0, monitor_next=1, eld_valid=1   -> power-up again

.. so the refcounting would go out of sync. So I'd rather just track the 
two variables.

Br, Kai
