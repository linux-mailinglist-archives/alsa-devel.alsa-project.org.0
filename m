Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D2332410CBA
	for <lists+alsa-devel@lfdr.de>; Sun, 19 Sep 2021 19:40:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D99A1678;
	Sun, 19 Sep 2021 19:39:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D99A1678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632073212;
	bh=WHvQuFW9D9+C6ULoQquy/YHjWd3bxbUErWg430aG6V8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BEG/PGHrB+HpS3HOqLvH5oReqQRqn44VBn/tLVmOcy5kRif5+m+RxqELOgb7L5mPt
	 bhbU+iB3yBj0bYTNVSUox2yck4E4VUNX5jj+I37vsaI4sRT5qDFtaUczpLKf5Cyehe
	 wG0QRFs7HV7Yp3vtZTJ68t5Y6OEcmhmVZVEz8y5U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3172F80268;
	Sun, 19 Sep 2021 19:38:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9E28CF80268; Sun, 19 Sep 2021 19:38:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8380EF80152
 for <alsa-devel@alsa-project.org>; Sun, 19 Sep 2021 19:38:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8380EF80152
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="LhN5noFj"
Received: by mail-ed1-x531.google.com with SMTP id j13so51496355edv.13
 for <alsa-devel@alsa-project.org>; Sun, 19 Sep 2021 10:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5M7w7zPy21obTvYguz5Oq3eJq+JEdmpFilnfj/UaVzQ=;
 b=LhN5noFjo+451RFhaPdyEiaEskENVgpQpw/AKZYzB8yPg8w21uDQt3oeX0bOsbP3Gr
 CGbr7gmvPPmOjUdEtYO1vPUHutZjRsb2Qz9ekOMJ9IuCgg1/ArcVxFt7UeAyH1dESchQ
 TifLDaNGbXnep5im/SQaOK2V8JBxUNsIiwi720vH6zqPKVpELwe09vto+ju7FUNMMn1N
 gU4slJRLmX75YPFoPC/T02fI96cx4hv6v05GkCo7tUDhkmnQftykur0LfeKdjI1NZIvs
 Y5++L/weCha9F5RhlJCbiweOVNPBFO5bD4F3ywAQIwH54pEdF7MqpE//ZPSgmjSdnZfZ
 nUXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5M7w7zPy21obTvYguz5Oq3eJq+JEdmpFilnfj/UaVzQ=;
 b=WowB7Q26G6vJ41z5feONiSGhPYZplUEaCeMQR0RnLgljUBwfoctHGS7RmnTSvFGesT
 ftV6X5GcZ3VPVV1jJWbheSAa5k95M4ImpE8oKDT3PRMslhVALjXXbHQ9F1SvKA27lX/w
 GZUN8OFVTV362cTXwb6j327/V3TT5euz2kXYkCayxKR9a3pnlTb6578dru9daviEehhK
 mbskCu+rChcJcLIDh/4u+etq+vG/nsoxwuz9FuS9kKCTMfjue7QZ3GkGjwxV3FzWkGRZ
 mB7XOS63oQDUWXoYwMZxIoh125wopXLm4OjKblN9uSpUhEZD78NCWN5axDPBqO8x09Hi
 jAzQ==
X-Gm-Message-State: AOAM5314qypdZMZNTI0sQ49uQkkejwlzKlausGqiYmpRpJValgFZxsyj
 h7KLm2Y4gl/rdUn0UxWy0dw=
X-Google-Smtp-Source: ABdhPJzIc1p2YHYXKQUZaJF5CsnCuPC6aHASPs/54dQ8LsS6ySMakHNHKw85yPRAQNwt3LxaJWqlFw==
X-Received: by 2002:a05:6402:88e:: with SMTP id
 e14mr25583141edy.342.1632073128991; 
 Sun, 19 Sep 2021 10:38:48 -0700 (PDT)
Received: from archbook.localnet (84-72-105-84.dclient.hispeed.ch.
 [84.72.105.84])
 by smtp.gmail.com with ESMTPSA id c28sm5214401ejc.102.2021.09.19.10.38.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Sep 2021 10:38:48 -0700 (PDT)
From: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v4 2/4] dt-bindings: sound: add rockchip i2s-tdm binding
Date: Sun, 19 Sep 2021 19:38:47 +0200
Message-ID: <2435067.tOv7cHfTnj@archbook>
In-Reply-To: <20210916122549.GF5048@sirena.org.uk>
References: <20210903231536.225540-1-frattaroli.nicolas@gmail.com>
 <42974939.Tn3hggVSkZ@archbook> <20210916122549.GF5048@sirena.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Heiko Stuebner <heiko@sntech.de>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
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

On Donnerstag, 16. September 2021 14:25:49 CEST Mark Brown wrote:
> On Wed, Sep 15, 2021 at 07:06:14PM +0200, Nicolas Frattaroli wrote:
> > On Mittwoch, 15. September 2021 16:10:12 CEST Mark Brown wrote:
> > > Why is this not part of the normal bus format configuration?  I don't
> > > know what this is but it sounds a lot like I2S mode...
> > 
> > This affects all TDM I2S modes, i.e. TDM Normal, TDM Left Justified and
> > TDM
> > Right Justified.
> > 
> > Without tdm-fsync-half-frame, we purportedly get the following output in
> > TDM Normal Mode (I2S Format):
> > (ch0l = channel 0 left, ch0r = channel 0 right)
> > 
> > fsync: 	_____________________________
> > 
> >                      	            \____________________________
> > 
> > sdi/sdo: ch0l, ch0r, ..., ch3l, ch3r,  ch0l, ch0r, ...
> > 
> > With tdm-fsync-half-frame, we purportedly get the following:
> > 
> > fsync: 	_____________________________
> > 
> >                      	            \____________________________
> > 
> > sdi/sdo: ch0l,  ch1l,  ch2l,  ch3l,   ch0r,  ch1r,  ch2r,  ch3r
> > 
> > At least, according to the TRM. I do not have an oscilloscope to verify
> > this myself, and in the following paragraphs, I will elaborate why this
> > seems confusing to me.
> 
> fsync-half-frame is just normal TDM for I2S, the default mode is how DSP
> mode normally operates.  I don't know that there's any pressing need to
> support mix'n'match here, you could but it should be through the TDM
> configuration API.
> 
> > So to answer the question, it's not part of the bus format because it
> > applies to three bus formats, and I'm completely out of my depth here and
> > wouldn't define three separate bus formats based on my own speculation of
> > how this works.
> 
> It is part of the bus format really.  I suspect the hardware is the kind
> that only really implements DSP mode and can just fake up a LRCLK for
> I2S in order to interoperate.

Thank you for your explanation!

Going forward, what would be a solution that is acceptable for upstream? As 
far as I understand, the obvious route here is to drop the rockchip,fsync-
half-frame property and just always set this mode when we're using a TDM bus 
format. Is this correct?

According to the TRM, the register bit this sets only affects TDM modes. 
Though since TDM is not standardised in any way from what I've read online, it 
is possible that there is hardware out there which expects the non-fsync-half-
frame mode, but I am completely fine with only thinking about this hardware 
when it actually surfaces.

Regards,
Nicolas Frattaroli


