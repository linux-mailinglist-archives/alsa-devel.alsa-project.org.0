Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F108E22312D
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jul 2020 04:30:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C5121661;
	Fri, 17 Jul 2020 04:29:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C5121661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594953004;
	bh=T4SnQQwCUL1+Ws4n5qSLwbFV8PkhP5MdnwWQfIHxhKk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YqUTSeGqavONHUHVB2zF3u86M2fxrhkwbNxyN5Y63C6SSXjgHOzM2IdqrZQCn46qx
	 NZICuIxLOw+DSgtNb0d1u+w0rHzkLGpw7cdbczY/ywj9ndjlAkjiLyvoqRcu7gveSb
	 k6JgOrAkJdTgsoeU5xVIA6zXFNRlaW6YtFWpJp+8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7BA4CF80110;
	Fri, 17 Jul 2020 04:28:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5FE73F80217; Fri, 17 Jul 2020 04:28:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3D66DF80110
 for <alsa-devel@alsa-project.org>; Fri, 17 Jul 2020 04:28:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3D66DF80110
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="pK0YzL/+"
Received: by mail-io1-xd2e.google.com with SMTP id e64so8756371iof.12
 for <alsa-devel@alsa-project.org>; Thu, 16 Jul 2020 19:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EwKnezkZmfj9xSK2I7Np/Cq9fStgMNgGCEPRKMrkZgg=;
 b=pK0YzL/+VoEc9RbtIE4MAdPH6e/eRtYLdOsJ17ftSBoq+EC7O8ZhuWfsLPHDHrum2c
 5+/6iKaTc+7nr4WpOApibTRbkHGe67pbIy8Wr8MnLqmdzldYIWQ562489SNqWGEXg9sY
 9PKj0RH4KB0YBotDm5jyoBdsmTFucgtBrylogM0a6D0j4aN2ELWDR6ifYCaz2NAkIzc9
 bGCLyqe7OTJWxYM1QZfHDFZ7dMasGvjiROrF1ROv4JeULqBTb+YNS4XkUsgX3Sk8oF6+
 dcja/vjVwcoPV2z1wGuwyo0FqBycG2HWV16BSgJIobQhXbSgx7diq1588VJuQ/8AFOcO
 yIoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EwKnezkZmfj9xSK2I7Np/Cq9fStgMNgGCEPRKMrkZgg=;
 b=OZQWLmYp1wU4pww8ruLfNc90ATecGE2uMd1QHh6LKIyXHOxnZ4cNWVL9APUZaKnKWa
 jO/DWhZYfPEqpywfWXq7gi00OpZilC7Wtl2ESYOYIOZvs30ZkczfZpWAeDV9SRn/pp+M
 P8T7DdV6H2BjaDKVWPBXbRyVKi/hIxbf82paj1UYY4n1uFJdRHcRrSaR/+rSrlKxyFWO
 pXT4LT8Ddhs2dkglQ00BQesHlT1q0eUJzUVSnDOxJ3EJqskM9oMXIcyAhwO0f3BQg7SZ
 BWZfGwMN8CXnaXe+h3ZZVgcW0pr0QusAM/caDbc9N5CFnOa80NoqVQ0Nu8o+3fJuiJy0
 iSBA==
X-Gm-Message-State: AOAM530w8fVpYdWu+Rh1y7ZTQa+trv9mAdK6VtGoq3GjMx0iOKCxNB91
 OKY3YBFYLeBA7bCr/MZ8Wc2ODrjUg9F9DDxAofiR/Q==
X-Google-Smtp-Source: ABdhPJwA/sVne09DkT+LeHF8Jc0F1elpnQ4UzEIOk1KUc0aKKTxI2tLk0/2H+Qv+UAbF+LC1ffXV/3jL+0/3EGvt9Ws=
X-Received: by 2002:a6b:d301:: with SMTP id s1mr7361674iob.146.1594952882572; 
 Thu, 16 Jul 2020 19:28:02 -0700 (PDT)
MIME-Version: 1.0
References: <f2ca985f-7dbd-847a-1875-dd0e1044ef02@gmail.com>
In-Reply-To: <f2ca985f-7dbd-847a-1875-dd0e1044ef02@gmail.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Fri, 17 Jul 2020 10:27:51 +0800
Message-ID: <CA+Px+wU1S1EqtW-yZH9z9aCF3ggSriBqy73SRYy8q61x0GkdQQ@mail.gmail.com>
Subject: Re: Speaker pops with max98357a on rk3399-gru-kevin since v5.7
To: Alper Nebi Yasak <alpernebiyasak@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Heiko Stuebner <heiko@sntech.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-rockchip@lists.infradead.org, Mark Brown <broonie@kernel.org>
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

On Thu, Jul 16, 2020 at 7:49 PM Alper Nebi Yasak
<alpernebiyasak@gmail.com> wrote:
> I have been getting "pop" sounds from the speaker on my rk3399-gru-kevin
> for a while, and bisected it to 128f825aeab7 ("ASoC: max98357a: move
> control of SD_MODE to DAPM"), but looks like the pops were somewhat
> expected:

I am not convinced the pop comes from 128f825aeab7.

> As of v5.8-rc5 I'm still getting the speaker pops. More info below, but
> not all pops coincide with "set sdmode" messages, and vice versa.
> Reverting that commit stops the pops, but then the "Speakers Switch" can
> no longer mute the speakers.

(I don't have a rk3399-gru-kevin so I got another test machine with MAX98357A.)
(I was testing with and without an audio server.)
Observations:
- I can hear the pop either with or without 128f825aeab7 (with and
without sdmode-delay).
- The pop noise is not always.  Higher probability after stopping
playback than before starting.
- As you also mentioned, the pop noise is not directly related to
SD_MODE transition.
