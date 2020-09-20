Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1FF271837
	for <lists+alsa-devel@lfdr.de>; Sun, 20 Sep 2020 23:34:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 938821683;
	Sun, 20 Sep 2020 23:33:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 938821683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600637650;
	bh=G0baGaaUwbcpztGQRDKDSWKlpOPb8UTNeF9yVluXCns=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nlD/FL05kHLMssRzk2UOgghLOfxXwKGwDcbbWgkXZo/DEoWfstvlUmmgCMQLU9qLB
	 XCMVJ2KExl7YzK7KkzN1TCEcov8aAr9KBy1jrPYzr4NfFVdbBasjfKCsf4LMNN1IdR
	 a5Z839v2ToJaCEi/Zlk+U/nXE8b4LpOCHKF9WtVI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A185F801EC;
	Sun, 20 Sep 2020 23:32:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B7A09F80232; Sun, 20 Sep 2020 23:32:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 71ED0F8010A
 for <alsa-devel@alsa-project.org>; Sun, 20 Sep 2020 23:32:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71ED0F8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="VSMIJzXr"
Received: by mail-io1-xd42.google.com with SMTP id z25so13340406iol.10
 for <alsa-devel@alsa-project.org>; Sun, 20 Sep 2020 14:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=zl4uqFm3yPB6x7Hy8vdaFwmv1E7h2D7sRx3SQmvIRXU=;
 b=VSMIJzXr04+KE0LLcVJ20lZzuJ6LTNdJ2ytVxu/nLeGeHOuSwD7AWKA20qISHSLDVW
 BP8HMh8KqUMfBtunEPGWpR1h3160kQz1nsHRD7Jy8Ew/c3QYX6hr+oIt9bDWGCLnSRgA
 DRC2rZajZaroGhdB3Sa5BrfxfuwLYaeCdB+K+3iqLGymh0eu9rUdJBNKzrlZgPXBfAfV
 U6W84E93GKxLIsbtrU7es9LzPNuCmnTa5qCgoD1NJTY6CU/jexGAsyTK34COFsxb+R3K
 SI7CiUyzFIFCPQkS2R69DAKddcQd/IIr5qs1XiCF0ahobHCw8vdXRx95yL7V9zbXqvcG
 KhKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zl4uqFm3yPB6x7Hy8vdaFwmv1E7h2D7sRx3SQmvIRXU=;
 b=DPXtRY/B8J1UXn8Ru5UHeC27AfGaI0lfyOQlMEIXJ9zqG5Pkb88yWo95muw9gZTK8j
 Z+SngD3rQORdHQVKvGo0Mha1+vsZy1BNNQeM6Cv3s8WBmcYL3RNM9SKYz9T2cWxuS5m3
 Q+Z6M878rCd6Le+S4CTjNQvErG7iqmS0izAX2YMyKxIQfaF19EahuwRPtS9PUzIJWY/j
 UFU6BNYijbfoIO2lGE1V5ZrIuoVv8s59jNPSb28phqhUFwP4ZC0srq74wbRdjFHmgi8Z
 0hhVMDOJyJGKWo+X98F902+kGXRF3WbQOFEu/vrSXLVenz3I0cV3mX2A+zmU/n6nTb2+
 rAHg==
X-Gm-Message-State: AOAM532bgkTVEoQMePoAFqlSgEcFtF0PGt5b4SPU4goiKXo7D9k9WaRe
 w0Ut3yPJ5B6/adnGvDm725rOrv0Cprf44ncdyWs=
X-Google-Smtp-Source: ABdhPJzBIdXB8dWyLH0FcLOI7kzaUQSBoFIW/9bNwv9d/zobjxL/7xzmN/ng0VcJW6M1oEZlXTgmu3yobI0sbINo6ps=
X-Received: by 2002:a02:734f:: with SMTP id a15mr38597014jae.120.1600637534793; 
 Sun, 20 Sep 2020 14:32:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200920180758.592217-1-peron.clem@gmail.com>
 <20200920180758.592217-6-peron.clem@gmail.com>
 <2d2799c5-62e8-8e64-c739-3d85b89c1178@sholland.org>
In-Reply-To: <2d2799c5-62e8-8e64-c739-3d85b89c1178@sholland.org>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Sun, 20 Sep 2020 23:32:03 +0200
Message-ID: <CAJiuCcfH3Z=-ow0S1Za_Qtvx_Bnjic9ivNEtGUmyVTgetgkZhQ@mail.gmail.com>
Subject: Re: [PATCH v3 05/19] ASoc: sun4i-i2s: Add 20 and 24 bit support
To: Samuel Holland <samuel@sholland.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: devicetree <devicetree@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 linux-sunxi <linux-sunxi@googlegroups.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Marcus Cooper <codekipper@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
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

Hi Samuel,

On Sun, 20 Sep 2020 at 20:45, Samuel Holland <samuel@sholland.org> wrote:
>
> On 9/20/20 1:07 PM, Cl=C3=A9ment P=C3=A9ron wrote:
> > From: Marcus Cooper <codekipper@gmail.com>
> >
> > Extend the functionality of the driver to include support of 20 and
> > 24 bits per sample.
> >
> > Signed-off-by: Marcus Cooper <codekipper@gmail.com>
> > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> > Acked-by: Maxime Ripard <mripard@kernel.org>
> > ---
> >  sound/soc/sunxi/sun4i-i2s.c | 11 +++++++++--
> >  1 file changed, 9 insertions(+), 2 deletions(-)
> >
> As I have mentioned before, if you want to support a 32-bit slot width on=
 sun4i
> variants (which patch 2 does via TDM and this patch does via PCM format),=
 you
> need to fix sun4i_i2s_get_wss() to return "3", not "4", for a 32-bit inpu=
t.

Sorry I didn't get it the first time.

Is using a switch case is a correct solution?

static s8 sun4i_i2s_get_wss(const struct sun4i_i2s *i2s, int width)
{
switch (width)
{
case 16:
return 0x0;
case 20:
return 0x1;
case 24:
return 0x2;
case 32:
return 0x3;
}

return -EINVAL;
}

Clement

>
> Cheers,
> Samuel
