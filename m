Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 959C143224D
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Oct 2021 17:10:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A681180D;
	Mon, 18 Oct 2021 17:09:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A681180D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634569825;
	bh=i7a8x38ZUMur9r+XyG9TrbQnaGeyAnPXtJpTCwUvvvs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Yg4TgmP7RBwc8++qQM3fcYhPbRF2a+fL2EPEsNV+gWnsGmmYrVrs/B/o3nKym+sti
	 TcGWNahNKjsTCE6/DzQkEYxSUXDVgj+esOCIK6FodS8h7/3JX+ih5W5JU/PtjX/mm+
	 wnW7VdquUZHd3KA05yBuq/+i/+9AOIHoC5biD/wI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A59F8F804F2;
	Mon, 18 Oct 2021 17:09:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 763F1F804F1; Mon, 18 Oct 2021 17:09:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6511F804EC
 for <alsa-devel@alsa-project.org>; Mon, 18 Oct 2021 17:09:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6511F804EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="VmZbBY16"
Received: by mail-ed1-x529.google.com with SMTP id i20so381490edj.10
 for <alsa-devel@alsa-project.org>; Mon, 18 Oct 2021 08:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O49qZck/FUON9mmr+JH//18PwFgO+f1wHgk975bD51c=;
 b=VmZbBY16aWPLzlt6Br9nXEfTLA7TReLEAISZZuILZVAjpfHxwA/wqbG7YMS0PnU+P+
 R5yokL+gULNQTy1ZC/NaJWcEbcZrib+mz19FBO/7ZrnFazWHdRb0Fl93pEcdcIMEH+XN
 KaQUtFNbmTNXt04IJ1uZD9lXXjG6S+CMve4AQD9MQojhSXFIlG8nTH5Krp65MV4rltCb
 Gl+Ns3D26UMUhNxZxvC+8bLLV/wQyc3G8X/Vc8s1W3f/+/FRKRw10h04sKEsw2S/gM7k
 e0U0wPM8vc6xic4OgZGzM5bkAVe3aOHA5iVcE0DyEliGNofe8pyQs5TjI5nSUxLZX21S
 1ETQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O49qZck/FUON9mmr+JH//18PwFgO+f1wHgk975bD51c=;
 b=st2rUU+PY9xT+YjKdjvZdM+M5buf15P26f6INsmWrh8kJy6h7IU593Y53qvUJBVfbk
 rEH8KWaZ2Ia1SccfoU1EPt242i+fTZqisG9Efi3035dwUwpeMf4J37iv60ll9oDcgzma
 Ulb9oVJMRnzonNyvWP3S1tUrCxqxS8lJwLCX+Mz7PMagDevaYlSEhgh1Kx7eW7SUxdgC
 705vmXMrKJyR2h3Ph8CTvpdiYuWxA/K90IEsiNTtvCEvmH1+85fEgh3WK1B1WClNU5JE
 n7wJg5CK9Ty+MV4cXqaeLT+AV7jzU8T389mM5aaCS4h4tZSXVRDTbEPIgYnhgjrmIX7K
 f8qA==
X-Gm-Message-State: AOAM531+ai1ImLdXGySFKsaKmYw9FiUo2vTJhrEfpQcJQ9C05KHKngVE
 Hzkzs9j6LJR0BEpugXbtHOTK0dxBcK6HIgEbn84=
X-Google-Smtp-Source: ABdhPJxdvKVHSKlpnzcnrhNs4EhvuOzaUStv0eobr4UnlD9/9u/rzOFLMjwPMeYViTbx0hvfpF8GSWLwTEVwjS/2gic=
X-Received: by 2002:a50:e00b:: with SMTP id e11mr45546820edl.359.1634569749974; 
 Mon, 18 Oct 2021 08:09:09 -0700 (PDT)
MIME-Version: 1.0
References: <20211018143324.296961-1-hdegoede@redhat.com>
 <20211018143324.296961-3-hdegoede@redhat.com>
 <CAHp75VeG=RLXY16pMzNQbB9GR7GUsRTZu9Rx9yB0u3hzmhGELA@mail.gmail.com>
In-Reply-To: <CAHp75VeG=RLXY16pMzNQbB9GR7GUsRTZu9Rx9yB0u3hzmhGELA@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 18 Oct 2021 18:08:18 +0300
Message-ID: <CAHp75VdLLapyoXOJSuS7kFZdu4U6r7tmi3g6wAOrFG0ez+Ajew@mail.gmail.com>
Subject: Re: [PATCH 2/3] platform/x86: intel_int0002_vgpio: Use the new
 soc_intel_is_byt/cht helpers
To: Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Gross <markgross@kernel.org>,
 Mark Brown <broonie@kernel.org>, linux-input <linux-input@vger.kernel.org>,
 Platform Driver <platform-driver-x86@vger.kernel.org>,
 Andy Shevchenko <andy@infradead.org>
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

On Mon, Oct 18, 2021 at 6:03 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Mon, Oct 18, 2021 at 5:33 PM Hans de Goede <hdegoede@redhat.com> wrote:

...

> > +       if (!soc_intel_is_byt() && !soc_intel_is_cht())
>
>   if (!(soc_intel_is_byt() || soc_intel_is_cht()))
>
> ?

Self-nak on this. && is slightly better in case we got the first
argument false. Proposed variant will always evaluate both.

-- 
With Best Regards,
Andy Shevchenko
