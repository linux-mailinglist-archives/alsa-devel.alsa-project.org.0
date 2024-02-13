Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E688853385
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Feb 2024 15:47:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9D0D83E;
	Tue, 13 Feb 2024 15:47:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9D0D83E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707835673;
	bh=y41JaSKfeWVzFEq+5e6C1oXttwhw87cx5j4UR/t5CEQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PaXcRnX9U9FyopBcJiB42fvG8BdchQmKxdL20XNArK4Laxob6vLCQY4zVzISRvE6i
	 azuHcmU876EOhnjI62wZGYgsxS+0gY7qbnU0upV5p9ePGFJiwzEqBrgutjO5tYChnH
	 zy7x8lAxarqXIKp9n4keTGNwBLCNa4eTBI6j48Go=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5C407F80589; Tue, 13 Feb 2024 15:47:22 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0814CF8059F;
	Tue, 13 Feb 2024 15:47:21 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D097EF80238; Tue, 13 Feb 2024 15:47:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D28D2F80104
	for <alsa-devel@alsa-project.org>; Tue, 13 Feb 2024 15:47:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D28D2F80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=xolAhlOy
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0AC10614C9;
	Tue, 13 Feb 2024 14:47:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17313C433C7;
	Tue, 13 Feb 2024 14:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1707835622;
	bh=y41JaSKfeWVzFEq+5e6C1oXttwhw87cx5j4UR/t5CEQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xolAhlOyVyuVZiyTDvGcKEtXr91VbRn3NP78HOEfVuOkMh+wvKqU4weNl61OENra5
	 IxxbbSXJx9PMEBajc4PuoKVJVt1atEh3kJBNEfy9J/TeOa30svjeMS1kzQIXlXn1d9
	 WLiZIyv76SL0gDQgCB4g09P7JnF2bsKhydBDnXvU=
Date: Tue, 13 Feb 2024 15:46:59 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Ted Chang <tedchang2010@gmail.com>, stable@vger.kernel.org,
	regressions@lists.linux.dev, venkataprasad.potturu@amd.com,
	"perex@perex.cz" <perex@perex.cz>, alsa-devel@alsa-project.org,
	broonie@kernel.org, linux@leemhuis.info,
	linux-sound@vger.kernel.org
Subject: Re: [REGRESSION] Acp5x probing regression introduced between kernel
 6.7.2 -> 6.7.4
Message-ID: <2024021342-overshoot-percent-a329@gregkh>
References: 
 <CAD_nV8BG0t7US=+C28kQOR==712MPfZ9m-fuKksgoZCgrEByCw@mail.gmail.com>
 <CAD_nV8B=KSyOrASsbth=RmDV9ZUCipxhdJY3jY02C2jQ6Y34iA@mail.gmail.com>
 <87bk8kkcbg.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87bk8kkcbg.wl-tiwai@suse.de>
Message-ID-Hash: BFNANBKZ7XXHCEZNWT4MQXB6GLFHESJB
X-Message-ID-Hash: BFNANBKZ7XXHCEZNWT4MQXB6GLFHESJB
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BFNANBKZ7XXHCEZNWT4MQXB6GLFHESJB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Feb 13, 2024 at 09:17:39AM +0100, Takashi Iwai wrote:
> On Mon, 12 Feb 2024 15:32:45 +0100,
> Ted Chang wrote:
> > 
> > 
> > Hi everyone,
> > Takashi Iwai suggested that I test OBS home:tiwai:bsc1219789 repo. His comment
> > suggest he reverted commit
> > c3ab23a10771bbe06300e5374efa809789c65455 ASoC: amd: Add new dmi entries for
> > acp5x platform. My audio seems to work again
> > 
> > [    7.420289] acpi_cpufreq: overriding BIOS provided _PSD data
> > [    7.439331] snd_pci_acp5x 0000:04:00.5: enabling device (0000 -> 0002)
> > [    7.574796] snd_hda_intel 0000:04:00.1: enabling device (0000 -> 0002)
> > [    7.574980] snd_hda_intel 0000:04:00.1: Handle vga_switcheroo audio client
> > [    7.577788] kvm_amd: TSC scaling supported
> > [    7.577794] kvm_amd: Nested Virtualization enabled
> > [    7.577796] kvm_amd: Nested Paging enabled
> > [    7.577799] kvm_amd: SEV enabled (ASIDs 1 - 14)
> > [    7.577802] kvm_amd: SEV-ES disabled (ASIDs 0 - 0)
> > [    7.577824] kvm_amd: Virtual VMLOAD VMSAVE supported
> > [    7.577825] kvm_amd: Virtual GIF supported
> > [    7.577827] kvm_amd: LBR virtualization supported
> > [    7.589223] MCE: In-kernel MCE decoding enabled.
> > [    7.590386] snd_hda_intel 0000:04:00.1: bound 0000:04:00.0 (ops amdgpu_dm_audio_component_bind_ops [amdgpu])
> > [    7.591577] cs35l41 spi-VLV1776:00: supply VA not found, using dummy regulator
> > [    7.591644] cs35l41 spi-VLV1776:00: supply VP not found, using dummy regulator
> > [    7.595880] input: HD-Audio Generic HDMI/DP,pcm=3 as /devices/pci0000:00/0000:00:08.1/0000:04:00.1/sound/card0/input17
> > [    7.596790] input: HD-Audio Generic HDMI/DP,pcm=7 as /devices/pci0000:00/0000:00:08.1/0000:04:00.1/sound/card0/input18
> > 
> > https://build.opensuse.org/project/show/home:tiwai:bsc1219789
> > 
> > Now I'm building a test kernel with the revert of the suspected backport patch.
> > It's being built in OBS home:tiwai:bsc1219789 repo.  Please give it a try later once after the build finishes (takes an hour or so).
> > 
> > So the culprit was the stable commit 4b6986b170f2f23e390bbd2d50784caa9cb67093, which is the upstream commit c3ab23a10771bbe06300e5374efa809789c65455
> >     ASoC: amd: Add new dmi entries for acp5x platform
> 
> Greg, could you revert the commit
> 4b6986b170f2f23e390bbd2d50784caa9cb67093 on 6.7.y?
> 
> Apparently it caused the regression on Steam Deck, the driver probe
> failed with that backport alone.

Now reverted, as well as on 6.6.y and 6.1.y.

thanks,

greg k-h
