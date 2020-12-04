Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0270E2CEA8A
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Dec 2020 10:13:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 820B21867;
	Fri,  4 Dec 2020 10:12:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 820B21867
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607073224;
	bh=JmG8FBaTzbt/kYkShldS7G1ItAyjwRZb31/e3OGqfUM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j7rCE9YvgFJ2hDAyezhtv5R1mcMgtQR4G7lbpmrF8lqPXKVfpVbDtKlO4btumYkgq
	 CvpBctBiuJFEf/XcfHbI54k/9eLJTQDPdV67efVZbdTZ8FRB9TgYuEV2cEuLCSs+Gw
	 wJOZKqCBvD3byMXff5ppJInVIh8MjbbAezT3f9vQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 152A9F804C3;
	Fri,  4 Dec 2020 10:12:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 724B9F804C2; Fri,  4 Dec 2020 10:12:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 586A2F804BC
 for <alsa-devel@alsa-project.org>; Fri,  4 Dec 2020 10:12:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 586A2F804BC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="CY2MOA8p"
X-Gm-Message-State: AOAM533wjB3RR4I/WYTLRa9sItInQC1mDC2DvjvHmHP2WCL2tESE8Fy0
 PsmcRmUa0caAUAyjgpL9XZ4FE/qOovwFk0hAcfk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607073127;
 bh=JmG8FBaTzbt/kYkShldS7G1ItAyjwRZb31/e3OGqfUM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=CY2MOA8pzaahG6laGVMt7huzhQHFwtUjxBSMMrv0kH/aeQQ4gl4p/l9Tn1DLIEei+
 GiR+Iw8c+zK289IuEfzp6egRvS/qo6Q3bHxZu2MdqYB3Z8MtS701RI7ROMWFI0GGcU
 hCxqAuOybA8BksUepjYRlg3rVyziuspg1+bnTQf1/0fdgwZC2X4ALoZowsgfDZxi+E
 rcle56e4VmEffS+uSNJHQhqh04jH9WsfMU2QOyqCSl/phHvlNB+kx3N74XqJ+SFhjE
 dc9lkbmBmh0RobWETDm9q9g4nEfjw5ChAEPiCxHVvDppULs/1sMjRgoa4GjhDR7QsS
 XfSaYWil8yp9A==
X-Google-Smtp-Source: ABdhPJxE5YcToNs/naZOB0pqVvNjNVeYst+MYN/gRehfo8nYfGYKjmuMOWvelXELXZ/AfJWI2lV13OfDu5hEncMg/m4=
X-Received: by 2002:aca:4e42:: with SMTP id c63mr2436708oib.67.1607073126708; 
 Fri, 04 Dec 2020 01:12:06 -0800 (PST)
MIME-Version: 1.0
References: <20201204083624.2711356-1-arnd@kernel.org>
 <CA+Px+wVYCp=x1_zPkmgd3LLYH=wp1yYHCHZbuT4ecMgPCuYXMA@mail.gmail.com>
In-Reply-To: <CA+Px+wVYCp=x1_zPkmgd3LLYH=wp1yYHCHZbuT4ecMgPCuYXMA@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 4 Dec 2020 10:11:50 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1t-JhJ73ikf=FZQn1L0AbT3e=e7zJGkOMvCXky6apj+w@mail.gmail.com>
Message-ID: <CAK8P3a1t-JhJ73ikf=FZQn1L0AbT3e=e7zJGkOMvCXky6apj+w@mail.gmail.com>
Subject: Re: [PATCH] [v2] ASoC: cros_ec_codec: fix uninitialized memory read
To: Tzung-Bi Shih <tzungbi@google.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 ALSA development <alsa-devel@alsa-project.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, Arnd Bergmann <arnd@arndb.de>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Eric Biggers <ebiggers@google.com>, Takashi Iwai <tiwai@suse.com>,
 Guenter Roeck <groeck@chromium.org>, Mark Brown <broonie@kernel.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Yu-Hsuan Hsu <yuhsuan@chromium.org>, Benson Leung <bleung@chromium.org>,
 Ard Biesheuvel <ardb@kernel.org>, Cheng-Yi Chiang <cychiang@chromium.org>
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

On Fri, Dec 4, 2020 at 9:57 AM Tzung-Bi Shih <tzungbi@google.com> wrote:
>
> On Fri, Dec 4, 2020 at 4:36 PM Arnd Bergmann <arnd@kernel.org> wrote:
> > diff --git a/sound/soc/codecs/cros_ec_codec.c b/sound/soc/codecs/cros_ec_codec.c
> > index 58894bf47514..6ec673573c70 100644
> > --- a/sound/soc/codecs/cros_ec_codec.c
> > +++ b/sound/soc/codecs/cros_ec_codec.c
> > @@ -348,7 +348,7 @@ static int i2s_rx_event(struct snd_soc_dapm_widget *w,
> >         }
> >
> >         return send_ec_host_command(priv->ec_device, EC_CMD_EC_CODEC_I2S_RX,
> > -                                   (uint8_t *)&p, sizeof(p), NULL, 0);
> > +                                   &p.cmd, sizeof(p.cmd), NULL, 0);
> >  }
>
> I would prefer your v1.
>
> Reasons:
> 1. The change is not just kernel related.
> There is a EC (embedded controller) firmware to collaborate with the
> code.  The firmware doesn't know the kernel only copies the first byte
> of the packet (at least for now).  See
> https://chromium.googlesource.com/chromiumos/platform/ec/+/refs/heads/master/common/audio_codec_i2s_rx.c#120.
>
> 2. We don't copy partial packets in a EC host command.
> IMHO, it is also not a big deal if copying a few unused bytes in the packet.

Ok, so if the EC does access the uninitialized data, then it is indeed
better to initialize it to zero as I first thought.

      Arnd
