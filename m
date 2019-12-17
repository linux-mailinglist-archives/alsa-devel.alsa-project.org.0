Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2275D12323A
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Dec 2019 17:21:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF9231669;
	Tue, 17 Dec 2019 17:20:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF9231669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576599676;
	bh=vWbFntBaXA8oqpF9fDtV4+b4HHKcFjXmNlvJd3632Bw=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dsv+/1W3jZz4TG3PD0MwCSXSCAeoZ832nmg7mcnZugGxjpStHjtSTt1o350fytVLS
	 GwNVfFSrkGWLOvjtPMyLZPQEceMgU1udN5+SLtgI6vN/saXNFq+QfBayS4UKJakVQ7
	 swNkypCMlfWeNCpIS5OUuqopSmciga+Ap1Jm0p/A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5BA30F80256;
	Tue, 17 Dec 2019 17:19:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 10085F80100; Tue, 17 Dec 2019 17:19:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_NONE,
 SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webclient5.webclient5.de (webclient5.webclient5.de
 [136.243.32.184])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DFA6AF80100
 for <alsa-devel@alsa-project.org>; Tue, 17 Dec 2019 17:19:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DFA6AF80100
Received: from aquila.ladisch.de (unknown [46.114.35.235])
 by webclient5.webclient5.de (Postfix) with ESMTPSA id 79D9D55969B1;
 Tue, 17 Dec 2019 17:19:26 +0100 (CET)
To: Takashi Iwai <tiwai@suse.de>
References: <20191217081448.1144-1-tiwai@suse.de>
From: Clemens Ladisch <clemens@ladisch.de>
Message-ID: <37690bd6-8fbf-8bdf-b1d8-bedf5d633a36@ladisch.de>
Date: Tue, 17 Dec 2019 17:18:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191217081448.1144-1-tiwai@suse.de>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.101.4 at webclient5
X-Virus-Status: Clean
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [PATCH] ALSA: cmipci: Allow disabling MPU port via
 module option
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

Takashi Iwai wrote:
> Patrick May reported that his sound card with CMI8378 chip causes a
> crash / reboot when accessing the MIDI port that isn't actually
> present on the board.  [...]
> Although fixing the unexpected reboot would be the best solution, it's
> not so trivial to identify the cause.

There was a similar problem in the CMI8788 driver:
https://git.kernel.org/linus/f1bc07af9a9e
https://bugtrack.alsa-project.org/alsa-bug/view.php?id=4496 (does this still exist?)

When reading a register repeatedly, the chip sometimes does not
complete the PCI transaction.  Apparently, mainboard PCI chipsets
ignore this error, but PCIe/PCI bridges generate a machine check
exception in this case.

When writing MIDI data to a MPU-401-like device, the driver regularly
polls the status register.  I expect that this will blow up with any
C-Media chip on a card with a PCIe/PCI bridge, regardless of whether
a MIDI port exists.

(I wonder if this can be triggered with snd_pcm_avail() in a loop.
Maybe it happens only for byte accesses, or nobody has yet found out.)

> As default, the MPU port is still enabled

It might be a good idea to disable it by default if the parent
bridge is an ASM1083.


Regards,
Clemens
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
