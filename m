Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3309A20E22
	for <lists+alsa-devel@lfdr.de>; Thu, 16 May 2019 19:42:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C52CD16D9;
	Thu, 16 May 2019 19:41:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C52CD16D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558028550;
	bh=naaIwjaxJf6zSuWaQtlG9WHdnRCTjGgb5XiQLWd/0MM=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SxsFpA3IeVSsf4Kp3aP0s8GjJaQKpavjaRLZRMHgJstwvuQg5N/TTQCFP8kTjYcPL
	 d8q6jOrRT24iV/WPdLehpXLv94Y4LMMjXClWmy/Qn7jI5a+h18MU22beOQhVhxkri4
	 hwXKP6NKckgLXJU46Tr6GoTPr3Sezn6p2fwd16+E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 57B9BF89693;
	Thu, 16 May 2019 19:40:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A6A3FF896B6; Thu, 16 May 2019 19:40:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from de-out1.bosch-org.com (de-out1.bosch-org.com [139.15.230.186])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3B9ECF806E7
 for <alsa-devel@alsa-project.org>; Thu, 16 May 2019 19:40:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B9ECF806E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=in.bosch.com header.i=@in.bosch.com
 header.b="PSNojhEw"
Received: from fe0vm1649.rbesz01.com (unknown [139.15.230.188])
 by fe0vms0186.rbdmz01.com (Postfix) with ESMTPS id 454dxM438yz1XLFjN;
 Thu, 16 May 2019 19:40:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=in.bosch.com;
 s=2015-01-21; t=1558028439;
 bh=TRQwrTvKULwiutRWM8TZARDF+wnF2QRJ9QxiC89qyks=; l=10;
 h=From:Subject:From:Reply-To:Sender;
 b=PSNojhEwSfk7NS65GCGJIEYGb0cCel5kfDWsbGXO7lKwV0xRrmltBmtsWCrleF69n
 Z+3JbPJ6jUDtpOQJTkfntjKJr8qs4bzZAENr19OiOsbTw4v/eIKoOh/gvkpO17zkc3
 CGJtuSrUg5gNdQTiJoccANsq1upjjIYGDc50TdU8=
Received: from fe0vm02900.rbesz01.com (unknown [10.58.172.176])
 by fe0vm1649.rbesz01.com (Postfix) with ESMTPS id 454dxM3N2Nz2P;
 Thu, 16 May 2019 19:40:39 +0200 (CEST)
