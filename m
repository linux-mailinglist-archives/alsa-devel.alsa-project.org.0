Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FAF1123DFE
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Dec 2019 04:33:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7ABA3886;
	Wed, 18 Dec 2019 04:33:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7ABA3886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576640038;
	bh=0bmUjHSrauzjPXkxAIxl47gBDG/9I6XfUUslo3IomsQ=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EAiE5OtjVJGjtOe/opydFP39p1zJXoBS3Ce4aNbhz9Vi4fqZm0CRRv/boAFrJBvww
	 50yuH5GmH3zMO6pBoZjXOqmIsBi1bfBka8k4C8A40XKjeUrL58w34sgWdFMhs9W+qT
	 wxIX4wXvjPV/iyQJRWW5FtCk/Q2arZn4JqfUVbT4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AB161F80247;
	Wed, 18 Dec 2019 04:32:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97A5AF8022C; Wed, 18 Dec 2019 04:32:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CA28FF80088
 for <alsa-devel@alsa-project.org>; Wed, 18 Dec 2019 04:32:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA28FF80088
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="GmyvEcT6"
Received: by mail-il1-x141.google.com with SMTP id t8so459862iln.4
 for <alsa-devel@alsa-project.org>; Tue, 17 Dec 2019 19:32:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uNQxYln9aLQfjLZSaANPIy/Y3pV827IUNBQ8xdlG6dY=;
 b=GmyvEcT6FRr4s5dZWT5HMqXkM2wbduO4mLJUFh4Z3G38RMU/wzFhKY8A8RaSF9nFIS
 5bWC+uFxmk1mX/wLOwUwxHZW5CqpHv0Bvq51O6TGTUWufUFCiHfynyx0l7wS+hAJbf6t
 f1W3BqH1Z9cjqWdyd7rKDBK2luRB0r1C/o+OuNvvMQ1GsicNtJpAtpzcDhVjGswN2EgF
 uuAMXLviQ+QkFBW6YhXYNRPlJ2HbxNprratcyyITv8OLPIAF9iX5B3Zi/FcirsB4AZ8w
 vKmVXnual5gzwopOUHsf4joyIfPFiWSi4QrLUdXgyejD7hlrFfVKpTR9fMwJSugCtX+E
 hPYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uNQxYln9aLQfjLZSaANPIy/Y3pV827IUNBQ8xdlG6dY=;
 b=caTuf+pR8rQJ+1iZWQT+tnyC1iJ/gOI5VaXQ7Wg5TNT29sCCzm9ruXNe1xxnjaDpR3
 X3algpUftsmVL0EqsYnANp+pjdvoy7jqMCq4Z3m/3goPcbepYGHaDLokpC1QM8oYNf6B
 CWHXOItRbBuJWVnNWPf1d0vCuqHehauU9cD9WroKL77DojEWQyRIY0YDVkp84kcwLZL5
 NSAHyJv+l4jbYypbr9R11zZqBVlScIl0nXubwklj1Cz2AD6vplSwIRXtpgAkAOxkOzIZ
 Gy8VV4TwZZsfuhjMUWgYZLPzZYh1aXaMgJncIWov61v3kC4/L/KsDuCT38HPLjBBJL2/
 V5mw==
X-Gm-Message-State: APjAAAXtDA59+3DUevYYKXlC1dFhOYzchHzKKGYgYLDny0vocn0hv1dd
 rHDmQh0Uoj44KOBpR9jCrPC3BbNjE01sadFL2GYwkA==
X-Google-Smtp-Source: APXvYqwq4RipEUsxOrzYDq++GI9+N4CFoc0mKphSt5C4OZePIjLwP9jaYUmfXvETkyaOobvd/+/qCWCYGjALF5CJYYA=
X-Received: by 2002:a92:911b:: with SMTP id t27mr1190712ild.142.1576639926438; 
 Tue, 17 Dec 2019 19:32:06 -0800 (PST)
MIME-Version: 1.0
References: <87r212jqt1.wl-kuninori.morimoto.gx@renesas.com>
 <87pngmjqs2.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87pngmjqs2.wl-kuninori.morimoto.gx@renesas.com>
From: "Sridharan, Ranjani" <ranjani.sridharan@intel.com>
Date: Tue, 17 Dec 2019 19:31:55 -0800
Message-ID: <CAFQqKeXLbTTpNzL-G3b5rU+6Lq2ytQu9peq4Cw1K2CtGDViVpg@mail.gmail.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH v2 1/7] ASoC: soc-core: remove
	snd_soc_rtdcom_list
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

>
>
>
> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
> index 0bd2cb2..8e49fb8 100644
> --- a/sound/soc/soc-core.c
> +++ b/sound/soc/soc-core.c
> @@ -261,34 +261,18 @@ static inline void snd_soc_debugfs_exit(void)
>  static int snd_soc_rtdcom_add(struct snd_soc_pcm_runtime *rtd,
>                               struct snd_soc_component *component)
>
Morimoto-san, Thanks for this change. This is a lot more intuitive. But may
I suggest that we should also possibly consider changing the function name
above?
How about snd_soc_rtd_add_component() maybe?

Thanks,
Ranjani


>  {
> -       struct snd_soc_rtdcom_list *rtdcom;
>         struct snd_soc_component *comp;
> +       int i;
>
> -       for_each_rtd_components(rtd, rtdcom, comp) {
> +       for_each_rtd_components(rtd, i, comp) {
>                 /* already connected */
>                 if (comp == component)
>                         return 0;
>         }
>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
