Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D64213FA3
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jul 2020 20:49:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D789516C9;
	Fri,  3 Jul 2020 20:48:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D789516C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593802156;
	bh=lP4GpcUjG72YqBMg9J08cBVB85PCY1/9glqqIhXNEFU=;
	h=Subject:To:From:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cqeo6LZyY5w/0n2A51fQLdnqPyCEvk0xcDBHZpB9YiOHYRnZbwSI6XkWVH/zA6PLR
	 AjjFnZ8pfSKZuCLqvyrKLQFfyUPZl4W+5XtY9ugZpqhvRb7I6KBCO4ccsOJSZTVOaJ
	 3C93GSXcnI3pzqT0AtzBFNVh2qTSp/IsZE2oW+pA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0044F8021D;
	Fri,  3 Jul 2020 20:47:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C68AF80217; Fri,  3 Jul 2020 20:47:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2DD77F800E0
 for <alsa-devel@alsa-project.org>; Fri,  3 Jul 2020 20:47:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2DD77F800E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="UzN//N9y"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200703184722euoutp011d5508dd1f8f9e8c51238875466aa5a0~eUoN5iAqx3139931399euoutp01j
 for <alsa-devel@alsa-project.org>; Fri,  3 Jul 2020 18:47:22 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200703184722euoutp011d5508dd1f8f9e8c51238875466aa5a0~eUoN5iAqx3139931399euoutp01j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1593802042;
 bh=i1/uMDs8BgSjlm9bkstKj5YuscCvOGSa3GwGD5PZpt4=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=UzN//N9y9ROTSnLGmoAzyFEWZM52vP6mxMwapCl/V99Yn+LQaR2rH3QNVGyZfraH0
 J7Aspe2mQZ/IK2s0ieuweoPDXGLkBPM2GCQsj4NqX+Hc+gc315tTw6QKnoh6wNwL34
 Svs9kVHPg+NKYIMGThxtBevOBqx7kxNVITsYzBhw=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200703184722eucas1p22fcca6dd07e52aaf1251e85fc18db7b3~eUoNiCsmr2016720167eucas1p2s;
 Fri,  3 Jul 2020 18:47:22 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 1B.66.06318.A3D7FFE5; Fri,  3
 Jul 2020 19:47:22 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200703184721eucas1p14d55ad6733d8edbc22237da65563d0bc~eUoNGzc-m0218502185eucas1p1M;
 Fri,  3 Jul 2020 18:47:21 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200703184721eusmtrp2050d75dc1546f772412a0fa8183e36e2~eUoNGI9Qp1186411864eusmtrp2a;
 Fri,  3 Jul 2020 18:47:21 +0000 (GMT)
X-AuditID: cbfec7f5-371ff700000018ae-d5-5eff7d3ab566
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id C2.0E.06017.93D7FFE5; Fri,  3
 Jul 2020 19:47:21 +0100 (BST)
