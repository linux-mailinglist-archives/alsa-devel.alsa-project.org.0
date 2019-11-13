Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B7161FB38D
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Nov 2019 16:18:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C47F1654;
	Wed, 13 Nov 2019 16:17:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C47F1654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573658320;
	bh=qv5bqwoo3aH2z6uHpHMZqAxnzQqg+RkNhV1HZDvH2pU=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Wyp8Se6dUJS73ak2hL0DVLKrfhpqLhk9NVPeX9ttQAorqN3ETeG9kSQ6sdoFchsx9
	 fUAyyhV59LyQUrOAzSLho4nTMlUyfSp0q1qhCmwfPZdB9zYUcrtO4cYWC2U0g12jRr
	 HO0A4es/TuZzxaWVZetTebPwqycIBQJy1Q2cmOx8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DB5AAF80086;
	Wed, 13 Nov 2019 16:16:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A6A9F80086; Wed, 13 Nov 2019 16:16:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F15F8F8007E
 for <alsa-devel@alsa-project.org>; Wed, 13 Nov 2019 16:16:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F15F8F8007E
Received: from mail-qt1-f181.google.com ([209.85.160.181]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MxUfh-1hglhS21KD-00xvQk for <alsa-devel@alsa-project.org>; Wed, 13 Nov
 2019 16:16:43 +0100
Received: by mail-qt1-f181.google.com with SMTP id y10so2961756qto.3
 for <alsa-devel@alsa-project.org>; Wed, 13 Nov 2019 07:16:42 -0800 (PST)
X-Gm-Message-State: APjAAAXFz4kD7JZie3TZ5uopzs4+ZIgiI4D/f/fShk7DJdIW2orLeYHp
 O7ED4AWAQKSflO9ksIqsVKQDdZ0GnnAKpdXHy4I=
X-Google-Smtp-Source: APXvYqyehADfYKSO2+PD82fjNQhlUg+YenUlni8gjYwpgnn1wwsKDRbqkoOHEizWW6rShGLfKQvAB5dcAbI2A6sp3mA=
X-Received: by 2002:ac8:18eb:: with SMTP id o40mr3132571qtk.304.1573658202039; 
 Wed, 13 Nov 2019 07:16:42 -0800 (PST)
MIME-Version: 1.0
References: <20191112151642.680072-1-arnd@arndb.de>
 <20191112151642.680072-6-arnd@arndb.de>
 <s5hv9rpnj6m.wl-tiwai@suse.de>
 <CAK8P3a0esv0T6ALMXJW40B45Qy5BqVSV9rhSD_sVNUc1T+suEg@mail.gmail.com>
 <s5hmud07sfb.wl-tiwai@suse.de>
In-Reply-To: <s5hmud07sfb.wl-tiwai@suse.de>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 13 Nov 2019 16:16:26 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1gJAjyNK4R3k560VjC+sN=haWjhEX4SpgroRoMDQANiA@mail.gmail.com>
Message-ID: <CAK8P3a1gJAjyNK4R3k560VjC+sN=haWjhEX4SpgroRoMDQANiA@mail.gmail.com>
To: Takashi Iwai <tiwai@suse.de>
X-Provags-ID: V03:K1:0m/dyYyhhUdzy7xM0+yILvHJ6WqtkXASXHiBu9WOkKj+FkegzNz
 H06ikJbw3TNuMJjN7Y3qx30XQjRJaZXJ2abc4oqZAnwTiMaGelEXJLRfXA4jNBLtcdV2Gm1
 DLRcZwSYR3NTIMhk6EiNUZdNO/xPEjZrfXuA6BPAfl5mOLJAz/0Ckn6l0vThHPOOoB/qGEG
 fvQsmG2Xu1SjOh42lKsyg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:T6P65vBs77U=:nMQjyzVpkVFMMg87tVuQC/
 R948qugB+7tGVfQpIzcRDAZs0R5ErKPmLuBT2OV4WZfRmyEpjrov+zxKiGnwHpkP1SzohkpYJ
 VmKE5Cua1obXTaeGh0bVqYIZu6LHaMEB20KMwrEGG2S9NVAoXTf3Gmag1xPnaZl9COYyLpJ6w
 nN3ge9H1Xa2VvmcH8169LoKIfjrd/WaGe3hm6lyptYZCRclEQcL+VUWtBCdyo21O2uXDN0nFp
 LxGCkPbsCfSY8MmCGIJUhDx8RuEwq2vjz3HBYxYvLfY6zU/YSBfh8VhirUpefwcWS1QH7+rlm
 gMq0sm1e09fR8QfJrFCGgx1mSD8gOISLUi22IyG2SX+V5p9bNkwXmQ15GjNNbXR5Av8NV9ZWs
 ULtkcLho9LQSQUXVygeJVijIJlWye39H/4j72T/PBJVuM9gHbIMZ2Ue2FHzG8laBQjSsaAAr7
 MwrBaENDkwxMzw4+NyIfve3CLwGaVg0mtb+6xFpgqP/kT4UfagOQ5Pov3terXgVuhUeGg2E5/
 U9c2AaVc/KRUvdoykzJqJmWq12JHZphuVImeuSm5YzgM7JGtA+Y7v80s0scDuSdoEBdpAVJCr
 67L/o8sZwxpXY1aPI2xz/kRe1/3YUQ+Jn0lMSyZE2cLddILfaem+8R9JbN7x/TAIypZgkJnrw
 X0AfsqOwFQx/bFNdszb5EzP4o86X6Krc6JcL5xgbBhxporMiW36CkxEXxrFTIPAF9ezEuAvcP
 04GauSLkpIwJXPhNGzomtew6pG+eJ//+wZQp5Ggcsx6+QTqkmpgUb5dTszDvT0l9c9OMyf0mF
 mgGR80BeP9+C5zEXve0wS+3B6msTaUUhcI86z2vzzAmBKuNrUAe5AdaQEgxFiIdkhcqymwT0K
 DYHTSkfEfyA6Do4YEhaw==
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Baolin Wang <baolin.wang@linaro.org>,
 y2038 Mailman List <y2038@lists.linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 Baolin Wang <baolin.wang7@gmail.com>
Subject: Re: [alsa-devel] [PATCH v6 5/8] ALSA: Avoid using timespec for
	struct snd_rawmidi_status
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

On Tue, Nov 12, 2019 at 9:26 PM Takashi Iwai <tiwai@suse.de> wrote:
> On Tue, 12 Nov 2019 21:04:10 +0100, Arnd Bergmann wrote:
> >
> > On Tue, Nov 12, 2019 at 5:38 PM Takashi Iwai <tiwai@suse.de> wrote:
> > > On Tue, 12 Nov 2019 16:16:39 +0100, Arnd Bergmann wrote:
> > If you feel there is a problem with the padding syntax, how about enclosing
> > it in a typedef like:
> >
> > typedef struct { char pad[sizeof(time_t) - sizeof(int)]; } __time_pad;
> >
> > This typedef could be used in several structures from the other patches
> > as well.
>
> Yes, that improves the readability.

Ok, added this change to all instances, along with a description in
the changelog
when I add the typedef.

       Arnd
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
