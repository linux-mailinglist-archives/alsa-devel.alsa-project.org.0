Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B20F1B4E99
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Apr 2020 22:52:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CAE8916A9;
	Wed, 22 Apr 2020 22:51:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CAE8916A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587588742;
	bh=ba/VpW1rfJQ6IqlivIHGTiQZUhWmQAKxSxz45LgtBl0=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=FE807ko/NHvqjsL7hNUV8cxhUhHNKcpW6vX4ZQl6vs14lxTuw6WevnrTmo1vLV5I/
	 ey7wSEIytgGMSloNJZcOKw0cpW26GZwHq1ONvfsqGDWM4+wvIevITq0fJE727uik8p
	 soL0N5VMp7kK+lYWxCCat9ehQoMtchhXlbrtDd2Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BA926F8020C;
	Wed, 22 Apr 2020 22:50:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2249AF801D9; Wed, 22 Apr 2020 22:50:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D638F800FF
 for <alsa-devel@alsa-project.org>; Wed, 22 Apr 2020 22:50:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D638F800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Hv7dVKaL"
Received: from localhost (mobile-166-175-187-227.mycingular.net
 [166.175.187.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1ADD42077D;
 Wed, 22 Apr 2020 20:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587588630;
 bh=ba/VpW1rfJQ6IqlivIHGTiQZUhWmQAKxSxz45LgtBl0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=Hv7dVKaLz4pLARkfibDJyiXpH/zPj46TRBQ0CYLhopEeCwYDhh7CKOmHAbFrU9cSa
 fuxjJZhqwNyQkkW/b+CrhuwJVV3nhknevRti99E0/Qn4WlFEqZjqG54EI3z/rgOTtf
 Y/6nKQyqkAVKDaqc6lOH+ObLzg//5AsyYKFu+mFM=
Date: Wed, 22 Apr 2020 15:50:28 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: "Alex Xu (Hello71)" <alex_y_xu@yahoo.ca>
Subject: Re: Unrecoverable AER error when resuming from RAM (hda regression
 in 5.7-rc2)
Message-ID: <20200422205028.GA223132@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1587494585.7pihgq0z3i.none@localhost>
Cc: alsa-devel@alsa-project.org, linux-pm@vger.kernel.org,
 Takashi Iwai <tiwai@suse.de>, linux-pci@vger.kernel.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 Roy Spliet <nouveau@spliet.org>
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

[+cc Rafael, linux-pm]

On Tue, Apr 21, 2020 at 03:08:44PM -0400, Alex Xu (Hello71) wrote:
> With 5.7-rc2, after resuming from suspend to RAM, I get:
> 
> [   55.679382] pcieport 0000:00:03.1: AER: Multiple Uncorrected (Non-Fatal) error received: 0000:00:00.0
> [   55.679405] pcieport 0000:00:03.1: AER: PCIe Bus Error: severity=Uncorrected (Non-Fatal), type=Transaction Layer, (Requester ID)
> [   55.679410] pcieport 0000:00:03.1: AER:   device [1022:1453] error status/mask=00100000/04400000
> [   55.679414] pcieport 0000:00:03.1: AER:    [20] UnsupReq               (First)
> [   55.679417] pcieport 0000:00:03.1: AER:   TLP Header: 40000004 0a0000ff fffc0e80 00000000
> [   55.679423] amdgpu 0000:0a:00.0: AER: can't recover (no error_detected callback)
> [   55.679425] snd_hda_intel 0000:0a:00.1: AER: can't recover (no error_detected callback)
> [   55.679455] pcieport 0000:00:03.1: AER: device recovery failed

I'm not at all confident in my decoding skills, but I *think* the TLP
header decodes to:

  Fmt           010b         3 DW header with data (32-bit address)
  Type          00000b       MWr
  Length        0x4          4 DW = 16 bytes
  Requester ID  0x0a00       0a:00.0
  Byte enables  0xff
  Address       0xfffc0e80

which would mean the 0a:00.0 GPU did a 16-byte write to 0xfffc0e80,
and the 00:03.1 Root Port reported that as an Unsupported Request.
I don't know why that would be unless the address is invalid.

Maybe that's supposed to be an MSI address?  Maybe a complete dmesg or
/proc/iomem would have a clue?

I feel like this UR issue could be a PCI core issue or maybe some sort
of misuse of PCI power management, but I can't seem to get traction on
it.

> Then the display freezes and the system basically falls apart (can't 
> even sudo reboot -f, need to use magic sysrq).
> 
> I bisected this to "ALSA: hda: Skip controller resume if not needed". 
> Setting snd_hda_intel.power_save=0 resolves the issue.

FWIW, the complete citation is c4c8dd6ef807 ("ALSA: hda: Skip
controller resume if not needed"),
https://git.kernel.org/linus/c4c8dd6ef807, which first appeared in
v5.7-rc2.

> I am using an ASRock B450 Pro4 with Realtek HDA codec:
> 
> [    1.009400] snd_hda_intel 0000:0a:00.1: enabling device (0000 -> 0002)
> [    1.009425] snd_hda_intel 0000:0a:00.1: Force to non-snoop mode
> [    1.009653] snd_hda_intel 0000:0c:00.3: enabling device (0000 -> 0002)
> [    1.021452] snd_hda_codec_generic hdaudioC0D0: ignore pin 0x7, too many assigned pins
> [    1.021461] snd_hda_codec_generic hdaudioC0D0: ignore pin 0x9, too many assigned pins
> [    1.021471] snd_hda_codec_generic hdaudioC0D0: ignore pin 0xb, too many assigned pins
> [    1.021480] snd_hda_codec_generic hdaudioC0D0: ignore pin 0xd, too many assigned pins
> [    1.021482] snd_hda_codec_generic hdaudioC0D0: autoconfig for Generic: line_outs=0 (0x0/0x0/0x0/0x0/0x0) type:line
> [    1.021482] snd_hda_codec_generic hdaudioC0D0:    speaker_outs=0 (0x0/0x0/0x0/0x0/0x0)
> [    1.021483] snd_hda_codec_generic hdaudioC0D0:    hp_outs=0 (0x0/0x0/0x0/0x0/0x0)
> [    1.021484] snd_hda_codec_generic hdaudioC0D0:    mono: mono_out=0x0
> [    1.021484] snd_hda_codec_generic hdaudioC0D0:    dig-out=0x3/0x5
> [    1.021485] snd_hda_codec_generic hdaudioC0D0:    inputs:
> [    1.046053] snd_hda_codec_realtek hdaudioC1D0: autoconfig for ALC892: line_outs=1 (0x14/0x0/0x0/0x0/0x0) type:line
> [    1.046054] snd_hda_codec_realtek hdaudioC1D0:    speaker_outs=0 (0x0/0x0/0x0/0x0/0x0)
> [    1.046055] snd_hda_codec_realtek hdaudioC1D0:    hp_outs=1 (0x1b/0x0/0x0/0x0/0x0)
> [    1.046055] snd_hda_codec_realtek hdaudioC1D0:    mono: mono_out=0x0
> [    1.046056] snd_hda_codec_realtek hdaudioC1D0:    inputs:
> [    1.046057] snd_hda_codec_realtek hdaudioC1D0:      Front Mic=0x19
> [    1.046058] snd_hda_codec_realtek hdaudioC1D0:      Rear Mic=0x18
> [    1.046058] snd_hda_codec_realtek hdaudioC1D0:      Line=0x1a
> 
> I also have an ASUS RX 480 graphics card with HDMI audio output.
