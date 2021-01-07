Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB472ED138
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Jan 2021 14:57:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6DF351686;
	Thu,  7 Jan 2021 14:56:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6DF351686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610027833;
	bh=LXnYFuO/m7yLkPaglBXr1YjV5t1JasbH7WmOzsST9Wk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E1OBwOZZcmXLjA87g6FQ2QzZAUfxdRFV5umzje1FhKpTS4OkYYWRdKzdmivPJN11f
	 1cr8pfOILpQxoSkFaqa3VffEZVWDVG8OuM9zVvefc5lJRHqA/RsZXaU1gmI+MOCBKY
	 bCqEkJmo9bhA/3LStIiTgqNf8zH7MHozTm3CX4Q4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 10B69F800E9;
	Thu,  7 Jan 2021 14:55:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 77D9BF80258; Thu,  7 Jan 2021 14:55:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B85D2F800E9
 for <alsa-devel@alsa-project.org>; Thu,  7 Jan 2021 14:55:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B85D2F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="tL/Xgu59"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6FB3C23142;
 Thu,  7 Jan 2021 13:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610027729;
 bh=LXnYFuO/m7yLkPaglBXr1YjV5t1JasbH7WmOzsST9Wk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tL/Xgu59loQzasBhYzsuRuw5qW96vjuHKF6R7TV68gC7h09S8Pjnxe1wp/UjouzSQ
 Wbz8oGvH+SsrVkZ6BXlbw625mlWaSMdhelst/hsQhEVn3pGNrSL/eAZ/d4CBw3anNA
 SxFybFDAO+wcReIEx8xiIglNfdv5VqRLzTcOQqqODyTOKrW4ISNpmnQb1J/CJ8E0AE
 q4Ruhu2Rwe1CJ+2F+42Drum5jt47YG1oAi4OFusucNgJP66s3gDGVxZ/ZH4lRpeYtL
 jeZ/lrfRoW1mJ5O2q6GgTr7H4eE9rskovRPyKq5pOse1mNDg/2ETBqjS99sPI5xg+M
 ipPpoTxeJpVWQ==
Date: Thu, 7 Jan 2021 13:54:59 +0000
From: Mark Brown <broonie@kernel.org>
To: Yu-Hsuan Hsu <yuhsuan@chromium.org>
Subject: Re: [PATCH 1/2] cros_ec_commands: Add EC_CODEC_I2S_RX_RESET
Message-ID: <20210107135459.GB4726@sirena.org.uk>
References: <20210107085942.2891525-1-yuhsuan@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="kORqDWCi7qDJ0mEj"
Content-Disposition: inline
In-Reply-To: <20210107085942.2891525-1-yuhsuan@chromium.org>
X-Cookie: See store for details.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org,
 "Gustavo A . R . Silva" <gustavoars@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Guenter Roeck <groeck@chromium.org>, Prashant Malani <pmalani@chromium.org>,
 Pi-Hsun Shih <pihsun@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Benson Leung <bleung@chromium.org>, Cheng-Yi Chiang <cychiang@chromium.org>
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


--kORqDWCi7qDJ0mEj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 07, 2021 at 04:59:41PM +0800, Yu-Hsuan Hsu wrote:
> Add the new command EC_CODEC_I2S_RX_RESET in ec_codec_i2s_rx_subcmd,
> which is used for resetting the EC codec.

I think the request was to sync over all the commands that are supported
in the EC rather than just split this one addition into a separate
patch.

--kORqDWCi7qDJ0mEj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/3ErIACgkQJNaLcl1U
h9AuIQgAhsn5doavvuB2jUYoY2Vgy/KRdrB0f0S4BCUso6u8B5NBsKVudkZGYy2N
UCNkXPtEnMnMR+hvvxw+b1Ntj80HbL26Ih/ZgtFAzWFkMg+DLf8QOIQIBaI9cK1r
YC7IW1f3XZ+U81xyLncWZTXBJ0LI3mJMJ6TNnxWiYaa+ebFEsCS/wqUMtjUFOKjw
en5ZSZpAa/KebHEmLU4q/cL8nF/xN9H/dNLuxGYJR30oQsdX8N69+fQRU24A717/
KkGl2QXHlmOIS5+po6YTFC8auuuU6LEcsKVU1uEJ2w7asaklubUO71AaohFt4uT7
UDghAbNdmHDXvrV7Dd6bCBqWLr4mtA==
=zhj3
-----END PGP SIGNATURE-----

--kORqDWCi7qDJ0mEj--
