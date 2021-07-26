Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 625493D68BB
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jul 2021 23:35:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DBE4F1B08;
	Mon, 26 Jul 2021 23:34:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DBE4F1B08
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627335339;
	bh=id7UzBkArP9HgI8FqJddFH5+I14ai0O9xXYjiBT7O6c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sGcthlV73DZXjpZw1j4mbncMY3WrV9OahSAktKAOffm7BbJgvZAuygDr5+cd431jh
	 LfS/vtajkPE90lUEXf+RlPEfchaadsRWiE+6zdUipcnbfOXGNrXSZiYKR2mBTwqOkr
	 RbiuQ9QcKxIyFm2fhktIS9Uoi44gqeZ4L7u85O70=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6064DF8025E;
	Mon, 26 Jul 2021 23:34:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6DC18F8025A; Mon, 26 Jul 2021 23:34:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F13D3F80130
 for <alsa-devel@alsa-project.org>; Mon, 26 Jul 2021 23:33:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F13D3F80130
Received: from mail-wr1-f48.google.com ([209.85.221.48]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MtfRp-1lDPa52nL5-00v6e9 for <alsa-devel@alsa-project.org>; Mon, 26 Jul
 2021 23:33:58 +0200
Received: by mail-wr1-f48.google.com with SMTP id e2so12705595wrq.6
 for <alsa-devel@alsa-project.org>; Mon, 26 Jul 2021 14:33:58 -0700 (PDT)
X-Gm-Message-State: AOAM530TzmiqRL86Ek5qSJpzptBoLwVZyq9a/biHxHi2t98zMZP84Jxk
 6o3lngpaPvDDu3sOwngppWF+vZ1WVY6yrqOH9zw=
X-Google-Smtp-Source: ABdhPJz89/j5PbMF60hpvwcbSi2hV77iVCQo0ttJq/oVia/jR1fiNqXrDr4zuvneAgvlx2DjuubtlCcpGbTSVEPMNHg=
X-Received: by 2002:adf:f446:: with SMTP id f6mr8489251wrp.361.1627335238129; 
 Mon, 26 Jul 2021 14:33:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210302003125.1178419-1-pierre-louis.bossart@linux.intel.com>
 <CAK8P3a38tizZh1z=iJQotL3Tv3z8iK0qq2WCSy853M-nfwt4mQ@mail.gmail.com>
 <9cbc71be-17b0-4a88-c8a1-a1e800894a56@linux.intel.com>
In-Reply-To: <9cbc71be-17b0-4a88-c8a1-a1e800894a56@linux.intel.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 26 Jul 2021 23:33:41 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0CgD+gyjFTUXq8rN70bMUHd63iYVOCMvAVTR0X_noqNw@mail.gmail.com>
Message-ID: <CAK8P3a0CgD+gyjFTUXq8rN70bMUHd63iYVOCMvAVTR0X_noqNw@mail.gmail.com>
Subject: Re: [PATCH 0/7] ALSA/ASoC/SOF/SoundWire: fix Kconfig issues
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:XIvEd82LLFp5doKq10bbWnw+457qPNaJ5LGxo533oYrNIO0K0DT
 O7OJhoK+7DUsacDZrt26E/pAy8SqAS3aOSCHSS544rOmqOyKzob7lQx412mMvM9q0pqGHkF
 2BRlnraIajlJS2Nl2nXasoDVgdW+Qhigxb85wlhGnCZk2nv15jFPZQW/Di27LrKAfiv3n6O
 I8pHmPH8t3nPjL5LgKIFA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:r9qYLN6Fa80=:zyPtZQn4WCyTLAXiPhDJHl
 csIG+VcUep94I6tJVbf06KQYZMq6UN5Tek0VsNMHPFRN1SF3kCPkiHIpLDe76Gx376PspJh5i
 V2quFFKDOsOlMxxBsUQkoQ1bMs0WQR34BreYXwWDWpeGCWxauSIERVpUbyQ9OwizdOnUJDCYr
 p/E7CoQBtjsHbWWT0lTC661XJIqlflgMaGbYXkUsRQRM2UjPIG+Sl36dCqeCrtytSGv80mpvn
 T6QXQA17X49pEwnjXzPxJ4TSPIo9UhlmEqjrRIEsRLvzQj8yr/Eigj9KnyLsc3xtXe0Nr9Yrn
 H2YIflLtY9uXrzutlCAC37Qw1Fs9+s2uNAFMARq79UzoTZJamECnURBqjvGgYx5MwYw70z7Zc
 FZ35GSDpTKdRMkR9Lqy0daw3gJVTX2HSHciX3y61qLsaG6fh8PCTcPlPATPkBwqnehgJXn9YV
 rpE0cSFXUW5dcPC+pTMFjEB+n3PwvFWvc4MZh3x2XDvKDeID7+PJAcbkrySRGXRpMGrzLA70h
 4+o1Tr9F1oHWL0IoOi/pmDjtPcNMMmX8bIUhmuh2W3BtZZe4sQhTymNBxXZa9liXdiqflBTqw
 6+hz31wIfYWL8yO3WKs5Uf4fH2MBcY0BrGNOYZPZCY728Eq1mS3G4Xek4Hj+wQYNA+V9hPMXN
 e4tIvE5kwMRb786bt0GmErBgDpnQIWzKmonTT4bMqnK0Mul3r9Kuuvd+CwDK2kW2+yqc3/E1n
 zF6yGRYGzfK4QHqarQjr3P2pOybwBsr8FWTQiWgfugwFRjM05nHsWzybufggcyRGkcIr3x+ld
 tTRkLZn2CUvdQY8fLUEcPTVZw6bkVgh1pGADT+90KwLu5AVywo6ha4jG2dkZgZ3WjSfZqKYO5
 Rd2u7Gxrx79uHo91KIM6oyoexvAuKlgXLHO1AnUQByLKR01CVxf8wJRSmE8HZuZNnjd3BhBpq
 KQgbsBv/Bv8WdW5vkW3+nvFgy53qwpgxGdgquZbQZSlsYmj4eOhg8
Cc: Takashi Iwai <tiwai@suse.de>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>
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

On Mon, Jul 26, 2021 at 11:01 PM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
>
> Thanks for this report Arnd.
>
> I can reproduce the problem, the changes made 6 months back don't make
> too much sense to me any longer. I have really no idea why I moved the
> INTEL_SOUNDWIRE config to a boolean, that was asking for trouble.
>
> I have a tentative fix being tested at
> https://github.com/thesofproject/linux/pull/3066. I just moved the
> select operations to a different option and reverted the INTEL_SOUNDWIRE
> config to be an on/off switch from the user perspective, with
> dependencies on built-in v. module checked inside.

Ah, I'm glad you at least came up with a patch quickly, even if neither of
us remembers what we were thinking then ;-)

I've added this to my test tree, and will be able to at least verify that this
doesn't break anything obvious over night.

         Arnd
