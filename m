Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F91567295
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Jul 2022 17:28:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 011CC16BA;
	Tue,  5 Jul 2022 17:27:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 011CC16BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657034922;
	bh=UadrQAatgHGb4mRN9wWxaAephmCW0dwzAvV4beTaekU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uyFOCfrFDNTUFD6lCQ2hqFEBSoKJQumGBHV6oLf7v8E/FmhG/VOH6/GL7wljeNGJD
	 StSWeBrX+tdnlgSJa7+dlhB9srfAFuP8kE8BI5UiEx3xIjQKqNgKLLWPZEtCyj5YIh
	 zuJ6L7YeliwVhJcDcptXhwaEz7ODEQe8bWgJty/c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 849C6F80104;
	Tue,  5 Jul 2022 17:27:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3DE7F80153; Tue,  5 Jul 2022 17:27:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com
 [IPv6:2607:f8b0:4864:20::112e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 79C4FF8015B;
 Tue,  5 Jul 2022 17:27:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79C4FF8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="UVo9GPCO"
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-3137316bb69so112263527b3.10; 
 Tue, 05 Jul 2022 08:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5tmiljg3s19ryvEGAW5ii/Nv2+isUFfuDwQcZYBx++w=;
 b=UVo9GPCOUtVCj/emac2wh5qc6SFskMVJi12e4DvMW+/0nQSJQgXdGJ9QX1t7S1svZp
 Kaoz4HbbwMzKV5JqV9Gg5GQHmc9l9PSTSCDpjkUNdS85DLvthUrE8iuInduPTmckvP3u
 +5ioDYcvu5azoRN2PyclToOV3GgPEIqxeLoFP5MYPKhzQ6J0DRAuc2hIAV/YAwlabXbo
 fdlzFegYTwbLKVuY2ZrUd4A92aBCRvi9K/pMh+aYfXMTQfy88UAHug8Xt1dPes1atiNa
 LjdHXw3j/mGY/a0Pml9OCSGX3cavSv/RAdmqXycuGZXjN9z2uy4NhAuTMn3AdAWghVgm
 ozhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5tmiljg3s19ryvEGAW5ii/Nv2+isUFfuDwQcZYBx++w=;
 b=DC2rwPE1VBNoQssqDgzB7r9bSQNVVpdQ/L79aKu7TJmalehziqB/j3aK55m/KsFgd2
 PjUYSnwSYT9AJ352nY0H9jUISSaGbCYUv1mN05eM8XGYBcgItUFMGCC6xft4UYW2l4hR
 eFvmPk6sPHwTXUAfhDiMyrAsk+ucDGpaWNvjWq/hEHFBDYPcphlk2XdnjvI0pwVmHxAA
 yS6pLyAyY9Fg6dDPEpQ1016M1EzVmXbJQ6sp6QuWMTL+f9wc5POATjKGeZ2LQqbHD2lA
 njL6CIAUOGEhiqdWvivL1DAOCAKWGC997n4MiIpBjZB/UEn3wszIa7fg91lb3AFHHdba
 gheg==
X-Gm-Message-State: AJIora8oVLF41lZ5WvNAfRq1ZKE0x0RrAqedzhO+jT91ARG7OyNaxyRL
 V0x/5bDka2nuqQ8qL+rT6m4qaBLgBgK+RO+/g64=
X-Google-Smtp-Source: AGRyM1s29r7HkV/XRQicyYI2gCQx7K2oP+G2em7n4x3kcXxrK/M219ChC74q0E7E22f8P7HAie6Q/9uQqH23jpxqxa8=
X-Received: by 2002:a81:72c4:0:b0:31c:b309:c4e8 with SMTP id
 n187-20020a8172c4000000b0031cb309c4e8mr8101598ywc.520.1657034851419; Tue, 05
 Jul 2022 08:27:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220703143533.62173-1-andriy.shevchenko@linux.intel.com>
 <38cf149a-6238-241c-8ddd-4e4d10ca1f73@linux.intel.com>
In-Reply-To: <38cf149a-6238-241c-8ddd-4e4d10ca1f73@linux.intel.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 5 Jul 2022 17:26:55 +0200
Message-ID: <CAHp75VcDfGsoyTSp7US2Fmzd=+1J8xbpcAuP7tXOC=C+D9+QSA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] ASoC: SOF: Intel: bdw: remove duplicating driver
 data retrieval
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Daniel Baluta <daniel.baluta@nxp.com>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 sound-open-firmware@alsa-project.org
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

On Tue, Jul 5, 2022 at 5:02 PM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
> On 7/3/22 09:35, Andy Shevchenko wrote:

...

> Thanks Andy, we have the same code pattern in sound/soc/sof/intel/byt.c,
> can we change it as part of the series to keep the two files aligned?

Sure. I was looking for the ID of WPT SPI (I2S) controller and that's
how I found these two.


-- 
With Best Regards,
Andy Shevchenko
