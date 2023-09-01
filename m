Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E8B78FD0E
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Sep 2023 14:20:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A113BA4E;
	Fri,  1 Sep 2023 14:19:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A113BA4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693570838;
	bh=6fhqpXo0/Z0lw7VbNhZ+LrcTlrYs6pwKdmefppNW2kg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DTRLmrQeeP8+/vqe9vggA0ipJZbMjQGhQxVm8oz1dnas4QUVR5/cl83gtYkc+t7Qe
	 2REEyBTtiUw3cTNU+As+4YVo2rH7FO86UmLWi1EbqTDw6/1gsaSHeyrF76togDrHOD
	 cRv1A09+NlnB9DDFyxRb/F2A8exIlUmSTrM9PwW8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EAAB2F80236; Fri,  1 Sep 2023 14:19:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B80AF80155;
	Fri,  1 Sep 2023 14:19:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4EE61F80158; Fri,  1 Sep 2023 14:19:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3C455F80074;
	Fri,  1 Sep 2023 14:19:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C455F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Rg9/2oL0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693570776; x=1725106776;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=6fhqpXo0/Z0lw7VbNhZ+LrcTlrYs6pwKdmefppNW2kg=;
  b=Rg9/2oL03WSwEBLXcnTaY9IuWfY+xXUjILlSBzBJtXfhMSfIxjMcKGEc
   UM4//Snco0agmUDxZV9zNPVK0TizubtSlpVck90yhmzwFvhMtFsSdv2ep
   hWsuqPRq1gs+BpWhDS3AwiU4iNeeK4Ue3RLlap3A6XM3FTak6hsm7GePt
   4DypKpLi/YphKXp3jn2RoYHdQfoDMSQP2tbNHyQpDsL4XLCXA06TROMBa
   aiKb9PhHpm80fDMv2w3fFzNVACOyVZcK6Kp0bB5EYSreWDSMFcvy8BqsW
   s16AhG5qy0pjP3hIEaUgvt+Krf+joiddYVlLfCaoKMsdzfSgygTX+LQ1W
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="373605723"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000";
   d="scan'208";a="373605723"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2023 05:19:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="986659994"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000";
   d="scan'208";a="986659994"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2023 05:19:23 -0700
Date: Fri, 1 Sep 2023 15:15:25 +0300 (EEST)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
cc: alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>,
    Takashi Iwai <tiwai@suse.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
    Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
    Liam Girdwood <liam.r.girdwood@linux.intel.com>,
    Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
    Bard Liao <yung-chuan.liao@linux.intel.com>,
    Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
    Kai Vehmanen <kai.vehmanen@linux.intel.com>,
    Mark Brown <broonie@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>,
    linux-kernel@vger.kernel.org, sound-open-firmware@alsa-project.org
Subject: Re: [PATCH v4 01/11] ASoC: SOF: core: add 'no_wq' probe and remove
 callbacks
In-Reply-To: <20230830153652.217855-2-maarten.lankhorst@linux.intel.com>
Message-ID: 
 <alpine.DEB.2.22.394.2309011509200.3532114@eliteleevi.tm.intel.com>
References: <20230830153652.217855-1-maarten.lankhorst@linux.intel.com>
 <20230830153652.217855-2-maarten.lankhorst@linux.intel.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: PYQHJV32PJAML2L5TPDDY3AMKRW555I5
X-Message-ID-Hash: PYQHJV32PJAML2L5TPDDY3AMKRW555I5
X-MailFrom: kai.vehmanen@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PYQHJV32PJAML2L5TPDDY3AMKRW555I5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

On Wed, 30 Aug 2023, Maarten Lankhorst wrote:

> With the upcoming changes for i915/Xe driver relying on the
> -EPROBE_DEFER mechanism, we need to have a first pass of the probe
> which cannot be pushed to a workqueue. Introduce 2 new optional
> callbacks.
[...]
> diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
> index 30db685cc5f4b..54c384a5d6140 100644
> --- a/sound/soc/sof/core.c
> +++ b/sound/soc/sof/core.c
> @@ -327,8 +327,6 @@ static int sof_probe_continue(struct snd_sof_dev *sdev)
>  dsp_err:
>  	snd_sof_remove(sdev);
>  probe_err:
> -	sof_ops_free(sdev);
> -

this seems a bit out-of-place in this patch. It seems a valid change,
but not really related to this patch, right?

We seem to have a related fix waiting to be sent to alsa-devel, by
Peter:
"ASoC: SOF: core: Only call sof_ops_free() on remove if the probe wa"
https://github.com/thesofproject/linux/pull/4515

... not yet in Mark's tree.

Otherwise patch looks good to me.

Br, Kai
