Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C683654EDC
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Dec 2022 10:54:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0744E70FF;
	Fri, 23 Dec 2022 10:53:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0744E70FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671789280;
	bh=WhbwCiQF5/KGKkxnGIs57nkLI4NZ11nY7lo6fMkddEc=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Hd6qdS02cO9dNfN/5jKPi/hTuGR83R65j7anmPCIhBd3IM4LkE/EDrQroMEOZfs1z
	 yk2qT771oSYhR8DZMc1Kw6jgzpt6xmjGvQiT4w+FEXbZdQdswB6fWjl5ItzeOifCuD
	 0Ky6ZvT3eSripUAIlCWuLLX4aH+qYZSIk7wRM+4I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 89686F80423;
	Fri, 23 Dec 2022 10:53:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 11C77F8047B; Fri, 23 Dec 2022 10:53:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 RCVD_IN_DNSWL_HI,SPF_FAIL,SPF_HELO_NONE shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id EB086F803DC
 for <alsa-devel@alsa-project.org>; Fri, 23 Dec 2022 10:53:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB086F803DC
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1671789218345025063-webhooks-bot@alsa-project.org>
References: <1671789218345025063-webhooks-bot@alsa-project.org>
Subject: alsaloop: confusing line of code and easier example of the use of
 snd_pcm_poll_descriptors API
Message-Id: <20221223095341.11C77F8047B@alsa1.perex.cz>
Date: Fri, 23 Dec 2022 10:53:41 +0100 (CET)
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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

alsa-project/alsa-utils issue #185 was opened from anthonio9:

Hi! Recently I've been studying the `alsaloop` software, I'm trying to understand how should the `snd_pcm_poll_descriptors` api be used reliably. Reading through the `pcmjob.c` file I've noticed that in the `pcmjob_pollfds_handle` function in line 1964 there's a condition that does not exactly make sense to me. What's the purpose of variable `loopcount`? If the code is more or less

```cpp
int loopcount = 0;

do
{
// instructions
loopcount++;
} while ((ccount > 0 || pcount > 0) && loopcount > 10); // line 1964
```
isn't it equal to running the loop just once without any loops? After all, the `loopcount` will never reach 10 and the conditional statement will always turn false finishing the loop after one iteration. Correct me if I'm wrong.

I'd also appreciate a simpler example than `alsaloop` focusing just on the audio parts, on transferring audio from input to output reliably with the use of `snd_pcm_poll_descriptors`.

Thanks

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/185
Repository URL: https://github.com/alsa-project/alsa-utils
