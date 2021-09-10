Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E82024072C4
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Sep 2021 22:59:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E0371696;
	Fri, 10 Sep 2021 22:58:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E0371696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631307557;
	bh=BwwjV8XDIVggQg6s8GrSOYSpphh+sc7pVpLuAzTfIS0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BmeHFmpNNHfy4KF6jCxFfpQF778bGmdbP5VFxsH4fzNsB+NJXDfQX0f8EicSgqEqV
	 CGcyavQbaPa4tySQwKnzIDysOX+kcUN1TRYrausH38YST9iaa+sALNL28GJgmQFy3+
	 aWU/AmdyxYKEe0r4lc7osGhH2g06XA+0zoChLFmU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B1043F8049C;
	Fri, 10 Sep 2021 22:58:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F4B9F802E7; Fri, 10 Sep 2021 22:57:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 94FF9F80166
 for <alsa-devel@alsa-project.org>; Fri, 10 Sep 2021 22:57:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94FF9F80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="NBgou7wf"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6901161208
 for <alsa-devel@alsa-project.org>; Fri, 10 Sep 2021 20:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631307466;
 bh=BwwjV8XDIVggQg6s8GrSOYSpphh+sc7pVpLuAzTfIS0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=NBgou7wfxHshP0dguPl+Om1ZdwsGX47llyFYlcmpv2ftnChx+azWhvZQGnipqewuC
 ehvBMJHQKaxqHG69Zzc4GJxdlHEkZjfYyLZ/GBS2J1usoNvMHJcbhFdaxLpPHaTf8+
 6JtP8BfayDXgT0zkW96fFCbYs1Oam2URTtrZAReBmwZbKWupDvzGu4LJbi3BO1mQP2
 AsyB16PANATWK3ziucHeeMD4Hn5J3xakbl6VMRgoIcwpWuqIdBcY/yhgmE6DhRKgQy
 HFFXe78lHxMbLK/4kIVpHKi6J8UE88cNDckHroTmGvkHGlEFj/6F6zLRbUdMYUlUP+
 opDQSIVtxEY+w==
Received: by mail-ej1-f43.google.com with SMTP id e21so6767491ejz.12
 for <alsa-devel@alsa-project.org>; Fri, 10 Sep 2021 13:57:46 -0700 (PDT)
X-Gm-Message-State: AOAM532rN4VPuueasNNcuL9lJChbrORrXUZTRvmxG6fd6jLBFH2nyKSH
 Gm6DhzswOU8GG8dUZqEwQ7IRCb5N9OtloqTRYw==
X-Google-Smtp-Source: ABdhPJwVGxTO23zicAema3Bya6cBAlS7a/oDBF+GxEOujEO4RrEkH9BHlX6+JPyCnzoDzMCc3DFk2h2eZmdUZo/k8og=
X-Received: by 2002:a17:906:850b:: with SMTP id
 i11mr9911436ejx.84.1631307465026; 
 Fri, 10 Sep 2021 13:57:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210907225719.2018115-1-drhodes@opensource.cirrus.com>
 <20210907225719.2018115-3-drhodes@opensource.cirrus.com>
In-Reply-To: <20210907225719.2018115-3-drhodes@opensource.cirrus.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 10 Sep 2021 15:57:32 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+HemsGyrRjAt093eJ34Uy_dTfHZKJ5gctyZtvmwcns0A@mail.gmail.com>
Message-ID: <CAL_Jsq+HemsGyrRjAt093eJ34Uy_dTfHZKJ5gctyZtvmwcns0A@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] ASoC: cs35l41: Add bindings for CS35L41
To: David Rhodes <drhodes@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Brian Austin <brian.austin@cirrus.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 - <patches@opensource.cirrus.com>, Linux-ALSA <alsa-devel@alsa-project.org>,
 david.rhodes@cirrus.com, Mark Brown <broonie@kernel.org>
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

On Tue, Sep 7, 2021 at 5:58 PM David Rhodes
<drhodes@opensource.cirrus.com> wrote:
>
> Devicetree binding documentation for CS35L41 driver
>
> CS35L41 is a 11-V Boosted Mono Class D Amplifier with
> DSP Speaker Protection and Equalization
>
> Signed-off-by: David Rhodes <drhodes@opensource.cirrus.com>
> ---
>  .../devicetree/bindings/sound/cs35l41.yaml    | 151 ++++++++++++++++++
>  1 file changed, 151 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/cs35l41.yaml

Please resend to the DT list so automated checks can run and it is in
my review queue.

Rob
