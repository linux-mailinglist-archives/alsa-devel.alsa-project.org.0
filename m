Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B40C063F3C4
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Dec 2022 16:24:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3AEB61760;
	Thu,  1 Dec 2022 16:24:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3AEB61760
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669908299;
	bh=12sVLJi1eV03nDA+i/p257FYeSwqbJxoO6cnJV24q0M=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gHRtQ3lk7G9M4CjxmsZluKl7awyAgpKwFRjWtZDEh7P+D2MOxcwmlLr+yH1345bGa
	 WANNT+MXwqIfbPP8kXCxfp39HBupxizJelbIBaC1OcDbwT1unzgFChoi43QNo5nEKw
	 +2B44AcamVKuM8l6KuJ3EjM+ioq2EsOp3y+o4IVg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C92E5F80116;
	Thu,  1 Dec 2022 16:24:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 655EFF8028D; Thu,  1 Dec 2022 16:24:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2331EF80162
 for <alsa-devel@alsa-project.org>; Thu,  1 Dec 2022 16:23:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2331EF80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jibOnvj+"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B6B54B81F0A;
 Thu,  1 Dec 2022 15:23:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B016C433D7;
 Thu,  1 Dec 2022 15:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669908231;
 bh=12sVLJi1eV03nDA+i/p257FYeSwqbJxoO6cnJV24q0M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jibOnvj+ceP+BR55o6l9sQb1r8X/aMrdlpGQOisuZrWI+9WRbIhyylj+kTZFfYlvp
 hNGiLmS9l2xxf4fif7DL8ttkIl9exc9XMydLUEKvtGaFge7cHgtYyVALiK4S3x9f4o
 Gs4i+gzT4cS/dUW9koQ9VPgpSC6PSh9B6CXmXTFIFDvniE1wJjsWxP7xiBEoQXf5DF
 Z/mYIB+yybJptD2yMIELxwqgd2Xst42X0OumPYHkleZk2z/on9OjZnlP0orCmE7XgZ
 BXnkX1uV/88dBrZr3qN651U5LdpGE6+aRW7Hye2gsi9gVtqf+EBKwFjDnsLhaCnWp2
 8HGX6KLuok7WQ==
Date: Thu, 1 Dec 2022 15:23:44 +0000
From: Mark Brown <broonie@kernel.org>
To: Jiaxin Yu =?utf-8?B?KOS/nuWutumRqyk=?= <Jiaxin.Yu@mediatek.com>
Subject: Re: [PATCH v2 1/3] ASoC: hdmi-codec: Add event handler for hdmi TX
Message-ID: <Y4jHAJgmz/P58Q/C@sirena.org.uk>
References: <20221125094413.4940-1-jiaxin.yu@mediatek.com>
 <20221125094413.4940-2-jiaxin.yu@mediatek.com>
 <Y4Cysgk5Gic5ae9B@sirena.org.uk>
 <18c82f6f723cd97a9d6b9a7ff16c6ed62fd005d6.camel@mediatek.com>
 <Y4Y/vEWe3dw0FPQH@sirena.org.uk>
 <cf9ea98a3263ffb8fc8b542888ad0ad680facfc7.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="w3piYtER9tAyOK42"
Content-Disposition: inline
In-Reply-To: <cf9ea98a3263ffb8fc8b542888ad0ad680facfc7.camel@mediatek.com>
X-Cookie: Leveraging always beats prototyping.
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "nfraprado@collabora.com" <nfraprado@collabora.com>,
 Chunxu Li =?utf-8?B?KOadjuaYpeaXrSk=?= <Chunxu.Li@mediatek.com>,
 Allen-KH Cheng =?utf-8?B?KOeoi+WGoOWLsyk=?= <Allen-KH.Cheng@mediatek.com>,
 "kuninori.morimoto.gx@renesas.com" <kuninori.morimoto.gx@renesas.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "robert.foss@linaro.org" <robert.foss@linaro.org>,
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 "ajye_huang@compal.corp-partner.google.com"
 <ajye_huang@compal.corp-partner.google.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>
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


--w3piYtER9tAyOK42
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 01, 2022 at 03:06:04PM +0000, Jiaxin Yu (=E4=BF=9E=E5=AE=B6=E9=
=91=AB) wrote:
> On Tue, 2022-11-29 at 17:22 +0000, Mark Brown wrote:

> >  static const struct snd_kcontrol_new
> >  mt8186_mt6366_rt1019_rt5682s_controls[] =3D {
> >          SOC_DAPM_PIN_SWITCH("Speakers"),
> >          SOC_DAPM_PIN_SWITCH("Headphone"),
> >          SOC_DAPM_PIN_SWITCH("Headset Mic"),
> >          SOC_DAPM_PIN_SWITCH("HDMI1"),
> >  };

> Which operation should I use to inform bridge driver to control audio
> on or off? I'm curious why I don't see .trigger in the structure
> hdmi_codec_ops compared to the structure snd_soc_dai_ops?

You'd need to add a callback that the user of hdmi-codec passes in which
would be triggered by an event on a DAPM widget added in the audio path
rather than trying to shoehorn this into a PCM operation - a big part of
the problem here is that you're trying to add something that doesn't fit
into a PCM operation.

--w3piYtER9tAyOK42
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmOIxv8ACgkQJNaLcl1U
h9Ar2Af+KORDgtT/ighVT+gTBJm3oFdl9XsZhX6jFBIroRtVZqlgV0n2nL7IWrfL
oJQg0v/yecie2DMkQ5waSBz5RuFJktM6GkBBS21lztK1l/SpikqkDgNVAdiAEz10
FUldzHAK0zmjpp+jLHkJrATrzeMkJWDqyKXc7CVR6z8pStwYFJ9Ag6fkuKR7Y+CX
schrnd9I3hhtjcEfIG861/h8N9zVv2sRsG65nM4zjHFTMCWqxPwN8h2Ds7JialV7
gygMUpRaIdyoN79I/RllLk04yYtzQS3iVAS4KJevkYI/T9+zP3RLcuwSbzQJYdya
l5qY5/GtaQ3DiQVkOzLSxa4KfxCOmQ==
=fvZ3
-----END PGP SIGNATURE-----

--w3piYtER9tAyOK42--
