Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1271FEF85
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jun 2020 12:17:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 077361744;
	Thu, 18 Jun 2020 12:16:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 077361744
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592475448;
	bh=KQBV+B4UnGYx/KiNCe+MBUwX6o1oxgEYkggMcnQur4c=;
	h=Subject:From:In-Reply-To:Date:References:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bBxW+SyNlb8npsAZFFnXd3CqlftXM9nWBYS9xu9c85oH/79t3x9BLZpEvEkwdbD5b
	 s8kzB7Fo5bNEvI2YK4BkC6E7wCawsFjYStLClicyxNchvF2M0sYauQT72+TQ84mgXE
	 9/LhX5+oLeAp5mnNuVBU5UHhB+pXA3m2ojZTV/QM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD3DFF80162;
	Thu, 18 Jun 2020 12:16:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F14F3F80171; Thu, 18 Jun 2020 12:16:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E585EF8010E
 for <alsa-devel@alsa-project.org>; Thu, 18 Jun 2020 12:16:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E585EF8010E
Received: from mail-pl1-f200.google.com ([209.85.214.200])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>) id 1jlrao-0006Qq-5S
 for alsa-devel@alsa-project.org; Thu, 18 Jun 2020 10:16:22 +0000
Received: by mail-pl1-f200.google.com with SMTP id 59so3539235pla.12
 for <alsa-devel@alsa-project.org>; Thu, 18 Jun 2020 03:16:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=tafBBnafCbfI5o9MOV+64xc9E0d/3o9toKXYsB0LHjg=;
 b=fI/jqLvIcDbQaYuHpkqDNLfph9Z6lVeTRBRhsWwRspUDMXszvepS4n+27YDildJSlV
 1MZyIqKL2yk9gDhVqnpl6zYVhorO6cEpRTWoA2uPb26Y1pezDBCqS/zvHH68UwOoY6t0
 QI1dUYAdNScbzejTIA/NQnLw4OzygWX2tp2ZO/vescfa/usmuPSeKr3WItGXGtmJldpa
 hmshXqGVCHHnaf58CA4XLh7QyMqEwoTWM7MOLNFOFMPwJADARRrwnp8eIuG4DRUcKias
 ffCw31BZDXewerZFqhV6zYhYuGgeRaWZ7LZeWJAoWsO5uRB5gmFPLsbpzsaQTNDsxOYp
 6aJA==
X-Gm-Message-State: AOAM531OIw/aXERoWYRiZIPFWY5DbI60Qn/91NQ0khkX4IM9NIj76dmU
 baSEYpzE2a8/OtHG6azFwA956iRsIBRNZ8DmlJfg0l0E4Jv5mIHALmhcMX5xEGb3TlpCfjRdr+M
 hFhaVsYAa+UJEVbEEad6jK03dKLYgjQzYjlS8FPCo
X-Received: by 2002:a65:43cb:: with SMTP id n11mr2706888pgp.160.1592475380694; 
 Thu, 18 Jun 2020 03:16:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxcrIMx+GxkoyBuQ/qT0KMBZ9GgjwPYV2GO9uzuY+3d9c7k8NOQNlyofE6oHwexJY5ElbUkBA==
X-Received: by 2002:a65:43cb:: with SMTP id n11mr2706856pgp.160.1592475380156; 
 Thu, 18 Jun 2020 03:16:20 -0700 (PDT)
Received: from [192.168.1.208] (220-133-187-190.HINET-IP.hinet.net.
 [220.133.187.190])
 by smtp.gmail.com with ESMTPSA id x20sm2044113pjr.44.2020.06.18.03.16.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 18 Jun 2020 03:16:19 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH v3 1/2] ALSA: hda/realtek: Add COEF controlled micmute LED
 support
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <s5hwo44ygku.wl-tiwai@suse.de>
Date: Thu, 18 Jun 2020 18:16:15 +0800
Content-Transfer-Encoding: quoted-printable
Message-Id: <50F84AE3-CA74-4231-86F2-30D7C7920B4D@canonical.com>
References: <20200617102906.16156-1-kai.heng.feng@canonical.com>
 <s5hd05xzz3d.wl-tiwai@suse.de>
 <934401DE-7A4E-4B2C-8B06-E2AA203A9336@canonical.com>
 <s5h366tzo6x.wl-tiwai@suse.de>
 <DB5A1DD9-4D61-466F-A7DE-4219534DFA4D@canonical.com>
 <s5hwo44ygku.wl-tiwai@suse.de>