X-AuditID: 0a3aad0c-d19ff700000039d6-88-5cdda0969540
Received: from si0vm1949.rbesz01.com ( [10.58.173.29])
 (using TLS with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by fe0vm02900.rbesz01.com (SMG Outbound) with SMTP id 26.67.14806.690ADDC5;
 Thu, 16 May 2019 19:40:39 +0200 (CEST)
Received: from FE-MBX2011.de.bosch.com (fe-mbx2011.de.bosch.com [10.3.231.17])
 by si0vm1949.rbesz01.com (Postfix) with ESMTPS id 454dxL6PdLz6Cjg7w; 
 Thu, 16 May 2019 19:40:38 +0200 (CEST)
Received: from SGPMBX2003.APAC.bosch.com (10.187.56.76) by
 FE-MBX2011.de.bosch.com (10.3.231.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Thu, 16 May 2019 19:40:38 +0200
Received: from SGPMBX2003.APAC.bosch.com (10.187.56.76) by
 SGPMBX2003.APAC.bosch.com (10.187.56.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Fri, 17 May 2019 01:40:35 +0800
Received: from SGPMBX2003.APAC.bosch.com ([fe80::d4a:a83a:3749:3836]) by
 SGPMBX2003.APAC.bosch.com ([fe80::d4a:a83a:3749:3836%3]) with mapi id
 15.01.1713.006; Fri, 17 May 2019 01:40:35 +0800
From: "Channaiah Vanitha (RBEI/ECF3)" <Vanitha.Channaiah@in.bosch.com>
To: Takashi Iwai <tiwai@suse.de>
Thread-Topic: [PATCH v2 4/6] pcm: direct: Round up of slave_app_ptr pointer if
 buffer size is less than 2 period size.
Thread-Index: AQHVCum2p2PVPQAfHE+ssDvx70Q5k6ZrWTmAgAKp2xA=
Date: Thu, 16 May 2019 17:40:35 +0000
Message-ID: <fd0cc77803324450b34819774eb9d946@in.bosch.com>
References: <1557901597-19215-1-git-send-email-vanitha.channaiah@in.bosch.com>
 <1557901597-19215-5-git-send-email-vanitha.channaiah@in.bosch.com>
 <s5h1s10hzrc.wl-tiwai@suse.de>
In-Reply-To: <s5h1s10hzrc.wl-tiwai@suse.de>
Accept-Language: en-US, en-SG
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.187.56.215]
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA21TfUwTZxjnvSvl2vXkeqX0sYrZLpjMKVKcM4D7ypY4sm+zLPtIE3eFs22g
 LekVpC5ZHNkc6TYHKgMbWhHY2CYEJgUZ062p6yJuKuDYVhCQwNAiBiZxHy7M3XHF9o/98+T3
 /J7n93y9eQmcHiD0hNXu4px2toSRK2XK/PaMrLrGMaPhdlHuT4MhLDfaNYc9jhV0LlbKC7p+
 ePNF7HXlw0VcibWcc2Y/+obS0tuSWvqBq2J0aVy+D500eZCCAGor/NoekouYpo5gUOXN8iCl
 gL9B0Fr9dorkLCBYXJqUS84igiuj+2NOCEHw6hmZqJdTO2DeM7RcK426F+Zmx5GIcWoPnL5+
 SMghCI2Ab/6eK6VUQHCsB0k4Hy58350sYhm1Hip9i8s8SW0HT897sSkCCMIdPcv1FdRGuPRb
 GBcxojKgKXJQJvXSwcj0UUzajYKWUxdxCWshOvVvsoTvg5NTnZiUb4KlibO41EwN/UemZdVI
 500o5U1I8yakSfwmaPz6plzCG+HTY9fxFfxjcApL5BtRyhcofTdnKLcZtuQZDJudJo7fa8jZ
 XOiwnUDSg6p6UbjFHEIUgRgVedk7ZqST2XLebQuhhwiM0ZJJPoFaZXIUuS0sb9nlLCvheEZP
 rh142khr7tJ8mclm5Xmrwy48D4EzaWTn/KiRJotY917O6ZBkIbSGkDE60ky8YKQpM+viijmu
 lHOuRLcTBAPkH0eFhmonZ+YqdltLXCthJoNESUlJdHpiJLEtRihC6EFCJfRmxRIkX8raeKs5
 Jl8tyekVNi49h14mgk2TPpzo/1O0gYkZwfaJlpbZHXZOryN3iBUpUWsps9+dSb+WbJ4S1tQm
 BOJ1Z1EECVfVkHdEsUr4SfFpgFwjHlAdI+OiLZ8IGqpWA2cW+hD4e28J/2Deg8Op7kkZhE/4
 5XC445gcqppCchjq86ZA1bUPCTg8UEvAR7daCfDP1Chgsva0Aq6NX1SAf7peKQSalXB8zn8P
 NF/2qeBstS8V/rrSkwrfHZpWw8hgHQ1f9Q/R0NAQpaGr7YAGZucDaVB/5+80aOuo1EL9cLsW
 3h3+LB1uhwd00PvLl6tnhVNjwqnzrCPiqV2s639OHWPj2+n3oZYLO/sMOfhBZ7TzOWbbPx0F
 Ne0vwaVsbOHj1p03Bt/fOvKafqaBDERUxfvz7ze7zj8RfGvDATKsOB/4OfX5zHXvqEKBDZXr
 2Vc5dU3WrsJVnuFMMlqY+aTHXfds5DFrTh6jPv7Itu7stmeUxa+4v41M2OfWjZf7NpV9zl99
 6sa5PVFGxlvYnAdwJ8/+B3xr6Y7jBAAA
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: "Wischer Timo \(ADITG/ESS\)" <twischer@de.adit-jv.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [PATCH v2 4/6] pcm: direct: Round up of
 slave_app_ptr pointer if buffer size is less than 2 period size.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hello Takashi-san,

> It's still not clear to me why this change is made.
> The example mentioned in the above (period_size=96, buffer_size=191) also matches with the condition before the change, so there should be behavior change by the patch.
> IOW, your patch does nothing but modifying the condition to drop the case buffer_size == period_size * 2.  Why this condition can't
> (shouldn't) be a target of the round up?  That needs the clarification in the patch description.


In case of Buffer_size = 2 * period_size, round down of slave_hw_ptr was necessary which otherwise leads to
Blocking of snd_pcm_wait() for longer time(i.e. more than 1n period)
An example of capture case is explained here:

Issue occurs in case of round up:

- During the start, slave_hw_ptr = 128
- After round up: slave_app_ptr: 192 slave_hw_ptr: 128
- avail:0 app_ptr:0 hw_ptr:0
- snd_pcm_wait() locks
- new slave hw ptr updated to plugins: new_slave_hw_ptr = 192
- hw_ptr = new_slave_hw_ptr - old_slave_hw_ptr = 192 - 128 = 64
- avail:64 app_ptr:0 hw_ptr:64
- snd_pcm_wait() still blocked --------------------> [issue occurs]
- new slave hw ptr updated to plugins: new_slave_hw_ptr = 288
- avail:160 app_ptr:0 hw_ptr:160(64+96)
- snd_pcm_wait() is released

In case of round down:

- During the start, slave_hw_ptr = 128
- After round up: slave_app_ptr:96 slave_hw_ptr:96
- avail:0 app_ptr:0 hw_ptr:0
- snd_pcm_wait() locks
- new slave hw ptr updated to plugins: new_slave_hw_ptr = 192
- hw_ptr = new_slave_hw_ptr - old_slave_hw_ptr = 192 - 96 = 96
- avail:96 app_ptr:0 hw_ptr:96
- snd_pcm_wait() is released--------------------> [issue does not occurs]
- avail:160 app_ptr:0 hw_ptr:160(64+96)

Also, No other issue is introduced in case of playback scenario.

Best regards,
Vanitha Channaiah
RBEI/ECF3

Tel. +91 80 6136-4436



-----Original Message-----
From: Takashi Iwai <tiwai@suse.de>
Sent: Wednesday, May 15, 2019 2:16 PM
To: Channaiah Vanitha (RBEI/ECF3) <Vanitha.Channaiah@in.bosch.com>
Cc: alsa-devel@alsa-project.org; Wischer Timo (ADITG/ESS) <twischer@de.adit-jv.com>
Subject: Re: [PATCH v2 4/6] pcm: direct: Round up of slave_app_ptr pointer if buffer size is less than 2 period size.

On Wed, 15 May 2019 08:26:35 +0200,
<vanitha.channaiah@in.bosch.com<mailto:vanitha.channaiah@in.bosch.com>> wrote:
>
> From: Vanitha Channaiah <vanitha.channaiah@in.bosch.com<mailto:vanitha.channaiah@in.bosch.com>>
>
> For buffer size less than two period size, the start position of
> slave_app_ptr is rounded up in order to avoid xruns For e.g.:
> Considering below parameters and its values Period size = 96 Buffer
> size = 191 slave_appl_ptr = slave_hw_ptr = unaligned value
>
> Issue:
> - During the start of the stream, app_ptr = hw_ptr = 0
> - Application writes one period of data in the buffer i.e
>   app_ptr = 96, hw_ptr = 0
> - Now, the avail is just period-1 frames available.
>   avail = hw_ptr + buffer_size - app_ptr = 95
>   i.e. shortage of 1 frame space
> - so application is waiting for the 1frame space to be available.
> - slave_app_ptr and slave_hw_ptr would get updated to lower values
> - This could lead to under run to occur.
>
> Fix:
> If we round Up the slave_app_ptr pointer,
> - During the start of the stream, app_ptr = hw_ptr = 0
> - Application writes one period of data in the buffer i.e
>   app_ptr = 96, hw_ptr = 0
> - Round Up of slave_app_ptr pointer leads to below calculation:
> - slave_app_ptr rounded to 96
> - slave_app_ptr and slave_hw_ptr would get updated to larger value
> nearing to 2 period size
> - avail = greater than period size.
> - Here, there is a lower chance of under run.
>
> Signed-off-by: Vanitha Channaiah <vanitha.channaiah@in.bosch.com<mailto:vanitha.channaiah@in.bosch.com>>
> ---
>  src/pcm/pcm_direct.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/src/pcm/pcm_direct.c b/src/pcm/pcm_direct.c index
> 54d9900..b56da85 100644
> --- a/src/pcm/pcm_direct.c
> +++ b/src/pcm/pcm_direct.c
> @@ -2043,10 +2043,12 @@ int
> snd_pcm_direct_parse_open_conf(snd_config_t *root, snd_config_t *conf,
>
>  void snd_pcm_direct_reset_slave_ptr(snd_pcm_t *pcm, snd_pcm_direct_t
> *dmix)  {
> -
> +     /* For buffer size less than two period size, the start position
> +      * of slave app ptr is rounded up in order to avoid xruns
> +      */
>       if (dmix->hw_ptr_alignment == SND_PCM_HW_PTR_ALIGNMENT_ROUNDUP ||
>               (dmix->hw_ptr_alignment == SND_PCM_HW_PTR_ALIGNMENT_AUTO &&
> -             pcm->buffer_size <= pcm->period_size * 2))
> +             pcm->buffer_size < pcm->period_size * 2))
>               dmix->slave_appl_ptr =
>                       ((dmix->slave_appl_ptr + dmix->slave_period_size - 1) /
>                       dmix->slave_period_size) * dmix->slave_period_size;

It's still not clear to me why this change is made.

The example mentioned in the above (period_size=96, buffer_size=191) also matches with the condition before the change, so there should be behavior change by the patch.

IOW, your patch does nothing but modifying the condition to drop the case buffer_size == period_size * 2.  Why this condition can't
(shouldn't) be a target of the round up?  That needs the clarification in the patch description.


thanks,

Takashi

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
