Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B46C17E0BF
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Mar 2020 14:03:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF836166B;
	Mon,  9 Mar 2020 14:02:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF836166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583758990;
	bh=BFqdFx8ZvwQJHzJ40KzGPDGu5e8ioUPGPBC0VfjzskM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SVdVx9K8bOM1EEduMYE/t0pcAuuZQk49SP0PL/qS8UOTjlFpc9fqzebZEU/obJONO
	 d9sEyZLbuw9wBus55zIXOKDObNpmkzU45S4SpAcTm4McDeELmdti0ltO97aCEer9we
	 QRfWgxP7Z9D8dFVVrWhAaWQNRTOV7DifsRM1Himw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D897DF80123;
	Mon,  9 Mar 2020 14:01:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C52BF801EB; Mon,  9 Mar 2020 14:01:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8A03CF800DA
 for <alsa-devel@alsa-project.org>; Mon,  9 Mar 2020 14:01:23 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 0517EA0040;
 Mon,  9 Mar 2020 14:01:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 0517EA0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1583758883; bh=U8qXPJoVGFE1IDqLTmea3QXSDkw1MJOnlF5xiJc/OUA=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=FYuE5VJLi3lyPrVisI/Bhp4gNUMhGfyGsGiU06XADNdvknZuNlo45g7L8Jsk52rDQ
 5Tm/WIi0Tlem/+57hw7kHCXC/SN/HpTe7x3wE6xPPE94FPJfgsYPGP6IfxSNDW6I/7
 BNhz0hPGnpJ8iX1LCWdcHLbW++Apc1ddz49Qyi64=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon,  9 Mar 2020 14:01:18 +0100 (CET)
Subject: Re: [PATCH] ucm2: hdadsp: add basic ucm config
To: Mateusz Gorski <mateusz.gorski@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20200306113031.713-1-mateusz.gorski@linux.intel.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <4e2e3345-81d0-c698-d589-d4db5faff288@perex.cz>
Date: Mon, 9 Mar 2020 14:01:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200306113031.713-1-mateusz.gorski@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: cezary.rojewski@intel.com, tiwai@suse.com
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

Dne 06. 03. 20 v 12:30 Mateusz Gorski napsal(a):
> Basic UCM configuration for HDA DSP generic enabling codec playback and
> capture on both HDA codec and DMIC ports.

Could you describe for what Linux driver (source code) is this configuration?

> 
> Signed-off-by: Mateusz Gorski <mateusz.gorski@linux.intel.com>
> ---
>   ucm2/hdadsp/hdadsp.conf | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
>   create mode 100644 ucm2/hdadsp/hdadsp.conf
> 
> diff --git a/ucm2/hdadsp/hdadsp.conf b/ucm2/hdadsp/hdadsp.conf
> new file mode 100644
> index 0000000..4e98545
> --- /dev/null
> +++ b/ucm2/hdadsp/hdadsp.conf
> @@ -0,0 +1,16 @@
> +# UCM for Intel CAVS platforms
> +# For Audio in HDA and DMIC mode
> +
> +ValueDefaults {
> +	PlaybackChannels "2"
> +	PlaybackPriority "1"
> +	CaptureChannels "2"
> +	CapturePriority "2"
> +}

Remove PlaybackChannel and Priority defaults. The priorities should be defined 
in the device section.

> +
> +SectionDefaults [
> +	cdev "hw:hdadsp"

It should be "hw:${CardId}" for ucm2.

> +	cset "name='codec0_out mo media0_in mi Switch' 1"
> +	cset "name='media0_out mo codec0_in mi Switch' 1"
> +	cset "name='mch_cap_out mo mch_cap_in mi Switch' 1"
> +]

This file does not define any devices. Does pulseaudio work with this 
configuration?

						Jaroslav


-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
