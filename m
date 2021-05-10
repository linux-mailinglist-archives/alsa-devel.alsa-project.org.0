Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E647E378A16
	for <lists+alsa-devel@lfdr.de>; Mon, 10 May 2021 13:53:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7018B16AB;
	Mon, 10 May 2021 13:53:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7018B16AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620647635;
	bh=OGnNYM5nsoTkN/9Vy/5lWlNGUdYVVDyGMH4Q4kFLpFE=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vGUyn4nv86anH7TuSreOJ/lQtEyiuU2430Q7ALCR6ondBGhtn/5enTOUvvHu7QKK6
	 ViHGXauRgkZsuvcr+mF6rJZn/Q/imgCnrf/pmWM0Gqt4cST8qpHKw+TyAIaCNs7+RO
	 /87SkBCj90Pn7OhpH64gJZzkam3FktSiqkCbXQrQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C5E46F800E9;
	Mon, 10 May 2021 13:52:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 62C8BF80240; Mon, 10 May 2021 13:52:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ssl.serverraum.org (ssl.serverraum.org [176.9.125.105])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 10474F800E9
 for <alsa-devel@alsa-project.org>; Mon, 10 May 2021 13:52:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10474F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=walle.cc header.i=@walle.cc
 header.b="aJ87l8l+"
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 5675322239;
 Mon, 10 May 2021 13:52:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1620647543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yO4AK8WNlzpOysSwYhMdNTxh6p0zS+xaRzCx4D02VTA=;
 b=aJ87l8l+za7++bQhHM8uOwBLK2wipB1v1+sZx34XkEkmjZHOv75oGC1IDaKjYhbCW71sEx
 pumTU78vNkCc0/3mJpbDWKIuAN9pKWtEZKYHgp+s552bdDH5W9F4pN9yl3O7xwd2dNhHPZ
 Xt/zqwgvO0o4O2tu8faj/8U4oUrSDKI=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 10 May 2021 13:52:22 +0200
From: Michael Walle <michael@walle.cc>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: broonie-sound/for-next bisection:
 baseline.bootrr.asoc-simple-card-probed on kontron-sl28-var3-ads2
In-Reply-To: <87o8djcxas.wl-kuninori.morimoto.gx@renesas.com>
References: <6080e82c.1c69fb81.cd60c.2a13@mx.google.com>
 <3ca62063-41b4-c25b-a7bc-8a8160e7b684@collabora.com>
 <877dkp5141.wl-kuninori.morimoto.gx@renesas.com>
 <20210426144242.GF4590@sirena.org.uk>
 <8735vc4r59.wl-kuninori.morimoto.gx@renesas.com>
 <20210427101926.GA4605@sirena.org.uk>
 <ea2b6dae-3087-67d3-8473-410255a51e23@collabora.com>
 <e20b9c8a2715b5d091a8d1f37ba890b4@walle.cc>
 <20210427135703.GH4605@sirena.org.uk>
 <cc9a39f977c3765d1060ab1b0038bc79@walle.cc>
 <a1ec388def4febd9af6ef477245ef2d3@walle.cc>
 <1aa3a8716d2416f0cc127737dcff092a@walle.cc>
 <87o8djcxas.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <99b3cd8db134d9682c16784f75f40bae@walle.cc>
X-Sender: michael@walle.cc
Cc: Jon Hunter <jonathanh@nvidia.com>, alsa-devel@alsa-project.org,
 Stephan Gerhold <stephan@gerhold.net>, kernelci-results@groups.io,
 Guillaume Tucker <guillaume.tucker@collabora.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Heiko Thiery <heiko.thiery@gmail.com>,
 Thierry Reding <treding@nvidia.com>, linux-kernel@vger.kernel.org
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

Hi,

Am 2021-05-10 01:16, schrieb Kuninori Morimoto:
> I'm sorry for my late response. Japan was holiday
> 
>>  _But_ later
>> asoc_simple_canonicalize_cpu() will reset the dai_name pointer to
>> NULL in simple_parse_node() if "single" is 1 and then we end up
>> having two links with the same name.
> 
> Ahh, OK thanks.
> I think understand that why my posted patch
> (= 59c35c44a9cf89a83a9 "ASoC: simple-card: add simple_parse_node()")
> breaks your board.
> 
> I will try to fixup the issue.
> 
> Thank you for your help !!

I've just tested your new patches. Unfortunately, it was very
successful. I've also traced the is_single_links and it is still
1 for this board. Is this correct?

Still these two questions are open:
>> Which begs the two questions:
>> (1) What is "single" actually and when should it be 1?
>> (2) If single is 1, then the sysfs file will be named 
>> "(null)-codec-name".
>>     Do we want that?

-michael
