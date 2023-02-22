Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4DC69F015
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Feb 2023 09:22:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 38899EAE;
	Wed, 22 Feb 2023 09:21:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 38899EAE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677054128;
	bh=L/cmue57v7uAh7zSnKsunaI5q2fWN2ekzBWLgfOzKdY=;
	h=References:In-Reply-To:From:Date:Subject:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RcpkC0rAOagiinoVvyAZIJr3x5zlNU3+5Lbcip0gVfxaYnTaIvMssdgnDjTIZaqQp
	 Ktygd5DnSDFTM60+pHM6cxriNHB/OP593LORfYIkHRCVLfhwLJn5Z3cWBtusyUenqN
	 ql2UDjFDVaXQclHWEwlehGCIOcKdf1MTVdWtD6iw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 09957F80548;
	Wed, 22 Feb 2023 09:20:21 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 94730F80266; Wed, 22 Feb 2023 09:06:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ED5E2F80125
	for <alsa-devel@alsa-project.org>; Wed, 22 Feb 2023 09:06:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED5E2F80125
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=QIeyGVdi
Received: by mail-ed1-x52a.google.com with SMTP id s26so26880641edw.11
        for <alsa-devel@alsa-project.org>;
 Wed, 22 Feb 2023 00:06:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YPMa5Qux65YRcCMublZr2rs9cvXhmKdyVQIJVbnVWT4=;
        b=QIeyGVdiU5LBwkf9RJSeOssfXCPXfc+n9snEgrYXKBb8NenyI0boW/xxfZU1R+DpMj
         l2cBJRA3pB8DbWMZCWxOcwyP72h+4cDxOZZ06qwWke++yReExxdF91Ugu+NzpSO3KJRz
         hW2zewosI9BBVJw8iV1jvyR7C1mdJ7xVk78WBEyesMuuZbuq76C9I/JUQiXNfftVgniZ
         S41iZXacxL29FrSsyHP7uyUI+owC4ehc/4NiLAftGjYdMI1jnYk5vA4WyZbipApXOi/L
         bvOQNg1aVvCCCqR7E14zVk2b8mJcr0l06UV/tRgkkxzscxKfY7+1fFTP2N3lETJuF/g3
         TtsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YPMa5Qux65YRcCMublZr2rs9cvXhmKdyVQIJVbnVWT4=;
        b=nTYIo+q/17U6pBGxJhXSjvBQ1aJKox66wYxlDtSfG1PG36+Jzi7UmV/UXpWZoZPu+p
         YcjMP+HcLKtSHB7VH1A0YnMYlsW8DPiwXnDnuJnRy53/N4hvD5gqs6EqA1Ez+fxETuLa
         rN/eKtCCA8CsW8OoHtxr2NbNLf9eBQ4dcGLxvma0OkFqayhrtSSqaHFFe4vniwMZxNfH
         BqUXo+z5bBsKMkRjdBsKrqduNCBuv1geZ9nU+GrB7naXKQwKhDYq2IctWWWJvkN4pYdh
         O+kKE4YcWMfHEXKh8jrS6JGKpn2fxUEZUVQz8GfU2/bM8RL9eEBzSdUk6qijd/Lav07U
         JM3w==
X-Gm-Message-State: AO0yUKW6Iq/PW5oLpvSuZopQmVB42cHXdU3gE78+Jhuk3x542sK8FWOk
	jHUuenhe8uXrAjIMytdHd2FzNJO6dOMoqGpLaRM=
X-Google-Smtp-Source: 
 AK7set/+WSzCMMWSjAe/irqAayrxMoHG+PYHghqCVMxKunpmYfeihdWw0Wggr/PON9OUA12Vev6VplAxdW0pvv4Z/hA=
X-Received: by 2002:a17:906:4c49:b0:87b:fa21:7953 with SMTP id
 d9-20020a1709064c4900b0087bfa217953mr7250522ejw.8.1677053194946; Wed, 22 Feb
 2023 00:06:34 -0800 (PST)
