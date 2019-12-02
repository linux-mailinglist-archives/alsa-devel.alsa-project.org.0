Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE2210F2F3
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Dec 2019 23:52:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48BE81658;
	Mon,  2 Dec 2019 23:51:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48BE81658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575327129;
	bh=idWv0I8pAEd2O4i/tuoPLbUXk6CMvqq//ybbCSy5O8s=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IUPAuaSbBIpb096B6004mqSYqEiisntBrT1O7pFZ5Ozzx9QesKVpS7P0wZEWx+4D3
	 OfYpGPUCnHKkCXWdMZSNaNxYia0du+XZYBfKwkMrVqAsbjgXTKjE3i9XOz2ZiesiUi
	 qFLMgXcl8b/oDFYZib5uaBRpqOoVXBiaKVcayfEk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D7050F80217;
	Mon,  2 Dec 2019 23:50:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2717F80214; Mon,  2 Dec 2019 23:50:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 20260F800F0
 for <alsa-devel@alsa-project.org>; Mon,  2 Dec 2019 23:50:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20260F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="c5FC9h1A"
Received: by mail-qk1-x741.google.com with SMTP id v23so1458460qkg.2
 for <alsa-devel@alsa-project.org>; Mon, 02 Dec 2019 14:50:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ziFoRUvn1YLLNAz9PrcsFVNYOeSZGkfutOddhpl/0IU=;
 b=c5FC9h1AYP+fLLArDiDHwGaESj93gm0Cl+uhMlN3pntHS2uPfTZAR+1r63LWQevaN0
 752MZHQkDiAibOr3ktq1oaUvdjJge1XB4/7mRz/fonEJzIyxLuuuJ3pB+Iienx7I5UIl
 GE8JfFBRX1DWUP8SlQh6ZPiYvUeIYMYa+un4bK3JddAdAtGkQYHHrwaHnCopW9u77XB1
 tQSxJkdpw1r7EjEOW8aOKVTvgT1fnVeKb0fNPJlhJaskl8J1HnL+NP+tOadyOPYUsR9b
 0q5ztc/z/BNsM0D+uuAWx4oqwNrps/GQyRpGYClunRlB4IjiEVbkx+Ul3oFYth3SJAog
 dVtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ziFoRUvn1YLLNAz9PrcsFVNYOeSZGkfutOddhpl/0IU=;
 b=lXVquzTCA63K8XjFbHz3Sc4BTSP+q0lCPP6hbvTbtToOy2Sd2Ce1Z7C4zpsvkK4Nbo
 Wc4RZAT8WPoItwQqdA3iP3VF7unth6EVkFbEXAO7qvZWelqk6Idm9ZlE9qyqKhK/WdkV
 Ncc9KqYLsDrJF5/M8qQ1D+7LA8gstD6FWzh24IdeVIus1az92o2qeFGsib2kWeITGPo8
 e4A/jsmN40+42lxLKfOzJElJlCXZXI8VRCWz0MpJsw36074BQ1X5cRNnWPlVdMBj/Ch+
 Kl2sF5CL8GAdBir+eYf0AU+Jv43Kt46BRYUxwzOVlxCTgPIVYSiwaVFy9fwrsc2bv9d2
 ooQw==
X-Gm-Message-State: APjAAAUH0Cd3zlpdEd8kH3Rurcb28Bv7UZuldsUamM9UH6aavmXnBDxJ
 Ae/0qYAODgLk5RORltjilxoNXQui5m37ZYpAgftbnw==
X-Google-Smtp-Source: APXvYqwEMhczQ2itVWMTI2SkvzpivzhjaF45x0JFHxkqY6YEhj0A3tvVL4MRhgy81d4FqF7Ec2HrgB9q7nMTOBlutKQ=
X-Received: by 2002:ae9:f711:: with SMTP id s17mr1728720qkg.238.1575327018431; 
 Mon, 02 Dec 2019 14:50:18 -0800 (PST)
MIME-Version: 1.0
References: <20191128011358.39234-1-cujomalainey@chromium.org>
 <s5hlfs0ld25.wl-tiwai@suse.de> <20191128134901.GE4210@sirena.org.uk>
 <CAOReqxj1V475mbfSEWNn3NrMJDttO+23KjboBR01tGhzAAJmBw@mail.gmail.com>
 <20191128172832.GF4210@sirena.org.uk>
In-Reply-To: <20191128172832.GF4210@sirena.org.uk>
From: Curtis Malainey <cujomalainey@google.com>
Date: Mon, 2 Dec 2019 14:50:06 -0800
Message-ID: <CAOReqxjk176ZewfJhBpgZDARBKeEhDUCN9pmHmOrf+O4aL31Cg@mail.gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Takashi Iwai <tiwai@suse.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Curtis Malainey <cujomalainey@chromium.org>,
 ALSA development <alsa-devel@alsa-project.org>, Takashi Iwai <tiwai@suse.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: core: only flush inited work during
	free
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

I sent a patch with the proxy function fix in it. I did not include a
revert for this patch as I didn't see it on any of your branches. Let
me know if I missed it and I can send you a revert as well.

Curtis

On Thu, Nov 28, 2019 at 9:28 AM Mark Brown <broonie@kernel.org> wrote:
>
> On Thu, Nov 28, 2019 at 08:23:21AM -0800, Curtis Malainey wrote:
> > On Thu, Nov 28, 2019 at 5:49 AM Mark Brown <broonie@kernel.org> wrote:
>
> > > > For this delayed_work, the situation is a bit complex, though.
> > > > Usually the work is set up to point to a fixed function, but in the
> > > > case of ASoC, it seems serving for different purposes depending on the
> > > > component type.  I guess the cleaner way would be a redirect call
> > > > like:
>
> > > Yes, or just separate fields for each.
>
>
> > Sounds good, I will refactor this change and send a new version next
> > week as US is on holiday rest of this week.
>
> I applied the change as-is already since like Takashi says it is an
> improvement in itself but obviously doing something more complete and
> thorough on top of it would be great if you have the time!
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
