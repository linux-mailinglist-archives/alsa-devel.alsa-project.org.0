Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B54B2579586
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Jul 2022 10:49:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 54E3C16C0;
	Tue, 19 Jul 2022 10:49:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 54E3C16C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658220594;
	bh=Y80I/9h5gwXwAl7BrWnNgRboomD0Q/i4fsdukksbxuA=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NGzmts26dWB/xk9R84gHln5p/exWxXFouOBFSsiyoOZj3EXqOJ1EFVoH5qyFOdSxa
	 Onl2y8IIZQs9YdtG2uyfrnBNCn/RzePCcf1QtuKQ5I0WRBRMlT5KimybzVEW9YDv6Z
	 b/650nV7l3sIkExJIyBigc3GvUDp5kSMFkqyhHFk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BB854F80224;
	Tue, 19 Jul 2022 10:48:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 152D0F80125; Tue, 19 Jul 2022 10:48:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EE18DF80125
 for <alsa-devel@alsa-project.org>; Tue, 19 Jul 2022 10:48:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE18DF80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ftz2opaB"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0EEADB81A26;
 Tue, 19 Jul 2022 08:48:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FD50C341C6;
 Tue, 19 Jul 2022 08:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658220521;
 bh=Y80I/9h5gwXwAl7BrWnNgRboomD0Q/i4fsdukksbxuA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ftz2opaB3z+yb8RtydfLoLtaxsjl9hbVDuSH7gqPczmybG3jqnAUX/sMgYFai0B3B
 D/GVCtngIJW3ALxtzJdXN9F9GYV3fLFB6cJSSD+sVPPUikiEIjT0M8UPFkwT0aa5xL
 S6gbKGCyNjELTnqJzmWgE2WySNetGPq/TuPWVf762sbXBQXxv4Ch7L0hoP4OKxhBeF
 wempCKHPca39pk1WqmSOjqnkIctwswq4BX7jZBwaQ4uWPl0JWkCWzcYye7zvAQIS3v
 mXo4NI3t11uKJPh3r7gX87oIZdPIvGwwnzMg2urBDZulfeOAMM5Uk/DRfnKWweGNcg
 ixWwiuFbfaCqw==
Date: Tue, 19 Jul 2022 09:48:35 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Dave Airlie <airlied@gmail.com>
Subject: Re: [PATCH] docs: driver-api: firmware: add driver firmware
 guidelines. (v2)
Message-ID: <20220719094835.52197852@sal.lan>
In-Reply-To: <20220719065357.2705918-1-airlied@gmail.com>
References: <20220719065357.2705918-1-airlied@gmail.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, linux-doc@vger.kernel.org,
 gregkh@linuxfoundation.org, Jonathan Corbet <corbet@lwn.net>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, mcgrof@kernel.org, netdev@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.sf.net,
 Dave Airlie <airlied@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
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

Em Tue, 19 Jul 2022 16:53:57 +1000
Dave Airlie <airlied@gmail.com> escreveu:

> From: Dave Airlie <airlied@redhat.com>
> 
> A recent snafu where Intel ignored upstream feedback on a firmware
> change, led to a late rc6 fix being required. In order to avoid this
> in the future we should document some expectations around
> linux-firmware.
> 
> I was originally going to write this for drm, but it seems quite generic
> advice.

Indeed it makes sense to document firmware API compatibility in a generic way.

Some suggestions below.

> v2: rewritten with suggestions from Thorsten Leemhuis.
>
> Acked-by: Luis Chamberlain <mcgrof@kernel.org>
> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
>  Documentation/driver-api/firmware/core.rst    |  1 +
>  .../firmware/firmware-usage-guidelines.rst    | 34 +++++++++++++++++++
>  2 files changed, 35 insertions(+)
>  create mode 100644 Documentation/driver-api/firmware/firmware-usage-guidelines.rst
> 
> diff --git a/Documentation/driver-api/firmware/core.rst b/Documentation/driver-api/firmware/core.rst
> index 1d1688cbc078..803cd574bbd7 100644
> --- a/Documentation/driver-api/firmware/core.rst
> +++ b/Documentation/driver-api/firmware/core.rst
> @@ -13,4 +13,5 @@ documents these features.
>     direct-fs-lookup
>     fallback-mechanisms
>     lookup-order
> +   firmware-usage-guidelines
>  
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
> +
> +* Firmware should be versioned with at least a major/minor version.

