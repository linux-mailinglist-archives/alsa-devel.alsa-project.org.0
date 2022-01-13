Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FED848E034
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jan 2022 23:20:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 392342016;
	Thu, 13 Jan 2022 23:19:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 392342016
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642112425;
	bh=jFLVkynZMSc+AWidGOoYE/BgWspOLqp/qA233CvU/4o=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Yd3U/xmVgDaeAF3F8/XICLYJ3Hl1mTJYQ99gL1qL98xRf7BWahtNT1xGie0K72r5y
	 qP9/d3PCRztin/7WI5jxKKKyZiLOMUtUMLINUwSVUCUjM7byN/9pr+XK0YWREDrv5A
	 XEnqJNtv3RwFEPETxkBN6f2tHvBBSkLZjctk4DRc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9CDE1F80141;
	Thu, 13 Jan 2022 23:19:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8EFEDF8013F; Thu, 13 Jan 2022 23:19:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 35B27F80088
 for <alsa-devel@alsa-project.org>; Thu, 13 Jan 2022 23:19:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35B27F80088
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=igorinstitute-com.20210112.gappssmtp.com
 header.i=@igorinstitute-com.20210112.gappssmtp.com header.b="Nuhs5dd0"
Received: by mail-pj1-x1031.google.com with SMTP id hv15so11772311pjb.5
 for <alsa-devel@alsa-project.org>; Thu, 13 Jan 2022 14:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igorinstitute-com.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=VNoaIqYSS5igvnCs4kwaW4XfycxM13KnkSzCOBOjnmE=;
 b=Nuhs5dd0c7HhXpYf6DA5mML5D2RQBfiweW8QrI7E8hh8C6YP//PjwMZYygAErMdz39
 qW23KauwPGQ42r6TOe5hNfTw2XJs6OSdFjm3/dr/Xgy+CVxnIctH2oL62AeQjKdQU4Vi
 vI/XaChlGNla8cPWzyWpMw5u6CaXOFrrGWs00d5Ly0hx8+KkDLlZpUvaf/3gpdv8B0yh
 e013bXI7SOoaHBi+CoiRhn+Fk7KDwd/eb5QzjpOBMwhfjSq9sG8q2vCnun/1SROmqCLV
 D2qn121pqUn0WEMFDRJhNuH0dy7IMeBHbq2I0Sxms0EY4zwipLHDbCb0OicgORPaGaGm
 tssw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=VNoaIqYSS5igvnCs4kwaW4XfycxM13KnkSzCOBOjnmE=;
 b=Xv70Z87eYe0c0VBi3gj+SAtlQB0RJYpY2qKPmw7Z95uBf0zrwuOsy1bZ8SLEMkBt3h
 Yasdr/JczINNbiXXHA/KhOPiC4mYLjjINF3EZhBlJHwOifTQpg1o/3N9XNBvE1dvx5Rz
 qhO0x8ckvCX2XC85u4JINnHq8Xj4zIzzFZ/yRQMSef+XJ8Fu59zp/usYlAzS2VXnnpRz
 jAaak/HrC9f35NMqRUwsJL5iwcWYqhtWCYj+4MujlhKNtX7C266SLb+yaPH8qmj3qawQ
 9J4Th9QndGss+i+q8lTqAy20qtiaV3EAfAb6uh5QkqP5cgwu7kgGydsOr//VLcVOl6Iv
 vxAQ==
X-Gm-Message-State: AOAM533tGRq1vzNmDzpljGQOY1uwbrMo+yhmGgwz+Kpe7rpiASzQuFGI
 OBt3wuYyHFLl8Am3k+WfOw3QKQ==
X-Google-Smtp-Source: ABdhPJzkdSrI9bPQqYfFlXq81svJ5+IiAGMGDR301K93K/UkeXCphJAYmh7WEKztCPJm7OSl114X2A==
X-Received: by 2002:a17:902:e34b:b0:14a:4b9e:a0f2 with SMTP id
 p11-20020a170902e34b00b0014a4b9ea0f2mr6487070plc.91.1642112342117; 
 Thu, 13 Jan 2022 14:19:02 -0800 (PST)
Received: from localhost ([121.99.145.49])
 by smtp.gmail.com with ESMTPSA id 65sm3533239pfw.70.2022.01.13.14.19.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jan 2022 14:19:01 -0800 (PST)
Date: Fri, 14 Jan 2022 11:18:58 +1300
From: Daniel Beer <daniel.beer@igorinstitute.com>
To: Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH v2 1/2] ASoC: add support for TAS5805M digital amplifier
Message-ID: <20220113221858.GA18380@nyquist.nev>
References: <cover.1642063121.git.daniel.beer@igorinstitute.com>
 <a2e4461ee2d2a052984f447f9891f8b4ecc9307c.1642063121.git.daniel.beer@igorinstitute.com>
 <703cec53-5de7-e8c1-5a1f-e44f0cbc141f@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <703cec53-5de7-e8c1-5a1f-e44f0cbc141f@linux.intel.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Andy Liu <andy-liu@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Derek Simkowiak <derek.simkowiak@igorinstitute.com>
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

On Thu, Jan 13, 2022 at 10:18:27AM +0100, Amadeusz Sławiński wrote:
> > +static int tas5805m_vol_put(struct snd_kcontrol *kcontrol,
> > +			    struct snd_ctl_elem_value *ucontrol)
> > +{
> > +	struct snd_soc_component *component =
> > +		snd_soc_kcontrol_component(kcontrol);
> > +	struct tas5805m_priv *tas5805m =
> > +		snd_soc_component_get_drvdata(component);
> > +
> > +	if (!(volume_is_valid(ucontrol->value.integer.value[0]) &&
> > +	      volume_is_valid(ucontrol->value.integer.value[1])))
> > +		return -EINVAL;
> > +
> > +	mutex_lock(&tas5805m->lock);
> > +	tas5805m->vol[0] = ucontrol->value.integer.value[0];
> > +	tas5805m->vol[1] = ucontrol->value.integer.value[1];
> > +	dev_dbg(component->dev, "set vol=%d/%d (is_powered=%d)\n",
> > +		tas5805m->vol[0], tas5805m->vol[1], tas5805m->is_powered);
> > +	if (tas5805m->is_powered)
> > +		tas5805m_refresh_unlocked(component);
> > +	mutex_unlock(&tas5805m->lock);
> > +
> > +	return 0;
> > +}
> > +
> 
> put method should return '1' if value changed, so ALSA knows to inform
> userspace utilities about change. You can check if userspace is notified of
> changes with "alsactl monitor", you should see something like:
> node hw:2, #3 (2,0,0,ADC0 Capture Volume,0) VALUE
> when value changes.

Thanks, will fix this.

-- 
Daniel Beer
Firmware Engineer at Igor Institute
daniel.beer@igorinstitute.com or +64-27-420-8101
Offices in Seattle, San Francisco, and Vancouver BC or (206) 494-3312
