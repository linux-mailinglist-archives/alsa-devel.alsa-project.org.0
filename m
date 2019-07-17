Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB1C6BFD2
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jul 2019 18:49:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 47EE116AE;
	Wed, 17 Jul 2019 18:48:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 47EE116AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563382149;
	bh=fywddRoNBqU2gFXTKnhM3sPwBT0vVeUwahkHc+YN424=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IDAxImrdCz0vrsNqXf5sXzjkCScHAeUkE7vdvS1GA6cL68GqX9qFpEi0RcjpOgQAG
	 dfL6kdsJPNirBc++gWtK87dEYffU0y6xQCkTrqRPZ5iX7mmJPSJPQg6N6xOrY1H92x
	 1NSIXQw7cyNZk1RnrczTCX9T1/qbe3GD8MWn8Q8c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 59A4AF80363;
	Wed, 17 Jul 2019 18:47:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA396F80363; Wed, 17 Jul 2019 18:47:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5FC29F800C4
 for <alsa-devel@alsa-project.org>; Wed, 17 Jul 2019 18:47:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5FC29F800C4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="jHfgK6HW"
Received: by mail-lj1-x243.google.com with SMTP id p17so24337063ljg.1
 for <alsa-devel@alsa-project.org>; Wed, 17 Jul 2019 09:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bs/QITWbhqAZxDhjSjDJdcwaHkIW+GS9/ueefoQtdFc=;
 b=jHfgK6HWw2DZSrGHtZx8q+g4s8uAJoOkBI1je+U1ttvkHW0Mdrp6NZXQuH1aruQFSx
 twKkQDDxOqu/Q4/dMSRAqdLHO/X0cO/85YFm15xb13DcnBDKOpx+XwUeXe6FWRzhStPO
 sbk8DyKpQRpE46tK3V8ZMUj0tCr0DNHzarWAbNUVVPz6H05hTdxahwmuspn/lKyuyqkZ
 4uKuARsDBm+5KUUAd58FdMaIJqUQEMqrMIB61DSbb9ErMSD/6+I2PnUQPQUiVmQ9UPQp
 z9LkKuDveVOm2f86NQK388zbUHEI0gV5v6r6uzFbVwD76WqHy0y+b7U1AJCboFSwFSWP
 nRCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bs/QITWbhqAZxDhjSjDJdcwaHkIW+GS9/ueefoQtdFc=;
 b=mJJfJ6wiA0mRM0J1Jo7G00uuOzPyagEubw6dZ36K/84G/SdjaL2kdrHsk5IzBTgNb5
 8sXVpdutu6K656nwe2bfWak07kNI3kln0bSo+PQhpYl0jVzrBuntvgLRGCSE1zt4G/RH
 SPk+xATa7KAEF9AHXOUfzjpBiaT/lwgETtDYOMLfQ3s04a/T6yn9cJftH2sYlzBE+y2k
 VITmlxgKddNOAARbs0xvt2nITmcoyZ7dqcnxWpuNGJHb/Oq9jXnwl/bb7h+VEtlku9g8
 2goSJUiYPK05XxpDfJ1dqRg7qL1a51tOM7CzN6GgxVX3Hm/g8dhSzgnaAmpbMrxoc8xc
 t52A==
X-Gm-Message-State: APjAAAVZmkpgvIQ436vpmd3eabhRU8n7j+XDY6N1y+SdoQC/rn7iWpVp
 sMJc+z19Qu/Xf3x/w3xVzSM/g66Ko191b75Mbww=
X-Google-Smtp-Source: APXvYqy+aNYb7anJn+W+Rf+NmIpi47qfolURZwZXuLoTi8QKxjWASrknRWjcO23N0nDwwtBGM6WVUZr4teTmVEJi7B4=
X-Received: by 2002:a2e:a311:: with SMTP id l17mr20833447lje.214.1563382039201; 
 Wed, 17 Jul 2019 09:47:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190717163014.429-1-oleksandr.suvorov@toradex.com>
 <20190717163014.429-2-oleksandr.suvorov@toradex.com>
In-Reply-To: <20190717163014.429-2-oleksandr.suvorov@toradex.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 17 Jul 2019 13:47:08 -0300
Message-ID: <CAOMZO5C=gYAZ4F2XOaTgCTRVyZdNSa5CEHsiVv7SsSgo5VfZ9A@mail.gmail.com>
To: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
Cc: Igor Opaniuk <igor.opaniuk@toradex.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>, Takashi Iwai <tiwai@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH v4 1/6] ASoC: Define a set of DAPM
	pre/post-up events
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

On Wed, Jul 17, 2019 at 1:30 PM Oleksandr Suvorov
<oleksandr.suvorov@toradex.com> wrote:
>
> Prepare to use SND_SOC_DAPM_PRE_POST_PMU definition to
> reduce coming code size and make it more readable.
>
> Signed-off-by: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
> Reviewed-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> Reviewed-by: Igor Opaniuk <igor.opaniuk@toradex.com>

Reviewed-by: Fabio Estevam <festevam@gmail.com>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
