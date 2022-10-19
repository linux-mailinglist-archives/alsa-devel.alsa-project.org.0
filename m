Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C7825603C65
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Oct 2022 10:46:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E02299270;
	Wed, 19 Oct 2022 10:45:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E02299270
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666169196;
	bh=NVTcANCrxCI1U+tINgqTe1kO7VAtqeNTzGvsfsh1+bk=;
	h=Date:From:Subject:To:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hyzkDvJ9QjdiqufLy+Hyes4rYPE9F0Yzh+2Vg8m3GkKlhsbkt/82xk285E3r2ZMZE
	 RnsYQyxRkUsNvPlZh0dWohZ8b9foTH9vTS3IYPNXxibE1TwpB6YzGDfZ+sYN6k5NeM
	 uFWrHGTMolEDj73cM6ZBR6f5L6NlucAhqxzyrfRs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 64966F804CB;
	Wed, 19 Oct 2022 10:45:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BB5E1F804CC; Wed, 19 Oct 2022 10:45:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_DBL_BLOCKED_OPENDNS,URIBL_ZEN_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from aposti.net (aposti.net [89.234.176.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A9637F80137
 for <alsa-devel@alsa-project.org>; Wed, 19 Oct 2022 10:45:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9637F80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net
 header.b="jjeeum7S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1666169132; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2irzQRisuQph0qVQTfrw1gD3XTb5c+6xxeX7I05Lbx8=;
 b=jjeeum7SZmGwGhPrFwc9Kx571MNPHFw077WifZSIV7ABbqICZWqAwwtr6XpAciPJ8c8G/Y
 GMY+yWVDuu2ZD1dAMi5x/N5nNYJP3Cnz672CN98++xJOEFmmDWtKoHAPCr4z19courTJ1a
 uY61NBBpDo+2oB8Eydhc5FPKee34LiE=
Date: Wed, 19 Oct 2022 09:45:23 +0100
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH][next][V2] ASoC: codecs: jz4725b: Fix spelling mistake
 "Sourc" -> "Source", "Routee" -> "Route"
To: Colin Ian King <colin.i.king@gmail.com>
Message-Id: <NBSZJR.DRWYIWVJJ4H42@crapouillou.net>
In-Reply-To: <20221019071639.1003730-1-colin.i.king@gmail.com>
References: <20221019071639.1003730-1-colin.i.king@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-mips@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>
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

Hi Colin,

Le mer., oct. 19 2022 at 08:16:39 +0100, Colin Ian King=20
<colin.i.king@gmail.com> a =E9crit :
> There are two spelling mistakes in codec routing description. Fix it.
>=20
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Acked-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> ---
> V2: Fix "Routee" -> "Route" too
> ---
>  sound/soc/codecs/jz4725b.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/sound/soc/codecs/jz4725b.c b/sound/soc/codecs/jz4725b.c
> index 685ba1d3a644..64b14b1c74b9 100644
> --- a/sound/soc/codecs/jz4725b.c
> +++ b/sound/soc/codecs/jz4725b.c
> @@ -359,7 +359,7 @@ static const struct snd_soc_dapm_route=20
> jz4725b_codec_dapm_routes[] =3D {
>=20
>  	{"Mixer to ADC", NULL, "Mixer"},
>  	{"ADC Source Capture Route", "Mixer", "Mixer to ADC"},
> -	{"ADC Sourc Capture Routee", "Line In", "Line In"},
> +	{"ADC Source Capture Route", "Line In", "Line In"},
>  	{"ADC Source Capture Route", "Mic 1", "Mic 1"},
>  	{"ADC Source Capture Route", "Mic 2", "Mic 2"},
>  	{"ADC", NULL, "ADC Source Capture Route"},
> --
> 2.37.3
>=20


