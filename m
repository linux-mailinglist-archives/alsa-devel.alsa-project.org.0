Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E8AEF640A9
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Jul 2019 07:26:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 502961658;
	Wed, 10 Jul 2019 07:25:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 502961658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562736409;
	bh=W4EtLYNBZuTg6HXFsCY66NCNlttB/4WHGPARQihWHks=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DMTWMjhPV/KLEUClSqJ/6jawYSTPoGJOoN/jzjLbWB23bHnGLnxwpni805nv+TvKN
	 NcLQIQi9mjiVjVp1ZOaUvlEk0y/WWrYNAZ+e9iQItWGbWje2kgGiqLDPYRjSNotOfJ
	 LmWsGNqUHhdRChKXvOw6xVeWO+vbS70tOAvakQfk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C87F9F802BC;
	Wed, 10 Jul 2019 07:25:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E8A2BF802A1; Wed, 10 Jul 2019 07:25:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID, DKIM_VALID_AU, ENV_AND_HDR_SPF_MATCH, PDS_NO_HELO_DNS,
 SPF_HELO_NONE, 
 SPF_PASS,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.0
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 37373F801A4
 for <alsa-devel@alsa-project.org>; Wed, 10 Jul 2019 07:24:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37373F801A4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="mNA1e83g"
Received: by mail-ot1-x344.google.com with SMTP id q20so933773otl.0
 for <alsa-devel@alsa-project.org>; Tue, 09 Jul 2019 22:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ioMDB4xCRfyih9blEfQfFq/5H+9f5r/eOiGuXZsKTpM=;
 b=mNA1e83gi656UXPR8nqOQSjw8wH59lM6GanNHXNRGXbg3bq0gEGgsCw16oi+sZU9DJ
 eQZNOeldrdnuV/5hnGKQpKr1o2kQF/+U+p3TsmIt5rF6zYyIyCNLkjBN4/L5YKqKT399
 fjPfPjemWu2HGAWRYhrVRBy+683K0HsvchE32sejFHgVZACcqHIZ+f/pqMUocPt7Vl4L
 KWMDPgOhI1YaN2NTfaA9ps2KehruPFGrFg/YgM5cP42ecPkX2bSaw3Ozx3KQ593gVsOd
 gw5i9X/nIAPz3i1KLeKE3PdtZ5ohiIMDa+//oPJUWKzQddrhWXjk6v1O30WeFi5CPm/K
 /Etg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ioMDB4xCRfyih9blEfQfFq/5H+9f5r/eOiGuXZsKTpM=;
 b=g+KKNevs+KA9SHQn5FCHv/EAodWG8OKj3s9MyNIGrKqIQlbNuqj+vjfocM69G58W/C
 dI3F58X4O0qN9IBY42eLNaxSlPP1n1mgKBAg1n1l9S1eWHB1GfcW9r+MTHT8wiGcaaKJ
 nK5wxOqWVyTOE68jXGkkAxtGZnJYxy5BsBwc4LLaIqXoPbZyAIks00mfE40tepIyc/cT
 jlrdXHHaflAbfYGrWJIsKO7K24NoCoPuoPiU+RxoquAtl3mYxG2FwUqttXarisIIV6y+
 7HMje9G8EMYrpOyO9w5sCLaQSXVjxjVGh7J2r1Pq866sXgG+Enx0mG7/EgmCUn5d5DLR
 4cVg==
X-Gm-Message-State: APjAAAWseS0OseuqgJjKMPkPK+pNOEAykD+m9vs/v1iS+qGyfSZlUoi3
 778Xk4/KbNPFZDv+AZ4cd4wro1D1JskTJZNr6m4EmQ==
X-Google-Smtp-Source: APXvYqzNWCTp+PGnXinfRndYKaIVZTZf7jZeNiuotZqNqZys/IitGZeb1egfuAbp/LgydGLR3qx1qbqBFaufmhseWLw=
X-Received: by 2002:a05:6830:2010:: with SMTP id
 e16mr9197123otp.344.1562736296734; 
 Tue, 09 Jul 2019 22:24:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190709182543.GA6611@hari-Inspiron-1545>
In-Reply-To: <20190709182543.GA6611@hari-Inspiron-1545>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Wed, 10 Jul 2019 13:24:45 +0800
Message-ID: <CA+Px+wVMn-wZ_aoAV2OMEg4zE7aoYG__my2EJM_PP5ghaXjoFw@mail.gmail.com>
To: Hariprasad Kelam <hariprasad.kelam@gmail.com>
Cc: ALSA development <alsa-devel@alsa-project.org>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, Shunli Wang <shunli.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH] sound: soc: codecs: mt6358: change return
	type of mt6358_codec_init_reg
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

On Wed, Jul 10, 2019 at 2:25 AM Hariprasad Kelam
<hariprasad.kelam@gmail.com> wrote:
>
> As mt6358_codec_init_reg function always returns 0 , change return type
> from int to void.
>
> fixes below issue reported by coccicheck
> sound/soc/codecs/mt6358.c:2260:5-8: Unneeded variable: "ret". Return "0"
> on line 2289
>
> Signed-off-by: Hariprasad Kelam <hariprasad.kelam@gmail.com>
Acked-by: Tzung-Bi Shih <tzungbi@google.com>

Thanks for cleaning this up.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
