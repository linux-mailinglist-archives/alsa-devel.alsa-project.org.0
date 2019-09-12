Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C97B16C4
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Sep 2019 01:53:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F34511668;
	Fri, 13 Sep 2019 01:52:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F34511668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568332398;
	bh=b4BqZ0D8qQW8QqW4/U4LSSKfFpXBfvzWytifF5s+aPU=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H71BQ4Be7jO7i/yJStulWA4iQ9i9QjQAIm0U0aVGRpLeuY8etMwNXOQ3T8PT/6OyH
	 eLipNGjqydYWAPDgu1NsNJmOSIrnbEN+hLQmBRQ3m52rvwOSdeOH0QbbcvFneLTrBI
	 8GzTitTm2cnTfDZ9IFRlx1oKf9J1m4ZJIqfeELaU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7494BF80393;
	Fri, 13 Sep 2019 01:51:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 068C7F80368; Fri, 13 Sep 2019 01:51:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 00185F80143
 for <alsa-devel@alsa-project.org>; Fri, 13 Sep 2019 01:51:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00185F80143
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="CH+33i++"
Received: by mail-pl1-x642.google.com with SMTP id 4so12440052pld.10
 for <alsa-devel@alsa-project.org>; Thu, 12 Sep 2019 16:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=jwH7MEoAJ00c+7yFxXFsE0JEMDQRkeWQsif61Jhqi3M=;
 b=CH+33i++1Luzxl8HYawv8HE2blbAZ7swcTEJAA7tWhmDd6HBta3K9TBY1havYrrodJ
 7+wkJA0vugEJi+fuHOJLp/jNbRghNgF+owPo44A17sTvEiyTUWvxtD0KUsPdLov77ETE
 OjYMwTAAZV3vwkDzfhKUJVKbmZKGKwYbQk0kqGkGZta360oMD/mAHbxQhitLNDR53Ze4
 SU3HZZBIVazFcwyYjFmcc25pa7ILwXvs1ASWa6lXm+0opNIxy7ZFRchNNFkX/gIve+fu
 VhqfI5XkvWQj6su1zQCV3UB+uISGEbLxFeNhbQADYmagwaZTIUIIBmjZfZzWbiBWpD0s
 MiIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=jwH7MEoAJ00c+7yFxXFsE0JEMDQRkeWQsif61Jhqi3M=;
 b=RUNoQhrcI0yq1NfZJOvJXG4RLm0WIbTbAs5Pl5DukEoQSi87UnrRQyno52hmRGA9M4
 nS/55fUCkmZroNM7CibCHKvE2iuHbA9r1TOORIynU0WQxCSDZNcz7x6JOm3XYu3kGOJT
 RuhepfEuI+dJSHSOomMO9tof1PIFuLqsQuqOpddegPUF6SOQJBaVzsCEZ1cB9nQcw6De
 zHrmHUOYVIzhYBXLajFQSvPV6FJiGcv6cbT+Qh/NuizrXJUjBiFWadxOAq5nwBwYn/xC
 nAw96msin7ANoXH/MxXg4kX5aqnSmQFheVourUGkzi8G2MXEWJyV8mbgSZ+FCOQbIoWE
 B/2g==
X-Gm-Message-State: APjAAAUZ+6j6nlpq7qlHSl5Ky23Kd3/+Wa78lBm3Gmo+mVwTXbEI9X/A
 maIFa2ofRvxG3yM2P0OoWTY=
X-Google-Smtp-Source: APXvYqw8JsAO/ku52ctAh426YyLkFzzTSBnKNOrqkT8cXxA2Fn6w0cpGB8xMIpxVpQYBQQwfczK2/A==
X-Received: by 2002:a17:902:724c:: with SMTP id
 c12mr31734884pll.312.1568332285454; 
 Thu, 12 Sep 2019 16:51:25 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id u5sm27193129pfl.25.2019.09.12.16.51.24
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 12 Sep 2019 16:51:25 -0700 (PDT)
Date: Thu, 12 Sep 2019 16:51:03 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: "S.j. Wang" <shengjiu.wang@nxp.com>
Message-ID: <20190912235103.GD24937@Asurada-Nvidia.nvidia.com>
References: <VE1PR04MB64791308D87F91C51412DF53E3B60@VE1PR04MB6479.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <VE1PR04MB64791308D87F91C51412DF53E3B60@VE1PR04MB6479.eurprd04.prod.outlook.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "timur@kernel.org" <timur@kernel.org>,
 "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [alsa-devel] [PATCH 2/3] ASoC: fsl_asrc: update supported
	sample format
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

On Tue, Sep 10, 2019 at 02:07:25AM +0000, S.j. Wang wrote:
> > On Mon, Sep 09, 2019 at 06:33:20PM -0400, Shengjiu Wang wrote:
> > > The ASRC support 24bit/16bit/8bit input width, so S20_3LE format
> > > should not be supported, it is word width is 20bit.
> > 
> > I thought 3LE used 24-bit physical width. And the driver assigns
> > ASRC_WIDTH_24_BIT to "width" for all non-16bit cases, so 20-bit would go
> > for that 24-bit slot also. I don't clearly recall if I had explicitly tested
> > S20_3LE, but I feel it should work since I put there...
> 
> For S20_3LE, the width is 20bit,  but the ASRC only support 24bit, if set the
> ASRMCR1n.IWD= 24bit, because the actual width is 20 bit, the volume is
> Lower than expected,  it likes 24bit data right shift 4 bit.
> So it is not supported.

Hmm..S20_3LE right-aligns 20 bits in a 24-bit slot? I thought
they're left aligned...

If this is the case...shouldn't we have the same lower-volume
problem for all hardwares that support S20_3LE now?
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
