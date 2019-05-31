Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4E430F32
	for <lists+alsa-devel@lfdr.de>; Fri, 31 May 2019 15:46:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AED9E86E;
	Fri, 31 May 2019 15:45:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AED9E86E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559310368;
	bh=OnHFszqYbsRH8OgvkV+G79fN2akVcxh8lldG87JhRiU=;
	h=To:From:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VyLy2mRkjCWcswfv3EV3uaBlqZQRWvInHXpkSwhW2dfhXl33kxCeNXITXOdUI91R7
	 xlhi8g6NotVcrGEyuNrSE6IURwwETlvnHwfIp0+jBYUKXGazbcylUfd/1rBIzxSTr/
	 TwxrmIjODIrDtiU6eRv+Ud5OFTdHr0WtqjSLaNdA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0282DF896F2;
	Fri, 31 May 2019 15:44:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C38FBF896E5; Fri, 31 May 2019 15:44:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,T_DKIMWL_WL_HIGH autolearn=disabled
 version=3.4.0
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DDD93F8072E
 for <alsa-devel@alsa-project.org>; Fri, 31 May 2019 15:44:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DDD93F8072E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="E57Z3kT2"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190531134414euoutp01c874d8ae096c7e9a34d13948479b1757~jyGo-lQqy0723307233euoutp01m
 for <alsa-devel@alsa-project.org>; Fri, 31 May 2019 13:44:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190531134414euoutp01c874d8ae096c7e9a34d13948479b1757~jyGo-lQqy0723307233euoutp01m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1559310254;
 bh=d/ofE7C+qb8FXizk062nYULRDGW//8GcqaiVTR+gKZw=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=E57Z3kT2rYwoWK30UPreoCUjrg8L9S2mhxArystGx+u5gkeN+W6vLWsRQLjGSkpBn
 crcUem3I1iohG/nNgOfbBhvkrzDMMoIFLbqEU47vrsI5UScAXTR5qRGEs6c8PFN/Xm
 EtHqP8F6z6X0ryx8bY/R9QXlq+bTQPppiQQui0NY=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190531134414eucas1p28d9b8f040c87e1027ba8c5968784dd36~jyGoplmZM0356303563eucas1p2d;
 Fri, 31 May 2019 13:44:14 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 45.1D.04377.DAF21FC5; Fri, 31
 May 2019 14:44:14 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190531134413eucas1p2266b217f5177645a9db3edc7c699f7f2~jyGn8sr8o0456304563eucas1p2V;
 Fri, 31 May 2019 13:44:13 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190531134413eusmtrp14330820d7eac5b6af688fc8ce893b16c~jyGntG3ml1543915439eusmtrp18;
 Fri, 31 May 2019 13:44:13 +0000 (GMT)
X-AuditID: cbfec7f4-113ff70000001119-bf-5cf12fad4869
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 23.77.04140.DAF21FC5; Fri, 31
 May 2019 14:44:13 +0100 (BST)
