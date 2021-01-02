Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CAF82E8722
	for <lists+alsa-devel@lfdr.de>; Sat,  2 Jan 2021 12:52:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E45DC16AB;
	Sat,  2 Jan 2021 12:52:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E45DC16AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609588371;
	bh=Iiiu19L0fHA+EvtMGrWkYcrOuMhiefOMGztERZ+9WJg=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jH9Vii5wu36ImpZOAm+zPckjQ8Zf3K+/j+bGlpSTzMAywVOljX95f1dvezL70YoVM
	 E/2Vdu6N81S3BBWTy9Fz5t3sY0NTzuGIRzto+aLgiD3Kv9rUHJq2r/2VwhOLEMEC+y
	 8Y+fKLvZeYHoUWH7bSiFOm9GC4782eCKEuLlXv8k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 379DAF8020C;
	Sat,  2 Jan 2021 12:51:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CB100F8022B; Sat,  2 Jan 2021 12:51:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5C699F8012B
 for <alsa-devel@alsa-project.org>; Sat,  2 Jan 2021 12:50:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C699F8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="LqjRMuH5"
Received: by mail-ed1-x532.google.com with SMTP id i24so22026251edj.8
 for <alsa-devel@alsa-project.org>; Sat, 02 Jan 2021 03:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=vdAzL+5/FOQmKmcx+/nnZ0S6HJ2IIGVMR1lIcA5hWDE=;
 b=LqjRMuH5rtemsSpxamDZoi2DA45UKRbnxUPk703bryzL8lp7M8pZjpNkeCmvBK2APc
 ju2ja3Kiye+oL4jcM4/fNYrgsJR3d10BBNHKSLkPgD1CuwCrdCwlEbfeZeOOuLuioeHj
 rRKLrL1/9tJNNIO0pg8kElRTjeIWbO52H3zw9pG/RITqqZOf0gSk5vWjcRxWtDhZ55E+
 9hTHJ6AWsDRyDTB8yDWC0OTaqCNmp44XBsQdElR4BqDxTwsDWdKNvBUf+1qjjEE4uIjI
 5RCpfgK3KIk43SCpI97PhKnRIgVnxIbCN25M2jgHoyp8fbbPXC/EyglNm99wvcJitWWD
 nbuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=vdAzL+5/FOQmKmcx+/nnZ0S6HJ2IIGVMR1lIcA5hWDE=;
 b=SEHeafhdSnkFgYBfpCHHsX9QSxLHqpkJJVWvr5oDqrK4VQAwaFXLNflld6JRLeL+bX
 2xdgxMGJ+3/QQf/O8k8chXXFmLJj2tTO4DJ92A0UAt3JYjsddWh+IoWJTlby1vq2c8//
 OLxA0os2+2xrTgdn4DMXiOv6h9aAXFHNMrHavTODZXx7htzExSKvkvV0fx+R9fvYiaJd
 nhK2abEbAS1j3hZJNV81JpJWnsblEoCjFT4aIEr75BAKpsy7KePMXUfDd4AQ2Z83Ukno
 XFRq9G2xOzqY/yeP117BeEGqCGsreNL/rV5u9kavplv/QhxdqrxQi3rwQE8moJrG6Zay
 3cYw==
X-Gm-Message-State: AOAM533l+sTE6OwS6D2jlcvnREQQlG5sMyY6b+44puwfoGkZNbgWkJnr
 amMcG9rVXAuMgvlJUZpNm2D9xJB66E0GgA==
X-Google-Smtp-Source: ABdhPJw5yc6bx+T2OsmQtGVcqgST9oOvVSdt6xlVApTy4ZalnungZbhHdZsvYv9lQ2zzTwGO6wAhNQ==
X-Received: by 2002:a05:6402:1352:: with SMTP id
 y18mr63256913edw.178.1609588246265; 
 Sat, 02 Jan 2021 03:50:46 -0800 (PST)
