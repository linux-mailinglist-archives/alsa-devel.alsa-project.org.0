Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA50EE73DE
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Oct 2019 15:42:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4087F1F5D;
	Mon, 28 Oct 2019 15:41:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4087F1F5D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572273737;
	bh=4TATGP8IMY3CQgP1nciBeLT+k+Ywgcz0T2BDGnHBY58=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TNNubPZV+/ffKfYjsTMycoXQszVRB0MS9P+IgDIAcyU6nOQCtgwYrUJb0mbBlwrIX
	 ZPyfh4Oolv26qwQTDPpFjT1JleSRdhXz7YNT3eeElWBDdAngbkON5l52kjVQcNNRcm
	 YbnVq64mtIqXeZLuFuW8+ddxxFquDzcvjluFzD8Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 673B7F803D6;
	Mon, 28 Oct 2019 15:40:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 74B52F803D6; Mon, 28 Oct 2019 15:40:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0A236F800E7
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 15:40:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A236F800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="S9R1oKir"
Received: from localhost (unknown [91.217.168.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 67EFC21721;
 Mon, 28 Oct 2019 14:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1572273627;
 bh=dmNS+or+xqTf7DWc23tqF8ino6TFJyoztCnlmTog0ZQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=S9R1oKirOJsZSdHSDJ75V+onIuAjbZ8FC4w9OUTpOjJSdOG4HkaXhCSG0fyBc7tsL
 8SoAd6V/tmB0sb3JpogsUSsxakuGaFtjrrkbpIZ7iQaIrL5ZaYr2vCWd7qYfe7UkMa
 6227OncaKO6YJYgplKfSHvj3J4uuRTDpVP1BCOv8=
Date: Mon, 28 Oct 2019 15:40:24 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20191028144024.GA120200@kroah.com>
References: <000000000000f838060595f602a7@google.com>
 <s5hr22xau8f.wl-tiwai@suse.de> <20191028133050.GA13691@kroah.com>
 <s5himo9as9j.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <s5himo9as9j.wl-tiwai@suse.de>
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

On Mon, Oct 28, 2019 at 02:55:52PM +0100, Takashi Iwai wrote:
> On Mon, 28 Oct 2019 14:30:50 +0100,
> Greg KH wrote:
> > 
> > On Mon, Oct 28, 2019 at 02:13:20PM +0100, Takashi Iwai wrote:
> > > On Mon, 28 Oct 2019 11:32:07 +0100,
> > > syzbot wrote:
> > > > 
> > > > Uninit was stored to memory at:
> > > >  kmsan_save_stack_with_flags mm/kmsan/kmsan.c:151 [inline]
> > > >  kmsan_internal_chain_origin+0xbd/0x180 mm/kmsan/kmsan.c:319
> > > >  __msan_chain_origin+0x6b/0xd0 mm/kmsan/kmsan_instr.c:179
> > > >  parse_term_proc_unit+0x73d/0x7e0 sound/usb/mixer.c:896
> > > >  __check_input_term+0x13ef/0x2360 sound/usb/mixer.c:989
> > > 
> > > So this comes from the invalid descriptor for a processing unit, and
> > > it's very likely the same issue as already spotted -- the validator up
> > > to 5.3-rc4 had a bug that passed the invalid descriptor falsely.
> > > This should have been covered by 5.3-rc5, commit ba8bf0967a15 ("ALSA:
> > > usb-audio: Fix copy&paste error in the validator").
> > 
> > SHould we be backporting the validator to any older kernels as well?
> 
> Yes, that would be nice.  I didn't mark them for stable just because
> they are a bit largish and wanted to let them tested for 5.4 for a
> while.
> 
> The following commits are relevant (from top/old to bottom/new).
> 
> 57f8770620e9b51c61089751f0b5ad3dbe376ff2
>     ALSA: usb-audio: More validations of descriptor units
> 68e9fde245591d18200f8a9054cac22339437adb
>     ALSA: usb-audio: Simplify parse_audio_unit()
> 52c3e317a857091fd746e15179a637f32be4d337
>     ALSA: usb-audio: Unify the release of usb_mixer_elem_info objects
> b8e4f1fdfa422398c2d6c47bfb7d1feb3046d70a
>     ALSA: usb-audio: Remove superfluous bLength checks
> e0ccdef92653f8867e2d1667facfd3c23699f540
>     ALSA: usb-audio: Clean up check_input_term()
> 60849562a5db4a1eee2160167e4dce4590d3eafe
>     ALSA: usb-audio: Fix possible NULL dereference at create_yamaha_midi_quirk()
> b39e077fcb283dd96dd251a3abeba585402c61fe
>     ALSA: usb-audio: remove some dead code
> ba8bf0967a154796be15c4983603aad0b05c3138
>     ALSA: usb-audio: Fix copy&paste error in the validator
> 

Thanks, I'll look at these for the next round of kernels.

greg k-h
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
