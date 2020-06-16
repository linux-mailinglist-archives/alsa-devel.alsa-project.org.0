Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C89D71FC14A
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jun 2020 00:03:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67B4A1679;
	Wed, 17 Jun 2020 00:02:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67B4A1679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592345009;
	bh=AA4cJTMA4yhO7XdskMxzaVvKdS1ACWScLRPV9P1J2sg=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R35KyjuiGga9FUm2tb8rkLBB7Ay2q7imFZanPlDyt/q6Koit+QhIGSXR0+hPzRoDk
	 4ghvqXksdwSIKsQGk/zJacZsxMtWqyUYw+mYaa1hVdZshB+jypy6PH2Ew4ahXs5Zkg
	 AaYtKm54nhJD4Mqe22pOwXxhaCqgNl4h31na6blI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 86D27F80232;
	Wed, 17 Jun 2020 00:01:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37D8EF80217; Wed, 17 Jun 2020 00:01:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from denise.shiny.it (denise.shiny.it [185.206.84.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4271FF80101
 for <alsa-devel@alsa-project.org>; Wed, 17 Jun 2020 00:01:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4271FF80101
Received: from wc1 (localhost [127.0.0.1])
 by denise.shiny.it (8.15.2/8.15.2) with ESMTP id 05GM1V9r030652;
 Wed, 17 Jun 2020 00:01:32 +0200
Date: Wed, 17 Jun 2020 00:01:34 +0200
From: Giuliano Pochini <pochini@shiny.it>
To: Mark Hills <mark@xwax.org>
Subject: Re: [PATCH 3/3] echoaudio: Address bugs in the interrupt handling
Message-ID: <20200617000134.60c5e2b5@wc1>
In-Reply-To: <20200616131743.4793-3-mark@xwax.org>
References: <2006161409060.30751@stax.localdomain>
 <20200616131743.4793-3-mark@xwax.org>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
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

On Tue, 16 Jun 2020 14:17:43 +0100
Mark Hills <mark@xwax.org> wrote:

> +	counter = le32_to_cpu(*pipe->dma_counter);
> +
> +	period = bytes_to_frames(runtime, counter)
> +		/ runtime->period_size;
> +	last_period = bytes_to_frames(runtime, pipe->last_counter)
> +		/ runtime->period_size;
> +
> +	if (period == last_period)
> +		return 0;  /* don't do any work yet */
> +
> +	step = counter - pipe->last_counter;

Uhmm.. no, when the dma_counter wraps around the comparison gives wrong
result, unless 4G is divisible by the buffer size.

Please consider this patch (to apply after yours). It computes the new period
using pipe->position before and after adding the amount of bytes tranferred
since the previous period.
Briefly tested - It seems ok.


Signed-off-by: Giuliano Pochini <pochini@shiny.it>

--- sound/pci/echoaudio/echoaudio.c__orig	2020-06-16 23:36:02.818601055 +0200
+++ sound/pci/echoaudio/echoaudio.c	2020-06-16 23:52:46.593325066 +0200
@@ -1781,7 +1781,7 @@
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct audiopipe *pipe = runtime->private_data;
-	unsigned counter, step, period, last_period;
+	u32 counter, step, period, last_period, pipe_position;
 	size_t buffer_bytes;
 
 	if (pipe->state != PIPE_STATE_STARTED)
@@ -1789,24 +1789,22 @@
 
 	counter = le32_to_cpu(*pipe->dma_counter);
 
-	period = bytes_to_frames(runtime, counter)
+	step = counter - pipe->last_counter;
+	pipe_position = pipe->position + step;	/* bytes */
+	buffer_bytes = frames_to_bytes(runtime, runtime->buffer_size);
+	while (pipe_position >= buffer_bytes)
+		pipe_position -= buffer_bytes;
+
+	period = bytes_to_frames(runtime, pipe_position)
 		/ runtime->period_size;
-	last_period = bytes_to_frames(runtime, pipe->last_counter)
+	last_period = bytes_to_frames(runtime, pipe->position)
 		/ runtime->period_size;
 
 	if (period == last_period)
 		return 0;  /* don't do any work yet */
 
-	step = counter - pipe->last_counter;
+	pipe->position = pipe_position;
 	pipe->last_counter = counter;
-
-	pipe->position += step;  /* bytes */
-
-	buffer_bytes = frames_to_bytes(runtime, runtime->buffer_size);
-
-	while (pipe->position >= buffer_bytes)
-		pipe->position -= buffer_bytes;
-
 	return 1;
 }
 


-- 
Giuliano.
