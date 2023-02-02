Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24FB6688316
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Feb 2023 16:52:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FB95E87;
	Thu,  2 Feb 2023 16:51:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FB95E87
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675353135;
	bh=Y9xqbz51S397OO9AGGIlpQv4kUC2bme5ue2mifphKRk=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=SkZqbl05cGXh5MkR7UKJcYB4KggviLM5tknNbijcCjefKzHEdVjwV52jN5rSRxl3+
	 rYMtYap1+LMJqKzIoVQAq7MO4DpsXJKc0LIJ3Dhp+w6EflErSpGWcnDrSnHtefE02J
	 gtbBCP5fX3eXpRNNExZsDX46H3LcJU4YuW/0ElA8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CF758F800E3;
	Thu,  2 Feb 2023 16:51:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EBC4AF804C2; Thu,  2 Feb 2023 16:51:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C15C1F80169
 for <alsa-devel@alsa-project.org>; Thu,  2 Feb 2023 16:51:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C15C1F80169
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=H1C4HgP0
Received: by mail-ot1-x32e.google.com with SMTP id
 f5-20020a9d5f05000000b00684c0c2eb3fso562279oti.10
 for <alsa-devel@alsa-project.org>; Thu, 02 Feb 2023 07:51:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=yHdnGHGya01Jv0VuLki3dw4SIg6d4Y5ozkEOLFh106s=;
 b=H1C4HgP0+4cLGdmQvHXhQ3i0Vkr9SlgDZWxF4hOHH2AGXebPuzKKwW99Yh4YTpP1eP
 DCo9lGGq4Uaskn0A/qpE/587NZUAp8TpYnHQptkb3vr98DKbUSc+S/gjs8EDUgMqdMHC
 1Fm21hBVnVxea7Mamzac0GhsUcc4/b/0FRcOgoa6X0FSffmLYIv39p8fwlSC5D69msYa
 xm8OYvlbzvhjK8bwQpPhDpTZYnNrDa8XACIuBaI1w171jbOli829AYrvjq6Xtlcaq53+
 SXOJsABhmccDXYVkDBtb974H/G2+nxW5DmGQV2vzaHBDw9bstdCiYf0YqeEz0HgTT7SN
 7cEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yHdnGHGya01Jv0VuLki3dw4SIg6d4Y5ozkEOLFh106s=;
 b=WT59HG7REi9d37+N/H7jtX3PuE6U0bMmh+gYnXPQQi26OSGDED6pPA5dqFuHPC/GSz
 jI2HYcAaqTUKcHojY96jdoC/IskJKrrcVridu7eNIVBnGd/+wjdki3qcuyxJoPlJ+aID
 x69th516ixpxwI+U8VYnfpy1wpwh1Zi7dipBidJjdScV3C8QhVyX019/Xbb8NnmeAlZc
 /D3bnY1y+d6S7xDqSf13rv8urwT2aMOSLR6x6hf2fO/s1HHZsp20PtCpIny3pQysT33r
 NVdPy0MmDfTuqsohvG3mOBGV1r62l0DDYpV1UV0GFI3t90EzCdq79sqlZ1FmCQAhxOFC
 n5vw==
X-Gm-Message-State: AO0yUKWrEShvrVOhJAFp5NblFR8zi8JXBLKWJbPqgkvQvVeNM1k9FQah
 g1e7+dctyOELcnO/vbMkKsk=
X-Google-Smtp-Source: AK7set8yIDY8bSn1xg+ZZWxJIPoyhQiBcGeEppFiitpyMYHL/QXHUa0PabTEfahvJWo8bR0FD9YgLw==
X-Received: by 2002:a05:6830:1686:b0:68b:d347:2457 with SMTP id
 k6-20020a056830168600b0068bd3472457mr3411625otr.21.1675353063689; 
 Thu, 02 Feb 2023 07:51:03 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a9d58ca000000b006865223e532sm3173925oth.51.2023.02.02.07.51.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 07:51:03 -0800 (PST)
Date: Thu, 2 Feb 2023 07:51:01 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: da7219: Fix pole orientation detection on OMTP
 headsets when playing music
Message-ID: <20230202155101.GB1373010@roeck-us.net>
References: <20221121050744.2278-1-david.rau.zg@renesas.com>
 <20230117195645.GA83401@roeck-us.net>
 <OS3PR01MB66416CEF9F6E5AE62D194BACCDC49@OS3PR01MB6641.jpnprd01.prod.outlook.com>
 <20230119161221.GA981953@roeck-us.net>
 <OS3PR01MB66416C10BF8E6400C84DAD02CDD09@OS3PR01MB6641.jpnprd01.prod.outlook.com>
 <38f09c4d-70d1-f65f-6e9b-4ad84eda4059@roeck-us.net>
 <Y9kE1cSUg2CQM5vq@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y9kE1cSUg2CQM5vq@sirena.org.uk>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "support.opensource@diasemi.com" <support.opensource@diasemi.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "tiwai@suse.com" <tiwai@suse.com>,
 David Rau <david.rau.zg@renesas.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, Jan 31, 2023 at 12:08:53PM +0000, Mark Brown wrote:
> On Mon, Jan 30, 2023 at 10:16:06PM -0800, Guenter Roeck wrote:
> > On 1/30/23 19:58, David Rau wrote:
> 
> > > Thanks for the kind feedback.
> > > Would you please let me know what kinds of environment such error appears you ever meet?
> > > Ex: da7219_aad->gnd_switch_delay = ?
> 
> > We are seeing the problem on various Chromebooks.
> 
> > Never mind, though. I really don't have time to keep arguing about this.
> > I would have assumed that it is obvious that a long msleep() in an
> > interrupt handler is not appropriate, but obviously I was wrong.
> 
> This is a threaded interrupt handler so it's a bit less clear that it's
> meaningfully different to just disabling the interrupt for debounce or
> whatever.  Not to say it's ideal.
> 
> > I'll see if I can implement a downstream fix.
> 
> If you implement something I don't see a reason not to post it upstream.

I had a look into the code, and concluded that it is too complex for anyone
who doesn't know it to find a proper fix. For example, for an outsider it
is not conceivable (or explained) why the ground switch is enabled only
to be disabled immediately afterwards if a jack was removed.

This is now the top crash reason on affected Chromebooks (so far I
identified Asus C424, HP SeaStar, and HP StingRay) with this patch
applied. I am inclined to revert it from all ChromeOS kernel branches.
At least for us the cure for the problem is much worse than the problem
itself.

Guenter
