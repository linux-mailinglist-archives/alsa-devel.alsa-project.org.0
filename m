Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF6F3DDC72
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Aug 2021 17:28:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BAEA916A6;
	Mon,  2 Aug 2021 17:27:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BAEA916A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627918105;
	bh=8RdGIPjJX9dGlPKqDevRek2R3/V3xruR0Jr0YW2/83c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qkNDWYzNXF7vtowsrLG3AXbbwcE1jAU6q/pKFrS36PTCS469MkxJBBQLqTv3HNXiW
	 b+qGOO4dEwM1lD44AItt7oVHcyI03gyHMTbgyFgMBhRvfJJBaqCNv3Id9Ds02qx+v7
	 vmFb4T0wD4sUUg6V+tuhnO4hnYPSty8IA1JwdJ2A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 92A3DF80095;
	Mon,  2 Aug 2021 17:26:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 35806F8025F; Mon,  2 Aug 2021 17:26:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 470ECF80095
 for <alsa-devel@alsa-project.org>; Mon,  2 Aug 2021 17:26:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 470ECF80095
Received: from mail-wr1-f45.google.com ([209.85.221.45]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1M4rkF-1mCUqY2Oe7-0020MX for <alsa-devel@alsa-project.org>; Mon, 02 Aug 2021
 17:26:45 +0200
Received: by mail-wr1-f45.google.com with SMTP id c16so21907363wrp.13
 for <alsa-devel@alsa-project.org>; Mon, 02 Aug 2021 08:26:45 -0700 (PDT)
X-Gm-Message-State: AOAM531yPMtChuYpQ333NkQndbiRLZeTtnAw3O6/62/JgX7Q6ImpUhrL
 6/hfZ8kaeKA+QeWUpSptK19gJDikLVvSTxAjilw=
X-Google-Smtp-Source: ABdhPJzZCo02qt85Wy7jyYxW3FRZi9cSM/bDjegl58lPJs2+HXyrFRxyfPQLbaf1L9rZEu8AEundQoeuslaBYiPtiZc=
X-Received: by 2002:adf:f7c5:: with SMTP id a5mr18330881wrq.99.1627918005273; 
 Mon, 02 Aug 2021 08:26:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210802151628.15291-1-pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20210802151628.15291-1-pierre-louis.bossart@linux.intel.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 2 Aug 2021 17:26:29 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2+kaFs8cTVGdLQKfx=wDR4RMBcLdOAA3cHOew3=VpCaA@mail.gmail.com>
Message-ID: <CAK8P3a2+kaFs8cTVGdLQKfx=wDR4RMBcLdOAA3cHOew3=VpCaA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: SOF: Intel: Kconfig: fix SoundWire dependencies
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:Z424GqHPEkDEniEfGkiPAn7U8OPSCQwa1LE48gh4GO9bn76BL1B
 hFlUYDI29uxzW0ePen1M2yHbsggHoTAVUzrKFZlQQQJu+VGMr6v6c4M3pY8G186dHpUhl5c
 hoLBI9ThroIIqg0ScL4Sp2RFfepJabrkPF06a5mQHJEEfFMpqAaZAa+kAZS8/x3ro6s35mb
 D5Dr+yMxH1UiqelDXy6JQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Oi+IIYjLah8=:ZLoYA8XCBPrSkvYx68Ulni
 8woApTjjXbExkJUzIpFM3ETt8VFCewPgOiMkFuIaMDhGvnTfldmB7qYZibPjCfiR7cfqgqEgO
 x6qs1IENragzfjlow7BVn34uTGv2q0Q2xx7p7yjOhoeQelZ7VZ6PInGUaMvzhRi0vA+6zZ485
 fdzhVARp3bDc6Nzt8WuS/wb7jmMe3YmZo/vXxeOYrwVSQpk00E2c9+v5sP3hExNSQs5PEQCcE
 puqKfpGUnABklFLXIImRm1GbEtQUAMyOYGGKIhKUPFqvU983IOxJxAGtpNpRaqHejk62sQT6R
 6Pcogp9R9ooGaZkS4Y6dStQ78BGXZrsfLCfMbX53VtCm4DmpQ7Ue012bQ5QmjUzb6zFzF8U7D
 Htl4bB96UFXxFntqZ+4eHVioHWSt9E9ImsSqBtbfD572ynq3PAmUhckRzusgFMgiqfmOnURqT
 ZtGihMOZ+xpaJDgpZI6kVVk9x9n/p5uf0L8q3plmv16RyH1P1Cg4A82mDi7/rgz3M3ga1CUre
 7FrJ8ifGTj8EFl7QBugRW0/PtnfxhTRgfp9BQ/R3jeDbgT2TbSnjNH9m2yIKFWQJP4so2RO9u
 8d/aFzv6jT8evki00BCx88Oh+3kr+D0FYmMBouAHYyfDxhWmR1/PiL4g6EvKhxiu0PtAbwr++
 t0ywqauHn/xo1mKPyYdxF4CgtGHWq+xeK37wxPterJUop44L9yyoRx7pHXfMGPVPrqt3pSbJ+
 QgcdT+wwWBd1HLi9xsraBWZI8r+iiv2ysY3FCjavVC/w+yDLc+BhpM4/5nPcUniDNPejJKot5
 3QqyUCWZ2xmuL/VnYgMo9Z4hUPrmRLF8msjsVE+jRjcRhNGQt/MKTSHjGE+9xCrhjIy/ycz
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Arnd Bergmann <arnd@arndb.de>, Takashi Iwai <tiwai@suse.de>,
 Rander Wang <rander.wang@intel.com>, Vinod Koul <vkoul@kernel.org>,
 Mark Brown <broonie@kernel.org>, Bard Liao <bard.liao@intel.com>
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

On Mon, Aug 2, 2021 at 5:16 PM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
>
> The previous Kconfig cleanup added simplifications but also introduced
> a new one by moving a boolean to a tristate. This leads to randconfig
> problems.
>
> This patch moves the select operations in the SOUNDWIRE_LINK_BASELINE
> option. The INTEL_SOUNDWIRE config remains a tristate for backwards
> compatibility with older configurations but is essentially an on/off
> switch.
>
> Fixes: cf5807f5f814f ('ASoC: SOF: Intel: SoundWire: simplify Kconfig')
> Reported-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: Rander Wang <rander.wang@intel.com>
> Reviewed-by: Bard Liao <bard.liao@intel.com>

I've had this in my randconfig tree for a couple of days without seeing
any further problems:

Tested-by: Arnd Bergmann <arnd@arndb.de>
