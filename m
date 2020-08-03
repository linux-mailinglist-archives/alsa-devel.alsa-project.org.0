Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F01623A2CB
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Aug 2020 12:37:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 262D51668;
	Mon,  3 Aug 2020 12:37:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 262D51668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596451071;
	bh=RHkpwyjryi6JHjIPlbhVNIU07EpQjI30NYzZYQUd1Ek=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k7rTITawXK7KnBKRHI+5uOIWrU39oZxYFYTITSlZvL/E1bzkgNGBRpwJ2I1sRDFD0
	 km07vsZG7dQ50SyYmTjZKNfUp2VNHqo2DsfV07rw3bM0imTKu4ulmshJ9L887SZAQZ
	 404yuR+FjJ5NoV+plyrV/busJZIxi3JiU0WBWtio=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F6CAF80148;
	Mon,  3 Aug 2020 12:36:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0A03F80218; Mon,  3 Aug 2020 12:36:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0F14DF80148
 for <alsa-devel@alsa-project.org>; Mon,  3 Aug 2020 12:35:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F14DF80148
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net
 header.b="GPi9DFWT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1596450955;
 s=strato-dkim-0002; d=gerhold.net;
 h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=t1ANuzu9hbGFzPXIEXz8SJSfuIqBra8EUQdOPeq1B3w=;
 b=GPi9DFWTfEUU1qlMR7j+CBbNuNm1NyXihHNr4PfzjfPU5PrwG3XrkjW4OKOTeI+e8F
 h69mRi53mciqG39tIxiNEjMZyBnPgRJrUdUDHt0ZpDoBCXhEjORvY4wlCSHHnSwn/M8S
 5MUJ5EXp01j4z3O+/4vWGOOtWlAS30agMm3f/IE85XgLooZCwuBkTOEzSq8+I+HQkahx
 0Gk9aTxvEyGyvBCxNguwCPODXiu3MiPfaRwDyH1L+4t1h9u4vEKny+50u6sz1NFFBWLs
 OjN12bevEVGdPHBl1hDuLNn5yhu3cMQ3w2bJtIFVZ8+e1uPkoCcP6I3W3jrSFFPn7ajD
 +cEQ==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8j7IcrHBg=="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net by smtp.strato.de (RZmta 46.10.5 DYNA|AUTH)
 with ESMTPSA id Y0939ew73AZgyYI
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 3 Aug 2020 12:35:42 +0200 (CEST)
Date: Mon, 3 Aug 2020 12:35:37 +0200
From: Stephan Gerhold <stephan@gerhold.net>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH 1/3] ASoC: core: Add common helper to parse aux devs from
 device tree
Message-ID: <20200803103537.GA903@gerhold.net>
References: <20200801100257.22658-1-stephan@gerhold.net>
 <1j5za02hlr.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1j5za02hlr.fsf@starbuckisacylon.baylibre.com>
Cc: alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-amlogic@lists.infradead.org
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

On Mon, Aug 03, 2020 at 11:39:44AM +0200, Jerome Brunet wrote:
> When you send multiple patches like that, you should a cover-letter
> describing the overall purpose of the patchset, then the patches
> 
> If you look around on the mailing list this cover is usually starting
> with the subject "[PATCH 0/X]"
> 
> Apart from this, the change looks good to me
> 
> Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
> 

Thanks! I usually do that but I thought in this case the first patch is
descriptive enough for the whole series. I would have just repeated the
same in the cover letter.

Stephan
