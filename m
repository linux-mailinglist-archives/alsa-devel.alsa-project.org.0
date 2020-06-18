Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4581FEACD
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jun 2020 07:17:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 263DE1735;
	Thu, 18 Jun 2020 07:16:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 263DE1735
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592457442;
	bh=+T0qEPGF/TF2c8X8ELquDPOOSxDDqvPorvHTr/1252E=;
	h=Subject:From:In-Reply-To:Date:References:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UlNfQyURZlOGiEWr49hQ+dogDz+ZA4D/eA930MH36J4ZbNHHF0qgVwWgx/fehTAUr
	 BlG8suIpwglg2+vWHiDypEJ5b7lI+66v6CpV3qIMRVQ3IYBVEBOTrpdpwNMAlycdWe
	 ROojDUFiB4Tzf5FHX/O8uD4L3or2w2/XjgIA4z+w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B765F8010E;
	Thu, 18 Jun 2020 07:15:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9ED9FF80116; Thu, 18 Jun 2020 07:15:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 56B6EF800EF
 for <alsa-devel@alsa-project.org>; Thu, 18 Jun 2020 07:15:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56B6EF800EF
Received: from mail-pg1-f198.google.com ([209.85.215.198])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>) id 1jlmtb-0006N6-6Q
 for alsa-devel@alsa-project.org; Thu, 18 Jun 2020 05:15:27 +0000
Received: by mail-pg1-f198.google.com with SMTP id p4so3240728pgf.10
 for <alsa-devel@alsa-project.org>; Wed, 17 Jun 2020 22:15:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=Oryf7hk+67tb3UImJgvZwYdxoGsfOvkQ24Y1LrEqeGA=;
 b=BAPBt++YKQvU1cOTasUH5h1tQpF9ikqjS3+ZB1oInRk8sYDm4CA6yf1yzG5nkVW9Az
 YxUG+qgyfbvjt2ULZmYQyNoTXX0u3IdfhN8sRLtDvbdQzOb4dIPVwIvHcBdSNLEsM1gY
 nSOOjwywzYal1u3oIX48NL02Od5XgApa5/Kq865xIQXNImbgPFEuvBM4yjXs5k7o7wxJ
 eTLL8Tml2aU1TJDREaIIWnGaWTBJbjOjo8DizPqewqvIGWVXM7YWjuUYvmy/e53aWomx
 PCkhZDlbXnzOtRD5zrx7e8UNM8Jw36UsIaL8VYC5rkFnhWfCFZXKNbtkyNg95cyFaN36
 TCVw==
X-Gm-Message-State: AOAM533u4FJXuTQNsCx6nWX+Nf5lKYrEYGmMO+5BI6qS0c0rM++eF1sO
 xEVW3Oqr1oxbFHgZimYcDFA2K9ow9yZqi/aGJI8Rt37fx1mc2moXjxKETI0NfbbswD2ZuA8DIWG
 4y+DXfqaGqbOvLBptukAahD3jPjMXfJL+HMV4XV4k
X-Received: by 2002:a62:1c5:: with SMTP id 188mr2035724pfb.213.1592457325797; 
 Wed, 17 Jun 2020 22:15:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzPhKHc/zO2b0ZW4HblJG3+QUuJrSPk2mjyXEpA7DdyHDAyDpTJ8iI4CZz4gF9Uemt1JS6Ysw==
X-Received: by 2002:a62:1c5:: with SMTP id 188mr2035686pfb.213.1592457325309; 
 Wed, 17 Jun 2020 22:15:25 -0700 (PDT)
Received: from [192.168.1.208] (220-133-187-190.HINET-IP.hinet.net.
 [220.133.187.190])
 by smtp.gmail.com with ESMTPSA id u25sm1414277pfm.115.2020.06.17.22.15.22
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 17 Jun 2020 22:15:24 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH v3 1/2] ALSA: hda/realtek: Add COEF controlled micmute LED
 support
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <s5h366tzo6x.wl-tiwai@suse.de>
Date: Thu, 18 Jun 2020 13:15:21 +0800
Content-Transfer-Encoding: quoted-printable
Message-Id: <DB5A1DD9-4D61-466F-A7DE-4219534DFA4D@canonical.com>
References: <20200617102906.16156-1-kai.heng.feng@canonical.com>
 <s5hd05xzz3d.wl-tiwai@suse.de>
 <934401DE-7A4E-4B2C-8B06-E2AA203A9336@canonical.com>
 <s5h366tzo6x.wl-tiwai@suse.de>
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



> On Jun 17, 2020, at 23:50, Takashi Iwai <tiwai@suse.de> wrote:
>=20
> On Wed, 17 Jun 2020 17:24:30 +0200,
> Kai-Heng Feng wrote:
>>=20
>>=20
>>=20
>>> On Jun 17, 2020, at 19:55, Takashi Iwai <tiwai@suse.de> wrote:
>>>=20
>>> On Wed, 17 Jun 2020 12:29:01 +0200,
>>> Kai-Heng Feng wrote:
>>>>=20
>>>> Currently, HDA codec LED class can only be used by GPIO controlled =
LED.
>>>> However, there are some new systems that control LED via COEF =
instead of
>>>> GPIO.
>>>>=20
>>>> In order to support those systems, create a new helper that can be
>>>> facilitated by both COEF controlled and GPIO controlled LED.
>>>>=20
>>>> In addition to that, add LED_CORE_SUSPENDRESUME flag since some =
systems
>>>> don't restore the LED properly after suspend.
>>>>=20
>>>> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
>>>=20
>>> Thanks for the quick follow up, the issues I pointed were fixed.
>>>=20
>>> But, now looking at the code change again, I'm no longer sure =
whether
>>> it's the right move.
>>>=20
>>> Basically, the led cdev should serve only for turning on/off the LED
>>> as given.  But your patch changes it to call the generic mixer
>>> updater, which is rather the one who would call the led cdev state
>>> update itself.  That is, it's other way round.
>>>=20
>>> IMO, what we need is to make all places calling
>>> snd_hda_gen_add_micmute_led() to create led cdev, and change those
>>> calls with snd_hda_gen_fixup_micmute_led().
>>=20
>> Ok, so it's the same as patch v1.
>> How should we handle vendors other than HP?
>> Only create led cdev if the ID matches to HP?
>=20
> It's fine to create a LED classdev for other vendors, too.  But the
> problem is that it wasn't consistent.  With the LED classdev, we
> should use only cdev, instead of mixing up different ways.

Ok, now I get what you meant...

>=20
> I wrote a few patches to convert those mic-mute LED stuff to classdev,
> including some cleanups.  The patches are found in
> topic/hda-micmute-led branch of sound git tree.  Could you check it?
>=20
> Note that it's totally untested.  Also it doesn't contain yet
> LED_CORE_SUSPENDRESUME, which should be done in another patch in
> anyway.

Other than LED_CORE_SUSPENDRESUME, it works great!

Tested-by: Kai-Heng Feng <kai.heng.feng@canonical.com>

>=20
>>> It'll be a bit more changes and likely not fitting with 5.8, but the
>>> whole result will be more consistent.
>>=20
>> A bit off topic, but do you think it's reasonable to also create led =
cdev for mute LED, in addition to micmute LED?
>> I just found that the LEDs are still on during system suspend, and =
led cdev has the ability to turn off the LEDs on system suspend.
>=20
> Yes, it makes sense, too.  But the playback mute handling is a bit
> more complicated than the mic-mute LED because it's implemented with a
> vmaster hook.  I'll take a look later.

Thanks. I'll be happy to test it.

Kai-Heng

>=20
>=20
> thanks,
>=20
> Takashi

