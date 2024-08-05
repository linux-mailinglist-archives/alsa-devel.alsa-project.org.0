Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D74E3947EFD
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2024 18:10:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF40759CC;
	Mon,  5 Aug 2024 18:09:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF40759CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722874182;
	bh=o0quoQ7ppGWq3Zo/T52ZVjVGnd+dV4B7L5rUpE1A9pI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sSANKpo3W8K5hDY7KIZWaTbdtf0PtbB4HVgRD2tzoYuQfyoAeoOsNKmKohEZmUgmP
	 SeEt03QLvLulVWJIn/RTlvLsW4M/C0IXav/KAfye8ajmJ+KdXOMd6YFJw1VWgyIQg1
	 z9NaB8SLM+p0lAkw+Nri7JV5KnOJBJU75bFYNuJQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0CA8AF805BA; Mon,  5 Aug 2024 18:09:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A623F805B0;
	Mon,  5 Aug 2024 18:09:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BDF0FF802DB; Mon,  5 Aug 2024 18:07:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3F7C8F800B0
	for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2024 18:07:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F7C8F800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=SyInNycV
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4281faefea9so61323995e9.2
        for <alsa-devel@alsa-project.org>;
 Mon, 05 Aug 2024 09:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1722874050;
 x=1723478850; darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mLnycLNpcQG5GUSmWzuFCsE23qxX0cM+qsqCFWzhcF4=;
        b=SyInNycVC832LEZCxbjclJJ2Nh0x5r/OJg6MtUn1Ry5MPdz4qOY8VKYK9cvePbZK7J
         eJyiT/0V5vvUuoerbBdet+Ty2569aXLYBBZpkdtcUCddFS8aBblZUb4JksIElKDhSo0d
         sg+VqcAxkFWKEKrbJl5SyV/shElW8DxBmRL+8X2tPVmgOt1pQjnoBXY03+d6/DIQkagp
         5BxoFq/yT8VpzuwCLO9s4TUqxiyv1xbNf3bOTLr7fANmPt8WNjFhRpXH/gVB/qO8yEzo
         QOWGUFRVxvqUph28T7r4uxyWXsUtQkAXQfZ8gLShUT+PWij5Bg+12xDqRaQho8SADp6O
         VIxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722874050; x=1723478850;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mLnycLNpcQG5GUSmWzuFCsE23qxX0cM+qsqCFWzhcF4=;
        b=pcJ7DPNGgt8j6TwskPKLUuVNhwv/w3pD55W80Pb0CaAfopk1IUz/wtzVaKhug5ysMJ
         rM/W/lpnH1DKQZ2IuIyAStw9NJWqccxGtoeQhU8GJZ7nK4hV5Vrh1oSuS1ko/9rVLbfj
         5bQjlJgbDQlW7LV6sB5g/OLh2xhZcULpk/ewK4SN5uAbAnRoluJiKBdCjwicPsNkHqbw
         qwUO2Y4mMXxIdgrUeNIEKyXXGGg/nZNTX6xZGlj6f6eWMk5tqKewAz26abGdrhPHpIhB
         Pn0RlajkxjIUPiPVbQZlRSGU6YpSBPwuwEPIqZdrZnuxPzKjWQwaiEP4ij8SIjoHkttc
         W2qA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXy0EGrBfec8pzGzZGNH9fARpzF8eTifs/t5QIEz9QeDHKECJMFUHYKZUaS2N7xWUZBwrV9xlP9Pf4nlNT72vGBEQL+oXBnYBzGDME=
X-Gm-Message-State: AOJu0YzVkmyRd+S9BLoc7pkoEJJ760siR30RvIa5QQGnb+byk+jTdqH5
	XsERlWMB3pD6XOMp+e+fedkXmAKkVAuzH4DeX05sQudTMhHWpojfgoShX6l1FXs=
X-Google-Smtp-Source: 
 AGHT+IF7E+JH5oT9xq8G5w8s8h2rAblTnJFziKMkgTgJWNnfhajr1VdmMfvwoBX7+IWMhH58JY1aHw==
X-Received: by 2002:a05:600c:a04:b0:426:6ea8:5037 with SMTP id
 5b1f17b1804b1-428e6b93136mr74516395e9.37.1722874049736;
        Mon, 05 Aug 2024 09:07:29 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:e06c:bc48:dc7f:827a])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36bbd169697sm10229385f8f.107.2024.08.05.09.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Aug 2024 09:07:29 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Mark Brown <broonie@kernel.org>,  linux-rt-users@vger.kernel.org,
  Arseniy Krasnov <avkrasnov@salutedevices.com>,  Liam Girdwood
 <lgirdwood@gmail.com>,  Jaroslav Kysela <perex@perex.cz>,  Takashi Iwai
 <tiwai@suse.com>,  Neil Armstrong <neil.armstrong@linaro.org>,  Kevin
 Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  alsa-devel@alsa-project.org,
  linux-sound@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-amlogic@lists.infradead.org,  linux-kernel@vger.kernel.org,
  kernel@sberdevices.ru,  oxffffaa@gmail.com,  Thomas Gleixner
 <tglx@linutronix.de>
