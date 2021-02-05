Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED433310C8E
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Feb 2021 15:27:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 77D7B1676;
	Fri,  5 Feb 2021 15:26:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 77D7B1676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612535266;
	bh=vz0EpXJayRiYNc5TflA7y0RwX1/hD5Z5cZtbGrJpFV0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Rvd4GmEjpI9kpNLicfshYMq5KIdDbT1S/uyLqS7i41DWphu13zXnh0C3LG3d9ff8c
	 3FZ66igabs5Ap0g57A0N/4giMKvFLPdlQCjHihxapczBSpI7dYDI8mhkvf7kjdG4nW
	 qY2B1gskhVy/v7KtrlHvK1TbXf8OGV3X573PrKm0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B6ACDF80152;
	Fri,  5 Feb 2021 15:26:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A91FFF80139; Fri,  5 Feb 2021 15:26:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 33249F80139
 for <alsa-devel@alsa-project.org>; Fri,  5 Feb 2021 15:26:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33249F80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Us2R3OO+"
Received: by mail.kernel.org (Postfix) with ESMTPSA id ECCE6650CE;
 Fri,  5 Feb 2021 14:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612535166;
 bh=vz0EpXJayRiYNc5TflA7y0RwX1/hD5Z5cZtbGrJpFV0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Us2R3OO+4Wcy6hSv5VXYsF1KTJF/+0jcxZVFjtlnH4Z2jMuj41U2+Nklg6BH+Gx3A
 uulzEKrbnFji+Fw/sUCqG571ha2Uew4bvTQT5RL/4G6H67Jpvs+g+SAlk4bvHwQVtE
 58nU8jYVraXqyC5f6wEWex0/cLQOWuJKUYafnXhBOyEXWNQgFq6mzMBjfo2kB5AIO9
 zG4tZc+WlhpuACHGrQLKhXRCiRb9vqOhzbnLEMg7TsN/UXyeicMwrBq2kN863+Tjjp
 fjzAhkE+LOvTGf6TAcnTItnT3Usc/qpztnZz2J04qniMkT1VQ44WnL0a4HOYh/dGMR
 bEfvshfep5Lcw==
Date: Fri, 5 Feb 2021 14:25:16 +0000
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH 4/7] ASoC: imx-audio-rpmsg: Add rpmsg_driver for audio
 channel
Message-ID: <20210205142516.GC4720@sirena.org.uk>
References: <1612508250-10586-1-git-send-email-shengjiu.wang@nxp.com>
 <1612508250-10586-5-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="E13BgyNx05feLLmH"
Content-Disposition: inline
In-Reply-To: <1612508250-10586-5-git-send-email-shengjiu.wang@nxp.com>
X-Cookie: Huh?
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, timur@kernel.org,
 lgirdwood@gmail.com, linuxppc-dev@lists.ozlabs.org, Xiubo.Lee@gmail.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, nicoleotsuka@gmail.com,
 robh+dt@kernel.org, festevam@gmail.com
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


--E13BgyNx05feLLmH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 05, 2021 at 02:57:27PM +0800, Shengjiu Wang wrote:

> +	/* TYPE C is notification from M core */
> +	if (r_msg->header.type == MSG_TYPE_C) {
> +		if (r_msg->header.cmd == TX_PERIOD_DONE) {

> +		} else if (r_msg->header.cmd == RX_PERIOD_DONE) {

A switch statement would be clearer and more extensible...

> +	/* TYPE B is response msg */
> +	if (r_msg->header.type == MSG_TYPE_B) {
> +		memcpy(&info->r_msg, r_msg, sizeof(struct rpmsg_r_msg));
> +		complete(&info->cmd_complete);
> +	}

...and make this flow clearer for example.  Do we need to warn on
unknown messages?

--E13BgyNx05feLLmH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmAdVUsACgkQJNaLcl1U
h9C97Af/adbNIcFNxOngffC2op8D1lsnbPhhXftOmDlTLcbbbFG1hQeuCEHsljRt
50gewIr1JVY2DkjhAGhtO0GkX+0VpXHSqkwPYv33tOAFJTFcODtVao9i1csmyXu8
V7i4RUPJilR6VTJiFaKLZQPL3bNUeZ+/KfqNvf/jGSydI5OqKGuH2PiomH9lEOwR
xeteoRMiPCLSxtA2+AaKVDR85e1eJkxx3qVRWuccdOkNNjSZRbvh+ViytXoAkLQj
qM7JYdtZd/ZbDagmISJiZM57cVv+ql+5Rw+B4Wb1pzxcwCbKNB6qEUmRmuD2OO+W
aBb9j6QHazt7nhnsb/x34Dx2M/D1WQ==
=ULPb
-----END PGP SIGNATURE-----

--E13BgyNx05feLLmH--
