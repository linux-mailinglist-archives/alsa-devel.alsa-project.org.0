Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4093867ACA4
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Jan 2023 09:44:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4BF13203;
	Wed, 25 Jan 2023 09:43:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4BF13203
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674636259;
	bh=i9qzSGCf4VjjKsRpTQdVV0e0i6suTE3BuEEdNSTpS8E=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=TPTesNchPCrnFFiREiCNbMPMYwCNVvWy7ZwLIwU6QgHbcmI+6htyZO3c1JN+t9CrO
	 f+S5X8wf/4nhy2YdMcjcjMp6oaU2cJgsCUkYRufwxrKj8SbsAtNOZ+wbkBXA3N0cay
	 eg8/bFnWHTOIe2i2GtonaMsdf18TNP7ayACaEcek=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74B65F804A9;
	Wed, 25 Jan 2023 09:43:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D2459F80424; Wed, 25 Jan 2023 09:43:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8D75FF800FB
 for <alsa-devel@alsa-project.org>; Wed, 25 Jan 2023 09:43:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D75FF800FB
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=GX0xNSqf
Received: by mail-ej1-x62f.google.com with SMTP id mp20so45548974ejc.7
 for <alsa-devel@alsa-project.org>; Wed, 25 Jan 2023 00:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=BR+sXDDqOMywpRsOn89/R8gqCffsKgaasplzlxVvrJI=;
 b=GX0xNSqfsGEizN+VyNTuk5FL4dwDgRoBnSUXE5B7H0fVbJgs4G7sAORzYx29XHc6yM
 kbVn5Tjp63mUqREvnLaVDYN/Q0tHovbsw0rDdEnUM+AZLwsUrGwBTkemU53wZtBOb9Em
 mHtZFMZKQQ4vM+QDTYEraNzd0fzOekmSjuHkR6yY0KHZ+m1SEGJCjcga65G7DHdtGk6O
 gijTe2hld9Skr5jMfJfymaP130WPBSkTVpOLDvFou4WIqYPodBDaYA5hf1Mfe3W4epd7
 Eq/I3RY9j0FTdXA00N7tu1ecvwygFXphAhE0seY/hLH5Tza1ymEqwGqNxNksyq/kTW8e
 Tcow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BR+sXDDqOMywpRsOn89/R8gqCffsKgaasplzlxVvrJI=;
 b=5/aYCCkZvBa0VkFh3Po1YbLo7ETE9Mj0kzRV8b3ORZ6owMtgAU54lv0Uaer45ReA5V
 ztQnRPcmJNtHpDB7HWIODT02doYO20OfqAs9GY2XcSfxIhONyY4Kka2Y1GokdXzwdCj4
 sgUwkQWOua+rWIRDDC3eFGKvfRd9a6pzhc40SvIZxOF2n6LGX4CdAgBui9OXMVyDMRr+
 uT7Ckc5VAj4a7MyPQZjfxUJRL4Z6wqKmMQiZE/xtTcJC2Ob/jIjw+cOPt/7QKTTCPJcb
 8Y5CAUAnpm9zKYIx9Dy/zKG3kQP9jdPct+SUwezCaD9+EdqX0/RNUu3xCQKM6inaIYOS
 4nbQ==
X-Gm-Message-State: AFqh2kqhNhc6qLyz9jQdXlN069D7Q3cQeQjoZLvAbImyr2oLuTIroNUb
 g0L/MEz66hcCjsC9Xt/gzZEEG/BxkYD7SIC/ZiI=
X-Google-Smtp-Source: AMrXdXtr5E6dw5XwwpIhgEusGf2uuT6dPnujOTecS6vhDexwQJM17FKVIrEx1pQcj8cEqXMccT72HoycrpxWbl9/P4Y=
X-Received: by 2002:a17:906:961a:b0:872:8cb:3d87 with SMTP id
 s26-20020a170906961a00b0087208cb3d87mr3435467ejx.350.1674636192510; Wed, 25
 Jan 2023 00:43:12 -0800 (PST)
MIME-Version: 1.0
References: <CAOMZO5CVCm5bpVThYW7V379PyTfyVQLBrN03cUfOxLRyBXp0gw@mail.gmail.com>
In-Reply-To: <CAOMZO5CVCm5bpVThYW7V379PyTfyVQLBrN03cUfOxLRyBXp0gw@mail.gmail.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 25 Jan 2023 10:43:03 +0200
Message-ID: <CAEnQRZAUx0Xg_3J161VG=m9oCQFNBT3aFHwExFbWWOTK6xsSTA@mail.gmail.com>
Subject: Re: i.MX8MN: SAI: First playback failure, second succeeds
To: Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Daniel Baluta <daniel.baluta@nxp.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 Shengjiu Wang <shengjiu.wang@gmail.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, Jan 25, 2023 at 5:29 AM Fabio Estevam <festevam@gmail.com> wrote:
>
> Hi,
>
> I am trying to get audio playback to work on i.MX8MN board with an
> ES9080 DAC (with a not yet upstreamed driver).
>
> The first playback after a POR fails most of the time (about 70%):
>
> speaker-test -t sine -f  2000 -c 4 -F S32_LE -D hw:3
>
> speaker-test 1.2.6
>
> Playback device is hw:3
> Stream parameters are 48000Hz, S32_LE, 4 channels
> Sine wave rate is 2000.0000Hz
> Rate set to 48000Hz (requested 48000Hz)
> Buffer size range from 6 to 32768
> Period size range from 3 to 4095
> Using max buffer size 32768
> Periods = 4
> was set period_size = 2048
> was set buffer_size = 32768
>  0 - Front Left
> Write error: -5,Input/output error
> xrun_recovery failed: -5,Input/output error
> Transfer failed: Input/output error
>
> However, the second attempt always succeeds.
>
> I dumped the E9080 registers and they match the good and failure cases.

Hi,

Can you also dump SAI registers ?
