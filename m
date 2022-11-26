Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1AE6395AD
	for <lists+alsa-devel@lfdr.de>; Sat, 26 Nov 2022 12:16:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B2FF183E;
	Sat, 26 Nov 2022 12:15:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B2FF183E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669461387;
	bh=HSS26Kd6P6NkD8Fa0MKPiGlxuPe/2qgWcKacStDRcOY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ffsM5Ff9m/PL8rxh2hPtzsX4xiYiSAA4w1WTyCx+CyOfK/E0PAgzbRT2ioH79FOWc
	 a5+G6yY/AJzQ49jl2oIrclP3M8SREV6C+QpZ46sagCmPCznpQCywUhbi1n5E0ZDpdy
	 UeeLzBOX/50pVhuHaxELxliPASn8Kn+Q1ghv5D8s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B254EF80238;
	Sat, 26 Nov 2022 12:15:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50348F8016D; Sat, 26 Nov 2022 12:15:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F0174F800F4
 for <alsa-devel@alsa-project.org>; Sat, 26 Nov 2022 12:15:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0174F800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="WOAxPBjE"
Received: by mail-yb1-xb2d.google.com with SMTP id 189so7183023ybe.8
 for <alsa-devel@alsa-project.org>; Sat, 26 Nov 2022 03:15:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wNvvfY3upbBmV0ptvHyU/qt1R1ycCGcdEMDVGZt+Mcs=;
 b=WOAxPBjEFyN70qqlJyRYGKiEvHln4SnJjiFsbRas55MZztRzY6H8nqQFoWD9WAc0sv
 KHSI+rUsTeosqxLyn2LKwE6gwGtTniGxhnF0CaDyAP/NqQhsTwJC9cc4lWYyCqzMIxxm
 vLqx0G78ryhpoSGQ5EiAg8BEdLj80X3qsJzz8MTXymyK2ZLYL1xdGHgCR//8CeIT5YTk
 vzgoU02F0grQAXmRBeicBs8rHClX8gTnIjd3cnk1Ax+MyKZuRLjmsb8zFd79QpI7zRp9
 0V4+xownJ1hUXLY4ARJi/MHvmJovVrVbIvea5XgmcehXyPiPqt0kRMnARf3wyeR9DssQ
 tt4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wNvvfY3upbBmV0ptvHyU/qt1R1ycCGcdEMDVGZt+Mcs=;
 b=e7Yq4KQ+/mFkrTM4uzKOE/Cup0xZuho652W7uVrU1Nbfi9R/idfLnqvV1YIHH+JvMe
 eJ3fVGyqJPo1MKXrpBQd/n3tmueN0avE/kOZIWROsPpmfkbZS4AkXfTReOUNZQ1DK/op
 ih78XGjwJ7jKfxL3EeAFPwZCB7c8E2G4n8pLeUgD3EIt2UtpS/TDxy9iQBlG8/5IVuV0
 CfaOsFlOkHiRLmFBr3IabMYkM5LKbE4THpdTfp70B8GpKnwjVDS7JKNfJL93qcZa05DE
 gYuFqUf/oly4bAZRdPu5bspPMBBm1rCosQkjJ8MQITdtfMvY2cmZ9KGF2Q4nws9+GHm6
 LPaA==
X-Gm-Message-State: ANoB5pn2TdUbR962zH9EKbw+gbYUe2a+L6ZAVc9X+vLDV8CLZn/xOnHS
 hNsgt4isohqe1VwifgVMgfeu5lVOH1hlzCZKZ4Y=
X-Google-Smtp-Source: AA0mqf5MzyQBiDYOhE5qoEImvBdIvM3IIW8dW0xlyRwAjjGj3TpqprgLzmJD8+Y7l0vQgwtzSidnjzMt9QG3fTal45A=
X-Received: by 2002:a25:4185:0:b0:6f1:d2a9:126f with SMTP id
 o127-20020a254185000000b006f1d2a9126fmr10494268yba.26.1669461321700; Sat, 26
 Nov 2022 03:15:21 -0800 (PST)
MIME-Version: 1.0
References: <20221125163748.1288942-1-ckeepax@opensource.cirrus.com>
 <20221125163748.1288942-2-ckeepax@opensource.cirrus.com>
In-Reply-To: <20221125163748.1288942-2-ckeepax@opensource.cirrus.com>
From: Guillermo Rodriguez Garcia <guille.rodriguez@gmail.com>
Date: Sat, 26 Nov 2022 12:15:10 +0100
Message-ID: <CABDcavbtBBU7ySPK32104nZB5RHf2=LFuOOYOF-Ze1EDoM+etw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] ASoC: cs42l51: Correct PGA Volume minimum value
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 lgirdwood@gmail.com, david.rhodes@cirrus.com, broonie@kernel.org,
 james.schulman@cirrus.com
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

El vie, 25 nov 2022 a las 17:37, Charles Keepax
(<ckeepax@opensource.cirrus.com>) escribi=C3=B3:
>
> The table in the datasheet actually shows the volume values in the wrong
> order, with the two -3dB values being reversed. This appears to have
> caused the lower of the two values to be used in the driver when the
> higher should have been, correct this mixup.
>
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
>
> No changes since v1.
>
>  sound/soc/codecs/cs42l51.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/sound/soc/codecs/cs42l51.c b/sound/soc/codecs/cs42l51.c
> index 51721edd8f53c..e88d9ff95cdfc 100644
> --- a/sound/soc/codecs/cs42l51.c
> +++ b/sound/soc/codecs/cs42l51.c
> @@ -143,7 +143,7 @@ static const struct snd_kcontrol_new cs42l51_snd_cont=
rols[] =3D {
>                         0, 0xA0, 96, adc_att_tlv),
>         SOC_DOUBLE_R_SX_TLV("PGA Volume",
>                         CS42L51_ALC_PGA_CTL, CS42L51_ALC_PGB_CTL,
> -                       0, 0x19, 30, pga_tlv),
> +                       0, 0x1A, 30, pga_tlv),

The original patch where this control was added [1] already used 0x1A,
however this was later changed to 0x19 in [2]. Your patch now reverts
that change. Does this mean [2] was incorrect? If that is the case,
shouldn't the commit message for this patch mention that it fixes [2]
?

 [1]: https://lore.kernel.org/all/20200918134317.22574-1-guille.rodriguez@g=
mail.com/
 [2]: https://lore.kernel.org/all/20220602162119.3393857-7-ckeepax@opensour=
ce.cirrus.com/

Best regards,

Guillermo Rodriguez Garcia
guille.rodriguez@gmail.com
