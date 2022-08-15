Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3805942CB
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Aug 2022 00:15:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92145868;
	Tue, 16 Aug 2022 00:15:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92145868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660601758;
	bh=cR4MSEwpqikQ9b18WozkbTaFwd6lhSnVAeh3CtQyXlI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NBV1koJ2hJE3OF8xun3whEJzsWRWGrwK3KW0RiZ8JY/ChoUzutkjfhG7fKSukWydn
	 hG9lO5qdZqTCfk0/4+V74heBfzCP7MY4L+Dnt2Jb2zt4KL8haASryi2N+qbK9EVJB6
	 dM7pQNHZ5zIc/41fUy21w0aUNYnMxA3G5lBTneO0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 09F97F80082;
	Tue, 16 Aug 2022 00:15:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6ECF8F80082; Tue, 16 Aug 2022 00:14:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E2C0F80082
 for <alsa-devel@alsa-project.org>; Tue, 16 Aug 2022 00:14:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E2C0F80082
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="s7bZBqv3"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 198B460F9F;
 Mon, 15 Aug 2022 22:14:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B18E9C433D6;
 Mon, 15 Aug 2022 22:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660601688;
 bh=cR4MSEwpqikQ9b18WozkbTaFwd6lhSnVAeh3CtQyXlI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=s7bZBqv356zva5qYY2lylE2geDgPUmVCgYZrTFr0jke2XLcRx/cirq5BmDokFm6Vj
 ZM61lioj87NkG92swOCjdWDf6RJOU/dLNPrZ32+OJxtSPR4/Cka/YQlTHZtemp3fpU
 A54B6K/rx0T7by98kiYkcjBEm7ICO3gDqgTQ5hMnDiwuSIRL7EZ6+0WWqEniXypJOa
 qP+iBkVHGF/tnGmbJtVd0bI+tlEQdTX0BbIrNjaHagI7mDtGgTjIDSLQl1jB98qvbC
 m9vgwGWiMonV6aIb16NyNz6zQTpcdllfizJssm6GV3VgXP8DuEV0H9jh6tfX2TWWnR
 vtsT/GhUSpFVA==
Date: Mon, 15 Aug 2022 23:14:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [PATCH v2 2/6] ASoC: SOF: Intel: Introduce HDA codec init and
 exit routines
Message-ID: <YvrFUwPq/dAG8H7S@sirena.org.uk>
References: <20220815174227.3071323-1-cezary.rojewski@intel.com>
 <20220815174227.3071323-3-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="qZSOYumMUF1yc4SY"
Content-Disposition: inline
In-Reply-To: <20220815174227.3071323-3-cezary.rojewski@intel.com>
X-Cookie: We have ears, earther...FOUR OF THEM!
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com
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


--qZSOYumMUF1yc4SY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 15, 2022 at 07:42:23PM +0200, Cezary Rojewski wrote:
> Preliminary step in making snd_hda_codec_device_init() the only
> constructor for struct hda_codec instances. To do that, existing usage
> of hdac_ext equivalents has to be dropped.
>=20
> Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>

Acked-by: Mark Brown <broonie@kernel.org>

--qZSOYumMUF1yc4SY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmL6xVIACgkQJNaLcl1U
h9D93Qf9EQbN2e1nR9Xv+DhpubnxtCSQGYsg2MQUZjfSXtho5v4NJxXAsVXDRt4y
Dlg7kuGcouUEtT/Imbcvs8F91qgOaVRivavKRgkzLUgrcZ04c9JqWFS9wU9QcpyM
DG2zL5SEPCnMnPdvruiJGoRO8eL2JHOzZ7LHwEER2wpqt+x7Zzlyx/ieOtBuuvk0
CQekpiLLUqk8dpppQzsidZ+10u9w1MN6XUblkBz+syutXyyB4flZBK97se9zKGqT
nyJ0l6lha5TjbJeuB4zF9OhVjkQrGsz7qtOISrQkdd0pYmS/zcswMeXdprAq/6KG
iQgNrASNz4ANUC44Ujw774MbVGWQ8Q==
=S+0E
-----END PGP SIGNATURE-----

--qZSOYumMUF1yc4SY--
