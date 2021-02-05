Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB2C310CD2
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Feb 2021 16:00:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F3174E;
	Fri,  5 Feb 2021 15:59:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F3174E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612537245;
	bh=pcoVC9g6Ql5brnm8ZYrxM8gXd4vKE+CdwztAMluc3jc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Vi/st0unUKZTtIWc5JxerX3yrKR2pHHzI7cbtJ+PTCnL1d3dVBTmk28OjEKErFjPb
	 IyPj2YD+cocW0gpqccglfz5+eAqqWJIvPon7XPB+Ajmy1XhaRiAcOC1aox+W3aJMgG
	 BPejlTnLza922jtoGKOI7OF8L2IOPKyzb1qLSrM8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 64150F8016E;
	Fri,  5 Feb 2021 15:59:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA014F8015A; Fri,  5 Feb 2021 15:59:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DFB85F800C0
 for <alsa-devel@alsa-project.org>; Fri,  5 Feb 2021 15:59:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DFB85F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="dAu9XING"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 220B864FBC;
 Fri,  5 Feb 2021 14:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612537146;
 bh=pcoVC9g6Ql5brnm8ZYrxM8gXd4vKE+CdwztAMluc3jc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dAu9XINGXWMXKM/v4VSMEpR5UUCt36txoacXH7ka0tNv+vG8Uhvnlhf5OOFcYyRyK
 tKUvQdjoSvGBnoTZ1QDZRsluTJ4fRW+i0tlc+VKsUF9R5bkMFO921B8eKwzT9xS89+
 BxgNKjCkkKuVdr2Xb16fv/oWk2wF/IpowhfTwmRmdl/hk0xAPKiy6q/JPbOV9rihec
 DwKrhy22qVj5ArEmPBouXYoyduoc9mEyFyB8W2cvPw7M1ank7v970HjrN9h2zkMlCC
 yhP5EQx8DqzkpHfzgFM25WJfLei1aGv86v8U7bPoZpWQE7W4pd9B5eIU9O0dmMTnAy
 8ir6e/XFyhIKg==
Date: Fri, 5 Feb 2021 14:58:16 +0000
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH 5/7] ASoC: imx-pcm-rpmsg: Add platform driver for audio
 base on rpmsg
Message-ID: <20210205145816.GD4720@sirena.org.uk>
References: <1612508250-10586-1-git-send-email-shengjiu.wang@nxp.com>
 <1612508250-10586-6-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="k4f25fnPtRuIRUb3"
Content-Disposition: inline
In-Reply-To: <1612508250-10586-6-git-send-email-shengjiu.wang@nxp.com>
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


--k4f25fnPtRuIRUb3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 05, 2021 at 02:57:28PM +0800, Shengjiu Wang wrote:

> +	if (params_format(params) == SNDRV_PCM_FORMAT_S16_LE)
> +		msg->s_msg.param.format   = RPMSG_S16_LE;
> +	else if (params_format(params) == SNDRV_PCM_FORMAT_S24_LE)

Again this should be a switch statement.

> +	if (params_channels(params) == 1)
> +		msg->s_msg.param.channels = RPMSG_CH_LEFT;
> +	else
> +		msg->s_msg.param.channels = RPMSG_CH_STEREO;

Shouldn't this be reporting an error if the number of channels is more
than 2?

> +		/*
> +		 * if the data in the buffer is less than one period
> +		 * send message immediately.
> +		 * if there is more than one period data, delay one
> +		 * period (timer) to send the message.
> +		 */
> +		if ((avail - writen_num * period_size) <= period_size) {
> +			imx_rpmsg_insert_workqueue(substream, msg, info);
> +		} else if (rpmsg->force_lpa && !timer_pending(timer)) {
> +			int time_msec;
> +
> +			time_msec = (int)(runtime->period_size * 1000 / runtime->rate);
> +			mod_timer(timer, jiffies + msecs_to_jiffies(time_msec));
> +		}

The comment here is at least confusing - why would we not send a full
buffer immediately if we have one?  This sounds like it's the opposite
way round to what we'd do if we were trying to cut down the number of
messages.  It might help to say which buffer and where?

> +	/**
> +	 * Every work in the work queue, first we check if there

/** comments are only for kerneldoc.

--k4f25fnPtRuIRUb3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmAdXQcACgkQJNaLcl1U
h9ACUwf9EcHPKiRzzRa6Atb6PHhaM1oBK/2zYZcdmLDejwBct/KltZywmVsBQv0o
JmeLnKw7/jLk3Sph4Pqk6J2lyizC5nik/w7NjFO5CIUyNTQnFRZtaDILcnVr7vNk
28HX0/XoPM54EbfyncrP41lr/L4EYgHmjIMqi/TjVtFnfyOt1Pq99Rj02lKDVnV3
ERmOguBociG3yf9kV/wcrZzJ4hOg7Lw468CHtxoeCpPKsJovmByQ0I78JQJlJ1Jj
TRjC06zUmRhscWFCrWiOkItqPpTcrv5TxMVh5Ko5zE1rYslk8XURTFpnKDxWoxkR
MtylP+v1qS4G4STsZObKZtcso3D9hA==
=hzt6
-----END PGP SIGNATURE-----

--k4f25fnPtRuIRUb3--
