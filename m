Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD3F3A08F5
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Jun 2021 03:24:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E411116CC;
	Wed,  9 Jun 2021 03:23:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E411116CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623201875;
	bh=Kue/b+Pmg484up/xJ1mlV7ZKx2I6Uvdv+NGDbug+6uI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZNLrzSM5evuBD0MzvJbWMMbLDlJ2vm+93oPE9xUQHM474Fbt4NBOpz73+EoAb4CGM
	 SmzIx5Lk7vy+kWlra0WBH8nEL8sBVM4ofY10Mn23XL0BcxBj1RLQTdidiDk8PvIJCx
	 kHwkymAhpyR/W7nltZnumtNXIXPPekKJ5N0rmn0o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04A5DF804AB;
	Wed,  9 Jun 2021 03:23:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5041EF804AB; Wed,  9 Jun 2021 03:23:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B5EBF8019B
 for <alsa-devel@alsa-project.org>; Wed,  9 Jun 2021 03:22:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B5EBF8019B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="Raxb2bxx"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="aOn3cDUQ"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 5D4DF2077;
 Tue,  8 Jun 2021 21:22:50 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 08 Jun 2021 21:22:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=oTydmkZ4zuAJ15u4G+lKk/4la2
 00qsyv7gYPAQL4n60=; b=Raxb2bxxZ5KXAwxuvGHk15YyRS3FbmOC5n94+Bh5rK
 CG2vyieQPFzM/KvLs+3UZ2w518AvatpQ/EIRtrvzPfsVKPk+EeAKyhBXc/lIZT/z
 sIiRdjUd2Ph7dgAKivIk/s/Biq2Xp9oxJfJEQzxhabi3Q+pPjHxQaYpWO+NQHkec
 Wc0AktivinbO68ISOEChNHUtaIqjq7UflBR2zHx60ehtKZpnAP0RFlbsrrN41cML
 KtFyryUPNQpl2DgL6q0YEOpc/JITzDaUzmAnpsKifZt4Rnet6tco+qa18yWL5+nB
 /+m7NXrrkJzvfzzIGxCKI4QAXsBgTyAxwVnJ5P6mbMow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=oTydmkZ4zuAJ15u4G
 +lKk/4la200qsyv7gYPAQL4n60=; b=aOn3cDUQ8pTUzlwpt//9DbweujZvrhIWJ
 ztpWsqoL8Q1WyTpXFzQ7y3nOUuL56xeqZIblPpXrQwoYQtdmziibTLWx49L8Cyx/
 rVBv3IbjgYOn9IOzaXWtAA1AyRv1N4C+qctzdB1K1JA64PrqvH8mPpJpIw/tZ3t3
 JTLwy6J2FpUuppa0XuVLXCACyujCIgEmbYaFHOPlGN2JpYbNjnF79EYE6wAGXCDd
 62EwYFBcORUTvvWcKDbyK9Ftpvjyh9iab3HhumPTHrD/Sef1HhcnrAGS9pgtAj9l
 O5X6f4qwHsfZLFJETNT9I5TtVKCXaPZ+M08c9rg+dcyAopvew2jBQ==
X-ME-Sender: <xms:6BfAYCvoVjFg4WQ_yBgM2M2Dh39_ioIN4fb4WhBxNp6QvRXi_cOhnA>
 <xme:6BfAYHeYMbBh4m0HLRdAyJwyjcWt26SsG04DD_eTlI6oewXG2QoBZ8PsZt4dPoQ73
 0dzOVWgNfyykngXiMQ>
X-ME-Received: <xmr:6BfAYNwsLUtvlvqHbc55Ng7gTFEAfAot3yiq_4Uk29ujNtbFg2K4izmR9cKpZEYPpH0WQryQYII2--zRZYkpUJs6WpubIkZTMaheQSzg-eKfdeyEcS8S>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedutddgfeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhh
 ihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepteeiuefhjeekke
 efheetieekvdegfefhgffgvdeiheehhfehiedvhffgjeejuddunecuffhomhgrihhnpehk
 vghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
 hlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:6BfAYNMtPQAD_NVAK5QhHEp0san9ZdRjS5wDBxVmFeyk7d-F6BMaRw>
 <xmx:6BfAYC_Z_4UMsjZ1ncPSH04RUdbbLJBi0FQvtM1Tm8PbsRGlGGLiqA>
 <xmx:6BfAYFVPSmUFQZrbdz_29Z1IFwUXQMg0JOMMXgrP5BvU5cjXTeMtEA>
 <xmx:6hfAYIkAL89bEjQX4h3Pf-NVC0dUyXZcPOpL8AVMM33xB1uu4W3QbQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Jun 2021 21:22:47 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 0/3] ALSA: pcm:firewire: allow to operate for period elapse
 event in process context
