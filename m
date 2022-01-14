Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 978AE48E4AC
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jan 2022 08:08:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 169A61AF9;
	Fri, 14 Jan 2022 08:07:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 169A61AF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642144086;
	bh=9xwhjGsWiynFFCNsOZqQP8Hl7vkrNYxdnyXVdfHnJ9Y=;
	h=Date:Subject:To:From:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qjLiNaJ+JoDvhQcjfVW/ZCoDETbCMZZ7imQzI3KcN/kbB3Y1/QowMfLsQMaACaUCk
	 lrSnxhdumVvNGHo8d+gbkRJtJ50DWPXIyG8SP4osy5f/zd4OfRyBnqgDiuWR0dvhWD
	 cj5sEl55iCvBtpXZsmLpOKSueynSGQ6jAzQcT8DE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 83899F80310;
	Fri, 14 Jan 2022 08:06:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CCCA9F8030F; Fri, 14 Jan 2022 08:06:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0CCBCF800CE
 for <alsa-devel@alsa-project.org>; Fri, 14 Jan 2022 08:06:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0CCBCF800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="rgdLAbvb"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20220114070648euoutp012bbb51682aace51fb0ef3215ab8a2681~KEUZyfFmM2405524055euoutp01Z
 for <alsa-devel@alsa-project.org>; Fri, 14 Jan 2022 07:06:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20220114070648euoutp012bbb51682aace51fb0ef3215ab8a2681~KEUZyfFmM2405524055euoutp01Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1642144008;
 bh=ewCI5h/ajasR7mRldCM/e3fKkrBoLGFNmAibdGuHqU8=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=rgdLAbvbKCn5Bzgjg1Dgt6BJjywAWPYdh0NaPglCOOcYQX+teWKMPzzhAW6iTgjJX
 TjPHLgU3pZ7cmLkhFVaucrHZ588g6RX+1NxdgwU4WGM8wIqbTJowtZTiTwpk73pDpF
 s6UiE81M1BR3dE6JyBnSi/11Yf/XVPWptjYND1GQ=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20220114070648eucas1p21158b9a1420dbee8a0845c41d293f44c~KEUZqb5ad2745927459eucas1p2G;
 Fri, 14 Jan 2022 07:06:48 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 4A.7B.10009.80121E16; Fri, 14
 Jan 2022 07:06:48 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20220114070647eucas1p1feb348976b8a8541e3cb1030ce66d428~KEUZVaszz1346413464eucas1p1l;
 Fri, 14 Jan 2022 07:06:47 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20220114070647eusmtrp271202965cb6e3db91a49e39f029c6767~KEUZUsN4f0305803058eusmtrp2r;
 Fri, 14 Jan 2022 07:06:47 +0000 (GMT)
X-AuditID: cbfec7f2-e7fff70000002719-3d-61e121080de7
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 2B.73.09404.70121E16; Fri, 14
 Jan 2022 07:06:47 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20220114070647eusmtip2dfb7bc513039810ac8eb7ce7531ceeb6~KEUY4jIhg2096120961eusmtip2V;
 Fri, 14 Jan 2022 07:06:47 +0000 (GMT)
