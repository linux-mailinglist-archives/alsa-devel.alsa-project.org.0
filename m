Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A20497C4D
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jan 2022 10:44:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B7D852968;
	Mon, 24 Jan 2022 10:43:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B7D852968
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643017447;
	bh=iA1MVhSEhdtJD4n7MML5nFp+2YfpM7Qj78TGM0kP5Do=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=shQ6fJ8nmFSHx+DgpENDg90cGqcr/lNgNsrGlGhbH0uYeQMMf4c868wB9iCOBkGTc
	 jVwc1Rr211eLJBxsQtCVzNVD/r4k2EnOeLZeg16pFlfXK2n3FjmFaG/tdELb5IUE/Y
	 SE3BnpZhXkuZFFhZPHqXlzBHjN8ouCJeCdpcHvxg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3691CF802BE;
	Mon, 24 Jan 2022 10:43:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6A934F8027C; Mon, 24 Jan 2022 10:43:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3CA41F80083
 for <alsa-devel@alsa-project.org>; Mon, 24 Jan 2022 10:42:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3CA41F80083
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com
 header.b="ecJJLXJ/"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="CQdazKNE"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 87BD758011C;
 Mon, 24 Jan 2022 04:42:48 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 24 Jan 2022 04:42:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=P8UmLlHN9BGZ+esvPmRpvSz5It+8CW0B+z+h7m
 qv6Lk=; b=ecJJLXJ/Kp+Nil5/vc883vHJk0/KIyb7hhP6iSXTTwzya3ojRgChVc
 DBSgFpaUJvhlR19igIj7rP/8a6b9U7Zfao78fE3uAiC7OPTs9WBOg3OXKEgTq6As
 yHWL6V27q4Pc5wakooL62EM9Ay571LdJnWIN+vB5Sz2OWOGhF0qQlZ016kF6Ypjk
 e44rbAzwp20w7Swk6267ZY64ny1/KyVT1Zfiqzo1mi2GaFRRJzOnFANlrqVPz2oc
 9NWd9GmZ6lOCEgVWj9+7EC2r3UOVkR48J9ZfUiVNMaVXOAAlOveCtbaMbLQsLxjE
 KOTQihe1Gdg5irRZGN5ygmaXnn80t1EQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=P8UmLlHN9BGZ+esvP
 mRpvSz5It+8CW0B+z+h7mqv6Lk=; b=CQdazKNEiq2FcHTlFL0uPMb5vLW/qC86C
 o7moITxwIk/AdB90Xz1k1g9FpRlBS60WhckuoXzIh6ee7yQZOfcp1fvi7Lhv180Z
 RRDN2wsC5LP0twXOE842WI4MMRtGDwajK5p1LWPjO34veG/oH+NJ25WfhQ3fK+rd
 P4vWqFj6dPQlkm74sxZqhpdjoYNL/eD4woYay8uEELNkVbwPSYpqT3npzcElZIos
 tbcSHbcyqMIGuJYagh05xZ6tz+QgNe9ZwhSrBGAq4E2u5MmafmcEauaTBtaZxtXT
 9jKZbqWnRTA8zuiUmr2nCwSE4ZnTJdrX04g6Ug+/JdEiNsj+r5qUQ==
X-ME-Sender: <xms:l3TuYZs4WYtzYXKGvUmlQZ6qTEAL0VXvL83nP6AfxPNEYavh0ZIqUA>
 <xme:l3TuYSd4sl5uGKM2T9fKLT8vT4LXROUpCdQNG8XXrlczU6aewlHw3STG3ZPtbab43
 XikM_8TVBRYeQ>
X-ME-Received: <xmr:l3TuYcyKRDeVDHiosVw6unhQ6Vw3IaTpC6SmyCbW2zDAXJo3CLbqDNcF6cWeUfKkhs93civ1pSfqVBhj9xtUPX875W7G2DN2>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrvdeigddtjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfm
 jfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepveeuheejgf
 ffgfeivddukedvkedtleelleeghfeljeeiueeggeevueduudekvdetnecuvehluhhsthgv
 rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrd
 gtohhm
X-ME-Proxy: <xmx:l3TuYQPN1T0BEGzqQVp5X59NbIZEWA_RehUCZ7K4JsdrYy9FlZur4g>
 <xmx:l3TuYZ_AQD8MtjTxP_2h-y5A68SyWBzDsHAN5SeMho1BCLjw78wTCg>
 <xmx:l3TuYQV6GxHEv58_OUO5trHPu3PteZtoWQDNmeDSWRPb86Z5vwBQyA>
 <xmx:mHTuYfPCJPPU7ZpKL8-FeKWHVMnp3DfwfihodT2qB4adsocIWEcQlg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 24 Jan 2022 04:42:47 -0500 (EST)