Received: from [106.120.51.75] (unknown [106.120.51.75]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190531134412eusmtip16ad00df3fc610e1c7d48d56e6e278333~jyGnSoau91082410824eusmtip1H;
 Fri, 31 May 2019 13:44:12 +0000 (GMT)
To: Tzung-Bi Shih <tzungbi@google.com>, Krzysztof Kozlowski <krzk@kernel.org>
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <f0e6753d-6eb4-b56e-d4f4-0d483a685b41@samsung.com>
Date: Fri, 31 May 2019 15:44:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CA+Px+wXs1u9VjkzDerb-BVPQRLZNMnw8Rh5prkb+0mHAggwWgg@mail.gmail.com>
Content-Language: en-GB
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0hTYRjHfXcuOxtOXo+VD1MKRhEVaYofDhRaVLC+WEJQlKFHPak4zTY1
 bV9ETea1oXQbyyZpl5UpS7zMMp3kJSkvaQQpViiKa5FsGmJazlPkt9//ef7P+zx/eBmCfUkp
 mdSMLEGbwWtUtJxs6V1+t/9Z6ELsgUIj4sZGHBLuxpdpmhsaapJyS2MGCffebqa520OdEq7E
 fp3imn42IO7FyLz0sEzd5C6g1e2mSanaYstW26wltLrT9YBWNzaPk2q3bfsp6Tn5oSRBk5oj
 aEMj4+Upb+1zROYT39wV51tJPjLJS5GMARwBq19nqFIkZ1j8CEFbj1UiCg+CnoFiUhRuBHNV
 NdJ/I/WLXYSXWfwQwfx9jWhyIZj2TKxPMEwAjofW4VNezxZ8Enqbawmvh8DVEii7OU95GzQO
 g4rXlcjLChwJdWXdpJdJvAvurjg36lvxWfC02/56/GHgzvSGR4ZjwDlVtFEncCAUeB5TIu+A
 Vpd5YxngUSmYJm7S4tXHwDJZQYocAPN9zX/TBMNgdTkpDhQiKO/4JBWFEcFUnwWJroPQ0zdC
 eaMReA802kO9CPgI9I9Gi+gHH13+4g1+UNVyixDLCjAUs+IbO2HFeksishLKpn+TRqQybUpm
 2pTGtCmN6f9aCyKtKFDI1qUnC7rwDOFKiI5P12VnJIckXkq3ofVPNbjW52lD9l8JDoQZpPJV
 GNmFWJbic3R56Q4EDKHaolid+xHLKpL4vKuC9lKcNlsj6BwoiCFVgQq9z+fzLE7ms4Q0QcgU
 tP+6EkamzEdse9Sr5XG+Q4P0ZmGpttj84cLpiOdG55sAul95OfrY7vprcx2z75xCpUEZVJZf
 5Je3787PAw0xNZl11jNai6LJp7myc99xLqTrizWqeDVHH7xtIW7QQUWsffNEULPu7pDvphOL
 4Yn3Lsbr7faDT10zw7kX02rMR2sSDCu8plVF6lL4sL2EVsf/Aced1NlQAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIIsWRmVeSWpSXmKPExsVy+t/xu7pr9T/GGMx8wGdx5eIhJoupD5+w
 WZw/v4Hd4tuVDiaLy7vmsFnMOL+PyaJzVz+rxYbvaxkt9lx8xe7A6bHhcxObx85Zd9k9Fmwq
 9di0qpPNY9/bZWwe67dcZfH4vEkugD1Kz6Yov7QkVSEjv7jEVina0MJIz9DSQs/IxFLP0Ng8
 1srIVEnfziYlNSezLLVI3y5BL+PsrhfMBat5Kn6/PsvUwDiLq4uRk0NCwERi6dcDzF2MXBxC
 AksZJQ6eW8rWxcgBlJCSmN+iBFEjLPHnWhcbRM1rRonOa79ZQRLCAgkSL3ueM4PYIgK+EvMf
 rgcrYhaYzCRxcv8VZriOTf/esINUsQkYSvQe7WMEsXkF7CSWdB9kAbFZBFQl5v5+DRYXFYiQ
 mL2rgQWiRlDi5MwnYDanQKDE6/stYDXMAuoSf+ZdYoawxSWavqxkhbDlJba/ncM8gVFoFpL2
 WUhaZiFpmYWkZQEjyypGkdTS4tz03GIjveLE3OLSvHS95PzcTYzA6Nx27OeWHYxd74IPMQpw
 MCrx8E4Q+hgjxJpYVlyZe4hRgoNZSYT374sPMUK8KYmVValF+fFFpTmpxYcYTYGem8gsJZqc
 D0wceSXxhqaG5haWhubG5sZmFkrivB0CB2OEBNITS1KzU1MLUotg+pg4OKUaGO23ezeZHeOs
 O7vd4UZm8BLeFKMy7rsPt04/Zbt81/z/7QF75NUuZv77tkZr1c6wXUoHrUV7xNY83c7y50ha
 9eXbSXM+nilN4qwWEw9do/zx+XMmv4l7eQzk1r6TjikX1Uxhnnqd5edHNvlg81WRug4zq6df
 WGL4TrLM793z8x9PKT016np/21GJpTgj0VCLuag4EQB5L3YL5AIAAA==
X-CMS-MailID: 20190531134413eucas1p2266b217f5177645a9db3edc7c699f7f2
X-Msg-Generator: CA
X-RootMTR: 20190531102017epcas1p3b5522b9a133bf50659d9d306ed9d6d52
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190531102017epcas1p3b5522b9a133bf50659d9d306ed9d6d52
References: <CAJKOXPfREyt3P2H8bL9=6+EQ1S3Ja7Urkhy1x7sCHaaubMqV1Q@mail.gmail.com>
 <CGME20190531102017epcas1p3b5522b9a133bf50659d9d306ed9d6d52@epcas1p3.samsung.com>
 <CA+Px+wXs1u9VjkzDerb-BVPQRLZNMnw8Rh5prkb+0mHAggwWgg@mail.gmail.com>
Cc: alsa-devel@alsa-project.org,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [BISECT] No audio after "ASoC: core: use component
 driver name as component name"
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

On 5/31/19 12:20, Tzung-Bi Shih wrote:
> On Fri, May 31, 2019 at 5:27 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>> The problem might be in component name. The driver->name and
>> fmt_single_name(dev, &component->id) are:
>> snd_dmaengine_pcm != 3830000.i2s
>> snd_dmaengine_pcm != 3830000.i2s-sec
>> samsung-i2s != 3830000.i2s
>>
>> This commit should not go in without fixing the users of old
>> behavior... I could adjust the platform names for primary and
>> secondary links... but now it looks like two components will have the
>> same name.
>
> That is because the two component drivers used the same name in
> somehow.  But yes, we should not have the commit without fixing
> potential errors for users depend on old behavior.

There are 2 platform devices (3830000.i2s, 3830000.i2s-sec), for each
a platform/DMA component is created. For 3830000.i2s there is also
a component with 2 CPU DAIs registered. 

If we derive the platform/DMA component name from the component's driver
name then we end up with non unique Platform component names 
(snd_dmaengine_pcm) and subsequently we fail to assign Platform component 
to DAI links.

Here is list of components before the patch:

# cat /sys/kernel/debug/asoc/components 
3830000.i2s
3830000.i2s-sec
3830000.i2s
hdmi-audio-codec.3.auto
max98090.5-0010
snd-soc-dummy
snd-soc-dummy

And after the patch:

root@target:~# cat /sys/kernel/debug/asoc/components 
samsung-i2s
snd_dmaengine_pcm
snd_dmaengine_pcm
hdmi-audio-codec.3.auto
max98090.5-0010
snd-soc-dummy
snd-soc-dummy
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
