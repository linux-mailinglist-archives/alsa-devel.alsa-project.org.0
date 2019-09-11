Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D57E4B0367
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Sep 2019 20:11:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C88116DC;
	Wed, 11 Sep 2019 20:10:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C88116DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568225469;
	bh=Melv6FqRyNSombGB1jjuYJ5aSm57oplbfx29jY+fk/w=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Yd7c7BDMsVA8ZArpJNgDWBfhRU8pAAVJRlMUNhSNs87KegR4Idl8I93RKHShQ8PgQ
	 sJKWGSsjHOwXwMfL3QuWiua6HSMv8F8556Mne+txD+FFAZT+hUC9WOlWgFMDilRG0S
	 dIg29j07GlOLf0ADBlqHwLRurEc0phPq+rfk2VeU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AEE2EF8031A;
	Wed, 11 Sep 2019 20:09:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6C2EFF80323; Wed, 11 Sep 2019 20:09:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.0
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4970F802DF
 for <alsa-devel@alsa-project.org>; Wed, 11 Sep 2019 20:09:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4970F802DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="GfgYAZF8"
Received: by mail-qt1-x842.google.com with SMTP id n7so26416999qtb.6
 for <alsa-devel@alsa-project.org>; Wed, 11 Sep 2019 11:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Tg0YD2OXHO7pT/8IIoQxcxW27l4jDCA8b/rZf24QvjU=;
 b=GfgYAZF8gGunDa+rVxPUUvcbU/XyByE4IMw0bzJqQjwHB/7YWGofJxrTTPvgIh3A/i
 jeswUNzHI2r+A+98/KI5DXB0mORwquD6GdHsPkWxnmXOS/5MWIt05UjanaU4JTVGCe45
 lh+1CU0HaY5JpDkQY63z9aq0FuR6FLjE97Yymh37edRjoFvIwdigwWq9pd9Hc6w4YrQ3
 RstX3SdXl0Vejv9ByQuxfz9KHbiGcR2fAyIb9M1Unv0BWkOhKUlunS0OaW2j/zVIY5ii
 K1WnPcedrl7xRD+6z+IJQAaW22NjurNgd40drnm0lBVyJzVCm3O4FK709pHpZ7GTg0oW
 IHfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Tg0YD2OXHO7pT/8IIoQxcxW27l4jDCA8b/rZf24QvjU=;
 b=ZpjrJrRSE4q3I2AeyQo0YmoPahoOnWPQVdduvpymSd5vduR5DiQQae9RL3HZtX0PCd
 OzEnccgGUph61b+aAHePTFgKObSISCKA9PKcumsBFbBvYCTD6q48dp8LrokNWVJgsMwf
 M7eI+K/UQVhaQ7e296wOTM4rwZDIO0Ys5mcUDTweKegNMgbbOT4qbewYpM0JAYfRD4Jw
 WcoZP7TI8NS/BHwh2gAU9CT5yHEOsAZkm7OF9dEogwbDCX0YMn3CCjsiRoXeUYuIjQzf
 0Oy1zp9Jj/ZnAPBbQ3UikL97q7s7Ro5YGXr57zVWS3OmWuRZ/07RtVFcoeREaeShj7vA
 nivQ==
X-Gm-Message-State: APjAAAWtHeG6nxIf3HYW7vTbKGI/AOyIyZoizz+9FFDUhES532tWs8B5
 3JfCEwP5/BncIv+ehjLb5u44BFmZsHkQ9YNSsJ0DJQ==
X-Google-Smtp-Source: APXvYqxQ2oFJjldemI+2+Zq94CEi00FGlzrGcngjved6a+h19vJad1cGVfSkk0sfMBblXG1u7Ph61Epw3cF7M3SLGSk=
X-Received: by 2002:a0c:e592:: with SMTP id t18mr10300775qvm.24.1568225356840; 
 Wed, 11 Sep 2019 11:09:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190906194636.217881-1-cujomalainey@chromium.org>
 <20190906194636.217881-13-cujomalainey@chromium.org>
 <20190911105422.GZ2036@sirena.org.uk>
In-Reply-To: <20190911105422.GZ2036@sirena.org.uk>
From: Curtis Malainey <cujomalainey@google.com>
Date: Wed, 11 Sep 2019 11:09:05 -0700
Message-ID: <CAOReqxjjRQSKtdr1Lrm_Z5cMgjjyZQOGJKBRWU7_-oK49iwVcg@mail.gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Oder Chiou <oder_chiou@realtek.com>,
 ALSA development <alsa-devel@alsa-project.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Ben Zhang <benzh@chromium.org>,
 Bard Liao <bardliao@realtek.com>, Curtis Malainey <cujomalainey@chromium.org>
Subject: Re: [alsa-devel] [RFC 12/15] ASoC: rt5677: Transfer one period at a
	time over SPI
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

On Wed, Sep 11, 2019 at 3:54 AM Mark Brown <broonie@kernel.org> wrote:
>
> On Fri, Sep 06, 2019 at 12:46:34PM -0700, Curtis Malainey wrote:
> > From: Ben Zhang <benzh@chromium.org>
> >
> > Rewrite the ring buffer transfer functions to copy one period
> > at a time then call snd_pcm_period_elapsed(). This reduces the
> > latency of transferring the initial ~2sec of audio after hotword
> > detect since audio samples are available for userspace earlier.
>
> This is fixing an earlier patch in the series, why not squash it
> in?

Definitely can do that, I originally only squashed all the bug fixes
in. For v2 I can also squash any rewrites like this one.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
