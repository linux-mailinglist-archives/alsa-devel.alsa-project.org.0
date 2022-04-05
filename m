Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D6E4F8FD9
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Apr 2022 09:51:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4424818D8;
	Fri,  8 Apr 2022 09:50:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4424818D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649404266;
	bh=sfI+F1qddgBQPEPVyPm4UsT8iPzrWXdjhWe583jbPNo=;
	h=From:To:Subject:In-Reply-To:References:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IfFk7jMK1L+AXyRtbuOEPmjTyXrRKUTLg8jzmoNYCzwyv34GhOFVEmcA4XbzovdwB
	 vzsUXCqlVd99y7NdJ5iUYRlYbRuhl9oC2wkTqSujZIZspQS6Kd3/t+kOkmRQhh8O2L
	 zYfpDaL/lEnanSBR38JlXtzlh/YsiviCqBhZ1R3w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C0C48F80537;
	Fri,  8 Apr 2022 09:48:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7EAB1F8016A; Tue,  5 Apr 2022 08:52:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2F944F800D1
 for <alsa-devel@alsa-project.org>; Tue,  5 Apr 2022 08:52:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F944F800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="V/qs96Fw"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id AFA87B81B9C;
 Tue,  5 Apr 2022 06:52:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5887BC340F3;
 Tue,  5 Apr 2022 06:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649141561;
 bh=sfI+F1qddgBQPEPVyPm4UsT8iPzrWXdjhWe583jbPNo=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=V/qs96FwacDoAwIb3AYjsXmHxIyAPgkVCDF70o06rl9Kv/EU36wYnE2B+iVWmFDuY
 9yuhSTxtp1RApbos0thzGGcgBcYzB4OUjwwadhMoCk9ddnMLEKl7z5ojHVyxLNPTxe
 fkI47UjfZEnf1/Ud4Zb2n1JXmLeINpIf17so9GlwWdiyUMNfRV7wQ5S+MxBnAEYklV
 Y8YdKnoXbq3CdeKDF/1PwekiJc2XNSMWQ0QvtapOIX7H8ZI+dMggm5cQNjfN6CVOOX
 7Pm2r4QROcmMfAGlnaeACUWbHHdwgaBx6T+/ZTGZ0SVcsrXuQJQPOhC5ncYhaHg04Y
 CE7JnbN9mYeEw==
From: Kalle Valo <kvalo@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Build regressions/improvements in v5.18-rc1
In-Reply-To: <CAMuHMdV_-3TOHYehUsHeqwHjQtzN1Ot886K7vwPr4P-4u8eehw@mail.gmail.com>
 (Geert Uytterhoeven's message of "Tue, 5 Apr 2022 08:46:06 +0200")
References: <CAHk-=wg6FWL1xjVyHx7DdjD2dHZETA5_=FqqW17Z19X-WTfWSg@mail.gmail.com>
 <20220404074734.1092959-1-geert@linux-m68k.org>
 <alpine.DEB.2.22.394.2204041006230.1941618@ramsan.of.borg>
 <874k38u20c.fsf@tynnyri.adurom.net>
 <CAMuHMdV_-3TOHYehUsHeqwHjQtzN1Ot886K7vwPr4P-4u8eehw@mail.gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
Date: Tue, 05 Apr 2022 09:52:33 +0300
Message-ID: <87czhwrphq.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Mailman-Approved-At: Fri, 08 Apr 2022 09:48:11 +0200
Cc: linux-wireless <linux-wireless@vger.kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 USB list <linux-usb@vger.kernel.org>, scsi <linux-scsi@vger.kernel.org>,
 Parisc List <linux-parisc@vger.kernel.org>,
 Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
 linux-rdma <linux-rdma@vger.kernel.org>, netdev <netdev@vger.kernel.org>,
 Mike Marciniszyn <mike.marciniszyn@cornelisnetworks.com>,
 linux-um <linux-um@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, linux-xfs@vger.kernel.org,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
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

> On Mon, Apr 4, 2022 at 8:39 PM Kalle Valo <kvalo@kernel.org> wrote:
>> Geert Uytterhoeven <geert@linux-m68k.org> writes:
>> >> /kisskb/src/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c:
>> >> error: case label does not reduce to an integer constant: => 3798:2,
>> >> 3809:2
>> >
>> > arm64-gcc5.4/arm64-allmodconfig
>> > powerpc-gcc5/powerpc-allmodconfig
>> > powerpc-gcc5/ppc64_book3e_allmodconfig
>>
>> After v5.17 there were two commits to brcmfmac/sdio.c:
>>
>> $ git log --oneline v5.17.. drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c
>> ed26edf7bfd9 brcmfmac: Add BCM43454/6 support
>> 6d766d8cb505 brcmfmac: pcie: Declare missing firmware files in pcie.c
>>
>> I can't see how either of them could cause this warning. Could something
>> else cause this or am I missing something?
>
> Doh, I should not have reduced the CC list in the xfs subthread...
>
> The builds above are all gcc-5 builds, so they are affected by the same
> issue as XFS: unsigned constants that don't fit in int are lacking a
> "U" suffix.
>
> I assume Arnd's patch for
> drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c
> fixes this?
> https://lore.kernel.org/all/CAK8P3a0wRiS03imdXk2WbGONkSSczEGdE-ue5ubF6UyyDE9dQg@mail.gmail.com

Great, thanks. I assume Arnd will submit it officially at some point.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
