Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57EFA134147
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jan 2020 12:56:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E30C4171F;
	Wed,  8 Jan 2020 12:55:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E30C4171F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578484583;
	bh=fppWTsRxkkLRUK6DmdfvLWZLOJLM7veGAWDvaY38PUM=;
	h=To:From:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i/sdtTWcU2FBC9+Xm2gMn/ixa7Gcl+nAeIbxBBtS2hAI/FzCHZGkZ7vbZzckSs6Ic
	 1LHWPjMQMdgRxx2f+58FSXacgSLw9QLA/D2ztOJ6mQFqIaU359U7iCqylH6hIyA8t6
	 IS20wV4n5ZJd+fnolHUKvtEoL3DsAQVBzv6L3CAQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A659F8010B;
	Wed,  8 Jan 2020 12:54:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3B420F80159; Wed,  8 Jan 2020 12:54:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_HI, RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL, 
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AD8E2F8010B
 for <alsa-devel@alsa-project.org>; Wed,  8 Jan 2020 12:54:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD8E2F8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="qvA+Z8V4"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200108115432euoutp011cbb2c2d98d4f218c115055bef7f712b~n50O5lJdN0850808508euoutp01c
 for <alsa-devel@alsa-project.org>; Wed,  8 Jan 2020 11:54:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200108115432euoutp011cbb2c2d98d4f218c115055bef7f712b~n50O5lJdN0850808508euoutp01c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1578484472;
 bh=S7Fy11AC/q5Y/YYr5eYfAY4T3HeQUsLZyyIfA2EOGFk=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=qvA+Z8V4YWmKcvMamraub7nWWAKcJAmeEqq7vaV6YyVbIAtaF0wUD1J7QYTa1NyJC
 OKVnOim05CLnMVWYrFOP6CXvo0oEBJK/HV4Uadv3kmbL/7VYbnODxyN5//0yRnqYF4
 a0FSadQ7sqdOZ+Zm06qaFuwhcqCPe/2eM0xxMfZM=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200108115432eucas1p1b303a2a01beb91c9df71be8b68f98dc7~n50OssV_o2629826298eucas1p14;
 Wed,  8 Jan 2020 11:54:32 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 7F.A3.60698.8F2C51E5; Wed,  8
 Jan 2020 11:54:32 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200108115431eucas1p1098698b3784ebaf88d5935bb594effe1~n50OYuvd62548525485eucas1p13;
 Wed,  8 Jan 2020 11:54:31 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200108115431eusmtrp18f8db22203da6678ac10eb4f8c7a8536~n50OYGdp22175621756eusmtrp1e;
 Wed,  8 Jan 2020 11:54:31 +0000 (GMT)
X-AuditID: cbfec7f5-a29ff7000001ed1a-ce-5e15c2f8d174
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id E8.96.08375.7F2C51E5; Wed,  8
 Jan 2020 11:54:31 +0000 (GMT)
