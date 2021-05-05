Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F152C3749E1
	for <lists+alsa-devel@lfdr.de>; Wed,  5 May 2021 23:05:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 796551695;
	Wed,  5 May 2021 23:04:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 796551695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620248746;
	bh=Xg7+ZnSzWBepnJf+hwadnoPbWmUqbgu2Flz/EfTV8Es=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Qqy78abVVnoniFSrSICEjVvf1NhFC+6FeNeXbffsAgAu4Ixf3GpwV+kaXBdmgTakc
	 8Cfbj0odB0nNpk9GgtFOkwNtSPszCRNtt8sywOqn/TdQKQG2a/R3W80r6ENowwN98x
	 mr+dEootT+2kNz5xE0fgsQuXdxaiY/jBo3SLdCC4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 21576F80108;
	Wed,  5 May 2021 23:04:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 15860F8025F; Wed,  5 May 2021 23:04:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A40B9F80163
 for <alsa-devel@alsa-project.org>; Wed,  5 May 2021 23:04:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A40B9F80163
Received: from mail-wr1-f43.google.com ([209.85.221.43]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1N4z2Y-1lWwWr1M2O-010xzY for <alsa-devel@alsa-project.org>; Wed, 05 May
 2021 23:04:09 +0200
Received: by mail-wr1-f43.google.com with SMTP id x5so3295028wrv.13
 for <alsa-devel@alsa-project.org>; Wed, 05 May 2021 14:04:09 -0700 (PDT)
X-Gm-Message-State: AOAM5311yZ3fhsC3TLQvwg3pQjVJhPfKiMicAaKXsxL/Tyf0mU/rUkMB
 DQolVRvV682WytSRM5iIRBUcpdY/tkjbJmjOJ6I=
X-Google-Smtp-Source: ABdhPJxFNqhRGbxEni34+TO5SfH+G7Ua+/NzdhuJ2oi4wGDszHwlVvVUqEQ5+fNzUHyzvQQWW1mQp3ZGHKfzx3+5/gI=
X-Received: by 2002:adf:c70b:: with SMTP id k11mr1042722wrg.165.1620248648964; 
 Wed, 05 May 2021 14:04:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210505170235.306797-1-pierre-louis.bossart@linux.intel.com>
 <20210505170235.306797-3-pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20210505170235.306797-3-pierre-louis.bossart@linux.intel.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 5 May 2021 23:03:24 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3fj0OQ41QHcR7Dmgqmf+pv0MMmst22xXybtUm_=d3QSw@mail.gmail.com>
Message-ID: <CAK8P3a3fj0OQ41QHcR7Dmgqmf+pv0MMmst22xXybtUm_=d3QSw@mail.gmail.com>
Subject: Re: [PATCH 2/2] ASoC: SOF: Intel: move common ATOM stuff to module
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:JAOK2WiupTizkjOh6zLjLUhELLt7WH2SICz6NkJeeTPFy4+aEOW
 GCNOY7KsgpC6hZUrOFTL/QuVXemUrWEtiCBtPB158SIvXt1SPThFViS5FThNAPIfJyTRdaI
 Ox8LU3bgfZ+1FlFI2IWpAGXtRGpFN+fkEaGQ8Dx7YZmTtpJXeJRaP6O5YNjU0bRd7nEvpXK
 y3qY8lX1cryxXo+eGrOCA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:/ZTkvrdk0uk=:MMNB81yohAIeSpiWF3VWcN
 4gEfbgNyldAnCBZOClr7mERgLod16VnbCnJzA4aIzwxJPwDGtaNkW2AXJ5MNYWnR59ymJMm8Y
 ZO3MCWdZX1JZDWKXD5P7nllE2deLY6Og7WOnBsiPPaMwz0ty+cH7WsPtzam2BBB5OBQDb9m1Q
 DkIHRvgvSK3XMwaYRHLXxp7SrbjwIP/ZCY3kJsIzBhSyzfyeSt2Kj0/mjBSlo6JHxMhPnEs/R
 qfieYy6Hkgd+8vYMHf3yiGIe/Xg9buDeT2ZXzJXdW+h9Mi5v86oiink5MPQtnX8XrGnreu6t4
 9xN1r4Y7vPFInr3lvZHi4BMl+0BN5IKi4qV2jCUkI92CYtqXLdiiYHOUQiyshk1fVKiTMU/Cw
 EzhvCR0SZPKvnMBvNi+4a39N9pMwPcQmhNxM743YSe4jjK8Be6Eggc8YeAvQxf/5io+RjTRZz
 qhUaoNTBmM3VMHXeHgAR7hPLEFHDD3eK9GiqQ9kEG70dnHLs/Om6ETgGcmx2ljoHyh27mExlv
 FlXc1qrcbkwownEE3d0czY=
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Takashi Iwai <tiwai@suse.de>,
 Vinod Koul <vkoul@kernel.org>, Mark Brown <broonie@kernel.org>,
 Bard Liao <bard.liao@intel.com>
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

On Wed, May 5, 2021 at 7:02 PM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
>
> Split between ACPI/PCI parts and use common module.
>
> Since it's a split of existing code, the same dual-license is used for
> the new atom.c and atom.h files.
>
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: Bard Liao <bard.liao@intel.com>
> Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
> Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>

I've had this (or a version of it) in my randconfig tree for a few
days with no build
problems, and it all looks good.

Tested-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Arnd Bergmann <arnd@arndb.de>
