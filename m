Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A03A01D6893
	for <lists+alsa-devel@lfdr.de>; Sun, 17 May 2020 17:22:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50BC21675;
	Sun, 17 May 2020 17:22:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50BC21675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589728972;
	bh=TD3Yffju96qiwFC9PDPZ5kEQesZD1g96j4cTkne1x8g=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QP0puyleumO4oaDYovPQjObnpJSuEtOXrDKpX8DmFgtZFgpABYMIBDbmzJjw1Vdi8
	 PaFZuk5hlgKyhE8FD9vOb2ecDcTORGaJBLd2nPXSjcNcMUrDDONNQ7By5uP20bDYyU
	 WQ0LUIJdo+nIvNiuUQj6d9sXboxvuiTyTdaf9ysY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7082EF8028E;
	Sun, 17 May 2020 17:20:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 999C9F8027D; Sun, 17 May 2020 17:20:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 122BCF801F8
 for <alsa-devel@alsa-project.org>; Sun, 17 May 2020 17:20:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 122BCF801F8
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1589728841897551060-webhooks-bot@alsa-project.org>
References: <1589728841897551060-webhooks-bot@alsa-project.org>
Subject: no audio when using the dshare plugin with ALSA driver using indirect
 PCM data transfer
Message-Id: <20200517152044.999C9F8027D@alsa1.perex.cz>
Date: Sun, 17 May 2020 17:20:44 +0200 (CEST)
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

alsa-project/alsa-lib issue #51 was edited from bondagit:

Hi all,

I am currently working on an open source project on GitHub [AES67 Linux daemon implementation](https://github.com/bondagit/aes67-linux-daemon).
This project uses the [Merging Technologies ALSA RAVENNA/AES67 Linux Driver](https://bitbucket.org/MergingTechnologies/ravenna-alsa-lkm/src/master).
This ALSA driver does support the mmap access using the indirect PCM data transfer.

The driver is working properly when used directly but not when it's used via the **dshare** plugin.
See issue [No sound using dshare in asound.conf](https://github.com/bondagit/aes67-linux-daemon/issues/7) in the AES67 Linux daemon project.

For all my tests I used the **Linux Kernel 5.3.0-51** and the **alsa-lib v1.1.9** but I get same results with most recent kernel and with the **alsa-lib** on the master branch.

Basically when I playback a sample PCM audio using the ALSA RAVENNA/AES67 HW device directly via mmap I get a proper playout. 
Ex: `aplay -D hw:1 sample.raw -M`
But if I do the same using the dshare plugin I do always get no audio (silence):
Ex: `aplay -D mydshare sample.raw -M`

After a number of tests trying to compare the behavior of the **alsa-lib** when using the ALSA driver directly (aplay -D hw:1) and when using the plugin (aplay -D mydshare) I realized that in the second case the  **SNDRV_PCM_IOCTL_SYNC_PTR ioctl**  is never triggered in the audio loop by the **alsa-lib** . (I could easily capture this by using strace).
I would expect the `snd_pcm_dshare_mmap_commit() `function of **alsa-lib** to invoke the above ioctl but this is not happening.
The result is that in the ALSA driver the **ack()** callback is not called to indicate that the **appl_ptr** is updated and this causes the problem we have.

In the Linux kernel when the ioctl SNDRV_PCM_IOCTL_SYNC_PTR is called the following functions are called: 
`snd_pcm_sync_ptr() -> pcm_lib_apply_appl_ptr() -> substream->ops->ack() `
but as stated above this is happening only if the ALSA driver is used directly (aplay -D hw:1) and not when it's used via the plugin (aplay -D mydshare).

I could fix the issue applying the following temporary fix to the `alsa-lib`:
```
diff --git a/src/pcm/pcm_dshare.c b/src/pcm/pcm_dshare.c
index f135b5df..1f103414 100644
--- a/src/pcm/pcm_dshare.c
+++ b/src/pcm/pcm_dshare.c
@@ -562,6 +562,7 @@ static snd_pcm_sframes_t snd_pcm_dshare_mmap_commit(snd_pcm_t *pcm,
                /* clear timer queue to avoid a bogus return from poll */
                if (snd_pcm_mmap_playback_avail(pcm) < pcm->avail_min)
                        snd_pcm_direct_clear_timer_queue(dshare);
+               dshare->spcm->fast_ops->mmap_commit(dshare->spcm, offset, size);
        }
        return size;
 }
```
The fix basically triggers the call to the `snd_pcm_hw_mmap_commit()` function of the slave pcm of the dshare plugin. This function invokes the ` issue_applptr() ` and then the `sync_ptr1()` that finally calls the SNDRV_PCM_IOCTL_SYNC_PTR ioctl to update the **appl_ptr** in the kernel.

After applying this fix I can properly hear the audio.

I am available to provide any additional information and to do additional tests.
Since I don't have much experience with the `alsa-lib` it can be that the problem is related to some misconfiguration but at present I managed to solve the issue only by applying the above fix.

Thanks in advance for your help.

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/51
Repository URL: https://github.com/alsa-project/alsa-lib
