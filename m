Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C34B5431ED
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2019 01:57:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3888417CB;
	Thu, 13 Jun 2019 01:56:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3888417CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560383843;
	bh=zUJx6XFXsWxCdvd3R004vNbhR35rvfA63o/WdOV7Nlk=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dFKGwJjYRT0QPASVnFoLM4DOdfjaZbGcFHgnPcHFQgPpyTpRmHGEsNTklAy9gqrS5
	 j79TPg+e/Q/VOeRSDj4KNmpBo9m0lAj6282XWVIbmkVHb5sNxZM6PXKnqlID2HIDgJ
	 pa/B9HAkIbrWEtnXueqtortafinca6FGrpDmbsCM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AA818F896EA;
	Thu, 13 Jun 2019 01:55:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D8903F896E0; Thu, 13 Jun 2019 01:55:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4BD9F80791
 for <alsa-devel@alsa-project.org>; Thu, 13 Jun 2019 01:55:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4BD9F80791
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="J8KjiXy8"
Received: by mail-pg1-x542.google.com with SMTP id k187so9299460pga.0
 for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2019 16:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FncTW9icD+cnLcX19bpYZpu4vyVjhu2JKDPqZ1+/Ryk=;
 b=J8KjiXy8uN1Jio07urQegYh7uz7/hdHT44kn6jPisJgD36SZ4NpMJ9DpnYXd61rR0W
 ZgZB+aaCLNkcvkS1mR+ww55lBlgpvH7IOej2m9KkCeDY6KYntmYDpVxmm1HW+vIRVS6U
 3gm3Y6KzDfgCo3727cxs0HpFf3/LIxveAPITaqEiw+0euI/lFA3D8H8TPnG/gL0yfeiS
 iIH6Xv4f2L9/EPgrGFS/NIsAXZ7o3b3yYUbzfzovcyOR+7iPI7DWa0g+VjRI4ifw8ewD
 1gc8bHzgJ1xxq/fi5fh99VVLXhI8BVUAU1Mh/lxx1dVK88biFgNTao1VF6jmpj2rAaF1
 GJKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FncTW9icD+cnLcX19bpYZpu4vyVjhu2JKDPqZ1+/Ryk=;
 b=R3wU7syhReo71LczWYerZ15fbRdeCYMPirgjUjNnkJ3L1CcbtqOsihkOK4nHmNxGh2
 Gev2WO0PHP/NWBfSCXUsjpHtAEtTgZXmGrvbW/5LPHONQ2alC7ZAR2Pq722kcQY7epre
 bOOFE1ZZ7Mp47L7lsp/GRg4FdzDZGcTsR8D+aUrkfOrw9BOkWgtA3yuWEG4nvql4HZP0
 8WfdmsOxXN0ws0rBD5rFu+umgABNEwmm8Qd0fluteRrfuB1e4n0PmR3VAC3+KSzi6q8y
 WZxa8N2+XSkEr//kCAElLDoucjdYpRVhgr7Mc5kZXQmG12qN0ALb6oWpJVjcYCojoW9h
 SteA==
X-Gm-Message-State: APjAAAXabbANfFN5UBxCxaX6viGv4IXljrtxFztiOsu1EA1AA2WlqQcr
 FUkOgR7petP58Fk1CJxWDDsEcBo7GlU9DZShLlpvPA==
X-Google-Smtp-Source: APXvYqzfk1eRAHeNvQHbEfSZQi08QiYeoNKjd0uOd+Z+Hzx93yW3+4v31GBjDP2vyoJttKOK2Cwdpk4fRPLwanoJ+PQ=
X-Received: by 2002:a63:1d5c:: with SMTP id d28mr27102833pgm.10.1560383729952; 
 Wed, 12 Jun 2019 16:55:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190612232502.256846-1-nhuck@google.com>
In-Reply-To: <20190612232502.256846-1-nhuck@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 12 Jun 2019 16:55:18 -0700
Message-ID: <CAKwvOdkPQyK3oJk0qPQyfwVcvtdBSF6oN83VOW8kcy3zWyBkgA@mail.gmail.com>
To: Nathan Huckleberry <nhuck@google.com>, Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 clang-built-linux <clang-built-linux@googlegroups.com>, cernekee@chromium.org
Subject: Re: [alsa-devel] [PATCH] ASoC: tas571x: Fix -Wunused-const-variable
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

On Wed, Jun 12, 2019 at 4:25 PM 'Nathan Huckleberry' via Clang Built
Linux <clang-built-linux@googlegroups.com> wrote:
> Since tac5711_controls is identical to tas5721_controls we can just swap
> them

380 static const struct snd_kcontrol_new tas5711_controls[] = {
381   SOC_SINGLE_TLV("Master Volume",
382            TAS571X_MVOL_REG,
383            0, 0xff, 1, tas5711_volume_tlv),
384   SOC_DOUBLE_R_TLV("Speaker Volume",
385        TAS571X_CH1_VOL_REG,
386        TAS571X_CH2_VOL_REG,
387        0, 0xff, 1, tas5711_volume_tlv),
388   SOC_DOUBLE("Speaker Switch",
389        TAS571X_SOFT_MUTE_REG,
390        TAS571X_SOFT_MUTE_CH1_SHIFT, TAS571X_SOFT_MUTE_CH2_SHIFT,
391        1, 1),
392 };

vs

666 static const struct snd_kcontrol_new tas5721_controls[] = {
667   SOC_SINGLE_TLV("Master Volume",
668            TAS571X_MVOL_REG,
669            0, 0xff, 1, tas5711_volume_tlv),
670   SOC_DOUBLE_R_TLV("Speaker Volume",
671        TAS571X_CH1_VOL_REG,
672        TAS571X_CH2_VOL_REG,
673        0, 0xff, 1, tas5711_volume_tlv),
674   SOC_DOUBLE("Speaker Switch",
675        TAS571X_SOFT_MUTE_REG,
676        TAS571X_SOFT_MUTE_CH1_SHIFT, TAS571X_SOFT_MUTE_CH2_SHIFT,
677        1, 1),
678 };

Thanks for the patch!

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

Alternatively, we could make 2 variables w/ the same variable, 1
variable.  It seems there's at least 4 `_control` variables:
tas5711_controls
tas5707_controls
tas5717_controls
tas5721_controls

so maybe `tas57X1_controls` would be appropriate?  Not sure if the
maintainers have a preference here?

(Looks like L669 also refers to tas5711, but it seems there no tas5721
equivalent for `_volume_tlv`.)
-- 
Thanks,
~Nick Desaulniers
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
