Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D5D2077CC
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jun 2020 17:42:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00C90186C;
	Wed, 24 Jun 2020 17:42:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00C90186C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593013379;
	bh=EkpMO2y3Mkqy3dJRVw5QfgtDq9zlRdPmlOMku+obFrQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MzPgSY3FJ1RRMJT9GiJJ4qINdDonlUIQ7m16vU0fid/TBhZBZvkNCqJBMHX0W5jD4
	 N3YipNMyjdhGdhGsn1d5ue6DLGZcCaf2k5ko+KuzBc9mN2wUV32hl56aXBQrRn4Eai
	 QFD6564NQ8FecbrNr5+3XsA1YKU7wtoEllfpk/Cs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 315AFF800B2;
	Wed, 24 Jun 2020 17:41:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DCE31F8015B; Wed, 24 Jun 2020 17:41:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3A178F800B2
 for <alsa-devel@alsa-project.org>; Wed, 24 Jun 2020 17:41:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A178F800B2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="dkW12UzB"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4FCE820720;
 Wed, 24 Jun 2020 15:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593013271;
 bh=EkpMO2y3Mkqy3dJRVw5QfgtDq9zlRdPmlOMku+obFrQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dkW12UzBPaQMESSBob9yI5VsoG6UPmhzaeCwAQfNnOSpbILCmMXFW+7tijEIlF9gw
 1Rinm88dHfbeluXmE9//7bKlh1XrPY8Oeo4J2wzkjG2DkUHPx2qUnbfYBmaU8c2c0W
 zt/Ush29sLbOc4Nl3qnOwOXpGkT38Xhy3mqRFcZk=
Date: Wed, 24 Jun 2020 16:41:09 +0100
From: Mark Brown <broonie@kernel.org>
To: Tzung-Bi Shih <tzungbi@google.com>
Subject: Re: [PATCH] ASoC: rt1015: add missing header inclusion
Message-ID: <20200624154109.GA48567@sirena.org.uk>
References: <20200624053627.65179-1-tzungbi@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="qMm9M+Fa2AknHoGS"
Content-Disposition: inline
In-Reply-To: <20200624053627.65179-1-tzungbi@google.com>
X-Cookie: WYSIWYG:
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org
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


--qMm9M+Fa2AknHoGS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 24, 2020 at 01:36:27PM +0800, Tzung-Bi Shih wrote:
> To fix compile error:
>=20
> error: implicit declaration of function 'ACPI_PTR'
> [-Werror,-Wimplicit-function-declaration]
>                 .acpi_match_table =3D ACPI_PTR(rt1015_acpi_match),
> 		                    ^
>=20
> Adds the missing header inclusion and sorts in alphabetical.

This breaks the build for an x86 allmodconfig:

In file included from /mnt/kernel/sound/soc/codecs/rt1015.c:27:
/mnt/kernel/include/sound/soc-dapm.h:435:39: warning: 'struct snd_soc_pcm_r=
untime' declared inside parameter list will not be visible outside of this =
definition or declaration
 void snd_soc_dapm_stream_event(struct snd_soc_pcm_runtime *rtd, int stream,
                                       ^~~~~~~~~~~~~~~~~~~
/mnt/kernel/include/sound/soc-dapm.h:437:38: warning: 'struct snd_soc_pcm_r=
untime' declared inside parameter list will not be visible outside of this =
definition or declaration
 void snd_soc_dapm_stream_stop(struct snd_soc_pcm_runtime *rtd, int stream);
                                      ^~~~~~~~~~~~~~~~~~~
/mnt/kernel/include/sound/soc-dapm.h:445:50: warning: 'struct soc_enum' dec=
lared inside parameter list will not be visible outside of this definition =
or declaration
   struct snd_kcontrol *kcontrol, int mux, struct soc_enum *e,
                                                  ^~~~~~~~
/mnt/kernel/include/sound/soc-dapm.h:494:7: warning: 'enum snd_soc_bias_lev=
el' declared inside parameter list will not be visible outside of this defi=
nition or declaration
  enum snd_soc_bias_level level);
       ^~~~~~~~~~~~~~~~~~
/mnt/kernel/include/sound/soc-dapm.h:668:26: error: field 'bias_level' has =
incomplete type
  enum snd_soc_bias_level bias_level;
                          ^~~~~~~~~~
/mnt/kernel/include/sound/soc-dapm.h:678:26: error: field 'target_bias_leve=
l' has incomplete type
  enum snd_soc_bias_level target_bias_level;
                          ^~~~~~~~~~~~~~~~~
/mnt/kernel/include/sound/soc-dapm.h:725:61: error: parameter 2 ('level') h=
as incomplete type
  struct snd_soc_dapm_context *dapm, enum snd_soc_bias_level level)
                                     ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
/mnt/kernel/include/sound/soc-dapm.h:724:20: error: function declaration is=
n't a prototype [-Werror=3Dstrict-prototypes]
 static inline void snd_soc_dapm_init_bias_level(
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
/mnt/kernel/include/sound/soc-dapm.h:736:39: error: return type is an incom=
plete type
 static inline enum snd_soc_bias_level snd_soc_dapm_get_bias_level(
                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
/mnt/kernel/include/sound/soc-dapm.h: In function 'snd_soc_dapm_get_bias_le=
vel':
/mnt/kernel/include/sound/soc-dapm.h:739:9: warning: 'return' with a value,=
 in function returning void
  return dapm->bias_level;
         ^~~~
/mnt/kernel/include/sound/soc-dapm.h:736:39: note: declared here
 static inline enum snd_soc_bias_level snd_soc_dapm_get_bias_level(
                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from /mnt/kernel/include/sound/soc.h:1424,
                 from /mnt/kernel/sound/soc/codecs/rt1015.c:28:
/mnt/kernel/include/sound/soc-component.h: In function 'snd_soc_component_g=
et_bias_level':
/mnt/kernel/include/sound/soc-component.h:281:9: error: void value not igno=
red as it ought to be
  return snd_soc_dapm_get_bias_level(
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   snd_soc_component_get_dapm(component));
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/mnt/kernel/include/sound/soc-component.h: In function 'snd_soc_component_f=
orce_bias_level':
/mnt/kernel/include/sound/soc-component.h:299:3: error: type of formal para=
meter 2 is incomplete
   level);
   ^~~~~
cc1: some warnings being treated as errors

--qMm9M+Fa2AknHoGS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7zdBQACgkQJNaLcl1U
h9AjNwf8CicJZyPitSmO2DinachgVP1XSa8IInfTszJG96DkaxV8zpacJDq6yuhe
CW/zu/TBR7UIk9J2UEljnc7JO5v7TP3z3XKmgN1GrNtFs8Orn1xpZBIxHZzjmlnP
60cV9KkYnJ7mPvA1kz9j5QwcxoDXrVeEXAgrd9e7EGD+uY2FDX9U5SjC6x4UFlWO
dttRcNmcwbBqCyevHxBBpBbcsXHanAiis2iZSEAeOzJjrlxkN+aGFkPZmQkCsgnS
0APWv053q7kDgP3rH7/shV+Vs9AkO3N0HXw9z4WDWwTUBjy9fDNm35oo7BE0r1Mj
zUykAP+7xxtxGNoj1NpOQqBu2E/Bcw==
=LxH4
-----END PGP SIGNATURE-----

--qMm9M+Fa2AknHoGS--
