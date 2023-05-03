Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C59AC6F5F92
	for <lists+alsa-devel@lfdr.de>; Wed,  3 May 2023 22:01:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 461121403;
	Wed,  3 May 2023 22:00:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 461121403
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683144098;
	bh=kJXPEBNI8Pvc30qg7qwOQUVOUdbv3Bq+bxX4qD9lC1U=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sa0gLBik/8g1TfFMdlyR3UUXUlR4wm3ARJ0XPCp6i031obd669bx4GCBePjED4w1g
	 GtgeSd3c0izU2qoG5CpzyVAHAuoL6yfNHZj5XyptLiFuA4ogSbfvj5EJrcTe2gmDIR
	 PuYjf7WOP6r0k2ROuLMtZ1eDvsKB5vSf01hTqMOU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AF67DF8032B;
	Wed,  3 May 2023 22:00:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 89010F8049E; Wed,  3 May 2023 22:00:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org
 [IPv6:2001:470:142:8::100])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B818FF80087
	for <alsa-devel@alsa-project.org>; Wed,  3 May 2023 22:00:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B818FF80087
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 3C63B23FA3;
	Wed,  3 May 2023 16:00:38 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1puIeT-40E-00; Wed, 03 May 2023 22:00:37 +0200
Date: Wed, 3 May 2023 22:00:37 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: linux-6.4 alsa sound broken
Message-ID: <ZFK9ZSm34Z3hQPF4@ugly>
Mail-Followup-To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.de>, Jeff Chua <jeff.chua.linux@gmail.com>,
	lkml <linux-kernel@vger.kernel.org>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	ALSA development <alsa-devel@alsa-project.org>
References: 
 <CAAJw_ZsbTVd3Es373x_wTNDF7RknGhCD0r+NKUSwAO7HpLAkYA@mail.gmail.com>
 <ZE9ngFLRqLkN6faH@ugly>
 <87wn1pmm4d.wl-tiwai@suse.de>
 <7b80ef1e-23dd-c523-0663-4bf311c1823a@perex.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <7b80ef1e-23dd-c523-0663-4bf311c1823a@perex.cz>
Message-ID-Hash: RKT6RIVBJSNBOJFOTRJ2RE7HTO2G34AQ
X-Message-ID-Hash: RKT6RIVBJSNBOJFOTRJ2RE7HTO2G34AQ
X-MailFrom: ossi@kde.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Takashi Iwai <tiwai@suse.de>, Jeff Chua <jeff.chua.linux@gmail.com>,
 lkml <linux-kernel@vger.kernel.org>, Bagas Sanjaya <bagasdotme@gmail.com>,
 ALSA development <alsa-devel@alsa-project.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RKT6RIVBJSNBOJFOTRJ2RE7HTO2G34AQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, May 03, 2023 at 09:32:02PM +0200, Jaroslav Kysela wrote:
>On 03. 05. 23 18:10, Takashi Iwai wrote:
>> The dmix uses the silence_size=boundary as a fill-all operation, and
>> it's a free-wheel mode, so supposedly something was overlooked in your
>> code refactoring.
>> 
>> Could you check it and address quickly?  I'd like to fix it before
>> 6.4-rc1 release, so if no fix comes up in a couple of days, I'll have
>> to revert the change for 6.4-rc1.
>
>I would revert this patch.

> It seems that this "do silence right after the playback is finished" 
> mechanism is not handled in the updated code (and I overlooked that, 
> too):
>
no, there is nothing wrong with the code _per se_.

what's happening is that the dmix plugin doesn't update the application 
pointer, and somehow gets away with it.

that means that it would have never worked with thresholded silencing 
mode, either, but, well, it uses top-up mode.

anyway, this means that we need to revert the code path for top-up mode, 
which means reverting most of the patch's "meat".
i think i can do better than your proposal, but not today anymore.

fwiw, the echo results from the plugin apparently summing up the samples 
in the buffer without clearing it first, that is, it relies on the 
auto-silencing doing the clearing, which the patch broke under the given 
circumstances. rather obvious in retrospect.

regards
