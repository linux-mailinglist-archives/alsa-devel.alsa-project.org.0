Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9A863E38C
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Nov 2022 23:38:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A91A16C9;
	Wed, 30 Nov 2022 23:37:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A91A16C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669847923;
	bh=CUZBsG1DO6rcGI8YotifUnRbUKm8m7kdGUdOp7tqyeg=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a3bNdJP/6LyRfuxSrz64eZmz/G1G9mTp7+qROM5KUhsptQ/kE80xl91t9Fc+jdFrv
	 YPrV7eFiYMNKPLzRnjv0V0DpeZF1hpZfzmQ1Jf8LhLodNS3AtQZtG4ORFiDRFqlHks
	 i/ia/r5jtCrgW+VnDHxcBRkFOLqW66Oh12uvGdIs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF96EF800B6;
	Wed, 30 Nov 2022 23:37:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 04FA0F8023A; Wed, 30 Nov 2022 23:37:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, PRX_BODY_30, RCVD_IN_ZEN_BLOCKED_OPENDNS, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-out-auth2.hosts.co.uk (mail-out-auth2.hosts.co.uk
 [212.84.127.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B772EF800B6
 for <alsa-devel@alsa-project.org>; Wed, 30 Nov 2022 23:37:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B772EF800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=carlh.net header.i=@carlh.net
 header.b="kYWj2F81"
Received: from main.carlh.net ([164.90.213.35])
 by smtp.hosts.co.uk with esmtpsa (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim) (envelope-from <unknown@carlh.net>) id 1p0Vi1-000B32-8e;
 Wed, 30 Nov 2022 22:37:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=carlh.net; 
 s=rsa1;
 h=Content-Type:MIME-Version:References:Message-ID:In-Reply-To:Subject
 :cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QNtMN2O5+7sIWs9LHTMbk7TuP4LXPDWsutCFOVyutkI=; b=kYWj2F81f3t1mC+YEuMmC9MwwG
 TxOPY0TfPwIyNZoMgNHgsizcWc8PP81rdbcNm7du22NGScZ6dI5e81wyZLCmTy6J87b4KX9Cn1ZbC
 M9VeJ+SNLkcnn+KsOrXuhOY1LOnf/Ry/ooljkGYrdTOt/CHaSjBTQVizWwy9skB2EOJwPg81i0+QB
 ZB7Z5M5KdOH6e7vgs+TODUPy2fVKoiE+7yNg5TqrGb6wxaqi+a2Df4MXm4Syqkp3nvD7puCtt9E8T
 hM3/qmsOFjR4oY5Q7uujeMI9HBjfYrSeBUtGpiYXYfAvEtvQh+YuvnSuNkHQ1xQboxriE4gIzfnD/
 MuV7Mqig==;
Received: from carl (helo=localhost)
 by main.carlh.net with local-esmtp (Exim 4.94.2)
 (envelope-from <unknown@carlh.net>)
 id 1p0Vhz-006LFV-GR; Wed, 30 Nov 2022 22:37:39 +0000
Date: Wed, 30 Nov 2022 22:37:39 +0000 (GMT)
From: Carl Hetherington <lists@carlh.net>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: Query about xrun on usb/pcm
In-Reply-To: <87fse2qk51.wl-tiwai@suse.de>
Message-ID: <18aa8f93-92c7-eea-101f-8982292b6e18@carlh.net>
References: <b4e71631-4a94-613-27b2-fb595792630@carlh.net>
 <87y1s3v4ba.wl-tiwai@suse.de> <e830ee7b-e79e-54fb-a2ca-ffffd777b3f@carlh.net>
 <87edtv6pi6.wl-tiwai@suse.de> <baa6589-184f-6751-71be-1d5d67f8a6d5@carlh.net>
 <87fse2qk51.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam_score: -1.9
X-Spam_bar: -
Cc: alsa-devel@alsa-project.org
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

Hi Takashi,

> > Thanks for the suggestion.  I experimented a little with this, but I
> > think the problem I'm seeing is that (even if the application knows it
> > should retry the snd_pcm_prepare() step) we still end up with an endpoint
> > in EP_STATE_STOPPING while the corresponding stop_operating flag is 0.
>
> Ah, I guess that's a fallout in the logic.  When XRUN happens at start
> -- receiving an -EPIPE error at snd_pcm_do_start() -- then the patch
> sets the XRUN state.  This assumed that the stream gets stopped the
> following snd_pcm_undo_start() call.  Indeed it does stop but there we
> forgot setting stop_operating flag unlike what snd_pcm_stop() does.

Thanks for the hint.  I checked it out again, and in fact I'm seeing the
-EPIPE come back from snd_pcm_do_prepare().  It starts its sync-stop,
another xrun comes in (as we talked about before), it tries to
start_endpoints() and that fails.

A fairly similar thing to what you suggested seems to work for me:

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index f38c2e5e9a29..0b61943cca98 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -1948,9 +1948,17 @@ static void snd_pcm_post_prepare(struct snd_pcm_substream *substream,
 	snd_pcm_set_state(substream, SNDRV_PCM_STATE_PREPARED);
 }

+
+static void snd_pcm_undo_prepare(struct snd_pcm_substream *substream,
+				 snd_pcm_state_t state)
+{
+	substream->runtime->stop_operating = true;
+}
+
 static const struct action_ops snd_pcm_action_prepare = {
 	.pre_action = snd_pcm_pre_prepare,
 	.do_action = snd_pcm_do_prepare,
+	.undo_action = snd_pcm_undo_prepare,
 	.post_action = snd_pcm_post_prepare
 };


Can you see any problems with that?  In the application code I do need
to re-try the snd_pcm_prepare() if one fails with -EPIPE, but with this
undo step the second snd_pcm_prepare() is able to recover the endpoint
states, instead of hitting this problem where it tries to start things
that are STOPPING, but also won't set things to STOPPED because
stop_operating is false.

Thanks and best regards,
Carl