Date: Wed,  9 Jun 2021 10:22:41 +0900
Message-Id: <20210609012244.24296-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, clemens@ladisch.de
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

Hi,

This patchset comes from my former RFC:

[RFC][PATCH 0/3] ALSA: pcm/firewire: allow to queue period elapse event in process context
 * https://lore.kernel.org/alsa-devel/20210606091838.80812-1-o-takashi@sakamocchi.jp/

All of drivers in ALSA firewire stack have two chances to process
isochronous packets of any isochronous context; in software IRQ context
for 1394 OHCI, and in process context of ALSA PCM application.

In the process context, callbacks of .pointer and .ack are utilized. The
callbacks are done by ALSA PCM core under acquiring lock of PCM substream,

In design of ALSA PCM core, call of snd_pcm_period_elapsed() is used for
drivers to awaken user processes from waiting for available frames. The
function voluntarily acquires lock of PCM substream, therefore it is not
called in the process context since it causes dead lock. As a workaround
to avoid the dead lock, all of drivers in ALSA firewire stack use workqueue
to delegate the call.

This patchset is my attempt for the issue. A variant of 
'snd_pcm_period_elapsed()' without lock acquisition is going to be added,
named 'snd_pcm_period_elapsed_under_stream_lock()'. The call is available
in callbacks of .pointer and .ack of snd_pcm_ops structure.

Changes from RFC:
 * dismiss inlining
 * rename function name
 * improve function comments

I tested the patchset with ALSA OXFW driver and ftrace, covering axfer and
jackd cases since pulseaudio and pipewire are programmed with timer-based
scheduling model and ALSA runtime expects drivers not to call
snd_pcm_period_elapsed().

The configuration of tracer and filters is:

```
$ sudo trace-cmd record -p function_graph \
    -l :mod:snd_firewire_lib \
    -l fw_iso_context_queue:mod:firewire_core \
    -l snd_pcm_ioctl:mod:snd_pcm \
    -l snd_pcm_period_elapsed*:mod:snd_pcm 
```

The runtime of axfer without '-M' option can often call .pointer and .ack.
Below is a sample about .pointer case via SNDRV_PCM_IOCT_HWSYNC. The new
snd_pcm_period_elapsed_under_stream_lock() should be called.

```
  3929.769359: funcgraph_entry:           | snd_pcm_ioctl() {
  3929.769360: funcgraph_entry:           |   amdtp_domain_stream_pcm_pointer() {
  3929.769361: funcgraph_entry:           |     irq_target_callback() {
  3929.769361: funcgraph_entry:           |       process_rx_packets() {
  3929.769362: funcgraph_entry:           |         process_ctx_payloads() {
  3929.769363: funcgraph_entry: 0.391 us  |           process_it_ctx_payloads();
  3929.769363: funcgraph_entry:           |           snd_pcm_period_elapsed_under_stream_lock() {
  3929.769364: funcgraph_entry: 0.411 us  |             amdtp_domain_stream_pcm_pointer();
  3929.769365: funcgraph_exit:  1.723 us  |           }
  3929.769365: funcgraph_exit:  3.106 us  |         }
  3929.769366: funcgraph_entry:           |         queue_packet() {
  3929.769366: funcgraph_entry: 0.561 us  |           fw_iso_context_queue();
  3929.769367: funcgraph_exit:  1.122 us  |         }
  3929.769367: funcgraph_exit:  5.731 us  |       }
  3929.769367: funcgraph_entry:           |       process_ctxs_in_domain() {
  3929.769368: funcgraph_entry:           |         process_tx_packets() {
  3929.769369: funcgraph_entry:           |           process_ctx_payloads() {
  3929.769369: funcgraph_entry: 0.321 us  |             process_ir_ctx_payloads();
  3929.769369: funcgraph_exit:  0.962 us  |           }
  3929.769370: funcgraph_entry: 0.491 us  |           fw_iso_context_queue();
  3929.769371: funcgraph_exit:  2.364 us  |         }
  3929.769371: funcgraph_exit:  3.427 us  |       }
  3929.769371: funcgraph_exit:  10.038 us |     }
  3929.769372: funcgraph_exit:  11.271 us |   }
  3929.769372: funcgraph_exit:  13.606 us | }
```