Message-ID: <d9483ad5-e0cd-0743-54d9-08afc24ab5ca@samsung.com>
Date: Fri, 14 Jan 2022 08:06:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
Subject: Re: [PATCH] ASoC: soc-pcm: Fix DPCM lockdep warning due to nested
 stream locks
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <s5hv8yn62eb.wl-tiwai@suse.de>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01SaUwTYRDN1y3bbZOaj0LtKEalQQ0gVIxCvRFJ0x8o4j8lHouulFgQu1Tx
 ipUajwYFRGitqCSeARWCgrdBTKwFRQ5NiApS05AArYoYhVpRl0Xl35t57+XNTIYiZMUBk6mM
 rBzGkEXrlaREWPd0uDmKCnXRc4o8lPpVa4NAXeJyk2qPwypQ+371CNS9Nz2C+ABt9WAeqa2p
 OEZqzzlTtJ8evSa1N5v2rg5YJ1m8hdFn7GQMqqWbJLrSPJcouxByfxwsIEzoWLAFURTgefCt
 M9mCJJQMX0VQ3XkJWZD4T/EVwVunhicGEfg7j4s4gjN8aDxI8sQVBD0/P48VAwiaP/mEnEqK
 l0Klp5/gsBDPgCOlVsT3A8F52j2qkeM0cHXz+iC8FsyOYgGHCayAN+7zozgYTwdPXxfiAgh8
 GUHtgw8kR5A4BixeyygW40iwuT6KePM0MNeeITgD4BYKPtaYED93IjTa3ozhIOhz3BrbZwr8
 usulcQYzAlfzdRFf5CNoz7ONORbBu2YfyZ2MwOFQdU/Ft5fDN0djAH/JCdDhDeSHmAAn66wE
 35bC0cMyXj0T7I4b/2Ift7QRhUhpH3cX+7j97ePWsf/PLUfCCqRgjGxmOsPGZDG7olk6kzVm
 pUdv3p5Zg/78TdOI48sddLZvILoBCSjUgIAilMHSAsN7WibdQu/ewxi2bzQY9QzbgEIooVIh
 3ZxRTctwOp3DbGOYbMbwlxVQ4skmAc494ZaPZOzoeOePPPfq4cq0ktx0o17Zcr84xTQ8XN2u
 itrR35Z0+mx27s75mDXv2u3tCTevStaXTaKD5IgKa6y11g3JE79KkjRzhwq8Ol0Zbfr+JM7/
 tr6ytSv22WDVSKjoyH6POCF5wdGXKyomXnxkK+9Fc3wKlU3jjIiqGhrQsO237co1ifX6WRv8
 RuOy9WL/FLGhq+ZhVWzTfdXI3O5p3q1F+0Lwkh8Jp0QzLX2PXzyrFF1VJcw+0IoX6kPUJlnc
 U90hJy7ztWTb9kSvbioB8vOMfIVm66xNh19HpcXFp3ZfmNqrrE9ti10cVnAtLa/ffcghn13+
 fH7y3gilkNXRMRGEgaV/AxYor1KmAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrCIsWRmVeSWpSXmKPExsVy+t/xe7rsig8TDXb36VtcuXiIyWLqwyds
 Fm+OT2ey+PX/GZPFy81vmBxYPTZ8bmLz2LSqk81j3slAj/f7rrJ5bD5dHcAapWdTlF9akqqQ
 kV9cYqsUbWhhpGdoaaFnZGKpZ2hsHmtlZKqkb2eTkpqTWZZapG+XoJcxrekhe8EEiYrfjf3M
 DYydIl2MnBwSAiYSj041snUxcnEICSxllLh64i8rREJG4uS0BihbWOLPtS42EFtI4D2jxKvL
 8iA2r4CdxOo3r5lBbBYBVYn2adMZIeKCEidnPmHpYuTgEBVIkviwxQ8kLCwQKdF8fDITiM0s
 IC5x68l8MFtEQEHizat7jCA3MAssY5R49n4aM8SuO4wSuzeGgthsAoYSXW8hbuAU0JaY8fAd
 O8QgM4murV2MELa8RPPW2cwTGIVmITljFpJ9s5C0zELSsoCRZRWjSGppcW56brGRXnFibnFp
 Xrpecn7uJkZgdG079nPLDsaVrz7qHWJk4mA8xCjBwawkwttfdD9RiDclsbIqtSg/vqg0J7X4
 EKMpMCwmMkuJJucD4zuvJN7QzMDU0MTM0sDU0sxYSZzXs6AjUUggPbEkNTs1tSC1CKaPiYNT
 qoGpZ0Pkp6zG04FqAWYL19fMnrXIOz79W5fB35nb7Yy82wNDf909N+maxsIY699TjLIulzwQ
 j8naPLnqivnPALudCnu3HNljJtPGE7no+gk2BuMuvWbT5QHur1QkJt6p0ala8uusUVXF9cYu
 g22rb/z1OvnZ/U/BC6cMdb5/C6bpxyt49qzMmqlwRv/DWmW/bq5njofV87s9jyQ7rPv/WTph
 p923V096mRLM373r1ujQYp/ixK79efbHvYf46nuzG0KV9HgeZEzq7KoV+NWtxcap+CiZ815J
 Bld9yMdu7XW8HToOPg9+CxyX7r1+c/rkUx6dwkVcR9sNj31/cP+Ieeih7/tb/0z9Z19q07dm
 ykklluKMREMt5qLiRAD/dJebNwMAAA==
