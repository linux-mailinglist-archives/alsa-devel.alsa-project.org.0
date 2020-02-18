Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 658FD162158
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Feb 2020 08:07:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B3DC1657;
	Tue, 18 Feb 2020 08:06:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B3DC1657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582009636;
	bh=AfYUPtLWJs/2TGiVPf1QeSHly4Aa7i6HvXrL/xDlWkA=;
	h=Subject:From:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jC61i4Xg98+dRc5aPktdyNZFUo4ZbJ+HtLn347rWUQ4IV0EEUDRipKeVNlVDp+RJP
	 OmDHIQESiKYYyFdsoX0yGkxA2yhBI7llE3nY/oxWxY9rnA/5cpkD5HHpXIHpBwxCiY
	 UdoBe/vPvNTAhScDq6LeCMHJ8+ZElpV5iIgCdsc8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 836D2F80135;
	Tue, 18 Feb 2020 08:06:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 53216F8014C; Tue, 18 Feb 2020 08:06:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NO_DNS_FOR_FROM,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DADA4F80135
 for <alsa-devel@alsa-project.org>; Tue, 18 Feb 2020 08:05:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DADA4F80135
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="fJZBxTcu"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:References:Cc:To:From:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=0WDK64CvM/aOQVQpYJeiENx5iDKotnOnD6ArMqWTlLE=; b=fJZBxTcuObVqaB4Sl29v/3xeDX
 6AqALUVY+GjDnDPWVnbDnKpR9cm+PhFZ/rplZOPXo1sbhhixioVCR0qYsolGnfbB647PNW1sKNAwu
 hdWvGi89OsUnCZBkZv0zTQGcd55gWNBR7PtROfR7PW7sIKJ4CW0GhZgrrcFPQ19UdvlOOL9p/O0pu
 eYVbFg0nvQpJ3Gn6gV5mNaNJWh61T6oKyZF3IFdRe1IRlQ4gNoMc5n8ncp+ai63HLGJ+9LRpLHufL
 X1DF7SB0/GqiAR7ejMLmR8YtyzVo0ZPzuAE0K7L90sEz9/cRV2mxNW1azEhE/JOLq1JhQj2Tdsc/p
 0bN2FsCg==;
Received: from [2601:1c0:6280:3f0::19c2]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j3wx4-0002kg-Qk; Tue, 18 Feb 2020 07:05:52 +0000
Subject: Re: linux-next: Tree for Feb 18 (sound/soc/codecs/wm5110.c)
From: Randy Dunlap <rdunlap@infradead.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20200218152853.67e2482a@canb.auug.org.au>
 <89ef264f-12c9-ccb0-5cdd-ee5f70a469dd@infradead.org>
Message-ID: <c2273472-18af-e206-c942-fd460e0d192c@infradead.org>
Date: Mon, 17 Feb 2020 23:05:49 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <89ef264f-12c9-ccb0-5cdd-ee5f70a469dd@infradead.org>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: patches@opensource.cirrus.com,
 moderated for non-subscribers <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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

[resending to broonie@kernel.org; other email address got message too big for mailbox]


On 2/17/20 11:04 PM, Randy Dunlap wrote:
> On 2/17/20 8:28 PM, Stephen Rothwell wrote:
>> Hi all,
>>
>> Changes since 20200217:
>>
> 
> on x86_64:
> 
> WARNING: unmet direct dependencies detected for SND_SOC_WM5110
>   Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && MFD_WM5110 [=n]
>   Selected by [y]:
>   - SND_SOC_BELLS [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_SOC_SAMSUNG [=y] && MFD_ARIZONA [=y] && I2C [=y] && SPI_MASTER [=y] && (MACH_WLF_CRAGG_6410 || COMPILE_TEST [=y])
>   - SND_SOC_SAMSUNG_TM2_WM5110 [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_SOC_SAMSUNG [=y] && MFD_ARIZONA [=y] && I2C [=y] && SPI_MASTER [=y] && (GPIOLIB [=y] || COMPILE_TEST [=y])
> 
> 
> Full randconfig file is attached.
> 


-- 
~Randy
Reported-by: Randy Dunlap <rdunlap@infradead.org>
