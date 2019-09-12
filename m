Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D298B0B5B
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Sep 2019 11:27:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A5891730;
	Thu, 12 Sep 2019 11:27:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A5891730
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568280475;
	bh=STH0sI55P4RQwxEmjG+LBxYNjqO0rQ9Yfw7bSp44Odw=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bS7vzsbgbuKY4WIWpH1ijfbufRuDoC4P63jwW+Hfs22oGKgZYdxCExGO189zPCUNu
	 Se+sLQpueUs5fXSHD6JleLIdbNw/WUKXIUjxmLo+pbQ9mvbm+dgZJoqbIQ46WWQOX8
	 F8Mg5GhPkKgCngX7g5vHtZWBP9howlbfja3E3Mk4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 51BFEF80368;
	Thu, 12 Sep 2019 11:26:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C29BBF80368; Thu, 12 Sep 2019 11:26:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC62CF802DF
 for <alsa-devel@alsa-project.org>; Thu, 12 Sep 2019 11:26:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC62CF802DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="QVI3GwWp"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uoE/fKxQ+AJ4AMUIQswHxPLC2favoXRPS4bS0UmeK0I=; b=QVI3GwWpbFw8kapnwOilyUi7n
 IKmPEsBfvh0HpcXA3ERZh89Wo3mPq3MkZT2CwnZz2Ambgh3tcZEjOkGZTfPIffPtPt8sJZ9NV90JX
 ipg3JnqNOClb+da1cRqfKZEC6q/JmJIHTThC3aPIA7nOU/xz6Hrq0Qti/WKdhJQnUwmNM=;
Received: from 195-23-252-136.net.novis.pt ([195.23.252.136]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1i8LMX-0006Q9-HJ; Thu, 12 Sep 2019 09:26:01 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 51A3AD00AB0; Thu, 12 Sep 2019 10:26:00 +0100 (BST)
Date: Thu, 12 Sep 2019 10:26:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Curtis Malainey <cujomalainey@google.com>
Message-ID: <20190912092600.GF2036@sirena.org.uk>
References: <20190906194636.217881-1-cujomalainey@chromium.org>
 <20190906194636.217881-6-cujomalainey@chromium.org>
 <20190911102503.GV2036@sirena.org.uk>
 <CAOReqxhjf0YeUhCF9N8YOReZC11k01R+TR7N6J51fZV6YXBc4g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOReqxhjf0YeUhCF9N8YOReZC11k01R+TR7N6J51fZV6YXBc4g@mail.gmail.com>
X-Cookie: Be careful!  UGLY strikes 9 out of 10!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Oder Chiou <oder_chiou@realtek.com>,
 ALSA development <alsa-devel@alsa-project.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Ben Zhang <benzh@chromium.org>,
 Bard Liao <bardliao@realtek.com>, Curtis Malainey <cujomalainey@chromium.org>
Subject: Re: [alsa-devel] [RFC 05/15] ASoC: rt5677: Auto enable/disable DSP
	for hotwording
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
Content-Type: multipart/mixed; boundary="===============2234134609772954402=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============2234134609772954402==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DHdTHwZuIuFUI+Ax"
Content-Disposition: inline


--DHdTHwZuIuFUI+Ax
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 11, 2019 at 01:22:20PM -0700, Curtis Malainey wrote:

> The source of the switch is commit af48f1d08a547 ("ASoC: rt5677:
> Support DSP function for VAD application") and does not explain the
> original intent of the switch. I believe the original intent of this
> commit is to keep the switch in sync with the VAD state. I do not
> believe we use the switch ourselves.

Well, I would assume that the control is used to allow users to
enable and disable the VAD functionality at runtime.  As with the
routing if it's been exposed to users we should continue to let
them control it.

--DHdTHwZuIuFUI+Ax
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl16DyUACgkQJNaLcl1U
h9CmRAf+JGoIG7Hub6I09dLtzR66Ijzdfry6JB0kiFGQHe9ookR9ofJXZ8gwb2eZ
Fjf+QCy42BvnPTJZXuKmZyiqX/Wt2GzIRyvpvVkN53DnRcK1Uppf+jmHgDRFxmKU
D2ypTaBO0Ygqb4g6SgY4zkoru9f+CMUhacdzr2muqnLCRBHJlbu1AQSAxgQ7Qsxk
e/GUrGaOIf46GAKq2CZDzOo0UUUzXz8DFdxNfpWFYUxwIhuDEvdha6TteDtNPvyn
a/SHEEzywS/oZCV/sa0oV56SgdRXUtr29Uw4bOTBMdxvXH0XhzOCZ3XCgARJ1quA
d1GoW9iDTgK08ayoOm6NGFS0fnCZrg==
=wU82
-----END PGP SIGNATURE-----

--DHdTHwZuIuFUI+Ax--

--===============2234134609772954402==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============2234134609772954402==--
