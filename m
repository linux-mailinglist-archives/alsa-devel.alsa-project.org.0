Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2FB581F9E
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Jul 2022 07:42:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF21B1614;
	Wed, 27 Jul 2022 07:41:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF21B1614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658900569;
	bh=BaNXWWFyt8OAhwYMd7BZk9if4XfVS7PbdDcVuhzK89w=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=asexqgHWTKHF91ZJFnEoWog2Tb4YRHgartAwEx5P8nviT8UAKvE2Y1Vi4lKlnDra7
	 ykUNg7y6rksYWiq5J2p4KbquE5M76rUCWTSXM14/J0968sSAgbdTM3IXI6wivp7JkV
	 fTwz0blrT4C1xcPtQoCYGScR+5FeLhDgJLXIonk0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C6E0FF804DA;
	Wed, 27 Jul 2022 07:41:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2FB9DF804C3; Tue, 26 Jul 2022 17:36:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from neo-zeon.de (neo-zeon.de [70.229.12.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 855F8F800FA
 for <alsa-devel@alsa-project.org>; Tue, 26 Jul 2022 17:35:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 855F8F800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=neo-zeon.de header.i=@neo-zeon.de
 header.b="hwHjKqLQ"
Received: from neo-zeon.de (localhost [::1])
 by neo-zeon.de (OpenSMTPD) with ESMTP id 359904d2;
 Tue, 26 Jul 2022 08:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=neo-zeon.de; h=message-id
 :date:mime-version:subject:to:cc:references:from:in-reply-to
 :content-type:content-transfer-encoding; s=1; bh=eSQmzwMTJyGTFWU
 8+xC/HAoUcSc=; b=hwHjKqLQtvX6aMEmlgrDFEwCCjnMP+TNrFVXy/1irFT4sco
 dhQusQUjsbqySE89nq876HqiYJPE0VLmOuIev4cJ/oKoz0iq2McPGSM6nFLQkd9D
 QVvOfuf4TDVXrG/HFXNiouq8mEpKKVEGggZQYrYU8ItQs9u647ODy+6KSMEI=
Received: by neo-zeon.de (OpenSMTPD) with ESMTPSA id 24759ee6
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Tue, 26 Jul 2022 08:35:49 -0700 (PDT)
Message-ID: <91e34de4-1c85-073f-9c24-ce3133394fe6@neo-zeon.de>
Date: Tue, 26 Jul 2022 08:35:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/2] Add support for CLSA0101
Content-Language: en-US
To: Lucas Tanure <tanureal@opensource.cirrus.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <20220726101131.68058-1-tanureal@opensource.cirrus.com>
From: Cameron Berkenpas <cam@neo-zeon.de>
In-Reply-To: <20220726101131.68058-1-tanureal@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 27 Jul 2022 07:41:04 +0200
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

Hello,

I can confirm this does _not_ work.

More specifically, with these patches, the original behavior still occurs:
1. You get left channel audio from the right speaker only.
2. No sound at all after resuming from sleep.
3. You get sound after resuming from hibernate, but only as described in #1.

If you apply a patch like this: https://paste-bin.xyz/71355

You  get properly working audio until you put the laptop to sleep or 
hibernate. Upon resuming from either state, you get no audio at all.

On 7/26/22 03:11, Lucas Tanure wrote:
> Add Support for the CLSA0101 laptop, an Intel version of CLSA0100.
> This patch has been tested using the CLSA0100, ensuring it
> doesn't break the sound for it.
> We appreciate it if someone with CLSA0101 could verify that this
> the patch works for them.
>
> Lucas Tanure (2):
>    ALSA: hda: cs35l41: Use the CS35L41 HDA internal define
>    ALSA: hda: cs35l41: Support CLSA0101
>
>   sound/pci/hda/cs35l41_hda.c   | 67 +++++++++++++++++++++--------------
>   sound/pci/hda/patch_realtek.c | 12 +++++++
>   2 files changed, 53 insertions(+), 26 deletions(-)
>

