Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03989577EC2
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Jul 2022 11:34:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8CA0F16F8;
	Mon, 18 Jul 2022 11:33:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8CA0F16F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658136870;
	bh=luCXW0I67ppYy8wYNBlDF4Lt4o+6dkDPrJAJkAuQy+c=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EXqjgi61yhash97gzJ0eIIHPCOxY6Ab+P045kfsjjSwaj4dP1hiM2W7ns4YrhQ/l6
	 K3U22jpX+m0SVHF9gBifmHOZACNYhM3Yb6vbzypmdAmRZ4IkSqkowgfKykoFxG8NS8
	 HZOzHCE/Ac4Eq8PwHsysj7DQ4tiQKLbLQupIAKt0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C4BCF80095;
	Mon, 18 Jul 2022 11:33:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DB9BEF80508; Mon, 18 Jul 2022 11:33:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [IPv6:2a01:488:42:1000:50ed:8234::])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F2DBEF80095
 for <alsa-devel@alsa-project.org>; Mon, 18 Jul 2022 11:33:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2DBEF80095
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1oDN7o-0004Gz-Cy; Mon, 18 Jul 2022 11:33:12 +0200
Message-ID: <97e5afd3-77a3-2227-0fbf-da2f9a41520f@leemhuis.info>
Date: Mon, 18 Jul 2022 11:33:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] docs: driver-api: firmware: add driver firmware
 guidelines.
Content-Language: en-US
To: Dave Airlie <airlied@gmail.com>, torvalds@linux-foundation.org,
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 gregkh@linuxfoundation.org, Daniel Vetter <daniel@ffwll.ch>,
 mcgrof@kernel.org
References: <20220718072144.2699487-1-airlied@gmail.com>
From: Thorsten Leemhuis <linux@leemhuis.info>
In-Reply-To: <20220718072144.2699487-1-airlied@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1658136806;af847fb7;
X-HE-SMSGID: 1oDN7o-0004Gz-Cy
Cc: alsa-devel@alsa-project.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, dri-devel@lists.sf.net,
 Dave Airlie <airlied@redhat.com>, linux-media@vger.kernel.org
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


On 18.07.22 09:21, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
> 
> A recent snafu where Intel ignored upstream feedback on a firmware
> change, led to a late rc6 fix being required. In order to avoid this
> in the future we should document some expectations around
> linux-firmware.
> 
> I was originally going to write this for drm, but it seems quite generic
> advice.
> 
> I'm cc'ing this quite widely to reach subsystems which use fw a lot.

Thx for this, I kinda put "add a few words about firmware into
Documentation/process/handling-regressions.rst" on my todo list already,
but having a separate document is likely better.

Took a quick look, here are a few suggestions for your consideration.

> [...]
> diff --git a/Documentation/driver-api/firmware/firmware-usage-guidelines.rst b/Documentation/driver-api/firmware/firmware-usage-guidelines.rst
> new file mode 100644
> index 000000000000..34d2412e78c6
> --- /dev/null
> +++ b/Documentation/driver-api/firmware/firmware-usage-guidelines.rst
> @@ -0,0 +1,34 @@
> +===================
> +Firmware Guidelines
> +===================
> +
> +Drivers that use firmware from linux-firmware should attempt to follow
> +the rules in this guide.

How about spelling out the main aspect first clearly before going into
the details about its consequence? Maybe something along these lines:

```
Users switching to a newer kernel should *not* have to install newer
firmware files to keep their hardware working. At the same time updated
firmware files must not cause any regressions for users of older kernel
releases.

Drivers that use such firmware (like that in linux-firmware) should thus
follow these rules:
```

> +* Firmware should be versioned with at least a major/minor version it
> +  is suggested that the firmware files in linux-firmware be named with
> +  some device specific name, and just the major version. The
> +  major/minor/patch versions should be stored in a header in the
> +  firmware file for the driver to detect any non-ABI fixes/issues. The
> +  firmware files in linux-firmware should be overwritten with the newest
> +  compatible major version. Newer major version firmware should remain
> +  compatible with all kernels that load that major number.
> +
> +* Users should *not* have to install newer firmware to use existing
> +  hardware when they install a newer kernel. 

This will need changes if you pick up the suggestion above.

> If the hardware isn't
> +  enabled by default or under development,

Wondering if it might be better to drop the "or under development", as
the "enabled by default" is the main part afaics. Maybe something like
"If support for the hardware is normally inactive (e.g. has to be
enabled manually by a kernel parameter)" would be better anyway.

> this can be ignored, until
> +  the first kernel release that enables that hardware.  This means no
> +  major version bumps without the kernel retaining backwards
> +  compatibility for the older major versions.  Minor version bumps
> +  should not introduce new features that newer kernels depend on
> +  non-optionally.
> +
> +* If a security fix needs lockstep firmware and kernel fixes in order to
> +  be successful, then all supported major versions in the linux-firmware
> +  repo

This made me wonder: what exactly are "all supported major versions" in
this context? Do you mean something like "all major versions in the
linux-firmware required by currently supported stable/longterm kernel
series"? Then it might be wise to write that.

> should be updated with the security fix, and the kernel patches
> +  should detect if the firmware is new enough to declare if the security
> +  issue is fixed.  All communications around security fixes should point
> +  at both the firmware and kernel fixes. If a security fix requires
> +  deprecating old major versions, then this should only be done as a
> +  last option, and be stated clearly in all communications.
> +

HTH, Ciao, Thorsten
