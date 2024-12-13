Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E41569F05BA
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Dec 2024 08:46:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4612334A;
	Fri, 13 Dec 2024 08:46:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4612334A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1734076008;
	bh=rRjQS4jUL/JtWYebcDUqXrzPaB5dEzGbEPQpMDmOxAI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=t+MvRflAko2YtiGnsPVTcyrMHlF34Mjp4riZS1TlouaGH36NFv9v4XUht/yefyNo/
	 6Bkx7lfEr/KT2GsIvH7Td8PhZW1Zv37Ql9KcjX8FRjLcUfaGx5/cf5hRivw8eWN+aO
	 PMSNmiLhfN0LpEFd60ZapUDYBlZvOpGzHqxcA13w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A8970F805C0; Fri, 13 Dec 2024 08:46:16 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 12F33F805BA;
	Fri, 13 Dec 2024 08:46:16 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 48A52F80212; Fri, 13 Dec 2024 08:46:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E134DF800EE
	for <alsa-devel@alsa-project.org>; Fri, 13 Dec 2024 08:46:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E134DF800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=AL0MLsEr
Received: by mail-il1-x12b.google.com with SMTP id
 e9e14a558f8ab-3a8f1c97ef1so4428295ab.2
        for <alsa-devel@alsa-project.org>;
 Thu, 12 Dec 2024 23:46:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734075959; x=1734680759;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QYYkz5wo0agid+Six8DIqpuAadZaRu0O1Lrum3LM5+Y=;
        b=AL0MLsEr8k3vJDWriobJzSWkb1PtsxrYSzZx4jM+7qUa7yX51a//kKDMlhtVWFry2R
         acLy02O1IfRi+G7pYnubCYJvzBi5Smz7cg51pxMgootsc/cdnZJeZxI2+YjDCs9e2ABa
         uk+CCEEBzgB7WvHRC20JQzRyxGuSgLyggiTdk/b78s+fYI2bDPYdoh/VWopzzrCFyJLj
         6+xWmBZqm3qITBBIunUqrqNBQ5ZEsFKXRZjL/hCGhtwwvsWJn7eqdIfzc+v31MslyFiI
         RlFK7L64bNJLAWVOBRz7AAf9up0YdzmKVmkYjvOUyZMtV9XOpa1lvC38bJgU+uF/yl9o
         1Eww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734075959; x=1734680759;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QYYkz5wo0agid+Six8DIqpuAadZaRu0O1Lrum3LM5+Y=;
        b=nMCkH6t0DLjcRCtZK4dDCgtGjfRh4t3DbutqN84Q3XUi1v8LzE42VjtS2rCq59QLs/
         Fp61sWwvPGAJJL8WdU+1TuCgajPORFdH23t+RLmFS49ZyRTvsM4O9gYKcb3EZ6DHhvB2
         W3MKJFKtqOTRm/UgZirEGynCyL9VQxnIT70Ruo+QtK+DwfHzPlMLs8qoDBmMHGYjFrjE
         Fia//Ks8+2/DZkYsLx5g4y6euqZYf3cAk+QQzj6FSTTuxhvqZH4nmR8fzBTHP2ocdfeh
         5JqgrARzC1CHFu+iWw+JOEFRvQVGFDWhODdynV+hqZnP1eJIvtYJxdZ8MCyEcVNswXFA
         Q6ew==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMxo3d3cwKlqsZOHuq3gM4M+TjfRTlT7bJhgsxiE8oaymvz16GWBJjOXpKOquF8Wlk0s1OhzpT0nXH@alsa-project.org
X-Gm-Message-State: AOJu0Yzo3Lf+Xsv60x5/Lb5og+pc/jpui7I6zoMVVTEnwXXYDrVUk2r+
	U5/yH8kl55+IFqJyVQX8EcbMWBAF1EJEkkI0FiokKLaccp6ZnAwftH7A76Bz5L95Q/flTpQKd05
	J/ZI0j1FZsyPBfiiDg/yv/HXDyms=
X-Gm-Gg: ASbGnctcgHePG2ludAHyD1ig6kcQLv7TCssPYunH3PWa5AwNwHFEvYlTJsn5uJfq4bF
	5v53AblLZAVnMPGDohgyuQXUCVx68uPZluZ/L0w==
X-Google-Smtp-Source: 
 AGHT+IEZp59bOt9C+xTIkk05sua6DTUcqnvF1/4kOUynOScRvwUkj4Pb9JtHkrWiwmRLpAQs8Kn/IRepKMWS2L8ZLWk=
X-Received: by 2002:a05:6e02:168b:b0:3a7:a69c:9692 with SMTP id
 e9e14a558f8ab-3aff8c91543mr15440795ab.21.1734075958652; Thu, 12 Dec 2024
 23:45:58 -0800 (PST)
