Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ADF9183B31
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Mar 2020 22:18:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D46FB1779;
	Thu, 12 Mar 2020 22:17:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D46FB1779
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584047890;
	bh=BK5K6+PBdQ5qA5huNeucgIV7GFgmQZzea6yEfwasbuw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n0HlIxOMcjV9bnsAmYLE9YVfNj581pIK2YsiC0Tj9Kgdw+uGvzwQ+eCZQHbnlY3hI
	 axm1NH/vWFQL92h3h7nD0avyARE5PE8ifKghMQtBpSCWviKQXiCB76yepVSP1XU/kK
	 ZRxiLQmMja+QxGvbJdny5ltAqV+EhcknOGd359jE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DAA6FF80086;
	Thu, 12 Mar 2020 22:16:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A8D98F8020C; Thu, 12 Mar 2020 22:16:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D7879F80086
 for <alsa-devel@alsa-project.org>; Thu, 12 Mar 2020 22:16:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7879F80086
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="f0enO67a"
Received: by mail-wr1-x443.google.com with SMTP id f3so2406309wrw.7
 for <alsa-devel@alsa-project.org>; Thu, 12 Mar 2020 14:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OoRMJHL0lSK4lVACsrhjsoeS3m+0TZ7d70msLMcwZXM=;
 b=f0enO67akTjopRTWqxr9OXsYNFl1y1vda7MC0cyMvXeSTXMulMQzzWpxOQmZjXWkw/
 SvQ/PejNSH6KWtM48vIFSosY4KrvgVui3/hs1MtMZK/HlyubRuWEjmiZJzQ9X5Veo63V
 zk9SANcBaya12IWkiMc0LXsLdHDe7O4M5/AeuKBfxJSZVQapD6ICkpOOyJTTloE5yeb2
 7EY/J+nz6/VvDma5jFofVyrjRXvvMB5E65OmQAz6O4Ff/t3skTaLu8WDDUFn7q/1hE4V
 8EabQ+PC6HPcBCbEmZTwnH9kN1XdgejpEkOhFgZ7Qi9IoE1vxx1W44F5M0HvoHH6xxe4
 yBPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OoRMJHL0lSK4lVACsrhjsoeS3m+0TZ7d70msLMcwZXM=;
 b=NBYB8KWlofdqh6XPmjGWh8qN0/SSVjZm9mAB5HAwwQw8NAPCkF9OYeuv9ddriIdLH4
 D71bkcNckjHbX3oPqmVrYNdkpibmr4bf9v491h4EOI1Er+QwXCRQqBm1mL1Oza28H9za
 24tPfXnYdfbEK1WXNfom/2KR/tpYbEe79ks5Yl4ZWlWsfpLxstAloYTu1sDf7wtKNEBB
 L2MU8OJSDTwFr3UaLsrD0nvL0HdvId678bUZhKpThq4WakNvhvMX2KWF/VCoOWk8JmDo
 sHWcjKwjqLCb8eMCA6GNDVcntFJXZUwQqnxWC+/HePglZNuBD8ySiACYxg3c7VmDQfCF
 /Iew==
X-Gm-Message-State: ANhLgQ1MzepZ4yKK2wHZkxEKSiAvgO3Nc0J4RJ0V0/u1j6+lQhdTa5Ua
 Rz61iZGpd9A/lTI74ydqqsImSc0qHAZ3DueHmBs=
X-Google-Smtp-Source: ADFU+vsEHGHrexnu9ajEOuztTkNdb4fV9udOvVmtFGq+NVjQuWlQ8XfZ3prQYZRqoV0QXCYAc0BynI/yrz09GLW65GA=
X-Received: by 2002:a5d:61c9:: with SMTP id q9mr13587880wrv.164.1584047781214; 
 Thu, 12 Mar 2020 14:16:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200210095817.13226-1-daniel.baluta@oss.nxp.com>
 <20200210095817.13226-5-daniel.baluta@oss.nxp.com>
 <20200219221422.GA32379@bogus>
In-Reply-To: <20200219221422.GA32379@bogus>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 12 Mar 2020 23:16:09 +0200
Message-ID: <CAEnQRZA6PEhfO0y5xWvAJZcK784n_2FXgDgYAfdDFUa2Osj7XQ@mail.gmail.com>
Subject: Re: [RESEND 4/4] dt-bindings: dsp: fsl: Add fsl,imx8qm-dsp entry
To: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: Devicetree List <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Daniel Baluta <daniel.baluta@oss.nxp.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Paul Olaru <paul.olaru@nxp.com>, Mark Brown <broonie@kernel.org>,
 dl-linux-imx <linux-imx@nxp.com>, Fabio Estevam <festevam@gmail.com>
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

On Thu, Feb 20, 2020 at 12:15 AM Rob Herring <robh@kernel.org> wrote:
>
> On Mon, 10 Feb 2020 11:58:17 +0200, Daniel Baluta wrote:
> > From: Paul Olaru <paul.olaru@nxp.com>
> >
> > This is the same DSP from the hardware point of view, but it gets a
> > different compatible string due to usage in a separate platform.
> >
> > Signed-off-by: Paul Olaru <paul.olaru@nxp.com>
> > Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> > Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> > ---
> >  Documentation/devicetree/bindings/dsp/fsl,dsp.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> >
>
> Acked-by: Rob Herring <robh@kernel.org>

Hi Rob,

Who should take this patch? Mark applied first 3 patches in the series.
