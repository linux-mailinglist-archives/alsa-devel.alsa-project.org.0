Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A9A4F8FD1
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Apr 2022 09:49:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E597B18D6;
	Fri,  8 Apr 2022 09:49:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E597B18D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649404197;
	bh=uoCUt9kRip3xmuGeLGDqglk9GEPAPCSc46dVFwVFFvs=;
	h=From:To:Subject:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vfUdOUy7wYTY25dM8EuTHV6tnjqYKqvtQ4OERfUPXjygLVioU3xEDXMYGwQ9kKJWA
	 nHqTtF/H+yfJWm+hMe8Q69Vfl/tHC1RMhLHc6TG1yttXh2cToRk5+F4AHFmdUmb0bs
	 ggeclGIyAyH9s5iKBx6I+gqa8W7GpFaEn6i0a0ik=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 273F0F80116;
	Fri,  8 Apr 2022 09:48:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CB027F80100; Mon,  4 Apr 2022 20:39:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 82481F80100
 for <alsa-devel@alsa-project.org>; Mon,  4 Apr 2022 20:39:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82481F80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="pWjK8T/S"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1607DB818F3;
 Mon,  4 Apr 2022 18:39:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81B0EC340F3;
 Mon,  4 Apr 2022 18:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649097561;
 bh=uoCUt9kRip3xmuGeLGDqglk9GEPAPCSc46dVFwVFFvs=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=pWjK8T/SiEbCNPFdLabaKBhPZF8HEsxpYiFOPoj11AhzUzWc0mFSTNoTlb44mzjIt
 F3UZs1LSUjPo/vOdjOWkHWODjT6vCZV4ZDdN74DxYDMI5v/o8GBHU2fLfKRNJyKNv7
 gtUzy0Kf5ojn5swpmgVLnbCnNNgCbQO7w0i9dnoCj/kzOzhXBF6WNWKxFi9motkxV1
 mAZPq5pTW07Pv3EOFvaB4dD/VUmByyweb+IizmotBRaNxe2OECt5SeCdq2GbRkzw8s
 AQKJTPhJozQ/0jP8eneP9qLPjEAktInngDlNV+gUc4cd2uHWA+D6yPbPP1WfCZEgV2
 5G+GoDEs7Lu2A==
From: Kalle Valo <kvalo@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Build regressions/improvements in v5.18-rc1
References: <CAHk-=wg6FWL1xjVyHx7DdjD2dHZETA5_=FqqW17Z19X-WTfWSg@mail.gmail.com>
 <20220404074734.1092959-1-geert@linux-m68k.org>
 <alpine.DEB.2.22.394.2204041006230.1941618@ramsan.of.borg>
Date: Mon, 04 Apr 2022 21:39:15 +0300
In-Reply-To: <alpine.DEB.2.22.394.2204041006230.1941618@ramsan.of.borg> (Geert
 Uytterhoeven's message of "Mon, 4 Apr 2022 10:16:08 +0200 (CEST)")
Message-ID: <874k38u20c.fsf@tynnyri.adurom.net>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Mailman-Approved-At: Fri, 08 Apr 2022 09:48:11 +0200
Cc: linux-wireless@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-usb@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-parisc@vger.kernel.org,
 Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
 linux-rdma@vger.kernel.org, netdev@vger.kernel.org,
 Mike Marciniszyn <mike.marciniszyn@cornelisnetworks.com>,
 linux-um@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-xfs@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-serial@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-media@vger.kernel.org
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

Geert Uytterhoeven <geert@linux-m68k.org> writes:

>> /kisskb/src/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c:
>> error: case label does not reduce to an integer constant: => 3798:2,
>> 3809:2
>
> arm64-gcc5.4/arm64-allmodconfig
> powerpc-gcc5/powerpc-allmodconfig
> powerpc-gcc5/ppc64_book3e_allmodconfig

After v5.17 there were two commits to brcmfmac/sdio.c:

$ git log --oneline v5.17.. drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c
ed26edf7bfd9 brcmfmac: Add BCM43454/6 support
6d766d8cb505 brcmfmac: pcie: Declare missing firmware files in pcie.c

I can't see how either of them could cause this warning. Could something
else cause this or am I missing something?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
