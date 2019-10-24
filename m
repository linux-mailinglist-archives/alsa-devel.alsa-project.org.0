Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5132EE30AF
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Oct 2019 13:41:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D99C316AF;
	Thu, 24 Oct 2019 13:41:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D99C316AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571917316;
	bh=N1k8ZVfESTl5BQvDHf1+nG+//O2Gsil71BwbC2zeoG8=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BXfA/luh955QwM8ZgQFxyQGA1OPfoAnNRP9aaNAOAiSPervbk8LfA/CwJXj37MvXc
	 FIIVq/Ep8B7Iw7vG0REikezNO7/XgwedjwKeJ5UZgX5bVYt7BYLDWZg1E5pvlIkJSl
	 k8mRS/NFKSdmOEyU9OveMy8aJau+JYUGNi70/riU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7AEC3F8036E;
	Thu, 24 Oct 2019 13:40:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F313EF8036E; Thu, 24 Oct 2019 13:40:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3815CF80137
 for <alsa-devel@alsa-project.org>; Thu, 24 Oct 2019 13:40:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3815CF80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="OijjdxG5"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=X3j9UrH+/Fzfrt4StiXNQ+AaG04IVrkqPFPRYShjJH4=; b=OijjdxG5DT0DclHIlyYtSOjt9
 QKdLW86wpsJkyhSha1lDzuwcYivt7PvCkdZX9pi4Q7Byvs5+Kqeb3SPxkP2rPwLA4qcU/l9usNBRc
 YrsHsThy+YglGy1Xh/JSyUSZ20k+pK7cPajhMVLb/u3A5i6RWdPBsgdq+S9c0jSRvzQE8=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iNbTU-0003Ph-7k; Thu, 24 Oct 2019 11:40:16 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 700B5274293C; Thu, 24 Oct 2019 12:40:15 +0100 (BST)
Date: Thu, 24 Oct 2019 12:40:15 +0100
From: Mark Brown <broonie@kernel.org>
To: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
Message-ID: <20191024114015.GG5207@sirena.co.uk>
References: <1571432760-3008-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
 <1571432760-3008-3-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
MIME-Version: 1.0
In-Reply-To: <1571432760-3008-3-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
X-Cookie: What foods these morsels be!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 Maruthi Bayyavarapu <maruthi.bayyavarapu@amd.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 open list <linux-kernel@vger.kernel.org>, YueHaibing <yuehaibing@huawei.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Sanju R Mehta <sanju.mehta@amd.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Alexander.Deucher@amd.com,
 Colin Ian King <colin.king@canonical.com>
Subject: Re: [alsa-devel] [PATCH 3/7] ASoC: amd: Enabling I2S instance in
	DMA and DAI
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
Content-Type: multipart/mixed; boundary="===============7913356178156291613=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============7913356178156291613==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XaUbO9McV5wPQijU"
Content-Disposition: inline


--XaUbO9McV5wPQijU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Oct 19, 2019 at 02:35:41AM +0530, Ravulapati Vishnu vardhan rao wrote:

> +		case I2S_BT_INSTANCE:
> +			val = rv_readl(rtd->acp3x_base + mmACP_BTTDM_ITER);
> +			val = val | (rtd->xfer_resolution  << 3);
> +			rv_writel(val, rtd->acp3x_base + mmACP_BTTDM_ITER);
> +		break;

For some reason the break; isn't indented with the rest of the block.
I'm fairly sure I've mentioned this before...

> +		case I2S_SP_INSTANCE:
> +		default:
> +			val = rv_readl(rtd->acp3x_base + mmACP_I2STDM_ITER);
> +			val = val | (rtd->xfer_resolution  << 3);
> +			rv_writel(val, rtd->acp3x_base + mmACP_I2STDM_ITER);
> +		}

Missing break; here - again it's normal kernel coding style to include
it.

> +	struct snd_soc_pcm_runtime *prtd = substream->private_data;
> +	struct snd_soc_card *card = prtd->card;
> +	struct acp3x_platform_info *pinfo = snd_soc_card_get_drvdata(card);
> +
> +	if (pinfo) {
> +		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
> +			rtd->i2s_instance = pinfo->play_i2s_instance;
> +		else
> +			rtd->i2s_instance = pinfo->cap_i2s_instance;
> +	}

Looks like you need an error handling case here if pinfo is missing,
i2s_instance needs to be set.  There are default cases but it's not
clear that that's a good idea, the intent of the code is clearly that
there's always platform data.

--XaUbO9McV5wPQijU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2xjZ4ACgkQJNaLcl1U
h9BhrAf/Txqck6/DbNHSTK8lPyCZ9s2RTKplJJicUfk0nuoJtCepGTPnONQjxLm5
4zppLX7vtUzP9GVvTBzR5acgF79LIEOtevrY2H/3fAJ4W93HsshpLQtDs45ksPrE
HBiiXl16hX9WNRf1s17LizgPUw+izaQsAhDf8JuBWcKRfhRL9M8/oxe4ZgE3wooK
SLE7e74+roHIWQ9hhb7eJy4IQSquVSb3dYFpHruwQVJxN20uKypEPzeVxO2EYAK4
e9GBmKw8rXzlsVME8M57mIQ4RgO3J/hOvmv2Rtpa+lJ26H5qpQqxcLuCpCZ5KR+C
+2yTqhWbMBMHjpfQtibSEyJFfe8YTw==
=8jUs
-----END PGP SIGNATURE-----

--XaUbO9McV5wPQijU--

--===============7913356178156291613==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============7913356178156291613==--
