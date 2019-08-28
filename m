Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD1DA1EA7
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Aug 2019 17:15:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 54E7216EF;
	Thu, 29 Aug 2019 17:14:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 54E7216EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567091706;
	bh=wRLgme8YGawiRF4TtWQrQf7dZEDGo7pLfJscBm3X7gQ=;
	h=References:In-Reply-To:From:Date:To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oFR2ypcTExn49elCCX/OWfG3RqndRRUdoU6Uuhq/6sqbO6s0YeWpQ6PR9FvlV9ezs
	 HvfCLqeR5EUL/bo6El1CIqtN8RUmM4ThKD/9ov9foEPMMzpqAqtwXDNyg994rOTbIx
	 k13eXYWwDCdkQJUn1vB/z4xaOPKOCCnEeFYhDSho=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B9CFDF897CB;
	Wed, 28 Aug 2019 18:15:21 +0200 (CEST)
X-Original-To: Alsa-devel@alsa-project.org
Delivered-To: Alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CB147F897CA; Wed, 28 Aug 2019 18:15:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 23E6DF896FE
 for <Alsa-devel@alsa-project.org>; Wed, 28 Aug 2019 18:15:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23E6DF896FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="DWFHFmA7"
Received: by mail-qt1-x836.google.com with SMTP id k13so98582qtm.12
 for <Alsa-devel@alsa-project.org>; Wed, 28 Aug 2019 09:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=vZD/hWmh6t0dofyhPtur7i1bbg2bvz5Hh9Fc25r7PmU=;
 b=DWFHFmA73Tzu/TkgNiLDITNcNnt5fVaug4ldbBYRfaz5kQLvboqRnxbK5DFU2fZ+OE
 6rkudv1iz6GihCrbVg4iU2q7Oco4hDBxjMgpPDBdvGkZgfz7lJB3udmjPmBRpaHuFRzt
 IwJH1jyDRmVs/HTjEa3WfD2ClU6t1pTe1WWmTXDZGueRDNBmVGndHpVWRghYLX6X30Jm
 tI64UiW5XFDuvcxFzAmOMl6dTesmLTYd12wcU1pcuv/DPUySMHxp5ovkggCSTB1Vo29q
 a+maY9pUcqPDy5EuCOJhBzFxO/KOywQh3lP6ucNyynD9IedgO6Q75B8huCzliPmi1A5W
 SbWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=vZD/hWmh6t0dofyhPtur7i1bbg2bvz5Hh9Fc25r7PmU=;
 b=dBlnbZkI+6YC4Vlwwz1873hXViSInu36odlCLruW3hxynUUQUeu37nWLuMnu2QzaZg
 N9m5Y3pEOry3685D2+qftluem8V9STSL67jYL0/+qKYNyIVma7uPQu24WH6gwhFyrQ5s
 WiEVFb554HJ5XNI2NlTPianCbFpOiRODvMWeKpjG/q8y+9yuj99WxFZUKfKquKgm40bL
 1cvr/9NAwTbtcdrpcyN9T6LfayjVQMrqO4GSh4UPtxBO1m97D7DIGN1q97AqKDHhxN/P
 +7lzKxLFWd3NRC2IPo/N40dglRaIVX3OFCaeYaFqs0wTD4GA0e++2A8X2RnQqgYjAVr7
 tzNg==
X-Gm-Message-State: APjAAAVnQ84gN6zdfLoX7wQ8zUHqyOMpgnUEl15fWCv36tIRWObebmtn
 v62xrTicbwNhwtYmWRlQCdoW2lJ+CAeQ7b614eE/7g==
X-Google-Smtp-Source: APXvYqycBhd0z1DRULsFO/FpH2BGsQrEHqmtg09fFQzsEPDZoV7QLLPyNwNWwKbsf4y8+2ASrr1JjNT7iDBuEmmtKc4=
X-Received: by 2002:ac8:7552:: with SMTP id b18mr5067305qtr.235.1567008913856; 
 Wed, 28 Aug 2019 09:15:13 -0700 (PDT)
MIME-Version: 1.0
References: <CA+SWvNwqg3Q37BWNpw7C+75Z+CO-zUo2UUYjvz88L3hW1tk=gQ@mail.gmail.com>
 <CA+SWvNztL5Ykt_LtU+zyv0MjWbM6wqAvM4U+JVcqvcN3AhdGNg@mail.gmail.com>
In-Reply-To: <CA+SWvNztL5Ykt_LtU+zyv0MjWbM6wqAvM4U+JVcqvcN3AhdGNg@mail.gmail.com>
From: Pavel Hofman <pavhofman@gmail.com>
Date: Wed, 28 Aug 2019 18:15:02 +0200
Message-ID: <CA+SWvNwMVRG5C=pSTDBvmODLkJQ4b4eWv=u-VU0ULOx+C6K8Ew@mail.gmail.com>
To: Alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] Options for ASYNC feedback source in USB-audio
	gadget (USB OTG)?
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, Aug 28, 2019 at 5:17 PM Pavel Hofman <pavhofman@gmail.com> wrote:
> IMO some common time frame must be used. E.g. kernel time in nanoseconds.
>
> How about something like this:
>
> 1) the core PCM part of alsa driver would keep relative samplerate and
> present such value in proc/sysfs to userspace.
> the calculation something like:
> copied X sample frames in Y kernel nanosecs (for the last e.g. approx.
> 30 secs ), with nominal samplerate 48kHz. The value would be
> (10^9 * X frames/Y nanosecs) / 48000 Hz samplerate = e.g. 1.00001

Perhaps the relative throughput could be calculated in alsa-lib when
talking to the driver? It has the same information available.
Turned-on by some environment var, regular output to some /tmp file
named after the corresponding hw card. Or does please alsa-lib have
some existing debug output, similar to /proc/asound, apart of stderr?

I very much appreciate any comments. IMO this would be a very useful
improvement, there are lots of RPi projects which would benefit from
properly working USB-audio connectivity.

Thanks,

Pavel.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
