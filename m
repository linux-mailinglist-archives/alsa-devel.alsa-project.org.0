Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7391A1DEE66
	for <lists+alsa-devel@lfdr.de>; Fri, 22 May 2020 19:38:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3E481898;
	Fri, 22 May 2020 19:37:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3E481898
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590169086;
	bh=L8OHkKiGCB/f+IXGOvXlrA5dVZpPxKv0KWhPeCEfQiU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bzkpNpWJv+3dSMZmuorpqXx4sWSzKTCLeq88ZY7w8G1l+wGXPIdpuLdOI4TiwprTG
	 tEs8SGgWwvvqdgC0+S0TH5v87hEH3qT2kw91eJYksE6buTUSvB7Z9TGB9WeOXiDH28
	 Pm+7WRL4NmKst0f7d91wUBLhoO94zkWnJLz7fPSw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D5A65F80216;
	Fri, 22 May 2020 19:36:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6270AF80213; Fri, 22 May 2020 19:36:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FREEMAIL_FROM,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0AFEFF80140
 for <alsa-devel@alsa-project.org>; Fri, 22 May 2020 19:36:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0AFEFF80140
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=gmx.net header.i=@gmx.net
 header.b="BeLXgfkA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1590168963;
 bh=L8OHkKiGCB/f+IXGOvXlrA5dVZpPxKv0KWhPeCEfQiU=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=BeLXgfkAIYebk7dPy/b/dHEAFaJjpOKqtoTzjnKVAW06ogNORfIBepC20GqIxMD4h
 zFf8XH+aqqUE9rOOAVt7tRhQ8iAzw1u9Fn/jzKYz3gz5wy76dVx5rnFmiyYWgXqG/8
 zS41n3XBx7P/lOPsGptgJBPdUEv4ekgyuFVGwTos=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ubuntu ([83.52.229.196]) by mail.gmx.com (mrgmx004
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1MmULr-1jCEVO1rBh-00iRzC; Fri, 22
 May 2020 19:36:03 +0200
Date: Fri, 22 May 2020 19:35:49 +0200
From: Oscar Carter <oscar.carter@gmx.com>
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>, keescook@chromium.org,
 mchehab@kernel.org, clemens@ladisch.de, tiwai@suse.de, perex@perex.cz
Subject: Re: [PATCH 0/2] firewire: obsolete cast of function callback toward
 CFI
Message-ID: <20200522173549.GA3059@ubuntu>
References: <20200520064726.31838-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200520064726.31838-1-o-takashi@sakamocchi.jp>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Provags-ID: V03:K1:FBWJEV1Z+urCsYOxGe/qn+1ueZnIfzXJgXzE4sYXx2E6pTYxzTv
 z+vuWi/c+ugAv7NWN04Ae5Py94IM94abNLP1X0yCKYKEFIpu63slErlj9Fhy71e4OHzYglB
 +lQqRKUx5IjQ07W1dZ28vMOnrvIxckwJzFlxHK/OLsyentYpWqqW6H0z/J+wo+Rho3M4EOR
 yy6Jf31X/2ADUl48LCMBA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:qQZnxhBV1OE=:rHKO2Cr/IEWABaxDAPPKV6
 o3uezfePqPg8YTDyafPdmkb+4ckMJPNxVRQkNHKzYeHo+Os6qkNQUSxxTHCmQFDhfBQb0jNHh
 BdBqwZG+aGRrCkMv5CdCwkQ/d4GyQt9bgCR4jlFZ3jv49X5MW7L0b7Dmpbpa8g1BZ6mcyNDVH
 JFRDJGUlEAZFnnpwaHhJCBD3LS5z+DD4ubbcGszKZYshC6FDJERTbifdP0VSzin5thJm4wMLl
 s+Pqk3W+LI/3M2B2Ot5cHoHa2TmxhrYXisqjRtZNNrvr2G9PUbJxPUV2jRf/9MlCz7zvtx7w2
 IhWpaXJbAvi/KoT2F5zMykbYL3rrOmkRqwmvw8cQZmEtJgUUIBZdOEgJU0WVGBTf4IQou6u8y
 yfBXCYXnSXmc7UqZn+Xr+wkFqRiBd4AEjqzDYOIMOOproICCTYf3XOvSuf+jdUXvW8nbbY3M9
 3lvNG0t8kNHp/P/0p5WO3EsA7AObaFik3wTY32uWwIJH4b8U4h7wbNSR+0TWc76+PLLSZWnnw
 WFpv4AzhWrXeSCXgpeabnNO9lDgc3aDUW3oMeIO8NTErhmEJztO/Md2W3YtHrt4rXPankumz9
 lMAQTUARY+TKYggs6JnZQrfRsmfP4N/6EjPWvVbp4Xi333kuxYEGyoMLu4yHcXZJHi4mAaihJ
 EfJyvM+pNSejc0KDT/mrCEuZ7ODbAXJsIo6FYU83i7jv+2kVtURdOgPdsTv3bgnC/9gU5Wo2p
 qO8l/TM+osXKI7V7SBWWh8XsBndANr8TxGGJ9SS4gFG2ZmV5cXw5KsganYsF0rT/b804BTW/p
 bL0mRLhw5i+gXNVqYUrA7hfSTNq83sw1cJHT6P6L+T+VHC6QLeQo1X+scEuKtTeQIL+A/zibh
 aikX9N2HOSiKma4BOujmTmP2sFZbygP3CmxmYE5oI1eg8fsxyzzT1fsM4MaKQ1VwueAxyPxv/
 QLQUlcvW09MYGaIgN2THxOeQSa8zuDJWMglQ19+o3DqtjSGi/H0BAtvukYx46jFOUu1kwDtTg
 ooprer23ED/ADxKx4B7Ym+/ptHya3yxwKz/9nJ1xPgCMd7p8bbbtKAnowRofqh5PdmFBWuryE
 sIkYM2rpcNAYV4c+6ui8wgVr9kWwnSx8bqUTEKF2biSG45/AE4bEItsUyOXejHsTjvmTSQZ4m
 opPsBqRorwR0fA0Y4Xif41sZWA/dty4A+hdK2FyzhaEC5O4xhBisLmMxCbRO/tAqcGH+ysXFZ
 ZmLIFobfRvFTtpOLP
Content-Transfer-Encoding: quoted-printable
Cc: alsa-devel@alsa-project.org, Oscar Carter <oscar.carter@gmx.com>,
 kernel-hardening@lists.openwall.com, linux-kernel@vger.kernel.org,
 stefanr@s5r6.in-berlin.de, levonshe@gmail.com,
 linux1394-devel@lists.sourceforge.net, linux-media@vger.kernel.org
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

Hi,

On Wed, May 20, 2020 at 03:47:24PM +0900, Takashi Sakamoto wrote:
> Hi,
>
> Oscar Carter works for Control Flow Integrity build. Any cast
> of function callback is inconvenient for the work. Unfortunately,
> current code of firewire-core driver includes the cast[1] and Oscar
> posted some patches to remove it[2]. The patch is itself good. However,
> it includes changes existent kernel API and all of drivers as user
> of the API get affects from the change.
>
> This patchset is an alternative idea to add a new kernel API specific
> for multichannel isoc context. The existent kernel API and drivers is
> left as is.
>
> Practically, no in-kernel drivers use the additional API. Although the
> API is exported in the patchset, it's better to discuss about unexportin=
g
> the API.
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/t=
ree/drivers/firewire/core-cdev.c#n985
> [2] https://lore.kernel.org/lkml/20200519173425.4724-1-oscar.carter@gmx.=
com/
>
> Regards
>
> Takashi Sakamoto (2):
>   firewire-core: add kernel API to construct multichannel isoc context
>   firewire-core: obsolete cast of function callback
>
>  drivers/firewire/core-cdev.c | 44 +++++++++++++++++++-----------------
>  drivers/firewire/core-iso.c  | 17 ++++++++++++++
>  include/linux/firewire.h     |  3 +++
>  3 files changed, 43 insertions(+), 21 deletions(-)
>
> --
> 2.25.1
>
Thanks for your work and new proposal. I've done a test build an it cleans=
 the
-Wcast-function-type warning without the need to change the current API. S=
o, it
looks good to me.

Thanks,
Oscar Carter