Date: Mon, 24 Jan 2022 10:42:45 +0100
From: Greg KH <greg@kroah.com>
To: Will McVicker <willmcvicker@google.com>
Subject: Re: [PATCH v1 1/1] ASoC: dpcm: prevent snd_soc_dpcm use after free
Message-ID: <Ye50ldr/4/TW7S/3@kroah.com>
References: <20220121231644.1732744-1-willmcvicker@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220121231644.1732744-1-willmcvicker@google.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, stable@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 kernel-team@android.com, linux-arm-kernel@lists.infradead.org,
 KaiChieh Chuang <kaichieh.chuang@mediatek.com>
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

On Fri, Jan 21, 2022 at 11:16:44PM +0000, Will McVicker wrote:
> From: KaiChieh Chuang <kaichieh.chuang@mediatek.com>
> 
> [ Upstream commit a9764869779081e8bf24da07ac040e8f3efcf13a ]
> 
> The dpcm get from fe_clients/be_clients
> may be free before use
> 
> Add a spin lock at snd_soc_card level,
> to protect the dpcm instance.
> The lock may be used in atomic context, so use spin lock.
> 
> Use irq spin lock version,
> since the lock may be used in interrupts.
> 
> possible race condition between
> void dpcm_be_disconnect(
> 	...
> 	list_del(&dpcm->list_be);
> 	list_del(&dpcm->list_fe);
> 	kfree(dpcm);
> 	...
> 
> and
> 	for_each_dpcm_fe()
> 	for_each_dpcm_be*()
> 
> race condition example
> Thread 1:
>     snd_soc_dapm_mixer_update_power()
>         -> soc_dpcm_runtime_update()
>             -> dpcm_be_disconnect()
>                 -> kfree(dpcm);
> Thread 2:
>     dpcm_fe_dai_trigger()
>         -> dpcm_be_dai_trigger()
>             -> snd_soc_dpcm_can_be_free_stop()
>                 -> if (dpcm->fe == fe)
> 
> Excpetion Scenario:
> 	two FE link to same BE
> 	FE1 -> BE
> 	FE2 ->
> 
> 	Thread 1: switch of mixer between FE2 -> BE
> 	Thread 2: pcm_stop FE1
> 
> Exception:
> 
> Unable to handle kernel paging request at virtual address dead0000000000e0
> 
> pc=<> [<ffffff8960e2cd10>] dpcm_be_dai_trigger+0x29c/0x47c
> 	sound/soc/soc-pcm.c:3226
> 		if (dpcm->fe == fe)
> lr=<> [<ffffff8960e2f694>] dpcm_fe_dai_do_trigger+0x94/0x26c
> 
> Backtrace:
> [<ffffff89602dba80>] notify_die+0x68/0xb8
> [<ffffff896028c7dc>] die+0x118/0x2a8
> [<ffffff89602a2f84>] __do_kernel_fault+0x13c/0x14c
> [<ffffff89602a27f4>] do_translation_fault+0x64/0xa0
> [<ffffff8960280cf8>] do_mem_abort+0x4c/0xd0
> [<ffffff8960282ad0>] el1_da+0x24/0x40
> [<ffffff8960e2cd10>] dpcm_be_dai_trigger+0x29c/0x47c
> [<ffffff8960e2f694>] dpcm_fe_dai_do_trigger+0x94/0x26c
> [<ffffff8960e2edec>] dpcm_fe_dai_trigger+0x3c/0x44
> [<ffffff8960de5588>] snd_pcm_do_stop+0x50/0x5c
> [<ffffff8960dded24>] snd_pcm_action+0xb4/0x13c
> [<ffffff8960ddfdb4>] snd_pcm_drop+0xa0/0x128
> [<ffffff8960de69bc>] snd_pcm_common_ioctl+0x9d8/0x30f0
> [<ffffff8960de1cac>] snd_pcm_ioctl_compat+0x29c/0x2f14
> [<ffffff89604c9d60>] compat_SyS_ioctl+0x128/0x244
> [<ffffff8960283740>] el0_svc_naked+0x34/0x38
> [<ffffffffffffffff>] 0xffffffffffffffff
> 
> Signed-off-by: KaiChieh Chuang <kaichieh.chuang@mediatek.com>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> [willmcvicker: move spinlock to bottom of struct snd_soc_card]
> Signed-off-by: Will McVicker <willmcvicker@google.com>
> Cc: stable@vger.kernel.org # 4.19+
> ---
>  include/sound/soc.h  |  2 ++
>  sound/soc/soc-core.c |  1 +
>  sound/soc/soc-pcm.c  | 40 +++++++++++++++++++++++++++++++++-------
>  3 files changed, 36 insertions(+), 7 deletions(-)

Now queued up, thanks.

greg k-h
