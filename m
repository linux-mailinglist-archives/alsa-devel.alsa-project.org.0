Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6803EF77B1
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Nov 2019 16:33:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CCED91682;
	Mon, 11 Nov 2019 16:32:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CCED91682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573486395;
	bh=X5YVAVaU9L1lFwo/+d67ydjp0wLeY1yL3Ye4DJIRJe4=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ThjGv2j986JPlsLblMhYpwsQCQEGjQ2PMGQHT5uBRy/u+zKGkYsGidgCoYxntK7hC
	 KhifydhVeXFdFkEsbsMnCNwSGKC73mTGEPJ+cu7UiV473gKMDAZ2z+amHNDpM+w8vC
	 hUt1SYY9XpWyTgEaN2IyRD0uVkwovoYJnJooOrAU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 54956F805A0;
	Mon, 11 Nov 2019 16:32:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3F3C2F80518; Mon, 11 Nov 2019 16:32:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9C66CF8045D
 for <alsa-devel@alsa-project.org>; Mon, 11 Nov 2019 16:32:00 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 6503DA0040;
 Mon, 11 Nov 2019 16:32:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 6503DA0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1573486320; bh=aVe9bKjIrmdqq6Vw0VJLd0ELMSioPkLHvQnN+0wX0iY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=GR6pznZsfzn1bsPs6bkWmJTUTB8sL7jJk3+NsZQtdThhXJ5HF14JIntvUHYblycj1
 3vl3Q0Tl5blazSKcUsXhyGXwXBE4sn3Ozys/GOyJUT9/A+KjsPJyKndyA6qru1XJUD
 nqeJDuhyPy+Meo9f9wPM40hB4B2oreCkq+ZmmfFc=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon, 11 Nov 2019 16:31:57 +0100 (CET)
To: Curtis Malainey <cujomalainey@chromium.org>, alsa-devel@alsa-project.org
References: <20191107015808.26844-1-cujomalainey@chromium.org>
 <20191107015808.26844-8-cujomalainey@chromium.org>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <8d37c722-978c-5323-0536-156e513bcc29@perex.cz>
Date: Mon, 11 Nov 2019 16:31:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191107015808.26844-8-cujomalainey@chromium.org>
Content-Language: en-US
Cc: broonie@kernel.org
Subject: Re: [alsa-devel] [PATCH 08/11] ucm: docs: Add CaptureChannelMap
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Dne 07. 11. 19 v 2:58 Curtis Malainey napsal(a):
> Explains to userspace how some channels may need to be rearranged. This
> is useful for systems that may have DMIC pcms with dead channels that
> will need remapping.
> 
> Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
> ---
>   include/use-case.h | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/include/use-case.h b/include/use-case.h
> index 31f9e4be..9a10f390 100644
> --- a/include/use-case.h
> +++ b/include/use-case.h
> @@ -305,6 +305,9 @@ int snd_use_case_get_list(snd_use_case_mgr_t *uc_mgr,
>    *      - Remap channels using ALSA PCM channel mapping API notation
>    *        E.g. "2 3 0 1 -1 -1 -1 -1 -1 -1 -1" means, FL takes channel 2,
>    *        FR takes channel 3, RL takes channel 0, RL takes channel 1.
> + *   - CoupledMixers
> + *      - Mixer controls that should be changed together.
> + *        E.g. "Left Master,Right Master".
>    *   - EDIDFile
>    *      - Path to EDID file for HDMI devices
>    *   - JackControl, JackDev, JackHWMute
> 

I do not see which names are referred by this. It's for the snd_ctl interface 
or for the simple mixer ?

						Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
