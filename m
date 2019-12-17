Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF73122CE9
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Dec 2019 14:32:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 826E5850;
	Tue, 17 Dec 2019 14:31:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 826E5850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576589558;
	bh=BLkAAQpue8BkX4Sy4FjhdAfCwSDO9iLuXNCgzkre8jY=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MSKys69wNoqvL9dDWMzLxZQNKKlg7azWauEYgryIzkS9PoHv9BHVQTH4dqnKJklZJ
	 uKCBsN398sq9mCaApCV08DbHfsYP3FNeD2nYLh9FrV01e/HxOJtbv2cE4q+GL90kGC
	 eWbe/K5uEiZcHbgsZRvS+IrC3DmUJ97lWsHKi3RA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BBDE9F80256;
	Tue, 17 Dec 2019 14:30:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 866E7F80234; Tue, 17 Dec 2019 14:30:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C8D9EF8020B
 for <alsa-devel@alsa-project.org>; Tue, 17 Dec 2019 14:30:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8D9EF8020B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Q+egFA7f"
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D5D3420717;
 Tue, 17 Dec 2019 13:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576589447;
 bh=Iq7wwjEt29kicSJhEhtg7KMG1eYzpaSwrHdICJOWuCs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Q+egFA7fXn9QWsyYuyWAj2gTR76Hsd+CFh1RgtQcwA8EnNkdWMr3USbE4FUMwMZun
 kxT8nt0s4hUSza5D54oToUVhIJTyHGL7Hhmg+yEElVbDtVaZ27tCLjvUqv8iO2nnhx
 TEZTmuwpyl8EqLZuh7cvXwovGMHSlRIBVH0S1IJ8=
Date: Tue, 17 Dec 2019 14:30:45 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Jia-Ju Bai <baijiaju1990@gmail.com>
Message-ID: <20191217133045.GA3362771@kroah.com>
References: <db47108d-3967-6760-3de2-17bf60741bc2@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <db47108d-3967-6760-3de2-17bf60741bc2@gmail.com>
Cc: alsa-devel@alsa-project.org, LKML <linux-kernel@vger.kernel.org>,
 tiwai@suse.com, rfontana@redhat.com, tglx@linutronix.de, allison@lohutok.net
Subject: Re: [alsa-devel] [BUG] ALSA: seq: a possible
 sleep-in-atomic-context bug in snd_virmidi_dev_receive_event()
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, Dec 17, 2019 at 09:24:21PM +0800, Jia-Ju Bai wrote:
> The driver may sleep while holding a read lock.
> The function call path (from bottom to top) in Linux 4.19 is:
> =

> sound/core/seq/seq_memory.c, 96:
> =A0=A0=A0 copy_from_user in snd_seq_dump_var_event
> sound/core/seq/seq_virmidi.c, 97:
> =A0=A0=A0 snd_seq_dump_var_event in snd_virmidi_dev_receive_event
> sound/core/seq/seq_virmidi.c, 88:
> =A0=A0=A0 _raw_read_lock in snd_virmidi_dev_receive_event
> =

> copy_from_user() can sleep at runtime.
> =

> I am not sure how to properly fix this possible bug, so I only report it.
> =

> This bug is found by a static analysis tool STCheck written by myself.

Patches for this is usually best :)
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
