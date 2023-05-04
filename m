Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3726F6558
	for <lists+alsa-devel@lfdr.de>; Thu,  4 May 2023 08:55:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D712217E8;
	Thu,  4 May 2023 08:55:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D712217E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683183350;
	bh=w/zLzOdtXHjlrcBr+NO3nfrPtCgxraj0WgjEOA4vJPE=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XrgcGzFtLmEWokQ6pI0WnpnN+nXOwoAWlqPMm6kVRrOeph+iKZhNPHxsQNQMtWoRe
	 vzYvkKSGD43pcB2bpGGErS8CFcimd1DxtL7cE2vPIyqrUEpj0UlQT2AnOvgPaUEfYf
	 NUaAGiIS4S2uH+JgFJloz/0fg2jLMTPhOVByjhT4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 33B5CF8032B;
	Thu,  4 May 2023 08:55:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CDBF5F8049E; Thu,  4 May 2023 08:54:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-9.3 required=5.0 tests=NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail.bugwerft.de (mail.bugwerft.de [46.23.86.59])
	by alsa1.perex.cz (Postfix) with ESMTP id 21D28F80137
	for <alsa-devel@alsa-project.org>; Thu,  4 May 2023 08:54:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21D28F80137
Received: from [192.168.178.88] (p57bc9658.dip0.t-ipconnect.de
 [87.188.150.88])
	by mail.bugwerft.de (Postfix) with ESMTPSA id 7F2DA28054E;
	Thu,  4 May 2023 06:54:49 +0000 (UTC)
Message-ID: <81a2e61f-5b30-06c9-6773-70c89c836fa7@zonque.org>
Date: Thu, 4 May 2023 08:54:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] sound: caiaq: input: Add error handling for unsupported
 input methods in `snd_usb_caiaq_input_init`
To: Ruliang Lin <u202112092@hust.edu.cn>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Karsten Wiese <fzu@wemgehoertderstaat.de>
References: <20230504065054.3309-1-u202112092@hust.edu.cn>
Content-Language: en-US
From: Daniel Mack <daniel@zonque.org>
In-Reply-To: <20230504065054.3309-1-u202112092@hust.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: EBCS2LP5KKNZZPBTCAG33D3JWSSDGS4V
X-Message-ID-Hash: EBCS2LP5KKNZZPBTCAG33D3JWSSDGS4V
X-MailFrom: daniel@zonque.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: hust-os-kernel-patches@googlegroups.com, Dongliang Mu <dzm91@hust.edu.cn>,
 Jaroslav Kysela <perex@suse.cz>, Takashi Iwai <tiwai@suse.de>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EBCS2LP5KKNZZPBTCAG33D3JWSSDGS4V/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 5/4/23 08:50, Ruliang Lin wrote:
> Smatch complains that:
> snd_usb_caiaq_input_init() warn: missing error code 'ret'
> 
> This patch adds a new case to handle the situation where the 
> device does not support any input methods in the 
> `snd_usb_caiaq_input_init` function. It returns an `-EINVAL` error code 
> to indicate that no input methods are supported on the device.
> 
> Fixes: 523f1dce3743 ("[ALSA] Add Native Instrument usb audio device support")
> Signed-off-by: Ruliang Lin <u202112092@hust.edu.cn>
> Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>

Acked-by: Daniel Mack <daniel@zonque.org>



> ---
> The issue is found by static analyzer. The patched code has passed
> Smatch checker, but remains untested on real device.
> ---
>  sound/usb/caiaq/input.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/usb/caiaq/input.c b/sound/usb/caiaq/input.c
> index 1e2cf2f08eec..84f26dce7f5d 100644
> --- a/sound/usb/caiaq/input.c
> +++ b/sound/usb/caiaq/input.c
> @@ -804,6 +804,7 @@ int snd_usb_caiaq_input_init(struct snd_usb_caiaqdev *cdev)
>  
>  	default:
>  		/* no input methods supported on this device */
> +		ret = -EINVAL;
>  		goto exit_free_idev;
>  	}
>  