Subject: Re: [PATCH v1] ASoC: meson: axg-fifo: set option to use raw spinlock
In-Reply-To: <20240805153309.k_SfHw62@linutronix.de> (Sebastian Andrzej
	Siewior's message of "Mon, 5 Aug 2024 17:33:09 +0200")
References: <20240729131652.3012327-1-avkrasnov@salutedevices.com>
	<1ja5i0wags.fsf@starbuckisacylon.baylibre.com>
	<2b16b95e-196e-4d8a-98c3-3be568cdd18a@sirena.org.uk>
	<1j5xsow839.fsf@starbuckisacylon.baylibre.com>
	<7dfdade5-3a57-4883-bfac-067c50ec0ffb@sirena.org.uk>
	<1j1q3cw5ri.fsf@starbuckisacylon.baylibre.com>
	<20240805153309.k_SfHw62@linutronix.de>
Date: Mon, 05 Aug 2024 18:07:28 +0200
Message-ID: <1jplqnuf5r.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: QA6DPNGLX4ZCWNQ3C57DLZRHXEZSXNYV
X-Message-ID-Hash: QA6DPNGLX4ZCWNQ3C57DLZRHXEZSXNYV
X-MailFrom: jbrunet@baylibre.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QA6DPNGLX4ZCWNQ3C57DLZRHXEZSXNYV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon 05 Aug 2024 at 17:33, Sebastian Andrzej Siewior <bigeasy@linutronix.=
de> wrote:

> On 2024-07-29 17:57:05 [+0200], Jerome Brunet wrote:
>> On Mon 29 Jul 2024 at 16:28, Mark Brown <broonie@kernel.org> wrote:
>>=20
>> > On Mon, Jul 29, 2024 at 05:06:50PM +0200, Jerome Brunet wrote:
>> >> On Mon 29 Jul 2024 at 15:44, Mark Brown <broonie@kernel.org> wrote:
>> >
>> >> > I don't recall this coming up much TBH.  It may be that people just=
 set
>> >> > raw spinlocks when they need it, or that there's not many people us=
ing
>> >> > relevant devices with RT kernels.
>> >
>> >> I have not been playing much with RT TBH, but AFAIK, with RT irq
>> >> handlers are threaded unless IRQF_NO_THREAD is set. In this case,
>> >> something preemptible in the handler should not be a problem.
>> >
>> >> The axg-fifo drivers do not have IRQF_NO_THREAD so something is a bit
>> >> unclear here.
>> >
>> > Yeah, it's definitely likely to happen all the time for people using RT
>> > with relevant devices.  I'm not sure I have a good sense of if it's
>> > likely to be a nasty surprise to switch raw spinlocks on by default wh=
en
>> > it's currently controllable, I'd expect it'll generally be fine but it=
's
>> > possibly a bit rude to any users that don't use interrupts...
>>=20
>> Indeed it is bit radical.
>>=20
>> My concern with this patch is that, IIUC, the handler should be
>> threaded under RT and there should be no problem with the spinlock API.
>>=20
>> Adding the RT folks to try to get a better understanding, they should
>> have been CCed anyway.
>
> I'm not sure if making the lock a raw_spinlock_t solves all the
> problems. The regmap is regmap_mmio so direct memory-access and looks
> simple enough to do so. In regmap_mmio_write() I see clk_enable() and
> and this uses a spinlock_t so we should be back at the same problem.
> There might be an additional problem if reg-caching is enabled.

Hi Sebastian,

Thanks a lot for taking the time to dig into the driver specifics.
The IRQ handler is actually not awfully critical in this case. The HW
will continue to run regardless of the IRQ being acked or not

The purpose of the handler is mainly to let Alsa know that 1 (or more)
period is ready. If alsa is too slow to react, and the buffer allows
just a few periods, the HW may under/overflow the buffer.

IRQF_ONESHOT is fine because snd_pcm_period_elapsed() 'notifies'
all past periods, not just one. The irq handler does not need to
run again until this function has been called. It also helps if the
period is ridiculously small, to try to reduce the number of IRQs.

>
> Let me propose two alternatives:
> #1: Why two handlers if we have IRQF_ONESHOT and the primary does almost
>     nothing. Assuming the thread is always woken up and the "unexpected
>     irq" case does not happen. If so, why not:

That was mainly there for initial debugging. It does not happen (yet).

>
> diff --git a/sound/soc/meson/axg-fifo.c b/sound/soc/meson/axg-fifo.c
> index 7e6090af720b9..60af05a3cad6b 100644
> --- a/sound/soc/meson/axg-fifo.c
> +++ b/sound/soc/meson/axg-fifo.c
> @@ -220,9 +220,21 @@ static irqreturn_t axg_fifo_pcm_irq_block(int irq, v=
oid *dev_id)
>  static irqreturn_t axg_fifo_pcm_irq_block_thread(int irq, void *dev_id)
>  {
>  	struct snd_pcm_substream *ss =3D dev_id;
> +	struct axg_fifo *fifo =3D axg_fifo_data(ss);
> +	unsigned int status;
> +
> +	regmap_read(fifo->map, FIFO_STATUS1, &status);
> +	status =3D FIELD_GET(STATUS1_INT_STS, status);
> +
> +	/* Use the thread to call period elapsed on nonatomic links */
> +	if (!(status & FIFO_INT_COUNT_REPEAT)) {
> +		dev_dbg(axg_fifo_dev(ss), "unexpected irq - STS 0x%02x\n",
> +			status);
> +		return IRQ_NONE;
> +	}
> +	axg_fifo_ack_irq(fifo, status);
>=20=20
>  	snd_pcm_period_elapsed(ss);
> -
>  	return IRQ_HANDLED;
>  }
>=20=20
> @@ -251,9 +263,9 @@ int axg_fifo_pcm_open(struct snd_soc_component *compo=
nent,
>  	if (ret)
>  		return ret;
>=20=20
> -	ret =3D request_threaded_irq(fifo->irq, axg_fifo_pcm_irq_block,
> -				   axg_fifo_pcm_irq_block_thread,
> -				   IRQF_ONESHOT, dev_name(dev), ss);
> +	ret =3D request_threaded_irq(fifo->irq, NULL,
> +				   axg_fifo_pcm_irq_block_thread, IRQF_ONESHOT,
> +				   dev_name(dev), ss);
>  	if (ret)
>  		return ret;
>=20=20
>
> #2: If two handers are required due to $REASON then primary should ACK/
>     disable the interrupt line while the secondary/ threaded handler is
>     running. In this is case then IRQF_ONESHOT is not needed because its
>     "tasks" is performed by the primary handler:
>
> diff --git a/sound/soc/meson/axg-fifo.c b/sound/soc/meson/axg-fifo.c
> index 7e6090af720b9..5b4c518eb4ccd 100644
> --- a/sound/soc/meson/axg-fifo.c
> +++ b/sound/soc/meson/axg-fifo.c
> @@ -205,11 +205,16 @@ static irqreturn_t axg_fifo_pcm_irq_block(int irq, =
void *dev_id)
>=20=20
>  	regmap_read(fifo->map, FIFO_STATUS1, &status);
>  	status =3D FIELD_GET(STATUS1_INT_STS, status);
> -	axg_fifo_ack_irq(fifo, status);
>=20=20
>  	/* Use the thread to call period elapsed on nonatomic links */
> -	if (status & FIFO_INT_COUNT_REPEAT)
> +	if (status & FIFO_INT_COUNT_REPEAT) {
> +		/*
> +		 * ACKs/ Disables the interrupt until re-enabled by
> +		 * axg_fifo_pcm_irq_block_thread()
> +		 */
> +		axg_fifo_ack_irq(fifo, status);
>  		return IRQ_WAKE_THREAD;
> +	}
>=20=20
>  	dev_dbg(axg_fifo_dev(ss), "unexpected irq - STS 0x%02x\n",
>  		status);
> @@ -253,7 +258,7 @@ int axg_fifo_pcm_open(struct snd_soc_component *compo=
nent,
>=20=20
>  	ret =3D request_threaded_irq(fifo->irq, axg_fifo_pcm_irq_block,
>  				   axg_fifo_pcm_irq_block_thread,
> -				   IRQF_ONESHOT, dev_name(dev), ss);
> +				   0, dev_name(dev), ss);
>  	if (ret)
>  		return ret;
>
> On the PREEMPT_RT both handler will be threaded.
>=20=20
> My favorite is #1. Also ACKing the interrupt only if it occurred for the
> device/ driver in charge. Otherwise don't care=E2=80=A6

I'd prefer #1 too. IRQ is not shared, so the ownership should be fine.

However I still don't fully understand what we are fixing here TBH. It
seems it could apply to other parts of the kernel so I'd like to
understand what is wrong (and avoid repeating the same mistake)

* With PREEMPT_RT, both handler will threaded, so they should be able to
  call preemptible function, right ?
* If so, and spinlock_lock() actually becomes preemptible with
  PREEMPT_RT as stated in this change description, why is it problem here ?

Do you have an idea about what is going on ?

Again, thanks a lot for your help.

>
> Sebastian

--=20
Jerome