Received: from [106.120.51.15] (unknown [106.120.51.15]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200108115431eusmtip1391481d5edb32f44859f5fe3206e6f80~n50N1VZ2B1978219782eusmtip1J;
 Wed,  8 Jan 2020 11:54:31 +0000 (GMT)
To: Mark Brown <broonie@kernel.org>
From: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <aed6ff4e-1c04-e20c-aa55-4f2b05952f38@samsung.com>
Date: Wed, 8 Jan 2020 12:54:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20191220120154.GB4790@sirena.org.uk>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0hTcRjG+e+cnR2XG8c58c3CcIWUpGYKHbxlYLD85IeiiDSXnqblpuw4
 0y7khdSmrDItHV3EWZaXMm+lmeG85QznNZz5xTBImURYqRHZ5tHy2+99nufl+b/wJzFJD9+D
 TFKnMRq1IllGCPHWvhWL77LJLXZfdb+IHh8x8ejSmVmCftedjdH55QWItlgaBPR8dzuiyyyd
 PLrbls+n55psPLpjZF4QIZQ3LOYQ8opGrbyx5joh//n+Fi7XN9cgedPgJflio2e04KQwNIFJ
 TkpnNP7hccLEsbJaLLVJmNG5VIqy0AtSh5xIoIJg6tEMoUNCUkI9QWAz1/K54TuCiaGVdWcR
 wWN9C7axUjPUIOCMagTXlvowblhA0Hdfv5ZypdTQVVVLOFhK7YSJpTe4I4RRegzMtsk1g6AC
 QLegW2MRFQ6GwhKeg3FqFzy4UYIc7EbFwGp5C4/LuMBA+SzuYCdqP1R9bFsrw6gd8HLh3jq7
 w9TsQ56jDKhRAbR/nRVw746EL9YPBMeuMN/fvK5vh8HbRTi3kItgZqhewA1FCMZyyhCXCoHp
 oV/2bdJesQeet/tz8iHoqO8WOGSgxDC54MI9QgzFrXcxThZBQZ6ES3uDof/Zv9qu4VHsJpIZ
 Np1m2HSOYdM5hv+9FQivQe6MllUpGTZQzVzwYxUqVqtW+sWnqBqR/W8N/un/8Qp1/j5jQhSJ
 ZM6iZaM0VsJXpLOZKhMCEpNJRT577ZIoQZF5kdGknNZokxnWhLaRuMxdFFg5FyOhlIo05jzD
 pDKaDZdHOnlkoTB9R2Rv4VjQt61Cr6XK1w1hUVdlOdbRz+IodlXjdG44Ol55kO8pNV4+nGbq
 9R+vi6t7GpxjNXtZt7yVR5x11nufMO1uy/YszDvq4Rt8SmzMP6asKOCHTkPfiPSO0ZxrjjlS
 JSsmbJ8OZPQkeJeGHNccw4ZjrizOWJsHcqHcLMPZREWAD6ZhFX8BqyTJ+1cDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrKIsWRmVeSWpSXmKPExsVy+t/xu7rfD4nGGRzpNba4cvEQk8XUh0/Y
 LE4cbmS2aJ/ZwWhx/vwGdotXh3cxWsw4v4/J4vCbdlaLl5vfMFnsufiK3YHLY8PnJjaPBZtK
 PTat6mTz+HZmIotH35ZVjB6bT1d7fN4kF8AepWdTlF9akqqQkV9cYqsUbWhhpGdoaaFnZGKp
 Z2hsHmtlZKqkb2eTkpqTWZZapG+XoJdxecZq5oLNXBX7vk9lbGDcyNHFyMkhIWAisercBvYu
 Ri4OIYGljBLXrr1igUjISJyc1sAKYQtL/LnWxQZR9JpRYsfi52BFwgJ5EgeXrGYDsUUElCWu
 ft/LAlLELNDHLLHj8hywbiGBdSwSl98JgthsAoYSXW+7wBp4BewkZnVPYQKxWQRUJOb1T2EE
 sUUFYiW2b37IDFEjKHFy5hOwZZwCRhJLbu8EizMLmEnMg6phFpCX2P52DpQtLnHryXymCYxC
 s5C0z0LSMgtJyywkLQsYWVYxiqSWFuem5xYb6hUn5haX5qXrJefnbmIERum2Yz8372C8tDH4
 EKMAB6MSD++PxSJxQqyJZcWVuYcYJTiYlUR4tXSAQrwpiZVVqUX58UWlOanFhxhNgZ6byCwl
 mpwPTCB5JfGGpobmFpaG5sbmxmYWSuK8HQIHY4QE0hNLUrNTUwtSi2D6mDg4pRoYqz8q/fOW
 P29qcHh3Yut/7blLeec/XbfQ/WWO6UJOa6kpOx1fMxlwhKsefaC/3LBuV8r1r+8+qm5ldOj+
 pLan4eb01B1/lp2cfHRJ1QQzXpN3FbedVq/nyXkdV3lc6Ej8Msl3FrfeTZ6g6rQkdjILj4dQ
 9FqLoxsPNP2QePOLkXu3SoLIhMVx05VYijMSDbWYi4oTAUinNCDoAgAA
X-CMS-MailID: 20200108115431eucas1p1098698b3784ebaf88d5935bb594effe1
X-Msg-Generator: CA
X-RootMTR: 20191219191651epcas5p2ab8031875093df401d9182e7c491eb3d
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20191219191651epcas5p2ab8031875093df401d9182e7c491eb3d
References: <20191218162422.GG3219@sirena.org.uk>
 <ef908cb8-875e-4339-33bd-5997b594f022@samsung.com>
 <20191219123709.GB5047@sirena.org.uk>
 <aba9f63c-d993-e54e-4daa-9dbc35d0683b@samsung.com>
 <20191219130559.GE5047@sirena.org.uk>
 <a10269be-8caf-6e07-71c6-582a1d2c1458@samsung.com>
 <CGME20191219191651epcas5p2ab8031875093df401d9182e7c491eb3d@epcas5p2.samsung.com>
 <20191219191646.GH5047@sirena.org.uk>
 <b0e57646-8a14-e6c0-9daa-28c353dcb77a@samsung.com>
 <31bde14e-1fef-264a-ba1e-fc3051506bf3@samsung.com>
 <20191220120154.GB4790@sirena.org.uk>
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
 Jimmy Cheng-Yi Chiang <cychiang@google.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Takashi Iwai <tiwai@suse.de>, Krzysztof Kozlowski <krzk@kernel.org>,
 Tzung-Bi Shih <tzungbi@google.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Dylan Reid <dgreid@google.com>
Subject: Re: [alsa-devel] [PATCH v2] ASoC: max98090: save and restore SHDN
 when changing sensitive registers
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

Hi Mark,

On 20.12.2019 13:01, Mark Brown wrote:
> On Fri, Dec 20, 2019 at 10:05:52AM +0100, Marek Szyprowski wrote:
>> On 20.12.2019 09:28, Marek Szyprowski wrote:
>>> I've tried initially to cherry-pick it to v5.4, but the the code
>>> didn't compile due to lack of some macros, so I've gave up trying. I
>>> will check that now and backport needed macros too if you think this
>>> would help.
>> Same issue. I've tried backporting it to each kernel release: 5.4, 5.3,
>> 5.2, 5.1 and 5.0 (with additional backporting "ASoC: core: add
>> SND_SOC_BYTES_E" and "ASoC: Define a set of DAPM pre/post-up events").
>> In all cases the lockdep warning and oops is the same. Backporting to
>> v4.9 requires more changes to get it even compiled, so I gave up.
> OK, thanks - that's definitely not the recent refactorings then but
> something that's been a problem for a long time.  I'm surprised nobody
> else ran into anything if that's the case...

It took me a while to get back into this issue and investigate it in 
details. It turned out to be an incorrect helper to get component object 
in max98090_dapm_put_enum_double() function. Following patches: 
https://lkml.org/lkml/2020/1/8/358 fix this and (independent) lockdep 
issues.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
