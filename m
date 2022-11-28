Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFE163AA0A
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Nov 2022 14:50:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 76AF216D0;
	Mon, 28 Nov 2022 14:49:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 76AF216D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669643417;
	bh=kyFwp0thO9n02BgnSTIBrPt0wxtPrO2brXKy4McLVAc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qfYfUGZ03ZJijmgDnAsD3CrfZAuCNuO/vDiyk2rWWgLDMOH89LRew+4tlcUkk/Lu9
	 6GP5QYFW3JCUBpYCt4YT1gattjxWfRrLLPcFi9hJjp+5TtE/G0+aW14MXSHWopLRi8
	 luuhdU1g2KK2wOtMvNYAdqy+zxu8eQS3fWIAotpM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 31944F8024C;
	Mon, 28 Nov 2022 14:49:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6E8DAF801D8; Mon, 28 Nov 2022 14:49:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_HI,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E6935F800B6
 for <alsa-devel@alsa-project.org>; Mon, 28 Nov 2022 14:49:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6935F800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="JaLWK4hY"
Received: by mail-il1-x134.google.com with SMTP id q13so5020926ild.3
 for <alsa-devel@alsa-project.org>; Mon, 28 Nov 2022 05:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5WWumrqiTDYq5uOZBAPJFRzs6vcelTvSCtUZimwYyKk=;
 b=JaLWK4hY8LgNiPiKh9CCSm+56V2c4Rm7Q59ef1OdxUY5vA0ZNzGYJh8zBSh2Cg6W64
 eEKR+qLTv/MU1cSh80KUT8bP9gfduZ5u5xWY/RRkgkx433VnWoMLQFoAUQzLsnHsYWJW
 YGsPYd+Hr+yIoAkDDGPvqs9pyqr1YJYebXF1g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5WWumrqiTDYq5uOZBAPJFRzs6vcelTvSCtUZimwYyKk=;
 b=caYnqxvnutxskHakrp51YbS6LKJNweiqfc5UYJumeVqf6JVTIBJDnRSGHhiGFk1cuo
 xkl14eh4qPqLxyayIuLV5w/MUCyJhp7BscR3jEj5m3A/y9uHeh6+h4z3kbZw0sIvHm0C
 Eb6fvsALQQT3+FojauZuTrvdkKe0CC/eW8MaeYrsdAL00p/MBARt6LSqBxqwJcbR9U4P
 gj2HtByDSuQHd1dV1Gv8AXTVlStYInp9TRltY5J7RMx14mmTBpA7jEry26Iy3VR/n9FM
 3xtr8bZY+tEwbgvP1M+jt8NAd2sQiBTGC7XiOjfgrl8Rl0YZFyeTxPOiKfWdPhxph+fU
 qjBw==
X-Gm-Message-State: ANoB5plV73Va71WjcJWMQswNkQRkShpdb7lOqfO6miS+1EXhG9XLTMfm
 fBVOcnwXgGSsvAz/rh7Eizch2YwRmgCRt0cR
X-Google-Smtp-Source: AA0mqf7mCG42uOAtGS7nZJOAGZvXKDzcTq0xJr7AcrdAujiOKiCytEKx2TmuvUNW/pSwd8gkgCZ04A==
X-Received: by 2002:a05:6e02:2197:b0:302:391a:f67b with SMTP id
 j23-20020a056e02219700b00302391af67bmr16170114ila.265.1669643355795; 
 Mon, 28 Nov 2022 05:49:15 -0800 (PST)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com.
 [209.85.166.45]) by smtp.gmail.com with ESMTPSA id
 n13-20020a92260d000000b00302e09e0bb2sm3732214ile.50.2022.11.28.05.49.13
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Nov 2022 05:49:14 -0800 (PST)
Received: by mail-io1-f45.google.com with SMTP id p141so7568348iod.6
 for <alsa-devel@alsa-project.org>; Mon, 28 Nov 2022 05:49:13 -0800 (PST)
X-Received: by 2002:a02:ccfb:0:b0:373:9d0a:33a0 with SMTP id
 l27-20020a02ccfb000000b003739d0a33a0mr1950090jaq.286.1669643353517; Mon, 28
 Nov 2022 05:49:13 -0800 (PST)
MIME-Version: 1.0
References: <20221128-mt8173-afe-v1-0-70728221628f@chromium.org>
 <a214fe55-fb5e-04b8-348b-895902470b18@collabora.com>
 <Y4S43XjRyrdm4Tha@sirena.org.uk>
In-Reply-To: <Y4S43XjRyrdm4Tha@sirena.org.uk>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 28 Nov 2022 14:49:02 +0100
X-Gmail-Original-Message-ID: <CANiDSCv8Ai2W10cOjBgthshi8XPCDoCvGxXfoL-47eFrRjrseg@mail.gmail.com>
Message-ID: <CANiDSCv8Ai2W10cOjBgthshi8XPCDoCvGxXfoL-47eFrRjrseg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8173: Enable IRQ when pdata is ready
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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

Hi

On Mon, 28 Nov 2022 at 14:34, Mark Brown <broonie@kernel.org> wrote:
>
> On Mon, Nov 28, 2022 at 02:17:53PM +0100, AngeloGioacchino Del Regno wrote:
>
> > This commit needs a Fixes tag, as this is indeed a fix.... kexec isn't anything
> > new, so all kernel versions are affected by this bug.
>
> Fixes tags are a nice to have, they're not 100% a requirement - they're
> a lot more useful when they're fixing a bug that was introduced rather
> than just something that never worked.

I do not have any strong opinion here. If you want to add the tag. It should be:

Fixes: ee0bcaff109f ("ASoC: mediatek: Add AFE platform driver")

Let me know if I shall resend.

Thanks!

-- 
Ricardo Ribalda
