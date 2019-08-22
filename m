Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7B39916C
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2019 12:55:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EDAAB1672;
	Thu, 22 Aug 2019 12:54:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EDAAB1672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566471316;
	bh=f4uE0sQgWNQjoaN05KMedQv2LJji0NyF853wq/zNiyk=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DNEf/fRbRb7rJ5tv3nZlzy699sRQVZ3DSMbTlttub/yqVmosX52L04zV12Ly/yx6H
	 wTd6l+Y2jBRPL0ToeqEp4M8fw1FouLAg4+XuUuY4QsGSVFCuifvcDoL40WpUT+qb/k
	 e7o0MAUvq3HiQXDKUYS4sWIu+iUnAlCUciVaf9+g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A0C3DF803D5;
	Thu, 22 Aug 2019 12:53:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97BB0F8036E; Thu, 22 Aug 2019 12:53:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 PRX_BODY_30, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-wm1-f99.google.com (mail-wm1-f99.google.com
 [209.85.128.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03A5BF80147
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 12:53:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03A5BF80147
Received: by mail-wm1-f99.google.com with SMTP id o4so5161836wmh.2
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 03:53:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=VCTHzgx28DS8kDSwqE8s4qzfBppKuuGKJAfrjTj6g0M=;
 b=G05qZXzJsK/5mhJuf9MFSDibQ1AQtFaNzq6Lyyaf01zBIecPernZRZLgT7uXZg0QGn
 BYtff5jXrlR3ogaF2EgrBn80bjf+FuPBKsCTa8VOKAPrWWBndkqQx4uELdOCwFCL0612
 uD+jEO73+H+53QnD3NPFSvmSl06hEdNllEXpX4B+8RFZrjACHXki2OYAYELJH+vI92o5
 JBbTqCrGEM7zTTAim7VhZN0dLXc+AHpY2MR0KN22Fh1x5tIjnzJhCsrU8O+pehtJhghS
 SFZHaO7/m70jwhdShpyxXRrDqwRHFoAGQw/XeavByB4r975lcqO6T+uEe9WsW/hSgtbC
 C9AQ==
X-Gm-Message-State: APjAAAWJo50KEZ2IwTvDKOtaHtXYWm+1pJoWhTxjhofQJ48q7R/JUOKR
 /5VBumVhVXNv+S1AOFHavJYmx/yVAAv70w59H4r0gwURd5slD7XkP4+8ELgDZlXUUA==
X-Google-Smtp-Source: APXvYqzn6IeKLGMdshW7rZXERaLcomrQtLfiJCz/AJBBbt5lUZMP5qyiqUaAV4NVlfvhHjYhQV+dRMiRbyFd
X-Received: by 2002:a1c:6a0b:: with SMTP id f11mr5119257wmc.87.1566471204690; 
 Thu, 22 Aug 2019 03:53:24 -0700 (PDT)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk.
 [2a01:7e01::f03c:91ff:fed4:a3b6])
 by smtp-relay.gmail.com with ESMTPS id b135sm29173wmg.32.2019.08.22.03.53.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2019 03:53:24 -0700 (PDT)
X-Relaying-Domain: sirena.org.uk
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1i0kia-0004i3-8e; Thu, 22 Aug 2019 10:53:24 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id D39D22742A5E; Thu, 22 Aug 2019 11:53:22 +0100 (BST)
Date: Thu, 22 Aug 2019 11:53:22 +0100
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <20190822105322.GA4630@sirena.co.uk>
References: <20190822095653.7200-1-srinivas.kandagatla@linaro.org>
 <20190822095653.7200-4-srinivas.kandagatla@linaro.org>
 <s5h7e75v7en.wl-tiwai@suse.de>
 <923f1d65-d908-c64c-3109-0da1938d3824@linaro.org>
MIME-Version: 1.0
In-Reply-To: <923f1d65-d908-c64c-3109-0da1938d3824@linaro.org>
X-Cookie: You dialed 5483.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 Takashi Iwai <tiwai@suse.de>, spapothi@codeaurora.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, plai@codeaurora.org
Subject: Re: [alsa-devel] [PATCH v2 3/4] ASoC: qdsp6: q6afe-dai: Update max
 rate for slim and tdm dais
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
Content-Type: multipart/mixed; boundary="===============2378552882987013374=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============2378552882987013374==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="T4sUOijqQbZv57TR"
Content-Disposition: inline


--T4sUOijqQbZv57TR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 22, 2019 at 11:45:48AM +0100, Srinivas Kandagatla wrote:
> On 22/08/2019 11:09, Takashi Iwai wrote:

> > This will support a lot more than advertised, e.g. it contains 64000Hz
> > or 22050Hz.  Is this supposed?  If yes, mention it clearly in the
> > changelog, too.

> Some of the rates inbetween are not in the DSP supported rate list for TDM.

> DSP should return error if we try to set any unsupported rate!

The goal with the capabilities is that we should never get as far as
trying to actually set an unsupported rate, we should figure out earlier
on that it won't work and never even try.

--T4sUOijqQbZv57TR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1edB0ACgkQJNaLcl1U
h9CyZQf+NkxJ3s3y4A36V4wjspMiCTbPJ1AjcV6Gd6tv7I1R+qKTpJkPTC9Z9rMb
7iMb065hO/nn885r+VvMF66Qihouou4XieX8RMUxUvjAA6v4+napihPwiZOGFIW6
c5rUCzCzZFK4jXD71dMOhOlIJENcKgXdgBQG+9fIfDAPNLHp/4RCWEc9PUDJ5f6w
UW6/aGyZlXypfQxEpsw9maZoYV3VZhCp+uJ1++P7Ps6gjqU6RrcPGRnGm7ZQ+iWk
YKkLmgj3q1FxfNYzxEmXCRNg7mwW9jvGmO85/DD0YtUpl2T0TMOBuzyzkaqqtYj4
IXCrbdaghj8kBw2QyXbzZ7I13DNbag==
=Dx3p
-----END PGP SIGNATURE-----

--T4sUOijqQbZv57TR--

--===============2378552882987013374==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============2378552882987013374==--
