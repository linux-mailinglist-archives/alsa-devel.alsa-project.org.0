Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 573833F882E
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Aug 2021 14:57:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7322716B0;
	Thu, 26 Aug 2021 14:57:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7322716B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629982674;
	bh=njRimGOIAbqbKx/5ZrZSGnm8dBTrS6TRY3ucp7C/bzU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rLUeBBMw2BPgMDuKlx+Bp1S9Ixq0yKc61TSKPb9tiVjPdHg7GdCXC8ZnF+ejiHyik
	 bQF+GLvz67CvrzLewM0d5CNqLxf9SDYhc+j5OnCcSUQfxWUnFRkLiLk8PnX9qZn5vT
	 vOx9c4COXzTU35T+tWvNCIm/M9MOIt2NAfbFXxgw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF583F804B4;
	Thu, 26 Aug 2021 14:56:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 77094F800AE; Wed, 25 Aug 2021 17:34:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from codesynthesis.com (codesynthesis.com [188.40.148.39])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 33E60F800C9
 for <alsa-devel@alsa-project.org>; Wed, 25 Aug 2021 17:34:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33E60F800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=codesynthesis.com
 header.i=@codesynthesis.com header.b="M4Zeq9iy"
Received: from brak.codesynthesis.com (197-255-152-207.static.adept.co.za
 [197.255.152.207])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by codesynthesis.com (Postfix) with ESMTPSA id EC3275F7CB;
 Wed, 25 Aug 2021 15:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codesynthesis.com;
 s=mail1; t=1629905681;
 bh=njRimGOIAbqbKx/5ZrZSGnm8dBTrS6TRY3ucp7C/bzU=;
 h=Date:From:To:Subject:Message-ID:MIME-Version:From;
 b=M4Zeq9iy/BsSsC3ucqhrc8i/ZaAxdzH10P5jgmpgL4PwLblF/Fp947GMfSBXeNsjq
 NuVIW50/nTWLqphqH0bmluRAxc0xwe2C4oPm8c3f82SB7NkwrgSfclPFXG73pD0L0h
 BXOpQO6Icl3wl7OePxAFtZ7q+2CMRU9b3Qt4+Lm1L2wJkxTOQ3DpJExmWuUMQyAheR
 kyHK+EDh37gLQ1jZZ8I0aj6iXvXQ9trqsiJeiZDTSWqktv5++p/YTyknMZMmxFNd7P
 pNCo5LQJUmP3rmiNyTGDZjJtNKJ5AnGpM3Qc/HQWkVB6YyRtxYHeF5BjZsSZXaAbiu
 PCHHvOofYHbwQ==
Received: by brak.codesynthesis.com (Postfix, from userid 1000)
 id 1A3B11A800C4; Wed, 25 Aug 2021 17:34:37 +0200 (SAST)
Date: Wed, 25 Aug 2021 17:34:37 +0200
From: Boris Kolpackov <boris@codesynthesis.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH] kconfig: forbid symbols that end with '_MODULE'
Message-ID: <boris.20210825172545@codesynthesis.com>
References: <20210825041637.365171-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210825041637.365171-1-masahiroy@kernel.org>
Organization: Code Synthesis
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Approved-At: Thu, 26 Aug 2021 14:56:12 +0200
Cc: alsa-devel@alsa-project.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 linux-wireless@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Luca Coelho <luciano.coelho@intel.com>,
 netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Kalle Valo <kvalo@codeaurora.org>
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

Masahiro Yamada <masahiroy@kernel.org> writes:

> Kconfig (syncconfig) generates include/generated/autoconf.h to make
> CONFIG options available to the pre-processor.
> 
> The macros are suffixed with '_MODULE' for symbols with the value 'm'.
> 
> Here is a conflict; CONFIG_FOO=m results in '#define CONFIG_FOO_MODULE 1',
> but CONFIG_FOO_MODULE=y also results in the same define.
> 
> fixdep always assumes CONFIG_FOO_MODULE comes from CONFIG_FOO=m, so the
> dependency is not properly tracked for symbols that end with '_MODULE'.

It seem to me the problem is in autoconf.h/fixdep, not in the Kconfig
language.


> This commit makes Kconfig error out if it finds a symbol suffixed with
> '_MODULE'.

I know you don't care, but I will voice my objection, for the record:
Kconfig is used by projects other than the Linux kernel and some of
them do not use the autoconf.h functionality. For such projects this
restriction seems arbitrary and potentially backwards-incompatible.
