Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 63CF557B075
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Jul 2022 07:43:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F38A172A;
	Wed, 20 Jul 2022 07:43:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F38A172A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658295831;
	bh=TKQoOVkJmPgBGSegWs3TGUXEH7seYk+4lZ78ijMSEtY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OrBiSSEU+DIQpAGrP3b2IXl5bZvMJAj87RaIRkCgUAEP903m1hYlQHnNuskmAfFF7
	 73QGp2M2HR2iflOiRDEdPFUtzknDWlCtT8XeWK+BsPWAYLVPKRUDw9/Mml26+MkYz6
	 /enf+Qo+Y2tg9kJaQDmLf1sR0dllRjL0Cg7sAWbI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AB48DF8025D;
	Wed, 20 Jul 2022 07:42:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ECE33F80169; Wed, 20 Jul 2022 07:42:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 45AB2F800BA
 for <alsa-devel@alsa-project.org>; Wed, 20 Jul 2022 07:42:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45AB2F800BA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="K2sf2zbZ"
Received: by mail-lf1-x12f.google.com with SMTP id z22so14850859lfu.7
 for <alsa-devel@alsa-project.org>; Tue, 19 Jul 2022 22:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+aL53xeHszDzXfVsqRlkFlKt1uWxXV5MXK0jzsINeM8=;
 b=K2sf2zbZ6UbHQ8IMqoiIxBfw/z2F06npJu4TRP/EyTANSofa3VS/PwhDxSkek/fDU6
 zN6txnGaWxWJj7AazYi4X8E6XhqZnKqwtuLJ7W7J9NQuMIN6F+S35ebOo69ThgvMI8ZL
 nDK9ERxiVUhg5T+Ll3IXVyJ66vSAlaz+hxBzBxKHMYrstFiof7N0AEsBuh/kFrIQlieh
 59RFXtVYFxCt5FdA23dC8bnWqO2KUK90MepFV/g2QL0iPN2PNTYJW8sR6Pnyp/BixdbX
 skIfO+Q5GGCKVkof4WPFEhO3qDzMUzSmCFWe8QrL30ZiqqKdTqw7+Sp7GyUUtb62gWlg
 81AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+aL53xeHszDzXfVsqRlkFlKt1uWxXV5MXK0jzsINeM8=;
 b=KaX7h/VfUZa4/kCnO6yX/kHfPp9BUSA+u6KXTOZba13/ZdNufLYlCBktcEVjkwseU3
 hzpsIzi8AI76/rxj0zZ1K8e19Lnq+nDprxWgNqjH83ysoq7vjV4z+69Z9Fmc0pJEmJKI
 yEo+upIsMNuBNbrNx+61waueFLR26A7vh4kr/Dmw+PPmpskpYKWL4pfODo0WN9WUU9ju
 wpBP3LaAPjhg9bIWLeegYlI3YVKQSthrYqFlUVjDOBXrHUY4pA2zwLQIPlK3dF24rxQ6
 IqAT7rDPoWvpPTbrBGQYKDPuoafOHq7Z3PfD+dkxcA7mYW8dMgRWwf/cinUG011MnYBs
 lkpQ==
X-Gm-Message-State: AJIora9lXbXMqxHT93857LyCXStIo/aJNHgkG1OG2DfxmFqBfUqbE5Qr
 7a6AFS0nF/sQg1NZfRVsqd/TqOh7uEduzUMNEts=
X-Google-Smtp-Source: AGRyM1t3Ie1nCgCu4TCjs+FvoSxysaFjDDcvKN0+JNwIZ0/8s7qHAPvs7mGVswvUY90fJtPXGawN5k8b0KxEl99PBNg=
X-Received: by 2002:a05:6512:1153:b0:48a:201d:5f77 with SMTP id
 m19-20020a056512115300b0048a201d5f77mr13168824lfg.280.1658295760028; Tue, 19
 Jul 2022 22:42:40 -0700 (PDT)
MIME-Version: 1.0
References: <1658222864-25378-1-git-send-email-shengjiu.wang@nxp.com>
 <1658222864-25378-3-git-send-email-shengjiu.wang@nxp.com>
 <f2609401c8834e8bbe926200bfc87971@AcuMS.aculab.com>
 <YtaEpf6Cd7KH7wH4@sirena.org.uk>
 <20cfcc8e59a74166846cff028cd2c4e8@AcuMS.aculab.com>
 <CAA+D8AO6P2AcOJ+E97Y1=P72Qa1wjtMGMneWnsP+VcdnCzzYuw@mail.gmail.com>
 <c9231becb2cd4e2999ec631f9d2171c3@AcuMS.aculab.com>
 <CAA+D8AMTrp3KXpDEtyJbqgbA8feYCvEcWc4CMYY8zYSMgrvW6w@mail.gmail.com>
