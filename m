Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6CB22E688
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jul 2020 09:29:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B64E9168F;
	Mon, 27 Jul 2020 09:28:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B64E9168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595834972;
	bh=NqZE15aRLSmm0dQKG4/8e54BxSBd/jvzZxVHgTCbsT0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rNtKjkf9hnVLYnHYpbjs6XMIIKMfbdSBOTUIuGv92JWCmQssEbJKYSW/lNLjnJrZN
	 qGeC8olvhVrQF9Kt2FtvZe+CKVd1HLs6+ccfmRr4Tpwi4CXj7eAWYe7HM6Zzw73SDR
	 TlCKrHbDJHh7j9o9dS0MAlkYbLSSC3NacR4wAtUU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CE4AEF8013C;
	Mon, 27 Jul 2020 09:27:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A044F80171; Mon, 27 Jul 2020 09:27:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E490F8013C
 for <alsa-devel@alsa-project.org>; Mon, 27 Jul 2020 09:27:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E490F8013C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Cqmot9h6"
Received: by mail-pj1-x1042.google.com with SMTP id gc9so8741118pjb.2
 for <alsa-devel@alsa-project.org>; Mon, 27 Jul 2020 00:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=2+yXBFkFF1Q2hs9eJ61ZmtSb7ia2MRn3KxqycD73Flw=;
 b=Cqmot9h6sPwuj2faph4jOKs5weve7eUvzLaNx9IhHsELXyEoGYyUza9Ardp+smS119
 TGfMgjCb+Q7A7eMlTsKK1TArG0L4+p6Yh5Hitl9TxMzHIgngQbZVbvG96NyRIghMd4GZ
 PSQhOpZYac/IkW1TddyHCGy0l1+sGFE81BAyo2Hb5QjOOcz26H384tpdAi1lBSX3uiAT
 /Fot+ATlEjMnzh3JJdOAz9bKQICojC/8+16x4lno+1tGL0LHnT06tvaHkiv5jK2COAjS
 Y5WBOGm3KMcL9mujuHQ+2frzPL0jk3yHfeDvv9sz4bvVgOxWnCyTONCx+MkvocuDhwAh
 xXLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=2+yXBFkFF1Q2hs9eJ61ZmtSb7ia2MRn3KxqycD73Flw=;
 b=T7l/CJWT/zmKR0cuTpmzC9NGfTHTDCn9c5Px5lVIZhE+ZoLf3/qJOhS/64GuCWBs/7
 pGzseXRURj8o0AUFGSghAfbRgvrXT3GGphxsCztBfXV5jbmjjxtkEq3iu9T6qdcbsAC2
 t8S4kMpoD5NIEzA1IkB1w1hAAhIdQxMHlYI6rhk/DbZV3ju1gufsJcpjav3ZU3nWRN7z
 KYmynSl0f5hbAfxG3egs09Xlia6MGQI4hqVVPLkrVkz2pOI1m3qRXGaxe9gqMDGzNC4d
 2T95tMeZGeQ6rNNp+TMpRfZogIfKDOsdfkv+UCHguHrgppofknd17v/QakVRpUt9d3a/
 6Rng==
X-Gm-Message-State: AOAM531M6tjgpi2JX6RuBtiprvcRe5jOV5DX0/A1rUw21YKCTYMwIUTD
 cYGY0A8o5WJmlNHi0QTh4y4=
X-Google-Smtp-Source: ABdhPJzONbuJenpMzjphtdEOeUlAPu08ifyLaXxU1TZh2ESyDjSyATv/zYZBeXghWq9As+UF665jdA==
X-Received: by 2002:a17:90a:db8a:: with SMTP id
 h10mr17706557pjv.58.1595834860479; 
 Mon, 27 Jul 2020 00:27:40 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id s10sm52384649pjf.3.2020.07.27.00.27.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 27 Jul 2020 00:27:39 -0700 (PDT)
Date: Mon, 27 Jul 2020 00:26:59 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: Re: [PATCH] ASoC: fsl-asoc-card: Remove fsl_asoc_card_set_bias_level
 function
Message-ID: <20200727072658.GA16513@Asurada-Nvidia>
References: <1595762417-2190-1-git-send-email-shengjiu.wang@nxp.com>
 <20200727005558.GA30124@Asurada-Nvidia>
 <CAA+D8AOfh1gDec=0BPk6SUutqtY_gL1Rm1-Uc4Dv4s-86LAwPA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA+D8AOfh1gDec=0BPk6SUutqtY_gL1Rm1-Uc4Dv4s-86LAwPA@mail.gmail.com>
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

On Mon, Jul 27, 2020 at 02:33:18PM +0800, Shengjiu Wang wrote:
> > >  static int fsl_asoc_card_audmux_init(struct device_node *np,
> > >                                    struct fsl_asoc_card_priv *priv)
> > >  {
> > > @@ -611,7 +600,6 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
> > >       /* Diversify the card configurations */
> > >       if (of_device_is_compatible(np, "fsl,imx-audio-cs42888")) {
> > >               codec_dai_name = "cs42888";
> > > -             priv->card.set_bias_level = NULL;
> >
> > Can check if set_bias_level is still being used with this change.
> 
> Do you mean to keep this line:
> priv->card.set_bias_level = NULL; ?

Sorry. You can just ignore this part -- just double checked the
code, and I think I misread something :-/
