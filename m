Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA4C6A5C0
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Jul 2019 11:44:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B53AD168B;
	Tue, 16 Jul 2019 11:44:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B53AD168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563270296;
	bh=Y6ehT+YsIJEyDNg/+r7O3B08jsTAhBw1hfCaB4CreA0=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MZlI2gKIGXBHzwzcD9yW9qFslDKYk1iShTgAvZTij5iQjIHu5kiJPsI/jfbN2jCAY
	 K0PIzbot84KTibKSgMjhZJoJNXmNelAwSEM3QXskfFAF/Z9dWe4e3gxor1Pq6Rougl
	 Yon5cCiAqiFDCi9ALKdYOuRPdeumdkacOeGL1Y9U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 01B94F802BC;
	Tue, 16 Jul 2019 11:43:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4BEABF8038F; Tue, 16 Jul 2019 11:43:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 00E7EF80362
 for <alsa-devel@alsa-project.org>; Tue, 16 Jul 2019 11:43:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00E7EF80362
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="T0ZMeWgQ"
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D166320880
 for <alsa-devel@alsa-project.org>; Tue, 16 Jul 2019 09:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1563267986;
 bh=Jlmctw/gzL2L8/5Pqug84d7JJ15nW+VemHO5Vvewne8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=T0ZMeWgQLQEwNeco6Fkrs3vXiny2QmVrsjR6P2yOEGZ9hnOmQdit9WvRO4cuDB4X9
 5jZOQLyvHS3y6Ifi4CkP2iIPCZK4tv0JJTK0N/KsuZUn0HagdcBo2hWOWHpRtwv6gF
 ElhPu7jcCepxUivj88RoQOXtaYTdssuX8T/65Ww4=
Received: by mail-lj1-f176.google.com with SMTP id t28so19133141lje.9
 for <alsa-devel@alsa-project.org>; Tue, 16 Jul 2019 02:06:25 -0700 (PDT)
X-Gm-Message-State: APjAAAWKzrgGVK59eHMZ5U+OLUBcOkQ+H9wkZMPRrwA3M9iGFgtOk+uW
 DXHf+Vc+fDoDBtO3cR0H6uRphVneM6OOopKrtPM=
X-Google-Smtp-Source: APXvYqwJUenAh147I7eROUvMV332N8DMmZO8okgQOyNEo5ii4Rw42CEuXT8+BdsqWu59mquP0PTWvHC/c7s2+iMLbzg=
X-Received: by 2002:a2e:980a:: with SMTP id a10mr17161445ljj.40.1563267984174; 
 Tue, 16 Jul 2019 02:06:24 -0700 (PDT)
MIME-Version: 1.0
References: <1562989575-33785-1-git-send-email-wen.yang99@zte.com.cn>
 <1562989575-33785-2-git-send-email-wen.yang99@zte.com.cn>
In-Reply-To: <1562989575-33785-2-git-send-email-wen.yang99@zte.com.cn>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Tue, 16 Jul 2019 11:06:13 +0200
X-Gmail-Original-Message-ID: <CAJKOXPdGAsc=XpJXVRg+oaa1o1PXkJJ8JDAnkNkJuzJrfE_OJA@mail.gmail.com>
Message-ID: <CAJKOXPdGAsc=XpJXVRg+oaa1o1PXkJJ8JDAnkNkJuzJrfE_OJA@mail.gmail.com>
To: Wen Yang <wen.yang99@zte.com.cn>
Cc: wang.yi59@zte.com.cn, alsa-devel@alsa-project.org, xue.zhihong@zte.com.cn,
 sbkim73@samsung.com, linux-kernel@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, broonie@kernel.org, s.nawrocki@samsung.com,
 cheng.shengyu@zte.com.cn
Subject: Re: [alsa-devel] [PATCH 1/2] ASoC: samsung: odroid: fix an
 use-after-free issue for codec
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

On Sat, 13 Jul 2019 at 05:48, Wen Yang <wen.yang99@zte.com.cn> wrote:
>
> The codec variable is still being used after the of_node_put() call,
> which may result in use-after-free.
>
> Fixes: bc3cf17b575a ("ASoC: samsung: odroid: Add support for secondary CPU DAI")
> Signed-off-by: Wen Yang <wen.yang99@zte.com.cn>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Sangbeom Kim <sbkim73@samsung.com>
> Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Jaroslav Kysela <perex@perex.cz>
> Cc: Takashi Iwai <tiwai@suse.com>
> Cc: alsa-devel@alsa-project.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  sound/soc/samsung/odroid.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
