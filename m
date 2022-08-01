Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F55586603
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Aug 2022 10:09:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 577AD1631;
	Mon,  1 Aug 2022 10:08:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 577AD1631
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659341374;
	bh=m3VOrinQQXyZtjzFYPubuLly6AsZi+t1QRRpxfdZIzA=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pYFQkzYF+kxTPV9RFRAFpgK+v0XV9YspyGbm/Br3f+BWknCKA3IS7p50N1LvJNVOL
	 Dp+l+maA0B5dYwWUCKdZKvHnmn87pA/DHdyFEcs4p5yt8zuSTVx3I52rUDTTQy9YpS
	 O3PX+CuS/sMcTgYMtnHAa5JjEBbexRObD6k3Zats=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C6748F80246;
	Mon,  1 Aug 2022 10:08:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 588D5F8023B; Mon,  1 Aug 2022 10:08:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, NICE_REPLY_A, NO_DNS_FOR_FROM, T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 45C52F8014B
 for <alsa-devel@alsa-project.org>; Mon,  1 Aug 2022 10:08:27 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id A6360A003F;
 Mon,  1 Aug 2022 10:08:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz A6360A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1659341306; bh=rw3deZsB/ofUZsJxlsb1iwf04yFVFkrBPvoMBKSjg0s=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=AVEhNrcpMjATpoShq+85+K1zFxi3ORToKHu5UcOR+K2mehb7qWGRlA7yYpgGGM7kT
 HKxxm4MOhkWcaS238vkQBKxDCbPpFlnH7VaHAKSlwjDG9vbYUuGkRbJiR5ssPbjOzF
 mpdUfr3UJs4DBpip9tOatfr7o8MKwyrChQI04j0Y=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon,  1 Aug 2022 10:08:24 +0200 (CEST)
Message-ID: <61eda30e-6f2d-d3b1-7f87-43a25fb6ca91@perex.cz>
Date: Mon, 1 Aug 2022 10:08:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 0/4] ALSA: Defer async signal handling
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
References: <20220728125945.29533-1-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20220728125945.29533-1-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 28. 07. 22 14:59, Takashi Iwai wrote:
> Hi,
> 
> this is a revised patch series for another attempt to address the
> potential deadlocks via kill_fasync() calls that have been reported by
> syzbot for long time.  Only a missing linux/fs.h inclusion was added
> from v1 series[1].
> 
> Instead of the previous series to drop the async handler[2], this
> tries to defer the kill_fasync() call.  A few new common helpers are
> introduced at first, then the actual usages are replaced in the
> following patches.
> 
> The patches passed the quick tests with alsa-lib test cases.

Thank you for your work. The code looks good (I would only move 
schedule_work() call outside the spin lock context - commented in the patch 
thread).

Reviewed-by: Jaroslav Kysela <perex@perex.cz>

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
