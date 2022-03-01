Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC124C8D05
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Mar 2022 14:55:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8EDFA1AA6;
	Tue,  1 Mar 2022 14:54:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8EDFA1AA6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646142935;
	bh=z/60Eg9nu/0eUBPudDBM/zpn5WaH0lNUNDDGxsEZ1dc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=klPy6l9BRW+Qktl2mRRkey2730S7Fmc2waqeuH/A3UFMyeb0/4qjVYiw5SBuR48Zt
	 e/yPmGMljKFAM7zJjwWemHQgGLeSOJNtBxlct/tj2h2ZQrJ1VeSus1HtCTwIsbUyKx
	 pQ/zgxVCKgM+OW4ev6WVXBffjz96VUw462NiCnFE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F2AC7F802D2;
	Tue,  1 Mar 2022 14:54:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DF143F80227; Tue,  1 Mar 2022 14:54:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BC2E0F80054
 for <alsa-devel@alsa-project.org>; Tue,  1 Mar 2022 14:54:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC2E0F80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net
 header.b="fyNcgpex"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1646142854;
 s=strato-dkim-0002; d=gerhold.net;
 h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
 From:Subject:Sender;
 bh=TmUIce0RehdrBsMBMSjDW27iMqd2SdloTLhy5FDD8Qk=;
 b=fyNcgpexTX1Y/j1QkIOCMKDgkD1RUb3tz4XdgX4TGJovdwY6WTvzx7ud9JRfOlh1zk
 FJQBwA8CnvVILMusrW3Tj+KlvJTsh3tMa8IZlBGTJFhuIAyMurajI/4BMFR1WqAUuwdw
 3oU/48QoebvFQZX8mA3/MZoE0H6T9m9n9DbA7MtVp3o+tZEbrw1kghxnBwAo5ey9Ys3x
 hxr/X8Atuyo3Hj/XtvoXfbMK2+E8jFn+BoJUz+G180f59jZFIOCm3FMb5609ctjRHcUY
 O+5q9vKH3tqGZgCOlJJIazv70N0DKS7lKEU6Gv5TASaeGSixpoPKtvCaXw7iyHAihv1Q
 V/UQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u267FZF9PwpcNKLVrK86+6Y="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net by smtp.strato.de (RZmta 47.40.1 AUTH)
 with ESMTPSA id kdc58dy21DsCaVY
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 1 Mar 2022 14:54:12 +0100 (CET)
Date: Tue, 1 Mar 2022 14:54:06 +0100
From: Stephan Gerhold <stephan@gerhold.net>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: Add schema for "awinic,aw8738"
Message-ID: <Yh4lfjsDR4qqnc8Y@gerhold.net>
References: <20220301123742.72146-1-stephan@gerhold.net>
 <20220301123742.72146-2-stephan@gerhold.net>
 <Yh4hYVJFZJBYp3d9@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yh4hYVJFZJBYp3d9@sirena.org.uk>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 Jonathan Albrieux <jonathan.albrieux@gmail.com>
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

On Tue, Mar 01, 2022 at 01:36:33PM +0000, Mark Brown wrote:
> On Tue, Mar 01, 2022 at 01:37:41PM +0100, Stephan Gerhold wrote:
> 
> > +  awinic,mode:
> > +    description: Amplifier mode (number of pulses for one-wire pulse control)
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    minimum: 1
> 
> No maximum?
> 

I wasn't sure if we really want to maintain maxima for several different
Awinic part numbers here. For the AW8738 the maximum is 7, for the
AW87318 (note the additional 1 in the name) it would be 10. The driver
part would be identical for both.

... But it's probably cleaner to have the schema check for the real
maximum of the selected compatible. I will add a "maximum" in v2.

> > +  sound-name-prefix: true
> 
> While it's very likely that someone will want to use this it shouldn't
> be *mandatory* that they do so, there may be no other controls for it to
> collide with (eg, if none of the other components in the audio path have
> controls).

This line just enables the "sound-name-prefix" from the included
name-prefix.yaml. It's not listed in "required" so it's actually
already optional.

Thanks!
Stephan
