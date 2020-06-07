Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E393A1F0FDE
	for <lists+alsa-devel@lfdr.de>; Sun,  7 Jun 2020 22:45:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6CA261612;
	Sun,  7 Jun 2020 22:44:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6CA261612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591562711;
	bh=tJygINi6o+4HmBZasO/WH4knAUuGN8ritG5jILs8XGI=;
	h=References:From:To:Subject:In-reply-to:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E67TL2diTcnGTsp1MWO2NeDRHPjhk1FKl2uawocgpCnbnuY2ieZVhdLO+6aLGyp1/
	 X204P1UI/bAKZCVQQRgfXNJ89T+pN+5+wmP9faGS7f19tCw1HYHna+OUSx3oeSlK9C
	 vetpmlqV6/r4A0+SfPrj53BGpVs8XFeRDVE7jbOE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8875BF80149;
	Sun,  7 Jun 2020 22:43:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3E751F8028D; Sun,  7 Jun 2020 22:43:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C3633F800F4
 for <alsa-devel@alsa-project.org>; Sun,  7 Jun 2020 22:43:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3633F800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="XA88GXBC"
Received: by mail-wr1-x441.google.com with SMTP id c3so15238498wru.12
 for <alsa-devel@alsa-project.org>; Sun, 07 Jun 2020 13:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:subject:in-reply-to:date:message-id
 :mime-version; bh=lZvTa+fi3q1fHKnC1NQ/5Z2Ndj1/0QXtbAGtm+dp8V4=;
 b=XA88GXBCMwRC8ua5Zu1G1aq1EuoHHamyB7XfFDreblLDNy9oepc7VRQ+RnWPezXhWu
 F/sI2GLdvWzRd2LxwU/Jh7tU/CChLMG1Oz3GnckfQo2g/B6LZUrz4IbKP5TR7QtIVryP
 y009CvtbXFo+0gbUCpZ3WN7kG1sYxQuZ8XxK70kTohvaJirXKC7V5/0kkvEcW9jYi2eS
 VZoAXCn1itpeEVSF8tIc0A3xYlXfV8sJN9jSgNaKkFxx6bfxFx3kCWUalLQnwP+M/9K8
 DbYTUCE+VM14CJcRNr9eEBr+Fy6SoV9OEf9k/l86n4NH1qcTy4jSFhjhs/6CUxOfnA9d
 tQxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:subject
 :in-reply-to:date:message-id:mime-version;
 bh=lZvTa+fi3q1fHKnC1NQ/5Z2Ndj1/0QXtbAGtm+dp8V4=;
 b=OmeEckuFQSRqiYl/yBccVa1E8vOYkSGQanlboEoaWo/bJY7q00526wChkAF7UxSBeQ
 gYA6NhYF/OJBxqZS6fHOASWGgY1tumGvZ1EYtVDOWTu+wklv5NN19xvLUnUE3eDIfXUe
 VEmrYZZsJ5i8GY1FAkpGWNR2U3/50EZ+Y4v8ub2+bUJynMxU3k/7BRtR5U+6ViHE7+zn
 eFoyJSrbChiIpP8ys809J/elCgFftis9mhx/7LmBkiTO32Y3CA/hS3fx7JUEr6qdE7Na
 JO/sSXXmzT9BD4v0ZQshNE4G4OmdJQuVfPTmKoKQg0MgqESOZjA0RwuqGrL+VN5WRXBy
 P95Q==
X-Gm-Message-State: AOAM532wjGajYHiUVwG09g6ZDFPZSoGJ/32sAtnUl+dHgpXgHDN3W4PJ
 7POMgJtMY40RDbnbyXE/4AUxYg==
X-Google-Smtp-Source: ABdhPJwRg2AKDExNqQAafPVcv9hmJIPslCiSScJq+j3/O2XbJjP3NCsn9vcvUZhDPos5i3JhgsynoA==
X-Received: by 2002:a05:6000:11cd:: with SMTP id
 i13mr19363506wrx.141.1591562600771; 
 Sun, 07 Jun 2020 13:43:20 -0700 (PDT)
Received: from localhost (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.gmail.com with ESMTPSA id j4sm21175221wma.7.2020.06.07.13.43.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jun 2020 13:43:20 -0700 (PDT)
References: <20200606153103.GA17905@amd>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Pavel Machek <pavel@ucw.cz>, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, khilman@baylibre.com,
 alsa-devel@alsa-project.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, trivial@kernel.org
Subject: Re: [PATCH] soc/meson: add missing free_irq() in error path
In-reply-to: <20200606153103.GA17905@amd>
Date: Sun, 07 Jun 2020 22:43:18 +0200
Message-ID: <1j5zc2k3o9.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
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


On Sat 06 Jun 2020 at 17:31, Pavel Machek <pavel@ucw.cz> wrote:

> free_irq() is missing in case of error, fix that.
>
> Signed-off-by: Pavel Machek (CIP) <pavel@denx.de>

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

>
> diff --git a/sound/soc/meson/axg-fifo.c b/sound/soc/meson/axg-fifo.c
> index 2e9b56b29d31..b2e867113226 100644
> --- a/sound/soc/meson/axg-fifo.c
> +++ b/sound/soc/meson/axg-fifo.c
> @@ -249,7 +249,7 @@ int axg_fifo_pcm_open(struct snd_soc_component *component,
>  	/* Enable pclk to access registers and clock the fifo ip */
>  	ret = clk_prepare_enable(fifo->pclk);
>  	if (ret)
> -		return ret;
> +		goto free_irq;
>  
>  	/* Setup status2 so it reports the memory pointer */
>  	regmap_update_bits(fifo->map, FIFO_CTRL1,
> @@ -269,8 +269,14 @@ int axg_fifo_pcm_open(struct snd_soc_component *component,
>  	/* Take memory arbitror out of reset */
>  	ret = reset_control_deassert(fifo->arb);
>  	if (ret)
> -		clk_disable_unprepare(fifo->pclk);
> +		goto free_clk;
> +
> +	return 0;
>  
> +free_clk:
> +	clk_disable_unprepare(fifo->pclk);
> +free_irq:
> +	free_irq(fifo->irq, ss);
>  	return ret;
>  }
>  EXPORT_SYMBOL_GPL(axg_fifo_pcm_open);

