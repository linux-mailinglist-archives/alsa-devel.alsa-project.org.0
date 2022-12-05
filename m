Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9E0642814
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Dec 2022 13:08:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B3AC317C1;
	Mon,  5 Dec 2022 13:07:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B3AC317C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670242124;
	bh=K+Dd7xGXTDkGOUmFSn+Tmrppo1MrzYY2Lk+azYRrNIg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UIxP6hYeMZUY+AjHVB/rBE6WQ1Pc0uvL7elaBJGMU7n0OexN5ld2WyedriHlPZX1D
	 Zqu1PN3aJXr3725+LtilARgqePWi5VJf3TNZjfXGvjtkeFVgOAmEL+51ZgN0bEnTYm
	 rtbKdx+qCecMXgLuRkpmFhovXddoKAfZc+QKQ/Ro=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 450DDF8055C;
	Mon,  5 Dec 2022 13:07:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6E2C7F8055B; Mon,  5 Dec 2022 13:07:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7B9DBF80155
 for <alsa-devel@alsa-project.org>; Mon,  5 Dec 2022 13:07:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B9DBF80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="m1gkj524"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 95371B80F91;
 Mon,  5 Dec 2022 12:07:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E08C2C433C1;
 Mon,  5 Dec 2022 12:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670242050;
 bh=K+Dd7xGXTDkGOUmFSn+Tmrppo1MrzYY2Lk+azYRrNIg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=m1gkj5247+U4OLnyaCx2lbX33R9pdpFcyuxaNcBbQzKrA1hlMuZw7xpg76kPEO27x
 kUm7v+2SXEaVcuxFuOz86wLmKDzu8jfpk5jdqtYWWkq/1y7iJm+ITBsy+uOXINE5gg
 D/IlOVOJUaYUQqS9NqMbjywD7kVo4V0mpp0VNEChvkZSJhIffAXsFnv/ZjJ1haKzM9
 xB9L/3UcEy78yD/SaFiHTyYNCWOhT+r1FIFXZsC54p7ttrL5HoYvAjVP1FUBxLIid3
 K9TQjW0zvBmMidab5XPUhSr1LVM/uw0Gh5Vounv45TXpabRWy0RSWfyiqpbjOyX1cI
 LMBCv/rdqg6ww==
Date: Mon, 5 Dec 2022 12:07:20 +0000
From: Mark Brown <broonie@kernel.org>
To: Jiaxin Yu =?utf-8?B?KOS/nuWutumRqyk=?= <Jiaxin.Yu@mediatek.com>
Subject: Re: [PATCH v2 1/3] ASoC: hdmi-codec: Add event handler for hdmi TX
Message-ID: <Y43e+EsNCrCpZSIH@sirena.org.uk>
References: <20221125094413.4940-1-jiaxin.yu@mediatek.com>
 <20221125094413.4940-2-jiaxin.yu@mediatek.com>
 <Y4Cysgk5Gic5ae9B@sirena.org.uk>
 <18c82f6f723cd97a9d6b9a7ff16c6ed62fd005d6.camel@mediatek.com>
 <Y4Y/vEWe3dw0FPQH@sirena.org.uk>
 <cf9ea98a3263ffb8fc8b542888ad0ad680facfc7.camel@mediatek.com>
 <Y4jHAJgmz/P58Q/C@sirena.org.uk>
 <7023a2c7b471d6888d9079563a6c01f22599201f.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="2Zxw/Hvoq9IhDAxu"
Content-Disposition: inline
In-Reply-To: <7023a2c7b471d6888d9079563a6c01f22599201f.camel@mediatek.com>
X-Cookie: If it ain't broke, don't fix it.
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


--2Zxw/Hvoq9IhDAxu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 05, 2022 at 09:34:17AM +0000, Jiaxin Yu (=E4=BF=9E=E5=AE=B6=E9=
=91=AB) wrote:

> 1. I have added a DAPM widget that is "SDB", when we open or close HDMI
> PIN_SWITCH, the callback 'hdmi_tx_event' registered in the widget will
> be triggered. Maybe you mean I shouldn't use SNDRV_PCM_TRIGGER_START
> and SNDRV_PCM_TRIGGER_STOP?

No, I mean that if you want to control the enable and disable of the
output path you should implement a DAPM widget.

> 2. If I don't use hcd.ops->trigger notifies the bridge ic driver to
> switch the audio, which ops should I use?
> I actually want to know hdmi-codec.c and it6505.c except
> hdmi_codec_ops, is there any other way to communicate?

Like I said you should use the event on the DAPM widget.  This will
require providing operations for the events to the drivers.

--2Zxw/Hvoq9IhDAxu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmON3vcACgkQJNaLcl1U
h9Cbhgf+LMvcJgTpZwsDot1swl9dxC4R5KoASnnVtW3qUnTy6RJishGkt+FKlLX8
aw/XM5uZSMX1WA040KY4LRSrz/jSPdW2esD5PxtNo7+z87LmRi/AL9539cd8zu89
jNhbtBAQDyiNp1Y5mNKjEoL6wCbFS7Zt8XMnXHxddRKZClHNgn1q5/ZbfkbNP++Y
zsXuNSRUT4lzbBlfe2tRMJ1mPdz2R1Is+7sbNZIPIU4t741icrKukcCYPOuYfQeb
38OZ3gVyERI/AIfp7P0X5SLklXuTFFxAhbg617Bp254suyarICucIyvSvp7iTNxq
hg3akba+kzI36lZ6YuhE4NvJC589kQ==
=lrjL
-----END PGP SIGNATURE-----

--2Zxw/Hvoq9IhDAxu--
