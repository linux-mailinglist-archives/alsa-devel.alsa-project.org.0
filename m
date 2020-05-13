Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A08A1D13EE
	for <lists+alsa-devel@lfdr.de>; Wed, 13 May 2020 15:04:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 323B91669;
	Wed, 13 May 2020 15:03:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 323B91669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589375049;
	bh=MWmY/e2fOoXqvWwx9w10Rh8JRJw+St/10d49zAOAUVA=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZzyX5RUP9e+ohlv/1xIfvNCZQ9Oi+J2JLh9gsk0yLX32FdAfF32QU+q4t+dFSYXD9
	 NzMw/CFS2CokMOXbpRh69xrx4h0IutZqYhfXy1ytwUgWcVKLYLYNwE5Xz2S106C38h
	 jY2+Ao19WuaV2oBkh1CPqDL2V8SlnaL+17FWcUpI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 48CB6F800BD;
	Wed, 13 May 2020 15:02:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7FC3EF80247; Wed, 13 May 2020 15:02:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 09573F800BD
 for <alsa-devel@alsa-project.org>; Wed, 13 May 2020 15:02:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09573F800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=axis.com header.i=@axis.com
 header.b="i8PWkLj+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; l=1662; q=dns/txt; s=axis-central1;
 t=1589374934; x=1620910934;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version:content-transfer-encoding;
 bh=HmiGANTaWeCxvVIMvxry7eZiiySoeq97ejFPwewSvOQ=;
 b=i8PWkLj+eRFqiD6LlcQrU8QafKHJSYdZEaChCUQEgAKwDuejyGFXQ2C5
 dsRxoKlOFOsRNAgvOiwmWbMH1C2LpX5I8sb5VK86zbGSWyektukElC3RQ
 Bj9LTKnYGBrQGpJA3v2wuHSBodfG3KcsbuG5LCSK9pgQ6Cmm6nf6KH/t8
 pXLHfhz5MAiLzDBSnoeBgmCnr+Iyd6q5fnbD9eCxa0cYrAiDOnCH6+JN+
 uyXcrMFTTpIZqL2ok8Mff+Ng4VCgTUOn9hHQ1GGOU/TfBGbi51903AzKb
 hyBYODQBDTVlhPU+iZDtN+p5/iqi1yP2AA+GxiQbaocqKG5FeJ/bhiXqS Q==;
IronPort-SDR: H28L571fwiwBqZmIUHb+UKInMxA0uXG+HaVBs+hqX/lnsjq8kqQfRwMsZeS1yHspWEBbF7B2sF
 7LjZLd5yi4chd4OUi9ceabe6oTqb+DnRfW7Dt2ZX3w/p5Fh8pLfiEURcoCn9VOtJSfUW6rnPs0
 tqtdFduthvkMMD24ZurRw5rrv1zClv3k1Gv74pG9yQzL5d30cMsSnwn76x+o81ZGnj0eaYCfXf
 RO3pR8NzT6g1hzUpFumT87ibfULw5jE+NWThdQjSogXUy1MuQ4P+NEGxQRsKuvuBxbCuuUdCTO
 R8I=
X-IronPort-AV: E=Sophos;i="5.73,387,1583190000"; 
   d="scan'208";a="8445975"
Date: Wed, 13 May 2020 15:02:06 +0200
From: Ricard Wanderlof <ricardw@axis.com>
X-X-Sender: ricardw@lnxricardw1.se.axis.com
To: Greg KH <greg@kroah.com>
Subject: Re: sound over USB
In-Reply-To: <20200512165359.GA702234@kroah.com>
Message-ID: <alpine.DEB.2.20.2005131459520.17840@lnxricardw1.se.axis.com>
References: <CAPY=qRRFV4SpNO5pb9vF=U95dbA_gN2ngP+vm34884NMk5q8gQ@mail.gmail.com>
 <20200512165359.GA702234@kroah.com>
User-Agent: Alpine 2.20 (DEB 67 2015-01-07)
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: 8BIT
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: XBOX01.axis.com (10.0.5.15) To XBOX03.axis.com (10.0.5.17)
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 Subhashini Rao Beerisetty <subhashbeerisetty@gmail.com>,
 kernelnewbies <kernelnewbies@kernelnewbies.org>
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


On Tue, 12 May 2020, Greg KH wrote:

> On Tue, May 12, 2020 at 10:13:10PM +0530, Subhashini Rao Beerisetty wrote:
> > ...
> >  [116677.281756] usbcore: registered new interface driver snd-usb-audio
> >
> >  The following nodes are present in the /dev/snd
> >
> > $ ls -l /dev/snd/
> >
> > total 0
> >
> > drwxr-xr-x 2 root root       60 May 12 11:32 by-id
> >
> > drwxr-xr-x 2 root root       60 May 12 11:32 by-path
> >
> > crw-rw---- 1 root audio 116,  2 May 12 11:32 controlC1
> >
> > crw-rw---- 1 root audio 116,  4 May 12 11:32 pcmC1D0c
> >
> > crw-rw---- 1 root audio 116,  3 May 12 11:32 pcmC1D0p
> >
> > crw-rw---- 1 root audio 116,  1 May 12 11:32 seq
> >
> > crw-rw---- 1 root audio 116, 33 May 12 11:32 timer
> >
> >
> >
> > What are all these devices present in /dev/snd
> >
> > How do I use it for playing and recording an audio?
> >
> > Basically first I want to gain knowledge on set of test cases I can
> > run on ALSA and then learn ALSA kernel modules stuff including
> > snd_usb_audio mdule.
> >
> > So please guide me by providing related documentation/Steps.
> 
> ALSA should "just work" with this device, no need to do anything to the
> kernel driver.  Does it not work properly for you as-is?

To clarify (if it's not too obvious): Normally these devices are never 
accessed directly by programs, instead, there is a userspace library 
called alsa-lib which provides a userspace API and then handles the 
communication with the kernel devices.

/Ricard
-- 
Ricard Wolf Wanderlof                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
