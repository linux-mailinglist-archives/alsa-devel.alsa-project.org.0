Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB651461BD1
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Nov 2021 17:35:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 695361AEB;
	Mon, 29 Nov 2021 17:34:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 695361AEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638203717;
	bh=i8jUsuwn11H+33rOpLH6V+oNORl1QqmqQ8p1j7Z1MCE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dyOxOMrND/avUYb0SovW/DMHvLowMG6aNvf4iWx4VONOXkz2PZAurGA1hK8qQ/Zr2
	 E7+DoLvEAgJyvKsWwDuqA4DjLfdJw/nFM2jYy91tSBlRsf3trZX8f1U9frm88SRfXG
	 rhCouKO6XeKCtV8kZ0aAGs9o0+94J7B0rOlREdfQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1BB17F804FB;
	Mon, 29 Nov 2021 17:32:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 25F74F80254; Mon, 29 Nov 2021 17:32:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 933EDF80249
 for <alsa-devel@alsa-project.org>; Mon, 29 Nov 2021 17:32:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 933EDF80249
X-IronPort-AV: E=McAfee;i="6200,9189,10183"; a="322241146"
X-IronPort-AV: E=Sophos;i="5.87,273,1631602800"; d="scan'208";a="322241146"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2021 08:32:17 -0800
X-IronPort-AV: E=Sophos;i="5.87,273,1631602800"; d="scan'208";a="676418580"
Received: from ticela-nm-11.amr.corp.intel.com (HELO [10.212.98.225])
 ([10.212.98.225])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2021 08:32:16 -0800
Subject: Re: [PATCH] ASoC: Intel: hda_dsp_common: don't multiline PCM topology
 warning
To: Chris Down <chris@chrisdown.name>, alsa-devel@alsa-project.org
References: <YaOS0sBueAfApwOx@chrisdown.name>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <e3f48996-2680-3dde-2653-df99a5b0edf0@linux.intel.com>
Date: Mon, 29 Nov 2021 10:27:09 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YaOS0sBueAfApwOx@chrisdown.name>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: tiwai@suse.de,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 broonie@kernel.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>
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



On 11/28/21 8:31 AM, Chris Down wrote:
> On my T14s Gen2 I saw the following:
> 
>     [   16.057258] skl_hda_dsp_generic skl_hda_dsp_generic: hda_dsp_hdmi_build_controls: no PCM in topology for HDMI converter 3
> 
>     [   16.057261] skl_hda_dsp_generic skl_hda_dsp_generic: hda_dsp_hdmi_build_controls: no PCM in topology for HDMI converter 4
> 
>     [   16.057263] skl_hda_dsp_generic skl_hda_dsp_generic: hda_dsp_hdmi_build_controls: no PCM in topology for HDMI converter 5
> 
>     [...and so on.]
> 
> It looks like the double newline is a mistake, so remove one.
> 
> Signed-off-by: Chris Down <chris@chrisdown.name>

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

