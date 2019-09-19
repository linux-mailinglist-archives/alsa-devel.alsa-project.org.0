Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D42E8B7A2F
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Sep 2019 15:09:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 320A0167A;
	Thu, 19 Sep 2019 15:08:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 320A0167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568898570;
	bh=a6dr7/cyU836Qx+pWyg9cXgnm9eLJdZgnVo+fM9QM4o=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=spzb9sPcCay3ItxQIDNT7mvMiI0tBZoRh3lkIHZp2ZTmp73W/N909NjMBlnbCQ1b0
	 AC1xsiLgBn+Iv76IF0wSgpUFQigWveibSn/6uvBGyHsPzavegVNGcfPwy3X59+heki
	 FVh7aDmbSm+MbnRcPwGtX/OXugsufhtIao99aZBg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B85EF80292;
	Thu, 19 Sep 2019 15:07:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6ED83F80307; Thu, 19 Sep 2019 15:07:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AEEFEF80090
 for <alsa-devel@alsa-project.org>; Thu, 19 Sep 2019 15:07:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AEEFEF80090
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="rLANaBJ7"
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com
 [209.85.167.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 57C7D21D79
 for <alsa-devel@alsa-project.org>; Thu, 19 Sep 2019 13:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1568898456;
 bh=7c6x6cciXw60y1MAp5qCF8JC2dTq/q+YgCB8SLyOqPk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=rLANaBJ7u/o3/Au71CBT1kL7Iz1AesheSrZWNrQYU3KIhPqXcqzDRSt3TNTjU0ICC
 YtuL2Mb+8MCN3YX+aSM2MYkpVCpoXPE4NM1wK9cZcfe7oqcZVmY34xHX3NiRMA5TJ9
 dZHIzZ6pmcmn8SJbokPvWglRcXxHBKx41f5cYxfk=
Received: by mail-oi1-f181.google.com with SMTP id e18so2680869oii.0
 for <alsa-devel@alsa-project.org>; Thu, 19 Sep 2019 06:07:36 -0700 (PDT)
X-Gm-Message-State: APjAAAUrcDv8PMXC7n4wy1KubagJ7lQnKziCdDyq3PbzCp9ok4DJSNmW
 nt3ae8kIUoEpScX1bGytgd3YcfUwHxVgXMUp0Dw=
X-Google-Smtp-Source: APXvYqzg4w/tXFpqJXHvHB4lq08/Vt2S/re21Kogpdz8yQzifNkZReFpzmxtyPOoRYJbDiSlFhPpgOR0t+CaR7QIEm8=
X-Received: by 2002:aca:cf51:: with SMTP id f78mr2186088oig.8.1568898455647;
 Thu, 19 Sep 2019 06:07:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190918104634.15216-1-s.nawrocki@samsung.com>
 <CGME20190918104656eucas1p1d9cad1394b08d05a99151c4fbc9425ce@eucas1p1.samsung.com>
 <20190918104634.15216-3-s.nawrocki@samsung.com> <20190919075924.GB13195@pi3>
 <420d3c8a-a31e-1edf-3112-b9800beace1e@samsung.com>
In-Reply-To: <420d3c8a-a31e-1edf-3112-b9800beace1e@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Thu, 19 Sep 2019 15:07:23 +0200
X-Gmail-Original-Message-ID: <CAJKOXPedjgXMfiGK=frXeynaqkAWvCcgEVqPeFoL0h8og7MXCA@mail.gmail.com>
Message-ID: <CAJKOXPedjgXMfiGK=frXeynaqkAWvCcgEVqPeFoL0h8og7MXCA@mail.gmail.com>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 ckeepax@opensource.cirrus.com,
 =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?=
 <b.zolnierkie@samsung.com>, sbkim73@samsung.com, patches@opensource.cirrus.com,
 broonie@kernel.org, lgirdwood@gmail.com, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [alsa-devel] [PATCH v1 2/9] mfd: wm8994: Add support for MCLKn
	clock control
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
> On 9/19/19 09:59, Krzysztof Kozlowski wrote:
> > On Wed, Sep 18, 2019 at 12:46:27PM +0200, Sylwester Nawrocki wrote:
> >> The WM1811/WM8994/WM8958 audio CODEC DT bindings specify two optional
> >> clocks: "MCLK1", "MCLK2". Add code for getting those clocks in the MFD
> >> part of the wm8994 driver so they can be further handled in the audio
> >> CODEC part.
> >
> > I think these are needed only for the codec so how about getting them in
> > codec's probe?
>
> The clocks are specified in the (I2C slave device) DT node which corresponds
> to the device as a whole and to which binds the MFD driver.  AFAICT those
> clocks are only needed by the CODEC sub-driver but in general such clocks
> could be used to provide device's system clock used by other functionalities
> than audio.  We are doing something similar for other MFD drivers already
> and I would rather stick to one pattern. IMHO it's clearer to see what
> device the clocks belong to that way.

The existing pattern is not an excuse for doing some things in a
uglier way... If we agree that these are codec-only resources, then
they should be acquired by codec driver. This is one minor step to
solve difficult inter-device dependencies which stops from reusing
parts of the code (some child of MFD heavily depends on parent).
Existing MFD drivers sometimes follow this pattern but that's wrong.
They follow the ugly or even crappy pattern.

Your codec driver still refers to parent and it has its resources,
e.g. parent's device node pointer.

Best regards,
Krzysztof
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
