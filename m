Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF1268655E
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Feb 2023 12:23:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC503836;
	Wed,  1 Feb 2023 12:23:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC503836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675250631;
	bh=ItVT9qxKGIhNiEazHsjquBl6QiG98CogaNXI03V8LAU=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h+r7rWGE2EKkaIIRUMzC5ls2qaGxB+/wlfpOPb506Ed5weJn8Ti62/YG/35LhyV9B
	 2moURrOBphqRbQZfGvyPHUvhwtjFMtPuTMUBpfF18fKnsxmaW98r0HtU476Qs0wD3/
	 mgSbouYEWtSuGbLg6xszuVPEYTHCcIufD81NdFoM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B2D7EF80155;
	Wed,  1 Feb 2023 12:22:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48595F8032B; Wed,  1 Feb 2023 12:22:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=NICE_REPLY_A, RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_NONE shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from ts201-relay01.ddc.teliasonera.net
 (ts201-relay01.ddc.teliasonera.net [81.236.60.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5B21EF80155
 for <alsa-devel@alsa-project.org>; Wed,  1 Feb 2023 12:22:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B21EF80155
X-Amavis-Alert: BAD HEADER SECTION, Improper folded header field made up
 entirely of whitespace (char 20 hex): X-Spam_report: ...t@localhost
 for details.  Content previ[...]
Received: from mail.aio.nu (90-228-210-9-no78.tbcn.telia.com [90.228.210.9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ts201-relay01.ddc.teliasonera.net (Postfix) with ESMTPS id 91F28807758
 for <alsa-devel@alsa-project.org>; Wed,  1 Feb 2023 12:22:40 +0100 (CET)
Received: from lwaxana.aio.vpn ([10.1.2.16] helo=lwaxana.aio.nu)
 by mail.aio.nu with esmtps  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.96) (envelope-from <aio.alsadevel@aio.nu>)
 id 1pNBCJ-000ILt-1f for alsa-devel@alsa-project.org;
 Wed, 01 Feb 2023 12:22:40 +0100
Received: from [10.1.2.20] ([10.1.2.20]) by lwaxana.aio.nu with ESMTPSA
 id O3/DGXxL2mOO0gAA88T9bw (envelope-from <aio.alsadevel@aio.nu>)
 for <alsa-devel@alsa-project.org>; Wed, 01 Feb 2023 12:22:39 +0100
Message-ID: <9212f2d9-635c-cc0c-375c-4217f6b82ffd@aio.nu>
Date: Wed, 1 Feb 2023 12:22:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: Bug? Strange crash with snd_hdspm and RME RayDAT on MIDI-input
Content-Language: en-US
To: alsa-devel@alsa-project.org
References: <8e1c4dee-7643-807b-737c-276708a3ab8d@aio.nu>
 <871qnapx0n.wl-tiwai@suse.de>
From: Joakim Ekblad <aio.alsadevel@aio.nu>
In-Reply-To: <871qnapx0n.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam_score: -1.1
X-Spam_score_int: -10
X-Spam_bar: -
X-Spam_report: Spam detection software,
 running on the system "christine.aio.vpn", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 root@localhost for details.
 Content preview:  Den 2023-01-31 kl. 16:02, skrev Takashi Iwai: > On Fri, 27
 Jan 2023 16:41:42 +0100, > AiO wrote: >> >> Hello there, >> >> I've tried
 to find some insights in a weird problem I have with >> snd_hdspm. [...] 
 Content analysis details:   (-1.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -1.0 ALL_TRUSTED            Passed through trusted hosts only via SMTP
 -0.1 NICE_REPLY_A           Looks like a legit reply (A)
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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

Den 2023-01-31 kl. 16:02, skrev Takashi Iwai:
> On Fri, 27 Jan 2023 16:41:42 +0100,
> AiO wrote:
>>
>> Hello there,
>>
>> I've tried to find some insights in a weird problem I have with
>> snd_hdspm. I guess it is an error-report/bug-posting.
>>

<snip>

>>
>> What did I run in to?! :)
> 
> Possibly it went into the endless loop to flush the MIDI input bytes
> where the hardware doesn't return the right value (likely returning
> 0xff constantly).
> 
> Could you check the patch below?
> 
> 
> thanks,
> 
> Takashi
> 
> -- 8< --
> --- a/sound/pci/rme9652/hdspm.c
> +++ b/sound/pci/rme9652/hdspm.c
> @@ -1838,7 +1838,9 @@ static inline int snd_hdspm_midi_output_possible (struct hdspm *hdspm, int id)
>   
>   static void snd_hdspm_flush_midi_input(struct hdspm *hdspm, int id)
>   {
> -	while (snd_hdspm_midi_input_available (hdspm, id))
> +	int count;
> +
> +	for (count = 0; snd_hdspm_midi_input_available(hdspm, id) && count < 256; count++)
>   		snd_hdspm_midi_read_byte (hdspm, id);
>   }
>   

Hi again! Thank you for your fast reply. Despite it was like 20 years 
since i built a Linux-kernel, i compiled a kernel (not linux-rt tho) 
with this applied, sadly it still seems like it crashes on me like 
before... (If i got everything right :D )

It seems I receive "seldom occurring events", but if i am a bit more 
brutal, feeding events faster (randomly banging on a MIDI keyboard e.g.) 
it hangs.

I did also create an issue in GitHub on this about the same time wrote 
to the list:

https://github.com/alsa-project/alsa-lib/issues/297

How to go forward?
