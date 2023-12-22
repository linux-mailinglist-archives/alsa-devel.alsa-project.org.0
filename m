Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E9C81C360
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Dec 2023 04:20:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4954DEC;
	Fri, 22 Dec 2023 04:20:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4954DEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703215211;
	bh=V4OMLu5q7uh4JVqS+ALVz7A+gCDqpKX6uAN+SCjx2fU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aLiCVChppBNTtFKwaiMspB9enx0Dp+k/ipOG7Y5Zdzprrajgzg9hgpAaob/eb8JKT
	 goE5Q9MfDrf9hT0mah912g2XesYZTEW0wZqwlLhif4Flj0xwPUDt8OBTwl6cR2eYXT
	 1VgLw6vQxhOzkW+ouMHkDdULeiXSRkm2hOcajEeM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0CDF6F8057E; Fri, 22 Dec 2023 04:19:39 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 21FB3F80570;
	Fri, 22 Dec 2023 04:19:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 556B3F8016E; Fri, 22 Dec 2023 04:19:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B7146F80124
	for <alsa-devel@alsa-project.org>; Fri, 22 Dec 2023 04:19:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7146F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=bombadil.20210309 header.b=adaZShO4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=Q6NjPgYJQtSodOzthdhnA37trDHql/uqNpeL2NkABuU=; b=adaZShO4wEcL4qF2GJqtyMR7Gt
	Pm80sELUqhpf2d84fpt+taz4yQk7scuc4qKRMns6INFV0iFG+R63LMpi3zOAayxqZFD7rqGH0h0YZ
	RUGYYkrDh4YtHObEFdLByHqIPPcNeMC8DdIuYzin7qpB5nPXHmPWJNGq4NXM8ksNKwHiPEh9rAJq+
	g7d1gmeyNXT45W20wrg7R/ipvtoLVnavfbRYiMkAMYkWuv/TMvFZzpunUgZlw4unFjuK9yhn6nms9
	i9QzPaBOm1pAnHvtDquRJLAV3N6/gGMJi7PG6YOT7iFccS7k9i0pZmC0nBXyxflRf9UhNKLO3FL+s
	rHqiQPnw==;
Received: from [50.53.46.231] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1rGW42-004jsp-0V;
	Fri, 22 Dec 2023 03:19:08 +0000
Message-ID: <0e7b22c0-4645-4403-9408-dfc8e86eda86@infradead.org>
Date: Thu, 21 Dec 2023 19:19:05 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: hda/tas2781: fix typos in comment
Content-Language: en-US
To: Gergo Koteles <soyer@irl.hu>, Shenghao Ding <shenghao-ding@ti.com>,
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org
References: 
 <ead5609d63e71e8e87c13e1767decca5b272d696.1703203812.git.soyer@irl.hu>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: 
 <ead5609d63e71e8e87c13e1767decca5b272d696.1703203812.git.soyer@irl.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 22J6NNO3THNTIUK35LTAKEIXRCPXUMTB
X-Message-ID-Hash: 22J6NNO3THNTIUK35LTAKEIXRCPXUMTB
X-MailFrom: rdunlap@infradead.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/22J6NNO3THNTIUK35LTAKEIXRCPXUMTB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi--

On 12/21/23 16:11, Gergo Koteles wrote:
> Correct typos.
> 
> Signed-off-by: Gergo Koteles <soyer@irl.hu>
> ---
>  sound/pci/hda/tas2781_hda_i2c.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/pci/hda/tas2781_hda_i2c.c b/sound/pci/hda/tas2781_hda_i2c.c
> index fb802802939e..8f63e3099d3e 100644
> --- a/sound/pci/hda/tas2781_hda_i2c.c
> +++ b/sound/pci/hda/tas2781_hda_i2c.c
> @@ -421,9 +421,9 @@ static void tas2781_apply_calib(struct tasdevice_priv *tas_priv)
>  	}
>  }
>  

also:

> -/* Update the calibrate data, including speaker impedance, f0, etc, into algo.
> +/* Update the calibration data, including speaker impedance, f0, etc, into algo.
>   * Calibrate data is done by manufacturer in the factory. These data are used

    * Calibration data

> - * by Algo for calucating the speaker temperature, speaker membrance excursion
> + * by Algo for calculating the speaker temperature, speaker membrane excursion
>   * and f0 in real time during playback.
>   */
>  static int tas2781_save_calibration(struct tasdevice_priv *tas_priv)
> 
> base-commit: c7e37b07cc7564a07125ae48c11fd1ca2bcbeae2

-- 
#Randy
https://people.kernel.org/tglx/notes-about-netiquette
https://subspace.kernel.org/etiquette.html
