Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79AF4578D4E
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Jul 2022 00:05:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2595716C5;
	Tue, 19 Jul 2022 00:04:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2595716C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658181931;
	bh=3JxZkLM8MBszfDbDjwosYrF471wfmGyjogJnExYKUPY=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CCHsX/JMtUPATl/mruKQt9oH9gSQcjuTU9JRKBlzQQ7fupJ3KXf3jFFpMLwR8OWWg
	 Ts6SYgWdpwECDLDLmvZmQVqOwH1qlY2qeR4d54ZFnmXTOAnGiISLVaS23mM9oKyMq+
	 RnhqsWlH5YCkic0gfjiF/tMAFV+tfGH5EJYe6saI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D854F8050F;
	Tue, 19 Jul 2022 00:04:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4B0BCF80508; Tue, 19 Jul 2022 00:04:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_65,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3DAB9F800F5
 for <alsa-devel@alsa-project.org>; Tue, 19 Jul 2022 00:04:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3DAB9F800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="BSlcJtet"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 668A0B8167A;
 Mon, 18 Jul 2022 22:04:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0E7DC341C0;
 Mon, 18 Jul 2022 22:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658181860;
 bh=3JxZkLM8MBszfDbDjwosYrF471wfmGyjogJnExYKUPY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BSlcJtetWKT66UYJ5KpIsH1zskh3T2ZqU/URAT5Y8TZeNrDkyU4XdYFBS1UCq8HGs
 OeAcEtyYH5QPq1S0Yf81A5dfERgEQxdiY1nFXXqysSevgo4VJ10WCEzxjCSTsywggx
 5o3XEpBmhlD+Mj4w7jqRwz28mrK0Ev4Pvv7VC/qnVVpXS6vgAgZnf3vmjMzM//0TM+
 m2PNihIHQjQ8iDbkBmz1rc3GpaRWbkpAqP8iOcdqqB4t+W5qDj3Ykk/sudVMnTAfSN
 MIStUtpzJ2s7xfcOgw526ZqsCKTTUvFKUQGKMYkCj01RTmOKRLDqptGyKlWg1k0DIr
 kQpGkmvYq8x6g==
Date: Mon, 18 Jul 2022 15:04:14 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Thorsten Leemhuis <linux@leemhuis.info>
Subject: Re: [PATCH] docs: driver-api: firmware: add driver firmware
 guidelines.
Message-ID: <20220718150414.1767bbd8@kernel.org>
In-Reply-To: <97e5afd3-77a3-2227-0fbf-da2f9a41520f@leemhuis.info>
References: <20220718072144.2699487-1-airlied@gmail.com>
 <97e5afd3-77a3-2227-0fbf-da2f9a41520f@leemhuis.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-wireless@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-doc@vger.kernel.org, Dave Airlie <airlied@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>, dri-devel@lists.sf.net,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, mcgrof@kernel.org,
 netdev@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 gregkh@linuxfoundation.org, Dave Airlie <airlied@redhat.com>,
 torvalds@linux-foundation.org, linux-media@vger.kernel.org
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

On Mon, 18 Jul 2022 11:33:11 +0200 Thorsten Leemhuis wrote:
> > If the hardware isn't
> > +  enabled by default or under development,  
> 
> Wondering if it might be better to drop the "or under development", as
> the "enabled by default" is the main part afaics. Maybe something like
> "If support for the hardware is normally inactive (e.g. has to be
> enabled manually by a kernel parameter)" would be better anyway.

It's a tricky one, I'd say something like you can break the FW ABI
"until HW becomes available for public consumption" or such.
I'm guessing what we're after is letting people break the compatibility
in early stages of the product development cycles. Pre-silicon and
bring up, but not after there are products on the market?
