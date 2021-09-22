Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 485BC413EBC
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Sep 2021 02:51:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF09316AF;
	Wed, 22 Sep 2021 02:50:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF09316AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632271886;
	bh=Tv5fKXYIZFS6wZNDvLpQ/fgZXC/CC1mUDyy/EpfS2IQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GlZhyvuaKEB/KLk5krj2uQ8n8lC28rvz3ZlUNl30MMQaIdgk3kdIjP1t9clvzOJVj
	 mP3+ASQ/4WMkzyIrTq9Ty2OZWY4nkcS1v6RUmpLSh/6xmgj5UZjdJm2arKtj5GWKkY
	 Mcjjqxo+PA2soiB/t4MkHyjsJuiDPSJsA5NL3V38=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C571F80268;
	Wed, 22 Sep 2021 02:50:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CF370F80268; Wed, 22 Sep 2021 02:50:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DB189F8016E
 for <alsa-devel@alsa-project.org>; Wed, 22 Sep 2021 02:49:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB189F8016E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="gvliHsAG"
Received: by mail-lf1-x133.google.com with SMTP id u18so4647285lfd.12
 for <alsa-devel@alsa-project.org>; Tue, 21 Sep 2021 17:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Tv5fKXYIZFS6wZNDvLpQ/fgZXC/CC1mUDyy/EpfS2IQ=;
 b=gvliHsAGaamg2kIqxz+iSvyn3KlgExNAnhHohYx+L+9g0NRuaER4y6/FG6Ryd0OcvT
 eWRLv1FZg58RO3I1T7nFEzpnS/gJugOCEnvjc1Db8eZf4hh4a0LwmU0bbdodoHHEe2a1
 QlJoJYqHHT2x+NFvZA1Ym+grW0NXCb7gNEzbHjdNlYtbaM2Ui9JStiFyAmhmkeQ9Ldfm
 uKD0UwM6CNCY3IC4xH25sZgUiTO+ybw/3vOW/9+lz1jwtf1e4rub1M+UZ0/tJwkuYh+K
 R2W+1W1i+2MI10K5wX0btzuWdceTtoZqZNW+aqxyVpHvCVMjbR43CcoK1WZKcmb/M112
 9eFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Tv5fKXYIZFS6wZNDvLpQ/fgZXC/CC1mUDyy/EpfS2IQ=;
 b=B2F1HSCUVkzEPJLCbeTLyeyKQV7Zc5vV+uEEXX5WYbdDYDqYXdQXFhfHHelnYP1aC6
 Wq74+en2aYyiV65E+H0/4NEJ7+9QmCxEEK9/Z7Zc9/wb5JD0ZaBO9Lwz2GPPcB8Se7eR
 g4JhphjeWcVbNZQDpHj4KuS+dUbh+597AmeVfdLOrSmZNAaMd8w1esoeFeBY/86N3EbK
 sab/J87QVkZK5pYi0FUk+oPGGVVRrbKJnBBne5M1EPIGEzTtKIYmpN+UkluzP2NTdNIB
 C/b8M65kNXbJVgpIudsjIT2hdCKV8qSI5zvUDR84DBAuH1wokHQHQr7u3IyHeALQPpN+
 PeBg==
X-Gm-Message-State: AOAM5329sbt4VkYaCugEZdnXPBnMLWqhWQVDwKl6LuGk2I7PWckUJj0s
 BNQUCzrds+vfsV1DfOXlGbjB3BP6M5p7i/phqok=
X-Google-Smtp-Source: ABdhPJxxU59HXs6mR34sthMZMwwR1+DZTFwjJbrtlJqcbZfLIISBVBHlBwKlvYbIqKio5zDNru+hyKtg4SrW9ETSnEQ=
X-Received: by 2002:ac2:514e:: with SMTP id q14mr25636935lfd.154.1632271794190; 
 Tue, 21 Sep 2021 17:49:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210921213542.31688-1-broonie@kernel.org>
In-Reply-To: <20210921213542.31688-1-broonie@kernel.org>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 21 Sep 2021 21:49:43 -0300
Message-ID: <CAOMZO5Cu+dMSTioN7-16BDKE3g-mcs+hERJ-sbG23PaT-EEhxQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/16] ASoC: eureka-tlv320: Update to modern clocking
 terminology
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
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

On Tue, Sep 21, 2021 at 6:36 PM Mark Brown <broonie@kernel.org> wrote:
>
> As part of moving to remove the old style defines for the bus clocks update
> the eureka-tlv320 driver to use more modern terminology for clocking.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>

For the whole series:

Reviewed-by: Fabio Estevam <festevam@gmail.com>