MIME-Version: 1.0
References: <20241212074509.3445859-1-shengjiu.wang@nxp.com>
 <20241212074509.3445859-5-shengjiu.wang@nxp.com>
 <58b4a167-5a13-49b2-9b08-58c3041b772b@sirena.org.uk>
In-Reply-To: <58b4a167-5a13-49b2-9b08-58c3041b772b@sirena.org.uk>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 13 Dec 2024 15:45:46 +0800
Message-ID: 
 <CAA+D8AMKLFJx3Z03rLthaH-7_tAmb8c1c4wCSOee-t5uxZg2oA@mail.gmail.com>
Subject: Re: [PATCH v7 4/6] ASoC: fsl_asrc_m2m: Add memory to memory function
To: Mark Brown <broonie@kernel.org>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, vkoul@kernel.org, perex@perex.cz,
 tiwai@suse.com,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: W4KIPH7O4K7FKMVTMC7UXSYSLBX6NPSS
X-Message-ID-Hash: W4KIPH7O4K7FKMVTMC7UXSYSLBX6NPSS
X-MailFrom: shengjiu.wang@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/W4KIPH7O4K7FKMVTMC7UXSYSLBX6NPSS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Dec 12, 2024 at 7:45=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Thu, Dec 12, 2024 at 03:45:07PM +0800, Shengjiu Wang wrote:
> > Implement the ASRC memory to memory function using
> > the compress framework, user can use this function with
> > compress ioctl interface.
> >
> > This feature can be shared by ASRC and EASRC drivers
>
> This breaks an x86 allmodconfig build (using GCC 13):
>
> /build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c:186:68: warning: =E2=80=
=98struct snd_compr_task_runtime=E2=80=99 declared inside parameter list wi=
ll not be visible outside of this definition or declaration
>   186 | static void asrc_m2m_device_run(struct fsl_asrc_pair *pair, struc=
t snd_compr_task_runtime *task)
>       |                                                                  =
  ^~~~~~~~~~~~~~~~~~~~~~
