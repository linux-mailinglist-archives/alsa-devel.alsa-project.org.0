Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C86E3248421
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Aug 2020 13:48:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 43CF5175A;
	Tue, 18 Aug 2020 13:47:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 43CF5175A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597751306;
	bh=c4RTDm+bQDVsVXtTsgxB5+RzarfMd8NXCoaY3rG4YL0=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ukG6c+UU2I5e0Nf/zOWfxzG2vTYglNypWrlBCQBYmcWNWGAEA+6g43ehbF+N2V96j
	 PscXLPsR6DMs3ZMyc1jEGNM+3RZKOs4+mgfmFcxltwQvSGxk8pi9JDL1vMWmp2WmRS
	 0pnNLwKNVVPMLs7u79pq+i5mLDb2lBGNSxkslkMg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7069EF800D3;
	Tue, 18 Aug 2020 13:46:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 93EC2F8023F; Tue, 18 Aug 2020 13:46:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 12B4BF80104
 for <alsa-devel@alsa-project.org>; Tue, 18 Aug 2020 13:46:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12B4BF80104
IronPort-SDR: T11LfDyZsoFXa1rz0Bg5iLsqzhBPfZVxG+dlxS/7RasllP+OMxwxlrZzADkQ/rCBrhTH0vluaI
 CcpMzlkVQyWg==
X-IronPort-AV: E=McAfee;i="6000,8403,9716"; a="155965157"
X-IronPort-AV: E=Sophos;i="5.76,327,1592895600"; d="scan'208";a="155965157"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2020 04:46:27 -0700
IronPort-SDR: j87VtALN7VSQc97EPgjRULRXw0y2yHJyT8gk7363BfV7YVOW5Fq/nlRvuUBILX0Rcgi5NKLmi0
 7Hd9QSeTXagA==
X-IronPort-AV: E=Sophos;i="5.76,327,1592895600"; d="scan'208";a="471777754"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2020 04:46:25 -0700
Date: Tue, 18 Aug 2020 14:45:22 +0300 (EEST)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Brent Lu <brent.lu@intel.com>
Subject: Re: [PATCH v2] ASoC: hdac_hdmi: support 'ELD' mixer
In-Reply-To: <20200818004413.12852-1-brent.lu@intel.com>
Message-ID: <alpine.DEB.2.22.394.2008181311430.3186@eliteleevi.tm.intel.com>
References: <20200814083436.19845-1-brent.lu@intel.com>
 <20200818004413.12852-1-brent.lu@intel.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 =?ISO-8859-2?Q?Amadeusz_S=B3awi=F1ski?= <amadeuszx.slawinski@linux.intel.com>
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

Hey,

a general comment first. We are trying to move development to patch_hdmi, 
but given we still have platforms using hdac_hdmi, this patch seems like a 
useful addition.

On Tue, 18 Aug 2020, Brent Lu wrote:

> Add an binary mixer 'ELD' to each HDMI PCM device so user space
> could read the ELD data of external HDMI display.

Minor spelling fixes:
"Add a binary mixer"
"so user space can read"

> +static int hdac_hdmi_eld_ctl_get(struct snd_kcontrol *kcontrol,
> +			    struct snd_ctl_elem_value *ucontrol)
> +{
[...]
> +	list_for_each_entry(port, &pcm->port_list, head) {
> +		eld = &port->eld;
> +
[...]
> +		memcpy(ucontrol->value.bytes.data, eld->eld_buffer,
> +		       eld->eld_size);
> +		break;
> +	}

This is a bit iffy part. If same PCM is connected to multiple receivers, 
you return ELD data for the first one and ignore the rest. OTOH, this is 
inline with comment in hdac_hdmi_get_port_from_cvt() in that this 
pcm-to-many routing is not really supported by the driver now. But
jack status reporting is done a port basis, not per PCM/CVTs, so this is 
not fully aligned.

Hmm. Given the proposed patch is aligned with the user-space interface 
exposed by patch_hdmi.c, I'm ok to go with this. Can you add an explicit 
comment to explain what is happening above?

Br, Kai
