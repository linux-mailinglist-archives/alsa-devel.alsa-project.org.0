Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6BB22168E
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Jul 2020 22:48:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C1A0845;
	Wed, 15 Jul 2020 22:48:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C1A0845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594846136;
	bh=UuICVjdPHq27v+e/qYqn0W4kmOJbCHL6Dc6qsEtZPKk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aaGbsZSzYLpxewZ6wmIZiVIXR//n8dFgneNOA+oDoS+yrsfCm6xYpmmDHvs9xNG9p
	 DUfnygZLnOBiNpRPrTtv2iyeZ6/MkP7BiTpyJgsD6/UCHCjxsUCRYAnPqXMIn6IE1W
	 lfn4Yu2eZD8aLHxKg/oeU06Wh4zVyuq0pYdKSNGY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 768EAF80113;
	Wed, 15 Jul 2020 22:47:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ED28EF8021D; Wed, 15 Jul 2020 22:47:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5A74CF80113
 for <alsa-devel@alsa-project.org>; Wed, 15 Jul 2020 22:47:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A74CF80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Hf3pdpYH"
Received: by mail-pl1-x641.google.com with SMTP id o1so2894094plk.1
 for <alsa-devel@alsa-project.org>; Wed, 15 Jul 2020 13:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=FXz7OnFn9ZprLznWsMLDc1PTFviPFIrchOGsQ58Z+yI=;
 b=Hf3pdpYHLXpQj0ceAPhAiJWguzWIx1DkVx7VzOu8/NuBvdM0uzSDDQoXF8+61PDq/G
 5Gzh0SQ1ifzWaK3+VdLkWAet53Z4WTCzPNYk1wmPq9dVabyxntyXt7Mx3X8fPAiOfSy9
 iaTb0FZ9jSe3Wkkw4YloqRpQpVgw13bN9c3YBE2V+JxikNgZK4ZGNTdUzj+XP55eJ0jb
 rlospzo9NEnSdP9H0quq0WHGeo41hjgffgLpGc7iSDxLToaO5SNhQTDVYhHPuB+zPXGq
 ruW75+BJgJf3+ZIFuTWqoKMbzJ4IcuE6MaclsR2e8NSHoIpoYMRuxHc9RvpBbo4aKDBp
 plTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=FXz7OnFn9ZprLznWsMLDc1PTFviPFIrchOGsQ58Z+yI=;
 b=bBESU2CkEmbBm2gH089Gx7QhI43S25GAhmjROmYVKTXHf7tkwb9c4A2sVUxavlJh31
 QHlT2QlsRZsnp7TOJnMIbrdqcF8YR+W42uAfcHLIHzbyv64a519MzmxMF6jEC93bgxQS
 LdYTQXUQCHlV99Y9OTAMbxBSJ1PCeevEG+GbDBL8hnF3tv0EWSACE+W04fux8U3sJJj4
 rc0orlxyzexdpSaDvdxi+9jpyPUSLvGvmop7Bmjcleup283NPe0fsZunKzwp7qxcyGVw
 Ch/imJnqkll96ux3Uz0koIjVGrGmL/HQ1Hy9j1I3+MFdVq6ny87tOQtU1wc8SlrwF0mN
 uXOw==
X-Gm-Message-State: AOAM533y8DoqAykI9eofpsLn08RUEFhWfOSZUknmbbP/0f/7ESJFrbSH
 89nxkjPIPKLAD6nG5zW5zIc=
X-Google-Smtp-Source: ABdhPJwoIb2MvOzijl+bvxJwJXZRfIdjOy5U9ImsWQ93NI6qGX2IrEdqizHwXV3920DgPiADXBKk3A==
X-Received: by 2002:a17:90a:e2c7:: with SMTP id
 fr7mr1460963pjb.103.1594846023187; 
 Wed, 15 Jul 2020 13:47:03 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id c14sm2839648pfj.82.2020.07.15.13.47.02
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 15 Jul 2020 13:47:02 -0700 (PDT)
Date: Wed, 15 Jul 2020 13:46:38 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Arnaud Ferraris <arnaud.ferraris@collabora.com>
Subject: Re: [PATCH 0/4] ASoC: fsl_asrc: allow selecting arbitrary clocks
Message-ID: <20200715204636.GA14539@Asurada-Nvidia>
References: <20200702142235.235869-1-arnaud.ferraris@collabora.com>
 <20200702184226.GA23935@Asurada-Nvidia>
 <3f39a0bb-a766-f646-28b3-a51cf9983c6b@collabora.com>
 <3fea8912-63df-ff27-0c29-6284a85107ab@collabora.com>
 <20200714201544.GA10501@Asurada-Nvidia>
 <20200714202753.GM4900@sirena.org.uk>
 <20200714205050.GB10501@Asurada-Nvidia>
 <20200715140519.GH5431@sirena.org.uk>
 <0a56326b-27a9-d9f4-3923-8773963d7548@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0a56326b-27a9-d9f4-3923-8773963d7548@collabora.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: alsa-devel@alsa-project.org, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 kernel@collabora.com, Fabio Estevam <festevam@gmail.com>
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

On Wed, Jul 15, 2020 at 06:18:38PM +0200, Arnaud Ferraris wrote:
> Hi,
> 
> Le 15/07/2020 à 16:05, Mark Brown a écrit :
> > On Tue, Jul 14, 2020 at 01:50:50PM -0700, Nicolin Chen wrote:
> > Anything wrong with ASRC selecting SSI1 clock for both cases? The
> > driver calculates the divisors based on the given clock rate, so
> > the final internal rate should be the same. If there's a problem,
> > I feel that's a separate bug.
> 
> Calculations are indeed good, but then the clock selection setting in
> the ASRCSR register would also use SSI1 as the input clock, which
> doesn't work in our case.

Could you please elaborate why it doesn't work?
