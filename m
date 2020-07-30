Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA0F23383C
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jul 2020 20:15:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E5471683;
	Thu, 30 Jul 2020 20:14:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E5471683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596132913;
	bh=vIJFWrnXpMFHH8EimughuB8y+lmfzGjAgR03PPlEdOk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nzobKT4rlIJmY2ryP/I7JqrrAYZRtW4EA8kJzUVUwDrJgNllQMDNAA1895S8wYZ1t
	 i8FRT9jXTzEWbThgdn4yhxRs0EYggcA69QYo+oVzlVxdkdiEJqcx0Qz5lL1wW9FTW0
	 yWTVb+LsoJP0Tc1LBbNDixZWazWzzFya48IeizII=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 68705F800C9;
	Thu, 30 Jul 2020 20:13:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2A870F8021E; Thu, 30 Jul 2020 20:13:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ACBC8F800C9
 for <alsa-devel@alsa-project.org>; Thu, 30 Jul 2020 20:13:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ACBC8F800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qEBcihMz"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B5C6D20829;
 Thu, 30 Jul 2020 18:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596132797;
 bh=vIJFWrnXpMFHH8EimughuB8y+lmfzGjAgR03PPlEdOk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qEBcihMz9YjzJB2lwWShh3zEfgGGSl291HW4Zvh8Bc18dbNAvzbYgPG/tHuiihSBU
 jjyvar5wpDBOzT+X6soS9Ny2YyOBoVvbauv+mEFSwlpyjzsq/Si73sVCsUvBl3ZzTG
 rGdennpMtSdGeT66ngzeEAffDlKV9bHKCyxk6RyY=
Date: Thu, 30 Jul 2020 19:12:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH] ASoC: core: restore dpcm flags semantics
Message-ID: <20200730181257.GF5055@sirena.org.uk>
References: <20200723180533.220312-1-pierre-louis.bossart@linux.intel.com>
 <20200729154639.1983854-1-jbrunet@baylibre.com>
 <2ad13f95-434d-376a-bc38-b209623b461e@linux.intel.com>
 <1jft998jbe.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="udcq9yAoWb9A4FsZ"
Content-Disposition: inline
In-Reply-To: <1jft998jbe.fsf@starbuckisacylon.baylibre.com>
X-Cookie: Alex Haley was adopted!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Stephan Gerhold <stephan@gerhold.net>,
 Liam Girdwood <lgirdwood@gmail.com>, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 zhangn1985@outlook.com, linux-amlogic@lists.infradead.org
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


--udcq9yAoWb9A4FsZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 30, 2020 at 11:04:53AM +0200, Jerome Brunet wrote:

> Carrying redundant information makes things complex and error prone.
> If you really want to update this, here is another proposition:
>  * Removing snd_soc_dai_link_set_capabilities()
>  * Removing both flags completely
>  * Let ASoC figure out what is needed based on the components present.

My understanding is that that was broadly where we were headed with this
stuff - snd_soc_dai_link_set_capabilities() is trying to figure things
out from the components already, it's storing the flags as a cache but
could be modified so we use it every time we need a value.

>=20
> >
> >>
> >> Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> >> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> >> ---
> >>
> >>   Hi Mark,
> >>
> >>   Because b73287f0b0745 ('ASoC: soc-pcm: dpcm: fix playback/capture ch=
ecks')
> >>   introduced more than one problem, the change
> >>   "ASoC: core: use less strict tests for dailink capabilities" [0] is =
still
> >>   necessary but the change of semantic remains a problem with it.
> >>
> >>   This patch applies on top of it.
> >>
> >>   sound/soc/soc-pcm.c | 14 --------------
> >>   1 file changed, 14 deletions(-)
> >>
> >> diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
> >> index 00ac1cbf6f88..2e205b738eae 100644
> >> --- a/sound/soc/soc-pcm.c
> >> +++ b/sound/soc/soc-pcm.c
> >> @@ -2749,13 +2749,6 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd=
, int num)
> >>   					break;
> >>   				}
> >>   			}
> >> -
> >> -			if (!playback) {
> >> -				dev_err(rtd->card->dev,
> >> -					"No CPU DAIs support playback for stream %s\n",
> >> -					rtd->dai_link->stream_name);
> >> -				return -EINVAL;
> >> -			}
> >>   		}
> >>   		if (rtd->dai_link->dpcm_capture) {
> >>   			stream =3D SNDRV_PCM_STREAM_CAPTURE;
> >> @@ -2766,13 +2759,6 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd=
, int num)
> >>   					break;
> >>   				}
> >>   			}
> >> -
> >> -			if (!capture) {
> >> -				dev_err(rtd->card->dev,
> >> -					"No CPU DAIs support capture for stream %s\n",
> >> -					rtd->dai_link->stream_name);
> >> -				return -EINVAL;
> >> -			}
> >>   		}
> >>   	} else {
> >>   		/* Adapt stream for codec2codec links */
> >>
>=20

--udcq9yAoWb9A4FsZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8jDagACgkQJNaLcl1U
h9AuXgf8C4yoy4FY4cfbvcLUvUftWpBQ68HnBjmmDssWMcnsYPZ7eZAuo12Pivif
aUOrt8CMxCHQ2wDuoSwzLRNhAIHNUMBwGqLwTiLtT5vivhKDjZjnZqjtkswHWb2T
fJMyArIjKroVQWjmOkarx4gjKfx5mfv1RZmS3xnNvyD+YVY6AcCaITZuEo7j86td
QN1iHXQ1TPJI0wcql4Y3PEVkLC0O7F+4pReUCugbsPAfjTPvUc63KMfbtqzpQeov
WYBOnSzQyhJyeaT7YC9AaiGLgWcHq8o1TrmtQT+DD/qZotxlGOcaxx9GgHdkM3mq
X1YVKyKa3/VCh1h9xxE1P38ZSeo0qA==
=y7TQ
-----END PGP SIGNATURE-----

--udcq9yAoWb9A4FsZ--
