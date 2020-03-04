Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E16E179C3A
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Mar 2020 00:16:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 19CB9852;
	Thu,  5 Mar 2020 00:15:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 19CB9852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583363789;
	bh=EsBLIq659Fx3vuxtmvb+b7oIVh5TpLOjhO1dOzP12QA=;
	h=From:To:Subject:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KIUkjkc5AZfnp/PKWIPbMamresDw87j4qcW5bkEaTq58Fp7qKQ+SqMgg/Srsg+XmP
	 92Ote1QovpH1sA2Fm6N5ECSU0RSusjhkNYTcCjYctGrokxadHTAKJmomMkoMr5moOO
	 gfnCxV8VrNbgNb0uhpPA2AAh75dYb91w4k03ULwk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23552F8012D;
	Thu,  5 Mar 2020 00:14:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B12FCF801ED; Thu,  5 Mar 2020 00:14:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=FREEMAIL_FROM, KHOP_HELO_FCRDNS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtp.smtpout.orange.fr (smtp10.smtpout.orange.fr
 [80.12.242.132])
 (using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1AC28F8012D
 for <alsa-devel@alsa-project.org>; Thu,  5 Mar 2020 00:14:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1AC28F8012D
Received: from belgarion ([86.210.245.36]) by mwinf5d33 with ME
 id APEe220030nqnCN03PEeCk; Thu, 05 Mar 2020 00:14:41 +0100
X-ME-Helo: belgarion
X-ME-Auth: amFyem1pay5yb2JlcnRAb3JhbmdlLmZy
X-ME-Date: Thu, 05 Mar 2020 00:14:41 +0100
X-ME-IP: 86.210.245.36
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Guenter Roeck <linux@roeck-us.net>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] ASoC: Fix SND_SOC_ALL_CODECS imply ac97 fallout
References: <20200224112537.14483-1-geert@linux-m68k.org>
 <20200303143444.GA25683@roeck-us.net>
 <CAMuHMdWZxc5KjHaOhk5xdcjSn54i3ku7b1dW6tXhXbjku1eLww@mail.gmail.com>
X-URL: http://belgarath.falguerolles.org/
Date: Thu, 05 Mar 2020 00:14:38 +0100
In-Reply-To: <CAMuHMdWZxc5KjHaOhk5xdcjSn54i3ku7b1dW6tXhXbjku1eLww@mail.gmail.com>
 (Geert Uytterhoeven's message of "Tue, 3 Mar 2020 15:56:25 +0100")
Message-ID: <878skf1zmp.fsf@belgarion.home>
User-Agent: Gnus/5.130008 (Ma Gnus v0.8) Emacs/26 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
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

Geert Uytterhoeven <geert@linux-m68k.org> writes:

> Hi G=C3=BCnter
>
> On Tue, Mar 3, 2020 at 3:34 PM Guenter Roeck <linux@roeck-us.net> wrote:
>> On Mon, Feb 24, 2020 at 12:25:37PM +0100, Geert Uytterhoeven wrote:
>> > On i386 randconfig:
>> >
>> >     sound/soc/codecs/wm9705.o: In function `wm9705_soc_resume':
>> >     wm9705.c:(.text+0x128): undefined reference to `snd_ac97_reset'
>> >     sound/soc/codecs/wm9712.o: In function `wm9712_soc_resume':
>> >     wm9712.c:(.text+0x2d1): undefined reference to `snd_ac97_reset'
>> >     sound/soc/codecs/wm9713.o: In function `wm9713_soc_resume':
>> >     wm9713.c:(.text+0x820): undefined reference to `snd_ac97_reset'
>> >
>> > Fix this by adding the missing dependencies on SND_SOC_AC97_BUS.
>> >
>>
>> With this patch applied, arm:pxa_defconfig reports a variety of unmet
>> SND_SOC dependencies, and it fails to build.
>>
>> ERROR: "snd_ac97_reset" [sound/soc/codecs/snd-soc-wm9713.ko] undefined!
>> ERROR: "snd_ac97_reset" [sound/soc/codecs/snd-soc-wm9712.ko] undefined!
>> ERROR: "snd_ac97_reset" [sound/soc/codecs/snd-soc-wm9705.ko] undefined!
>>
>> Reverting this patch fixes the problem.
>
> Should SND_PXA2XX_SOC_AC97 in sound/soc/pxa/Kconfig select
> SND_SOC_AC97_BUS instead of SND_SOC_AC97_BUS_NEW?
> The latter does not exist.
Hi Geert,

The answer is no, PXA is now specifically ported to work with the new AC97 =
bus
implementation, ie. AC97_BUS_NEW=3Dy as in sound/ac97/.

The 2 implementations of AC97 bus, ie. CONFIG_AC97_BUS and CONFIG_AC97_BUS_=
NEW
are exclusive, they cannot coexist in the same kernel AFAIR.

Sorry for the late reply on this thread, but I moved house lately and I'm q=
uite
busy, so my answers are delayed.

As a side note, I've seen somewhere in the patches this :
SND_SOC_WM971{2,3} depends on SND_SOC_AC97_BUS. This looks wrong to me, as =
it
implies that a wolfson wm97xx sound driver can only exist with
CONFIG_AC97_BUS=3Dy, which is false, because it can exist with
CONFIG_AC97_BUS_NEW=3Dy.

I also saw someone saying the CONFIG_SND_SOC_AC97_BUS_NEW didn't exist; thi=
s is
true, most likely because I forgot it when I created the new AC97 bus. I'd =
think
the natural fix would be to add CONFIG_SND_SOC_AC97_BUS_NEW just after his =
twin
definition in sound/soc/Kconfig, but I might be wrong ...

Cheers.

--
Robert
