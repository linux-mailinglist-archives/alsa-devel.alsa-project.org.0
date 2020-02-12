Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA0715AD40
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Feb 2020 17:22:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C440F1679;
	Wed, 12 Feb 2020 17:21:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C440F1679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581524557;
	bh=ZYMuSMHQuYw/SXBQXmRkba3AhZwaU26DYS25jzNyRPQ=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QV9GrC1d+7erbT6V4Tv2qo2VhwptwAI3r5+AdrwYZvEIbumvAvIvZK/0lROdb7uHw
	 5s1g65/2RW3FqGtr0A6QiZwKBQxR/XTEQgmtelMKG1M6F7n3AE8DQYN27f8sUvPf/0
	 V8PQqmhECcJb1TLzbs/kHDPgU/Pld6ngXyemVkiU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1AF2F80158;
	Wed, 12 Feb 2020 17:20:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 83146F80157; Wed, 12 Feb 2020 17:20:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C429CF80125
 for <alsa-devel@alsa-project.org>; Wed, 12 Feb 2020 17:20:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C429CF80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="olbpfkI4"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=+UKmHxiuZF1shyZt5oca8fTPDu1pZzR6zzY6ICKT86M=; b=olbpfkI4hWORuzwrfVqSmdX12v
 4GgVopStHyZZAtAuXxWOKGr4+I+xfs7Xi35KHn2imuxJzCSDloJUjXlJ9wnF/RKvrOi0vo6BOQ7w9
 R3Em34rcq1/DtrWFt86iXuM47N6ZZpkfv54V/B0cWv3lwcAxk+Y3D7ZfMe5KWJG92MSNx+czhrqU3
 eXna46aLU0ZvuTQfdxEswxUcaP/3xRWnXq8RXvYsnznVprHK8RrQ7aNrykYkLEFyflxpSSTXd96Fa
 JBCA1QFY2SNReCR0BnqzgxAjuZaoGcX4cwBvGdxJkzEyJVKF8j8HiTopT72KlLp/0H3xCqB/pbUtm
 F7B6qsBQ==;
Received: from [2601:1c0:6280:3f0::19c2]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1uko-0004pe-6K; Wed, 12 Feb 2020 16:20:46 +0000
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <20200212145650.4602-1-geert@linux-m68k.org>
 <20200212145650.4602-2-geert@linux-m68k.org>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <4cd8ffb2-0d3c-dd04-5cf7-bd4d6ccb9d43@infradead.org>
Date: Wed, 12 Feb 2020 08:20:45 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200212145650.4602-2-geert@linux-m68k.org>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH 1/3] ASoC: Fix SND_SOC_ALL_CODECS imply SPI
	fallout
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

On 2/12/20 6:56 AM, Geert Uytterhoeven wrote:
> Fixes for CONFIG_SPI=n:
> 
>     WARNING: unmet direct dependencies detected for REGMAP_SPI
>       Depends on [n]: SPI [=n]
>       Selected by [m]:
>       - SND_SOC_ADAU1781_SPI [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m]
>       - SND_SOC_ADAU1977_SPI [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m]
> 
>     ERROR: "spi_async" [...] undefined!
>     ERROR: "spi_get_device_id" [...] undefined!
>     ERROR: "__spi_register_driver" [...] undefined!
>     ERROR: "spi_setup" [...] undefined!
>     ERROR: "spi_sync" [...] undefined!
>     ERROR: "spi_write_then_read" [...] undefined!
> 
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Fixes: ea00d95200d02ece ("ASoC: Use imply for SND_SOC_ALL_CODECS")
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---

Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested


thanks.
-- 
~Randy

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
