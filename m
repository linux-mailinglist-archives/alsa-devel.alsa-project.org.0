Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 84CD36686E5
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Jan 2023 23:25:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3E089C83;
	Thu, 12 Jan 2023 23:25:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3E089C83
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673562358;
	bh=tS2ptCtEZx0aUVYdLlYkcd12G8gkkh0ril5iFqXE19M=;
	h=From:Date:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=l6SFk74WK1cVEcwNQaPl36tZ2nNahCIrPG6ICw0Qxu+4PzbqaImaQ+M9M+Z2MUJgH
	 u8jLsLIzKCf8hlkw7v4TlwgauhFs/gUvhzIkS/dZIdc15+E2/1QOIdfMdCykgA5O2n
	 rsF0mmcwOiuNN13Db8feWgRKDqo7DgBth70qRK8Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 39B9EF8016E;
	Thu, 12 Jan 2023 23:25:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3B9DAF804C1; Thu, 12 Jan 2023 23:24:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F37C5F8019B
 for <alsa-devel@alsa-project.org>; Thu, 12 Jan 2023 23:24:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F37C5F8019B
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=EQoAb1Ex
Received: by mail-pj1-x102a.google.com with SMTP id
 s13-20020a17090a6e4d00b0022900843652so3563506pjm.1
 for <alsa-devel@alsa-project.org>; Thu, 12 Jan 2023 14:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-disposition:mime-version:message-id:subject:cc:to:date:from
 :from:to:cc:subject:date:message-id:reply-to;
 bh=A54yac4BAWkZwqOsOOvFHf19PWyqxHbK9tJTpVIoor0=;
 b=EQoAb1ExTwoGBg5iu0h4ji9Q8ozYqVUjmxuo85Z3uH5Vk06mydwcR8YAQKqDKKo12+
 1W2UmZZUCoPxiCLe22X+wVkFwqgSOucLH2TfxfJMBbNiHeG65OEFpTEfHlX1lR6Poorm
 nK1kOQB143Igo2sQP7Urp06rQINg10PTRo46g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:date:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=A54yac4BAWkZwqOsOOvFHf19PWyqxHbK9tJTpVIoor0=;
 b=JnnwfW1BHd9a0OP9UnxZrF1E3CJZkRXX7OD0+FdEmDXZkjZXYn3o5Y1CCL+1D1k+xq
 MBCBHiKVTgDN/kc1C1MiWfeBWfxtlYvBQZGhjBNpuPqLF6Fj5ANU5DxhwLygbR/x88yQ
 OmUitgNCdqCa5ow9wiLoY7HlAND4AbI4hRGfbpsTTeM3vyd8/1nIHWxjYqy+b7xjF9m3
 +KCJNZXsYpelLT9PtxUJ45Ptr636W1Y1lFE4A1k23m0I9ucEDuS5j+mZCtsvOSZ+6G9P
 qnG3X6DrfBpVrXS9mMzTIHJdUuK3RQnx/CTSmzjUOyUzlXMvQhnuwsAPkmXLbdQIt6Ri
 5HfA==
X-Gm-Message-State: AFqh2kqlINt1yxGGy1elJS7Ruzuk0chvPviEfvZE0P1IcIXYO074x4Hu
 D8cuTTKW3R6G/xA5UDVWZ3OfYbYzIOJXcUeX
X-Google-Smtp-Source: AMrXdXtExiiGpzJwhZ4BU+ZUXWCuCrBSSK6jsQ5VM76HO8tdzVlZ22HjPbCnQ6UwzP2EXolqWHJNrw==
X-Received: by 2002:a17:902:c104:b0:194:66db:778d with SMTP id
 4-20020a170902c10400b0019466db778dmr2314847pli.32.1673562293891; 
 Thu, 12 Jan 2023 14:24:53 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 jj13-20020a170903048d00b001928d49bf84sm12611649plb.191.2023.01.12.14.24.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jan 2023 14:24:53 -0800 (PST)
From: coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date: Thu, 12 Jan 2023 14:24:52 -0800
To: Jaroslav Kysela <perex@perex.cz>
Subject: Coverity: snd_usb_pcm_has_fixed_rate(): Null pointer dereferences
Message-ID: <202301121424.4A79A485@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: alsa-devel@alsa-project.org, Dan Carpenter <error27@gmail.com>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Takashi Iwai <tiwai@suse.de>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, chihhao chen <chihhao.chen@mediatek.com>,
 linux-next@vger.kernel.org, linux-hardening@vger.kernel.org,
 =?iso-8859-1?Q?Andr=E9?= Kapelrud <a.kapelrud@gmail.com>,
 Matteo Martelli <matteomartelli3@gmail.com>,
 Colin Ian King <colin.i.king@gmail.com>, Craig McLure <craig@mclure.net>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hello!

This is an experimental semi-automated report about issues detected by
Coverity from a scan of next-20230111 as part of the linux-next scan project:
https://scan.coverity.com/projects/linux-next-weekly-scan

You're getting this email because you were associated with the identified
lines of code (noted below) that were touched by commits:

  Mon Jan 9 16:05:21 2023 +0100
    291e9da91403 ("ALSA: usb-audio: Always initialize fixed_rate in snd_usb_find_implicit_fb_sync_format()")

Coverity reported the following:

*** CID 1530547:  Null pointer dereferences  (REVERSE_INULL)
sound/usb/pcm.c:166 in snd_usb_pcm_has_fixed_rate()
160     bool snd_usb_pcm_has_fixed_rate(struct snd_usb_substream *subs)
161     {
162     	const struct audioformat *fp;
163     	struct snd_usb_audio *chip = subs->stream->chip;
164     	int rate = -1;
165
vvv     CID 1530547:  Null pointer dereferences  (REVERSE_INULL)
vvv     Null-checking "subs" suggests that it may be null, but it has already been dereferenced on all paths leading to the check.
166     	if (!subs)
167     		return false;
168     	if (!(chip->quirk_flags & QUIRK_FLAG_FIXED_RATE))
169     		return false;
170     	list_for_each_entry(fp, &subs->fmt_list, list) {
171     		if (fp->rates & SNDRV_PCM_RATE_CONTINUOUS)

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1530547 ("Null pointer dereferences")
Fixes: 291e9da91403 ("ALSA: usb-audio: Always initialize fixed_rate in snd_usb_find_implicit_fb_sync_format()")

Thanks for your attention!

-- 
Coverity-bot
