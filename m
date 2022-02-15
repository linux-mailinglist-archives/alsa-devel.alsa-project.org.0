Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB514B69C5
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Feb 2022 11:53:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A017417E9;
	Tue, 15 Feb 2022 11:52:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A017417E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644922414;
	bh=alIDeThS8GIKIW/BeK2Z78qFKt7T3JiD/oKUN5fmgk4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gM1jGkyJxfBsTG2Q9h5C7+pNIrFHI1+epqY/3nEIc+QqxAiW1vdap7Iw0vbHbew8E
	 4mmU5UuWfhhFQfgmrs3Ntnqi2hfNDYvPzKJt2guCdIzvCp9eOcoyGGK3AbLgalYEmb
	 Rh/uA+KMCqxzLhF9zUxppDiyecwFkVd4NkjlszqY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 085C5F80100;
	Tue, 15 Feb 2022 11:52:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7CC3BF80132; Tue, 15 Feb 2022 11:52:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7D4D9F80100
 for <alsa-devel@alsa-project.org>; Tue, 15 Feb 2022 11:52:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D4D9F80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="IqrUABHw"
Received: by mail-ed1-x52b.google.com with SMTP id w2so12691146edc.8
 for <alsa-devel@alsa-project.org>; Tue, 15 Feb 2022 02:52:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4OZUiJMZfOPW+s8+zp0KLSm048f5lXYYUmg8fdpTCe4=;
 b=IqrUABHwxDGCZGKDIdPZ6zIZI9u56BcWJdl2kGXDbe2/Hp5rLRrNImmSl/deEouUAj
 +5s3AC3nQhMeCF/Sx8UdLK7Ge+/TWZ3sB5RPW0VhcBwyrkWKVVo8TO84DEa1sCmpLKQC
 /6f/HYJDo7xG2ZQbEe1lDBTFbTPO0Al5K92iEAVq988mtU4NmfUFSX3NRMz0alz5xDj8
 bhkCVtbSwwoaBI7CH+6IObRY7f0ffHT6hDq+ihcSoeiW1xphbIwStILplVBkoz0EJXKT
 uzxqDckNGDO4r+XQ6LajD9HA6xACAMUd2eJLSl5RDTYjRFwBpPWqzYLIzsZGh40RLvxy
 xXgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4OZUiJMZfOPW+s8+zp0KLSm048f5lXYYUmg8fdpTCe4=;
 b=f7cAT0KgzX16g9OJIGlrfsD1M+DDcm2HUtSwHu74yH+NMpt15xePC6qQbNJ24fCroZ
 7UFlghW27sExantgN+0/fg+AaeCvtuOHPLze8+5RllwATxo6Zq1dc2WKWBINqF09lBRJ
 T3DqolNWyjf+h8TPYNhcCcCAkHKrLk6CFZ5ZZb9OcvHbT/+iJLb1Wme/ctKOkkVpGS6/
 JZlv7BVk+q5ZNlm84l9DpSIpj8ZYqxY3T5yHvjX+ntjYd4IHuK4wmeQrcXlfVM4hqS3L
 ouNFOPK7mR3moi9Tz8m2064oEZqnYAxrEHw2wLe0p9lQIsAZZFi+FabU2Zs/KOEzsRnF
 0PNg==
X-Gm-Message-State: AOAM533bXUJX0is+k869fzRTwIHSGvEkScHY2hfJRmABu12J+jrOmdiH
 sijuyUrwWtkUSTQ7ULUGGCZ11g8mdKxgS1k3Y4zzstmkBVI=
X-Google-Smtp-Source: ABdhPJzB2s6+hP22BXw+41hJe12xUIg1vslkcP30MdNpzDsRnbt3P5WuLJLbolm6RBIMv75gyy8gTNBHCUGo2r4X+KY=
X-Received: by 2002:a05:6402:3697:: with SMTP id
 ej23mr3252186edb.81.1644922339501; 
 Tue, 15 Feb 2022 02:52:19 -0800 (PST)
MIME-Version: 1.0
References: <20220214195716.1096265-1-festevam@gmail.com>
 <20220215101950.GB38351@ediswmail.ad.cirrus.com>
In-Reply-To: <20220215101950.GB38351@ediswmail.ad.cirrus.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 15 Feb 2022 07:52:07 -0300
Message-ID: <CAOMZO5BGt1UFm97mpfhfDzkq4i9n=wWpMtUCr=JRcnbN0a_ipw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: cs4265: Fix the duplicated control name
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Fabio Estevam <festevam@denx.de>, Linux-ALSA <alsa-devel@alsa-project.org>,
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

Hi Charles,

On Tue, Feb 15, 2022 at 7:20 AM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:

> Looking through the code I think its probably better to combine
> the two controls here. It looks like you would need to set both
> to enable the SPDIF and I don't really see any reason for them to
> be different. I think you can just move the register bits onto
> the DAPM widget and have DAPM control them.
>
> This patch also probably needs a fixes tag:
>
> Fixes: f853d6b3ba34 ("ASoC: cs4265: Add a S/PDIF enable switch")
>
> Apologies for missing this in my review of the original patch.
> Let me know if you want me to have a bash at combining them.

Do you mean something like this?

--- a/sound/soc/codecs/cs4265.c
+++ b/sound/soc/codecs/cs4265.c
@@ -122,7 +122,7 @@ static const struct snd_kcontrol_new loopback_ctl =
        SOC_DAPM_SINGLE("Switch", CS4265_SIG_SEL, 1, 1, 0);

 static const struct snd_kcontrol_new spdif_switch =
-       SOC_DAPM_SINGLE("Switch", SND_SOC_NOPM, 0, 0, 0);
+       SOC_DAPM_SINGLE("Switch", CS4265_SPDIF_CTL2, 5, 1, 1);

 static const struct snd_kcontrol_new dac_switch =
        SOC_DAPM_SINGLE("Switch", CS4265_PWRCTL, 1, 1, 0);
@@ -150,7 +150,6 @@ static const struct snd_kcontrol_new
cs4265_snd_controls[] = {
        SOC_SINGLE("E to F Buffer Disable Switch", CS4265_SPDIF_CTL1,
                                6, 1, 0),
        SOC_ENUM("C Data Access", cam_mode_enum),
-       SOC_SINGLE("SPDIF Switch", CS4265_SPDIF_CTL2, 5, 1, 1),
        SOC_SINGLE("Validity Bit Control Switch", CS4265_SPDIF_CTL2,
                                3, 1, 0),
        SOC_ENUM("SPDIF Mono/Stereo", spdif_mono_stereo_enum),
@@ -186,7 +185,7 @@ static const struct snd_soc_dapm_widget
cs4265_dapm_widgets[] = {

        SND_SOC_DAPM_SWITCH("Loopback", SND_SOC_NOPM, 0, 0,
                        &loopback_ctl),
-       SND_SOC_DAPM_SWITCH("SPDIF", SND_SOC_NOPM, 0, 0,
+       SND_SOC_DAPM_SWITCH("SPDIF", CS4265_SPDIF_CTL2, 5, 1,
                        &spdif_switch),
        SND_SOC_DAPM_SWITCH("DAC", CS4265_PWRCTL, 1, 1,
                        &dac_switch),

If this is not what you meant, please feel free to submit a proper patch.

Thanks
