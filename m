Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BFE7EE08D
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Nov 2019 14:00:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9258176A;
	Mon,  4 Nov 2019 13:59:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9258176A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572872422;
	bh=BXrc89fk5K7g19ibTEUykWI1Qo3sXR1p4iT2jlv7fW8=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b3TM9CWK4cgE6U9Er1QuKFXnuF9rwWL6DHBQTDxyTXIIkCk8LUrU3SBivBEPC/00Z
	 bbhRhxzV9djCRy/+vVH1K9wzbJ4IPg0h9GAI9/49iZde4iQgeGWC9UdSUOlikFMhQg
	 /b025hlujxxmsdG+xVRQGg0VNSnRafJDIoi1OkKs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E302EF80321;
	Mon,  4 Nov 2019 13:58:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C7F5F803F4; Mon,  4 Nov 2019 13:58:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 996E4F8015B
 for <alsa-devel@alsa-project.org>; Mon,  4 Nov 2019 13:58:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 996E4F8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="su0BsExy"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kICYd6BPK3MXbEBch+sze5Yv35JP+g8N2mZBwymytFM=; b=su0BsExyAmF9EXFQPVT02+TvZ
 3+nwpwx5awBhE67JFTfXtpBrTWSCJZHyblfRl9mhuJ31pI3o5dGRhA4A4Hg5K9z520P1tWOuEkzvp
 CLAMwai5rJNlFsEftomLqR0/IMfkGbUbCJjBzpRr9N1AKGpc5tqsbUPVuL8nkjKz4tsqQ=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iRbwG-0002aN-G9; Mon, 04 Nov 2019 12:58:32 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id B65AF274301E; Mon,  4 Nov 2019 12:58:31 +0000 (GMT)
Date: Mon, 4 Nov 2019 12:58:31 +0000
From: Mark Brown <broonie@kernel.org>
To: David Rhodes <david.rhodes@cirrus.com>
Message-ID: <20191104125831.GD5238@sirena.co.uk>
References: <1572550603-21560-1-git-send-email-david.rhodes@cirrus.com>
MIME-Version: 1.0
In-Reply-To: <1572550603-21560-1-git-send-email-david.rhodes@cirrus.com>
X-Cookie: This page intentionally left blank.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 ckeepax@opensource.cirrus.com, lgirdwood@gmail.com, Li Xu <li.xu@cirrus.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: wm_adsp: Expose mixer control API
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
Content-Type: multipart/mixed; boundary="===============1695607416764440023=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============1695607416764440023==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="d9ADC0YsG2v16Js0"
Content-Disposition: inline


--d9ADC0YsG2v16Js0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 31, 2019 at 02:36:43PM -0500, David Rhodes wrote:

> From: Li Xu <li.xu@cirrus.com>

> Expose mixer control API for reading and writing.
> The exposed API can be used by codec driver for
> interacting with mixer control in kernel space.
> This allows codec driver to implement more involved
> interactions with DSP firmware, such as Fast Use
> Case Switching.

It would be helpful if somewhere in the changelog you more explicitly
said that this was an in-kernel API, it isn't very clear what the API
you're adding is supposed to be.

The formatting here is also a bit weird, the lines are very short.

> +/*
> + * Find wm_coeff_ctl with input name as its subname
> + * If not found, return NULL
> + */
> +static struct wm_coeff_ctl *wm_adsp_get_ctl(struct wm_adsp *dsp,
> +                                            const char *name)

It is not clear why we only look things up by subname.  What's wrong
with the rest of the name?

> +int wm_adsp_write_ctl(struct wm_adsp *dsp, const char *name, const void *buf,
> +		      size_t len)
> +{
> +	struct wm_coeff_ctl *ctl;
> +
> +	ctl = wm_adsp_get_ctl(dsp, name);
> +	if (!ctl)
> +		return -EINVAL;
> +
> +	if (len > ctl->len)
> +		return -EINVAL;
> +
> +	return wm_coeff_write_control(ctl, buf, len);
> +}
> +EXPORT_SYMBOL_GPL(wm_adsp_write_ctl);

There should be a snd_ctl_notify() somewhere in the write path to tell
userspace that the value changed.

--d9ADC0YsG2v16Js0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3AIHYACgkQJNaLcl1U
h9BtVQf8CxvyziJCzgxDiZfQYWAd2hzq54etmYsEPmIqpYUIuDJOPSxgxAJ5bE2N
qDC2x5vCaBiGMEvDme4QJlVjLdeb09G4LRjVhSbLP7EOigfMlQClQyOVpcHl0wIX
FLxIwJOTH7XGDJrGrkFdLayVh0wIJNLSbbku+YDg6eoUz0WioLkYcJLf6fpGOmiT
jNZs6AliPYEGA6OtFJEMvdEwOPeOxEZ6N+Fj2tp+iFS+Q/+iWphjxweGnh9PZzAq
hcRjyH+uSQojbEP3kHw2WZ6ZL39Z+ph2yoMynKgNd19EVhyI3fJye3ABTzNKWkbh
jZJpPmSksq38w4K4YwgVv2o3ityzBg==
=GAjD
-----END PGP SIGNATURE-----

--d9ADC0YsG2v16Js0--

--===============1695607416764440023==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============1695607416764440023==--