In-Reply-To: <CAA+D8AMTrp3KXpDEtyJbqgbA8feYCvEcWc4CMYY8zYSMgrvW6w@mail.gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 20 Jul 2022 13:42:28 +0800
Message-ID: <CAA+D8AN2Mp8SjsFO6ZoKuNmx4Tv1MFzVQzveDEk+aBvv9RkuuA@mail.gmail.com>
Subject: Re: [PATCH -next 2/5] ASoC: fsl_asrc: force cast the asrc_format type
To: David Laight <David.Laight@aculab.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, "tiwai@suse.com" <tiwai@suse.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "nicoleotsuka@gmail.com" <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, "festevam@gmail.com" <festevam@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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

Hi David

On Tue, Jul 19, 2022 at 9:35 PM Shengjiu Wang <shengjiu.wang@gmail.com>
wrote:

>
>
> On Tue, Jul 19, 2022 at 8:39 PM David Laight <David.Laight@aculab.com>
> wrote:
>
>> grrr... top-posting because outluck is really stupid :-(
>>
>>
>>
>> The definition seems to be:
>>
>> typedef int __bitwise
>> <https://elixir.bootlin.com/linux/v5.19-rc7/C/ident/__bitwise>
>> snd_pcm_format_t
>> <https://elixir.bootlin.com/linux/v5.19-rc7/C/ident/snd_pcm_format_t>;
>>
>> #define SNDRV_PCM_FORMAT_S8
>> <https://elixir.bootlin.com/linux/v5.19-rc7/C/ident/SNDRV_PCM_FORMAT_S8>
>> ((__force <https://elixir.bootlin.com/linux/v5.19-rc7/C/ident/__force>
>> snd_pcm_format_t
>> <https://elixir.bootlin.com/linux/v5.19-rc7/C/ident/snd_pcm_format_t>) 0=
)
>>
>> #define SNDRV_PCM_FORMAT_U8
>> <https://elixir.bootlin.com/linux/v5.19-rc7/C/ident/SNDRV_PCM_FORMAT_U8>
>> ((__force <https://elixir.bootlin.com/linux/v5.19-rc7/C/ident/__force>
>> snd_pcm_format_t
>> <https://elixir.bootlin.com/linux/v5.19-rc7/C/ident/snd_pcm_format_t>) 1=
)
>>
>> #define SNDRV_PCM_FORMAT_S16_LE
>> <https://elixir.bootlin.com/linux/v5.19-rc7/C/ident/SNDRV_PCM_FORMAT_S16=
_LE>
>> ((__force <https://elixir.bootlin.com/linux/v5.19-rc7/C/ident/__force>
>> snd_pcm_format_t
>> <https://elixir.bootlin.com/linux/v5.19-rc7/C/ident/snd_pcm_format_t>) 2=
)
>>
>> ...
>>
>> (goes away and looks up __bitwIse)
>>
>>
>>
>> I think I=E2=80=99d add:
>>
>> #define snd_pcm_format(val) ((__force snd_pcm_format_t)(val))
>>
>
> Where is this definition? Which header file?
> Thanks.
>
>
Here is the change based on your proposal.
Not sure if there is misunderstanding.
Not sure if the definition can be put in pcm.h.

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index 26523cfe428d..93e53b195ef9 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -1477,6 +1477,8 @@ static inline u64 pcm_format_to_bits(snd_pcm_format_t
pcm_format)
        return 1ULL << (__force int) pcm_format;
 }

+#define snd_pcm_format(val) ((__force snd_pcm_format_t)(val))
+
 /**
  * pcm_for_each_format - helper to iterate for each format type
  * @f: the iterator variable in snd_pcm_format_t type
diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index 544395efd605..dcfdfb6b3472 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -1066,6 +1066,7 @@ static int fsl_asrc_probe(struct platform_device
*pdev)
        struct resource *res;
        void __iomem *regs;
        int irq, ret, i;
+       u32 asrc_fmt =3D 0;
        u32 map_idx;
        char tmp[16];
        u32 width;
@@ -1174,7 +1175,8 @@ static int fsl_asrc_probe(struct platform_device
*pdev)
                return ret;
        }

-       ret =3D of_property_read_u32(np, "fsl,asrc-format", (u32
*)&asrc->asrc_format);
+       ret =3D of_property_read_u32(np, "fsl,asrc-format", &asrc_fmt);
+       asrc->asrc_format =3D snd_pcm_format(asrc_fmt);
        if (ret) {
                ret =3D of_property_read_u32(np, "fsl,asrc-width", &width);
                if (ret) {
@@ -1197,7 +1199,7 @@ static int fsl_asrc_probe(struct platform_device
*pdev)
                }
        }

-       if (!(FSL_ASRC_FORMATS & (1ULL << (__force u32)asrc->asrc_format)))
{
+       if (!(FSL_ASRC_FORMATS & pcm_format_to_bits(asrc->asrc_format))) {
                dev_warn(&pdev->dev, "unsupported width, use default
S24_LE\n");
                asrc->asrc_format =3D SNDRV_PCM_FORMAT_S24_LE;

best regards
wang shengjiu

>
> and use that to remove most of the casts.
>>
> But the ones where you have (u32 *)&xxx are only valid because u32 and in=
t
>> are the same size.
>>
>> That does sort of happen to be true, but someone might look at all the
>> values and
>>
>> decide that u8 is big enough.
>>
>> After which the code will still compile, but the data areas get corrupte=
d.
>>
>> So you really need to use a u32 =E2=80=98temp=E2=80=99 variable.
>>
>>
>>
>> It would all be slightly less problematic if the =E2=80=98force=E2=80=99=
 casts could be
>> sparse only
>>
>> (ie not seen by the compiler) =E2=80=93 so the compiler would do the typ=
e
>> checking.
>>
>>
>>
>>                 David
>>
>>
>>
>> *From:* Shengjiu Wang <shengjiu.wang@gmail.com>
>> *Sent:* 19 July 2022 12:07
>> *To:* David Laight <David.Laight@ACULAB.COM>
>> *Cc:* Mark Brown <broonie@kernel.org>; Shengjiu Wang <
>> shengjiu.wang@nxp.com>; Xiubo.Lee@gmail.com; festevam@gmail.com;
>> nicoleotsuka@gmail.com; lgirdwood@gmail.com; perex@perex.cz;
>> tiwai@suse.com; alsa-devel@alsa-project.org;
>> linuxppc-dev@lists.ozlabs.org; linux-kernel@vger.kernel.org
>> *Subject:* Re: [PATCH -next 2/5] ASoC: fsl_asrc: force cast the
>> asrc_format type
>>
>>
>>
>>
>>
>>
>>
>> On Tue, Jul 19, 2022 at 6:34 PM David Laight <David.Laight@aculab.com>
>> wrote:
>>
>> From: Mark Brown
>> > Sent: 19 July 2022 11:17
>> >
>> > On Tue, Jul 19, 2022 at 10:01:54AM +0000, David Laight wrote:
>> > > From: Shengjiu Wang
>> >
>> > > > - ret =3D of_property_read_u32(np, "fsl,asrc-format",
>> &asrc->asrc_format);
>> > > > + ret =3D of_property_read_u32(np, "fsl,asrc-format", (u32
>> *)&asrc->asrc_format);
>> >
>> > > Ugg, you really shouldn't need to do that.
>> > > It means that something is badly wrong somewhere.
>> > > Casting pointers to integer types is just asking for a bug.
>> >
>> > That's casting one pointer type to another pointer type.
>>
>> It is casting the address of some type to a 'u32 *'.
>> This will then be dereferenced by the called function.
>> So the original type better be 32 bits.
>>
>> I'm also guessing that sparse was complaining about endianness?
>> It isn't at all clear that these casts actually fix it.
>>
>> The sparse is complaining about the snd_pcm_format_t cast to u32/int typ=
e.
>>
>>
>>
>> The code in include/sound/pcm.h also does such __force cast.
>>
>> #define _SNDRV_PCM_FMTBIT(fmt)          (1ULL << (__force
>> int)SNDRV_PCM_FORMAT_##fmt)
>>
>>
>>
>> The change I have made does not cause an issue.
>>
>>
>>
>> Best regards
>>
>> Wang shengjiu
>>
>>
>>
>> (Mark: You'll be glad to hear that the office aircon is
>> broken again - two weeks lead time on the spare part.)
>>
>>         David
>>
>> -
>> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK=
1
>> 1PT, UK
>> Registration No: 1397386 (Wales)
>>
>>
>>
>> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK=
1
>> 1PT, UK
>> Registration No: 1397386 (Wales)
>>
>> P *Please consider the environment and don't print this e-mail unless
>> you really need to*
>>
>
