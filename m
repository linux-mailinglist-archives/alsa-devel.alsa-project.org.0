Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E62354D468E
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Mar 2022 13:14:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B07517EA;
	Thu, 10 Mar 2022 13:13:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B07517EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646914461;
	bh=C6YTbZsly0xdAAQif2Si29+fV7l1hAcZsldtCPQW9Nc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WlPOzizyOL2rLlyyF8vmGm90SXlORzxZFQEFZJUDdq6EWP2fHiqdlfjefLU9SSbRB
	 qAGa8aK2kPXKXXCMcrMcqv01EfTV2Sr2ZwxRT7BE4uqJKQHpWMhrlPx8qyMRjee8cO
	 2zI+TB0x5gEgJF+fppKCz29/PM6Wx6v2sw1SK9Ig=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0669F8013C;
	Thu, 10 Mar 2022 13:13:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 09B02F80137; Thu, 10 Mar 2022 13:13:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB2A4F800FD
 for <alsa-devel@alsa-project.org>; Thu, 10 Mar 2022 13:13:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB2A4F800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="d3LAQZ20"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 10FB9B825BB;
 Thu, 10 Mar 2022 12:13:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F301C340EB;
 Thu, 10 Mar 2022 12:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646914384;
 bh=C6YTbZsly0xdAAQif2Si29+fV7l1hAcZsldtCPQW9Nc=;
 h=From:To:Cc:Subject:Date:From;
 b=d3LAQZ20JZwu4ouoRV/BYE6oIdtiidcpNlVlREWWBiKd0qCfEtp/PkiKkIb2ufKQF
 rtRs+BAHP19cJEKcDg7SQ+oPFVQqhbcmukz6HTEF3xX5TJC+7yO+fuABSTZsLJ+f1M
 Ys2o4CFiLpP9SI3Z7RMl0jnFovuq/ybM4I5PcDU125DnEzMEzoRteIGNG5BVTElNKl
 3jX4mtCXGnpHP1aK47VzFVGPJ9bDXDgB6Q11RVPcYsTUVFZzy2GWzQmHcfPApwZTEn
 6+4dzUBK+61F0fZ9ghC5lvpGuLx5VBTmbkOKFV5ZBV4pTmVGBE7qW8H+sjfyfLhwrv
 AKT0HfthL2dzg==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: [GIT PULL] ASoC fixes for v5.17-rc7
Date: Thu, 10 Mar 2022 12:12:55 +0000
Message-Id: <20220310121304.2F301C340EB@smtp.kernel.org>
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
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

The following changes since commit c5487b9cdea5c1ede38a7ec94db0fc59963c8e86:

  ASoC: cs4265: Fix the duplicated control name (2022-02-16 16:34:16 +0000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v5.17-rc7

for you to fetch changes up to 5e02fb590e83684f63217f93a9cdeabd6a925f9c:

  ASoC: cs35l41: Fix DSP mbox start command and global enable order (2022-03-07 13:12:38 +0000)

----------------------------------------------------------------
ASoC: Potential fixes for v5.17

Rather more fixes here than I'm comfortable with, we've had several
vendors noticing issues late in the release cycle all of which are valid
and reasonable fixes but it adds up to a much larger change set than I'd
like.  Several of the AMD fixes look like cleanups from the subject
lines but are actually fixing user visible problems as well.

If you were to merge this for 5.18 rather than 5.17 it wouldn't be the
end of the world, stable will probably backport everything anyway.

----------------------------------------------------------------
Ammar Faizi (1):
      ASoC: SOF: Intel: Fix NULL ptr dereference when ENOMEM

David Rhodes (1):
      ASoC: cs35l41: Fix GPIO2 configuration

Derek Fang (1):
      ASoC: rt5682s: Fix the wrong jack type detected

Hans de Goede (1):
      ASoC: Intel: soc-acpi-byt: Add new WM5102 ACPI HID

Lucas Tanure (2):
      ASoC: cs35l41: Fix max number of TX channels
      ASoC: cs35l41: Fix DSP mbox start command and global enable order

Ricard Wanderlof (1):
      ASoC: tlv320adc3xxx: Fix buggy return value

Srinivas Kandagatla (7):
      ASoC: codecs: rx-macro: fix accessing compander for aux
      ASoC: codecs: rx-macro: fix accessing array out of bounds for enum type
      ASoC: codecs: va-macro: fix accessing array out of bounds for enum type
      ASoC: codecs: wc938x: fix accessing array out of bounds for enum type
      ASoC: codecs: wcd938x: fix kcontrol max values
      ASoC: codecs: wcd934x: fix kcontrol max values
      ASoC: codecs: wcd934x: fix return value of wcd934x_rx_hph_mode_put

Vijendar Mukunda (5):
      ASoC: amd: vangogh: refactor i2s master mode clock sequence code
      ASoC: nau8821: enable no_capture_mute flag
      ASoC: amd: vg: update platform clock control sequence
      ASoC: amd: vg: apply sample bits pcm constraint
      ASoC: amd: vg: update acp init and deinit sequence

 sound/soc/amd/vangogh/acp5x-i2s.c                 | 26 ++++++--------------
 sound/soc/amd/vangogh/acp5x-mach.c                | 23 +++++++++++++++++-
 sound/soc/amd/vangogh/acp5x.h                     | 29 +++++++++++++++++++++++
 sound/soc/amd/vangogh/pci-acp5x.c                 |  4 ++++
 sound/soc/codecs/cs35l41.c                        | 10 ++++----
 sound/soc/codecs/lpass-rx-macro.c                 | 12 ++++++----
 sound/soc/codecs/lpass-va-macro.c                 |  4 ++--
 sound/soc/codecs/nau8821.c                        |  1 +
 sound/soc/codecs/rt5682s.c                        | 26 +++++++-------------
 sound/soc/codecs/rt5682s.h                        |  1 -
 sound/soc/codecs/tlv320adc3xxx.c                  | 12 ++++++----
 sound/soc/codecs/wcd934x.c                        | 11 +++++----
 sound/soc/codecs/wcd938x.c                        | 10 ++++----
 sound/soc/intel/common/soc-acpi-intel-byt-match.c |  2 +-
 sound/soc/sof/intel/hda-loader.c                  | 11 +++++----
 15 files changed, 114 insertions(+), 68 deletions(-)