Received: from cl-fw-1.fritz.box
 (p200300d8674ca2003e51f75af23f3dcf.dip0.t-ipconnect.de.
 [2003:d8:674c:a200:3e51:f75a:f23f:3dcf])
 by smtp.gmail.com with ESMTPSA id n22sm41145957edr.11.2021.01.02.03.50.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Jan 2021 03:50:45 -0800 (PST)
Message-ID: <83651c8002ae10e358693adfde65e85b3c95953d.camel@gmail.com>
Subject: Re: Haswell audio no longer working with new Catpt driver
From: Christian Labisch <clnetbox@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Date: Sat, 02 Jan 2021 12:50:44 +0100
In-Reply-To: <s5hwnwwa7ut.wl-tiwai@suse.de>
References: <8b005c64fe129fc2a283da90b2949b1fcb42e8c2.camel@gmail.com>
 <1ad341b1b0e0eefb83d157ac24d162eaad53ab32.camel@gmail.com>
 <0111f282-f044-47ed-f93e-5a19de61bdce@metafoo.de>
 <088cd3b6ba6589266e316d6adcb76861edd18775.camel@gmail.com>
 <s5h1rf4c10a.wl-tiwai@suse.de>
 <1f5c37af35419358a8d7f22544490088675b2c3f.camel@gmail.com>
 <3dcc3129-aee5-0eea-0307-4eba7f03c0d6@metafoo.de>
 <d206434bed33930cb54b643f3d1968cf21973167.camel@gmail.com>
 <s5hwnwwa7ut.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2 (3.38.2-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: gregkh@linuxfoundation.org,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Takashi Iwai <tiwai@suse.com>,
 amadeuszx.slawinski@linux.intel.com
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

On Fri, 2021-01-01 at 18:24 +0100, Takashi Iwai wrote:
> On Fri, 01 Jan 2021 14:40:39 +0100,
> Christian Labisch wrote:
> > 
> > $ cat /sys/module/snd_hda_intel/parameters/power_save
> > 0
> 
> Hm, then the best would be to run git bisect for spotting out the
> breaking commit.  There has been no change in VIA codec driver at all
> between v5.9 and v5.10, so the rest possibility is either in HD-audio
> codec helper code or controller code (or both) -- if it's about the
> changes in the sound driver.
> 
> Or you can try the oneliner below as a test shot; it might keep the
> widget node power D0, which is currently the only possible appearance
> of the difference between working and non-working cases.
> 
> BTW, please avoid top-posting.  It's confusing.
> 
> 
> thanks,
> 
> Takashi
> 
> -- 8< --
> --- a/sound/pci/hda/patch_via.c
> +++ b/sound/pci/hda/patch_via.c
> @@ -115,7 +115,7 @@ static struct via_spec *via_new_spec(struct hda_codec *codec)
>         spec->gen.keep_eapd_on = 1;
>         spec->gen.pcm_playback_hook = via_playback_pcm_hook;
>         spec->gen.add_stereo_mix_input = HDA_HINT_STEREO_MIX_AUTO;
> -       codec->power_save_node = 1;
> +       // codec->power_save_node = 1;
>         spec->gen.power_down_unused = 1;
>         codec->patch_ops = via_patch_ops;
>         return spec;

Hi Takashi,

Thank you ! I think we have tried what we could to work around this issue.
There is obviously something wrong with the kernel which has to get fixed.

Hi Greg and Lars,

From my understanding there are fundamental changes regarding the audio drivers.
The sound should (and has to) work out-of-the-box without any user interactions.

https://www.phoronix.com/scan.php?page=news_item&px=Linux-5.10-Sound-Improvements

As you can see in the post below, other users are facing exactly the same issue.
It would be great if this could be solved as soon as possible, maybe in 5.10.5 ?

https://forum.manjaro.org/t/issue-after-kernel-5-10-update-speakers-not-working-on-laptop/45496

Regards,
Christian

