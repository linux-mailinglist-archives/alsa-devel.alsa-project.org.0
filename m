Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A3525C83C
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Sep 2020 19:51:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CDE561931;
	Thu,  3 Sep 2020 19:50:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CDE561931
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599155491;
	bh=PwReb1wR+sXRrMZqogs7x9Vmd4V3JF81RZqSgbUS1AE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GyIvz3TmSdbCgR1eBuCp8HKjlsdgQ653dlwqm5I0Ew6yweh0qahMI8dfnUxgWNx1u
	 SvgSZM5lVCcT9VKxFGTt/kj8Qldm5or3jjkVGZjM7BggLUQJ/sdZ5eJUme319Rv7NY
	 sLMUA6IBcFdGo6gqsOteij3wBc+koGmcjvMxy2eM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F2858F800BA;
	Thu,  3 Sep 2020 19:49:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 78DC9F80217; Thu,  3 Sep 2020 19:49:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DE507F800BA
 for <alsa-devel@alsa-project.org>; Thu,  3 Sep 2020 19:49:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE507F800BA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qhrzzXdX"
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com
 [209.85.167.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BAB05208C7
 for <alsa-devel@alsa-project.org>; Thu,  3 Sep 2020 17:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599155377;
 bh=PwReb1wR+sXRrMZqogs7x9Vmd4V3JF81RZqSgbUS1AE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=qhrzzXdXDKnCyd4Ckt/77e8sctFd5/zYPH/VxgZ1/a3GPpMD09GHyD0nzB2isro/N
 CLCo7KfDkZiv70y2C0tz52eyPXiISAUHCs3HVDSAjhHtv9ku6kQjyGOED0vwfNgQqd
 MwMREmEHc0mscFdXBzHIH18iNkgdgAaOuIbmvTb4=
Received: by mail-oi1-f169.google.com with SMTP id z22so3994732oid.1
 for <alsa-devel@alsa-project.org>; Thu, 03 Sep 2020 10:49:37 -0700 (PDT)
X-Gm-Message-State: AOAM531leTzOIdzx5py9d9RBa8U8FW3XkMZ3Ue6TEyzN8ztCyyUUJwhz
 dClBJtus6Zx2XmDCC96Regl6odUsGzDvmIhCtg==
X-Google-Smtp-Source: ABdhPJxcXEUSmdKY5Vsvo/Ra42Hgg8KjgnWOfsPDJWq3O7EXceTqI+C/z4ChNMurrb2zF+obJSMgWjL333ToKOp8kaE=
X-Received: by 2002:aca:1711:: with SMTP id j17mr2842660oii.152.1599155376930; 
 Thu, 03 Sep 2020 10:49:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200830112633.6732-1-krzk@kernel.org>
 <159897179515.47719.6003518135515395142.b4-ty@kernel.org>
 <20200903164738.GA2929052@bogus> <20200903172645.GC4771@sirena.org.uk>
In-Reply-To: <20200903172645.GC4771@sirena.org.uk>
From: Rob Herring <robh@kernel.org>
Date: Thu, 3 Sep 2020 11:49:25 -0600
X-Gmail-Original-Message-ID: <CAL_JsqL+_5Lc5vwtqnCZd6Tz9eB1m_oy2r3gtv0cbwBwKTU=dw@mail.gmail.com>
Message-ID: <CAL_JsqL+_5Lc5vwtqnCZd6Tz9eB1m_oy2r3gtv0cbwBwKTU=dw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: sound: midas-audio: Correct parsing
 sound-dai phandles
To: Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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

On Thu, Sep 3, 2020 at 11:27 AM Mark Brown <broonie@kernel.org> wrote:
>
> On Thu, Sep 03, 2020 at 10:47:38AM -0600, Rob Herring wrote:
>
> > > [2/2] ASoC: odroid: Use unevaluatedProperties
> > >       commit: a57307ca6b661e16f9435a25f376ac277c3de697
>
> > This one should be reverted/dropped too. Patch 1 is fine.
>
> There are others?  What's the issue with them?  It'd be easiest if you
> could send patches doing whatever reverts you're looking for.

Just 1 other you picked up. See "ASoC: samsung-i2s: Use
unevaluatedProperties". Patches adding the missing properties (and
restoring 'additionalProperties' on these 2 if not reverted) is the
correct change.

I've gone thru and NAKed all of the others so more don't get picked up.


Rob