> /build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c: In function =E2=80=98asr=
c_m2m_device_run=E2=80=99:
> /build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c:212:26: error: invalid us=
e of undefined type =E2=80=98struct snd_compr_task_runtime=E2=80=99
>   212 |         in_buf_len =3D task->input_size;
>       |                          ^~
> /build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c:279:13: error: invalid us=
e of undefined type =E2=80=98struct snd_compr_task_runtime=E2=80=99
>   279 |         task->output_size =3D out_dma_len;
>       |             ^~
> /build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c: At top level:
> /build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c:451:49: warning: =E2=80=
=98struct snd_compr_task_runtime=E2=80=99 declared inside parameter list wi=
ll not be visible outside of this definition or declaration
>   451 |                                          struct snd_compr_task_ru=
ntime *task)
>       |                                                 ^~~~~~~~~~~~~~~~~=
~~~~~
> /build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c: In function =E2=80=98fsl=
_asrc_m2m_comp_task_create=E2=80=99:
> /build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c:465:13: error: invalid us=
e of undefined type =E2=80=98struct snd_compr_task_runtime=E2=80=99
>   465 |         task->input =3D dma_buf_export(&exp_info_in);
>       |             ^~
> /build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c:466:24: error: invalid us=
e of undefined type =E2=80=98struct snd_compr_task_runtime=E2=80=99
>   466 |         if (IS_ERR(task->input)) {
>       |                        ^~
> /build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c:467:35: error: invalid us=
e of undefined type =E2=80=98struct snd_compr_task_runtime=E2=80=99
>   467 |                 ret =3D PTR_ERR(task->input);
>       |                                   ^~
> /build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c:475:13: error: invalid us=
e of undefined type =E2=80=98struct snd_compr_task_runtime=E2=80=99
>   475 |         task->output =3D dma_buf_export(&exp_info_out);
>       |             ^~
> /build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c:476:24: error: invalid us=
e of undefined type =E2=80=98struct snd_compr_task_runtime=E2=80=99
>   476 |         if (IS_ERR(task->output)) {
>       |                        ^~
> /build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c:477:35: error: invalid us=
e of undefined type =E2=80=98struct snd_compr_task_runtime=E2=80=99
>   477 |                 ret =3D PTR_ERR(task->output);
>       |                                   ^~
> /build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c: At top level:
> /build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c:523:48: warning: =E2=80=
=98struct snd_compr_task_runtime=E2=80=99 declared inside parameter list wi=
ll not be visible outside of this definition or declaration
>   523 |                                         struct snd_compr_task_run=
time *task)
>       |                                                ^~~~~~~~~~~~~~~~~~=
~~~~
> /build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c: In function =E2=80=98fsl=
_asrc_m2m_comp_task_start=E2=80=99:
> /build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c:528:35: error: passing ar=
gument 2 of =E2=80=98asrc_m2m_device_run=E2=80=99 from incompatible pointer=
 type [-Werror=3Dincompatible-pointer-types]
>   528 |         asrc_m2m_device_run(pair, task);
>       |                                   ^~~~
>       |                                   |
>       |                                   struct snd_compr_task_runtime *
> /build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c:186:92: note: expected =
=E2=80=98struct snd_compr_task_runtime *=E2=80=99 but argument is of type =
=E2=80=98struct snd_compr_task_runtime *=E2=80=99
>   186 | static void asrc_m2m_device_run(struct fsl_asrc_pair *pair, struc=
t snd_compr_task_runtime *task)
>       |                                                             ~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
> /build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c: At top level:
> /build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c:534:47: warning: =E2=80=
=98struct snd_compr_task_runtime=E2=80=99 declared inside parameter list wi=
ll not be visible outside of this definition or declaration
>   534 |                                        struct snd_compr_task_runt=
ime *task)
>       |                                               ^~~~~~~~~~~~~~~~~~~=
~~~
> /build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c:540:47: warning: =E2=80=
=98struct snd_compr_task_runtime=E2=80=99 declared inside parameter list wi=
ll not be visible outside of this definition or declaration
>   540 |                                        struct snd_compr_task_runt=
ime *task)
>       |                                               ^~~~~~~~~~~~~~~~~~~=
~~~
> /build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c:623:10: error: =E2=80=98s=
truct snd_compr_ops=E2=80=99 has no member named =E2=80=98task_create=E2=80=
=99
>   623 |         .task_create =3D fsl_asrc_m2m_comp_task_create,
>       |          ^~~~~~~~~~~
> /build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c:623:24: warning: excess e=
lements in struct initializer
>   623 |         .task_create =3D fsl_asrc_m2m_comp_task_create,
>       |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> /build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c:623:24: note: (near initi=
alization for =E2=80=98fsl_asrc_m2m_compr_ops=E2=80=99)
> /build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c:624:10: error: =E2=80=98s=
truct snd_compr_ops=E2=80=99 has no member named =E2=80=98task_start=E2=80=
=99
>   624 |         .task_start =3D fsl_asrc_m2m_comp_task_start,
>       |          ^~~~~~~~~~
> /build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c:624:23: warning: excess e=
lements in struct initializer
>   624 |         .task_start =3D fsl_asrc_m2m_comp_task_start,
>       |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> /build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c:624:23: note: (near initi=
alization for =E2=80=98fsl_asrc_m2m_compr_ops=E2=80=99)
> /build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c:625:10: error: =E2=80=98s=
truct snd_compr_ops=E2=80=99 has no member named =E2=80=98task_stop=E2=80=
=99
>   625 |         .task_stop =3D fsl_asrc_m2m_comp_task_stop,
>       |          ^~~~~~~~~
> /build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c:625:22: warning: excess e=
lements in struct initializer
>   625 |         .task_stop =3D fsl_asrc_m2m_comp_task_stop,
>       |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> /build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c:625:22: note: (near initi=
alization for =E2=80=98fsl_asrc_m2m_compr_ops=E2=80=99)
> /build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c:626:10: error: =E2=80=98s=
truct snd_compr_ops=E2=80=99 has no member named =E2=80=98task_free=E2=80=
=99
>   626 |         .task_free =3D fsl_asrc_m2m_comp_task_free,
>       |          ^~~~~~~~~
> /build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c:626:22: warning: excess e=
lements in struct initializer
>   626 |         .task_free =3D fsl_asrc_m2m_comp_task_free,
>       |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> /build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c:626:22: note: (near initi=
alization for =E2=80=98fsl_asrc_m2m_compr_ops=E2=80=99)
> /build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c: In function =E2=80=98fsl=
_asrc_m2m_init=E2=80=99:
> /build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c:701:41: error: =E2=80=98S=
ND_COMPRESS_ACCEL=E2=80=99 undeclared (first use in this function); did you=
 mean =E2=80=98SNDRV_COMPRESS_AVAIL=E2=80=99?
>   701 |         ret =3D snd_compress_new(card, 0, SND_COMPRESS_ACCEL, "AS=
RC M2M", compr);
>       |                                         ^~~~~~~~~~~~~~~~~~
>       |                                         SNDRV_COMPRESS_AVAIL
> /build/stage/linux/sound/soc/fsl/fsl_asrc_m2m.c:701:41: note: each undecl=
ared identifier is reported only once for each function it appears in
> cc1: some warnings being treated as errors

Hi Mark

     I can't reproduce this issue with 'make allmodconfig'.
I tried the branches: for-6.13/for-6.14/for-next.

     I suspect you are using the wrong branch, because I can
reproduce this issue on for-6.12. which is caused by the below
commit that is only applied from for-6.13.
04177158cf98 ("ALSA: compress_offload: introduce accel operation mode")

    But could you please tell me your steps in detail?, so that I can
try more.

Best regards
Shengjiu Wang