MIME-Version: 1.0
References: <20230221183211.21964-1-clamor95@gmail.com>
 <20230221183211.21964-10-clamor95@gmail.com>
 <Y/Ud1bn+LExxLb/Q@kadam>
In-Reply-To: <Y/Ud1bn+LExxLb/Q@kadam>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 22 Feb 2023 10:06:23 +0200
Message-ID: 
 <CAPVz0n3T-SiTbDyQTTE4L==OGkpSQrfBAP5gRjEevt4ozZLB-g@mail.gmail.com>
Subject: Re: [PATCH v1 09/10] staging: dsp: add support for Fortemedia FM34NE
 DSP
To: Dan Carpenter <error27@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MailFrom: clamor95@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 4JGIV622KFFXLQ6XNI3BOVVNHYBI65D7
X-Message-ID-Hash: 4JGIV622KFFXLQ6XNI3BOVVNHYBI65D7
X-Mailman-Approved-At: Wed, 22 Feb 2023 08:20:08 +0000
CC: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Takashi Iwai <tiwai@suse.com>, Maxim Schwalm <maxim.schwalm@gmail.com>,
 Dmitry Osipenko <digetx@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4JGIV622KFFXLQ6XNI3BOVVNHYBI65D7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

=D0=B2=D1=82, 21 =D0=BB=D1=8E=D1=82. 2023 =D1=80. =D0=BE 21:39 Dan Carpente=
r <error27@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, Feb 21, 2023 at 08:32:10PM +0200, Svyatoslav Ryhel wrote:
> > +static int fm34ne_dsp_set_config(struct fm34ne_dsp_data *fm34, int sta=
te)
> > +{
> > +     struct device *dev =3D &fm34->client->dev;
> > +
> > +     const u8 *enable_ns_parameter =3D fm34->data->enable_noise_suppre=
ssion;
> > +     int enable_ns_length =3D fm34->data->enable_ns_length;
> > +
> > +     const u8 *disable_ns_parameter =3D fm34->data->disable_noise_supp=
ression;
> > +     int disable_ns_length =3D fm34->data->disable_ns_length;
> > +
> > +     int ret;
> > +
> > +     gpiod_set_value_cansleep(fm34->bypass_gpio, 1);
> > +     msleep(20);
> > +
> > +     switch (state) {
> > +     case FM34NE_NS_ENABLE:
> > +             ret =3D fm34ne_dsp_write_config(fm34->client, enable_para=
meter,
> > +                                           sizeof(enable_parameter));
> > +             if (ret < 0) {
> > +                     dev_err(dev, "failed to set DSP enable with %d\n"=
, ret);
> > +                     goto exit;
> > +             }
> > +
> > +             ret =3D fm34ne_dsp_write_config(fm34->client, enable_ns_p=
arameter,
> > +                                           enable_ns_length);
> > +             if (ret < 0) {
> > +                     dev_err(dev, "failed to enable DSP noise suppress=
ion with %d\n", ret);
> > +                     goto exit;
> > +             }
> > +
> > +             dev_info(dev, "noise suppression enable DSP parameter wri=
tten\n");
>
> Delete this type of debug code.
>
> > +             break;
> > +
> > +     case FM34NE_NS_DISABLE:
> > +             ret =3D fm34ne_dsp_write_config(fm34->client, enable_para=
meter,
> > +                                           sizeof(enable_parameter));
> > +             if (ret < 0) {
> > +                     dev_err(dev, "failed to set DSP enable with %d\n"=
, ret);
> > +                     goto exit;
> > +             }
> > +
> > +             ret =3D fm34ne_dsp_write_config(fm34->client, disable_ns_=
parameter,
> > +                                           disable_ns_length);
> > +             if (ret < 0) {
> > +                     dev_err(dev, "failed to disable DSP noise suppres=
sion with %d\n", ret);
> > +                     goto exit;
> > +             }
> > +
> > +             dev_info(dev, "noise suppression disable DSP parameter wr=
itten\n");
>
> Same etc.
>
> > +             break;
> > +
> > +     case FM34NE_BYPASS:
> > +     default:
> > +             ret =3D fm34ne_dsp_write_config(fm34->client, bypass_para=
meter,
> > +                                           sizeof(bypass_parameter));
> > +             if (ret < 0) {
> > +                     dev_err(dev, "failed to set DSP bypass with %d\n"=
, ret);
> > +                     goto exit;
> > +             }
> > +
> > +             dev_info(dev, "bypass DSP parameter written\n");
> > +             break;
> > +     }
> > +
> > +exit:
> > +     gpiod_set_value_cansleep(fm34->bypass_gpio, 0);
> > +
> > +     return ret;
> > +}
> > +
> > +static int fm34ne_dsp_set_hw(struct fm34ne_dsp_data *fm34)
> > +{
> > +     struct device *dev =3D &fm34->client->dev;
> > +     int ret;
> > +
> > +     ret =3D clk_prepare_enable(fm34->dap_mclk);
> > +     if (ret) {
> > +             dev_err(dev, "failed to enable the DSP MCLK: %d\n", ret);
> > +             return ret;
> > +     }
> > +
> > +     ret =3D regulator_enable(fm34->vdd_supply);
> > +     if (ret < 0) {
> > +             dev_err(dev, "failed to enable vdd power supply\n");
>
> clk_disable_unprepare(fm34->dap_mclk);

No, dap_mclk has to be on, else there will be no sound on the device.

> > +             return ret;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static void fm34ne_dsp_reset(struct fm34ne_dsp_data *fm34)
> > +{
> > +     gpiod_set_value_cansleep(fm34->reset_gpio, 1);
> > +     msleep(20);
> > +
> > +     gpiod_set_value_cansleep(fm34->reset_gpio, 0);
> > +     msleep(100);
> > +}
> > +
> > +static int fm34ne_dsp_init_chip(struct fm34ne_dsp_data *fm34)
> > +{
> > +     const u8 *input_parameter =3D fm34->data->input_parameter;
> > +     int input_parameter_length =3D fm34->data->input_parameter_length=
;
> > +     int ret;
> > +
> > +     ret =3D fm34ne_dsp_set_hw(fm34);
> > +     if (ret)
> > +             return ret;
> > +
> > +     fm34ne_dsp_reset(fm34);
> > +
> > +     gpiod_set_value_cansleep(fm34->bypass_gpio, 1);
> > +     msleep(20);
> > +
> > +     ret =3D i2c_smbus_write_byte(fm34->client, FM34NE_I2C_CHECK);
> > +     if (ret < 0) {
> > +             dev_info(&fm34->client->dev, "initial write failed\n");
>
> dev_warn()?
>
> > +             msleep(50);
> > +
> > +             fm34ne_dsp_reset(fm34);
> > +             gpiod_set_value_cansleep(fm34->bypass_gpio, 0);
> > +
> > +             return ret;
> > +     }
> > +
> > +     ret =3D fm34ne_dsp_write_config(fm34->client, input_parameter,
> > +                                   input_parameter_length);
> > +     if (ret < 0)
> > +             return -EINVAL;
>
> Why not propagate the error code from fm34ne_dsp_write_config()?
>
> > +
> > +     msleep(100);
> > +     gpiod_set_value_cansleep(fm34->bypass_gpio, 0);
> > +
> > +     dev_info(&fm34->client->dev, "%s detected\n", fm34->data->model);
> > +
> > +     /* Constantly set DSP to bypass mode for now */
> > +     ret =3D fm34ne_dsp_set_config(fm34, FM34NE_BYPASS);
> > +     if (ret)
> > +             return ret;
> > +
> > +     return 0;
> > +}
>
> regards,
> dan carpenter

All other notes are reasonable. Thanks

Best regards,
Svyatoslav R.
