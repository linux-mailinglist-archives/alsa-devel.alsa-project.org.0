Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 534248750B
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Aug 2019 11:16:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE972950;
	Fri,  9 Aug 2019 11:15:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE972950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565342179;
	bh=n/LrDn+6BQaotAhwFpP4VLCH5NfkCpTThT+pAVvhdjc=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N1NcJBsjriUC8nq02rgaZkyaXxzudGIs+AAaoBQJ4nmh1yo51c1H2ROUqPQq4iXNW
	 b5hiKqXqmZCb+0C9cuf9UXcgno6y3j0EjtpP5Z9V/VWRO4FkDBBjc5oRkwen22gUUs
	 tnB3avUDbLFclRvYHBl/r8H868ZAmT4/l6tzxZnk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 19C14F80483;
	Fri,  9 Aug 2019 11:14:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3D0DAF803F3; Fri,  9 Aug 2019 11:14:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B3B3EF800E4
 for <alsa-devel@alsa-project.org>; Fri,  9 Aug 2019 11:14:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3B3EF800E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="GPgG/49H"
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0616121880
 for <alsa-devel@alsa-project.org>; Fri,  9 Aug 2019 09:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565342069;
 bh=ce12zn2fr5sdyjQplYAs2vzfKWzivkl03+BQMEY8JhU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=GPgG/49HURKtx1+18wlgprI2KDoc7nZkxH5Hy7iIj8OwRZIznEGZnJZst/fhql7a+
 +Ryg9w2rC+A+qbsMGmyDpVU/s7gAh5zxZo6G0FrLhUlO64WgK39zRRnNMJmHnCyibi
 bTs0KS4xqzKHDGn7xJl092QafWSJJZaaTReSu8ZQ=
Received: by mail-lf1-f42.google.com with SMTP id x3so15247423lfn.6
 for <alsa-devel@alsa-project.org>; Fri, 09 Aug 2019 02:14:28 -0700 (PDT)
X-Gm-Message-State: APjAAAWVGmMpZguCT+7JkjgbfOPZU1jbHAUMDR5xtYatRDVdXmToX6kM
 3p7jlHyGgaQ1ohm9NfjBV5XuNA/mXQ4aHFEDWbQ=
X-Google-Smtp-Source: APXvYqxf/T7JThDzRfn4cO03+3UGWKgp6A62Ru6VKRuGUq8OKW3bTwm1Sfz2pmfpOSZGwIVAAW7GqP2JOhvx8BT2lvU=
X-Received: by 2002:a19:f007:: with SMTP id p7mr12123864lfc.24.1565342067044; 
 Fri, 09 Aug 2019 02:14:27 -0700 (PDT)
MIME-Version: 1.0
References: <87zhkk6wdy.wl-kuninori.morimoto.gx@renesas.com>
 <87o9106w9p.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87o9106w9p.wl-kuninori.morimoto.gx@renesas.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Fri, 9 Aug 2019 11:14:15 +0200
X-Gmail-Original-Message-ID: <CAJKOXPcS9nXgoPajc=VEANPG_kg9RLoKhhkGsBpwkbhpDub14A@mail.gmail.com>
Message-ID: <CAJKOXPcS9nXgoPajc=VEANPG_kg9RLoKhhkGsBpwkbhpDub14A@mail.gmail.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Heiko Stuebner <heiko@sntech.de>, Maxime Ripard <maxime.ripard@bootlin.com>,
 Jie Yang <yang.jie@linux.intel.com>, Linux-ALSA <alsa-devel@alsa-project.org>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Richard Fontana <rfontana@redhat.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Anders Roxell <anders.roxell@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, YueHaibing <yuehaibing@huawei.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Tzung-Bi Shih <tzungbi@google.com>, Chen-Yu Tsai <wens@csie.org>,
 Georgii Staroselski i <georgii.staroselskii@emlid.com>,
 Danny Milosavljevic <dannym@scratchpost.org>,
 Alexios Zavras <alexios.zavras@intel.com>, Mark Brown <broonie@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Hans de Goede <hdegoede@redhat.com>,
 Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jarkko Nikula <jarkko.nikula@bitmer.com>
Subject: Re: [alsa-devel] [PATCH 08/15] ASoC: samsung: neo1973_wm8753: use
 snd_soc_dai_link_component for aux_dev
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

On Thu, 8 Aug 2019 at 07:54, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> We can use snd_soc_dai_link_component to specify aux_dev.
> Let's use it.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  sound/soc/samsung/neo1973_wm8753.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
