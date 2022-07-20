Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3922A57B7FD
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Jul 2022 15:57:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E284217A7;
	Wed, 20 Jul 2022 15:57:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E284217A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658325477;
	bh=Z4oDYkFj6iJIsZAYxl0B0cyyWM0IYHneh00JcZSbwIU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XKRKx6TywRIGotSuK6qJPgsA702KyuiSjHVRMcaaJjClPaSpPyrXTiI5lRd9eOdkz
	 XZ92mvgSegmJgINIojn0eAuv7XbUbYHSk5AyoA6xlGwLHlS7GzOM78P4yp2Ccupi6Z
	 rlWzKBqVObPH8orQycFvZ1nIJlr3kD8BSGzzNcik=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F209F80139;
	Wed, 20 Jul 2022 15:56:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6B5E3F80139; Wed, 20 Jul 2022 15:56:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4B98DF800BA
 for <alsa-devel@alsa-project.org>; Wed, 20 Jul 2022 15:56:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B98DF800BA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Uaq8WKE4"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CA9C1B81F6A;
 Wed, 20 Jul 2022 13:56:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10822C3411E;
 Wed, 20 Jul 2022 13:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658325410;
 bh=Z4oDYkFj6iJIsZAYxl0B0cyyWM0IYHneh00JcZSbwIU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Uaq8WKE4exwQcP7FvFIlQ//WR9nHGbtW+PidIPumNZWVfqtIK/LH2Uv6h7N0+8DYS
 wTT0JiY76p76S2qShYV9qd5+eX207EB086RA6U6TrZZQrisj5iqBlpZVPwHWdN4gUJ
 3uI0G9MfnDSQ4TtChxOAaQnOaICXKN78ezNkAprIcgfaOvgzAF1qdwldkMbd50DJr1
 HqRTYOv40d8FgTSzrZ/1rqYL2MemLRiIdSs3u6kav5OiPNKmyNHemCkfkgLmiVHQOH
 gB9fdHFmVu5LjPW/HNy0os+rrKuaZH7POhQoMICPdK9l1cTrY63/zdE90g7vFHzw19
 tkWk5Pmp1lmNQ==
Date: Wed, 20 Jul 2022 14:56:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [PATCH 1/4] ASoC: hdac_hda: Disconnect struct hdac_hda_priv and
 hda_codec
Message-ID: <YtgJmQOGQ+CvwJfz@sirena.org.uk>
References: <20220720130622.146973-1-cezary.rojewski@intel.com>
 <20220720130622.146973-2-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="yPPf5XnrCWXwOTF3"
Content-Disposition: inline
In-Reply-To: <20220720130622.146973-2-cezary.rojewski@intel.com>
X-Cookie: I exist, therefore I am paid.
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 ranjani.sridharan@linux.intel.com, amadeuszx.slawinski@linux.intel.com,
 peter.ujfalusi@linux.intel.com
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


--yPPf5XnrCWXwOTF3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 20, 2022 at 03:06:19PM +0200, Cezary Rojewski wrote:
> Preliminary step in making snd_hda_codec_device_init() the only
> constructor for struct hda_codec instances. To do that, no struct may
> wrap struct hda_codec as its base type.

Acked-by: Mark Brown <broonie@kernel.org>

--yPPf5XnrCWXwOTF3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLYCZgACgkQJNaLcl1U
h9B5nAf/el0MY0afFppeEXBxBhVZEFYnoLtbo18k4H6Dni+PvxPdiW8GRVl6KSvO
RzVGuKq9PF6yGR8KONUepj0H8xOQZspDGiwOCIJadPf2PuszsdTfiG5DpogEco1T
CXI4s11lEB0z+9LjzMUdpMJCDwcGBxjzgpaRpLdVnISbvznLZB9joLdk0koktK6S
mE3SZf1ef4joUZS+CGdmM31aUqVi8kYD0G8toZfqXjp8wkSnJ+ndmBKc1EcUUXWY
+ObBcOc6aLFx93IDA53IQLuj54dXhEymqvzP5mXtvoNxZpTDrPKxf1/GbAA9onQp
mq0p8tC+8sBafMwL+2T4eWmavTyjsA==
=aM9a
-----END PGP SIGNATURE-----

--yPPf5XnrCWXwOTF3--