The runtime of jackd heavily relies on period wakeup scheduled in
invocation of interrupt handler. Below is a sample about software IRQ case
of 1394 OHCI. The snd_pcm_period_elapsed() should be called.

```
  5318.980502: funcgraph_entry:           | irq_target_callback() {
  5318.980503: funcgraph_entry:           |   process_rx_packets() {
  5318.980503: funcgraph_entry:           |     process_ctx_payloads() {
  5318.980503: funcgraph_entry: 0.531 us  |       process_it_ctx_payloads();
  5318.980505: funcgraph_entry:           |       snd_pcm_period_elapsed() {
  5318.980505: funcgraph_entry:           |         snd_pcm_period_elapsed_under_stream_lock() {
  5318.980505: funcgraph_entry: 0.180 us  |           amdtp_domain_stream_pcm_pointer();
  5318.980508: funcgraph_exit:  3.106 us  |         }
  5318.980508: funcgraph_exit:  3.497 us  |       }
  5318.980508: funcgraph_exit:  4.990 us  |     }
  5318.980508: funcgraph_entry:           |     queue_packet() {
  5318.980509: funcgraph_entry: 0.350 us  |       fw_iso_context_queue();
  5318.980509: funcgraph_exit:  0.702 us  |     }
  5318.980509: funcgraph_entry:           |     queue_packet() {
  5318.980509: funcgraph_entry: 0.291 us  |       fw_iso_context_queue();
  5318.980510: funcgraph_exit:  0.651 us  |     }
  5318.980510: funcgraph_entry:           |     queue_packet() {
  5318.980510: funcgraph_entry: 0.280 us  |       fw_iso_context_queue();
  5318.980511: funcgraph_exit:  0.641 us  |     }
  5318.980511: funcgraph_exit:  8.416 us  |   }
  5318.980511: funcgraph_entry:           |   process_ctxs_in_domain() {
  5318.980512: funcgraph_entry:           |     process_tx_packets() {
  5318.980512: funcgraph_entry:           |       process_ctx_payloads() {
  5318.980512: funcgraph_entry: 0.531 us  |         process_ir_ctx_payloads();
  5318.980513: funcgraph_entry:           |         snd_pcm_period_elapsed() {
  5318.980513: funcgraph_entry:           |           snd_pcm_period_elapsed_under_stream_lock() {
  5318.980513: funcgraph_entry: 0.170 us  |             amdtp_domain_stream_pcm_pointer();
  5318.980514: funcgraph_exit:  0.842 us  |           }
  5318.980514: funcgraph_exit:  1.242 us  |         }
  5318.980514: funcgraph_exit:  2.335 us  |       }
  5318.980515: funcgraph_entry: 0.301 us  |       fw_iso_context_queue();
  5318.980515: funcgraph_entry: 0.291 us  |       fw_iso_context_queue();
  5318.980516: funcgraph_entry: 0.290 us  |       fw_iso_context_queue();
  5318.980516: funcgraph_exit:  4.198 us  |     }
  5318.980516: funcgraph_exit:  5.119 us  |   }
  5318.980516: funcgraph_exit:  14.077 us | }
```

ALSA OXFW driver works well to select appropriate kernel API by
distinguishing running context.

I also tested for error cases that the sequence of tx packets is invalid
or packet queueing fails. In both cases, the error doesn't bring system
corruption.


Takashi Sakamoto (3):
  ALSA: pcm: add snd_pcm_period_elapsed() variant without acquiring lock
    of PCM substream
  ALSA: firewire-lib: operate for period elapse event in process
    context
  ALSA: firewire-lib: obsolete workqueue for period update

 include/sound/pcm.h           |  1 +
 sound/core/pcm_lib.c          | 68 +++++++++++++++++++++++++++--------
 sound/firewire/amdtp-stream.c | 46 ++++++++----------------
 sound/firewire/amdtp-stream.h |  1 -
 4 files changed, 68 insertions(+), 48 deletions(-)

-- 
2.27.0

