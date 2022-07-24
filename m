Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B761E57F5BA
	for <lists+alsa-devel@lfdr.de>; Sun, 24 Jul 2022 17:23:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1DE3E82E;
	Sun, 24 Jul 2022 17:22:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1DE3E82E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658676190;
	bh=m3sNxePq/vqzVQD5ZtJxunFIrS8mQoJNH2c9YEZNshw=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HtOrtJLSZ7mZ1hsDmq/1eUwKZDxdRngfFgLF2UbxqHY0pxIdUcLwNkUa51oZaIpDa
	 z9LdlCx9uvTywMPWeUJZZ2bEPOw00PX+gfcy68svQc1Ec8XKeaBIFj9AcsbXwmcy07
	 jGpNRB9UsSXtAAru4LeinnBBuwnsxWEOydD4s+Pc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8BF50F80104;
	Sun, 24 Jul 2022 17:22:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A5583F8016A; Sun, 24 Jul 2022 17:22:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from sipsolutions.net (s3.sipsolutions.net
 [IPv6:2a01:4f8:191:4433::2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C0830F80104
 for <alsa-devel@alsa-project.org>; Sun, 24 Jul 2022 17:22:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0830F80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net
 header.b="FFGLhfM7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=RG/BJ3Nv9HakG4zVWqCXWL3uZp6IBIbE/vdVZRgFNzw=; 
 t=1658676125; x=1659885725; b=FFGLhfM7JqPxgMPWJIFu/9vn1EUcGIwiTIBHU3YUYXMpV8l
 xEgSzlqFqVCJ5BpngJoK5jdSlSB4nOmVuPXF1W9pBUYCA+RcFowBzowWXX01sfx3nePfuDsoUXMS+
 SxoXLvEGjQy6bPCrz+StoSR15RcTwX9RMxZkXpsOFmL+EMBt5lk96vcMjM+IBL2ctgA/zQCYo05b0
 vUlmWQfn2Ev6F4BMjpIyE+NoEbosuWZlbwZ0hBqiBTHOkt2JSXXzdokuSQmMpvCJyor7rHzYlIZpr
 zPnccTuoLv4z/nLGnXnbKQp/8iYiye98Hyej9LlGEk2YSU5kZxdr1LwbEiayahJg==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.96) (envelope-from <johannes@sipsolutions.net>)
 id 1oFdQP-006zmj-2a; Sun, 24 Jul 2022 17:21:45 +0200
Message-ID: <4f8ab262d98ba2a4d0e106e127c171e75b52ad47.camel@sipsolutions.net>
Subject: Re: [PATCH] docs: driver-api: firmware: add driver firmware
 guidelines. (v3)
From: Johannes Berg <johannes@sipsolutions.net>
To: Dave Airlie <airlied@gmail.com>, torvalds@linux-foundation.org, Jonathan
 Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 gregkh@linuxfoundation.org, Daniel Vetter <daniel@ffwll.ch>,
 mcgrof@kernel.org
Date: Sun, 24 Jul 2022 17:21:43 +0200
In-Reply-To: <20220721044352.3110507-1-airlied@gmail.com>
References: <20220721044352.3110507-1-airlied@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.3 (3.44.3-1.fc36) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
Cc: alsa-devel@alsa-project.org, netdev@vger.kernel.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 dri-devel@lists.sf.net, Dave Airlie <airlied@redhat.com>,
 Harry Wentland <harry.wentland@amd.com>, linux-media@vger.kernel.org
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

On Thu, 2022-07-21 at 14:43 +1000, Dave Airlie wrote:
>=20
> +Users switching to a newer kernel should *not* have to install newer
> +firmware files to keep their hardware working. At the same time updated
> +firmware files must not cause any regressions for users of older kernel
> +releases.

That seems sane, and certainly something we've done in wireless in the
past.

> +* Firmware files shall be designed in a way that it allows checking for
> +  firmware ABI version changes. It is recommended that firmware files be
> +  versioned with at least a major/minor version. It is suggested that
> +  the firmware files in linux-firmware be named with some device
> +  specific name, and just the major version. The firmware version should
> +  be stored in the firmware header, or as an exception, as part of the
> +  firmware file name,

Eh, I went to write a whole paragraph here and then read it again ...
Maybe this should say "[t]he _full_ firmware version", to contrast with
the previous sentence mentioning the "major version".

>  in order to let the driver detact any non-ABI

typo - 'detect'

> +  fixes/changes. The firmware files in linux-firmware should be
> +  overwritten with the newest compatible major version.
>=20

That's also a bit confusing IMHO - did that mean "minor version"? Or
something? I mean ... if you overwrite a file that has the major version
in the filename then by definition it is the same major version?

> +  This means no major version bumps without the kernel retaining
> +  backwards compatibility for the older major versions.

Strictly reading this might require aeons of support for firmware
version, if you have a release cadence of them like every 6 weeks for a
new _major_ version (yes, because APIs change), then that's rather
harsh. In practice we've often done this, but I think some reasonable
cut-off could/should be there, such as dropping support after a
reasonably long time frame (say a year?)

Often though that's less a question of "does it still work" and rather
one of "do I still support that" and the answer for the latter is
obviously "no" much quicker than the former.

johannes
