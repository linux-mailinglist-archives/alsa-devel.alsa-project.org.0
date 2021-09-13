Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C7040976D
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Sep 2021 17:35:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67B36166D;
	Mon, 13 Sep 2021 17:34:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67B36166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631547311;
	bh=+wXVvbwR/M5DJfizy+XFoRoXkF/7eyowX7MF84oUjAw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XMEboRiCRA7i/V8urip7cR6jhPqGd7UmHl5TW4TM8GrjzYdsy1U7Y047pv3AJSriE
	 zm+GdPQeJ++rJ0BxHoFC+xRgoIryhfRwneqx+E3cvvbqaS1UzCCVlFzFCPQjZxUo9g
	 1jWTz7espkTHu+Jf8XmmyumB+U/hnJlguR2pX7IU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A4BB1F8032C;
	Mon, 13 Sep 2021 17:33:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C053EF802E8; Mon, 13 Sep 2021 17:33:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D92CEF80227
 for <alsa-devel@alsa-project.org>; Mon, 13 Sep 2021 17:33:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D92CEF80227
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="gGydgc5W"
Received: by mail-wr1-x42a.google.com with SMTP id x6so15339401wrv.13
 for <alsa-devel@alsa-project.org>; Mon, 13 Sep 2021 08:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fWXmDpZaWGj5j9E7Z1va6xEMGPrQKj28NZ3Lpex3gSk=;
 b=gGydgc5WG9qP+XafnPlnIhq4Jkw9gFS6cL+s0Fzpf6uH5jRxzSiQqq8dqkrP6P6X/x
 c1O/xlJAb6NhfoHusa2YEteHfrHqqASps2eCccwz8auVvk5OIQJq65Ola2TiK3vZFGZ5
 C7F9oUELGj6mfDRFYbDmwDRUvocDC0ggqoX10j7XjgICPH39qf1COPHiGy8ZTkGKti/B
 gw2WJ9/szdNEuw0Fnr79v8porIBjnnWl7J4SAX7GoVUOSudpdlfhWQZXy62d2cgDhdl4
 EmUtAL6kjerRSAl4Ka5MtdWDP/Gp8ZA8KX1ZkS5MvN3LgYRdLaDZF+0qh/a5LFXR2j/A
 Gw5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fWXmDpZaWGj5j9E7Z1va6xEMGPrQKj28NZ3Lpex3gSk=;
 b=MNEb/QKxcslbIBLXer27eYt+0jqWwTNxEC7cbNBbqfCBH+HHti1dCHGq2F+403S7CK
 omMoaRZXTEwNKdrZOTL3tdKVXg5KADNuSJWEtk+I7zIQ7QYbrd4DWw54JWjzwKpfFDqr
 Y62Ik0YSd8ky/mZRTzfsAPmfAfo6/+2WzQ5Sk9CWkBmbNLyFFY5xpRQQcL+TbpO5umow
 oHh/XRX7qC+EvRz3HGhHignE9HegdQZA08HuuDyvbEIxfNInXgMPe6ZDOmVH9WSu0zHC
 Cnm0oz1xeaEccIH2eAVMiHA2YqxOAnmrT957D89FwOjZI7StiYMyODthkd1EK0Wl7n6x
 hJnw==
X-Gm-Message-State: AOAM530Oth+yRxA81g9zwyR2ED3mUQ5JCQIoMX5VR1H/dWfjWnvHiXqG
 Rb3AOGGYBrFrYhMG7qHG2P0=
X-Google-Smtp-Source: ABdhPJyj2q3U91trxKY3jdr7ZN8T4SItcT/Ai6azGMbEw3OJvXoU7wHS/d/cT3wdfi8N1XCC0mZ2tQ==
X-Received: by 2002:adf:ed92:: with SMTP id c18mr4947352wro.86.1631547204293; 
 Mon, 13 Sep 2021 08:33:24 -0700 (PDT)
Received: from kista.localnet (cpe-86-58-29-253.static.triera.net.
 [86.58.29.253])
 by smtp.gmail.com with ESMTPSA id w9sm6975406wmc.19.2021.09.13.08.33.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 08:33:23 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: Re: [PATCH 1/2] dt-bindings: sound: sun4i-i2s: add Allwinner R40
 I2S compatible
Date: Mon, 13 Sep 2021 17:33:22 +0200
Message-ID: <22661441.uYPlIyrNLm@kista>
In-Reply-To: <20210913111117.GB4283@sirena.org.uk>
References: <20210912072914.398419-1-jernej.skrabec@gmail.com>
 <20210912072914.398419-2-jernej.skrabec@gmail.com>
 <20210913111117.GB4283@sirena.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, mripard@kernel.org, linux-kernel@vger.kernel.org,
 wens@csie.org, robh+dt@kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
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

Hi!

Dne ponedeljek, 13. september 2021 ob 13:11:17 CEST je Mark Brown napisal(a):
> On Sun, Sep 12, 2021 at 09:29:13AM +0200, Jernej Skrabec wrote:
> > Allwinner R40 has 3 I2S controllers, compatible to those, found in H3.
> > 
> > Add R40/H3 compatible pair to DT bindings.
> 
> Please submit patches using subject lines reflecting the style for the
> subsystem, this makes it easier for people to identify relevant patches.
> Look at what existing commits in the area you're changing are doing and
> make sure your subject lines visually resemble what they're doing.
> There's no need to resubmit to fix this alone.

I did exactly that. But history is not uniform:

$ git log Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml
ce09d1a6800d dt-bindings: sound: sun4i-i2s: add Allwinner V3 I2S compatible
0bc1bf241de5 ASoC: sun4i-i2s: Document H3 with missing RX channel possibility
e84f44ba4604 ASoC: sun4i-i2s: Add H6 compatible
5c7404bb30bc dt-bindings: Change maintainer address
eb5b12843b06 dt-bindings: sound: sun4i-i2s: Document that the RX channel can 
be missing
0a0ca8e94ca3 dt-bindings: sound: Convert Allwinner I2S binding to YAML

Most subjects contain "dt-bindings: sound: " at the beginning. I selected 
variant from latest commit (ce09d1a6800d).

Best regards,
Jernej


