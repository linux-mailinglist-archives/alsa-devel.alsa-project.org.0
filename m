Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD07E23AFE4
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Aug 2020 23:59:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 664BA1669;
	Mon,  3 Aug 2020 23:58:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 664BA1669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596491978;
	bh=9uKgy+xyAS14dWPqnyrPdH8UUIYXlpB+fl8eUVf4JEs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=twlmv1F3qDdA7QYoEx76J/2mWM+00QJehA6JD7URtcACxzRIFHorOyIh3SbRbonB6
	 lQiZBDY78MCEaYR0tSH9217m+sOcNOoSOHWvfTAoPK6GnoPx66vZq3EhoUD9MgQwN0
	 lm7hK9o5QvROioxChXzk9IIFir1iNqUG7bUVNMF8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 76CE5F80234;
	Mon,  3 Aug 2020 23:57:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E4670F80218; Mon,  3 Aug 2020 23:57:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F3A04F80148
 for <alsa-devel@alsa-project.org>; Mon,  3 Aug 2020 23:57:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3A04F80148
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="cWCkXl8L"
Received: by mail-pf1-x444.google.com with SMTP id s26so19038021pfm.4
 for <alsa-devel@alsa-project.org>; Mon, 03 Aug 2020 14:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=yuVzOzKa2hJtd7uaE4veinXP3zTwwT8hP9/UMc26Jxo=;
 b=cWCkXl8L5UI8SuRjQ0cl053tTauIzhi1afwfNgdwh+S/UrqCe7b6aQGPQk0rAl20em
 Glao1b3gOcesofK02TSpw5cNYZvAFOShat12fYg11KP70iKBxdvyi911W6RX/otsR5Az
 0dXE+t4tOtG1SRK/Nnab/slKYIK2LQXD2MYu6VeCuOrZfyoRG5DJQZ40VyyaQxIz6T7s
 R+JiLGDzcw6HtZ5oPnPU68nrEGi66BH+YcGNnATp1qAAhw04FBNX41QxHdpHZru+wqrM
 bn9qgqzWEjtrWmhNB6yGIaBChRxAwB2CdYQAAEL5M7rEfQvyspMLu4+3pk5mCM45S3cm
 WKIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=yuVzOzKa2hJtd7uaE4veinXP3zTwwT8hP9/UMc26Jxo=;
 b=NjTJn0QawE/BH/zk3RuCybYTNQwXrj//o7RFP8XxZdpxtCW15ZYtVE007SMcNed5SV
 zkmloQ8bozESdrNVljPNX80zfCeS5TpeJt2k8bMg60UVpwmtB4Q+8onFTXOykwwqzZyS
 3HKPwGgT7wIklFoCijj43TTmFaUWxd2JKwVz12T8kYDC6Z+j+ChvYR+lcz0+Hwbu6cQ8
 wAfcWrvHOk5UpWA/CZ6Y72eyWjKoxVuFjtjEbjcA3Wmm1q9lZpEtR8v7OZHcYWV3/db4
 IqQ8xw8d4BSTcUopXkXQ3JXNeQ1MJzVx5Q/WSZ0blCKm1f0E9/m1hEP9J9qrlxDi3+Gl
 wa9w==
X-Gm-Message-State: AOAM533QX2xuh1AZqK3L8lBooVxGKb+Ep2Lp5ZraBJvVydtjO61Oi2ZX
 EkCctThXr891cDMerNN1D4A=
X-Google-Smtp-Source: ABdhPJygNIzoSP6mtrUmL5aG3TEs5sU+U9sui5b00C7eA2kbujQ2/HiOWRUN0IxJIz03F+8nQCZiWg==
X-Received: by 2002:a63:c447:: with SMTP id m7mr16425864pgg.118.1596491868043; 
 Mon, 03 Aug 2020 14:57:48 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id lk16sm406515pjb.13.2020.08.03.14.57.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 03 Aug 2020 14:57:47 -0700 (PDT)
Date: Mon, 3 Aug 2020 14:57:35 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Clean code for synchronize mode
Message-ID: <20200803215735.GA5461@Asurada-Nvidia>
References: <1596424674-32127-1-git-send-email-shengjiu.wang@nxp.com>
 <20200803054037.GA1056@Asurada-Nvidia>
 <CAA+D8AOGF44UUq=P1S-M5TUwDUaOnqVmHJKPDBM9DAzt1nVzmQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA+D8AOGF44UUq=P1S-M5TUwDUaOnqVmHJKPDBM9DAzt1nVzmQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel <linux-kernel@vger.kernel.org>
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

On Mon, Aug 03, 2020 at 04:04:23PM +0800, Shengjiu Wang wrote:

> > > clock generation. The TCSR.TE is no need to enabled when only RX
> > > is enabled.
> >
> > You are correct if there's only RX running without TX joining.
> > However, that's something we can't guarantee. Then we'd enable
> > TE after RE is enabled, which is against what RM recommends:
> >
> > # From 54.3.3.1 Synchronous mode in IMX6SXRM
> > # If the receiver bit clock and frame sync are to be used by
> > # both the transmitter and receiver, it is recommended that
> > # the receiver is the last enabled and the first disabled.
> >
> > I remember I did this "ugly" design by strictly following what
> > RM says. If hardware team has updated the RM or removed this
> > limitation, please quote in the commit logs.
> 
> There is no change in RM and same recommandation.
> 
> My change does not violate the RM. The direction which generates
> the clock is still last enabled.

Using Tx syncing with Rx clock for example,
T1: arecord (non-stop) => set RE
T2: aplay => set TE then RE (but RE is already set at T1)

Anything that I am missing?

> > > +             if (!sai->synchronous[TX] && sai->synchronous[RX] && !tx) {
> > > +                     regmap_update_bits(sai->regmap, FSL_SAI_xCSR((!tx), ofs),
> > > +                                        FSL_SAI_CSR_TERE, FSL_SAI_CSR_TERE);
> > > +             } else if (!sai->synchronous[RX] && sai->synchronous[TX] && tx) {
> > > +                     regmap_update_bits(sai->regmap, FSL_SAI_xCSR((!tx), ofs),
> > > +                                        FSL_SAI_CSR_TERE, FSL_SAI_CSR_TERE);
> >
> > Two identical regmap_update_bits calls -- both on !tx (RX?)
> The content for regmap_update_bits is the same, but the precondition
> is different.
> The first one is for tx=false and enable TCSR.TE. (TX generate clock)
> The second one is for tx=true and enable RSCR.RE (RX generate clock)

Why not merge them?

+		if ((!sai->synchronous[TX] && sai->synchronous[RX] && !tx) ||
+		   ((!sai->synchronous[RX] && sai->synchronous[TX] && tx) {
