Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 560E75BD401
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Sep 2022 19:44:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF87684C;
	Mon, 19 Sep 2022 19:43:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF87684C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663609449;
	bh=+PI6pO3iUcjYFdvTFkYuPFzkS+YO04+LsIa7vF+/V3w=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k6uOj7tdPqUiqUGqQR0+3UZBuq91w5D+w0tuIL8jutWKvB/thdXupG87nB8IYbRY1
	 TmBEbT47n1i4vbkI8CnHICVSYnnSMaxzRq+yMr3ZlWroK+AhzgKat3tLShCdDgRNQ7
	 GgtCaNzywEN75Lkcc4QySzi36vz4AlhntYfxMCkI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E2EAF8032B;
	Mon, 19 Sep 2022 19:43:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D9929F80134; Mon, 19 Sep 2022 19:43:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 16075F80134
 for <alsa-devel@alsa-project.org>; Mon, 19 Sep 2022 19:42:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16075F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="NbC9lNbg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663609386; x=1695145386;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=+PI6pO3iUcjYFdvTFkYuPFzkS+YO04+LsIa7vF+/V3w=;
 b=NbC9lNbgYy+WXH9Ahl0lRUFjTTOyVXHjCkpkkgvnc7mtwuiwxOY3BKjd
 qluejaUch4HL46zOme5xpG0szn81SDnFAjkG1qYTlnXFfQKvdOJArj7/w
 QxwWrYAsXXrfctD82c1rs9huvd9/aVkoVSIzAFNaPbWWfwYgtRwyEf6qI
 ByfIOIrzAtErz99sDEJMI4UAuAjuqq2muoMJEH0MQZfnIErSsaMZgeU1r
 IhK4btSXXhGlxcHts3fUpNduAqNr7xMRkpIGosS+E5HZDmytYG8JcxJtE
 3Audb8Hv8ID7DMwUQIiBeLvkrYRno/o7RuvVo4nV0ZtArRXMoSlgtj68D A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10475"; a="286513574"
X-IronPort-AV: E=Sophos;i="5.93,328,1654585200"; d="scan'208";a="286513574"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 10:42:39 -0700
X-IronPort-AV: E=Sophos;i="5.93,328,1654585200"; d="scan'208";a="569740478"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 10:42:37 -0700
Date: Mon, 19 Sep 2022 20:43:28 +0300 (EEST)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: HDA HDMI PCM device allocation
In-Reply-To: <2f37e0b2-1e82-8c0b-2bbd-1e5038d6ecc6@perex.cz>
Message-ID: <alpine.DEB.2.22.394.2209192042470.2722275@eliteleevi.tm.intel.com>
References: <2f37e0b2-1e82-8c0b-2bbd-1e5038d6ecc6@perex.cz>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: Takashi Iwai <tiwai@suse.de>,
 ALSA development <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
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

On Mon, 19 Sep 2022, Jaroslav Kysela wrote:

> We have two methods to map the PINs in the HDA HDMI driver to the PCM devices
> (legacy/static - 1:1 mapping, dynamic - used for new devices with the MST
> capability). There is also set of converters in each HDMI codec and the number
> of simultaneously used PCM devices cannot go beyond this count of converters
> in hardware (otherwise -EBUSY error is returned). The count of converters is 3
> or 4 depending on the hardware.

roughly yes. There is some further details and variation in implementation 
the dynamic method if you look at patch_hdmi.c:generic_hdmi_build_pcms(). 
E.g. recently we added 'dyn_pcm_no_legacy' to start limiting the amount of 
PCM nodes created. But yeah, this is exactly to move to the direction you 
are proposing.

> Things to discuss:
> 
> It seems quite straight to limit the count of created PCMs to the count of
> converters. We cannot use more anyway and it does not help, if more PCM
> devices are allocated (and Jacks reported) to applications when they cannot be
> used simultaneously.

5~Agreed. When the amount of HDA pins (~= possible physical ports) was 
small, and before DP-MST (or when DP-MST was available only on a small 
subset of physical ports), there was clear value in having sticky 
PIN-to-PCMx mapping. If you plugged a monitor to certain HDMI or DP port, 
it would show up in the same PCM node. If you had a DP-MST hub, the 
monitor/receivers behind the hub, would also end up mapped to the 
familiar ALSA PCM nodes.

But especially with USB-C, the # of possible topologies has shot up 
(basicly any port can host a DP-MST hub), making this approach less and 
less practical.

With SOF, we had further constraints in integrating with ASoC, so we've 
basicly limited PCM (FE) nodes to number of converters (PCM BEs) from the 
start. Now with dyn_pcm_no_legacy, this starts to be used also with 
non-DSP usage via snd-hda-intel (with Intel Tiger Lake and newer). At 
least so far we've not got any negative feedback on this, so road seems 
clear to move ahead with this approach. There is certainly a lot of cruft 
in the code to maintain all the legacy options.

> There is a corner case, when more HDMI devices are connected than the count of
> converters. In this case, an extra method (a module parameter and/or a control
> element and/or procfs) may be used to filter unwanted HDMI devices. It may be

At least on Intel platforms this is not a problem. The number of 
converters is aligned with number of display pipes. So you'll never have 
more HDMI devices connected than the max number of converters.

> Impact to applications:
> 
> Those days, pulseaudio or pipewire servers are mostly used on the current
> hardware. Both servers share the legacy probe code for HDMI devices - they are
> trying to open PCM devices sequentially and check for the error code. There
5~> should not be a problem when the connected HDMI devices do not go 
beyond the
> count of converters. A minor issue is that the name of the used sink/port may
> be different (users may be forced to reselect the output path).
> 
> For other applications, the PCM device assigned to the connected HDMI device
> may be different (available in a different ALSA device name). I do not think
> that it's a big issue. It should be easy solvable with an updated software
> configuration.

Ack, and this model is already required for smooth integration. With 
snd-hda-intel, while PCM routing tries to maintain legacy PCM mapping, it 
cannot be guaranteed in all possible cases. On systems using SOF, there's 
no legacy mapping at all.

So the right (and robust) approach for apps to select the PCM for 
HDMI/DP audio is to use:
 - UCM tells which kcontrol to monitor for jack event
	- JackControl "HDMI/DP,pcm=3 Jack"
 - Jack control tells whether receiver is connected or not
	- "numid=22,iface=CARD,name='HDMI/DP,pcm=3 Jack'"
 - the ELD data describes receiver properties 
	- "numid=27,iface=PCM,name='ELD',device=3"

The above is done by Pulseaudio when UCM is used (and followed by 
Pipewire) and CRAS on ChromeOS. The above can give user sensible GUI 
information on where to route the audio, and provide enough tools for 
applications to provide persistancy (audio is routed to Foobar XYZ monitor 
always, indepedently of the order in which the display/receivers are 
discovered).

In simple setups (one HDMI/DP receiver with audio capability connected), 
the receiver is always connected to the first HDMI/DP PCM of the card.

Br, Kai
