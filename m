Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1565FB79FA
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Sep 2019 15:00:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9399D1670;
	Thu, 19 Sep 2019 15:00:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9399D1670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568898056;
	bh=LOGR1/DPS5kAu60DvRV9xxOZVK63WhjqhBRVmlJd758=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QLdQRfpkahi9mChTIZEgBGxaGRjYi9so8UlsBbFkQ2I80t5wnton/IiDZi0lSIObr
	 WDOA/KLqrFtSKhk8wxgQZEDE7ZPwTlApIC72PBuU5a5NKCQfZu+HHOtIdxRsvtK+E3
	 CYhrt1ly8fP7yJvZl6/OIVrRyCrQv3i6uRhkO4TA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D0DEFF80292;
	Thu, 19 Sep 2019 14:59:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 57F7DF80307; Thu, 19 Sep 2019 14:59:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C3EC4F80090
 for <alsa-devel@alsa-project.org>; Thu, 19 Sep 2019 14:59:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3EC4F80090
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="beNYs1ID"
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
 [209.85.210.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 88EEB21D79
 for <alsa-devel@alsa-project.org>; Thu, 19 Sep 2019 12:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1568897944;
 bh=Q8XQ7yEptEJjsrg2dRMQAh8Ewg1fi7/O+TC1/+NyGA8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=beNYs1IDfBymvGrrSglpl6q8PXqxictV6OYOE8gYvbQ85zRx4RNJaWg3gGeCnGp1f
 LK3jZRy0BUANXjWBm9PM4eTVHxeI0I2l6K9Gg3bwnrIa5WyQG6f5iIVBPQaPQDjrYl
 qJMFI/Ozb3fBpRkmZHHI+7HZX6CGH3X3sFMW2Hb0=
Received: by mail-ot1-f52.google.com with SMTP id z6so2985743otb.2
 for <alsa-devel@alsa-project.org>; Thu, 19 Sep 2019 05:59:04 -0700 (PDT)
X-Gm-Message-State: APjAAAXkwsoWEpkjwbpH0sUsDJ/WH4RSVAOzF1Ng3W+GeJbQ1kR0j1/w
 I3Bj2y0sTcNXZ3ojP35XoKN41uU90zXDa5NG2uw=
X-Google-Smtp-Source: APXvYqyPpRpHKXGqXeiUp4UsE0gjnPTa12R2JBL+9NbOd7thAIFl1MrNFlIQaRaNj/YALaGFGqmZfNIqU3lo9cSjxn8=
X-Received: by 2002:a9d:6c9a:: with SMTP id c26mr6640459otr.241.1568897943807; 
 Thu, 19 Sep 2019 05:59:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190918104634.15216-1-s.nawrocki@samsung.com>
 <CGME20190918104713eucas1p2ccfa8e9dff2cda9e8f88ac42dda2b680@eucas1p2.samsung.com>
 <20190918104634.15216-9-s.nawrocki@samsung.com> <20190919082211.GF13195@pi3>
 <a0072745-f7c1-86ad-2344-d73dd210e1ad@samsung.com>
In-Reply-To: <a0072745-f7c1-86ad-2344-d73dd210e1ad@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Thu, 19 Sep 2019 14:58:51 +0200
X-Gmail-Original-Message-ID: <CAJKOXPfwAx7vWSWS0M1JuGJvn6tKTp9yaT2qEOwmAWTUdvoptQ@mail.gmail.com>
Message-ID: <CAJKOXPfwAx7vWSWS0M1JuGJvn6tKTp9yaT2qEOwmAWTUdvoptQ@mail.gmail.com>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 ckeepax@opensource.cirrus.com,
 =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?=
 <b.zolnierkie@samsung.com>, sbkim73@samsung.com, patches@opensource.cirrus.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, broonie@kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [alsa-devel] [PATCH v1 8/9] ASoC: samsung: arndale: Add missing
	OF node dereferencing
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

On Thu, 19 Sep 2019 at 14:49, Sylwester Nawrocki <s.nawrocki@samsung.com> wrote:
>
> On 9/19/19 10:22, Krzysztof Kozlowski wrote:
> > Wasn't this issue introduced in 5/9? It looks weird to fix it here...
>
> It has not been introduced by 5/9, the issue was there already before
> my patch, there was even no remove() callback where OF node references
> could be dropped.

I see. Then please put it as first patch. You should not mix bugfixes
with features. If mixing, be sure they can be applied before the
features.

Best regards,
Krzysztof
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
