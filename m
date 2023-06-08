Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BC872768A
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Jun 2023 07:15:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97FCF6C0;
	Thu,  8 Jun 2023 07:14:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97FCF6C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686201331;
	bh=CfAIUVy65S4SW8G0F/9uO+mVkhp58X/LLYgZxqkUYKc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XYoKinLrfF5QTnsCeWT6XURDCiy0EaVO4TzZtu1e5jaxlDMrp6WAobVxC55JrAPsr
	 4kDwxeo4cO9sa64qLTDqr7fuxCIJlHslOTFpdAMO2kJYTSYcDBiTARIYpJXFEc/ASG
	 4uQtnOQC8igx+Y6i6JVK3Ti+yTCJxEPCMTZvz8rs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 006A0F80155; Thu,  8 Jun 2023 07:14:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 889BEF8016C;
	Thu,  8 Jun 2023 07:14:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E14D8F80199; Thu,  8 Jun 2023 07:14:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4FD02F800ED
	for <alsa-devel@alsa-project.org>; Thu,  8 Jun 2023 07:14:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4FD02F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=JiLj0k/k
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1b04706c85fso1006125ad.0
        for <alsa-devel@alsa-project.org>;
 Wed, 07 Jun 2023 22:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686201256; x=1688793256;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bpAU5WkVE/wtFEVm7r+ibR0BKuprOl5u/o3sLZZPjdU=;
        b=JiLj0k/kt8UytBRW9NDnQPfNyI1FzzcS1zD8eSiGWFHmHsXEHkZHMgIdVQmx2TbbYL
         Sg/6aXsoIlV3Rafg81/vh2k7MFwQ0cTAjC49qdSKNbDM5yOR2aRa1LBUkTJrKEh1t1hc
         Yuctujxh65UjI0r6pe2rnKfs10v6vlLxvM8nCPRMzD9/x++VltFTLKRt1TOqYRMc6hEu
         YDRAhryE8swk60466ySyVM1e++NDP175JGoJrlACgLDs+anSrXsL5tnL4ZtpvJi9x5hY
         Dc4abXqrLa9K6aftYEiY6E0ab1voy45A1NdC9oPYkMmH7l2u+63pbUqZ6PV9B6iNtfH9
         QTOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686201256; x=1688793256;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bpAU5WkVE/wtFEVm7r+ibR0BKuprOl5u/o3sLZZPjdU=;
        b=OuBh4RuiZRCHpIduwipJjKqPxX285v43QhkMGI2f1hh07Fl9ZX3zb2q+AbN1nDRAeH
         ibehfEzns3K3VmdFOJkOD6QgNxt4sABahQwj6AbC3dPuqutyS69pq5VeHm3ZvzPyNyNO
         KMvqvIc/bo1LAEeSiMj3GWHsAMYlKoA/rtx/Zb62cRWhKhD/39KNKb39mdDdykVs46Rf
         5Bp76+hQM2TzWGYE2vK+9RmCvWKqX/SoDTTj4svdZ7SfioUTaW1TlblCv4xu3LkGEsWn
         fpaK3ING6rAXRBsQ/McOvSw6svBuhyuLhAYWCdTgG1jZ/sL+/onwfls6+7Y2mfFIHQGI
         cksA==
X-Gm-Message-State: AC+VfDw9/T4gI+q7JFay5RTb9ADH0LHYl776DRTgcvGWxu/IpcdwXjqv
	Sg+iWJu0HO4AnX3rLUC/zbcxMwESocmzQA==
X-Google-Smtp-Source: 
 ACHHUZ7PsZUhyvqZvDzdteGKDPRW07qivbilkfyHjFiAtWZ7dNWv1WVJ4+MYga1/UpWAi96+fh/w/g==
X-Received: by 2002:a17:903:4295:b0:1ae:5914:cbec with SMTP id
 ju21-20020a170903429500b001ae5914cbecmr7531015plb.10.1686201255924;
        Wed, 07 Jun 2023 22:14:15 -0700 (PDT)
Received: from debian.me (subs03-180-214-233-10.three.co.id. [180.214.233.10])
        by smtp.gmail.com with ESMTPSA id
 i12-20020a17090332cc00b001b04949e0acsm396483plr.232.2023.06.07.22.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 22:14:15 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 16A921069EA; Thu,  8 Jun 2023 12:14:10 +0700 (WIB)
Date: Thu, 8 Jun 2023 12:14:10 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Ivan Orlov <ivan.orlov0322@gmail.com>, perex@perex.cz, tiwai@suse.com,
	corbet@lwn.net, broonie@kernel.org, skhan@linuxfoundation.org
