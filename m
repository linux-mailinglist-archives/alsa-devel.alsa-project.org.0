Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0B32F25E2
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Jan 2021 02:54:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC0A116DE;
	Tue, 12 Jan 2021 02:53:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC0A116DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610416466;
	bh=fFF06gvOInxBuh6yqa/OfOTwyq/5FfFXH24jqEvV+/I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sqX6c6wRVr8OD3upvx27uCFLwrT84gdC2Y0k9qZXzajgntongsU8omyN+tAPrF/fC
	 QAIBT26SL6PLWxlvbAOxzbk2Zr82sYjzVVCH9zmBunGO2zaub+xOCXG1HpIOhBMJ1W
	 MhlH69YSjGU4+z8brESx6Y4cyXBmurBRF8ZFJSrg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A4BEF8013D;
	Tue, 12 Jan 2021 02:52:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A0172F8016D; Tue, 12 Jan 2021 02:52:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED,
 USER_IN_DEF_DKIM_WL autolearn=disabled version=3.4.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0927CF8013D
 for <alsa-devel@alsa-project.org>; Tue, 12 Jan 2021 02:52:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0927CF8013D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="DPDOliIt"
Received: by mail-ed1-x52e.google.com with SMTP id cm17so558349edb.4
 for <alsa-devel@alsa-project.org>; Mon, 11 Jan 2021 17:52:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4zS65oHZI1XGE0PsHv/I1VBkh7mS9apg/fqp6AmDsh8=;
 b=DPDOliItx36iScTILgYIJZ4xHPtOMqfkUmJTnmAdwL7h3UYQlHXkvkirKoP+HARfnG
 CzvFEEVSmGbtnkMx/poN8eV/hENIJCI57SrWG7fExhSkELtyRtx2VbTeLQwxpiJCeDDa
 144MTdUvtxtvgAgpOpuUczDjI/+9otu8qJm741JYVTwEp2xZfV9A7ZZbItyTRhB5m+3q
 AXHBX2Rsd5L+vZqmACkXqjOmG0ULrx/QxGMpk7eYrcZBeYRkh0Mq4rwzo/06vIZ6ZlrV
 2n2fTFA5Mq8pY5wv8njQSbDjJxmOvWA4ruKdWguauK3vzrz3TEj4pPzKEVE5QupVz9LV
 pNuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4zS65oHZI1XGE0PsHv/I1VBkh7mS9apg/fqp6AmDsh8=;
 b=EAcAVPiCG0bIBFCwkENpb+reffEHC89qV43o9YKjZ8kod0dwbw5wB8kyKzy0Bwep/7
 89zKKCFpxbW8s12UeuUL+VYcKr8jejz8aVuy6x4OaL/3CEEHlLici6i+wdaWjutwD4F0
 InycJW74tQ1EjKWXw5+N5fa7obkTMbBjUFHV+hvwppSCQH3UO5pL9OJ3Dkc83kfH+tQD
 C1xhBytZWhvGP+Kq+bLkdsk6RsNRtkUx3O2IlyFkgDZCNE+N3QOQ6eE702cItEdGxZdS
 qFfwxOHzzAVTtvDKqqyOObKN9O2gZtejE9yEkivfP8FU8chPZaw9qPgGxpdCMSWmifjN
 19dA==
X-Gm-Message-State: AOAM530Q7Kdr6c7qCjSE2Bdfwj4PS6EcIJZGnk9vwI6kvp/LDu5UUNlg
 ftsHjcY6XGA1xaWpDkCLd/XacEIA0N7HgF4GvNVTtQ==
X-Google-Smtp-Source: ABdhPJyAnO+el2FWTwrbHeLEzIQMyCJPfxUg5Bg+2Qna+GqLQ0Yw3dGRmPPcl3Sm2FHMLsKtOE4XeIw6oMjoHylA/IM=
X-Received: by 2002:aa7:cdc3:: with SMTP id h3mr1526106edw.52.1610416362201;
 Mon, 11 Jan 2021 17:52:42 -0800 (PST)
MIME-Version: 1.0
References: <20210107085942.2891525-1-yuhsuan@chromium.org>
 <20210107135459.GB4726@sirena.org.uk>
 <CAGvk5PqMCEib8Yr=V4SxT0BBMoC1+yGXm0y+52+LwC5dPQUVnA@mail.gmail.com>
 <20210112004207.GN4728@sirena.org.uk>
In-Reply-To: <20210112004207.GN4728@sirena.org.uk>
From: Guenter Roeck <groeck@google.com>
Date: Mon, 11 Jan 2021 17:52:31 -0800
Message-ID: <CABXOdTc-HkVW7UuDLoWf2opVO1n-W2EF-E2hJEm_D6=2P32_qw@mail.gmail.com>
Subject: Re: [PATCH 1/2] cros_ec_commands: Add EC_CODEC_I2S_RX_RESET
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: ALSA development <alsa-devel@alsa-project.org>,
 "Gustavo A . R . Silva" <gustavoars@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Yu-Hsuan Hsu <yuhsuan@chromium.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Guenter Roeck <groeck@chromium.org>, Prashant Malani <pmalani@chromium.org>,
 Pi-Hsun Shih <pihsun@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Benson Leung <bleung@chromium.org>, Cheng-Yi Chiang <cychiang@chromium.org>
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

On Mon, Jan 11, 2021 at 4:42 PM Mark Brown <broonie@kernel.org> wrote:

> On Fri, Jan 08, 2021 at 12:57:51PM +0800, Yu-Hsuan Hsu wrote:
> > Mark Brown <broonie@kernel.org> =E6=96=BC 2021=E5=B9=B41=E6=9C=887=E6=
=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=889:55=E5=AF=AB=E9=81=93=EF=BC=9A
>
> > > I think the request was to sync over all the commands that are
> supported
> > > in the EC rather than just split this one addition into a separate
> > > patch.
>
> > Got it. However, after running make_linux_ec_commands_h.sh to create
> > the new cros_ec_commands.h, I found there are lots of difference (1092
> > insertions(+), 66 deletions(-)). In addition, there are also some
> > redefined variables(most are in ./include/linux/usb/pd.h) causing the
> > compile error.
>
> > It seems not easy to sync cros_ec_commands.h. I'm afraid of breaking
> > something. Does anyone have any suggestion? Thanks.
>
> TBH that seems like a big enough change to split out from this and done
> as a separate series, I'd be perfectly happy to apply your original
> change.  I guess part of doing that sync up should ideally be to
> refactor things so that it can be done mechanically in future.
>

Being able to do it mechanically was the idea for introducing the script.
Unfortunately it doesn't help to have such a script if people don't use it.

Guenter
