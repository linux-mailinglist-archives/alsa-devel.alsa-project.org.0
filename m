Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 152D12EB351
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Jan 2021 20:08:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9EAEB1692;
	Tue,  5 Jan 2021 20:07:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9EAEB1692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609873711;
	bh=em6Wcd1cNVrSFksfZmMQXKnok9oFteFLPjfrYs8yeRM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vVAXZMKgjpYTYrnWoSP5QQpGCRl4tWGzMPycJqRDlovbEXUa1bAGLHRTuF9aiqi1J
	 9kXMs2xKd5J/IyAN5erTZ6eq0P2rjBzB2r6mwIvDPFsyDCtI4IagZ5QnlxeOEuQXPj
	 xp/6ePTfWq1+gpDHd/GIF7m+S+Xj+7CG74+aZeBs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A953F80268;
	Tue,  5 Jan 2021 20:06:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A80B3F80258; Tue,  5 Jan 2021 20:06:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 52074F800FD;
 Tue,  5 Jan 2021 20:06:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52074F800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="kWmRnAD0"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 70B6D22DBF;
 Tue,  5 Jan 2021 19:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609873595;
 bh=em6Wcd1cNVrSFksfZmMQXKnok9oFteFLPjfrYs8yeRM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=kWmRnAD042BgHpVn0UDLqMMXyhf3D/feTxZzBROYUZzuLNmPlc5C3MEJkC06EK1Na
 oVWVL6tAuI01REcblwYQHQlOQ6R3b5IVL1oaCJxOOtHpadlrLeCSiEqoYupQf6gtkm
 oDFuAGkGW9+BKNAMObfOkJCBNm9xp26CqNsO7/6fpOwrQpUadBEEWVdQRAh9eysZzT
 wr1xr6ZEDOtA69UET+PFa7pBOPkCvUth49tVXxfAd9kMQ9fRjapfpuOMBvJuiL2PJ+
 Y8Nm3nCDzXPz8BlWoy5xwJqmC0yNFZLggs348FYbSjOPiAy3uYi7jfe41rzuy2rSgi
 5llMH51E3GsNg==
Received: by mail-oo1-f50.google.com with SMTP id o5so185113oop.12;
 Tue, 05 Jan 2021 11:06:35 -0800 (PST)
X-Gm-Message-State: AOAM530KnhJdBb0W3NhkTb0Ego8TG4JJyOHW5ynvCqH1Sigx7QpE6lKu
 AGdRVIh7mzkAJmsOZKsni5bTaQmQpCN9PGfBZ4M=
X-Google-Smtp-Source: ABdhPJwdyOnq1x7GkNeY2G3v5lintDrKvasGwW+XQKgeTPdvPxUp1SMnwbI5EcXy6vPdDIvPP23owpLVUunPQyJ2dKg=
X-Received: by 2002:a4a:9c01:: with SMTP id y1mr367592ooj.15.1609873594701;
 Tue, 05 Jan 2021 11:06:34 -0800 (PST)
MIME-Version: 1.0
References: <20210103135257.3611821-1-arnd@kernel.org>
 <3c19a5d5-8883-f917-a96a-f51bb188d115@perex.cz>
 <s5hble491zu.wl-tiwai@suse.de>
 <CAK8P3a1FZSfzu3TA6VMhqP+3H5OD3+BhH5W=vVYEkL+ExHqpMQ@mail.gmail.com>
 <alpine.DEB.2.22.394.2101051631320.864696@eliteleevi.tm.intel.com>
In-Reply-To: <alpine.DEB.2.22.394.2101051631320.864696@eliteleevi.tm.intel.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 5 Jan 2021 20:06:18 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0PXXHXLK36SB_4eia6z0u3nbBPanATwZEhposKOScqcw@mail.gmail.com>
Message-ID: <CAK8P3a0PXXHXLK36SB_4eia6z0u3nbBPanATwZEhposKOScqcw@mail.gmail.com>
Subject: Re: [PATCH] ALSA: hda: fix SND_INTEL_DSP_CONFIG dependency
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Arnd Bergmann <arnd@arndb.de>, Takashi Iwai <tiwai@suse.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, sound-open-firmware@alsa-project.org
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

On Tue, Jan 5, 2021 at 4:39 PM Kai Vehmanen
<kai.vehmanen@linux.intel.com> wrote:

> > Could it be part of the device specific driver_data?
>
> This would certainly be a clean way and allow to remove the Intel-specific
> calls from sof_pci_probe(). As a short-term solution, IS_REACHABLE()
> seems ok as well.

I looked at it some more and my conclusion is that the problem is
the way the drivers mix device specific and generic data: The generic
acpi or pci driver should never need to know about individual devices
and their dependencies. Instead of just exporting some generic
helper functions, these are the top-level drivers and the device
specific drivers are the ones exporting the data.

It's a common mistake,  but it always leads to complexity like this
and we tend to end up having to undo it all.

I prototyped a patch to do this for the acpi driver, and it seems
much more straightforward this way, please have a look.

commit a83ecfed5b31dfc862e04c9bf77d2107a1047c9b
Author: Arnd Bergmann <arnd@arndb.de>
Date:   Tue Jan 5 19:47:35 2021 +0100

    ASoC: SOF: Intel: avoid reverse module dependency

    The SOF-ACPI driver is backwards from the normal Linux model, it has a
    generic driver that knows about all the specific drivers, as opposed to
    having hardware specific drivers that link against a common framework.

    This requires ugly Kconfig magic and leads to missed dependencies as
    seen in this link error:

    arm-linux-gnueabi-ld: sound/soc/sof/sof-pci-dev.o: in function
`sof_acpi_probe':
    sof-pci-dev.c:(.text+0x1c): undefined reference to
`snd_intel_dsp_driver_probe'

    Change it to use the normal probe order of starting with a specific
    device in a driver, turning the sof-acpi-dev.c driver into a library.

    Signed-off-by: Arnd Bergmann <arnd@arndb.de>

 sound/soc/sof/intel/Kconfig  |  34 +++---------
 sound/soc/sof/intel/bdw.c    |  51 ++++++++++++++++--
 sound/soc/sof/intel/byt.c    | 104 ++++++++++++++++++++++++++++++++----
 sound/soc/sof/intel/shim.h   |  10 ++--
 sound/soc/sof/sof-acpi-dev.c | 122 ++-----------------------------------------
 5 files changed, 156 insertions(+), 165 deletions(-)

The PCI driver is left as an exercise to the reader.

      Arnd
