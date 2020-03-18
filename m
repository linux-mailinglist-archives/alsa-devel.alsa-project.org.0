Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B8A18BB72
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Mar 2020 16:45:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E66371763;
	Thu, 19 Mar 2020 16:45:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E66371763
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584632758;
	bh=17Qc8cjpW+4+xpYO2mZgS+GW1k31jtTvF2tDZnGsJmI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ATZ5uBe+1uH8XRJnue5eAqbvfsc7cKMsmZN+wTlZtGoi4AbiMWpt3TephtGG+kzFq
	 0+xjXSnhEd2cggZhOgEELl89tnoEkuSP3aPcExn3QTGy3Oa+tOBw3GyUehZMsmvD0i
	 MRMtNNTxVCx0slco/nkoH4REoJ90M69aZ/rIDtqA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 136C2F8028D;
	Thu, 19 Mar 2020 16:43:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5AAD0F80139; Wed, 18 Mar 2020 18:19:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6DDDBF800C0
 for <alsa-devel@alsa-project.org>; Wed, 18 Mar 2020 18:19:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6DDDBF800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=malainey-com.20150623.gappssmtp.com
 header.i=@malainey-com.20150623.gappssmtp.com header.b="ivrfws0o"
Received: by mail-qk1-x741.google.com with SMTP id t17so18310246qkm.6
 for <alsa-devel@alsa-project.org>; Wed, 18 Mar 2020 10:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=malainey-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hOBXSsggzxa7uGxk5aOZZMSXBOBu8auhlb9/HFBPo0I=;
 b=ivrfws0on93D31hyFQWoTG79MampNoMXlQ97o9qCeXTTc8vJJwLNOGjxwhunEAyjQO
 UD55/ioKExPkXrtDmxxAhxmo6gOSLf99nV5+OUsaSHyb9SCwtD0UZ95YbGPecFSspZAO
 doypzAYc3qfmIZg2ZpoFfsztS+CP+b3DCd1wM2IoxVbEIjTw/4rEoOpbkahjnLleeadB
 1udbF3xSTQAq307F41KLf9iXUppZ2jm90quMtIfdZYYh4sXbgfEdZN3SCOQ8s57t/QuR
 vTvmTOKVgmA2EodsNZsPAdcukyP7FklNqyFGqTaSHrYcN9I8ufOrMo9S7/kPxW43D1E2
 2vVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hOBXSsggzxa7uGxk5aOZZMSXBOBu8auhlb9/HFBPo0I=;
 b=o18TlO3CXriwWvWkfo80Ymz0OPIKm4bawT0f+yH7jP0MKvSBdcwAwye/0Do9JmZQxG
 Hb/U2eUf3XkxtCGqUDlklDVCzfau4kom8n/mr6CoC+mLOyEdCFf8XBeaY07ECmr6O+y5
 AggIehAk1JKXKX+wct5mWEOrtnyiKq5KRKEx4wBhblopJ8G+iTiTuJb4ANtUgYjmwh/P
 +3P2HHfaD8Z9EGW6oTGQYmXyGfpC74LVGRG8476ASjdL94KDc/cEKraGmJNXPo40IPw+
 KY8OpLpgNojv8dEqL4anPlbUjFp0C+RTck622DHSjakLdNNVcRYCZ8gosTTbsab1PE3q
 bMlQ==
X-Gm-Message-State: ANhLgQ0mhbcbMKMT3Qjw/z4qBcKZVNZU6sEkwJatfsh2mS4bg/RgwF6U
 ZIFj5sknFhy9ZlviSisJms1jbTX4geYxVgGwVMjp4g==
X-Google-Smtp-Source: ADFU+vu0UPDF+5MHNfZmz6/snZuzysEdbVWo74zRv2tqXUJJQSmUzYfFcPNnEgOi3rMlLLEbF6YBsU61W0d4RGG5mqE=
X-Received: by 2002:a37:9c07:: with SMTP id f7mr5296208qke.349.1584551945940; 
 Wed, 18 Mar 2020 10:19:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200318063022.GA116342@light.dominikbrodowski.net>
 <41d0b2b5-6014-6fab-b6a2-7a7dbc4fe020@linux.intel.com>
 <20200318123930.GA2433@light.dominikbrodowski.net>
 <d7a357c5-54af-3e69-771c-d7ea83c6fbb7@linux.intel.com>
 <20200318162029.GA3999@light.dominikbrodowski.net>
 <d974b46b-2899-03c2-0e98-88237f23f1e2@linux.intel.com>
In-Reply-To: <d974b46b-2899-03c2-0e98-88237f23f1e2@linux.intel.com>
From: Curtis Malainey <curtis@malainey.com>
Date: Wed, 18 Mar 2020 10:18:55 -0700
Message-ID: <CABkGCGe_gjzRehwP-VScjM8WYoQDJM4VDRjyBT0Mgbb7FNV9-g@mail.gmail.com>
Subject: Re: snd_hda_intel/sst-acpi sound breakage on suspend/resume since
 5.6-rc1
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, 
 Curtis Malainey <cujomalainey@google.com>
X-Mailman-Approved-At: Thu, 19 Mar 2020 16:43:13 +0100
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: cezary.rojewski@intel.com, alsa-devel@alsa-project.org,
 Keyon Jie <yang.jie@linux.intel.com>, linux-kernel@vger.kernel.org,
 Dominik Brodowski <linux@dominikbrodowski.net>, tiwai@suse.com,
 liam.r.girdwood@linux.intel.com, broonie@kernel.org
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

+Curtis Malainey <cujomalainey@google.com> -curtis@malainey.com
Moving chain to my corp email.

On Wed, Mar 18, 2020 at 10:09 AM Pierre-Louis Bossart <
pierre-louis.bossart@linux.intel.com> wrote:

>
>
> On 3/18/20 11:20 AM, Dominik Brodowski wrote:
> > On Wed, Mar 18, 2020 at 10:13:54AM -0500, Pierre-Louis Bossart wrote:
> >>
> >>
> >>>>> While 5.5.x works fine, mainline as of ac309e7744be (v5.6-rc6+)
> causes me
> >>>>> some sound-related trouble: after boot, the sound works fine -- but
> once I
> >>>>> suspend and resume my broadwell-based XPS13, I need to switch to
> headphone
> >>>>> and back to speaker to hear something. But what I hear isn't music
> but
> >>>>> garbled output.
> >>
> >> It's my understanding that the use of the haswell driver is opt-in for
> Dell
> >> XPS13 9343. When we run the SOF driver on this device, we have to
> explicitly
> >> bypass an ACPI quirk that forces HDAudio to be used:
> >>
> >>
> https://github.com/thesofproject/linux/commit/944b6a2d620a556424ed4195c8428485fcb6c2bd
> >>
> >> Have you tried to run in plain vanilla HDAudio mode?
> >
> > I had (see 18d78b64fddc), but not any more in years (and I'd like to keep
> > using I2S, which has worked flawlessly in these years).
>
> ok. I don't think Intel folks have this device available, or it's used
> for other things, but if you want to bisect on you may want to use [1]
> to solve DRM issues. I used it to make Broadwell/Samus work again with SOF.
>
> [1]
>
> https://gitlab.freedesktop.org/drm/intel/uploads/ef10c6c27fdc53d114f827bb72b078aa/0001-drm-i915-psr-Force-PSR-probe-only-after-full-initial.patch.txt
>
> An alternate path would be to switch to SOF. It's still viewed as a
> developer option but Broadwell/Samus work reliably for me and we have a
> Broadwell-rt286 platform used for CI.
>
