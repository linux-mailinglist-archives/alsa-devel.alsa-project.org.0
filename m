Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDE058EF90
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Aug 2022 17:43:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB6CC15F9;
	Wed, 10 Aug 2022 17:42:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB6CC15F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660146201;
	bh=umL2E7ONlku5uJbP60Hc7ct0oMGDcrcfIbZjR9nogIU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SpyHpqxEl1ECaPaIEQamF0Oc100BjGOonp8rHh03dtnmvpweVEzbhobLCRaLAQ+PU
	 8gbyGenKSLz3cqFBnZt8XInLUPlaJPaFB67VZwX2ckQNOJqvzHq/X30YTvo68fE2HH
	 tV288kKpGicXXw4FDBoTXUs7R3/Oy4CO0Wqvux5E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3BEB3F80240;
	Wed, 10 Aug 2022 17:42:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C4C86F801F5; Wed, 10 Aug 2022 17:42:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 1E020F8012A
 for <alsa-devel@alsa-project.org>; Wed, 10 Aug 2022 17:42:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E020F8012A
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1660146137591833115-webhooks-bot@alsa-project.org>
References: <1660146137591833115-webhooks-bot@alsa-project.org>
Subject: ALSA: Setting FIFO type as the slave for dsnoop
Message-Id: <20220810154220.C4C86F801F5@alsa1.perex.cz>
Date: Wed, 10 Aug 2022 17:42:20 +0200 (CEST)
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

alsa-project/alsa-lib issue #257 was opened from cnkoder:

**Problem**

I am facing problems in using "dsnoop" to share/divide the audio stream into two. When dsnoop plugins' slave is set to be a FIFO it throws an error.

executed:

    sudo arecord -D default -f cd defRecording.wav -c 1 -r 32000

error:

    ALSA lib pcm_direct.c:1809:(_snd_pcm_direct_get_slave_ipc_offset) Invalid type 'fifo' for slave PCM

    arecord: main:828: audio open error: Invalid argument



This is the current asound.conf settings

asound.conf

<!-- begin snippet: js hide: false console: true babel: false -->

<!-- language: lang-html -->

    pcm.!default {
        type asym
        playback.pcm "playback"
        capture.pcm "capture1 "
    }

    pcm.playback {
        type plug
        slave.pcm "eci"
    }

    # Stream Output 1: Final
    pcm.capture1 {
        type plug
        slave.pcm "array"
    }

    # Stream Output 2: Final
    pcm.capture2 {
        type plug
        slave.pcm "array"
    }

    # Used to share the record device
    pcm.array {
        type dsnoop
        slave {
            pcm "eco"
            channels 1
        }
        ipc_key 666666
    }

    # Writes audio coming from any sort of player to ec.input, this is read by the echo
    # cancellation software.
    pcm.eci {
        type plug
        slave {
            format S16_LE
            rate 32000
            channels 1
            pcm {
                type file
                slave.pcm null
                file "/tmp/ec.input"
                format "raw"
            }
        }
    }

    # Read FIFO output which contains echo cancelled audio
    pcm.eco {
        type plug
        slave.pcm {
            type fifo
            infile "/tmp/ec.output"
            rate 32000
            format S16_LE
            channels 1
        }
        #ipc_key 666666
    }

<!-- end snippet -->

Note:
eco is used to read the FIFO file which contains the echo canceled audio coming in from cancellation software. This software's input is hw:0 and records audio directly from the microphone, and then processes and passes this over to ec.output

Dsnoop works well when the slave.pcm is a hardware device but as soon as I point to something else it fails. 
Is there a workaround or any other solution to tackle this problem?

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/257
Repository URL: https://github.com/alsa-project/alsa-lib
