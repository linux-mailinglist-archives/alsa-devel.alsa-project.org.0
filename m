Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7E737A314
	for <lists+alsa-devel@lfdr.de>; Tue, 11 May 2021 11:10:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 264A71777;
	Tue, 11 May 2021 11:10:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 264A71777
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620724256;
	bh=5sTO59GF1KhWl+tm6o7V5AXWmZxHwG8qXgnGolXuwXY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jPp1uTa0CaSUjhpiGUjzGQxwsbawDN+RD5cIT/j0bZ/7pmBtHXskEDQD+lwGUe/tB
	 K7t2zCoAKtLbsX86pRwBqDVNN3PMOAzObaEsr0bIGFV3rqRITFHs2ld22t3Q9CfkbR
	 ERTjrJWBlqksYGdFdAXLZbMsd1q2LLNrEZdhYKGQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DA75BF800E9;
	Tue, 11 May 2021 11:08:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89128F80240; Mon, 10 May 2021 23:59:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from tartarus.angband.pl (tartarus.angband.pl [51.83.246.204])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EF892F800E9
 for <alsa-devel@alsa-project.org>; Mon, 10 May 2021 23:59:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF892F800E9
Received: from kilobyte by tartarus.angband.pl with local (Exim 4.94.2)
 (envelope-from <kilobyte@angband.pl>)
 id 1lgDtp-00EKjz-Lm; Mon, 10 May 2021 23:57:13 +0200
Date: Mon, 10 May 2021 23:57:13 +0200
From: Adam Borowski <kilobyte@angband.pl>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH 00/53] Get rid of UTF-8 chars that can be mapped as ASCII
Message-ID: <YJmsOYzPIsQ04Zxb@angband.pl>
References: <cover.1620641727.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1620641727.git.mchehab+huawei@kernel.org>
X-Junkbait: aaron@angband.pl, zzyx@angband.pl
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: kilobyte@angband.pl
X-SA-Exim-Scanned: No (on tartarus.angband.pl); SAEximRunCond expanded to false
X-Mailman-Approved-At: Tue, 11 May 2021 11:08:22 +0200
Cc: alsa-devel@alsa-project.org, kvm@vger.kernel.org,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>, linux-iio@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-fpga@vger.kernel.org,
 dri-devel@lists.freedesktop.org, keyrings@vger.kernel.org,
 linux-riscv@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma@vger.kernel.org, x86@kernel.org, linux-acpi@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, linux-input@vger.kernel.org,
 linux-ext4@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-sgx@vger.kernel.org, coresight@lists.linaro.org, rcu@vger.kernel.org,
 mjpeg-users@lists.sourceforge.net, linux-arm-kernel@lists.infradead.org,
 linux-edac@vger.kernel.org, linux-hwmon@vger.kernel.org,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-integrity@vger.kernel.org
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

On Mon, May 10, 2021 at 12:26:12PM +0200, Mauro Carvalho Chehab wrote:
> There are several UTF-8 characters at the Kernel's documentation.
[...]
> Other UTF-8 characters were added along the time, but they're easily
> replaceable by ASCII chars.
> 
> As Linux developers are all around the globe, and not everybody has UTF-8
> as their default charset

I'm not aware of a distribution that still allows selecting a non-UTF-8
charset in a normal flow in their installer.  And if they haven't purged
support for ancient encodings, that support is thoroughly bitrotten.
Thus, I disagree that this is a legitimate concern.

What _could_ be a legitimate reason is that someone is on a _terminal_
that can't display a wide enough set of glyphs.  Such terminals are:
 • Linux console (because of vgacon limitations; patchsets to improve
   other cons haven't been mainlined)
 • some Windows terminals (putty, old Windows console) that can't borrow
   glyphs from other fonts like fontconfig can

For the former, it's whatever your distribution ships in
/usr/share/consolefonts/ or an equivalent, which is based on historic
ISO-8859 and VT100 traditions.

For the latter, the near-guaranteed character set is WGL4.


Thus, at least two of your choices seem to disagree with the above:
[dropped]
> 	0xd7   => 'x',		# MULTIPLICATION SIGN
[retained]
> 	- U+2b0d ('⬍'): UP DOWN BLACK ARROW

× is present in ISO-8859, V100, WGL4; I've found no font in
/usr/share/consolefonts/ on my Debian unstable box that lacks this
character.

⬍ is not found in any of the above.  You might want to at least
convert it to ↕ which is at least present in WGL4, and thus likely
to be supported in fonts heeding Windows/Mac/OpenType recommendations.
That still won't make it work on VT.


Meow!
-- 
⢀⣴⠾⠻⢶⣦⠀ .--[ Makefile ]
⣾⠁⢠⠒⠀⣿⡁ # beware of races
⢿⡄⠘⠷⠚⠋⠀ all: pillage burn
⠈⠳⣄⠀⠀⠀⠀ `----
