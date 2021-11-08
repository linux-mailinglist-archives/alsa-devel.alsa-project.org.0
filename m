Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A73A449B7C
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Nov 2021 19:13:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C378E166A;
	Mon,  8 Nov 2021 19:12:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C378E166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636395180;
	bh=4miGct0x2e4uwPTJoDfwUndqCdd3VtKDYZ6yEFuB+us=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lMJBO7ck1EyT0TNv0QEffulMEaCjLgsjQGJrRk1R28kVmBlG4nH+7WOaEzlWeLvdI
	 kmepy3KDoAABMzE5qiA0x+YzKuV0V/WGfoyMYROe+0HryHCvPlA5vZ79VMR5QzOoeS
	 b+StjPdozAhThBzcLzCfJCLf9RT9hOzNFd/ZnkdU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6BC9EF804D1;
	Mon,  8 Nov 2021 19:11:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B1F36F8049E; Mon,  8 Nov 2021 19:11:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6A28CF8007E;
 Mon,  8 Nov 2021 19:11:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A28CF8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="C4PBHKng"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 14B1061458;
 Mon,  8 Nov 2021 18:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636395101;
 bh=4miGct0x2e4uwPTJoDfwUndqCdd3VtKDYZ6yEFuB+us=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=C4PBHKng8edDElM6qpjJtSddGmKofTG8dBANUlp2PpEfJZ1vatNwZDRHtnkfgaVSP
 QElhHm2JAwUS1PKz+KSV+JAt1s5t5g4x5UbqPJtg4Sk5JgT+FzSKe8WYicPu1G2MVm
 J86bqx62xfns8vUnetFXqUmE9DsHycSEWBbkgwjlnYWqvU4tQa2vZR06CKUryh6SVm
 2SIGrdA/A/vRqCoI3U+lN3hrobtuPBnBcJ+jaNEu9jrUa1Qdw15ufz9kzYrt64sUy2
 zRqY9XXy3wF9HxW2giV8PrNcsuhNRBwbGteoKJFmB9NwjQ3l1xlaYc2LmNuFefAN1B
 e/Gr7Z+JP+3bQ==
Received: by mail-wr1-f45.google.com with SMTP id n29so16717382wra.11;
 Mon, 08 Nov 2021 10:11:40 -0800 (PST)
X-Gm-Message-State: AOAM532mIMJQ8OGCU93WPGEe93DolKadGKZiDILL13TuFIck8Wn27u4d
 neMu6txp07PwUcEtbOHDZCpL32sFkXJjWbPTV+4=
X-Google-Smtp-Source: ABdhPJxbJNi7n8tAL3Jwa5ALZJw0iWi5JGBlyxbxQOoaZZN9HIADFmux1v0zDwJxQJ9u9Rv9zlt85oGm/j/OR8DXfXU=
X-Received: by 2002:a05:6000:18c7:: with SMTP id
 w7mr1242427wrq.411.1636395099591; 
 Mon, 08 Nov 2021 10:11:39 -0800 (PST)
MIME-Version: 1.0
References: <20211108111132.3800548-1-arnd@kernel.org>
 <63c5b1fb-575e-f026-5a76-f08a366f7f38@linux.intel.com>
 <bae1a17c-af6e-d77a-19e7-f3f6408951fa@nxp.com>
 <CAK8P3a2-=-JM+p2b4v4F8O9O2ZhB-3Uhd_F+gcGAinAztSDH9A@mail.gmail.com>
 <948c8add-2a31-a7aa-f16c-8629dab690cc@linux.intel.com>
In-Reply-To: <948c8add-2a31-a7aa-f16c-8629dab690cc@linux.intel.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 8 Nov 2021 19:11:23 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2cmWe0G+Kyd=HZHdR0+eW=rktc6_i1PdRDBaBEYQOG4A@mail.gmail.com>
Message-ID: <CAK8P3a2cmWe0G+Kyd=HZHdR0+eW=rktc6_i1PdRDBaBEYQOG4A@mail.gmail.com>
Subject: Re: [Sound-open-firmware] [PATCH] ASoC: SOF: build compression
 interface into snd_sof.ko
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>,
 Bud Liviu-Alexandru <budliviu@gmail.com>, Randy Dunlap <rdunlap@infradead.org>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Paul Olaru <paul.olaru@oss.nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 sound-open-firmware@alsa-project.org
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

On Mon, Nov 8, 2021 at 6:18 PM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
> On 11/8/21 10:15 AM, Arnd Bergmann wrote:
> > On Mon, Nov 8, 2021 at 3:13 PM Daniel Baluta <daniel.baluta@nxp.com> wrote:
>
> On a related note, with this randconfig we have a separate problem on an
> AMD patch on the SOF tree
>
> ERROR: modpost: "snd_amd_acp_find_config"
> [sound/soc/amd/snd-acp-config] is a static EXPORT_SYMBOL
>
> That wasn't detected earlier, any idea what Kconfig option I need to
> enable to filter this out?

I don't see that symbol on linux-next at all, so this must be a bug
that is specific to the
current SOF tree. The message tells you that snd_amd_acp_find_config should
not be exported at all since it's static, or it should not be marked
static because it
is used by other modules. IOW having a symbol that is both static and exported
means it's not usable from built-in drivers.

       Arnd
