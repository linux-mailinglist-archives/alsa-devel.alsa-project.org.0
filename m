Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C986C0CCA
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Sep 2019 22:45:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6ADD74C;
	Fri, 27 Sep 2019 22:44:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6ADD74C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569617111;
	bh=ZqwOtOKhwEVzEGALOtgTg4rsG/SVRRgmMA/5ZF4XELc=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e/3MUtTWHZQcuf3gYCF6xPZwQi6emXHdSrjcFik4/OthKjaOq/jTyiFg81b+x7JSe
	 FN5TnZbdSILsbUwkWXxG1jaIktRE8ZSZt+5qANPvcrJVYHtpe45Vg1VYnrYbhIcq5t
	 1mpyxj6dNIMsXsQjLbS1sCyK59hzo9pL7IJN30fU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6CA94F804CA;
	Fri, 27 Sep 2019 22:43:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB8C6F8049A; Fri, 27 Sep 2019 22:41:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_76,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A2C04F80138
 for <alsa-devel@alsa-project.org>; Fri, 27 Sep 2019 22:39:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2C04F80138
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="hz+tpbQ8"
Received: by mail-pg1-x544.google.com with SMTP id v27so4054351pgk.10
 for <alsa-devel@alsa-project.org>; Fri, 27 Sep 2019 13:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ShSdb9Lrf0RHWqorkRz6ox6yLC4Co85l5XrRSD8mUDw=;
 b=hz+tpbQ8UD9HFLn4XPQ/wh3gVrOLpm74MPRCalrlAr6CjwdCef0T8RnZtNJhOPMhj1
 dN3+lfvvcy2vBL9BHWXS8wBn7kICB6vuKvRPcoEmWGSfjgCYv7SvxtD1SSO9jdt2POgU
 Que6nbJtyfo+TBYUg8aI/So6nHspo7XEhu1nE68omQ0GFodhGdKqBN/t2AM+CD/rxTOk
 rOH4n5WONZDX0TQKbSFsFMrOI0kIyWVv8gxbWhQlphIbVSHSDApDJuJF5ragO9qRCx32
 Hs2CMhIlOz9GQYUEvGIHLTh/FYwSp7FrYZa4HM49XAdMKoi6f640YzUMSCb3ma0RnXhs
 WD7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ShSdb9Lrf0RHWqorkRz6ox6yLC4Co85l5XrRSD8mUDw=;
 b=foumb/cvB9xCZ1Yh7eblcC1Jcc1dBQ0ZTfkf7wD+MqZKHK1C9+I400fORBHGPwmFvn
 V5TQmbZOoJVZWZsf0kKQ9HZ4aMVZx9XuV4KnlguoO2ExWZ++eW0LjdN1HPzpXQMdiTJ6
 AOkYyHlI8yL3ADl3XxRDpL4gFK9mslJGJllF9Muqd1WWWsYcEtnJLAwJxT4G1vUgZNWQ
 f7Z5Kh6VRzKSQ8tXexjdOTPrdFKMQFYN3YuLsNYxh5rrnQwrmNMdGZwTkAcUyB4Dp1JH
 8OctALP6JSzrEurKP0QUvXIeWh8SZ6wNVgXu9J2PwQhfIhZCDniyOX2ucA/Bx5NZQyfw
 5nvg==
X-Gm-Message-State: APjAAAUqc+TNxJQWaJOVYg3wH4hhSrBYvpcbKY1+ZbHt+AUN2q6Y/IsQ
 JizexNMQv9JXw0EyivLZpS33swDk/a+stx8Xihw=
X-Google-Smtp-Source: APXvYqx7R3i+4wZPHGv7dzqvUguFM1DoTCKYqVfvW7A6AAFXwmaN7Wv0rxkvO/0V/MmoBgp7yLAXLSLiqI24y1MtswI=
X-Received: by 2002:a63:6988:: with SMTP id
 e130mr11619254pgc.203.1569616774815; 
 Fri, 27 Sep 2019 13:39:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190925161922.22479-1-navid.emamdoost@gmail.com>
 <13f4bd40-dbaa-e24e-edca-4b4acff9d9c5@linux.intel.com>
 <20190927025526.GD22969@cs-dulles.cs.umn.edu>
 <dc68e0dc-9a8e-cc52-c560-3e86c783dbb3@linux.intel.com>
 <6966df25-e82c-1abe-6a0f-ff497dcda23b@intel.com>
 <20190927153304.GS32742@smile.fi.intel.com>
 <2e8ef4df-9c5f-f6e0-23ee-32d3bc555330@linux.intel.com>
In-Reply-To: <2e8ef4df-9c5f-f6e0-23ee-32d3bc555330@linux.intel.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 27 Sep 2019 23:39:22 +0300
Message-ID: <CAHp75Veung3v41RMmBoQHE7TFWUccE2oXsVnNgUt0JE0naTfLw@mail.gmail.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jie Yang <yang.jie@linux.intel.com>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Navid Emamdoost <navid.emamdoost@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Stephen McCamant <smccaman@umn.edu>,
 Kangjie Lu <kjlu@umn.edu>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Enrico Weigelt <info@metux.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Navid Emamdoost <emamd001@umn.edu>
Subject: Re: [alsa-devel] [PATCH v2] ASoC: Intel: Skylake: prevent memory
 leak in snd_skl_parse_uuids
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

On Fri, Sep 27, 2019 at 7:39 PM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
> > The problem with solution #1 is freeing orphaned pointer. It will work,
> > but it's simple is not okay from object life time prospective.
>
> ?? I don't get your point at all Andy.
> Two allocations happens in a loop and if the second fails, you free the
> first and then jump to free everything allocated in the previous
> iterations. what am I missing?

Two things:
 - one allocation is done with kzalloc(), while the other one with
devm_kcalloc()
 - due to above the ordering of resources is reversed

-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
