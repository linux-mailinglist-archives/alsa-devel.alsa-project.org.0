Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8D75BC5D
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2019 15:08:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB8411699;
	Mon,  1 Jul 2019 15:07:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB8411699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561986485;
	bh=1TPzW9ZbbUmlw+WpMClnvwR3MlKnVtr9CTpt9drq3FI=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OYFP00WFNVOnE4BaPJuuaXDa2wZHe68y6cuCYc0TTc6KoBeSsqOvjjNwY5z7vKkmF
	 7+R1lwJ7CeKVbdSzQRTaUw6kqt0eyNqJuWWnHNbGNQN4e0GUuxb6YKxM0sAmSyWV3u
	 d/BpKhPLTJ7BtBYJ0SmcqpuRlVINeOrcB5ZA4zG0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B46EF8076A;
	Mon,  1 Jul 2019 15:06:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 78500F896EC; Mon,  1 Jul 2019 15:06:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0F1DDF8076A
 for <alsa-devel@alsa-project.org>; Mon,  1 Jul 2019 15:06:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F1DDF8076A
X-Originating-IP: 92.184.101.12
Received: from localhost (unknown [92.184.101.12])
 (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id E466340012;
 Mon,  1 Jul 2019 13:06:13 +0000 (UTC)
Date: Mon, 1 Jul 2019 15:06:09 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Jurgen Lambrecht <J.Lambrecht@televic.com>
Message-ID: <20190701130609.GB3692@piout.net>
References: <8e4d6674-0a5b-7063-534d-cea4e55056d5@televic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8e4d6674-0a5b-7063-534d-cea4e55056d5@televic.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] why error return in
 sound/soc/codecs/pcm3168a.c::pcm3168a_set_dai_fmt ?
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hello,

On 04/06/2019 06:37:48+0000, Jurgen Lambrecht wrote:
> Hi,
> =

> When following =

> https://bootlin.com/blog/eight-channels-audio-on-i-mx7-with-pcm3168/ I =

> get this error (from soc_core.c):
> =

> ... kernel: [=A0=A0=A0 3.059634][=A0=A0 T15] pcm3168a 3-0039: ASoC: Faile=
d to set =

> DAI format: -22
> =

> I could propose this patch (I get that printf when applying the patch)
> (all other errors in that file have a printf):
> =

> diff --git a/sound/soc/codecs/pcm3168a.c b/sound/soc/codecs/pcm3168a.c
> index 08d3fe192e65..75ccbb919902 100644
> --- a/sound/soc/codecs/pcm3168a.c
> +++ b/sound/soc/codecs/pcm3168a.c
> @@ -353,6 +353,7 @@ static int pcm3168a_set_dai_fmt(struct snd_soc_dai *d=
ai,
>  =A0=A0=A0=A0=A0=A0=A0 case SND_SOC_DAIFMT_NB_NF:
>  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;
>  =A0=A0=A0=A0=A0=A0=A0 default:
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err(component->dev, "wron=
g INV_MASK\n");
>  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return -EINVAL;
>  =A0=A0=A0=A0=A0=A0=A0 }
> =

> But why does this code returns an error for code that has no effect?
> OK, it could be because SND_SOC_DAIFMT_INV_MASK must be =

> SND_SOC_DAIFMT_NB_NF. But then Alexandre's blog contains an error, =

> because the dac TDM sets frame-inversion in its dts (and it should not).
> =


While I'm pretty sure what is in the blog is working (it is deployed in
production), I remember there was something fishy with frame-inversion.
I unfortunately don't remember the specifics.

Honestly, I would think you can remove frame-inversion safely as the
codec is only supposed to support NB_NF.

-- =

Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
