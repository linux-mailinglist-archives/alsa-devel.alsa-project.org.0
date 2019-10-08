Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A03CCF97E
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Oct 2019 14:13:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A457041;
	Tue,  8 Oct 2019 14:12:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A457041
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570536805;
	bh=Eu37ukQjAKOITRsoa72EJufPGOY29ujvYzX7SedhyZs=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U+p5ew39dsAXKYP8YB0PoIOY7M+/5B5j73T0HGT+pKFU1pFhmvWKn3T2pAcRd+4GT
	 ZscfGjYHwP0zdk3HHFMWJFj7vdDqIMsHIFBdvzkTBQjkMNkrfstZV2HUrLq0GJVPAY
	 eJD0HzXGNq45ZLLXulkM46mlcFetgRIVbNbHUzC8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 18E54F805FA;
	Tue,  8 Oct 2019 14:11:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EFED2F8059F; Tue,  8 Oct 2019 14:11:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D4EBEF804CA
 for <alsa-devel@alsa-project.org>; Tue,  8 Oct 2019 14:11:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4EBEF804CA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="AOpRW42g"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XnGLjmPea/2MBiFxRMNh1Uce2kBW2+LZpU9p5w1o46E=; b=AOpRW42gTmGp/m6Yvu47Dceyd
 HQa4Zq6TwpJRor+NhfzFAupU+9W7r11iNLdBEvTs496e0AiuAjxYsE53JB+Idv+HC7Ap4EXDOLM96
 QZ6o4JrOJbLBuUfcr3yItn5mgCCHpbsgUzbQ8Zrl+xFVwyZrlnHW3oICCnWqUqQ2vA8Ls=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iHoL1-0008FT-SY; Tue, 08 Oct 2019 12:11:35 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 215612742998; Tue,  8 Oct 2019 13:11:35 +0100 (BST)
Date: Tue, 8 Oct 2019 13:11:35 +0100
From: Mark Brown <broonie@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Message-ID: <20191008121135.GH4382@sirena.co.uk>
References: <1569580317-21181-1-git-send-email-jiaxin.yu@mediatek.com>
 <1569580317-21181-5-git-send-email-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <1569580317-21181-5-git-send-email-jiaxin.yu@mediatek.com>
X-Cookie: Do not disturb.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, alsa-devel@alsa-project.org, yong.liang@mediatek.com,
 lgirdwood@gmail.com, tzungbi@google.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 eason.yen@mediatek.com, wim@linux-watchdog.org, linux@roeck-us.net
Subject: Re: [alsa-devel] [PATCH v2 4/4] ASoC: mt8183: fix audio playback
 slowly after playback during bootup
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
Content-Type: multipart/mixed; boundary="===============7999926455208215326=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============7999926455208215326==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gTtJ75FAzB1T2CN6"
Content-Disposition: inline


--gTtJ75FAzB1T2CN6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 27, 2019 at 06:31:57PM +0800, Jiaxin Yu wrote:

> +	rstc = devm_reset_control_get(dev, "audiosys");
> +	if (IS_ERR(rstc)) {
> +		ret = PTR_ERR(rstc);
> +		dev_err(dev, "could not get audiosys reset:%d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = reset_control_reset(rstc);
> +	if (ret) {
> +		dev_err(dev, "failed to trigger audio reset:%d\n", ret);
> +		return ret;
> +	}

This means that we're going to be incompatible with old DT bindings that
don't specify a reset controller.  I don't know how widely used these
bindings are so we may be able to get away with this and I'll apply but
we shouldn't be doing it, the code might need to be fixed to make this
optional if people complain.

--gTtJ75FAzB1T2CN6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2cfPYACgkQJNaLcl1U
h9C3vQgAgs/NciVNbX5yhkOJpscZQdjIcphQ+vTFVbzD6Lve7ubMPRDHKDTnJis5
SBzLgKfpjz+jOKtQaLf43hbnbt3ysqb6OtPbksAhTWkP6Ba8haD/hl8rgpdgQmqr
g+O2wiaiqRa2TsSL7A325WO+UBSPfbMabkWPF0MAtZWXclvUY8PSt8TixhP7DRIX
ryvcXlv51QVrRxIyNG/oSSKw6+wqNco5t894qo6Ca6I277zpR5f9gtEt19sqiqW9
pKGSu3ma/B9i7uEmrpytoBfPGdl+65X1DQq1DRb1A7D5phUuSKeFwQidnptm2Phr
0C6SxsX4Y3qTydnI7JMV241vAHiuGQ==
=JJJV
-----END PGP SIGNATURE-----

--gTtJ75FAzB1T2CN6--

--===============7999926455208215326==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============7999926455208215326==--
