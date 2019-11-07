Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1DAF24EA
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Nov 2019 03:07:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06D6F16A8;
	Thu,  7 Nov 2019 03:06:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06D6F16A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573092469;
	bh=5vKcQTxCXXy+evvC+U5Q61pPFnGJ6YJ3SCahb5EiCIw=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gcQd1LFXGDn7hKBcWQmTtbkPZ6RL9U+sEyCtRP/8pJ8nVCJIDNM5HuTtJVUdcMx+V
	 ilBvweFVbuGiSJKfNGks+oqeLPpAVdoI5B1HbqnppgdZ+rHmpP5/KOjP+eFyhJMcNi
	 6gkim7WUQYQ2QiTIBB4ksLPy8NZPb2PxTtrXUpjc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 834E7F8045F;
	Thu,  7 Nov 2019 03:02:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2239F803F4; Thu,  7 Nov 2019 03:02:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 312D5F8015B
 for <alsa-devel@alsa-project.org>; Thu,  7 Nov 2019 03:02:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 312D5F8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="rJn72CqM"
Received: by mail-qk1-x741.google.com with SMTP id 15so612497qkh.6
 for <alsa-devel@alsa-project.org>; Wed, 06 Nov 2019 18:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9zx40QsfDymTlETXrKFWvAV8aTJi2y5VL9gv3utQtmg=;
 b=rJn72CqMW5KuEfk4La1dQWM6iMqwbYM6/Z6/4avYU3RGJAmwivpy1a0mpDmH1Vk4rr
 QnkVLEZoW6zavNlJ97ZnloVErOpCvIkrhQQfi+hUPLEVkvK/udDoTFcaOChLq03dziQB
 BA9sl/WxY+bcIOyR/H2tksuxxoyP5niFB/bHFMd/0gDgAwDpxXIwo5mroVVlIrrJ1vfu
 goeR7rvlfY3NdVCDj/bOL5msMOjVfl4TFeZhvEcAdiknB9qBro7dKCTUGyzYwva4t8GO
 3ptEoiw7XjyMdvMAEQ4I7jNuMckrqktoiWdxc8fPM7GvO7rZbUsOqxeRvTfA9wDgC1/D
 Hnww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9zx40QsfDymTlETXrKFWvAV8aTJi2y5VL9gv3utQtmg=;
 b=YFixln8WGHDvtZEGXtim5JkUAr0wcu2dyyt10reQIIeD12ar/O5D161M02ZYZRQfg9
 NMrFl4NKtFpwkY6A8PqJQC4uHWYy93k533PF4sYzVQmT20+UGxHm5rZ+2nkOAjNUWij7
 XcKP4v1nNC6bsO4vLfAZKbdVQa6wWPAYCvLuJFD15vSxXANoR5clb0cyGPWgH8A/t0s/
 lsZOzxsA1G1eNvYF48SKZLGiSY9gg6HjKXxai1HmPTeHVs+N3qc4RHhvIO4NzYWalMbP
 tFlvI1W71K/pJXE72XMMiXuW2r1XfjJxReuyGhwUs1FB3GBzxX5q9NqwVznEBQxWNfHI
 so1g==
X-Gm-Message-State: APjAAAU8j7TCkUNkExmO7u6BOy0XvS8eEmPMc2clF5DC4pE7gI31Xk0k
 4ma4in+vOhdZJ5BiqM3rYs874mDXO5aDr2r7ZsZO6A==
X-Google-Smtp-Source: APXvYqy7En89GJwOrPI/ITajWIKQD/PIA6REs7CQCM8YS6RIIO6xGpXDbT+Rtf4atbzF7OPlxhjKWU8iDsYk8xXKZ4M=
X-Received: by 2002:a37:9a8a:: with SMTP id c132mr526145qke.92.1573092171775; 
 Wed, 06 Nov 2019 18:02:51 -0800 (PST)
MIME-Version: 1.0
References: <20191107015808.26844-1-cujomalainey@chromium.org>
 <20191107015808.26844-8-cujomalainey@chromium.org>
In-Reply-To: <20191107015808.26844-8-cujomalainey@chromium.org>
From: Curtis Malainey <cujomalainey@google.com>
Date: Wed, 6 Nov 2019 18:02:40 -0800
Message-ID: <CAOReqxjL_yLhofQczBsjiE=i9K=y-9sqdOaih_g=yyS6_pEKbw@mail.gmail.com>
To: Curtis Malainey <cujomalainey@chromium.org>
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH 08/11] ucm: docs: Add CaptureChannelMap
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

On Wed, Nov 6, 2019 at 5:58 PM Curtis Malainey
<cujomalainey@chromium.org> wrote:
>
> Explains to userspace how some channels may need to be rearranged. This
> is useful for systems that may have DMIC pcms with dead channels that
> will need remapping.
>
Apologies this is the coupled mixer patch, this is an error.
I will resend this with anything else that needs to be corrected
> Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
> ---
>  include/use-case.h | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/include/use-case.h b/include/use-case.h
> index 31f9e4be..9a10f390 100644
> --- a/include/use-case.h
> +++ b/include/use-case.h
> @@ -305,6 +305,9 @@ int snd_use_case_get_list(snd_use_case_mgr_t *uc_mgr,
>   *      - Remap channels using ALSA PCM channel mapping API notation
>   *        E.g. "2 3 0 1 -1 -1 -1 -1 -1 -1 -1" means, FL takes channel 2,
>   *        FR takes channel 3, RL takes channel 0, RL takes channel 1.
> + *   - CoupledMixers
> + *      - Mixer controls that should be changed together.
> + *        E.g. "Left Master,Right Master".
>   *   - EDIDFile
>   *      - Path to EDID file for HDMI devices
>   *   - JackControl, JackDev, JackHWMute
> --
> 2.24.0.432.g9d3f5f5b63-goog
>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
