Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 034014D2DC
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jun 2019 18:10:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F9E3851;
	Thu, 20 Jun 2019 18:09:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F9E3851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561047020;
	bh=+OZsQ6bIpe+44DL8lE9jqyxySNauuSJRGcelrXeahyM=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RM50Jy5IiMYEBCNQRLhP7Jpk2OPS2XOlnqGxF6WKhMDL9yCSQf49w1pOHwJd3mb32
	 4JYMpMSwJhArXMZWQMasnDdLx+lIGTy69n486JzpDcr4DqIORFB7VFHhPmGgFU+EgF
	 IwkEK4wKBHD0Wl551xzGL3nixmXSeHJKWPUShoHk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E557F80C15;
	Thu, 20 Jun 2019 18:08:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 733ABF89717; Thu, 20 Jun 2019 18:08:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AF3DFF8070D
 for <alsa-devel@alsa-project.org>; Thu, 20 Jun 2019 18:08:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF3DFF8070D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="CCS/nz0h"
Received: by mail-qt1-x841.google.com with SMTP id d17so3700012qtj.8
 for <alsa-devel@alsa-project.org>; Thu, 20 Jun 2019 09:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZRLTstn1uH4xoAiOrvyBM/9FFvAo+8BIlcktIv+nkjc=;
 b=CCS/nz0hku8hGuhkjK6KYWjdMpaGphU8wH+TZBBIxWr/1ytT908qf1jGJmv50EUhid
 cCpSZE7w14Dz7/3e/Aec9rzY381NRnLSowrPG1josN80sE6k3/A4lHcde1d3MIib86ur
 ohblVxNSesRF2PSufua7wr2grW3EkYbDrYavkYg8WOt0krt90YqiMMSQswxjhHqoy5Je
 kp81zHJNTw88zKOCPlap6NwUr6MMRZxkCAvrD2QVm+IcriRMWt+Vm6E4skL3tDYG0QTG
 57UR5XfLCaCa1b7dq0eDLTbNmn70CklbJHSBczdlMycBQPZhLGCyL7ZKRQjgLTxqr0e6
 opeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZRLTstn1uH4xoAiOrvyBM/9FFvAo+8BIlcktIv+nkjc=;
 b=dNTuTfXqyjOCMo/3xHEi7NKy7IQiM4q+G2F8P2RHQaY1KfKZEBzYcYcmsWty7jK4mV
 nj2H+r4pRitSpRo2JYMoQYFW+WVaRtW7SEpKJ+9yMQ25V055QLe+XLT7kahHwUkt3HNG
 PZMK0bHWB4pcOM7FB1HakNJ0JN1e2DxEVdqVXZ9hoRxQWvBkykixRMfxDBdJoL+U5VIq
 k6aIpVl16izRRz+VRv1CYo9y2cS00wjcb+/H+qMJrutVriAGBHs3Gb/l/ZWhWx8969DA
 TiUnc1SJpJKncxvcqaUu7FPJ1GCGa+iAM1JWBrIo/TKSlxobod+fzCUW8y450jiPoWqq
 7c1Q==
X-Gm-Message-State: APjAAAVuEhdDpi/DbUtxdrbsSDrKm0pzHteuU03Uz/OgHsXPqIzATPWm
 5EzgMGJW5HdzhLWj7tvm33EZuWyU4EeHAvZiY0M=
X-Google-Smtp-Source: APXvYqxHBeodrFoAFIOXLEADpgqqMN5M0vUe2+Ac9VSRt+mgyN8DSm5aKvJf8irOp9uottIdu+z7UBTkzQVBY5AJPbU=
X-Received: by 2002:ac8:2439:: with SMTP id c54mr80219281qtc.160.1561046906007; 
 Thu, 20 Jun 2019 09:08:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190620134708.28311-1-enric.balletbo@collabora.com>
 <20190620154150.GE5316@sirena.org.uk>
In-Reply-To: <20190620154150.GE5316@sirena.org.uk>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Thu, 20 Jun 2019 18:08:14 +0200
Message-ID: <CAFqH_50RN0xXfzMDNRjQpk8egCEcxH7NEXr8KVYsh04mSLQEiQ@mail.gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, Collabora Kernel ML <kernel@collabora.com>,
 Heiko Stuebner <heiko@sntech.de>, Xing Zheng <zhengxing@rock-chips.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Benson Leung <bleung@chromium.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: rk3399_gru_sound: Support 32,
 44.1 and 88.2 kHz sample rates
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

Missatge de Mark Brown <broonie@kernel.org> del dia dj., 20 de juny
2019 a les 17:42:
>
> On Thu, Jun 20, 2019 at 03:47:08PM +0200, Enric Balletbo i Serra wrote:
> > According to the datasheet the max98357a also supports 32, 44.1 and
> > 88.2 kHz sample rate. This support was also introduced recently by
> > commit fdf34366d324 ("ASoC: max98357a: add missing supported rates").
> > This patch adds support for these rates also for the machine driver so
> > we get rid of the errors like the below and we are able to play files
> > using these sample rates.
>
> Does the machine actually need to validate this at all?  The component
> drivers can all apply whatever constraints are needed and do their own
> validation, the machine driver is just getting in the way here.

I think you have reason, I'll test by removing these validation and
respin the patch.

Thanks,
~ Enric

> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
