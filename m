Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EBB215586D
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Feb 2020 14:29:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B782167D;
	Fri,  7 Feb 2020 14:28:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B782167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581082145;
	bh=m6yQQpjwuldkBuC8h8d9+rUmXropqMHLCfAvkRt/qR8=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Jt3J1SUS5XWRPEYK2is/dflEhv1oRYFR5YEJQ6zxL4JL3t5qVc/h35d65iOiOrCCp
	 9W4yr4ymujNUrK1Typ60iKLLqO29hvmS0DUlWAXn5IpMq+1HQNmELd2ZE1VMcuVuxV
	 4DVE85F8Vpa2LotY3tlqP8jbGWIMnhdOanOBC6rM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74EC0F80142;
	Fri,  7 Feb 2020 14:27:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D690DF80162; Thu,  6 Feb 2020 19:05:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 06F02F800C6
 for <alsa-devel@alsa-project.org>; Thu,  6 Feb 2020 19:05:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06F02F800C6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="TB8w4JAK"
Received: by mail-qk1-x743.google.com with SMTP id 21so6441387qki.5
 for <alsa-devel@alsa-project.org>; Thu, 06 Feb 2020 10:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=49S47XoQqXwXHsFOLx6ntP9UXJ87XOcROvuRKpQ4giE=;
 b=TB8w4JAKd0wFrHjCM/EmjDXBTE3zK6HJRd22wZ0xRFwxDAhId7cXcDNBjK8pUIeto3
 w1oU5hSyIlXe5eR0QKfmpOHRUwAOileTKzrf2RpDfiaxMhdwTQQFl7NjYsjA8sxJabM1
 NjipRNsz3VyuEpl16r+7wiVvrzpj2HRfM3BvqfNFw2kdZGoX0jrf/vLZV2abc/cdD5Fm
 70l6LCDmbKOa55G5Wdqlc5fn9kib4uPRP7+3gPTZ0hDpnaKVFU88eoqme9xeTncJLjpL
 u0PT1fTEomStoBQBaLHmK2Af1BCxvbNArNpQMDPn/9pCuaDo+MKkesp0Ch09bZuo0SAQ
 y8fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=49S47XoQqXwXHsFOLx6ntP9UXJ87XOcROvuRKpQ4giE=;
 b=LzRClvdjEB5Xg1UiskkfSliK48EB7vrKl//dXCXqO8iXqh4dK38ALOwRXKzQ/HhGvF
 f3puY1iY3QhBGzEoSg3YCWYRQK5OFe6xxMUEl60DeZmSd1ypYKWcAUlUsZVWbPTbPmEF
 jFt+N3ZU7sgRsUmz2Bq3X8RsxKOJ1xR9+QgD+tzA88ZMjopHbmZ9Ys8RoQhgVNusgaYe
 yilqYe2DC5TmF07bjEclMgXu6ODRtqKcukrI3yv8K35WJ8/slwvpUVns5O9cmR1c/RE2
 N3I4za448QdADTpi5Doo+4SgKN3ExijqSENvS45HRDSZfE/VhZca9tpnAZGR8aeVbVW+
 7W+w==
X-Gm-Message-State: APjAAAWJ/MIFnuSsVOyDSVnEXZqcrBw/GNKllu4IP/JN8EEUcMY6TpxG
 EY0zI+PZPRH+JY7wTUqtukfnBIqa+ZFcNs6fv/o=
X-Google-Smtp-Source: APXvYqxafw1KYCRW+g1pUzcBJs4USC+9damKNSPhYvm1gHT6c26z+rVK91B/8GCMIMexX8ouo9DdPR/UMU4gcePBv2Y=
X-Received: by 2002:a05:620a:143b:: with SMTP id
 k27mr3509139qkj.262.1581012338688; 
 Thu, 06 Feb 2020 10:05:38 -0800 (PST)
MIME-Version: 1.0
References: <cover.1580950046.git.robin.murphy@arm.com>
 <29a846da33c02df64eca62b5fa0f3884652f788f.1580950046.git.robin.murphy@arm.com>
 <20200206114606.GM3897@sirena.org.uk>
 <ad2c941a-9724-510e-959f-3cca3cab1dc2@arm.com>
 <20200206135718.GQ3897@sirena.org.uk>
In-Reply-To: <20200206135718.GQ3897@sirena.org.uk>
From: Peter Geis <pgwipeout@gmail.com>
Date: Thu, 6 Feb 2020 13:05:27 -0500
Message-ID: <CAMdYzYqTEnG_Q-8SvO2R6PeaPXQ3VBKu6iVYhYvb=wK7tT7c3A@mail.gmail.com>
To: Mark Brown <broonie@kernel.org>
X-Mailman-Approved-At: Fri, 07 Feb 2020 14:27:21 +0100
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Heiko Stuebner <heiko@sntech.de>, lgirdwood@gmail.com,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH 2/3] ASoC: rockchip: Make RK3328 GPIO_MUTE
	control explicit
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

On Thu, Feb 6, 2020 at 8:57 AM Mark Brown <broonie@kernel.org> wrote:
>
> On Thu, Feb 06, 2020 at 12:36:04PM +0000, Robin Murphy wrote:
> > On 2020-02-06 11:46 am, Mark Brown wrote:
>
> > > This makes sense but it is an ABI break so is going to need
> > > quirking for existing boards that unfortunately rely on the
> > > existing behaviour.
>
> > I guess the existing (mis)behaviour could be predicated on an
> > of_machine_is_compatible() check for Rock64 boards - it's ugly, but should
> > do the job if you feel it's more important to be 100% strict about not
> > regressing supported systems for any possible kernel/DTB combination.
>
> Yes, that's what I'm suggesting - we don't need to be exhaustive
> but having an obvious place for people to put the quirk in if
> they are affected is much better practice than just silently
> letting things break.

Might want to put a warning in there too, so that if someone is paying
attention they will see that they are using an out of date device
tree.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