X-CMS-MailID: 20220114070647eucas1p1feb348976b8a8541e3cb1030ce66d428
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20220113141905eucas1p1efcaf3ad1d07e784635586bb5d38c4d6
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220113141905eucas1p1efcaf3ad1d07e784635586bb5d38c4d6
References: <CGME20220113141905eucas1p1efcaf3ad1d07e784635586bb5d38c4d6@eucas1p1.samsung.com>
 <20220113141858.10904-1-tiwai@suse.de>
 <91d7a1df-9e90-7c07-f15c-7ca1dad0b4ef@samsung.com>
 <s5hv8yn62eb.wl-tiwai@suse.de>
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

On 13.01.2022 17:12, Takashi Iwai wrote:
> On Thu, 13 Jan 2022 15:59:31 +0100, Marek Szyprowski wrote:
>> On 13.01.2022 15:18, Takashi Iwai wrote:
>>> The recent change for DPCM locking caused spurious lockdep warnings.
>>> Actually the warnings are false-positive, as those are triggered due
>>> to the nested stream locks for FE and BE.  Since both locks belong to
>>> the same lock class, lockdep sees it as if a deadlock.
>>>
>>> For fixing this, we need take PCM stream locks for BE with the nested
>>> lock primitives.  Since currently snd_pcm_stream_lock*() helper
>>> assumes only the top-level single locking, a new helper function
>>> snd_pcm_stream_lock_irqsave_nested() is defined for a single-depth
>>> nested lock, which is now used in the BE DAI trigger that is always
>>> performed inside a FE stream lock.
>>>
>>> Fixes: b7898396f4bb ("ASoC: soc-pcm: Fix and cleanup DPCM locking")
>>> Reported-and-tested-by: Hans de Goede <hdegoede@redhat.com>
>>> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>> Link: https://lore.kernel.org/r/73018f3c-9769-72ea-0325-b3f8e2381e30@redhat.com
>>> Link: https://lore.kernel.org/alsa-devel/9a0abddd-49e9-872d-2f00-a1697340f786@samsung.com
>>> Signed-off-by: Takashi Iwai <tiwai@suse.de>
>> Thanks for the fix! It helps a bit, but I still get a warning (a
>> different one now):
> Thanks for the quick testing.  Actually we do have multiple issues.
>
>> root@target:~# speaker-test -l1
>>
>> speaker-test 1.1.8
>>
>> Playback device is default
>> Stream parameters are 48000Hz, S16_LE, 1 channels
>> Using 16 octaves of pink noise
>> Rate set to 48000Hz (requested 48000Hz)
>> Buffer size range from 128 to 131072
>> Period size range from 64 to 65536
>> Using max buffer size 131072
>> Periods = 4
>> was set period_size = 32768
>> was set buffer_size = 131072
>>    0 - Front Left
>> Time per period = 0.022199
>> max98090 1-0010: PLL unlocked
>>
>> =====================================================
>> WARNING: SOFTIRQ-safe -> SOFTIRQ-unsafe lock order detected
>> 5.16.0-next-20220113-00001-g3967460dbcf4 #11212 Not tainted
>> -----------------------------------------------------
>> speaker-test/1319 [HC0[0]:SC0[0]:HE0:SE1] is trying to acquire:
>> c1296410 (pin_fs_lock){+.+.}-{2:2}, at: simple_pin_fs+0x1c/0xac
>>
>> and this task is already holding:
>> c2fe6ea4 (&group->lock){..-.}-{2:2}, at: dpcm_be_disconnect+0x3c/0x348
>> which would create a new lock dependency:
>>    (&group->lock){..-.}-{2:2} -> (pin_fs_lock){+.+.}-{2:2}
> So that's the problem: we call debugfs_remove_recursive() in the
> spinlocked context.
>
> Could you try the patch below?  It's a bit hackish, but let's check
> whether that's the real cause or not.

Right, this fixes the issue. It was trivial to find, but I did a test 
just a few minutes before finishing my work time, so I only copied the 
log to the mail without analyzing it.

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

