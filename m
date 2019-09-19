Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3ECB7CD8
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Sep 2019 16:31:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F0C4F1675;
	Thu, 19 Sep 2019 16:30:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F0C4F1675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568903495;
	bh=lO6NGPFmslyxHy8mM6qlRfZ1GGiVv66TD5MG5vYb6VQ=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g2ApmHrR6P3t5x+GCZVXEaPLSAh/jsXR37dpvqWSisvPspcheYSaJ3KSMooJGfhAB
	 /lqqPLzIoUjWdWtnKhSHdRx8WTRq0Td6L9AL8iL+ljj2dQqcXcQtQYqUNJNL6ikP27
	 eZQqYsWEPwP6qiwmeAAEtifHt4go9/8WRG2zMLvo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6BD9AF8048E;
	Thu, 19 Sep 2019 16:29:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 387EDF80361; Thu, 19 Sep 2019 16:29:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1AF47F80096
 for <alsa-devel@alsa-project.org>; Thu, 19 Sep 2019 16:29:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1AF47F80096
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="miE0ZDQ7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=60aUHeX8mO9KTgOD4svjuL7vvceba9UxujX1I109rhY=; b=miE0ZDQ7yp0Dtd0fgwRLzdcPS
 os0Jfe2JB85oTZ2f0J1f/B2dAfmbC8CI4IHKLoZ8y3/0NDULOLEfBfpe96IlPR6catSRvKB6gCii0
 Jw5DzmTWwyq7N3FHtS0Ctqb7UbVBTohcOtkf4BfdnPwE+3Och2emc4r8AId4ThyESefjE=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iAxRE-00041a-3K; Thu, 19 Sep 2019 14:29:40 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 311892742939; Thu, 19 Sep 2019 15:29:39 +0100 (BST)
Date: Thu, 19 Sep 2019 15:29:39 +0100
From: Mark Brown <broonie@kernel.org>
To: shifu0704@thundersoft.com
Message-ID: <20190919142939.GL3642@sirena.co.uk>
References: <1568795293-19697-1-git-send-email-shifu0704@thundersoft.com>
 <1568795293-19697-2-git-send-email-shifu0704@thundersoft.com>
MIME-Version: 1.0
In-Reply-To: <1568795293-19697-2-git-send-email-shifu0704@thundersoft.com>
X-Cookie: I'll be Grateful when they're Dead.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, navada@ti.com, tiwai@suse.com,
 robh+dt@kernel.org, dmurphy@ti.com
Subject: Re: [alsa-devel] [PATCH v6] tas2770: add tas2770 smart PA kernel
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
Content-Type: multipart/mixed; boundary="===============2884146445521215535=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============2884146445521215535==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3U8TY7m7wOx7RL1F"
Content-Disposition: inline


--3U8TY7m7wOx7RL1F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 18, 2019 at 04:28:13PM +0800, shifu0704@thundersoft.com wrote:

> +static int tas2770_codec_suspend(struct snd_soc_component *component)
> +{
> +	int ret;
> +
> +	ret =3D snd_soc_component_update_bits(component,
> +		TAS2770_PWR_CTRL,
> +		TAS2770_PWR_CTRL_MASK,
> +		TAS2770_PWR_CTRL_SHUTDOWN);
> +	if (ret) {
> +		snd_soc_component_update_bits(component,
> +			TAS2770_PWR_CTRL,
> +			TAS2770_PWR_CTRL_MASK,
> +			TAS2770_PWR_CTRL_ACTIVE);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}

This error handling is a bit weird, if the write failed usually it's
best to leave things as they are rather than retrying the write.  You
should also pass back the error code you got from the I/O rather than
overwriting it with -EINVAL since that helps people diagnose problems.

> +static int tas2770_set_samplerate(struct tas2770_priv *tas2770,
> +								int samplerate)

The indentation on the second line here is really weird, it's not
aligned with anything.

> +	switch (slot_width) {
> +	case 16:
> +		ret =3D snd_soc_component_update_bits(component,
> +			TAS2770_TDM_CFG_REG2,
> +			TAS2770_TDM_CFG_REG2_RXS_MASK,
> +			TAS2770_TDM_CFG_REG2_RXS_16BITS);
> +	break;

The indentation of the break statements here is still off.

> +static const struct snd_kcontrol_new tas2770_snd_controls[] =3D {
> +	SOC_SINGLE_TLV("Playback Volume", TAS2770_PLAY_CFG_REG2,
> +		0, TAS2770_PLAY_CFG_REG2_VMAX, 1,
> +		tas2770_playback_volume),
> +	SOC_SINGLE_TLV("Amp Output Gain", TAS2770_PLAY_CFG_REG0,
> +		0, 0x14, 0,
> +		tas2770_digital_tlv),

Volume controls should still have names endinf in Volume as covered in
control-names.rst. =20

Please don't ignore review comments, people are generally making them
for a reason and are likely to have the same concerns if issues remain
unaddressed.  Having to repeat the same comments can get repetitive and
make people question the value of time spent reviewing.  If you disagree
with the review comments that's fine but you need to reply and discuss
your concerns so that the reviewer can understand your decisions.

--3U8TY7m7wOx7RL1F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2DkNIACgkQJNaLcl1U
h9CGNwf/X4VEOSe8TuEc947oSwTEktjg8zk5ASLNtashM8cHpqAQeKz4v9XmrMTM
SRjzP4M2FTUcL6XlLEDr8dBqxvGUWFV4t5Kg8NVO+9Wma1YInvh4Gg1LdyjIw7Cm
A20++f0dB1k+13bPeM953Vvvm0KiO5S8aBj3BTCibUn8qE3wM3I8Pl/S+FfL0WbY
Nrj1sV6ZY+3ILflnLVZ6eLlLGTRyCtoR7TQASxVNktQC+lf877VzrVtYzmxVLrL1
uPEYgDB/AQNnBmt8MOCr0ofqrryOtE5vMejd+q89i4gxr1n6sUpNxeC1RNMNKqjw
EuuOX/DK0oFwcuqxSSGP9CfydV3c0Q==
=Ncv4
-----END PGP SIGNATURE-----

--3U8TY7m7wOx7RL1F--

--===============2884146445521215535==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============2884146445521215535==--
