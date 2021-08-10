Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 48CDF3E86A3
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Aug 2021 01:42:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1A4A174C;
	Wed, 11 Aug 2021 01:41:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1A4A174C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628638943;
	bh=DYZFrN34R7rOo+g/YwqbXO0mIX/HfiFMHS+CXitqwow=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CwN6LXKSLEIuq/r1m7YG0t/pL2PgSrxPhsGKvH9O8mepWeH1lqMQtAqoLPB7Czy0h
	 /hzf+hi2OkO74J4q7u876de242S5lxoaOmWD/wS0nJIfz7zA1x7BWrCUgxL1zKCse1
	 h8CzIHHfVnWMXYfL35Ln3bdNDB0go/7eT0ocNf6A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D961F80279;
	Wed, 11 Aug 2021 01:40:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0EE8AF8025D; Wed, 11 Aug 2021 01:40:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8F132F8016B
 for <alsa-devel@alsa-project.org>; Wed, 11 Aug 2021 01:40:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F132F8016B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="mrDjZbW8"
Received: by mail-qk1-x729.google.com with SMTP id c130so361194qkg.7
 for <alsa-devel@alsa-project.org>; Tue, 10 Aug 2021 16:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DYZFrN34R7rOo+g/YwqbXO0mIX/HfiFMHS+CXitqwow=;
 b=mrDjZbW8luAfOzdLqvEUEnMgJBDL/i4fwaDIgyYM+Q+HA+KWpWJ/B0QJCkC9CRRK4D
 MyYTDpAHJdL+zfA9+SE4NWSVihuEyFBSJJExqZBRnINjr62HRDrl2ot22Plkz5HXBArq
 qWbEVvbW/lxG/tDKfmEL6njXIJspjjfxjSY+bD6AaCxxQh+DR78mKZav53H76TKu8Qlv
 UZrD1YOZeHb0MFS91YREOE5HF0aIvR8tFWvWAZrLwBBsJ6OMEKkFQGhylgMdq7p7ilVK
 kyU6MjSSxS8JU+OT9IavYN3Cfq0EB9938pqjqdrJR2IS44bleSHfRRx7jzeuqu+LMCjk
 l/Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DYZFrN34R7rOo+g/YwqbXO0mIX/HfiFMHS+CXitqwow=;
 b=oeBEkyc+d9Wo0GMJj8HV5PnQzH8gEiX2zG1PXu3u6GQtXc/nzSLetbafGygV4HiBJq
 LN1SAkeiqhHDTTSjKtV4rjRof/qaLJrYGVqQKgwmFiLMEWkCSJdcjtX5Vn+jwTzjfykC
 +1T3gLAtKU+8Xmzc6TASuZHKjN3yyefS73/+ZmN/SuOw0/ygoc1Q9AbNJVY9CCRi+ILU
 QTpTVFPLep6SWVTi4Q6h37Y9zT722KmQPmdYUVdQZR6maa2ZnUNFBgOgXPJdc/z+4GjN
 /qCIZ1JkmNXwmmXyBC36/NQRu5ZEKPlTr5FrOmDjxB74dwmYsa5pIVYXTu/vwNAjxRGu
 /x6g==
X-Gm-Message-State: AOAM532ddnRv2dbVB9VUFbz2f4+fRa8u7ny3epOltljBOzoKLCTI4+J7
 7Lz5p+ysKvwmPz1c7vyrAOctDc6f3wRKKlXmhy7rPA==
X-Google-Smtp-Source: ABdhPJyAScq4fbwbWobrMzJE2aa3FBaQV2vjnfa9A8yHOc/d38Gdm/aW+PcsqPy9JcgPHO/l228EFhXbLqaSgHGXOAY=
X-Received: by 2002:a05:620a:cea:: with SMTP id
 c10mr7602554qkj.238.1628638843130; 
 Tue, 10 Aug 2021 16:40:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210809213544.1682444-1-cujomalainey@chromium.org>
 <ac87ebd8-d10e-450d-80bb-3fe29554b73e@intel.com>
In-Reply-To: <ac87ebd8-d10e-450d-80bb-3fe29554b73e@intel.com>
From: Curtis Malainey <cujomalainey@google.com>
Date: Tue, 10 Aug 2021 17:40:30 -0600
Message-ID: <CAOReqxg3MOUeE+9j+Ph8CDy-6X2CjYMUsLvRqEex2M1XGkFffw@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: Intel: Fix platform ID matching
To: Cezary Rojewski <cezary.rojewski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 ALSA development <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Paul Olaru <paul.olaru@oss.nxp.com>,
 Curtis Malainey <cujomalainey@chromium.org>,
 Rander Wang <rander.wang@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Matt Davis <mattedavis@google.com>, Brent Lu <brent.lu@intel.com>
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

On Tue, Aug 10, 2021 at 5:23 AM Cezary Rojewski
<cezary.rojewski@intel.com> wrote:
>
> On 2021-08-09 11:35 PM, Curtis Malainey wrote:
> > Sparse warnings triggered truncating the IDs of some platform device
> > tables. Unfortunately some of the IDs in the match tables were missed
> > which breaks audio. The KBL change has been verified to fix audio, the
> > CML change was not tested as it was found through grepping the broken
> > changes and found to match the same situation in anticipation that it
> > should also be fixed.
> >
> > Fixes: 94efd726b947 ("ASoC: Intel: kbl_da7219_max98357a: shrink platform_id below 20 characters")
> > Fixes: 24e46fb811e9 ("ASoC: Intel: bxt_da7219_max98357a: shrink platform_id below 20 characters")
> > Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
> > Tested-by: Matt Davis <mattedavis@google.com>
>
> Thanks for the update, Curtis.
>
> This is still missing Suggested-by tag from my previous review.
> As kbl bits were tested by Lukasz it would be good to have his Tested-by
> tag too.
>
> With said tags appended:
>
> Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>

Ah i was not privy to that patch, this bug was found independently on
another board. Thanks for the heads up though.

>
>
> Regards,
> Czarek
