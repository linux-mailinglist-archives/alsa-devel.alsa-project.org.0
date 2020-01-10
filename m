Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6539A1379EA
	for <lists+alsa-devel@lfdr.de>; Sat, 11 Jan 2020 00:00:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE54016BA;
	Fri, 10 Jan 2020 23:59:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE54016BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578697226;
	bh=CQtKNwCr/9KQHLpaqK0OJ01sx9wezSb7yhUnQ1VlcoE=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UJXskUyoWrLrUjiY4YtxL8m1RlZEFCCuHZIqVGqprwDjpHKbkCJvlNyUkObj7l6vK
	 4FyfMbq6/mIrSUaKCBGKcdWD0pWE9Jv6jlMy1GVgAcGtNZz5l0RAbZ7aovQ3gC/CXc
	 wTF/QLClJw7nk3ZWoZ6ZBv9gLU4ROp+uYONnaQUs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 95348F8011C;
	Fri, 10 Jan 2020 23:58:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 22090F8011C; Fri, 10 Jan 2020 23:58:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from fontroja.oskuro.net (fontroja.oskuro.net [78.46.213.114])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9DBEEF8010B
 for <alsa-devel@alsa-project.org>; Fri, 10 Jan 2020 23:58:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9DBEEF8010B
Received: from serrella (unknown [154.46.47.222])
 by fontroja.oskuro.net (Postfix) with ESMTPSA id 40F4871972;
 Fri, 10 Jan 2020 23:58:36 +0100 (CET)
Message-ID: <1fbf9bffb1f13e1ea8e1212a633998b9e6380298.camel@debian.org>
From: Jordi Mallach <jordi@debian.org>
To: alsa-devel@alsa-project.org
Date: Fri, 10 Jan 2020 23:58:35 +0100
Organization: Debian Project
User-Agent: Evolution 3.34.1-2+b1 
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.101.4 at fontroja
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-27CA1CFB 
X-CRM114-CacheID: sfid-20200110_235836_577225_5C33FFAB 
X-CRM114-Status: GOOD (   6.13  )
Cc: pkg-alsa-maintainers@lists.alioth.debian.org
Subject: [alsa-devel] ABI breakage in alsa-lib 1.2
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

[Please Cc me on replies, I'm not currently subscribed to alsa-devel]

Hello,

I'm one of the ALSA Debian maintainers, and some weeks ago I looked
into updating our ALSA packages to 1.2.1.

I quickly noticed there's been some fundamental change to libasound2,
one that appears to break ABI and should have warranted an soname bump
at least.

With the split of the snd_tplg API to the new libatopology2, libasound2
has been left missing that part of the API that was part of the
asound.h header, etc. This could have been a somewhat lesser issue if
libasound2 linked to libatopology, but unfortunately this goes in the
other direction, so the ABI and API breakage is not avoided.

I cannot update alsa-lib in this state. I could hack around and patch
it to reinstate the missing api in libasound, but this sounds like pain
and suffering for everyone involved. How should we move forward with
this?

I am sorry I only come up with this 2 months after the release when I
had identified the problem many weeks ago, I've been extremely busy.

Thanks,
Jordi
-- 
Jordi Mallach <jordi@debian.org>
Debian Project

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
