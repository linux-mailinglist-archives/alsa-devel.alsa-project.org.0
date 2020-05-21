Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 285511DD240
	for <lists+alsa-devel@lfdr.de>; Thu, 21 May 2020 17:45:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE2DA1847;
	Thu, 21 May 2020 17:45:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE2DA1847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590075952;
	bh=otl0RC7Tg+nsvDVxGhpHR3QxXtwQkcuJIDuNR3qaBM4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KAsHmiD9rshxalfEParQVu1Izst8fzmqj6MtXT3SQ+WDM2O2mZi/FPr9iGKJSgGJ9
	 padfP5Xp/o/P0kiMEB25mHcireJx5kxjGDbqV1Ex+b/2AHkLA/itEvDCet0Gq8w5/9
	 1rDkOLMgy15uK+fY0H9zbO5sJIrLS9vf+Jms6qjs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F4C7F80161;
	Thu, 21 May 2020 17:44:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 949C2F801D8; Thu, 21 May 2020 17:44:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 85039F80161
 for <alsa-devel@alsa-project.org>; Thu, 21 May 2020 17:44:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85039F80161
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="WaTbMWIP"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 93806207D8;
 Thu, 21 May 2020 15:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590075839;
 bh=otl0RC7Tg+nsvDVxGhpHR3QxXtwQkcuJIDuNR3qaBM4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WaTbMWIP29Bzo+a1yEuZsMKM5gWL3BmevF5ks+ilp1WF15K8p1dtdqZCCvQ7cGW1C
 6ljC7JK8RZi+yD+blv0DYLTsljtQ0LKZnzgFT9GCHRJSY4pIZegTjOuZ74W8sJ2sI5
 OnriqFiTG7ijPbYtbM2ezPNE3BJWwQk7uY9u4NmY=
Date: Thu, 21 May 2020 16:43:56 +0100
From: Mark Brown <broonie@kernel.org>
To: Hui Wang <hui.wang@canonical.com>
Subject: Re: [PATCH for-5.8] ASoC: amd: doesn't print error log if the return
 value is EPROBE_DEFER
Message-ID: <20200521154356.GD4770@sirena.org.uk>
References: <20200521144434.14442-1-hui.wang@canonical.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="hxkXGo8AKqTJ+9QI"
Content-Disposition: inline
In-Reply-To: <20200521144434.14442-1-hui.wang@canonical.com>
X-Cookie: Keep your laws off my body!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org
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


--hxkXGo8AKqTJ+9QI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 21, 2020 at 10:44:34PM +0800, Hui Wang wrote:
> The machine driver module and codec driver module don't have
> dependency, it is possible that the machine driver is loaded ahead of
> the codec driver, then the register_card() will fail and return
> EPROBE_DEFER, in this case the driver should not print error log since
> this is not a real failure.

This isn't helpful to people who are trying to figure out why the driver
isn't loading - if we silently fail then the user will struggle to
determine what the problem that causes their driver to fail to bind is.

--hxkXGo8AKqTJ+9QI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7GobsACgkQJNaLcl1U
h9AyQwf9F40ihCgtfYl+E7tvkO3eddB+0JiZX44OeBjCN+CTA0G9lWcQ02MZjedj
PhhntGxTOzs4n48N7Z7NZa5FE1o5PuH22M7AjPKSIBHVWOOZcebraaxdFjUAo0a5
9CkiYJs/wvkDSWjMz3ljw8FhtdQogZI8akmgM8KTxpiNQwYk7cB0U5eYOv7Wc5bq
vyd7eHlJgX4QVAxveagxD00PP6yW/FY6vqR+AzQxqMXZNF+AOwRxzR54DHSzRMpU
byGS/3HsApyOcaIk8uVaU/n11FaCZfY1IW9Ga6r+3HN3cc7YZtM0EKUhGJyFcTZ5
IM7NmT24Fe71iMpUHW5bgyuTtTAxhw==
=g1Wn
-----END PGP SIGNATURE-----

--hxkXGo8AKqTJ+9QI--
