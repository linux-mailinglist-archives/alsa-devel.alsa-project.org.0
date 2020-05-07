Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1A91C84BC
	for <lists+alsa-devel@lfdr.de>; Thu,  7 May 2020 10:24:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30CB517F4;
	Thu,  7 May 2020 10:24:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30CB517F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588839896;
	bh=VbhDvdY34Jcu5KiAN1pZ92Y1fd0IZzNk42+LVNukGeI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eO/rjF4eox4cP1FF2dziw3ZRZxQ6gx7aZl+HPSjcHlMiKi0u0JZzvjgwepyeUCX01
	 y5aeoy+g1HuKfAsRcV+1wDPXgA6aw5X7dOmr146G9Wi6KYwp67I2ismj1JzzGB+OJf
	 Sx2BujHDRg11UKc1TIbRyNYJfNkQzg3UVTis8TPk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 56A11F800AD;
	Thu,  7 May 2020 10:23:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B318AF8015F; Thu,  7 May 2020 10:23:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 39040F800AD
 for <alsa-devel@alsa-project.org>; Thu,  7 May 2020 10:23:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39040F800AD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="trQNiFUB"
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A425120753;
 Thu,  7 May 2020 08:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588839785;
 bh=VbhDvdY34Jcu5KiAN1pZ92Y1fd0IZzNk42+LVNukGeI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=trQNiFUBXZ5pVsEgPE3dB0CtGTaFJ0lFXJ1UzMHcsJz5mI12GHgK1TEEPCbKBLkUh
 lrkcdPgEPORrl6EmiDft00lZogxyfp5hJ6fJflMgERsTPtiU0dKC22iL62snqJ+4YQ
 RgJ8ohvn4YNU7Kkr6fFLqimacuJWzvsf5rLirVMw=
Date: Thu, 7 May 2020 10:23:02 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: butt3rflyh4ck <butterflyhuangxx@gmail.com>
Subject: Re: KASAN: use-after-free Write in snd_rawmidi_kernel_write1
Message-ID: <20200507082302.GF1024567@kroah.com>
References: <CAFcO6XMGT42wFBxEa01Ee5Msuecm+WiXnn4rc-VWkC4vTzycPg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFcO6XMGT42wFBxEa01Ee5Msuecm+WiXnn4rc-VWkC4vTzycPg@mail.gmail.com>
Cc: security@kernel.org, syzkaller <syzkaller@googlegroups.com>, tiwai@suse.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

On Thu, May 07, 2020 at 04:04:25PM +0800, butt3rflyh4ck wrote:
> I report a bug (in linux-5.7-rc1) found by syzkaller.
> 
> kernel config: https://github.com/butterflyhack/syzkaller-fuzz/blob/master/v5.7.0-rc1.config
> reproducer: https://github.com/butterflyhack/syzkaller-fuzz/blob/master/repro.cprog
> 
> I test the reproducer in linux-5.7-rc4 and crash too.

Great, care to create a fix for this and send it to the proper
maintainers?  That's the best way to get it fixed, otherwise it just
goes in the file with the rest of the syzbot reports we are burried
under.

thanks,

greg k-h
