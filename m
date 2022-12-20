Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6A0651E42
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Dec 2022 11:01:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99FB618B7;
	Tue, 20 Dec 2022 11:00:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99FB618B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671530472;
	bh=n5IFlgo9IHypQr+PiaQQUwzHLlvcEhMCxmA99NwmPqc=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=maQamSOaRD2nFCO0B2HBRGTguTJoTKdLmGaOdAk/857NADSIOpWM5ZOf6Ee2ZGQaP
	 JX+3u4U9H4iiacEExt22tdNZZCjFq2HoB5aTXH1jCg5FhwppasAVUCne2hrsSmb0wN
	 8YgUDZ+cgnOKkvHDkNNvtrMXm1hzj1BIWOBY0X/k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D75DF8025E;
	Tue, 20 Dec 2022 11:00:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0BB7EF8032B; Tue, 20 Dec 2022 11:00:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F6CBF8018A
 for <alsa-devel@alsa-project.org>; Tue, 20 Dec 2022 11:00:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F6CBF8018A
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=HmVG4H0r
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BK4QkuE007237; Tue, 20 Dec 2022 04:00:07 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=iggrNUfF05o5Q7CliLq5INlfo7UUeAxRWMQHIQ8SDAw=;
 b=HmVG4H0r5v6M9yhJqCXlFiNUQrirbZQLhMszQoeui7pzalxb9LqD0+fk1EVOz5OgB8RQ
 STWqbRgZk+5gS2JhABBMkg4HDB78qNdBQWZPJOVE1hXRM+FDnISLdsSrOIB0zRxr9FZy
 oXxRWL6HwKXhbyqA0036vUS3odn3liazPOBjLOSCwK04O0geS+mL3D5XVgUbLSIliMbM
 UEoie6G4muZGAbH/HQyfd/YnJIH7ZbH9Xy44Esjacj6VpFKNy+vKL9cRXURDxlwHC4vv
 TFI6eYrk9jWDBMlKMUaOOCfwEKIw08zhM2+IFXE2fQqAMQiqNjsvlVEKREWwUk1pQdgV MA== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3mhc27bmxb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Dec 2022 04:00:07 -0600
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.20; Tue, 20 Dec
 2022 04:00:05 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.20 via
 Frontend Transport; Tue, 20 Dec 2022 04:00:05 -0600
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 11E0311C6;
 Tue, 20 Dec 2022 10:00:05 +0000 (UTC)
Date: Tue, 20 Dec 2022 10:00:05 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
Subject: Re: wm8904 and output volume control
Message-ID: <20221220100005.GD36097@ediswmail.ad.cirrus.com>
References: <c7864c35-738c-a867-a6a6-ddf9f98df7e7@gmail.com>
 <20221219095846.GC36097@ediswmail.ad.cirrus.com>
 <a8770d51-86f8-2a68-dd38-9b380f9c355a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <a8770d51-86f8-2a68-dd38-9b380f9c355a@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: UUgGXCofy_yDYVAjxvRCHhcXAFnpnR3-
X-Proofpoint-GUID: UUgGXCofy_yDYVAjxvRCHhcXAFnpnR3-
X-Proofpoint-Spam-Reason: safe
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Michael Walle <michael@walle.cc>,
 Mark Brown <broonie@kernel.org>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 emanuele.ghidoli@toradex.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Mon, Dec 19, 2022 at 04:20:10PM +0100, Emanuele Ghidoli wrote:
> On 19/12/2022 10:58, Charles Keepax wrote:
> >On Sat, Dec 17, 2022 at 12:47:14AM +0100, Emanuele Ghidoli wrote:
> With this patch (draft) seem the "bug" is fixed: (bug that is
> present, for sure, also with an effective regulator)
> 
> diff --git a/sound/soc/codecs/wm8904.c b/sound/soc/codecs/wm8904.c
> index ca6a01a230af..33452daf1ae8 100644
> --- a/sound/soc/codecs/wm8904.c
> +++ b/sound/soc/codecs/wm8904.c
> @@ -1903,6 +1903,7 @@ static int wm8904_set_bias_level(struct
> snd_soc_component *component,
>                         }
> 
>                         regcache_cache_only(wm8904->regmap, false);
> +                       regcache_sync_region(wm8904->regmap,
> WM8904_CLASS_W_0, WM8904_CLASS_W_0);
>                         regcache_sync(wm8904->regmap);
> 
>                         /* Enable bias */
> 

That is some good detective work.

> I infer, from datasheet, that volume update is applied in different
> way based on charge pump dynamic vs register control (CP_DYN_PWR bit
> in CLASS_W register):
> "Under Register control, the HPOUTL_VOL, HPOUTR_VOL, LINEOUTL_VOL
> and LINEOUTR_VOL register settings are used to control the charge
> pump mode of operation.
> Under Dynamic control, the audio signal level in the DAC is used to
> control the charge pump mode of operation."
> 
> The second sentence do not explain that volume register is still
> considered by the component but likely in a different way.
> 
> It is important to note that I trace I2C transactions and, without
> the patch, the CLASS_W register is written JUST after volume update
> registers (with the patch is written before and after).
> 
> At this point I have no doubt that we have to update that register
> before writing volume.
> 

Hmm... I think my only concern here is this feels a bit counter
intuitive, the default value is described as "controlled by
volume register settings" and we are saying in that situation the
volume registers don't seem to update properly. That is far from
impossible but I think we should perhaps poke a little more to
make sure we understand the bounds here.

I see that that CP_DYN_PWR bit is disabled when audio is going
through one of the bypass paths. Would you be able to enable one
of the bypass paths and see if you can manually adjust the volume
on the headphone output, with a bypass path active?

Would also perhaps be interesting as a test to completely remove
the write to CP_DYN_PWR from probe and leave things set to manual
and see how the volume behaves then?

I guess the interests here are to find out if the SYSCLK is
involved at all. And if the issue is changing CP_DYN_PWR after a
volume update is what causes the problem. I could perhaps see a
situation where the volume update data is sent to a different
place depending on the value of CP_DYN_PWR, meaning that changing
that bit after doing a volume update causes the volume data to be
lost, but that implies we might need a fix for the Class G widget
as well.

> I guess: is there another way to do same/similar thing (in a better
> way, like just force write to that register a little bit before of
> volume update. I walk around regmap/regcache but I do not find a
> different solution)?
> 
> We must pay attention that cached value of this register can be
> changed by widget "Class G" (my patch should work also if you toggle
> this widget).

I think assuming we get a point that the requirement is
simply that CLASS_W needs written before the volume, the change
as you propose it looks good. But I suspect there is a little
more going on here.

Thanks,
Charles
