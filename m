Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D75551680A9
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Feb 2020 15:46:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8249116C7;
	Fri, 21 Feb 2020 15:45:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8249116C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582296404;
	bh=VKwF3VJS6pNHqxrTvowpCTEnvTTRksPoXXumpXBXuP4=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cCJGOG77EoBvPM4FLySn1GOXHE0V4coh+VoUddRiPJEK2+ImId1PSoqSL8OUGiUR+
	 Ixyi0HhseF2SjvLkm51PXuhdXDKq9hCxhS+ntT/wxJRfNnPI+yPrJstw8sus/8UbGd
	 JB82qcYsgQsFRcY0Uf+WlXShQSYYexFXRxKUCDtc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A4A79F80240;
	Fri, 21 Feb 2020 15:45:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 92516F80240; Fri, 21 Feb 2020 15:45:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 53B8CF80114
 for <alsa-devel@alsa-project.org>; Fri, 21 Feb 2020 15:44:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53B8CF80114
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Feb 2020 06:44:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,468,1574150400"; d="scan'208";a="236590411"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga003.jf.intel.com with ESMTP; 21 Feb 2020 06:44:51 -0800
Date: Fri, 21 Feb 2020 16:44:51 +0200 (EET)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Jaroslav Kysela <perex@perex.cz>, ranjani.sridharan@linux.intel.com
Subject: Re: [PATCH] ASoC: SOF - topology - do not change the link trigger
 order for pre-1.4 firmware
In-Reply-To: <20200221100739.3883842-1-perex@perex.cz>
Message-ID: <alpine.DEB.2.21.2002211510050.2957@eliteleevi.tm.intel.com>
References: <20200221100739.3883842-1-perex@perex.cz>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: Takashi Iwai <tiwai@suse.de>,
 ALSA development <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

+Ranjani who did the link reorder patch 

On Fri, 21 Feb 2020, Jaroslav Kysela wrote:

> This patch is for SOF v1.3 firmware. The DSP firmware will crash (DSP oops)
> without this patch. The 1.4.1 firmare has this issue fixed.
> 
> The ABI version is used for the comparison, because the firmware version
> for the firmware files before 1.4.2 was not set properly (git hash was
> used).

build fails when this is applied on broonie/for-next. You need an 
additional

--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -3108,6 +3108,7 @@ static int sof_link_load(struct snd_soc_component 
*scomp, int index,
                         struct snd_soc_dai_link *link,
                         struct snd_soc_tplg_link_config *cfg)
 {
+       struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
        struct snd_soc_tplg_private *private = &cfg->priv;


> -             /* set trigger order */
> -             link->trigger[0] = SND_SOC_DPCM_TRIGGER_POST;
> -             link->trigger[1] = SND_SOC_DPCM_TRIGGER_POST;
> +             /* this causes DSP panic on firmware v1.3 */
> +             if (v->abi_version > SOF_ABI_VER(3, 7, 0)) {
> +                     /* set trigger order */
> +                     link->trigger[0] = SND_SOC_DPCM_TRIGGER_POST;
> +                     link->trigger[1] = SND_SOC_DPCM_TRIGGER_POST;

My results with older firmwares and this patch are a bit mixed. When I 
apply this patch and boot with v1.3 FW on a CFL platform (ABI 3.7.0, 
version 1:1:0-5dd9a), I get a DSP panic at stream stop with this patch, 
but _without_ it, playback is fine. :P

I tested both v1.3.1 and v1.3, and I get a DSP panic at stream stop with 
your patch (ABI 3:7:0 on both of these so trigger order is not changed). 
With v1.4 and all newer, streaming works as expected.

The original problem was sensitive to timing, so apparently there is still 
some variation how this triggers on different platforms. With 1.4, 1.4.1 
and 1.4.2 now out, primary solution is just to upgrade the firmware.

If this fix helps with some real-life case to cope with an old firmware, 
we should probably still consider this. Ranjani, does the above make 
sense?

Br, Kai
