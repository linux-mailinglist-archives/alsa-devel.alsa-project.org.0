Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17021136495
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jan 2020 02:08:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4DD71798;
	Fri, 10 Jan 2020 02:07:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4DD71798
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578618484;
	bh=9yV4gCzrzE5HmVyuZSqKVK/M1YddSH3SBhBz8nozI+A=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Nc8D3dTcavvv65nzYlHgKDXM7KMGwEWTPDDeAqOLXoXP7hChEZzaoXQZrd5hf2KIZ
	 P7EfXPO3MipCz5nPO5UQUynldmIGfZc86jvOABP8eueBtxu12jnWs4KWVu9uAWSjcX
	 r74gZaJX/LHNHAoVFAYrsg6e7KDtcwKWrudZDxRo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D4FFEF801EB;
	Fri, 10 Jan 2020 02:06:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DEBADF8015B; Fri, 10 Jan 2020 02:06:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.0
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D061AF80101
 for <alsa-devel@alsa-project.org>; Fri, 10 Jan 2020 02:06:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D061AF80101
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="Q/SpiVFs"
Received: by mail-io1-xd41.google.com with SMTP id d15so250673iog.3
 for <alsa-devel@alsa-project.org>; Thu, 09 Jan 2020 17:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0AaGdesSrwy9CQvlbcsq69wkQKgx9ks9Un7URg79eFs=;
 b=Q/SpiVFs4/CEUFt4OJSbX9xPIsfLj3jSr20AiDtXP9XvZICvdGeSQk0lhVHg5Qd5ZS
 8VjrJNEgPxcXYOwEWkcs4vOmFRVOLcc8qYl7fD090QaaMrmq5H+H5eVVXXZjUIO6RwaS
 coZEj5xntuTb9jKxuehVxmW5QEaU9gi9tM0Sd9ENZdBR1/dXMyjy6yw0raRCe/i0RLxy
 SBed63A6k1u1GI0RmSCoxlYb8u+D7oW+/5KqjBw+xq6Dwx2vL77j0U9iaIkH5NOoYrsS
 tQzyxjlVTJE1fnAPu9bhvkp1lCm49fC8vZlK8HTeqq84e6+FresN1q5780lOqNG8NjId
 wgGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0AaGdesSrwy9CQvlbcsq69wkQKgx9ks9Un7URg79eFs=;
 b=kBG8dv1kaqQmoJUQXvNrEglCtEdpnhjzLyQK5G8DfKGqhPKzUHORhq1I3ULK5Mgtvk
 PTYv7oJEJhYcdotktzeuUTzgHuAASN+kRxOxvNTF+mhYPl4FK8t7LHSIx4cjJZ5diTnZ
 Z9SXP5y7X63X8t6pPZwb6foKVqlDJeUA4DY6ZunqihKo+Mw4lp4a8eSfATZqDTefHI8v
 cH/9MZQLuLVHrUIlkxF89i0tK5ZLcoHGRSvLgl+QD1b8Qsbla0AB2N4mxKS+Ls5pHW/w
 5iwdX4pl2hWglgNNYDBFXuw5HyDyg7cxPqtGb6LgBmRolosK34u2rgr+9isPg8NKGvbd
 Q42Q==
X-Gm-Message-State: APjAAAUwcJ1JFPFu6ObIPeyErnrDxt4tzb2JEPmcG1+G3KgZvS5fnrKT
 q1b9AUHQ31IYrScifWPgsZ7lGe+c75uv3ROy2nfHaA==
X-Google-Smtp-Source: APXvYqy7FKLikZyPAOHw9u0R+JZtbYnesh6NErB95a1HKW/PFprxIo+ALAFJPqjDzEla5n9WWRiJb0HU6Pa+sn+1gKQ=
X-Received: by 2002:a6b:8f41:: with SMTP id r62mr300820iod.140.1578618370473; 
 Thu, 09 Jan 2020 17:06:10 -0800 (PST)
MIME-Version: 1.0
References: <CGME20200108115027eucas1p1d3645ba53703780679c662921efbca78@eucas1p1.samsung.com>
 <20200108115007.31095-1-m.szyprowski@samsung.com>
 <20200108115007.31095-2-m.szyprowski@samsung.com>
 <CA+Px+wXkFE5b_8bLz7-c95TvEdqHGD5s-XKRYMVr40xQkqTWxQ@mail.gmail.com>
 <83169752-ac05-d1b1-ece9-fbe1109287cf@samsung.com>
In-Reply-To: <83169752-ac05-d1b1-ece9-fbe1109287cf@samsung.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Fri, 10 Jan 2020 09:05:59 +0800
Message-ID: <CA+Px+wWiZ9MWwi-moXo9rJrbgLFVEbOqjQMhOZmm5mRL7EeMbQ@mail.gmail.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
 Jimmy Cheng-Yi Chiang <cychiang@google.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Mark Brown <broonie@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Dylan Reid <dgreid@google.com>
Subject: Re: [alsa-devel] [PATCH 2/2] ASoC: max98090: fix lockdep warning
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

On Thu, Jan 9, 2020 at 7:09 PM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
> On 09.01.2020 06:36, Tzung-Bi Shih wrote:
> > On Wed, Jan 8, 2020 at 7:50 PM Marek Szyprowski
> > <m.szyprowski@samsung.com> wrote:
> >> Fix this by introducing a separate mutex only for serializing the SHDN
> >> hardware register related operations.
> > This fix makes less sense to me.  We used dapm_mutex intentionally
> > because: both DAPM and userspace mixer control would change SHDN bit
> > at the same time.

We should not use a separate lock.  Either mixer control or DAPM would
change the SHDN bit.  The patch overlooks the calling path from DAPM.
As a result, DAPM can change the bit in the middle of mixer control.

> Nope. This is just a lockdep warning about possible hypothetical
> situation on the test system during the normal boot. It doesn't mean
> that the circular dependency actually happens (if so, it would end in
> deadlock). It also doesn't mean that such circular dependency can be
> really triggered, because some other dependencies that not known to
> lockdep engine might protect against it. However the easiest way to fix
> it is to use fine-grained locking instead of reusing some framework
> locks for other purposes. Such approach is also usually a good practice.

If the possible circular locking is a hypothetical situation, shall we
ignore it since we are very sure userspace cannot see the control
devices when building the sound card?
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
