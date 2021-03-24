Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E76BE346EFB
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Mar 2021 02:46:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66989166E;
	Wed, 24 Mar 2021 02:45:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66989166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616550371;
	bh=ptioshG+2dIFNP/OQB4kxeiMvcEgTk3PcQJ8b1Wlui4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l5/YXTiDDnyLjCjvuDVkeMYzZxqfyKYv3C697CFT0u8nEx6bN5HMLLngGfLQ0a92G
	 vN5V7w+P+OJcAWFZ3raR7OdLwfOKS4z9x7vut4hdFf/SP28Pl0FaA9k0h+k3l8LlhN
	 lSHHSJ5bcngVmQd6x7RKX4Uygaw49jsSG62zn3zg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A6939F80155;
	Wed, 24 Mar 2021 02:44:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B87F5F8025F; Wed, 24 Mar 2021 02:44:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 559D7F800EE
 for <alsa-devel@alsa-project.org>; Wed, 24 Mar 2021 02:44:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 559D7F800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="jxs+sx48"
Received: by mail-qt1-x833.google.com with SMTP id y2so14061287qtw.13
 for <alsa-devel@alsa-project.org>; Tue, 23 Mar 2021 18:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ptioshG+2dIFNP/OQB4kxeiMvcEgTk3PcQJ8b1Wlui4=;
 b=jxs+sx48jY9q1YOqNTS5XanF/iwJIMQahFq2kPojEMaYK2PVxwqZlQhUeIqPn6uX+C
 uPd3UPHLHesuU6uyioUWJWdwhVeHFDdNbab/L6NbQbZorUVtrC3fGAW7AT2gyb7OeFF7
 a0pJXJsE5K78tzkjvzGrY5tGpnGP2QWLYAEbR9MO+xUg4OnhYuwlkpGuUHnGxvW1Xf0F
 Njq7V77lwVapKjMUz+PdZmbY7AiY+4DrD8v2Rb6cChRjFlqPzU5BBy9+ZnZ9lA8qYlrO
 PtHItO/31nOvGJcKnCH54eqozZTWHuW9qz/dphkZ1DkvgZtYK1gVdV9FZoNYRgphoLvR
 4RWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ptioshG+2dIFNP/OQB4kxeiMvcEgTk3PcQJ8b1Wlui4=;
 b=m2ikGKazuJGiBn9wxUX0t3ux1SejNYhcr6LRWZntm4ECXdBnvrWOmzAjpEadmqAZTc
 3rNdaw4jdSO2rQJTXcRcCqXJOSLUYXSXfoNNP9HdYt4WG3ooNO0PZ6T/J6AWVudQWLPm
 /uiIXdG6aIdsfwYqtyLjItWZDG0IAR/k9MoPj0SVcYX7xkEBFcO6jVxOBuMjYDI3RBtV
 ektkDcyb+AMSKaomreqwFm/URbj7VcH5r2E79vTej0s8xAKqscb+ndzarWGWLzwjbUj/
 rKjF/GszVMX0M8UYGx3XPdIDHKOPi1BZnSlvke9PkBwbClVK5YQWaHD52Pq5BfjOvXDv
 QtZg==
X-Gm-Message-State: AOAM530/dbKIfnJ8andjPZocZ9yc//oJe3pkJ/u300AMEB2OoWYHFq9t
 XOEFb+a5ujNxlZVcFdYNU3QzDtnGp6qwKI492WU=
X-Google-Smtp-Source: ABdhPJxKcSdyS8HdLo4YR2hVKK5rxuhzXy8eprlF7YHHz/jSjMiCSwpeP9ucbyty5m4+XA51q4tdpxfvnQwtNvV9v2w=
X-Received: by 2002:a05:622a:454:: with SMTP id
 o20mr1067602qtx.292.1616550277946; 
 Tue, 23 Mar 2021 18:44:37 -0700 (PDT)
MIME-Version: 1.0
References: <1615341642-3797-1-git-send-email-shengjiu.wang@nxp.com>
 <20210310132404.GB4746@sirena.org.uk>
In-Reply-To: <20210310132404.GB4746@sirena.org.uk>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 24 Mar 2021 09:44:26 +0800
Message-ID: <CAA+D8ANXcyJ+GrEqTNuoNJ4wGCQfqjRkhcevt-eXSrNj_V128w@mail.gmail.com>
Subject: Re: [RESEND PATCH v2] ASoC: wm8960: Remove bitclk relax condition in
 wm8960_configure_sysclk
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, gustavoars@kernel.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 patches@opensource.cirrus.com, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 daniel.baluta@nxp.com, linux-kernel <linux-kernel@vger.kernel.org>
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

Hi Mark

On Wed, Mar 10, 2021 at 9:26 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Wed, Mar 10, 2021 at 10:00:42AM +0800, Shengjiu Wang wrote:
>
> > changes in resend v2
> > - Add acked-by Charles
>
> Please don't resend for acks, it just makes for more noise.

ok, but could you please review this patch?

Best regards
wang shengjiu
