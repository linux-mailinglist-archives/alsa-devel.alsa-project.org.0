Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96AF827CE9C
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Sep 2020 15:10:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86C201868;
	Tue, 29 Sep 2020 15:09:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86C201868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601385007;
	bh=syOg1NWoCN9mEAAwbB/ZVANB1Wmji7FmKtTm4nZqlx0=;
	h=Subject:To:From:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DqwNBfgifvMa8Js+l9vAuxTwKrhNSRxRmtcMOXIKcB4u6lyk6yrP5p30rxOwG/XHd
	 TrmFaBIPYpr5HDO1dT1N0YS6YMxyvV9mnQH9dconXkjQye5M7AMzsyf07afNgUynqw
	 bBxwiZgRZiaWx+Wukr+9M3ttl10Piql/JKONuWbs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9050F800AB;
	Tue, 29 Sep 2020 15:08:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5D5BFF801F5; Tue, 29 Sep 2020 15:08:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 37933F800AB
 for <alsa-devel@alsa-project.org>; Tue, 29 Sep 2020 15:08:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37933F800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="XuQXXLYB"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200929130815euoutp01e4e345473e7ca36a4a443c3ac52d56be~5QxPgvxIb0275802758euoutp01f
 for <alsa-devel@alsa-project.org>; Tue, 29 Sep 2020 13:08:15 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200929130815euoutp01e4e345473e7ca36a4a443c3ac52d56be~5QxPgvxIb0275802758euoutp01f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1601384895;
 bh=gj/TzXzuP6hejQ6F+uBZMNLkcOdRWW/mBYTNZQmbO1Q=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=XuQXXLYBgUgH+QGVRFF1G9qoi+r19uX/cCpjkwZM1d146pYDAMaru30t3/M1DUjlB
 1TEeZhivVwbJ0oTjq1CBIikVN3JUZ94CxuFKYKdVg0JGN6CYbhjAoGDrvXncvR9/7o
 ix16WvDl59s8RRkbvKo0Y6AYSSSaDTes3HkTsIkY=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200929130814eucas1p2be586a7c08fc858fd2b1e066227443a5~5QxPQbTEk2712127121eucas1p2F;
 Tue, 29 Sep 2020 13:08:14 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 62.61.06456.EB1337F5; Tue, 29
 Sep 2020 14:08:14 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200929130814eucas1p1c09e7e1fe2d808d9bd41718cadf33754~5QxO4S68z0597905979eucas1p19;
 Tue, 29 Sep 2020 13:08:14 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200929130814eusmtrp121da2ad0f975cdfe3b189adf7128a7ec~5QxO3q50I2024120241eusmtrp1b;
 Tue, 29 Sep 2020 13:08:14 +0000 (GMT)
X-AuditID: cbfec7f2-7efff70000001938-66-5f7331becb71
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 4B.DF.06017.EB1337F5; Tue, 29
 Sep 2020 14:08:14 +0100 (BST)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200929130814eusmtip16c32df3373b84fb26ac70d3d1edcbe1a~5QxOdGhUd0578005780eusmtip1L;
 Tue, 29 Sep 2020 13:08:13 +0000 (GMT)
Subject: Re: [PATCH 5/7] ASoC: soc-pcm: add soc_pcm_clean() and call it from
 soc_pcm_open/close()
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown
 <broonie@kernel.org>
From: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <1fa68abd-a86c-7a29-6c28-9ecde75ab4c6@samsung.com>
Date: Tue, 29 Sep 2020 15:08:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <87ft72bwn4.wl-kuninori.morimoto.gx@renesas.com>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKKsWRmVeSWpSXmKPExsWy7djP87r7DIvjDX4eNrG4cvEQk8XUh0/Y
 LM6f38Bu8erwLkaLGef3MVkcftPO6sDmseFzE5vHplWdbB7fzkxk8ejbsorR4/MmuQDWKC6b
 lNSczLLUIn27BK6MvilTmAtOilZsPXSWvYFxkmAXIyeHhICJxLkpB1i6GLk4hARWMEr8/NHF
 CuF8YZTYve0QI4TzmVHiW8MqoDIOsJZf5yxBuoUEljNK7HxcA1HznlFi781+VpCEsECyxPHv
 HUwg9SIC0RLXT9uB1DAL7GWUeNvUzQhSwyZgKNH1tosNxOYVsJPY1LELLM4ioCrx4OsWsDmi
 AnESx049YoGoEZQ4OfMJmM0pYCsx/f4ddhCbWUBeonnrbGYIW1zi1pP5TCDLJATWsUv03/rA
 CPGni8SuB30sELawxKvjW9ghbBmJ05N7WCAamhklHp5byw7h9DBKXG6aAdVtLXHn3C82kHeY
 BTQl1u/Shwg7SnQs2wMNFT6JG28FIY7gk5i0bTozRJhXoqNNCKJaTWLW8XVwaw9euMQ8gVFp
 FpLXZiF5ZxaSd2Yh7F3AyLKKUTy1tDg3PbXYMC+1XK84Mbe4NC9dLzk/dxMjMPGc/nf80w7G
 r5eSDjEKcDAq8fByiBXHC7EmlhVX5h5ilOBgVhLhdTp7Ok6INyWxsiq1KD++qDQntfgQozQH
 i5I4r/Gil7FCAumJJanZqakFqUUwWSYOTqkGxr26bc2/3ywV/39df4bA+z/Wf7n8xQyKtyuU
 8b3atGDFGmPbCs+VvVKLiwu+WtY+uNt+QkXJK/JKak5ZR3OZ2rcXTnVJu+796p/5tuy716+X
 V1++r18t9uyevOKx20l1vncYIut6KteE5NUIsM6Qin+59eKHw73zjpdcEUg+VKWo877nFusN
 LSWW4oxEQy3mouJEALuyH544AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrOIsWRmVeSWpSXmKPExsVy+t/xu7r7DIvjDWZsl7S4cvEQk8XUh0/Y
 LM6f38Bu8erwLkaLGef3MVkcftPO6sDmseFzE5vHplWdbB7fzkxk8ejbsorR4/MmuQDWKD2b
 ovzSklSFjPziElulaEMLIz1DSws9IxNLPUNj81grI1MlfTublNSczLLUIn27BL2MvilTmAtO
 ilZsPXSWvYFxkmAXIweHhICJxK9zll2MnBxCAksZJV7OTASxJQRkJE5Oa2CFsIUl/lzrYuti
 5AKqecsocenTLXaQhLBAssTx7x1MILaIQLTE5GX/wYqYBfYzSlztncwGMTVfYkXfR0YQm03A
 UKLrbRdYnFfATmJTxy6wOIuAqsSDr1vAtokKxEmc6XkBVSMocXLmExYQm1PAVmL6/Ttgi5kF
 zCTmbX7IDGHLSzRvnQ1li0vcejKfaQKj0Cwk7bOQtMxC0jILScsCRpZVjCKppcW56bnFRnrF
 ibnFpXnpesn5uZsYgZG27djPLTsYu94FH2IU4GBU4uFNkCiOF2JNLCuuzD3EKMHBrCTC63T2
 dJwQb0piZVVqUX58UWlOavEhRlOg5yYyS4km5wOTQF5JvKGpobmFpaG5sbmxmYWSOG+HwMEY
 IYH0xJLU7NTUgtQimD4mDk6pBkbhrznPVdNOa5vX36ysWnvVNqH5ioXLI/cHzm1nYt6J37eb
 tEJiweeD59bUeW7oiCwzfv1mLcv7y+9XGVqrHe3SnHVhTdyCrF7XBD4fT473f6favQmaM/vT
 gqsn7ObrazqJ7nEydmU/GpDqmCpkc0/4+DUtuYyiuncbU/8z8ju4zdL/eeVt6wslluKMREMt
 5qLiRADdJIi9ygIAAA==
