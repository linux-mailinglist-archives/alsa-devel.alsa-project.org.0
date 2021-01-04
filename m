Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B002E97FF
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Jan 2021 16:02:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97C971672;
	Mon,  4 Jan 2021 16:01:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97C971672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609772534;
	bh=CQclpzgbtSdZpHTOPiYRM6QmuywaQw4KoZK5fJrpJKE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mH2lgA/7ACDIBNCEYjy0uV1aVJR9HykDQ6onCbMT9vPQVXfKc4EW5fhYxX6CWm339
	 a2hxdKes/1KvZDaIM9AoSktteNqs/Qwa05e8yqtnKkr+tBzfVSn1oMBlRUC6SYVeA/
	 1y1+CiOia/L7CV9mvfhOsM6AO4+SOGBFwB5UJoTc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CCD2CF80166;
	Mon,  4 Jan 2021 16:00:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 21461F80166; Mon,  4 Jan 2021 16:00:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BA8ABF8012C;
 Mon,  4 Jan 2021 16:00:19 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 7CE2DA004B;
 Mon,  4 Jan 2021 16:00:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 7CE2DA004B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1609772418; bh=NBYgMHbbqmHovG+sVQDGeTFC7J2tgqVlSOKHqgUroAs=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=4NVnHObBmMnXi9kIdZofTZIMaTWjRKdmxFDLrtTisQNP++VxeOZfx/477BTKV8sEL
 uiHGnI5Bz9KUiUkxpvxDznI6ke+Vq5/PHun4AGzEh1tPgkk9UIqUcY+EA39BFN/aTF
 WW8t/tazFj8FRS4LhysOWKNVjtC6RUcMRYdRJmN0=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon,  4 Jan 2021 16:00:06 +0100 (CET)
Subject: Re: [PATCH] ALSA: hda: fix SND_INTEL_DSP_CONFIG dependency
To: Arnd Bergmann <arnd@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
References: <20210103135257.3611821-1-arnd@kernel.org>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <3c19a5d5-8883-f917-a96a-f51bb188d115@perex.cz>
Date: Mon, 4 Jan 2021 16:00:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210103135257.3611821-1-arnd@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, Arnd Bergmann <arnd@arndb.de>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 sound-open-firmware@alsa-project.org
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

Dne 03. 01. 21 v 14:52 Arnd Bergmann napsal(a):
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The sof-pci-dev driver fails to link when built into the kernel
> and CONFIG_SND_INTEL_DSP_CONFIG is set to =m:
> 
> arm-linux-gnueabi-ld: sound/soc/sof/sof-pci-dev.o: in function `sof_pci_probe':
> sof-pci-dev.c:(.text+0x1c): undefined reference to `snd_intel_dsp_driver_probe'
> 
> All other drivers using this interface already use a 'select
> SND_INTEL_DSP_CONFIG' statement to force the it to be present, so it
> seems reasonable to do the same here.
> 
> The stub implementation in the header makes the problem harder to find,
> as it avoids the link error when SND_INTEL_DSP_CONFIG is completely
> disabled, without any obvious upsides. Remove these stubs to make it
> clearer that the driver is in fact needed here.
> 
> Fixes: 82d9d54a6c0e ("ALSA: hda: add Intel DSP configuration / probe code")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  include/sound/intel-dsp-config.h | 17 -----------------
>  sound/soc/sof/Kconfig            |  2 ++
>  2 files changed, 2 insertions(+), 17 deletions(-)
> 
> diff --git a/include/sound/intel-dsp-config.h b/include/sound/intel-dsp-config.h
> index d4609077c258..94667e870029 100644
> --- a/include/sound/intel-dsp-config.h
> +++ b/include/sound/intel-dsp-config.h
> @@ -18,24 +18,7 @@ enum {
>  	SND_INTEL_DSP_DRIVER_LAST = SND_INTEL_DSP_DRIVER_SOF
>  };
>  
> -#if IS_ENABLED(CONFIG_SND_INTEL_DSP_CONFIG)

The SOF drivers selects the DSP config code only when required (for specific
platforms - see sound/soc/sof/intel/Kconfig).

It seems that the above if should be modified as:

#if IS_BUILDIN(CONFIG_SND_INTEL_DSP_CONFIG) || (defined(MODULE) &&
IS_MODULE(CONFIG_SND_INTEL_DSP_CONFIG))

So the buildin drivers which do not require the DSP config probe can be
compiled without this dependency.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
