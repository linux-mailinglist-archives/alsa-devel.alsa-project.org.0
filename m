Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DBDAB160902
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Feb 2020 04:34:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69E79166D;
	Mon, 17 Feb 2020 04:33:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69E79166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581910452;
	bh=z+GYhZaaANCFS1+6NT99wXn+pmi90fsyPKKLgYNVZqw=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iDdp2PkRoKTWKcYTnKXJ3B9CMpVYqSqIcpwvqd6jkFWJTTihva3oVOWIj51FvrDCM
	 lXFpO1zW7yMaJwpmmwwVTb/dHk429SYOWeRMZeB8zQDoSPNosQFmPzSh1agELLbfPw
	 f3otpBkED1tuXCkU39hPyassjzwiaeEzyJGeBMQ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1F8AF801F4;
	Mon, 17 Feb 2020 04:32:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8F4FEF80172; Mon, 17 Feb 2020 04:32:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
 [209.85.208.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CCF3EF80096
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 04:32:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCF3EF80096
Received: by mail-ed1-f65.google.com with SMTP id m13so18980095edb.6
 for <alsa-devel@alsa-project.org>; Sun, 16 Feb 2020 19:32:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q4CIHpVJIc8tieFYml9JRz0BGCHMsI2BF3krPygp1zU=;
 b=n8R1I+IYUP+2d46hJV12jbjIzWntEO68wKVEWQ5A/NnqV8pBPWmyt6HKmRbgj0cjnI
 3zGT0EiYwxAHDGK0vLLfUmCPXM7mW418TfG+e1EXSGt0iQ4y4T9rKk8CkbeBUVfa3vRQ
 Ure7y+ZkjpvIy2GaEf/QK51HgCrIGDLwRhVAiLzyoJKEzCgOpTMh5dtkCIlTtKj8NSrj
 k8ZUSwhe+ktL914BKsFLMeCzWcHaRVjzyT0hQyowTlohUaIf301jji4pT4D1U0bbKNb1
 uSYa/Kxtnk+IUluOKrNMHPiOtoc5PXzDPRMoEYZpev7cQadp77DR+PiSRplQlxZYYmo5
 KdUw==
X-Gm-Message-State: APjAAAXmn3uO5LUbrXi2OLQY9mL1EqhCaXPLRMTuQY3kwt9L/eX6BPaD
 0GrHsxmLciWhQ8vnfA/eWQshslNeneo=
X-Google-Smtp-Source: APXvYqxqUk3Y8GmKBLXLQ+KACEQxipOTP4/af5rwINEssnvdSzLjLrjkcovnUpZ6/RiSBJaUFvbnwg==
X-Received: by 2002:a17:906:ce2e:: with SMTP id
 sd14mr13239819ejb.190.1581910344977; 
 Sun, 16 Feb 2020 19:32:24 -0800 (PST)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com.
 [209.85.128.43])
 by smtp.gmail.com with ESMTPSA id cf5sm818182ejb.60.2020.02.16.19.32.24
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Feb 2020 19:32:24 -0800 (PST)
Received: by mail-wm1-f43.google.com with SMTP id a6so16826336wme.2
 for <alsa-devel@alsa-project.org>; Sun, 16 Feb 2020 19:32:24 -0800 (PST)
X-Received: by 2002:a1c:7915:: with SMTP id l21mr18520158wme.112.1581910344064; 
 Sun, 16 Feb 2020 19:32:24 -0800 (PST)
MIME-Version: 1.0
References: <20200217021813.53266-1-samuel@sholland.org>
 <20200217021813.53266-4-samuel@sholland.org>
In-Reply-To: <20200217021813.53266-4-samuel@sholland.org>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 17 Feb 2020 11:32:13 +0800
X-Gmail-Original-Message-ID: <CAGb2v662ugC4R3KDZfP3VJV8WHSWOCqAEveM0R_PLDa69Haffg@mail.gmail.com>
Message-ID: <CAGb2v662ugC4R3KDZfP3VJV8WHSWOCqAEveM0R_PLDa69Haffg@mail.gmail.com>
To: Samuel Holland <samuel@sholland.org>
Cc: Luca Weiss <luca@z3ntu.xyz>, Linux-ALSA <alsa-devel@alsa-project.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Maxime Ripard <mripard@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [PATCH 3/8] ASoC: sun50i-codec-analog: Group and
	sort mixer routes
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

On Mon, Feb 17, 2020 at 10:18 AM Samuel Holland <samuel@sholland.org> wrote:
>
> Sort the controls in the same order as the bits in the register. Then
> group the routes by sink, and sort them in the same order as the
> controls. This makes it much easier to verify that all mixer inputs are
> accounted for.
>
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Acked-by: Chen-Yu Tsai <wens@csie.org>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
