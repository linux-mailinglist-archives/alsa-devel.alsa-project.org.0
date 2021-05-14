Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA2A380FD5
	for <lists+alsa-devel@lfdr.de>; Fri, 14 May 2021 20:35:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 64F981764;
	Fri, 14 May 2021 20:34:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 64F981764
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621017305;
	bh=ljuL77X5kNFBNbuIvQcKDpyRkKS1vAJ2IPJIXG6trWI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ioG73CFVzBzpjHi9x9UflLmLe6Z855dFPehaP53KvBDMzKqZsiXXmrXYgkZtij54M
	 9XDs6tavCo8UL7rr+LrKv54ksi/EakDjZOyS6UXGONglOE7KXKSXG3Ajk20VdZvMN3
	 WX2nahl0LbtnCkdPDAS/zhii0Qmdp0tW8GFmRFPc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D00A4F8026B;
	Fri, 14 May 2021 20:33:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 77310F80240; Fri, 14 May 2021 20:33:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,PRX_BODY_30,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7BF7DF800BF
 for <alsa-devel@alsa-project.org>; Fri, 14 May 2021 20:33:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7BF7DF800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="CSruQYkZ"
Received: by mail-ot1-x32e.google.com with SMTP id
 69-20020a9d0a4b0000b02902ed42f141e1so91156otg.2
 for <alsa-devel@alsa-project.org>; Fri, 14 May 2021 11:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=MyepW9OZoA5Tfnsk829LBdO7lppfBfCNDTAkF2rLFjw=;
 b=CSruQYkZcAvyzO2bwdSLSevjn6wHjzL16r4vHhL3WjVB3Wmud9BONG+RXENhltUe5z
 QbRig6W7y1v7Hqiv6xbTxAMtt/QzbcbWfbbWvJNLnEEpzWgm3/2GakdSSSHlvXR2/huV
 0wYXCs0tFCLIi4zF1EE674UyBsA5BDSDAYcRr1ox9xCLM6L/uQCk4ikuDbAYtOZu6HMB
 BrfcFLZYIQueonpmtZKGNThbUD2M+8wrfudMTV7Uk4z+tIQA5XC10G6qi8JgGyZ1U/nG
 IVd3RtCeROniLEIr73zMa2pltdFkKC+Re4rRPXtFcgNEeVttA0bRsE3/1HiiVR275ONS
 nI2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MyepW9OZoA5Tfnsk829LBdO7lppfBfCNDTAkF2rLFjw=;
 b=GTzuUFHCSaLCB6Vsz9x/089kApJoFtUKJbHiAg6n/L6GRvQOZftNW4Bd/vso+khSXc
 Nw2zNFzFZtd+yGwuXVaOZN3t9DcOYh1bxU3eV4twtePw3IieDIreVEsFowVKwdptOmdT
 IiVbqwtXXBN6ykrHLThMsUcIq7grOCtUxWCxqsS70qgN9es2z8rsiCvUpEM8tR3ReaJ4
 Eiz56Fy8vBGLH2zf5bL7tFrGUi31t46/0YeNO5AJCLz1X/w4hC/7FQeyuco6UdVxpEny
 y1yeaxlrVgiwGpdxhWlmzIxVck0OealHilrDEZ+eDTDC9FcrB1XrM6zu6iwoViNyi2PQ
 s0Pw==
X-Gm-Message-State: AOAM5328p3CF9ZqqKfh/dSbDmqfZse1EtpPGxQuqNoC/0ueD+fWKH6iK
 f4kqYcLofBJS0/eP6LIMrtw=
X-Google-Smtp-Source: ABdhPJxXAj49fp1LA89JGsmz+P/omVWNY4qgVVhPM43OY3SY7lNrKcSbRajKZ4rZRZprL6MVcO7rRg==
X-Received: by 2002:a05:6830:1693:: with SMTP id
 k19mr18376058otr.210.1621017206861; 
 Fri, 14 May 2021 11:33:26 -0700 (PDT)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com.
 [76.183.134.35])
 by smtp.gmail.com with ESMTPSA id u201sm1296914oia.10.2021.05.14.11.33.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 11:33:26 -0700 (PDT)
Date: Fri, 14 May 2021 13:33:24 -0500
From: Chris Morgan <macroalpha82@gmail.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v10 2/4] ASoC: Add Rockchip rk817 audio CODEC support
Message-ID: <20210514183324.GA20917@wintermute.localdomain>
References: <20210514171940.20831-1-macroalpha82@gmail.com>
 <20210514171940.20831-3-macroalpha82@gmail.com>
 <20210514174958.GC6516@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210514174958.GC6516@sirena.org.uk>
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 heiko@sntech.de, devicetree@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, linux-rockchip@lists.infradead.org, robh+dt@kernel.org,
 Chris Morgan <macromorgan@hotmail.com>, jbx6244@gmail.com,
 lee.jones@linaro.org, maccraft123mc@gmail.com
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

On Fri, May 14, 2021 at 06:49:58PM +0100, Mark Brown wrote:
> On Fri, May 14, 2021 at 12:19:38PM -0500, Chris Morgan wrote:
> 
> > +static int rk817_codec_parse_dt_property(struct device *dev,
> > +					 struct rk817_codec_priv *rk817)
> > +{
> > +	struct device_node *node = dev->parent->of_node;
> > +
> > +	if (!node) {
> > +		dev_err(dev, "%s() dev->parent->of_node is NULL\n",
> > +			__func__);
> > +		return -ENODEV;
> > +	}
> 
> There's no need to fail the probe here, you won't be able to read any DT
> properties but that shouldn't stop the driver binding.

If I'm not mistaken this is actually telling us to fail if the parent
device (the PMIC itself) isn't present. I think I'll remove this as not
necessary since if the parent node isn't present the mfd driver will
never load, meaning this driver will never load either.

Below this line however we're failing if the codec node isn't present.
Are you telling me we want to bind the driver if the node isn't present
(such as in the edge case where the driver is present and the PMIC is a
rk817, but the CODEC is not in use)? I will remove the return code if
you think that is what needs to be done. My concern there though is if
we do that we'll either be in a position to again report a bunch of
errors for the edge case of users who want to use the PMIC but not the
codec (in this case missing clocks and whatnot) if we try to bind the
driver and the user doesn't want it. I can also set those errors to
debug level, but I think that they might be important enough for users
who DO want to use the codec to keep them as dev_err.

Let me know what you think.

Thank you.
