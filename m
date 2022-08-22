Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C298359B9C6
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Aug 2022 08:46:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 55D87E11;
	Mon, 22 Aug 2022 08:46:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 55D87E11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661150812;
	bh=/WBrEXie/csTYo53Auw5ej2TTTqSrde835TPpGpxMLQ=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TAxP1arZ6TQ7KgWfCEncbf+zO304zYLrAQvIkogETyjEOqd/sxIyxX+SHGh4LV+r2
	 cz8S4xPebB+QgyS8no6jcHIOK5VGMCQ2NVZPI2lhGA4gQ3ERTj25IJhwRl+3KR9lR2
	 m94KbkZKMdUXc+oZT/U/+gfD/inm8VUAVUyl7q34=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1038F8026D;
	Mon, 22 Aug 2022 08:45:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B44A2F8026A; Mon, 22 Aug 2022 08:45:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 1FDA8F80152
 for <alsa-devel@alsa-project.org>; Mon, 22 Aug 2022 08:45:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1FDA8F80152
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1661150747490509987-webhooks-bot@alsa-project.org>
References: <1661150747490509987-webhooks-bot@alsa-project.org>
Subject: missing sound on kernel-5.15
Message-Id: <20220822064550.B44A2F8026A@alsa1.perex.cz>
Date: Mon, 22 Aug 2022 08:45:50 +0200 (CEST)
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

alsa-project/alsa-lib issue #264 was opened from chihhao-chen:

I am testing many types of headsets on Android platform with different kernel versions.

On kernel-5.10, calling sequence before playback is
snd_usb_hw_params -> set highest sampling rate, no SAMPLING_FREQ_CONTROL USB request in this stage
snd_pcm_release
snd_usb_hw_params -> set proper sampling rate, still no SAMPLING_FREQ_CONTROL USB request 
snd_usb_pcm_parepare -> in configure_endpoint SAMPLING_FREQ_CONTROL USB request  was sent

With the same calling sequence, a slightly behavior change on kernel-5.15 is
snd_usb_hw_params -> set highest sampling rate, SAMPLING_FREQ_CONTROL USB request  was sent
snd_pcm_release
snd_usb_hw_params -> set proper sampling rate, SAMPLING_FREQ_CONTROL USB request  was sent too
(because configure_endpoint was moved to snd_usb_hw_params function)
snd_usb_pcm_parepare -> no SAMPLING_FREQ_CONTROL USB request  because of USB EP flag check

I checked all USB packets and confirmed audio data output was correct.
But there may be missing sound problem for the first sound with many headsets (for example Samsung headset).
I found this issue is related to two-times sampling rate set request.
(I tried forcibly skip first USB request, everything became okay.)
So do you guys know why configure_endpoint was moved to snd_usb_hw_params?
Or could you provide patch for this problem?

Many thanks
Chihhao

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/264
Repository URL: https://github.com/alsa-project/alsa-lib
