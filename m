Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46607ADC7F
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Sep 2019 17:52:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE11B165E;
	Mon,  9 Sep 2019 17:51:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE11B165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568044358;
	bh=qc+G/5TpT++uJ9hU57fakfWuwMqLC3fmlmjUCXoGU94=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bipoHhPxwl/e3LyQ+XFlZ+iLxqoLiNPbSJHKUZa4T16RCOeTzBoHyG3J9DoVL+vCl
	 JuqBeuOH3bV1iNJpBSQ/TGn5iRnwPA87PwDnXKwkF8OkRU6fnLM5wMZE3RH4LJwZLi
	 H+ODWibWHrMlTThHlkQgx5B3PwEVgnSgakT6IveQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ECC6EF80094;
	Mon,  9 Sep 2019 17:50:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 544A3F80323; Mon,  9 Sep 2019 17:50:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.0
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A9797F80094
 for <alsa-devel@alsa-project.org>; Mon,  9 Sep 2019 17:50:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9797F80094
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="lC+cp9BN"
Received: by mail-qk1-x72d.google.com with SMTP id o11so13533669qkg.8
 for <alsa-devel@alsa-project.org>; Mon, 09 Sep 2019 08:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Whq92RMWvvWOFqL3cMJEMEw9upOgAoKf1e5pG8C4VOY=;
 b=lC+cp9BNoaOM/oWbyR8oD9L4fSFvVo+4IevYjCiY8uPxx3E/JhBZLPKGgit07ULOqS
 4OsyqnjFKjdZ3gq2MvYHWE7bV6oj7Gme/Dc0sa7c0k64TTxEfwRXMFcqaMymxEi+FRCe
 uoPT3uXjz0CzoW4Q+W20Cy+hCvfKWhThrxDXPGIzUa2tw+8XE6nyPInH4c2JHTo3XeHO
 ZWSJDUQsxfsqGm4VdUwym0HZ8/6PBgXhI2b5SSROYruqGmciNtSQ5FSd0nmed64CQA4/
 xCspNRw3NRxdxNF9Y/eJ9QHvyh0KZOBos03cvgzaE5JkngjhT2QKz4uMa7w2uXA78p5W
 YzPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Whq92RMWvvWOFqL3cMJEMEw9upOgAoKf1e5pG8C4VOY=;
 b=PuxGEMOSEouJM93kNSSLs78bEg6jUKFAtNpEaW+2WLvfXRzlRbw4uGeGEs50lU4bYm
 T4DBFThKPSPXEqWDNcjqAxsg+lsUwMq4VhyD3Jsv8bEm4kvaHmhucxbi8zDeqKX8Nslz
 e6S3PZs/Oogq0n0Em+Az+7kFeLIFRXYxAT/ppE3YL8Whh4i8LIkq3YTv658CkS0LdKfz
 1PwffZleKj9fMBHqRSGynKnlj9UCVfX9AKDs1zBG/r8MTTv1dihq9M/yT/ropzTbh8oc
 aqrTyNUecHqfpfXpVihb2jT6EhHDCNHsjQpi0cla3k5ticvpC6mEsMTJKLoqL7fmvfEX
 oPOA==
X-Gm-Message-State: APjAAAV05dQ/6QegBDCoFG6s9ALa/sB6Tp8y8PAvYk+I1qaI4QFpmt3C
 IOGk/H2GAIJZFDVkPfBqFut8hprzXHq84yM+2Eki2w==
X-Google-Smtp-Source: APXvYqxtNtlPMpLl2QhXAKD9GzPzYv1jpoHO8k3jnH9yACXIqJd+oaQ2f4FE32G0otIK7fV/NlUadXME41Q7Muo7gzQ=
X-Received: by 2002:a37:a106:: with SMTP id k6mr22748487qke.158.1568044245494; 
 Mon, 09 Sep 2019 08:50:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190906194636.217881-1-cujomalainey@chromium.org>
 <20190906194636.217881-3-cujomalainey@chromium.org>
 <20190909095405.GA24341@sirena.org.uk>
In-Reply-To: <20190909095405.GA24341@sirena.org.uk>
From: Curtis Malainey <cujomalainey@google.com>
Date: Mon, 9 Sep 2019 08:50:34 -0700
Message-ID: <CAOReqxhrc7R9-ReuBggcHqiAGjuqxpON-fR+4gMxyBagPczhxA@mail.gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Oder Chiou <oder_chiou@realtek.com>,
 ALSA development <alsa-devel@alsa-project.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Ben Zhang <benzh@chromium.org>,
 Bard Liao <bardliao@realtek.com>, Curtis Malainey <cujomalainey@chromium.org>
Subject: Re: [alsa-devel] [RFC 02/15] ASoC: rt5677: keep analog power
	register at SND_SOC_BIAS_OFF
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

On Mon, Sep 9, 2019 at 2:54 AM Mark Brown <broonie@kernel.org> wrote:
>
> On Fri, Sep 06, 2019 at 12:46:24PM -0700, Curtis Malainey wrote:
> > From: Ben Zhang <benzh@chromium.org>
> >
> > Instead of clearing RT5677_PWR_ANLG2 (MX-64h) to 0 at SND_SOC_BIAS_OFF,
> > we only clear the RT5677_PWR_CORE bit which is set at SND_SOC_BIAS_PREPARE.
> > MICBIAS control bits are left unchanged.
>
> This is a bug fix so should have been at the start of the series
> rather than depending on the naming changes you had as patch 1.

Got it, will send bug fixes to the bottom of future series.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
