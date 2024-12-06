Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5599E751F
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Dec 2024 17:07:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 675912119;
	Fri,  6 Dec 2024 17:07:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 675912119
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1733501256;
	bh=gToIYM+37jkKtK/Sbu0IwPGwvwqDSaBXiHsgZA/gUAk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oF09PRgZFb7T+YN6gTOC+4ZLrynlJJFpJBHclkZfPHzkI0D9xc6w2tzxoYDGBORg9
	 Y5cJ5g7sX1LmZCka+2cUggGqYIL/MAMbaQANFtHIUBYo9pz+AaqKEnvLPt6CIqxt6c
	 myyW/vF9vH/BQjp92ovXuN2zGAQrLCp6/2qoYG6o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7C678F805AA; Fri,  6 Dec 2024 17:07:05 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E09EF805BF;
	Fri,  6 Dec 2024 17:07:04 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4F771F8047C; Fri,  6 Dec 2024 17:06:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 55AC0F800E9
	for <alsa-devel@alsa-project.org>; Fri,  6 Dec 2024 17:06:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55AC0F800E9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=rUZhriGH
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 056675C6946;
	Fri,  6 Dec 2024 16:06:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 403D8C4CED1;
	Fri,  6 Dec 2024 16:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733501211;
	bh=gToIYM+37jkKtK/Sbu0IwPGwvwqDSaBXiHsgZA/gUAk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rUZhriGHwCOGUtnZPn6FC7saJhs6BKSmHqVG5AS+E0JB1T7WxDfeMpEbolQahWmV4
	 +/IvsXta9NDAgw02+PN2UCwNsn9gZ7EcEzwPrENYs2Vv191ztYUHRjTXw+lBe+c9Ic
	 odbaoVofPbb+z6qo3uRJPlLjvHkpPXpFKIIvFaH5hbkzMAoRG89g854UUjG8fG127a
	 4I04DzE5/U6OQjK/qkdEVVwAPxTAKAB2LS0I9ttpCOLbB7M9AkUDMA1KcR+1H7deLu
	 TFv1mG8eIAAlXUdkyPJgcjkxdssShLZNDvFIYmCLWfTfQ3uccoPRQtkhT+hkSm5eNH
	 lTXQ1kBPWpADw==
Date: Fri, 6 Dec 2024 16:06:45 +0000
From: Mark Brown <broonie@kernel.org>
To: Jiaxin Yu =?utf-8?B?KOS/nuWutumRqyk=?= <Jiaxin.Yu@mediatek.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"ajye_huang@compal.corp-partner.google.com"
 <ajye_huang@compal.corp-partner.google.com>,
	Chunxu Li =?utf-8?B?KOadjuaYpeaXrSk=?= <Chunxu.Li@mediatek.com>,
	Allen-KH Cheng =?utf-8?B?KOeoi+WGoOWLsik=?= <Allen-KH.Cheng@mediatek.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"kuninori.morimoto.gx@renesas.com" <kuninori.morimoto.gx@renesas.com>,
	"andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
	"linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
	Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"robert.foss@linaro.org" <robert.foss@linaro.org>,
	"Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
	"neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Nicolas Prado <nfraprado@collabora.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: Re: [PATCH v2 1/3] ASoC: hdmi-codec: Add event handler for hdmi TX
Message-ID: <6456e0b7-08ae-4515-a7c9-734f50c9130a@sirena.org.uk>
References: <Y4Y/vEWe3dw0FPQH@sirena.org.uk>
 <cf9ea98a3263ffb8fc8b542888ad0ad680facfc7.camel@mediatek.com>
 <Y4jHAJgmz/P58Q/C@sirena.org.uk>
 <7023a2c7b471d6888d9079563a6c01f22599201f.camel@mediatek.com>
 <Y43e+EsNCrCpZSIH@sirena.org.uk>
 <dc50d0b21795acbcc44c77e5fd81e7cb92c65c67.camel@mediatek.com>
 <Y5ipwqzHKTK8UdlC@sirena.org.uk>
 <a699178dcef540fff5caae6291983a444886bff6.camel@mediatek.com>
 <00d5c728-3eb9-427a-bc60-5828c20fec09@sirena.org.uk>
 <b44319c9fabbea2e8c333191a0005ef5c4ec6b2c.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0Q96+HlCP5jtbeOt"
Content-Disposition: inline
In-Reply-To: <b44319c9fabbea2e8c333191a0005ef5c4ec6b2c.camel@mediatek.com>
X-Cookie: Sales tax applies.
Message-ID-Hash: JHQNLK6KN5UGHGIH5JMXBBEXYT7MXZFM
X-Message-ID-Hash: JHQNLK6KN5UGHGIH5JMXBBEXYT7MXZFM
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JHQNLK6KN5UGHGIH5JMXBBEXYT7MXZFM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--0Q96+HlCP5jtbeOt
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 06, 2024 at 03:39:15PM +0000, Jiaxin Yu (=E4=BF=9E=E5=AE=B6=E9=
=91=AB) wrote:
> On Mon, 2024-12-02 at 13:16 +0000, Mark Brown wrote:
> > On Sun, Dec 01, 2024 at 05:15:45PM +0000, Jiaxin Yu (=E4=BF=9E=E5=AE=B6=
=E9=91=AB) wrote:

> > > So I want to ask if I can do it by just adding
> > > SOC_DAPM_PIN_SWITCH("Speakers") and SOC_DAPM_PIN_SWITCH("HDMI")?
> > > Correspondingly, dapm widget and route path need to be added. That
> > > is
> > > "SND_SOC_DAPM_SPK("Speakers", NULL)/ SND_SOC_DAPM_LINE("HDMI1",
> > > NULL)"
> > > and "{"Speakers", NULL, "Speaker"}/ {"HDMI1", NULL, "TX"}".

> > Yes, that's what I'd expect to see.

> So if I open the "HDMI Switch" amixer control, it will call
> 'hdmi_codec_startup', which in turn calls "audio_startup()"  in
> 'hdmi_codec_ops'. Conversely, if I close it, it will call
> 'hdmi_codec_shutdown', which in turn calls 'audio_shutdown' in
> 'hdmi_codec_ops'. Is this understanding correct?

The audio stream will still run, the DAPM path attached to it will get
shut down.

--0Q96+HlCP5jtbeOt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdTIRQACgkQJNaLcl1U
h9AR8gf9Hfqv5O8hW1VoO/+oNPx5CkfRkyZFsfXQTS4FYXeTZ9zcxTzV8bdgREIe
WVUSi00ehS2CCupQkffrSFfZHqk88wxKrrMFNQYcoDrekq/kUtbseBayFJgB6mQY
4NUYT/0mnejbXDk+qeiHI1f0UzygswelfRVu+TZ7exCG2UI7GJO2RYdL6fpItNpQ
F7ISvK9ldljmyAmqAbZ8Ol6tg2eNfbhESwdEGsGrx58UpFAWH/0Qb6G+T4tzPxQ+
3rMJvvwahR0VMHmVglGFRUneunLknVaycWRVne7jYBilbaRlWMGQQ4FVs8XLY45q
OE7ZqGZc2+b4p2bOuAcnSLIiQPRSsg==
=/TNF
-----END PGP SIGNATURE-----

--0Q96+HlCP5jtbeOt--