To: Takashi Iwai <tiwai@suse.de>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Cc: Wenwen Wang <wenwen@cs.uga.edu>, Kailang Yang <kailang@realtek.com>,
 Tomas Espeleta <tomas.espeleta@gmail.com>,
 "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 open list <linux-kernel@vger.kernel.org>, tiwai@suse.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Hui Wang <hui.wang@canonical.com>, Thomas Hebb <tommyhebb@gmail.com>,
 Jian-Hong Pan <jian-hong@endlessm.com>
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



> On Jun 18, 2020, at 15:32, Takashi Iwai <tiwai@suse.de> wrote:
>=20
> On Thu, 18 Jun 2020 07:15:21 +0200,
> Kai-Heng Feng wrote:
>>=20
>>=20
>>=20
>>> On Jun 17, 2020, at 23:50, Takashi Iwai <tiwai@suse.de> wrote:
>>>=20
>>> On Wed, 17 Jun 2020 17:24:30 +0200,
>>> Kai-Heng Feng wrote:
>>>>=20
>>>>=20
>>>>=20
>>>>> On Jun 17, 2020, at 19:55, Takashi Iwai <tiwai@suse.de> wrote:
>>>>>=20
>>>>> On Wed, 17 Jun 2020 12:29:01 +0200,
>>>>> Kai-Heng Feng wrote:
>>>>>>=20
>>>>>> Currently, HDA codec LED class can only be used by GPIO =
controlled LED.
>>>>>> However, there are some new systems that control LED via COEF =
instead of
>>>>>> GPIO.
>>>>>>=20
>>>>>> In order to support those systems, create a new helper that can =
be
>>>>>> facilitated by both COEF controlled and GPIO controlled LED.
>>>>>>=20
>>>>>> In addition to that, add LED_CORE_SUSPENDRESUME flag since some =
systems
>>>>>> don't restore the LED properly after suspend.
>>>>>>=20
>>>>>> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
>>>>>=20
>>>>> Thanks for the quick follow up, the issues I pointed were fixed.
>>>>>=20
>>>>> But, now looking at the code change again, I'm no longer sure =
whether
>>>>> it's the right move.
>>>>>=20
>>>>> Basically, the led cdev should serve only for turning on/off the =
LED
>>>>> as given.  But your patch changes it to call the generic mixer
>>>>> updater, which is rather the one who would call the led cdev state
>>>>> update itself.  That is, it's other way round.
>>>>>=20
>>>>> IMO, what we need is to make all places calling
>>>>> snd_hda_gen_add_micmute_led() to create led cdev, and change those
>>>>> calls with snd_hda_gen_fixup_micmute_led().
>>>>=20
>>>> Ok, so it's the same as patch v1.
>>>> How should we handle vendors other than HP?
>>>> Only create led cdev if the ID matches to HP?
>>>=20
>>> It's fine to create a LED classdev for other vendors, too.  But the
>>> problem is that it wasn't consistent.  With the LED classdev, we
>>> should use only cdev, instead of mixing up different ways.
>>=20
>> Ok, now I get what you meant...
>>=20
>>>=20
>>> I wrote a few patches to convert those mic-mute LED stuff to =
classdev,
>>> including some cleanups.  The patches are found in
>>> topic/hda-micmute-led branch of sound git tree.  Could you check it?
>>>=20
>>> Note that it's totally untested.  Also it doesn't contain yet
>>> LED_CORE_SUSPENDRESUME, which should be done in another patch in
>>> anyway.
>>=20
>> Other than LED_CORE_SUSPENDRESUME, it works great!
>>=20
>> Tested-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
>=20
> Good to hear!
>=20
>>>>> It'll be a bit more changes and likely not fitting with 5.8, but =
the
>>>>> whole result will be more consistent.
>>>>=20
>>>> A bit off topic, but do you think it's reasonable to also create =
led cdev for mute LED, in addition to micmute LED?
>>>> I just found that the LEDs are still on during system suspend, and =
led cdev has the ability to turn off the LEDs on system suspend.
>>>=20
>>> Yes, it makes sense, too.  But the playback mute handling is a bit
>>> more complicated than the mic-mute LED because it's implemented with =
a
>>> vmaster hook.  I'll take a look later.
>>=20
>> Thanks. I'll be happy to test it.
>=20
> OK, I worked on this further and converted the whole mute LED handling
> with LED classdev.
>=20
> The topic/hda-micmute-led branch was updated again.  Could you give it
> a try?  If that's OK, I'll add your tested-by tag and submit the
> patches to ML later.

Thanks for the work, it works great.

Tested-by: Kai-Heng Feng <kai.heng.feng@canonical.com>

>=20
> The old patchset is saved in topic/hda-micmute-led-old branch just for
> a reference.
>=20
>=20
> thanks,
>=20
> Takashi