Cc: alsa-devel@alsa-project.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	gregkh@linuxfoundation.org, himadrispandya@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH v3 1/3] docs: sound: add 'pcmtest' driver documentation
Message-ID: <ZIFjog1a93_FFBPF@debian.me>
References: <20230606133807.14089-1-ivan.orlov0322@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lJm1/npRizm0mCUv"
Content-Disposition: inline
In-Reply-To: <20230606133807.14089-1-ivan.orlov0322@gmail.com>
Message-ID-Hash: BQUYX5AOGECWZNKVDNMBJHEW47BEMJZV
X-Message-ID-Hash: BQUYX5AOGECWZNKVDNMBJHEW47BEMJZV
X-MailFrom: bagasdotme@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BQUYX5AOGECWZNKVDNMBJHEW47BEMJZV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--lJm1/npRizm0mCUv
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 06, 2023 at 05:38:05PM +0400, Ivan Orlov wrote:
> diff --git a/Documentation/sound/cards/pcmtest.rst b/Documentation/sound/=
cards/pcmtest.rst
> new file mode 100644
> index 000000000000..e163522f3205
> --- /dev/null
> +++ b/Documentation/sound/cards/pcmtest.rst
> @@ -0,0 +1,120 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +The Virtual PCM Test Driver
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> +
> +The Virtual PCM Test Driver emulates a generic PCM device, and can be us=
ed for
> +testing/fuzzing of the userspace ALSA applications, as well as for testi=
ng/fuzzing of
> +the PCM middle layer. Additionally, it can be used for simulating hard t=
o reproduce
> +problems with PCM devices.
> +
> +What can this driver do?
> +~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +At this moment the driver can do the following things:
> +	* Simulate both capture and playback processes
> +	* Generate random or pattern-based capturing data
> +	* Inject delays into the playback and capturing processes
> +	* Inject errors during the PCM callbacks
> +
> +It supports up to 8 substreams and 4 channels. Also it supports both int=
erleaved and
> +non-interleaved access modes.
> +
> +Also, this driver can check the playback stream for containing the prede=
fined pattern,
> +which is used in the corresponding selftest (alsa/pcmtest-test.sh) to ch=
eck the PCM middle
> +layer data transferring functionality. Additionally, this driver redefin=
es the default
> +RESET ioctl, and the selftest covers this PCM API functionality as well.
> +
> +Configuration
> +-------------
> +
> +The driver has several parameters besides the common ALSA module paramet=
ers:
> +
> +	* fill_mode (bool) - Buffer fill mode (see below)
> +	* inject_delay (int)
> +	* inject_hwpars_err (bool)
> +	* inject_prepare_err (bool)
> +	* inject_trigger_err (bool)
> +
> +
> +Capture Data Generation
> +-----------------------
> +
> +The driver has two modes of data generation: the first (0 in the fill_mo=
de parameter)
> +means random data generation, the second (1 in the fill_mode) - pattern-=
based
> +data generation. Let's look at the second mode.
> +
> +First of all, you may want to specify the pattern for data generation. Y=
ou can do it
> +by writing the pattern to the debugfs file. There are pattern buffer deb=
ugfs entries
> +for each channel, as well as entries which contain the pattern buffer le=
ngth.
> +
> +	* /sys/kernel/debug/pcmtest/fill_pattern[0-3]
> +	* /sys/kernel/debug/pcmtest/fill_pattern[0-3]_len
> +
> +To set the pattern for the channel 0 you can execute the following comma=
nd:
> +
> +.. code-block:: bash
> +
> +	echo -n mycoolpattern > /sys/kernel/debug/pcmtest/fill_pattern0
> +
> +Then, after every capture action performed on the 'pcmtest' device the b=
uffer for the
> +channel 0 will contain 'mycoolpatternmycoolpatternmycoolpatternmy...'.
> +
> +The pattern itself can be up to 4096 bytes long.
> +
> +Delay injection
> +---------------
> +
> +The driver has 'inject_delay' parameter, which has very self-descriptive=
 name and
> +can be used for time delay/speedup simulations. The parameter has intege=
r type, and
> +it means the delay added between module's internal timer ticks.
> +
> +If the 'inject_delay' value is positive, the buffer will be filled slowe=
r, if it is
> +negative - faster. You can try it yourself by starting a recording in any
> +audiorecording application (like Audacity) and selecting the 'pcmtest' d=
evice as a
> +source.
> +
> +This parameter can be also used for generating a huge amount of sound da=
ta in a very
> +short period of time (with the negative 'inject_delay' value).
> +
> +Errors injection
> +----------------
> +
> +This module can be used for injecting errors into the PCM communication =
process. This
> +action can help you to figure out how the userspace ALSA program behaves=
 under unusual
> +circumstances.
> +
> +For example, you can make all 'hw_params' PCM callback calls return EBUS=
Y error by
> +writing '1' to the 'inject_hwpars_err' module parameter:
> +
> +.. code-block:: bash
> +
> +	echo 1 > /sys/module/snd_pcmtest/parameters/inject_hwpars_err
> +
> +Errors can be injected into the following PCM callbacks:
> +
> +	* hw_params (EBUSY)
> +	* prepare (EINVAL)
> +	* trigger (EINVAL)
> +
> +Playback test
> +-------------
> +
> +This driver can be also used for the playback functionality testing - ev=
ery time you
> +write the playback data to the 'pcmtest' PCM device and close it, the dr=
iver checks the
> +buffer for containing the looped pattern (which is specified in the fill=
_pattern
> +debugfs file for each channel). If the playback buffer content represent=
s the looped
> +pattern, 'pc_test' debugfs entry is set into '1'. Otherwise, the driver =
sets it to '0'.
> +
> +ioctl redefinition test
> +-----------------------
> +
> +The driver redefines the 'reset' ioctl, which is default for all PCM dev=
ices. To test
> +this functionality, we can trigger the reset ioctl and check the 'ioctl_=
test' debugfs
> +entry:
> +
> +.. code-block:: bash
> +
> +	cat /sys/kernel/debug/pcmtest/ioctl_test
> +
> +If the ioctl is triggered successfully, this file will contain '1', and =
'0' otherwise.

LGTM, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--lJm1/npRizm0mCUv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZIFjmgAKCRD2uYlJVVFO
o/VoAQDOriEk9HJC+190k8ieuW500QCJ/NEFQxzXMk7or87YlAEA5QHYfRdTu/of
gQzNqexUMffrXbfMLkuxIG7SEeWA/QE=
=riD2
-----END PGP SIGNATURE-----

--lJm1/npRizm0mCUv--
