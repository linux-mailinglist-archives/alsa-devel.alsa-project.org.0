Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4521DB24C
	for <lists+alsa-devel@lfdr.de>; Wed, 20 May 2020 13:52:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F43517DD;
	Wed, 20 May 2020 13:51:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F43517DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589975530;
	bh=D3Fkn151Kd850inf1kFwTDY74KV2AL1RkzRv1fI6bbY=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DbpImY20pE8rREeqBD+XY0TVfymZt83oDINgo7Osu37ppxCwa1W7FOAkP1MQgI6WL
	 cdGI9gQ7vjnbqt2cWSyfCaBOlFLPJKXe0YdGuUgZvjUEZ15RV5ddXi5rLisnO05SUg
	 Z0CiUboYSO0hUXOcQcherM3avCFvJDCIKAPrmYlI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 87903F8026F;
	Wed, 20 May 2020 13:50:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 34E09F801F9; Wed, 20 May 2020 13:00:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1CFD1F80090
 for <alsa-devel@alsa-project.org>; Wed, 20 May 2020 13:00:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1CFD1F80090
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49RqX81vz0z9sT3; Wed, 20 May 2020 20:59:52 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@c-s.fr>, Paul Mackerras <paulus@samba.org>
In-Reply-To: <a5945463f86c984151962a475a3ee56a2893e85d.1587407777.git.christophe.leroy@c-s.fr>
References: <a5945463f86c984151962a475a3ee56a2893e85d.1587407777.git.christophe.leroy@c-s.fr>
Subject: Re: [PATCH 1/5] drivers/powerpc: Replace _ALIGN_UP() by ALIGN()
Message-Id: <158997212813.943180.8258248178215435632.b4-ty@ellerman.id.au>
Date: Wed, 20 May 2020 20:59:52 +1000 (AEST)
X-Mailman-Approved-At: Wed, 20 May 2020 13:50:17 +0200
Cc: linux-fbdev@vger.kernel.org, kvm@vger.kernel.org,
 alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
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

On Mon, 20 Apr 2020 18:36:34 +0000 (UTC), Christophe Leroy wrote:
> _ALIGN_UP() is specific to powerpc
> ALIGN() is generic and does the same
> 
> Replace _ALIGN_UP() by ALIGN()

Applied to powerpc/next.

[1/5] drivers/powerpc: Replace _ALIGN_UP() by ALIGN()
      https://git.kernel.org/powerpc/c/7bfc3c84cbf5167d943cff9b3d2619dab0b7894c
[2/5] powerpc: Replace _ALIGN_DOWN() by ALIGN_DOWN()
      https://git.kernel.org/powerpc/c/e96d904ede6756641563d27daa746875b478a6c8
[3/5] powerpc: Replace _ALIGN_UP() by ALIGN()
      https://git.kernel.org/powerpc/c/b711531641038f3ff3723914f3d5ba79848d347e
[4/5] powerpc: Replace _ALIGN() by ALIGN()
      https://git.kernel.org/powerpc/c/d3f3d3bf76cfb04e73436a15e3987d3573e7523a
[5/5] powerpc: Remove _ALIGN_UP(), _ALIGN_DOWN() and _ALIGN()
      https://git.kernel.org/powerpc/c/4cdb2da654033d76e1b1cb4ac427d9193dce816b

cheers
