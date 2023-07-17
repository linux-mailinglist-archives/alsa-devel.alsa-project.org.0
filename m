Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E83756814
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jul 2023 17:33:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A8E5AE8;
	Mon, 17 Jul 2023 17:33:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A8E5AE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689608038;
	bh=qd/6xtXuVXk+2PzZA6dPg/LkyDXpaZpLY86hMD7oack=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=db6HnBZbwO55OwT7bNb48ilEXjxItCzC3D9KHc7eofRjUWuh+j2K6jgEaZRUPR5xZ
	 yxPxcwGROu+1SLdF6WyKtzevPZbSWqokAfxOn/fJAdYC+v14vhnANbUvK14TAc1sHc
	 FS8MrnfsOUD4bhdJViezsl/byuHY2LTJiQxaUxIM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DBDC8F80494; Mon, 17 Jul 2023 17:33:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5872CF8032D;
	Mon, 17 Jul 2023 17:33:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1C4CAF8047D; Mon, 17 Jul 2023 17:33:02 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 5BBF4F8027B
	for <alsa-devel@alsa-project.org>; Mon, 17 Jul 2023 17:32:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5BBF4F8027B
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 292DD23EE2;
	Mon, 17 Jul 2023 11:32:51 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1qLQDS-jJm-00; Mon, 17 Jul 2023 17:32:50 +0200
Date: Mon, 17 Jul 2023 17:32:50 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH v2 0/8] ALSA: emu10k1: add support for high-bitrate modes
 of E-MU cards
Message-ID: <ZLVfIkljpthcLgnd@ugly>
References: <20230630144542.664190-1-oswald.buddenhagen@gmx.de>
 <87sf9vyfer.wl-tiwai@suse.de>
 <ZK0rw5j5BbyppXZ/@ugly>
 <87mt02wvsa.wl-tiwai@suse.de>
 <ZLUVxVUHtUJvcuZQ@ugly>
 <87ilaiwvgg.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <87ilaiwvgg.wl-tiwai@suse.de>
Message-ID-Hash: KY2NQI3JKCEYODCIGSFM2FVTKWGTTYGR
X-Message-ID-Hash: KY2NQI3JKCEYODCIGSFM2FVTKWGTTYGR
X-MailFrom: ossi@kde.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KY2NQI3JKCEYODCIGSFM2FVTKWGTTYGR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Jul 17, 2023 at 02:53:19PM +0200, Takashi Iwai wrote:
>On Mon, 17 Jul 2023 12:19:49 +0200,
>Oswald Buddenhagen wrote:
>> 
>> you want me to spend additional time
>> on a driver barely anyone still cares about
>> to actively degrade the (my!) user experience
>> to avoid hypothetical / likely obsolete crashes
>> that would happen upon a rare user-controlled event
>> in unspecified buggy (mixer? (!)) applications,
>> while a known-good fallback exists (alsamixer).
>
>Simply put, YES.
>
well, your priorities don't align with the needs of actual users (that 
would be me, in this case).

>If you've ever programmed applications that deal with ALSA
>mixer/control stuff by yourself, you'll notice that it's really tough
>to deal with the dynamic deletion/addition.
>
hot-plugging always requires some care to handle. i don't consider this 
a showstopper, esp. in the year 2023, when udev and pulseaudio/pipewire 
go all crazy on us (and yes, that crashed kmix - big deal). i don't 
think it's sane to set the bar at 1995 standards. even less so when the 
class of potentially affected apps holds no user data of note.

>alsamixer can accept it in the limited manner,
>but it's no fallback for everything, of course.
>
i have no clue what point you're trying to make.

regards
