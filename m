Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9978A655E19
	for <lists+alsa-devel@lfdr.de>; Sun, 25 Dec 2022 19:55:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1EBCF4B4E;
	Sun, 25 Dec 2022 19:54:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1EBCF4B4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671994537;
	bh=w53b+n/PfoRUp9VTGrPIakbdvGvmB/oqXQp8rB/Ix8M=;
	h=Subject:From:To:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=kfQztGTkfL7ky7xaS+fa/w5pkvXlzto6Wd29t5CUrczrTXaMlQ0amyYAimxc+AKu0
	 1vGpEXuiW7XlcwWXyYOEp8Eh0lTAaBUChRn+Clm2AQBlEE/R174Ec5lomsJhajOHr9
	 OS4rGvFBjL8VPKAd/y0ZhhKdigmncf+oy43syhDE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C47DF805C3;
	Sun, 25 Dec 2022 19:49:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 12028F804B4; Sun, 25 Dec 2022 13:14:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from voltaic.bi-co.net (voltaic.bi-co.net [134.119.3.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 39C48F80245
 for <alsa-devel@alsa-project.org>; Sun, 25 Dec 2022 13:14:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39C48F80245
Received: from [192.168.0.36] (ip-037-201-145-015.um10.pools.vodafone-ip.de
 [37.201.145.15])
 by voltaic.bi-co.net (Postfix) with ESMTPSA id 3C25321179;
 Sun, 25 Dec 2022 13:14:29 +0100 (CET)
Message-ID: <1c9c00dec72c241a399b3b7c0a305382a5712529.camel@bi-co.net>
Subject: Re: [PATCH] ALSA: hda/hdmi: Use only dynamic PCM device allocation
From: Michael =?ISO-8859-1?Q?La=DF?= <bevan@bi-co.net>
To: Jaroslav Kysela <perex@perex.cz>, ALSA development
 <alsa-devel@alsa-project.org>
Date: Sun, 25 Dec 2022 13:14:28 +0100
In-Reply-To: <20220922084017.25925-1-perex@perex.cz>
References: <20220922084017.25925-1-perex@perex.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.2 
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 25 Dec 2022 19:49:45 +0100
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Takashi Iwai <tiwai@suse.de>, amd-gfx@lists.freedesktop.org,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

CC'ing amd-gfx as this might be an issue in the amd driver.

This change causes a regression in Linux 6.1 at least on some AMD APUs.
There are reports from users with Ryzen 4750U, 5800U and 5850U chips
where the HDMI sound devices don't show up anymore. I'm affected by
this as well.

Reverting this commit (ef6f5494) makes the HDMI audio devices show up
again. I verified that this is still an issue in current Linux git
(72a85e2b).

Am Donnerstag, dem 22.09.2022 um 10:40 +0200 schrieb Jaroslav Kysela:
> > Per discussion on the alsa-devel mailing list [1], the legacy PIN to PC=
M
> > device mapping is obsolete nowadays. The maximum number of the simultan=
eously
> > usable PCM devices is equal to the HDMI codec converters.
> >=20
> > Remove the extra PCM devices (beyond the detected converters) and force
> > the use of the dynamic PCM device allocation. The legacy code is remove=
d.
> >=20
> > I believe that all HDMI codecs have the jack sensing feature. Move the =
check
> > to the codec probe function and print a warning, if a codec without thi=
s
> > feature is detected.

The corresponding message ("jack not detectable") is not shown on the
affected system.

> > [1] https://lore.kernel.org/alsa-devel/2f37e0b2-1e82-8c0b-2bbd-1e5038d6=
ecc6@perex.cz/

Links to some reports of this issue:
https://bugzilla.kernel.org/show_bug.cgi?id=3D216836
https://bbs.archlinux.org/viewtopic.php?pid=3D2075700
https://bugs.archlinux.org/task/76917
https://www.reddit.com/r/archlinux/comments/zsqq7i/hdmi_audio_is_broken_aft=
er_updating_kernel_to_611

Best regards,
Michael