It is hard to enforce how vendors will version their firmware. On media,
we have some drivers whose major means different hardware versions. For
instance, on xc3028, v3.x means low voltage chips, while v2.x means
"normal" voltage. We end changing the file name on Linux to avoid the risk
of damaging the hardware, as using v27 firmware on low power chips damage
them. So, we have:

	drivers/media/tuners/xc2028.h:#define XC2028_DEFAULT_FIRMWARE "xc3028-v27.fw"
	drivers/media/tuners/xc2028.h:#define XC3028L_DEFAULT_FIRMWARE "xc3028L-v36.fw"

As their main market is not Linux - nor PC - as their main sales are on 
TV sets, and them don't officially support Linux, there's nothing we can
do to enforce it.

IMO we need a more generic text here to indicate that Linux firmware
files should be defined in a way that it should be possible to detect
when there are incompatibilities with past versions. 
So, I would say, instead:

	Firmware files shall be designed in a way that it allows
	checking for firmware ABI version changes. It is recommended
	that firmware files to be versioned with at least major/minor
	version.

> It
> +  is suggested that the firmware files in linux-firmware be named with
> +  some device specific name, and just the major version. 

> The
> +  major/minor/patch versions should be stored in a header in the
> +  firmware file for the driver to detect any non-ABI fixes/issues. 

I would also make this more generic. On media, we ended adding the firmware
version indicated at the file name. For instance, xc4000 driver checks for
two firmware files:

drivers/media/tuners/xc4000.c:#define XC4000_DEFAULT_FIRMWARE "dvb-fe-xc4000-1.4.fw"
drivers/media/tuners/xc4000.c:#define XC4000_DEFAULT_FIRMWARE_NEW "dvb-fe-xc4000-1.4.1.fw"

On such cases, the driver can take decisions based on the firmware name.

I would change the text to be more generic covering both cases:

	The firmware version shall either be stored at the firmware
	header or as part of the firmware file name, in order to let the
	driver to detect any non-ABI fixes/changes.

> The
> +  firmware files in linux-firmware should be overwritten with the newest
> +  compatible major version.

For me "shall" is mandatory, while "should" is optional.

In this specific case, I'm not so sure if overriding it is the best thing 
to do on all subsystems. I mean, even with the same ABI, older firmware 
usually means that some bugs and/or limitations will be present there.

That's specially true on codecs: even having the same ABI, older versions
won't support decoding newer protocols. We have one case with some
digital TV decoders that only support some Cable-TV protocols with
newer firmware versions. We have also one case were remote controller
decoding is buggy with older firmwares. On both situations, the ABI
didn't change.

> Newer major version firmware should remain
> +  compatible with all kernels that load that major number.

	should -> shall

> +
> +* Users should *not* have to install newer firmware to use existing
> +  hardware when they install a newer kernel. 

> If the hardware isn't
> +  enabled by default or under development,

Hmm.. someone might understand that not having a "default Y" at Kconfig
would mean that this is not enabled by default ;-)

IMO you can just tell, instead:

	"This can be ignored until the first kernel release that enables support
	 for such hardware."

> this can be ignored, until
> +  the first kernel release that enables that hardware. 

> This means no
> +  major version bumps without the kernel retaining backwards
> +  compatibility for the older major versions.  Minor version bumps
> +  should not introduce new features that newer kernels depend on
> +  non-optionally.
> +
> +* If a security fix needs lockstep firmware and kernel fixes in order to
> +  be successful, then all supported major versions in the linux-firmware
> +  repo should be updated with the security fix, and the kernel patches
> +  should detect if the firmware is new enough to declare if the security
> +  issue is fixed.  All communications around security fixes should point
> +  at both the firmware and kernel fixes. If a security fix requires
> +  deprecating old major versions, then this should only be done as a
> +  last option, and be stated clearly in all communications.
> +

Perfect!

Regards,
Mauro
