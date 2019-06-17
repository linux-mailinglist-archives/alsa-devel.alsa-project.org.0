Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EADDA47F97
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jun 2019 12:24:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E55E1723;
	Mon, 17 Jun 2019 12:23:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E55E1723
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560767067;
	bh=eLmtJFlV6/qMoX3ld9VuQW/XaGKDW8od02BZ5wUJ1IM=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tJSphjDvdYl/DnXQpQm9bVXRwSA62VINSTmzFwc6tmpfHKWoi+ooBWZooFYS2s1gj
	 X3E4d+DTp8IPOtM1/OfHXOHm4GeBmS5dh6mW/E6YAzKNNyJ0pZgsO6BH3DE99rUX0Y
	 4bvyA2f1RbIsGZEl6BVzTKgrhgkndqlyzede+628=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DC396F89693;
	Mon, 17 Jun 2019 12:22:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E5D96F8075C; Mon, 17 Jun 2019 12:22:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6C1CFF8075C
 for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2019 12:22:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C1CFF8075C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="cffCdzYU"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ilfB1GzwpRP4d0btlnGbTN8aieBoCHd9HwCnnniW1fo=; b=cffCdzYUEjI8ujp4cer5t3T/W
 zZuFl42uTTM4vTq1PALuvSV6PVETyg14VDwnOkCHY7iNywWSB4y8iSYKcYq0DVaD10YXEWsM8UCUd
 ttQ4j+yMB21pZwlw/ppF4iCXSWbfADZ5Zbp2hvFgNLMG9qfFHGAowZaw7CdsOeKcMl9BA=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hcomX-0001MH-HV; Mon, 17 Jun 2019 10:22:33 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 00B45440046; Mon, 17 Jun 2019 11:22:32 +0100 (BST)
Date: Mon, 17 Jun 2019 11:22:32 +0100
From: Mark Brown <broonie@kernel.org>
To: derek.fang@realtek.com
Message-ID: <20190617102232.GL5316@sirena.org.uk>
References: <1560589487-6610-1-git-send-email-derek.fang@realtek.com>
MIME-Version: 1.0
In-Reply-To: <1560589487-6610-1-git-send-email-derek.fang@realtek.com>
X-Cookie: Editing is a rewording activity.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, lgirdwood@gmail.com, albertchen@realtek.com,
 bard.liao@intel.com, shumingf@realtek.com, flove@realtek.com
Subject: Re: [alsa-devel] [PATCH v2] ASoC: rt1308: Add RT1308 amplifier
	driver
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
Content-Type: multipart/mixed; boundary="===============7047203550953115447=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============7047203550953115447==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="a8i0lXXx49qphuFT"
Content-Disposition: inline


--a8i0lXXx49qphuFT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jun 15, 2019 at 05:04:47PM +0800, derek.fang@realtek.com wrote:

This looks mostly good, a couple of really small things which should be
easy to fix:

> +	return devm_snd_soc_register_component(&i2c->dev,
> +			&soc_component_dev_rt1308,
> +			rt1308_dai, ARRAY_SIZE(rt1308_dai));
> +}
> +
> +static int rt1308_i2c_remove(struct i2c_client *i2c)
> +{
> +	snd_soc_unregister_component(&i2c->dev);
> +
> +	return 0;
> +}

You used devm_snd_soc_register_component() so no need to explicitly
unregister and this function can go.

> +#if defined(CONFIG_OF)
> +		.of_match_table = rt1308_of_match,
> +#endif

of_match_ptr()

> +#if defined(CONFIG_ACPI)
> +		.acpi_match_table = ACPI_PTR(rt1308_acpi_match)
> +#endif

No need for the ifdef, that's what ACPI_PTR() does.

--a8i0lXXx49qphuFT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0HaegACgkQJNaLcl1U
h9CmlAf+N0YZDWtmDfQNB6YcGo68TkrITIn4ggltcQBiRUyRgyTGKNJk3WMLLbRN
z/rln7P2qEsILlvg7ANob+8nqONjtxYp+DrwL4sFgRBqPASG8eqnYhNkeW9GlRFP
Ns3LfGOAijTAMl35NIwD7qaonAaKQq4WPmbcDSp8SYSDAWf/G5KrG5RX05rMyTKv
Acbb4zbJfqtuPX1L6v+0rQjTGj/PYQTpjYUedyFc3xro8Ta5VriTc7UCHLdJG8pu
ceLO2SqmnE1eFxCgrKiJezC99ZrCgXn7BnD1/5SCvqlG3cvRco8fJxQBtASoEfcX
CVhKt9rU8bgJl4TIP5WpBLAHGSBprA==
=7JV6
-----END PGP SIGNATURE-----

--a8i0lXXx49qphuFT--

--===============7047203550953115447==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============7047203550953115447==--
