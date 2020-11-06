Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E59F52A9F9A
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Nov 2020 22:52:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 503F3168D;
	Fri,  6 Nov 2020 22:52:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 503F3168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604699573;
	bh=uwsXgcLIZfQC28FR7rAzsansUv03vySujB56VVYdu2I=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=thDBnh/JzMeDd8w2JNlcuVq1R9AKbtZyquAAzX//cpx/83Dg+suz3f1uogQ/Gu0va
	 XSAzz2CxEC/4RzEiexlcqy5xZKZQHIOeLaGCBQ72mp5Ufz8fILZlaTMjPvrCvZpQJ1
	 YboQE6mgoWfwSYFXNyjS7T5WK/C8Ju33lr3btQi8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BFACEF80127;
	Fri,  6 Nov 2020 22:51:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5AA6DF80234; Fri,  6 Nov 2020 22:51:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B78DCF800BA
 for <alsa-devel@alsa-project.org>; Fri,  6 Nov 2020 22:51:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B78DCF800BA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="fofen6cX"
Received: by mail-pg1-x542.google.com with SMTP id x13so1979851pgp.7
 for <alsa-devel@alsa-project.org>; Fri, 06 Nov 2020 13:51:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=cCOSuspQFM76bwwc9KyVB4ygiOrAQrMSCa7jrT+WOiE=;
 b=fofen6cX59+NrDsXNP2Ikx/VA8W/q34luWai9k3YMyeCn+Iq80JuJ+hdDhMEmzVBiU
 DzqUnMDf/t9ouMeF5UBMoNklNSCLeaNflA6Dq5A/Gvjbsi0vSf/DnJHzwQlk/Zt6asZ1
 5eMTrEjzTLJedHDomM3i159NfKz0tg6AeyPJ602FdfxzIiVNIWdHppHAwgFyjIYkQwnP
 JcrolOhV4v2gF4RA+ODyZhyI3aJT6uqWl1PLX5Y4mNb8N+sI/xt6uXOQZPjISd83/nBu
 eUcHzb0cbGjpOaKQ63JFyqqsjIpSq5L6JnkQLJg8PO1m1XPPwX/DQkIQ5kGy6vgFKX2f
 H6uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=cCOSuspQFM76bwwc9KyVB4ygiOrAQrMSCa7jrT+WOiE=;
 b=E922geTOe+bovLfr9He6w437ew5bP6J/MQm52b4AYP74sAJ13RMbKcOepRzshS2u1u
 wmYTl6SMDRBZEhSxAPmROreBIcxJz5TL1/OZpYdW9fQSt+PXBdXQm0redVOF4SOAtEXf
 CORjOHAP+p8jTU5jfp+BIDBbvCgKeDBjUjv7/w2Hy+9ktW5+22QzpG5Na+pyYQQJcUPK
 Z9Xs9ct8dQv9Dkh7AZRNM1iTNs/fRUeZ41ERm5EjgUHzU20S1LKpwJaExSuhx9mrB8SH
 6/rdhWWEfcKZ8qK9XHUehAgh+gH6ZkMeNC4uDG1fVIbpZZct0yM+md5F/EnPdEsAJDgk
 YH8Q==
X-Gm-Message-State: AOAM5331KK4w3glhUy9BcF6g2J+rbFFid7GByMUCVRx4hKaYSZj7E0OC
 89o2Zri7EOK9CsLNah/sPX4=
X-Google-Smtp-Source: ABdhPJx5mzL06fdjlBBcKuJ33iLkGeOMrXk9Sm8CfjP+23T56yaZQTLdQP60v9qx3wxztk7dMHUDJg==
X-Received: by 2002:a17:90b:496:: with SMTP id
 bh22mr1721827pjb.120.1604699468015; 
 Fri, 06 Nov 2020 13:51:08 -0800 (PST)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id q23sm3170599pfg.192.2020.11.06.13.51.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 06 Nov 2020 13:51:07 -0800 (PST)
Date: Fri, 6 Nov 2020 13:38:58 -0800
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: Re: [PATCH v3 2/2] ASoC: fsl_aud2htx: Add aud2htx module driver
Message-ID: <20201106213857.GB3927@Asurada-Nvidia>
References: <1604281947-26874-1-git-send-email-shengjiu.wang@nxp.com>
 <1604281947-26874-2-git-send-email-shengjiu.wang@nxp.com>
 <20201105013539.GA16459@Asurada-Nvidia>
 <CAA+D8ANrkgXR+8JGp4fPLvkKJ05EqQyShWTO+xWpPOycPT9Tyw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA+D8ANrkgXR+8JGp4fPLvkKJ05EqQyShWTO+xWpPOycPT9Tyw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, alsa-devel@alsa-project.org,
 Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
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

On Fri, Nov 06, 2020 at 10:51:03AM +0800, Shengjiu Wang wrote:

> > > +static irqreturn_t fsl_aud2htx_isr(int irq, void *dev_id)
> > > +{
> > > +     return IRQ_HANDLED;
> >
> > Empty isr? Perhaps can drop the request_irq() at all?
> 
> I'd like to keep this for future enhancement, what do you think?

I believe that usually it will be a common practice that we add
when we use it -- exaggerating the situation, just like you will
not actually add an empty driver for future enhancement.

But I am not strongly against it, as it's small. Since Mark has
applied it, let's keep it then.
