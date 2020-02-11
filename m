Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 402D9158CB9
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Feb 2020 11:34:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DADCB1662;
	Tue, 11 Feb 2020 11:33:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DADCB1662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581417260;
	bh=mXmaA5nTKpknROZUmEJzR93VzaWZ9+GxlqS0bojN4yw=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XIjXHmw9OWcZu5THjERtw9TwWOnqH1oNQhdkdFfmjwW79M78Uoa9sL8EecL4iOnmT
	 XdO9qdDdfc+E1Iar/pZiwWi3BieIboYRIw2ZdnwOOMY289qT2ueJ4XfI2PnNwgdZed
	 fWalcxuPNMF3P9yV0WN9A1yX3u8Yd91zdPlV3Qmk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E7D43F800F0;
	Tue, 11 Feb 2020 11:32:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30CD4F80145; Tue, 11 Feb 2020 11:32:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 031D4F8013D
 for <alsa-devel@alsa-project.org>; Tue, 11 Feb 2020 11:32:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 031D4F8013D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="F75AoJ0k"
Received: by mail-io1-xd43.google.com with SMTP id s24so11139864iog.5
 for <alsa-devel@alsa-project.org>; Tue, 11 Feb 2020 02:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=acqKIKxMk1ga+UXjZx0pO+uULDhx0aD237j2IcuMs3M=;
 b=F75AoJ0kE/X4joGuYl5xuOPa2s930Y4vJgrkNUNO1fnchEjO2OBLTCPkNZupv354Hk
 ysqBNxv/hWQLLx+r4Uk19L9veEAEh3o9botS4SeVrCQSSnWvIzDjzmvdz1XAqWMF+Bdu
 sZNdT6+KhorsUbgf0DeEWK4U30apjPtUjnEPhDjrILdKXanKgkhB+2sp//U3+uJhcOXf
 U/AfUAL6Dz/jnr+HlbIb1sbx72VYPI1e4lhN5b6qSeohm8EbxnTbykmLCFHStGO8924v
 R9navfXcEC8P/hRi+gZVBgt5b9Bi3HweWDk3wOeyol/sQ8CZQA2/C+MW1MNRA3C4Zh3T
 +FJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=acqKIKxMk1ga+UXjZx0pO+uULDhx0aD237j2IcuMs3M=;
 b=tGqjepOiU1b+/X0aro++S+Iz3uTSdcRrIgpDDkudBLBnSPeZX9baAhNZlZqcw3F/mp
 Alo3npuwdJI5ngA0DNlopFY1rXCLrajni/yGkHtIYliOOtyirxZiPFbr4QPODP5hJFHl
 xNb9/PwqqdYpGuvV+/bTnyvNZ+6waWGP+a7UMNpIAiViRq5E7PDqVESsHDw/MQksmo95
 1f3i/lHS/sBn6s52Zrt9fazuokJDGKwduId3a2HMhXHkKKL7cxKaFO3Touv1FVYETk6H
 zgK98vcyHVCl6eKwbdhdVEUuqjEtax7L//Ke6GqevrVgh5sBBO+MPTOz0fbH3DcfSykz
 a5GQ==
X-Gm-Message-State: APjAAAWSHunM2AY6+5wQ4UouMxZxheyD79zHpdCJNcY13FgnF6xr6Zk+
 ARYtcO/XyZSCZ0VVWEo/lTSbExzHCR2g7Guc+O/gvw==
X-Google-Smtp-Source: APXvYqz81+/FxW2t3SgtfxeX3WldboHtJGgBOruwzqwjN8VV3Ao1Ie3aqPBBA1FViU7oWq6aTuLVpKvWPBjTK1wJ3B4=
X-Received: by 2002:a5d:9f12:: with SMTP id q18mr12882878iot.235.1581417151646; 
 Tue, 11 Feb 2020 02:32:31 -0800 (PST)
MIME-Version: 1.0
References: <20200204102016.I73b26b5e319de173d05823e79f5861bf1826261c@changeid>
 <20200210183803.GB14166@sirena.org.uk>
In-Reply-To: <20200210183803.GB14166@sirena.org.uk>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Tue, 11 Feb 2020 18:32:20 +0800
Message-ID: <CA+Px+wV8R1eA9cy5V9LsEAAd2TxjKjf5aPBhwh+5a4-qeimOPA@mail.gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Dylan Reid <dgreid@google.com>, Jimmy Cheng-Yi Chiang <cychiang@google.com>,
 =?UTF-8?B?SmlheGluIFl1ICjkv57lrrbpkasp?= <jiaxin.yu@mediatek.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: max98357a: add speaker switch
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

On Tue, Feb 11, 2020 at 2:38 AM Mark Brown <broonie@kernel.org> wrote:
>
> On Tue, Feb 04, 2020 at 11:04:06AM +0800, Tzung-Bi Shih wrote:
>
> > Some machine may share the same I2S lines for multiple codecs. For
> > example, mediatek/mt8183/mt8183-da7219-max98357 shares the same lines
> > between max98357a and da7219.  When writing audio data through the I2S
> > lines, all codecs on the lines would try to generate sound if they
> > accepts DO line.  As a result, multiple codecs generate sound at a
> > time.
>
> Rather than adding this in the driver it would be better to add some
> _PIN_SWITCH() widgets to the speaker outputs, those exist for
> essentially this purpose.

(We take rockchip/rk3399_gru_sound.c as a reference to use SOC_DAPM_PIN_SWITCH.)

Did you mean (in machine driver):
- Add SND_SOC_DAPM_SPK("Speakers", NULL)
- Add SOC_DAPM_PIN_SWITCH("Speakers")
- Add DAPM route "Speaker" (from max98357a) to "Speakers"
User space program controls "Speakers Switch" to toggle the switch?

We found the method cannot avoid max98357a->sdmode being set.  As a
result, max98357a consumes power even if we don't switch on it.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
