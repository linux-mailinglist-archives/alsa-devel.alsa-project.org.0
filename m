Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E0B2A9F43
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Nov 2020 22:41:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F22D9168D;
	Fri,  6 Nov 2020 22:40:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F22D9168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604698865;
	bh=M1AwKDny4A3PlX2wFptrokIe7ZJvgPiQfOaokX6Ssfw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WBhNBFwARtmdqL73Wjk8hsd0QdrD+iYwTNN8Stju+pV5j/OGEXGUlRr2wUmdYVrYA
	 RKISMH/s3gkHiz0tfxfVisO/2Xb2egGxSejs0SHwSWVj5/ArfDNHcrwWZ+FQDPNHMt
	 +0N0suTh3dWxjqgvNnNMgr6ysxckuZmK0RWZXZic=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C418F8023E;
	Fri,  6 Nov 2020 22:39:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B60C3F80234; Fri,  6 Nov 2020 22:39:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BF421F800BA
 for <alsa-devel@alsa-project.org>; Fri,  6 Nov 2020 22:39:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF421F800BA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="r6p4t2hB"
Received: by mail-pf1-x443.google.com with SMTP id 13so2590493pfy.4
 for <alsa-devel@alsa-project.org>; Fri, 06 Nov 2020 13:39:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=7aTWPGVFVbBWyajMT43VMslcFxXhz4VtDG2Makyw31Y=;
 b=r6p4t2hBK6TaeQb58ushb4iE+SAEpBwSj1UGF6u7fYvIqBs1cEHVzdSxjnk/UvBUhQ
 W8cQNHQveNpdu6qA1gOQgeBjly7CjVn0ieNdMmJ4AE1PhT0tBGdqAE2ATyQXtl53Rdac
 ZSEHU6hmqv482cXm79+gjmSgYiVcLHmHBSB9ASlPgGe12tTIZ7BslHv0PrUoTc6QNCzB
 Y4D1M3FoogsQTPU2TEZ8iGOdBXFfpwexcOJliySVCXgf/GT2xq991kkYGm2s66q1CwTr
 P9yJmfhZKmDkC/LbEoObcnYCPuhL8uq3lxzJN/aUEe2Rfj/NIp1IosQuoV/x4T5dC36U
 Xlvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=7aTWPGVFVbBWyajMT43VMslcFxXhz4VtDG2Makyw31Y=;
 b=lSyM1rLS9ZC4bxDfN8h5cqLvLNJ/5WbW5fS0vYvnYnrY5vntpO4fcvOFToq+cKkZjG
 qaCmOlZO7KQ6qe5TDWiZUyY13tFFLBSXo6YEOGstmRNFb4VzY65XBup8QNaEfbQe3px5
 Qupt77O3UK29udBbzxu3foId9zUlozQo6TraaWxvt5/iRDe/QdzJHwuyi8h0ngLA2wPq
 5MzuyPwgsrKNCCQmRpHu2ppILfPbZC1d5r+56nK7JDIa5QhN0HvMAvekcnCt08+Ljq7X
 8S3DEU1rk9w/qNH2e3nh1WK268DxYXGyX+u4DBKCH18La7MgrgNeOP3uWCRFpaDVOAZ6
 YgMQ==
X-Gm-Message-State: AOAM533c790JCnUxCN6HDY0nFfuqHv8dxmOweNYmiNh4b9Ql346KeIma
 DO9+LI9aygVKaAFRaNdkOg8=
X-Google-Smtp-Source: ABdhPJwpIojmp9b1+/us6ZoC1XobJl4twTivXTCrNIPeHZ3z7HJtN7EZ21TixK2ffUkYFiMgVC+9xw==
X-Received: by 2002:a17:90a:1f0b:: with SMTP id
 u11mr1596531pja.105.1604698761088; 
 Fri, 06 Nov 2020 13:39:21 -0800 (PST)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id u22sm2689423pgf.24.2020.11.06.13.39.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 06 Nov 2020 13:39:20 -0800 (PST)
Date: Fri, 6 Nov 2020 13:27:08 -0800
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 1/2] ASoC: dt-bindings: fsl_aud2htx: Add binding doc
 for aud2htx module
Message-ID: <20201106212707.GA3927@Asurada-Nvidia>
References: <1604281947-26874-1-git-send-email-shengjiu.wang@nxp.com>
 <160466365499.22812.9217467877032314221.b4-ty@kernel.org>
 <20201106122013.GB49612@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201106122013.GB49612@sirena.org.uk>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, timur@kernel.org,
 Xiubo.Lee@gmail.com, lgirdwood@gmail.com,
 Shengjiu Wang <shengjiu.wang@nxp.com>, linuxppc-dev@lists.ozlabs.org,
 tiwai@suse.com, robh+dt@kernel.org, festevam@gmail.com,
 linux-kernel@vger.kernel.org
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

On Fri, Nov 06, 2020 at 12:20:13PM +0000, Mark Brown wrote:
> On Fri, Nov 06, 2020 at 11:54:23AM +0000, Mark Brown wrote:
> > On Mon, 2 Nov 2020 09:52:26 +0800, Shengjiu Wang wrote:
> > > AUD2HTX (Audio Subsystem TO HDMI TX Subsystem) is a new
> > > IP module found on i.MX8MP.
> > 
> > Applied to
> > 
> >    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
> 
> Sorry, looks like me queueing this raced with the review comments coming
> in.  I think the review commments are small enough that it'll be OK to
> fix incrementally?

Yes. I am okay if we move forward with this version.

Thanks
