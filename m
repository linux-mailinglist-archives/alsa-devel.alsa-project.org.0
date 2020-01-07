Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EEADD132133
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jan 2020 09:18:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F99016C0;
	Tue,  7 Jan 2020 09:17:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F99016C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578385119;
	bh=c7rV+AJX5/hR+EikNyzNBwXZAcgm1bzBKqkjqndU14A=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RpufZBcgYtfrD4n991hVkoQnxJc3iChZL12JxbTsLr4HpSlkzz1BM2kmTrzVzv+SZ
	 cGMC54VA2c8RaABUS7vYt9sAlnPm2fPA/+dxAkTzr+EJBi4NMPwCN48p//9+Shbnkp
	 LVA8rnFRY7lCfz/BmRHvCZUsxpdWTviBf9+jkjVU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E946F801EB;
	Tue,  7 Jan 2020 09:16:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D292CF8014A; Tue,  7 Jan 2020 09:16:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 28BF9F8010D
 for <alsa-devel@alsa-project.org>; Tue,  7 Jan 2020 09:16:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28BF9F8010D
Received: from mail-qt1-f182.google.com ([209.85.160.182]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1M5fQq-1in4143md0-0079w4 for <alsa-devel@alsa-project.org>; Tue, 07 Jan
 2020 09:16:49 +0100
Received: by mail-qt1-f182.google.com with SMTP id d18so41969534qtj.10
 for <alsa-devel@alsa-project.org>; Tue, 07 Jan 2020 00:16:48 -0800 (PST)
X-Gm-Message-State: APjAAAV1H788UcAqnBech6p952vM2O8X2rG1VVrsQRQVFGS/5fP7Aqrt
 ypRQ35kvgEKfwU+9ZSq+gXFV55cp8NlSRRhhsBQ=
X-Google-Smtp-Source: APXvYqy5Ck9gkPV52yg24WY0VrQ2y2C1CXBRF6Y6+8OBXLwg0dzkbS2jd5oixwoipa94cQmOYesNS9M2hLIm4uQS2qw=
X-Received: by 2002:ac8:709a:: with SMTP id y26mr78397663qto.304.1578385007686; 
 Tue, 07 Jan 2020 00:16:47 -0800 (PST)
MIME-Version: 1.0
References: <20191210195333.648018-1-arnd@arndb.de>
 <d739240f-aaa6-c310-9c68-16c1a08ce759@nvidia.com>
 <9c9169cc-0da5-f247-c8f7-f6913ca2bfb5@linux.intel.com>
In-Reply-To: <9c9169cc-0da5-f247-c8f7-f6913ca2bfb5@linux.intel.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 7 Jan 2020 09:16:31 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1it2a1CmkkOfVqhLE33jmKWhHEtria+ESoz6uSkcP8_w@mail.gmail.com>
Message-ID: <CAK8P3a1it2a1CmkkOfVqhLE33jmKWhHEtria+ESoz6uSkcP8_w@mail.gmail.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
X-Provags-ID: V03:K1:xJ2MnEfN0wEkTgiqkz/qvdDeq8bNzTtedr6aQCVHWSkitcregod
 x9qTRXMjxw07zrljyij40HtR8OtUMjA9ZWCdmEd0KqYtuigDyA4ZJcWD6agLTpzkup1/KkU
 DV5zIwT9PTezI+JWRtqruYQ7wKlMvG/PdtxaPyXD8sWYdiwK4BSYA3d8UsH7FvjZGwK0nCw
 pkNnTe1TPvPS5N73sysVg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Ra9DsKLlAFU=:7D2oVS9iWSuPRYMfpYvHn3
 Gkeqg0Ia8d71dl/g+rvoXBdyxlyZXaTTGQAnYMslH1IjXKodOWlhwKgLunoARKX7SOzASlN1Y
 AOrQ32DVUSBF426KW5fDEN0DYzlXGzL0LRTacYqlhMwqTujvCBs68qkkXX301zWf/qy/vwdyT
 gXVaayU3OXLb3WBs4DhNp/Z6ZkY2AtyUQK8FkwPu9YP+5cTXhfqZI1gC5Ai6IjprPHFhPR8Go
 FA/cSeLPtHlM6XlIMkTsckWmVgmB9Zsxu8HCZ3DkcULIFqdXew7CLUDwBO0my5N5RKv/CkGYp
 7HFD7Pv4gng9Ylk1QiNRkcQP8P9DPnwiFR+M1EiGHZO1PDuRcCmVNwV7KHjscEYvZEXtjpyOh
 E/PKk5uQL6eKuq476Vaa/OPnX8q3v7qjUH7ZfWsKt55dQbAkjV0nSodpopoVP9WLVk682x+Wx
 0ijB1deQFRJJqkQmeBAs/7yEuLDNU9jjBtaTLlTlp5ZSszd7kU0o1PjgoBHfTHCHnqOFH3JPb
 esmpnYgtVXsTPQ3oX/ojf/anr2f/65rZ9lcILp1eXCSsM8SGiJrYaRusrWWBgPlmupwWRAPm3
 PDGJQzSQPg5ImKdTYlYUj/6Km/CA/SgAPsfeAOt0sNzq+kzUW9L4UZ0+6O1F9tFBnkk2sEirW
 u4T0+yeLatf7kaghdU1OMSQNL0uQNGcwYVNk1xeL8BNaN70yxFTZsZ2Ihyl81pJcCL6SEgOyb
 pAq/HGPXrd0drsB6J/WaRGGRhKTUKIeV6nU+uvr5tuIzuyvYBIw/uGtqiPjwZrXsOjESjVmpd
 bVmmNL78AvWLqQa6WTynqqMmYcWf4fcUxlnZKqv/g6w61CyPbcmQSeYxBNRYKHLortXf6sBAS
 iSaJ0lscYAmXhql/qBsQ==
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jie Yang <yang.jie@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Ben Zhang <benzh@chromium.org>,
 Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 Curtis Malainey <cujomalainey@chromium.org>, Jon Hunter <jonathanh@nvidia.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 KaiChieh Chuang <kaichieh.chuang@mediatek.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: rt5677: add SPI_MASTER dependency
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

On Mon, Jan 6, 2020 at 10:55 PM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
> On 12/11/19 4:59 AM, Jon Hunter wrote:
> >
> > On 10/12/2019 19:52, Arnd Bergmann wrote:
> >> When CONFIG_SPI is disabled, the newly added code for the DSP
> >> firmware loading fails to link:
> >>
> >> ERROR: "rt5677_spi_hotword_detected" [sound/soc/codecs/snd-soc-rt5677.ko] undefined!
> >> ERROR: "rt5677_spi_write" [sound/soc/codecs/snd-soc-rt5677.ko] undefined!
> >
> > Would it be better if the above functions or the functions that call
> > these are conditional on CONFIG_SND_SOC_RT5677_SPI?
>
> they are already conditional, with a fallback provided:
>
> #if IS_ENABLED(CONFIG_SND_SOC_RT5677_SPI)
> int rt5677_spi_read(u32 addr, void *rxbuf, size_t len);

Right, this fixed the problem.

> in theory if SPI is not enabled the fallback static inlines would always
> be selected?
>
> Arnd, if you can share the .config that exposes this problem it'd be nice

I just tried it again and it seems that the issue was already fixed by
commit fb3194413d1e ("ASoC: rt5677: Fix build error without CONFIG_SPI"),
which had not been merged by the time I created my patch as an
alternative workaround.

      Arnd
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
