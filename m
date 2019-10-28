Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D17DEE735D
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Oct 2019 15:08:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 508531F4C;
	Mon, 28 Oct 2019 15:07:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 508531F4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572271713;
	bh=bo4poG0YFn64A358F9dCvIrVjpgAsQ8RURvCBB+nupA=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c9zHDu/4d9/AbsyIPPU1AHJuq3hrUHi9+61YZaqQzpBWRjZGIrAdldnjRoqnb4HaK
	 ZcX2lf0GgIKYOjk0jFzmYuFFfUMVU8n5RzrAI5ICGtxgbuimpGaRVCr+N2OO4ZquS5
	 THqrYDc9z/f6vSYu6iE56JwzEo83pmJD+IXWFDb8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 756C9F802BD;
	Mon, 28 Oct 2019 15:06:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A4D1AF80361; Mon, 28 Oct 2019 15:06:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 40BD5F80145
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 15:06:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40BD5F80145
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="zbT5L1eH"
Received: from localhost (unknown [91.217.168.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C812620873;
 Mon, 28 Oct 2019 13:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1572269452;
 bh=Q4aTENSogO5dIUk61tZ+mKng+1PdVCEMMsHb/lYON2w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=zbT5L1eHkeWMiJ7d35cXaAKdgbCDLGGfIdru6dSJRHiWLiDqpQJCHV4Is0NGz914Y
 W27fseMJaz3ZPyVyiHLeXzYiaHwXNMBTDdNompmkd6xpWv2Q00cywIlqCl6gB+GlmV
 7ylMyirXSq0aERB7GU7/+ezvoTR7TLXaMSpV3LQA=
Date: Mon, 28 Oct 2019 14:30:50 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20191028133050.GA13691@kroah.com>
References: <000000000000f838060595f602a7@google.com>
 <s5hr22xau8f.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <s5hr22xau8f.wl-tiwai@suse.de>
User-Agent: Mutt/1.12.2 (2019-09-21)
Cc: alsa-devel@alsa-project.org, wang6495@umn.edu, yuehaibing@huawei.com,
 tiwai@suse.com, syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 glider@google.com, allison@lohutok.net,
 syzbot <syzbot+8f2612936028bfd28f28@syzkaller.appspotmail.com>,
 tglx@linutronix.de, benquike@gmail.com, dan.carpenter@oracle.com
Subject: Re: [alsa-devel] KMSAN: uninit-value in get_term_name
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Mon, Oct 28, 2019 at 02:13:20PM +0100, Takashi Iwai wrote:
> On Mon, 28 Oct 2019 11:32:07 +0100,
> syzbot wrote:
> > 
> > Uninit was stored to memory at:
> >  kmsan_save_stack_with_flags mm/kmsan/kmsan.c:151 [inline]
> >  kmsan_internal_chain_origin+0xbd/0x180 mm/kmsan/kmsan.c:319
> >  __msan_chain_origin+0x6b/0xd0 mm/kmsan/kmsan_instr.c:179
> >  parse_term_proc_unit+0x73d/0x7e0 sound/usb/mixer.c:896
> >  __check_input_term+0x13ef/0x2360 sound/usb/mixer.c:989
> 
> So this comes from the invalid descriptor for a processing unit, and
> it's very likely the same issue as already spotted -- the validator up
> to 5.3-rc4 had a bug that passed the invalid descriptor falsely.
> This should have been covered by 5.3-rc5, commit ba8bf0967a15 ("ALSA:
> usb-audio: Fix copy&paste error in the validator").

SHould we be backporting the validator to any older kernels as well?

thanks,

greg k-h
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
