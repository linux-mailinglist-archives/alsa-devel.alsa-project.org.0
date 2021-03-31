Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB39D34F85F
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Mar 2021 07:47:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E4701682;
	Wed, 31 Mar 2021 07:46:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E4701682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617169635;
	bh=VI6Q/Nh1b4DIrvycweRSWf+hhMNs5tXztHYkL03deTg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cYM6qLIsuC06RUWus0xVQvWuvKvhkpgXXhzz7U7FnkkxEkvgncNbVxLjDZhKKRmAJ
	 PoteaK8xmNxMuuRvjA0F7MpWnRhS9W3MHLLLowd6gIBUfjjP4WhvY7k6d/8GqKfob0
	 PSockRDNBllrH00d2tdCymEtV2AgUZlBJ6acXfuw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 83324F8014E;
	Wed, 31 Mar 2021 07:45:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 497C0F80166; Wed, 31 Mar 2021 07:45:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D2A4CF8013C
 for <alsa-devel@alsa-project.org>; Wed, 31 Mar 2021 07:45:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2A4CF8013C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="C0pfEXeN"
Received: by mail-qt1-x829.google.com with SMTP id i19so13690729qtv.7
 for <alsa-devel@alsa-project.org>; Tue, 30 Mar 2021 22:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ENJQTuGpOg2PGuhIpBvjiq5shyNy6TTKOL1C0EyRUZE=;
 b=C0pfEXeNRT+k078MHEQsTSqcE/ZuSIlGsqUNBOJ3zZKnmYB7CQdBhzj9Rb2My1vo3Z
 Ib1h60SwM+E42oulLXbGe/Zn9DQM0oDAhECJilU8/FGZZ/giC/gGmw8kWAb3dhCs0Qso
 Wx+YXUWjWH+qGrVV57j/pNYrsFx7Xq+WKKvtiRaRttG9n0DArV5+5Oxive+wgpvRqN24
 4PAcJvfKm5G8gSE61b8ONE7GZIV2RQGHqesMXHCpojY9hLc3U5DuvsegobJw+P4UW3Fl
 bicJIJZZA9lt5AQmgdv3nuammoSMGHVg5MeUY7jY14fh+F2vq3zRSwKAGNJOvgopMk0X
 iICw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ENJQTuGpOg2PGuhIpBvjiq5shyNy6TTKOL1C0EyRUZE=;
 b=INJSGv12j6pp7/IgWrsMFlCII4urT25lzNUwBCv1k9PnD4kwWvVP/HfQpe9UippgIC
 P6OAbHigKu283fbpmjx1Wej9pTbfgzXqp4S7VjYrxA02LgjLLcWPQPQ7eBYEMqYnWqRd
 NpqwqtHDZkUoBTR6ipA3ABdItjaKt26OVaStkM/ddWQxSXdHAc5rr4b/jBJ/SJYmVQvK
 GKdaUcT3LmbN2FWHTY9b+vhUmcmRFahWpEc+mlGMvgeEkuidWXTFGUAys7O3CkH0ILgf
 PC5w67sOTxm054SdjazW8CHzJ2oyc6ukeqI46p0KXjjk4G5YSF8vgYeIFRYVt0D1qeSj
 r3HA==
X-Gm-Message-State: AOAM5327kuz3aBrr+P9ik5i8LIGHOahqfYWgaHQwnaa8kVK5KOaws2Q0
 r/yRHzC5x5YjO+gnjSgL2ZW847YkQOb6V4cMYIY=
X-Google-Smtp-Source: ABdhPJyxE9ZLstaujwX5hCSI7d9qGQogybWrt0htcuF5gPVOhU10hvBHbEuoP3RBuW5fOUJXa1Ogwz+9M3BUJX4SrtQ=
X-Received: by 2002:a05:622a:34b:: with SMTP id
 r11mr1068920qtw.121.1617169539224; 
 Tue, 30 Mar 2021 22:45:39 -0700 (PDT)
MIME-Version: 1.0
References: <1617085972-6094-1-git-send-email-shengjiu.wang@nxp.com>
 <20210330150521.GD4976@sirena.org.uk>
In-Reply-To: <20210330150521.GD4976@sirena.org.uk>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 31 Mar 2021 13:45:28 +0800
Message-ID: <CAA+D8AP-LC=zmd+5uMG_Q371pg3RrQPrJkURCx4=f0juUpHrFA@mail.gmail.com>
Subject: Re: [PATCH 1/2] ASoC: ak5558: Add support for ak5552
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>
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

On Tue, Mar 30, 2021 at 11:06 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Tue, Mar 30, 2021 at 02:32:51PM +0800, Shengjiu Wang wrote:
>
> > +static const struct snd_kcontrol_new ak5552_snd_controls[] = {
> > +     SOC_ENUM("AK5552 Monaural Mode", ak5552_mono_enum[0]),
> > +     SOC_ENUM("AK5552 Digital Filter", ak5558_adcset_enum[0]),
> > +};
>
> It's a bit weird to have AK5552 in the control name - any reason for
> that?

Just to distinguish ak5558 and ak5552, but I think it can be removed.
will update it in v2

Best regards
wang shengjiu