X-CMS-MailID: 20200929130814eucas1p1c09e7e1fe2d808d9bd41718cadf33754
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200929130814eucas1p1c09e7e1fe2d808d9bd41718cadf33754
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200929130814eucas1p1c09e7e1fe2d808d9bd41718cadf33754
References: <87mu1abwp2.wl-kuninori.morimoto.gx@renesas.com>
 <87ft72bwn4.wl-kuninori.morimoto.gx@renesas.com>
 <CGME20200929130814eucas1p1c09e7e1fe2d808d9bd41718cadf33754@eucas1p1.samsung.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>
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

Hi

On 28.09.2020 02:01, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> soc_pcm_open() does rollback when failed (A),
> but, it is almost same as soc_pcm_close().
>
> 	static int soc_pcm_open(xxx)
> 	{
> 		...
> 		if (ret < 0)
> 			goto xxx_err;
> 		...
> 		return 0;
>
>   ^	config_err:
>   |		...
>   |	rtd_startup_err:
> (A)		...
>   |	component_err:
>   |		...
>   v		return ret;
> 	}
>
> The difference is
> soc_pcm_close() is for all dai/component/substream,
> rollback        is for succeeded part only.
>
> This kind of duplicated code can be a hotbed of bugs,
> thus, we want to share soc_pcm_close() and rollback.
>
> Now, soc_pcm_open/close() are handling
> 	1) snd_soc_dai_startup/shutdown()
> 	2) snd_soc_link_startup/shutdown()
> 	3) snd_soc_component_module_get/put()
> 	4) snd_soc_component_open/close()
> 	5) pm_runtime_put/get()
>
> Now, 1) to 5) are handled.
> This patch adds new soc_pcm_clean() and call it from
> soc_pcm_open() as rollback, and from soc_pcm_close() as
> normal close handler.
>
> One note here is that it don't need to call snd_soc_runtime_deactivate()
> when rollback case, because it will be called without
> snd_soc_runtime_activate().
> It also don't need to call snd_soc_dapm_stream_stop() when rollback case.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

This patch landed in linux next-20200929 as commit 140a4532cdb8 ("ASoC: 
soc-pcm: add soc_pcm_clean() and call it from soc_pcm_open/close()"). 
Sadly it causes a regression in ALSA operation on my various test 
boards: Exynos4412 based Trats2, Exynos5410 based Odroid XU, Exynos5250 
Snow Chromebook and other. The first app, which tries to open ALSA 
device fails. Then, on the second try, it work.

Here is a log from Odroid XU:

[    3.775032] max98090 1-0010: MAX98090 REVID=0x43
[    3.781958] max98090 1-0010: use default 2.8v micbias
[    3.812813] ALSA device list:
[    3.814448]   #0: Odroid-XU

# speaker-test -l1

speaker-test 1.1.3

Playback device is default
Stream parameters are 48000Hz, S16_LE, 1 channels
Using 16 octaves of pink noise
Playback open error: -22,Invalid argument
# speaker-test -l1

speaker-test 1.1.3

Playback device is default
Stream parameters are 48000Hz, S16_LE, 1 channels
Using 16 octaves of pink noise
Rate set to 48000Hz (requested 48000Hz)
Buffer size range from 128 to 131072
Period size range from 64 to 65536
Using max buffer size 131072
Periods = 4
was set period_size = 32768
was set buffer_size = 131072
  0 - Front Left
Time per period = 0.029512
#

 > ...

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

