Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1934E424352
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Oct 2021 18:48:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD232844;
	Wed,  6 Oct 2021 18:48:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD232844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633538933;
	bh=1+vev+FZgo4N9iRP5cVkmE18KVafKcBNUS5QAB2HHsU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ocElF1+zdA1MKC3BLH46K9BhjuiZTJ5BcJh3rXZ2IOWrioLKFaMIQfTHZhrxXEZnR
	 cAULfDAPB75di0aQ4rBHCg/An+5sgtaRI12CF8RVIYBPl40hV+IR4EeK6uA+CuaG6m
	 YrNt0XEhUlQF775eapSfiWm1hvyWy0Fu5RLOCCTE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D8E4F80249;
	Wed,  6 Oct 2021 18:47:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47CA7F80240; Wed,  6 Oct 2021 18:47:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B3CC4F800FE
 for <alsa-devel@alsa-project.org>; Wed,  6 Oct 2021 18:47:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3CC4F800FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="p3qZXdpk"
Received: by mail-ed1-x52f.google.com with SMTP id g10so11874511edj.1
 for <alsa-devel@alsa-project.org>; Wed, 06 Oct 2021 09:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cokz5/aCsU+6IISL087/xdQjeJJNdXltlIJFHh9WDIY=;
 b=p3qZXdpk4WQccufsvK4m6KyFOU8memXMUyYFo+6dgqN/7w5vd1mJOPqpQd5hVoAmJW
 mo3UEMujCeB28FTLtFjvOsRV3CwDnd84QaN9X+KYYIYzJC7HZHmwcdhrs0XVFyZ4I889
 RjDpF+2JfBMiVQcRDfhBkL9b8ephHuCo5Pt2BuCpF0qqNhEXJkn1tjE+wnyRuhAcFAAc
 cb8UinmC2gFZyS5PxVQnHqeK96xv00CP8qjrqswmeTd8Sxr/Qsszw1irQnGHhqXwCOOg
 uVvDcatwfhkeolZvGnzylYwqvBiU5iEIYMtxg+es717pKCmcniqQfzSLxAokJ+Sa+iDz
 gx8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cokz5/aCsU+6IISL087/xdQjeJJNdXltlIJFHh9WDIY=;
 b=0J9yaaxqXrPh5wJbvONqyGzhWjDOea768RAOhthVNalMAGYtkgRs+pkGGnrHz6uwez
 niVLfzETWoiNOuQ6oOcY6EfS07mwSljkwOE802FgFhsgo5OoRJWoMmG4bu1GvC+3tz4H
 u8F2+ByZ/dy0RB4GkYNpnjxEsQUtDHWL5mnaeDIP/rstlACY3iVTok4OBktchP9n5OxT
 khp1IiqU1hLVAri0XyLpy5JvogqbOjWijyVFxNc+39N5yLmnmfHF5WmhiBsKxS8DWgoi
 ovJn7ue+FwVo8xaDBNMRva3pWKONo59qNQx+7xdvWZIl0WKzxJhXZNE4Twhzus8FbY3J
 8zSw==
X-Gm-Message-State: AOAM530cBlD7uPThrDg56pSEcV9g0nrPHHyZzMcjPJDY958OqeXy2qPr
 aNV1YWRd5QzreF+M8NZfMfO/+P62DQdR1nAKgoE=
X-Google-Smtp-Source: ABdhPJw29j4D9bZHuEI9lrPKZesgz4NvAhcdBJSs1TuAV5KtEWAPPnDmALdoHcnOBJ5iVVZTlIoFdWNWh6/0/YAL2lo=
X-Received: by 2002:a17:906:2887:: with SMTP id
 o7mr32800370ejd.425.1633538843226; 
 Wed, 06 Oct 2021 09:47:23 -0700 (PDT)
MIME-Version: 1.0
References: <20211006161805.938950-1-brent.lu@intel.com>
 <20211006161805.938950-4-brent.lu@intel.com>
In-Reply-To: <20211006161805.938950-4-brent.lu@intel.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 6 Oct 2021 19:46:47 +0300
Message-ID: <CAHp75Vd7A4yjA+BN_4PwCNNSyy=JbGTDh7U6FdacRYLYPJaYCQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] ASoC: Intel: sof_rt5682: use id_alt to enumerate
 rt5682s
To: Brent Lu <brent.lu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Jie Yang <yang.jie@linux.intel.com>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Rander Wang <rander.wang@intel.com>, Mac Chiang <mac.chiang@intel.com>,
 Gongjun Song <gongjun.song@intel.com>, Bard Liao <bard.liao@intel.com>,
 Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Vamshi Krishna Gopal <vamshi.krishna.gopal@intel.com>,
 Yong Zhi <yong.zhi@intel.com>, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>,
 Paul Olaru <paul.olaru@oss.nxp.com>, Libin Yang <libin.yang@intel.com>,
 Malik_Hsu <malik_hsu@wistron.corp-partner.google.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Curtis Malainey <cujomalainey@chromium.org>
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

On Wed, Oct 6, 2021 at 7:23 PM Brent Lu <brent.lu@intel.com> wrote:
>
> Use the id_alt field to enumerate rt5682s headphone codec and remove
> redundant entries in tables.

...

> +static struct snd_soc_acpi_codecs adl_rt5682s_hp = {
> +       .num_codecs = 1,
> +       .codecs = {"RTL5682"}

Keeping commas in non-terminator entries is always good to avoid churn
in the future.

> +};

...

> +static struct snd_soc_acpi_codecs rt5682s_hp = {
> +       .num_codecs = 1,
> +       .codecs = {"RTL5682"}

Ditto.

> +};

...

> +static struct snd_soc_acpi_codecs rt5682s_hp = {
> +       .num_codecs = 1,
> +       .codecs = {"RTL5682"}

Ditto.

> +};

...

> +static struct snd_soc_acpi_codecs rt5682s_hp = {
> +       .num_codecs = 1,
> +       .codecs = {"RTL5682"}

Ditto.

> +};

...

> +static struct snd_soc_acpi_codecs rt5682s_hp = {
> +       .num_codecs = 1,
> +       .codecs = {"RTL5682"}

Ditto.

> +};

...and so on.

-- 
With Best Regards,
Andy Shevchenko
