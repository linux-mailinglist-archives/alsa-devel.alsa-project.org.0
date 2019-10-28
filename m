Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE92EE6DFA
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Oct 2019 09:22:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7535D1F00;
	Mon, 28 Oct 2019 09:21:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7535D1F00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572250945;
	bh=/VqOqynsgUn0VF2Lxl/YxRaS9nX8JCndVMcNahbrSmI=;
	h=To:From:In-Reply-To:References:Date:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AMI9emcGuCio9B1iXjLKIVx/KQ3YLAfLJ8ABLYVhsGAJ4A0VMg8nzFGEU1NO4yTtq
	 i6RnZ98hx73UDWfsnpyL60qM4j4xfIkNPyc/Jghi2DmOzesJUdgoUXyUZg4jQmtlWt
	 EvKDt+TLukWQfxdSmeFv9mmXITwJEKcHUbtyCKck=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1EFBEF8048E;
	Mon, 28 Oct 2019 09:21:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 619C6F803D6; Mon, 28 Oct 2019 09:21:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=FORGED_SPF_HELO,
 KHOP_HELO_FCRDNS,SPF_HELO_PASS,SPF_NONE autolearn=disabled version=3.4.0
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6975F8011D
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 09:21:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6975F8011D
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 18989422-1500050 for multiple; Mon, 28 Oct 2019 08:21:09 +0000
MIME-Version: 1.0
To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20191028081056.22010-1-tiwai@suse.de>
References: <20191028081056.22010-1-tiwai@suse.de>
Message-ID: <157225086749.26808.5121664839140883561@skylake-alporthouse-com>
User-Agent: alot/0.6
Date: Mon, 28 Oct 2019 08:21:07 +0000
Cc: Jonas Witschel <diabonas@gmx.de>
Subject: Re: [alsa-devel] [PATCH] Revert "ALSA: hda: Flush interrupts on
	disabling"
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

Quoting Takashi Iwai (2019-10-28 08:10:56)
> This reverts commit caa8422d01e983782548648e125fd617cadcec3f.
> 
> It turned out that this commit caused a regression at shutdown /
> reboot, as the synchronize_irq() calls seems blocking the whole
> shutdown.  Also another part of the change about shuffling the call
> order looks suspicious; the azx_stop_chip() call disables the CORB /
> RIRB while the others may still need the CORB/RIRB update.
> 
> Since the original commit itself was a cargo-fix, let's revert the
> whole patch.

You will want to include a link to the bug you may be reintroducing so
you have that information for easy reference later.

Also do you know if you fixed the bug in any other way, because our CI
hasn't reported that GPF since the patch landed.
-Chris
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
