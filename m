Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 049C0325D5C
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Feb 2021 07:00:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9193B1655;
	Fri, 26 Feb 2021 06:59:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9193B1655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614319206;
	bh=/KJvsjcdqImUqMe4Fz7rYiMjw5AxV2uuutYx7Ovmp88=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iRKs4bTUh81GArFPiPOkpx7ZwrZOKJbgdJV87rekZs+AyKvIA5uwAcH5DEXSYHAJK
	 poCcWftKs7Go8O/UBltNbzC2BMhvNzyP9mi39UxSTASObrZ794C3d63/HTFRmACaFS
	 /Z2z6nf8FpZTYYW32oZC/DwLqW9cW0W6PRHKPNsw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C9230F80154;
	Fri, 26 Feb 2021 06:58:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DBF86F8016C; Fri, 26 Feb 2021 06:58:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 57BC6F80159
 for <alsa-devel@alsa-project.org>; Fri, 26 Feb 2021 06:58:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57BC6F80159
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="XHhiZlIe"
Received: by mail-qt1-x82e.google.com with SMTP id v3so5993521qtw.4
 for <alsa-devel@alsa-project.org>; Thu, 25 Feb 2021 21:58:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kzC7LtlZ0fXzYRkwYY+9DmH23Mg0RAoodBbNopUOmUw=;
 b=XHhiZlIeVGaiP4Yg/2IfUHI+b/quFjbaVT1OHH8zRpZMsMkkOij6uTY+M2balK4mh4
 uHv2OqEXLMnmVFeKfwfYYAbr8syIifaszA9C4DhUMZ3TSQby5CAcFheB/EKPPMTWFMFi
 vEf3QFQvGsXN1Kl9y2f2vSvqZ0OEtiIDEDXZUM7TEdDA8XbjMGaddCDSzfEkX04URV40
 HalelKeRSTscvl589h6X0fcpDlTXugsaO1Q534Rc1KyNluHbnyb3wpT7kOMdQWF92jes
 H+gLNI4etmQohozv1wltiR9w0D091VoDhiDSZoGASzzIFRXJbxvEC1zJzLbzI5fN/SS4
 VcVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kzC7LtlZ0fXzYRkwYY+9DmH23Mg0RAoodBbNopUOmUw=;
 b=opbj06BjDecseZw+n2nWv5WPfaWZH0l1YJysIIH5NrZoOLUxr8eFpPCcwB02CPlH+2
 n0g5Zy/mVNd1XQ4C3flljaovgrteFS1BpK4KUFVojE4gABhohJd8fqt3GCqFZrMAQSxz
 0HB/cszx1nynUaFIdTo12Y6t3stqE0LqO+9E76wB0mieEPO3CvYEINfQWq5DU4IsGCE9
 IZiZbCTHM8OcvHIj/6+ON1Q8YrDAS7xBYFBjASBEVRLpFAXT22Ex3ijrRgoPRnV0bUcU
 Zko1a470JNpYdAO8WfwYvvuF0u3ACPbr86wscvFmm0hHEpxVChXCqBwXuCyYHqW0Cdd3
 WBIQ==
X-Gm-Message-State: AOAM5314ajYDmpiB34o7Jco4x1m9pNC/0d7vUfAG6c7mvhEOXa1SItCD
 4JhzEV0VIWDnPy8l4hZq+jkf0qLV+i4j5xsrH2c=
X-Google-Smtp-Source: ABdhPJyizV+d1SUe1CimsqygWfbzOJbJDH7iRKCcjlNlV00dtDy4yLr1Gop1IHnePwHjf0/0iBVJc+oKacsZYjABwlg=
X-Received: by 2002:ac8:7241:: with SMTP id l1mr1419287qtp.121.1614319103134; 
 Thu, 25 Feb 2021 21:58:23 -0800 (PST)
MIME-Version: 1.0
References: <5598a2fc-9b49-ad5e-2265-fbc0593ead1b@flatmax.org>
 <0d9a9459-9cd7-d384-b1ff-72860895ad13@linux.intel.com>
 <73148789-58f7-2228-ae42-465cdafcff4c@flatmax.org>
 <52e1a640-b46f-b494-2047-849c1999eb28@flatmax.org>
 <7607dd99-0d54-2bab-7407-836a42647f4c@metafoo.de>
 <CAA+D8ANpWEggM4128p7=wzFNLdn6YF4JWQpm0fMbk_WWZGKBTA@mail.gmail.com>
 <20210223135743.GG5116@sirena.org.uk>
In-Reply-To: <20210223135743.GG5116@sirena.org.uk>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 26 Feb 2021 13:58:12 +0800
Message-ID: <CAA+D8AN--agWZpcmsCrAD2OtMAEZxsr+41S1m8UNxynjdV0f+w@mail.gmail.com>
Subject: Re: ASoc: soc_core.c stream direction from snd_soc_dai
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, Lars-Peter Clausen <lars@metafoo.de>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Matt Flax <flatmax@flatmax.org>
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

On Tue, Feb 23, 2021 at 9:58 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Sat, Feb 20, 2021 at 05:29:03PM +0800, Shengjiu Wang wrote:
>
> > One of the suggestions is to use two DAIs.  but sometimes the
> > CPU/CODEC may have the same format for playback and capture,
> > then one DAI is enough.  it means that we need to define 3 DAIs
> > for the CPU/CODEC,  one supports playback and capture, another
> > two support capture and playback separately, is it some kind of
> > duplicate?
>
> > So I'd like to extend the set_fmt() interface, but this impacts all
> > the drivers.
>
> I'm not sure having two DAIs is an issue if you have them running the
> smae format - does it cause any practical problems or is it just that it
> doesn't seem elegant to you?  There were quite a few devices that pretty
> much just had two unidirectional DAIs, in those cases it seems like a
> sensible representation for the hardware.  If you can set unrelated
> formats on transmit and receive then it's not clear that it's actually
> the same DAI in anything except logical labelling.

When an i2s device, Sometimes it is connected as async mode, there is
different clock for tx and rx then there should be two DAIs,  Sometimes
it is connected as sync mode, then there should be one DAI.

So we need to register different DAIs according to the async or sync mode
when the driver probes. right?

best regards
wang shengjiu