Received: from [106.210.123.115] (unknown [106.210.123.115]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200703184720eusmtip1f6a015963e019e47265fe8d15eb9bcc8~eUoML1gIE3172131721eusmtip10;
 Fri,  3 Jul 2020 18:47:20 +0000 (GMT)
Subject: Re: [PATCH 3/8] ASoC: samsung: pcm: fix kernel-doc
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <d6980967-5def-58c9-39a9-239a5c671f3f@samsung.com>
Date: Fri, 3 Jul 2020 20:47:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200702165901.164100-4-pierre-louis.bossart@linux.intel.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02SWUwTURSGvTPT6XS05FIwnKDBWDGuoAQwoyjBLRnjg/hmVKpFBkpY7QBu
 IRoRhKJ1i0GbCkTDYo0BK4JgRAWFVCJYtxA3AqlEidUIBQUFdDoaefv+c89/z/1PLkNqHisC
 meT0LMGYrk/V0ixV3zbaFbIqd1K3fHgYcy+cLQR3vtdFc11dtUpu5EUhwT1vstJcUdMpBTc2
 2U9wzmoPwdV+v464Tzc/EzEsXzt0lOYbLe+UvN1WRPOljq18s7uS5s11NsTX1L2k+Jsdh/gh
 e1Csaju7OkFITc4RjMuid7OGHx/CMsum77/27gw6giYYE2IYwBGQf583IZbR4GoEefX5pCw8
 CDrNfUpZDCE49uoXbUIqr6PiQj8psQZXIXCbl8r8DcGg009iPxwFbQUVSon9sQ6qPF3ei0hc
 QEDr1wGvmcZhcPKRGUmsxtFQYp2gJKZwMLy2Wr08E8eBuaKclnt8wXHR5a2r8GYYv+RUSEzi
 AHjtKiNkngMNbqs3AmC3Ep7elQcA3gCD46OUzH4w0F6nlHk2TDZKZsmQh+DEnTdKWZxG0NNe
 /tcdBW87x2hpYyReBDVNy+TyWhhvKCXkRfpAt9tXfoQPnK0vIeWyGgoLNHJ3MPy0lRAyB0Kx
 a5I6jbSWKdEsU+JYpsSx/J9bjigbChCyxbQkQQxPF/aFivo0MTs9KXRPRpod/flhHRPtw7dR
 86/4FoQZpJ2h/ugY12kU+hzxQFoLAobU+qvXPenQadQJ+gMHBWPGLmN2qiC2oFkMpQ1Qh1/+
 FKfBSfosIUUQMgXjv1OCUQUeQZHxPolxa5bYG2Jj2noLot9fhkjPtYjE6odrTQNjD66kLDTl
 Vs61t4Y1r0y+FxS14ELl4WDu5NWBPkMEu/HLFp1z7/VYbeXx+fMyc3uUNQu7DVmLVuxo7B25
 u7N4TlnO9+dbp52L9OT9DB8NUq3bEL+JvcXGhDi4HaBYf+PZzvptfdO1lGjQhy0mjaL+N+Dn
 NktdAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrHIsWRmVeSWpSXmKPExsVy+t/xu7qWtf/jDN4cMLC4cvEQk8XUh0/Y
 LM6f38Bu8e1KB5PF5V1z2Cw6d/WzWvz6/4zJ4uKKL0wWG76vZbR4ufkNkwOXx4bPTWweO2fd
 ZffYtKqTzWPeyUCPfW+XsXn0bVnF6LF+y1UWj82nqz0+b5IL4IzSsynKLy1JVcjILy6xVYo2
 tDDSM7S00DMysdQzNDaPtTIyVdK3s0lJzcksSy3St0vQy/jx1LBgPnfF6rsTGRsY/3F0MXJy
 SAiYSCyd8Yy5i5GLQ0hgKaPEzcud7F2MHEAJKYn5LUoQNcISf651sUHUvGeUuL/0ETNIQljA
 WuJY21J2EFtEIE5i98JDLCBFzAJtTBLfV/UwQnTcZ5T40NPDBFLFJmAo0Xu0jxHE5hWwk5g+
 5x8LiM0ioCJxa84cMFtUIFbi270tbBA1ghInZz4Bi3MKeEv8nXuRFcRmFlCX+DPvEjOELS5x
 68l8JghbXmL72znMExiFZiFpn4WkZRaSlllIWhYwsqxiFEktLc5Nzy020itOzC0uzUvXS87P
 3cQIjNttx35u2cHY9S74EKMAB6MSD++E43/jhFgTy4orcw8xSnAwK4nwOp09HSfEm5JYWZVa
 lB9fVJqTWnyI0RTouYnMUqLJ+cCUklcSb2hqaG5haWhubG5sZqEkztshcDBGSCA9sSQ1OzW1
 ILUIpo+Jg1OqgXGS45/DembLlq7r1rganz5j7YfASN4sLu/rEjc3t+t6eXI/dpK/v+q6r0fy
 jlKzZJ1Z07yrJhzcbnO0aq2El6bYb/5CoVP2TvN33pyw8HBKtaLytWd3Zhp2PC2O3Lakvf5s
 p6+ofHeh6h+dhPYvX0tcmcr/2y/Sy1mjlnav8eO3Xef8ntfu9lJiKc5INNRiLipOBADTRFEi
 8QIAAA==
X-CMS-MailID: 20200703184721eucas1p14d55ad6733d8edbc22237da65563d0bc
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200702165920eucas1p236c3c4c82424ea459ea88ebacf9b8a6e
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200702165920eucas1p236c3c4c82424ea459ea88ebacf9b8a6e
References: <20200702165901.164100-1-pierre-louis.bossart@linux.intel.com>
 <CGME20200702165920eucas1p236c3c4c82424ea459ea88ebacf9b8a6e@eucas1p2.samsung.com>
 <20200702165901.164100-4-pierre-louis.bossart@linux.intel.com>
Cc: tiwai@suse.de, open list <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Sangbeom Kim <sbkim73@samsung.com>,
 broonie@kernel.org
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

On 02.07.2020 18:58, Pierre-Louis Bossart wrote:
> Fix W=1 warnings - missing fields in structure
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  sound/soc/samsung/pcm.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/sound/soc/samsung/pcm.c b/sound/soc/samsung/pcm.c
> index a5b1a12b3496..86eefbc89e9e 100644
> --- a/sound/soc/samsung/pcm.c
> +++ b/sound/soc/samsung/pcm.c
> @@ -104,8 +104,13 @@

Thank you for the patch, I have some suggestions to improve the comments.

>  /**
>   * struct s3c_pcm_info - S3C PCM Controller information
> + * @lock: Spin lock

@lock: Spin lock to serialize access to the device registers and @idle_clk

>   * @dev: The parent device passed to use from the probe.
>   * @regs: The pointer to the device register block.
> + * @sclk_per_fs: number of sclk per frame sync
> + * @idleclk: Whether to keep PCMSCLK enabled even when idle(no active xfer)

How about adding space before the opening parenthesis?

> + * @pclk: the pclk pointer

@pclk: the PCLK_PCM (pcm) clock pointer

> + * @cclk: the clck pointer

@cclk: the SCLK_AUDIO (audio-bus) clock pointer  

>   * @dma_playback: DMA information for playback channel.
>   * @dma_capture: DMA information for capture channel.
>   */
 
With above changes feel free to add:
Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

-- 
Thanks,
Sylwester
