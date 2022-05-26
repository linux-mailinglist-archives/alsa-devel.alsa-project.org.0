Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB27534BD5
	for <lists+alsa-devel@lfdr.de>; Thu, 26 May 2022 10:33:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C7A0F7;
	Thu, 26 May 2022 10:33:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C7A0F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653554033;
	bh=wByZhCP0ozBqt4kTyyGL8Nx1hLtxX2ZTz85NnNqX75Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o+l6/F0xSr79vAl+pa6NhWdQkrxwEtaRs3F9lQFM/ZbdXwdMT+0haWCCXBGyWii1x
	 Ve++kDXfkqjppYnySkh7L0v0oLo/ecWx2DWsKPo5rxKr0b1D2lA8HU/qwqNr3zuTjY
	 mQ8g/jL/U/j4qVzTV2JJLGSRBZlFdYO4pkiERG70=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A759EF80171;
	Thu, 26 May 2022 10:32:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B4F6FF8014B; Thu, 26 May 2022 10:32:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9DB3EF80100
 for <alsa-devel@alsa-project.org>; Thu, 26 May 2022 10:32:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9DB3EF80100
Received: from mail-yw1-f172.google.com ([209.85.128.172]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MiZof-1nNXfJ2FQV-00fhv4 for <alsa-devel@alsa-project.org>; Thu, 26 May
 2022 10:32:42 +0200
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-2ff90e0937aso8008827b3.4
 for <alsa-devel@alsa-project.org>; Thu, 26 May 2022 01:32:42 -0700 (PDT)
X-Gm-Message-State: AOAM533v3UPYGqAdMoFCr552I7dMAoB9Li4mZ97F0RbY8O0znWvR87jM
 sQSpFHfJvYYajQvGo/F/Dw3mTm1t7/e0m1gzuzA=
X-Google-Smtp-Source: ABdhPJzd1Td84PUKl1aMompoBi/CI7Ij8UKcDh3J33F17cieCWlpkBhuvBB90C07npKSjm4gZ1dqj3OUo1L9/csGNzA=
X-Received: by 2002:a81:488c:0:b0:302:549f:ffbc with SMTP id
 v134-20020a81488c000000b00302549fffbcmr1085051ywa.495.1653553961173; Thu, 26
 May 2022 01:32:41 -0700 (PDT)
MIME-Version: 1.0
References: <628ea118.wJYf60YnZco0hs9o%lkp@intel.com>
In-Reply-To: <628ea118.wJYf60YnZco0hs9o%lkp@intel.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 26 May 2022 10:32:24 +0200
X-Gmail-Original-Message-ID: <CAK8P3a10aGYNr=nKZVzv+1n_DRibSCCkoCLuTDtmhZskBMWfyw@mail.gmail.com>
Message-ID: <CAK8P3a10aGYNr=nKZVzv+1n_DRibSCCkoCLuTDtmhZskBMWfyw@mail.gmail.com>
Subject: Re: [linux-next:master] BUILD REGRESSION
 8cb8311e95e3bb58bd84d6350365f14a718faa6d
To: kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:0l25/GlWAhreintP2IMp4ap823stVsW73vxkcZ40mb8O2TVrnxz
 185B84E6z6evBbzhNaOfAnRl/bEKWLnm3vBP71pnE0xFAkxjFjVwZtX9u0M07g8y50eR5dR
 2KPDxvFMQfwBPLf8NVd2GTLlypW926sPtXWWqDz43AUA4Mg0sE8DEZIU78FYDFY9NfrbeTp
 g8N+9n16YHA7nggnYl4lQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:e48haBp5eKA=:FeRkIeuKBRAL44l9hcX9zX
 9G4S0tRS4o4k9obuI5x+jS3/SpHK/5pISFaheAozQP+gzbGk1edh8myTML3XVkodW1E0rkExO
 7iqfeFCIk6IvWn/pHxlvQboeeNDsxnHsrM2hMvOXxEnLdyhWK80IjSv+Ry+ytINARdSfkGaRz
 wsNcabcjvpyz12/9ErX+mFrEWkyscwaJhdqVn7gE5RWR3oPRIZFJ6vNFQT4mwKnFsP3m1hfoT
 0smQ7SRXaIjjOJZnJImlVE3OIAk8JWFuDKEBfR4hewWzaiFncOEUbZGcHx9Ls5riSQkyzWHrj
 9Zfy2OFeG33l7WdOyjRmlrrOUH1W2UAj5vBfsFNOPxZIbahWBQGuICTzVLIXVNtaUiTKuZB6r
 eCBHwIeZRcRmQW5+WuOp1x8/FBf7JJwDdF2ydma3b4AWY2Gp9e5+mKAbFzJpjNTci9iCyEZMC
 87wK2tA4QnTNwOWL519+YSM0BBqECUPcdQOKmHJKOMSGr5kPXefhAbKFbUDCcc7JjgTTCP54F
 M6+tR1rs1cSFTEdKmr2AgcOlRxPpb/h9wHnIXhdxygqTYlpGCBApdxVW9SJ/bcgRut4jKj0UY
 uL0wujteT93pYeTMgoWEj2VsrOdTton3rFz0OveDnN0jPganJpxryVZIO27Rjy8wbL6QGj+/k
 UWOAOhXD2eOM9+uRvuAbdBC/TxgIGpR2oS49Tsi8jJTEnGqMsP1f7e7e3KUx1Scb5IehdJk9J
 pUkN1AcN8zX4vx7kEKswhE5u/h0Z4aNDd+i1SqDhjAkbYAUcKRCkEzqRllVq89NjtktRaWvu6
 lFu6NL9utJQbAfYKIPlrSjL5FddRcNcKVWZfrrXvb9IAK1MvtFtGxz77B4hEKr/KiI3ptOJq9
 wULPs0zkFLtplfOedjYY+yj1PS4/SLk5fhHgZFovM=
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 linux-parport@lists.infradead.org, kvm list <kvm@vger.kernel.org>,
 linux-rdma <linux-rdma@vger.kernel.org>, Networking <netdev@vger.kernel.org>,
 linux-staging@lists.linux.dev, bpf <bpf@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR QEMU'S CIRRUS DEVICE"
 <virtualization@lists.linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 linux-pci <linux-pci@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-omap <linux-omap@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
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

On Wed, May 25, 2022 at 11:35 PM kernel test robot <lkp@intel.com> wrote:
> .__mulsi3.o.cmd: No such file or directory
> Makefile:686: arch/h8300/Makefile: No such file or directory
> Makefile:765: arch/h8300/Makefile: No such file or directory
> arch/Kconfig:10: can't open file "arch/h8300/Kconfig"

Please stop building h8300  after the asm-generic tree is merged, the
architecture is getting removed.

        Arnd
