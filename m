Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD1B25A865
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Sep 2020 11:12:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C03E180C;
	Wed,  2 Sep 2020 11:11:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C03E180C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599037953;
	bh=IOmbCqxmZYDkBSNg8v2Xoyif0LGwCY8FU6j8LXdijOs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nQg7wku+0w6jQiDeLwyWBbK6VEs+2Zo2qgxu2X9q9nSu2M7rDvqTLh1SnwwgAOo2o
	 sTMlIdx4Ft+tDl0cvyRtcT/yWsyzp4VFeA3qi1EiSAk7XvQO9ngnR2CuFKt9d5pP8n
	 37gKYU+HFRkxh3KIwf+m751gKOvFdPAYw3hQ+nuE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C5F13F800F3;
	Wed,  2 Sep 2020 11:10:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C5840F8024A; Wed,  2 Sep 2020 11:10:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com
 [209.85.218.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7D1CCF800F3
 for <alsa-devel@alsa-project.org>; Wed,  2 Sep 2020 11:10:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D1CCF800F3
Received: by mail-ej1-f67.google.com with SMTP id h4so5605425ejj.0
 for <alsa-devel@alsa-project.org>; Wed, 02 Sep 2020 02:10:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=E4fh5/MeVusZ4b0N/tjFHVUKNTWkPzDCAhh11fSrU6A=;
 b=ufPGJOghHfK/sUNPytdhrAhjXdr3ZJGkUB4h69wgin1ALQ2BktScE4vSn7UxX/QZ8u
 WvidqwcliX145fisjDTQJZ1oG+2kvhXU0QW/T/UE9DWtdQKMC1Pt/RBENzMTvZ07hhLW
 ObMiwZ4TQk75jYwhzrbArbb6RPuoWqOh52l1dcrI0nGAQL6WaKBA7ZD4ViROr28qCCl+
 NUO03YoIw/vaXxXDCSPYTbbbQ/vmyjde2khFgKRhDEeaJfKCs0cRnPFmx0VVU9a9wzXd
 UkwhJFd7QE1Q4gRvYB70g+grg5g4mfqWkxcl5xldzvmclzCr6TD9Nz1LGluz31js1m3J
 UDdw==
X-Gm-Message-State: AOAM533DbzkZYvdt7ch5nnPw84hUPqjI87YorUPjMs9ZOV0tjBPUm7Ez
 UB+dFSoNbjvDbFVGlED2wTE=
X-Google-Smtp-Source: ABdhPJwSWg4FBr7OY7AxzYwDMv1nLEAHRO8crmn+qZHgmfPLuyez3KEx8mKobZPHm50gu/Snkusk3A==
X-Received: by 2002:a17:906:2b87:: with SMTP id
 m7mr5278949ejg.210.1599037841796; 
 Wed, 02 Sep 2020 02:10:41 -0700 (PDT)
Received: from pi3 ([194.230.155.106])
 by smtp.googlemail.com with ESMTPSA id n20sm1704793ejs.14.2020.09.02.02.10.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2020 02:10:41 -0700 (PDT)
Date: Wed, 2 Sep 2020 11:10:38 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: sound: midas-audio: Correct parsing
 sound-dai phandles
Message-ID: <20200902091038.GB13726@pi3>
References: <20200830112633.6732-1-krzk@kernel.org>
 <20200901110349.GC6262@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200901110349.GC6262@sirena.org.uk>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
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

On Tue, Sep 01, 2020 at 12:03:49PM +0100, Mark Brown wrote:
> On Sun, Aug 30, 2020 at 01:26:32PM +0200, Krzysztof Kozlowski wrote:
> > The "sound-dai" property has cells therefore phandle-array should be
> > used, even if it is just one phandle.  This fixes dtbs_check warnings
> > like:
> 
> Please submit patches using subject lines reflecting the style for the
> subsystem, this makes it easier for people to identify relevant patches.
> Look at what existing commits in the area you're changing are doing and
> make sure your subject lines visually resemble what they're doing.
> There's no need to resubmit to fix this alone.

The usual prefix for bindings is "dt-bindings: ..." so I wonder what
type of prefix you expect:
1. ASoC: dt-bindings: ...
2. dt-bindings: ASoC: ...

Which one of these?

Best regards,
Krzysztof

