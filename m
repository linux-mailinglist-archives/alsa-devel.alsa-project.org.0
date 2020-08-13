Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB44B243ACF
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Aug 2020 15:31:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 706BE1668;
	Thu, 13 Aug 2020 15:30:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 706BE1668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597325495;
	bh=LBQZ7Bi9YKo0WHpsmdLmp1kkby9BNXQAKdIx58hU3AQ=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sHQJ1vglGpLJw/HLzwz3yy1bnqttMoRKzMSDW/8iPnaobr0CKluo2BrWOOA6xhAg/
	 neYZKwmwEBDxdwFQPEuBJ8N8iD0yqvjFuW2o8BH6GmyeMKHKN2ZTLE2uMxhSiyblsd
	 z7Y6PFwRjRFJp5ADmarT7cQgwxrfJgpfl1Uo2SOk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 96265F80161;
	Thu, 13 Aug 2020 15:29:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 61F57F8015B; Thu, 13 Aug 2020 15:29:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id B988DF800D3
 for <alsa-devel@alsa-project.org>; Thu, 13 Aug 2020 15:29:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B988DF800D3
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1597325379999676943-webhooks-bot@alsa-project.org>
References: <1597325379999676943-webhooks-bot@alsa-project.org>
Subject: pcm: dmix: fix access to sum-buffer in non-interleaved mixing mode
Message-Id: <20200813132951.61F57F8015B@alsa1.perex.cz>
Date: Thu, 13 Aug 2020 15:29:51 +0200 (CEST)
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

alsa-project/alsa-lib pull request #78 was opened from vijaypalaniswamy:

When dmix uses non-interleaved mixing mode the offset and step width
to sum_buffer was calculated by using the dmix channels instead of
the slave channels. This leads to audio distortions due to frame
corruption.

example:
- With below configuratio, Do aplay on both device in parallel for
audio distortion

pcm.dmix_2_channels {
        type dmix
        ipc_key 5678293
        ipc_perm 0660
        ipc_gid audio
        bindings [0 1]

        slave {
                pcm "hardware"
                channels 2
                periods  4
                period_time 40000
        }
}

pcm.dmix_1_channels {
        type dmix
        ipc_key 5678293
        ipc_perm 0660
        ipc_gid audio
        bindings [0]

        slave {
                pcm "hardware"
                channels 1
                periods  4
                period_time 40000
        }
}

pcm.hardware {
        type hw
        card 0
        channels 2
        rate 48000
        format S16_LE
}

Signed-off-by: Vijay Palaniswamy <vijay.palaniswamy@in.bosch.com>

Request URL   : https://github.com/alsa-project/alsa-lib/pull/78
Patch URL     : https://github.com/alsa-project/alsa-lib/pull/78.patch
Repository URL: https://github.com/alsa-project/alsa-lib
