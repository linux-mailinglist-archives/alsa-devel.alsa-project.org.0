Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C8EB1F9B1
	for <lists+alsa-devel@lfdr.de>; Sun, 10 Aug 2025 12:50:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C4CA601F8;
	Sun, 10 Aug 2025 12:50:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C4CA601F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1754823039;
	bh=qS8TpbhAP4WjL5cs5ytUd9H7Pe4HhPz8faFscYw61Lc=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=scG7mTvKI+ZEUlKbjcBT/EIBFC3JycSJ9hT4fWTzEV4gjgFhUraj4MoFjXEyozgRP
	 FaQudUoZAlwXIk/hRVnR8uaHJ4Xm7FkL9NOltHTIrgGl/odx07yUR0pGosXZRYyzYR
	 KSJ8Cj4s6540VqmyHDUIpA2HbiKF18umCRqaHyX4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3D35BF805D3; Sun, 10 Aug 2025 12:50:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EED91F805CB;
	Sun, 10 Aug 2025 12:50:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C1A7FF80154; Wed,  6 Aug 2025 12:01:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_40,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com
 [209.85.221.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6EE6CF80134
	for <alsa-devel@alsa-project.org>; Wed,  6 Aug 2025 12:01:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6EE6CF80134
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=riscv-rocks.de header.i=@riscv-rocks.de
 header.a=rsa-sha256 header.s=google header.b=FrrRQz4y
Received: by mail-vk1-f182.google.com with SMTP id
 71dfb90a1353d-5392bf8b590so3691945e0c.3
        for <alsa-devel@alsa-project.org>;
 Wed, 06 Aug 2025 03:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscv-rocks.de; s=google; t=1754474503; x=1755079303;
 darn=alsa-project.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R5dE86/gwg8v34qkAE2TEB8lhTTeYs/JThQrdrmyw5A=;
        b=FrrRQz4yEBsDCHQb4q29/KTiO+N+Wb5vpaFjq2D5gwxOad8eQdGudEvLp5J12a23Zx
         Kq72XaT5ltdv3z1w+ENtzK6WaW+ltNYGRU8sHGmIZiIBT/eEvI1II2H2E7nJMWddhw2R
         v1+CJIbOGaRA63rFtXEWDZpN/Qhcqh9cPiBLlhbqNpRoTL5ZoDr1oBnP9gBC4F0Vh/4V
         F7xJTrM11lZOdoKBvLMvxiY4pvNq4qG6aiXrGidkADvQ8P87/QVfaXSGVDMI+A+x0ww7
         xcILdc6V7fDyTU4U0eDnA7LVmW1TOnqxvqlt+LmG9IkHf+YaySH3lNy1UPYM2D7to6QS
         be9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754474503; x=1755079303;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R5dE86/gwg8v34qkAE2TEB8lhTTeYs/JThQrdrmyw5A=;
        b=pfrVINAHe7tuQs+ctS8adLM+WJDfAn5tpgNsI7I8DvgCFVE1JVEo+L2go7FyCL6viZ
         inJidzMMQXLlYAduW2puIJlKX22EJi6sXBASFEzhBxr9zRn6S9TS69hf63bo69lJGLlc
         iTx67wshHYPKRrluEh78uEdPnNjembc4d+mEw48f1YxBawIVSlEYgsa08vaK9uAuN1YR
         WeTyPW50x9uCbs6oBEzGu8kL35kwE1r4MqFHm3m3SSGa2I7t3hax4Wax5khuXr813o49
         +lO3ePm0ZBfoUW7mYSj4ZT4P+kdBPfq46HRBHmYYYAlR/YCEGP8RmHcGVMz7hbBZwus6
         S6XA==
X-Gm-Message-State: AOJu0YxG5CkviKuaE7YFNBnWzcE1sQW66w/EsY369sZ2EAfKzu3tv1LQ
	S+sUZUgKvfI291gIfi6sSvuYbWsWho/JLd7fOFwTJyEGV6jJBkyUX95qGTI023ivnUTnbxuRHxX
	0HvnKSk5FCLztK58EZwxhkaDhmz0LmEHIfPpGhIEfJB+vHNinGlQwRbCDyhSH/r8=
X-Gm-Gg: ASbGncvAgh4vvaDB2RDfyjYMwTexcQIsZIroJ3JTh0u+53FOWKn53lKbQN1SKjd2UVr
	dtlNPGL2V723VFJJMeAihGctarhQafUxI1wUu6Gs62eaIc0W8MOPP/BkAi92rgIw3YXL7U68+0C
	rdOIEJhXoSbqGzYpEp3UBJ310fFtIQ0XnTiRiObVX16kir29uvr9wXJik5PzHZq81J+MmvK0iFX
	EcYNlILUp1OmD0pLGULmnyGy3ynksU9yNjgHg==
X-Google-Smtp-Source: 
 AGHT+IE6r1J6qlMWgviQ+yxewLA2Nrkn4/twZpiqvHYa1jicNDRPEMHTTOHmNrgYST9R5Gr4uGai7fT/DT6T5M0mo10=
X-Received: by 2002:a05:6122:3094:b0:539:1a61:9058 with SMTP id
 71dfb90a1353d-539a03a49eemr862032e0c.3.1754474503195; Wed, 06 Aug 2025
 03:01:43 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CAL=B37=-_dBswNrQHc4dgfgZhoyjmaYQxE5dGZhQeB0ZGf0GtA@mail.gmail.com>
In-Reply-To: 
 <CAL=B37=-_dBswNrQHc4dgfgZhoyjmaYQxE5dGZhQeB0ZGf0GtA@mail.gmail.com>
From: Damian Tometzki <damian@riscv-rocks.de>
Date: Wed, 6 Aug 2025 12:01:31 +0200
X-Gm-Features: Ac12FXywPlNq7SfgsHizNX3R18WSAMYHzCjLnsGZ3T5P7n0cymx8Xvg9OE8AgJY
Message-ID: 
 <CAL=B37kfXQ1kcVCYGCZrcP4PqYhU43km+NLtv3eP0XyspjEktg@mail.gmail.com>
Subject: Re: ASoC HDMI errors with sof-hda-dsp on Intel platform (no PCM for
 intel-hdmi-hifiX)
To: alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MailFrom: damian@tometzki.de
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: RZWJBGFVHYJ6RBRGFILQEETDCHPGFSZ2
X-Message-ID-Hash: RZWJBGFVHYJ6RBRGFILQEETDCHPGFSZ2
X-Mailman-Approved-At: Sun, 10 Aug 2025 10:49:57 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RZWJBGFVHYJ6RBRGFILQEETDCHPGFSZ2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi all,

I'm experiencing ASoC errors on an Intel-based system using the
`sof-hda-dsp` driver. After boot, the kernel logs repeated errors
related to HDMI outputs:

[   90.933290] snd_hda_codec_generic ehdaudio0D2:
snd_soc_find_pcm_from_dai: didn't find PCM for DAI intel-hdmi-hifi1
[   90.933295] snd_hda_codec_generic ehdaudio0D2: ASoC error (-22): at
snd_soc_dai_startup() on intel-hdmi-hifi1
...
[   91.016259] HDMI3: ASoC error (-22): at dpcm_fe_dai_startup() on HDMI3

These errors are repeated for HDMI1, HDMI2, and HDMI3. It appears that
`snd_soc_find_pcm_from_dai()` fails to resolve the DAI to a PCM, and
this breaks HDMI audio initialization.

**System info:**
- Kernel: current Linus build 2938ae2fa7cd
- Distro: Fedora 42
- HDMI monitor with audio capability isn=C2=B4t connected

Is there a known fix or workaround?
Thanks in advance,
Damian

On Sat, Aug 2, 2025 at 12:46=E2=80=AFPM Damian Tometzki <damian@riscv-rocks=
.de> wrote:
>
> Hi all,
>
> I'm experiencing ASoC errors on an Intel-based system using the
> `sof-hda-dsp` driver. After boot, the kernel logs repeated errors
> related to HDMI outputs:
>
> [   90.933290] snd_hda_codec_generic ehdaudio0D2:
> snd_soc_find_pcm_from_dai: didn't find PCM for DAI intel-hdmi-hifi1
> [   90.933295] snd_hda_codec_generic ehdaudio0D2: ASoC error (-22): at
> snd_soc_dai_startup() on intel-hdmi-hifi1
> ...
> [   91.016259] HDMI3: ASoC error (-22): at dpcm_fe_dai_startup() on HDMI3
>
> These errors are repeated for HDMI1, HDMI2, and HDMI3. It appears that
> `snd_soc_find_pcm_from_dai()` fails to resolve the DAI to a PCM, and
> this breaks HDMI audio initialization.
>
> **System info:**
> - Kernel: current Linus build 2938ae2fa7cd
> - Distro: Fedora 42
> - HDMI monitor with audio capability isn=C2=B4t connected
>
> Is there a known fix or workaround?
> Thanks in advance,
> Damian
