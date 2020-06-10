Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C656C1F5B1D
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Jun 2020 20:25:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 43B431666;
	Wed, 10 Jun 2020 20:24:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 43B431666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591813522;
	bh=9AqAUB1ZAPixZdhaly51X0K7ex6te3hHZ1181APFZfk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UkVANSOUs47/uPHIJp/bmELpmUpbPM7atYSHO5EhMVkn2RDWL2Cd4BXA68RpG/yKb
	 2etzQsi5McbuL4ETxjcd7457gvoL90e+7QoK/EfcZL2RUYBQ9b0XcEri2iiHOu/mUB
	 1J8Mf1I+RnoC3fFb3792JAO8useDuK3PAZSczEi0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5789DF8021E;
	Wed, 10 Jun 2020 20:23:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1AF33F8021C; Wed, 10 Jun 2020 20:23:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3F591F80088
 for <alsa-devel@alsa-project.org>; Wed, 10 Jun 2020 20:23:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F591F80088
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="a5YWD529"
Received: by mail-pl1-x641.google.com with SMTP id bh7so1261276plb.11
 for <alsa-devel@alsa-project.org>; Wed, 10 Jun 2020 11:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Eyo+7zh1L4jeDWREBakg6eAo0YMYPGwdx3QTIkC3cqE=;
 b=a5YWD529dgAdWo2ddTqn+wtR9NFsHDhDH9quAab1/Ts3LSpxdlSdxy6dn8UU0GmYJg
 mF2n+LTmi5kCWCRmW9o+w4lNEWGgoOk4zlw2My0hTdaZrNFXacyNCFGb3+7n4Ab2nC6N
 DusWKIIlMvWFsrA0CRBntWUVRbH7QMccO/RQD7cQ85pCqC8xtPC3uW01YHIYWtChIbIr
 MKkdZHznXgRBPNojpB8Jdq2lamuckQvYy0OBF/tMLdUqaQV+bhucitSwmnuYioDBWav7
 ZxeY74vjeQr250yLyShoxh4o49WZ/SkYC6Yp2etGuaMrgCe4BUV5Q+tC6+w5HUtpy8Qw
 QbPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Eyo+7zh1L4jeDWREBakg6eAo0YMYPGwdx3QTIkC3cqE=;
 b=szitc+FtUzBbonTseItdR9TsaWznShx/J3D9ffVcm1YjK+gEyNuCWJarZ6mMSQA5s8
 zs4SwjnPAXeROLhENyDd0qh0tk82GuZx9a6zurNlnfa4MFz92Vt52osdURx5wyoc2sRq
 3BUGoc0NZaMKVkCwF3j80phHixXikgeNA7bjHtGJzWLHlrv6NnybFJsj1SHicGoQR9UT
 maq8SIuCH2kVfgICUZnrkc9RVgpDryrmGGSfe6k7E6gfL7dfxEYthPlN3OH/8swgnOZ5
 ipLhcUBUzaIGlYg9TaO0pDH0bH8rvbFmc+iVilWLl+2yrNYybnka5Ksh8OLDASgiNHu+
 0YMA==
X-Gm-Message-State: AOAM532xNym1ExL2FjDH/atyCzaBgnxpxg9IjolBkmAWlrFn9H1cmtzz
 hr8zFbFB0XMfugaLKkBDDXQ=
X-Google-Smtp-Source: ABdhPJwlTj9PIl3lYfVxAKZJrGw9skNy0yB4QNbnAqbu5kbKDhGJt6xeQOyHbSMwPeJUry2pOcPQXQ==
X-Received: by 2002:a17:90b:e8f:: with SMTP id
 fv15mr4538238pjb.47.1591813411940; 
 Wed, 10 Jun 2020 11:23:31 -0700 (PDT)
Received: from gmail.com ([192.55.54.40])
 by smtp.gmail.com with ESMTPSA id 140sm577886pfv.38.2020.06.10.11.23.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 10 Jun 2020 11:23:31 -0700 (PDT)
Date: Wed, 10 Jun 2020 23:53:24 +0530
From: Vaibhav Agarwal <vaibhav.sr@gmail.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 0/6] Enable Greybus Audio codec driver
Message-ID: <20200610182322.GC21465@gmail.com>
References: <cover.1591802243.git.vaibhav.sr@gmail.com>
 <20200610173711.GK5005@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200610173711.GK5005@sirena.org.uk>
User-Agent: Mutt/1.10.1+3 (f9293d646485) (2018-09-22)
Cc: devel@driverdev.osuosl.org, alsa-devel@alsa-project.org,
 Alex Elder <elder@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Greer <mgreer@animalcreek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Takashi Iwai <tiwai@suse.com>,
 greybus-dev@lists.linaro.org, Johan Hovold <johan@kernel.org>,
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

On Wed, Jun 10, 2020 at 06:37:11PM +0100, Mark Brown wrote:
> On Wed, Jun 10, 2020 at 10:58:24PM +0530, Vaibhav Agarwal wrote:
> > The existing GB Audio codec driver is dependent on MSM8994 Audio driver.
> > During the development stage, this dependency was configured due to
> > various changes involved in MSM Audio driver to enable addtional codec
> > card and some of the changes proposed in mainline ASoC framework.
> 
> I'm not sure why you're copying me on a staging driver?  I don't recall
> the base driver having been submitted properly yet.

Hi Mark,

With patch#6 in this series, I'm proposing some of the (dummy) helper 
APIs required to link DAPM DAI widgets for the GB Audio modules 
added/removed dynamically.

Eventually, I would like to propose relevant changes in snd-soc APIs to 
enable dynamic linking of DAI widgets for the modules added and 
remove/free component controls for the module removed.

I'm seeking your opinion on the proposed changes. And as per the 
recommendation I'm sharing the changes with ASoC mailing list as well.

Kindly suggest me the preferred way to follow on this thread. 

--
Regards,
Vaibhav
